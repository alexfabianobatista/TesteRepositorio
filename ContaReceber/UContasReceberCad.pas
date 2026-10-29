{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit UContasReceberCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  ImgList, DBCtrls, Grids, DBGrids, ComObj, OracleNavigator, Variants,
  maskUtils, DBDirceu, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, DBPanel,QuickRpt,QRPrntr, QRPDFFilt,
  Printers,SynPdf, PngImage;


type
  TFContasReceberCad = class(TFTCadSimples)
    PgReceber: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEDtVencto: TDBEdit;
    Label11: TLabel;
    DBEDtEmissao: TDBEdit;
    Label13: TLabel;
    DBEValorTitulo: TDBEdit;
    Label14: TLabel;
    DBEValorJuro: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    TabSheet2: TTabSheet;
    DBGReparcelamento: TDBGrid;
    BtFinalidade: TSpeedButton;
    DBRGAceite: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit16: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit15: TDBEdit;
    BtBanco: TSpeedButton;
    BtFilial: TSpeedButton;
    BtCliente: TSpeedButton;
    GroupBox1: TGroupBox;
    Opcao: TMenuItem;
    BaixadoContasReceber1: TMenuItem;
    RelaodeContasReceberpVencimentos1: TMenuItem;
    MovimentoContasReceber1: TMenuItem;
    RelaodeTtulosporCliente1: TMenuItem;
    RelaodeTtulosAbertos1: TMenuItem;
    RelaodeTtulosBaixados1: TMenuItem;
    RelaodeTtulosVencidos1: TMenuItem;
    EmissaodeBloquetoParcial: TMenuItem;
    EmissodeNotaPromissria1: TMenuItem;
    EmissodeDuplicatas1: TMenuItem;
    RelaodeTtulosAbertosSaldos1: TMenuItem;
    Label8: TLabel;
    BtDepartamento: TSpeedButton;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    EmissodeRecibos1: TMenuItem;
    VoltaBaixadeTitulos1: TMenuItem;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    TtulosemAbertoVendedor1: TMenuItem;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    Label16: TLabel;
    DBEdit13: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    BtVendedor: TSpeedButton;
    DBEdit23: TDBEdit;
    Comisso1: TMenuItem;
    RelatrioTtulosRecebidos1: TMenuItem;
    RelatrioTtulosRecebidosBancos1: TMenuItem;
    DBEdit14: TDBEdit;
    N2: TMenuItem;
    OpenDialog1: TOpenDialog;
    RelatrioArquivodeRemessa6411: TMenuItem;
    N3: TMenuItem;
    GerarArquivoSCI1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    EmissoRecibo1: TMenuItem;
    DBEdit24: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    OracleNavigator1: TOracleNavigator;
    Capitalizao1: TMenuItem;
    ResumoPorSiglaBanco1: TMenuItem;
    DBRadioGroup1: TDBRadioGroup;
    EmissaoBloqueto: TMenuItem;
    VoltarStatusregistros1: TMenuItem;
    ResumoCtaReceberDiario1: TMenuItem;
    LiberaBaixa: TMenuItem;
    ReciboComplementarJuro1: TMenuItem;
    Label23: TLabel;
    DBEdit25: TDBEdit;
    BtContaCorrente: TSpeedButton;
    DBEdit26: TDBEdit;
    CartadeCobrana1: TMenuItem;
    Label24: TLabel;
    DBEdit21: TDBEdit;
    SbOrdemCompra: TSpeedButton;
    N9: TMenuItem;
    TtulosporFinalidade1: TMenuItem;
    TtulospDtEmisso1: TMenuItem;
    ReciboComissao1: TMenuItem;
    EmissoCarn1: TMenuItem;
    GeraContrato: TMenuItem;
    DBRGDesconto: TDBRadioGroup;
    N13: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    HistricoContrato1: TMenuItem;
    N14: TMenuItem;
    RelDescontoCheque1: TMenuItem;
    ClculodeDesconto1: TMenuItem;
    CopiadeBloqueto: TMenuItem;
    GeraArquivoSERASA1: TMenuItem;
    TotaldeCRporPerodo1: TMenuItem;
    BoletimdeRegistroSCPC1: TMenuItem;
    ResumoMovContasaReceber1: TMenuItem;
    SpeedButton1: TSpeedButton;
    Autorizaodefatura1: TMenuItem;
    TitAbertosSintticoporDepto1: TMenuItem;
    TsObservacao: TTabSheet;
    DBMemo1: TDBMemo;
    RelatrioMovimentao1: TMenuItem;
    N17: TMenuItem;
    Sicredicnab240v0811: TMenuItem;
    NumBloqEmitidosporBanco1: TMenuItem;
    ZerarComisso1: TMenuItem;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    TabSheet4: TTabSheet;
    Label40: TLabel;
    DBEdit33: TDBEdit;
    Label41: TLabel;
    DBEdit34: TDBEdit;
    SBVendedorPublicar1: TSpeedButton;
    DBDirceu3: TDBDirceu;
    SBVendedorPublicar: TSpeedButton;
    DBDirceu4: TDBDirceu;
    DBEdit35: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit36: TDBEdit;
    RelComissao: TMenuItem;
    BloquetoAgrupadopPeriodo1: TMenuItem;
    tulosAbertosOutrasMoedas1: TMenuItem;
    N18: TMenuItem;
    CalculaVariaoCambial1: TMenuItem;
    ProtocolodeEntregadeDocumentos1: TMenuItem;
    ExportaContas1: TMenuItem;
    ExportarparaSISCOBRA1: TMenuItem;
    SdArquivo: TSaveDialog;
    LanaJurosManual1: TMenuItem;
    N19: TMenuItem;
    PrazoMdio1: TMenuItem;
    ComissoAnalitico1: TMenuItem;
    Label25: TLabel;
    DBEdit27: TDBEdit;
    SbObra: TSpeedButton;
    BtnGerarComissao: TBitBtn;
    PosioMensal1: TMenuItem;
    AcrescentarValoraoTtulo1: TMenuItem;
    ArquivoRemessa1: TMenuItem;
    RetornoRemessa1: TMenuItem;
    DBEdit71: TDBEdit;
    Label74: TLabel;
    DBEdit70: TDBEdit;
    Label73: TLabel;
    DBPanel1: TDBPanel;
    AvisoVencimentoBoletos1: TMenuItem;
    DBRadioGroup4: TDBRadioGroup;
    DBRadioGroup5: TDBRadioGroup;
    tbReparcelamento: TTabSheet;
    DBGrid2: TDBGrid;
    Label26: TLabel;
    DBGrid1: TDBGrid;
    Label36: TLabel;
    tulosBaixadosSaldos1: TMenuItem;
    DBRadioGroup6: TDBRadioGroup;
    btnEnviarApi: TButton;
    btnImprimirApi: TButton;
    ConsultaStatus1: TMenuItem;
    CancelarBoleto1: TMenuItem;
    DBEPercDesc: TDBEdit;
    Label37: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BaixadoContasReceber1Click(Sender: TObject);
    procedure RelaodeContasReceberpVencimentos1Click(Sender: TObject);
    procedure RelaodeTtulosporCliente1Click(Sender: TObject);
    procedure MovimentoContasReceber1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure BtClienteClick(Sender: TObject);
    procedure BtBancoClick(Sender: TObject);
    procedure BtFinalidadeClick(Sender: TObject);
    procedure RelaodeTtulosAbertos1Click(Sender: TObject);
    procedure RelaodeTtulosBaixados1Click(Sender: TObject);
    procedure RelaodeTtulosVencidos1Click(Sender: TObject);
    procedure EmissaodeBloquetoParcialClick(Sender: TObject);
    procedure EmissodeNotaPromissria1Click(Sender: TObject);
    procedure EmissodeDuplicatas1Click(Sender: TObject);
    procedure RelaodeTtulosAbertosSaldos1Click(Sender: TObject);
    procedure BtDepartamentoClick(Sender: TObject);
    procedure EmissodeRecibos1Click(Sender: TObject);
    procedure VoltaBaixadeTitulos1Click(Sender: TObject);
    procedure TtulosemAbertoVendedor1Click(Sender: TObject);
    procedure BtVendedorClick(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure RelatrioTtulosRecebidos1Click(Sender: TObject);
    procedure RelatrioTtulosRecebidosBancos1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure RelatrioArquivodeRemessa6411Click(Sender: TObject);
    procedure GerarArquivoSCI1Click(Sender: TObject);
    procedure EmissoRecibo1Click(Sender: TObject);
    procedure PgReceberChange(Sender: TObject);
    procedure Capitalizao1Click(Sender: TObject);
    procedure ResumoPorSiglaBanco1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EmissaoBloquetoClick(Sender: TObject);
    procedure VoltarStatusregistros1Click(Sender: TObject);
    procedure ResumoCtaReceberDiario1Click(Sender: TObject);
    procedure LiberaBaixaClick(Sender: TObject);
    procedure ReciboComplementarJuro1Click(Sender: TObject);
    procedure BtContaCorrenteClick(Sender: TObject);
    procedure CartadeCobrana1Click(Sender: TObject);
    procedure SbOrdemCompraClick(Sender: TObject);
    procedure TtulosporFinalidade1Click(Sender: TObject);
    procedure TtulospDtEmisso1Click(Sender: TObject);
    procedure ReciboComissao1Click(Sender: TObject);
    procedure RelatoSerasa1Click(Sender: TObject);
    procedure EmissoCarn1Click(Sender: TObject);
    procedure GeraContratoClick(Sender: TObject);
    procedure HistricoContrato1Click(Sender: TObject);
    procedure RelDescontoCheque1Click(Sender: TObject);
    procedure ClculodeDesconto1Click(Sender: TObject);
    procedure CopiadeBloquetoClick(Sender: TObject);
    procedure GeraArquivoSERASA1Click(Sender: TObject);
    procedure TotaldeCRporPerodo1Click(Sender: TObject);
    procedure BoletimdeRegistroSCPC1Click(Sender: TObject);
    procedure ResumoMovContasaReceber1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Autorizaodefatura1Click(Sender: TObject);
    procedure TitAbertosSintticoporDepto1Click(Sender: TObject);
    procedure RelatrioMovimentao1Click(Sender: TObject);
    procedure DBEdit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Sicredicnab240v0811Click(Sender: TObject);
    procedure NumBloqEmitidosporBanco1Click(Sender: TObject);
    procedure ZerarComisso1Click(Sender: TObject);
    procedure SBVendedorPublicarClick(Sender: TObject);
    procedure SBVendedorPublicar1Click(Sender: TObject);
    procedure RelComissaoClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure BloquetoAgrupadopPeriodo1Click(Sender: TObject);
    procedure tulosAbertosOutrasMoedas1Click(Sender: TObject);
    procedure CalculaVariaoCambial1Click(Sender: TObject);
    procedure ProtocolodeEntregadeDocumentos1Click(Sender: TObject);
    procedure ExportaContas1Click(Sender: TObject);
    procedure ExportarparaSISCOBRA1Click(Sender: TObject);
    procedure LanaJurosManual1Click(Sender: TObject);
    procedure PrazoMdio1Click(Sender: TObject);
    procedure ComissoAnalitico1Click(Sender: TObject);
    procedure SbObraClick(Sender: TObject);
    procedure BtnGerarComissaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PosioMensal1Click(Sender: TObject);
    procedure AcrescentarValoraoTtulo1Click(Sender: TObject);
    procedure ArquivoRemessa1Click(Sender: TObject);
    procedure RetornoRemessa1Click(Sender: TObject);

    // Procedimentos de Geração de Arquivo Remessa aos Bancos - Djeison 29/07/2013
    procedure GeraRemessaBB();
    procedure GeraRemessaSicredi();
    procedure GeraRemessaBradesco();
    procedure GeraRemessaUniprime();
    procedure GeraRemessaCresol();
    procedure GeraRemessaSicoob();
    procedure GeraRemessaSicoobBB();
    procedure GeraRemessaItau();
    procedure GeraRemessaHSBC();
    procedure GeraRemessaRural();
    procedure GeraRemessaSantander();
    procedure GeraRemessaCaixa();
    procedure GeraRemessaCaixaSIGCB();
    procedure RetornoRemessaSicredi();
    procedure RetornoRemessaBB();
    procedure RetornoRemessaBBSicoob();
    procedure RetornoRemessaUniprime();
    procedure RetornoRemessaBradesco();
    procedure RetornoRemessaSicoob();
    procedure RetornoRemessaHSBC();
    procedure RetornoRemessaItau();
    procedure RetornoRemessaRural();
    procedure RetornoRemessaSantander();
    procedure RetornoRemessaCaixa();
    procedure RetornoRemessaCaixaSigcb();
    procedure RetornoRemessaCresol();

    // Procedimento de geração de relatório de Retorno de Remessa - Djeison 15/10/2013
    procedure GeraRelatorioRetorno();
    procedure AvisoVencimentoBoletos1Click(Sender: TObject);
    procedure tulosBaixadosSaldos1Click(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure btnEnviarApiClick(Sender: TObject);
    procedure btnImprimirApiClick(Sender: TObject);
    procedure DBEdit25Exit(Sender: TObject);
    procedure ConsultaStatus1Click(Sender: TObject);
    procedure CancelarBoleto1Click(Sender: TObject);
    procedure DBEdit8Exit(Sender: TObject);


  private
    { Private declarations }
    wExportar: Boolean;
    // API BOLETOS PARA SABER O TIPO DE IMPRESSÃO
    sWEnviaBoletoEmail, sWEGeraPdf: Boolean;
    iWCodContaCorrente, iWCodFilial: Integer;
    bEstaConectado: Boolean;

    procedure atualiza_Bloquetos;
    procedure Imprime_Comissao(wVendedor: Integer; wComissao: Real);
    procedure BaixaTituloRetorno(wValor_Juro, wValor_Desconto, wValor_Baixa,
      wPagto_Juro: Real;
      NNumero, mDataLiquidacao, mDataCredito: string);
    procedure AtualizaTituloRetorno(wValor_Juro: Real;
              NNumero, mDataMovimento: string; mComando : Integer);

    procedure BaixaTituloHSBC(S: string); // Banco HSBC
    procedure BaixaTituloRURAL(S: string);
    function RetornoErroSicredi(pOcorrencia, pMotivo: string): string;
    function RetornoErroBanco(wCodMovimento, wRejeicao: string): string;
    function RetornaErroItau(CodErro, Erro: string): string;
    function RetornaErroBradesco(wstrErro: string): string;
    function RetornaErroBBSicoob(wCodOcorrencia, wRejeicao: string): string;
    function RetornaErroSantander(wStrErro: string): string;
    function RetornaErroUnibanco(wStrErro: string): string;
    function RetornaErroCaixaSigcb(wStrErro: string): string;
    procedure ExportarSISCOBRA_novo;
    //procedure EnviaEmailBoletoAvencer(pBoleto: TQuickRep);
    procedure EnviaEmailBoletoAvencer();
    //procedure Seleciona_Banco_Emissao();

    // para api web de boletos
    procedure GeraBoletoApi;
    procedure ImprimeBoletoApi;
    procedure EnviarEmailBoletoApi;
    procedure ExibeBotoesAPI;
    procedure SetaApiWeb;
    procedure ConsultarBoletosAPI;
    procedure CancelarBoletoAPI;

  public
    { Public declarations }
    procedure Monta_SQL_Safra_Bradesco;



  end;

var
  FContasReceberCad: TFContasReceberCad;
  WinWord, Docs, Doc: Variant;
  wNum_Titulo: string;

implementation

uses UContasReceber_cl, UOracle_cl, UContasReceberCons, UContasReceberBaixa,
  UContasReceberParam, URContasReceberClientes, URContasReceber_Vencimentos,
  URContasReceberMov, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UBancosCons, UFinalidadeCons, UFinalidade_cl, UBancoAgencia_cl,
  ULiberaBaixa, URContasReceber_TitulosAbertos,
  URContasReceber_TitulosBaixados, URContasReceber_VencimentosSintetico,
  URContasReceber_TitVenc, UContasReceber_Capitalizacao,
  URBloqueto_BB, URPromissoria, URContasReceber_Duplicatas,
  URContasReceber_Saldos, UDepartamentoCons,
  UDepartamento_cl, UBloqueto, URRecibo, UBiblioteca, URecibos2,
  UContasReceberVoltaBaixa, UParamSistema_cl,
  URContasReceber_Duplicatas_CGS, URContasReceber_Duplicatas_Faville,
  URContasReceber_Tit_Aberto_Vend, URContasReceber_Tit_Vend_Aberto,
  URContasReceber_Duplicatas_Ab, URPromissoria_Branco, UVendedorCons,
  UVendedor_cl, URComissao, URContasReceber_Recebidos,
  URContasReceber_Receb_Bancos, URContasReceber_Tit_Vend_Aberto_1,
  URContasReceber_Duplicatas_GONZATTI,
  UContaCorrenteCons, USequencia_cl,
  UUsuario_cl, UPlanilha_cl, URRemessas_641,
  UCaixa_cl, UCaixaLanc_Cont, Ucontrato_cl, URContrato,
  URContasReceberResumo, UContasReceberVoltaTitEnviado, URContaReceberTotalDia,
  URCartaCobranca, UOrdemCompraCons, UOrdemCompra_cl,
  URContasReceber_Duplicatas_MEDIBENS,
  URContasReceber_Finalidade, URTitulosEmissao, UReciboComissao,
  URCartaCobrancaCiviero, URCartaCobrancaFaville, URBloqueto_Bradesco,
  UObraContratoMovCons, UObraContrato_cl, URHistoricoContrato,
  URRemessasDesconto, URCalculoDesconto, UContasReceber_Rel_cl,
  URTotalCRPeriodo, URResumoMovCReceber, URTituloAberto_Depto_Sint,
  URMovimentacao, URBloquetoSafra, UBancoAgenciaRel_cl, URBloqEmitBanco,
  UPromissoria, URComissaoPublicar, URBoletaBB,
  URTitulosAbertos_OutrasMoedas, UMoeda_cl, URProtocoloEntregaDocumento,
  URRetornoRemessaBB, UCarneImpressao, URComissaoAnalitico, UObraCons,
  UObra_cl, URContasReceberPosicaoMensal, UAguarde,
  URTitulosFinalidadeAnalitico, UFmDatas, URBloqueto_Sicoob,
  URBloqueto_HSBC, URBloqueto_Rural, UFRBloqueto_Itau, URBloqueto_Sicredi,
  URBloqueto_Santander, URBloqueto_Unibanco, URBloqueto_Sudameris,
  URBloqueto_CEF, UFmCidade, UEnviaEmail, URBloqueto_CEF_SIGCB, StrUtils,
  URContasReceberMovDiario, UFiltroRelTitulosAbertos, OracleData, URReciboTermica,
  UBibContasReceber, URTitulosBaixadosSaldos, URComissaoRecebidosClasse,
  // API DE BOLETOS HÍBRIDOS
  BoletoAPI.BoletoFactory,
  BoletoApi.Interfaces,
  // para testar a rede
  Wininet;

{$R *.DFM}

{ Função remove mascara cgc/cpf e acrescenta zeros
 A Função RMASKCGC_CPF, serve tanto para CGC/CPF como para numeros que necessitam
 ser preechidos com zeros inicial para isso informe a string, seguido do tamanho desejado.}

function formatCC(s: string): string;
var
  i: integer;
begin
  result := '';
  for i := 1 to length(s) do
  begin
    if s[i] = '-' then
      break;
    result := result + s[i];
  end;
end;

function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var
  S, Aux: string;
  x, c: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A'..'Z'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  for x := 1 to Zeros do
    Aux := '0' + Aux;
  C := Length(S);
  for x := Zeros downto 1 do
  begin
    Aux[x] := S[C];
    Dec(C, 1);
    if C < 1 then
      Break;
  end;
  S := Aux;

  Result := S;

end;

{ Função converte espacos em branco/ponto/virgula em zeros }

function StrZero(Num: Real; Zeros, Deci: integer): string;
var
  V: string;
  Z: Integer;
begin

  Str(Num: Zeros: Deci, V);
  Trim(V);
  { Convert spaces to zeroes }
  while Pos(' ', V) > 0 do
  begin
    V[Pos(' ', V)] := '0'
  end;

  while (Pos('.', V) > 0) or (Pos(',', V) > 0) do
  begin
    z := Pos('.', V); // Pega posição
    Delete(V, z, 1); // Deleta na posição.
    Insert('0', V, 1); // Inclui 0 na primeira posicao.
  end;
  Result := V;
end;

// -------------------------------------------------------\\
{ Função remove acentos da string passada como parametro}

function RemoveAcento(Texto: string): string;
var
  i: integer;
begin
  // Abaixo a relação de alguns caracteres não suportado por mainframes em especial(BB)
  for i := 1 to length(Texto) do
    case Texto[i] of
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
      '°': Texto[i] := ' ';
      'ª': Texto[i] := ' ';
      #39: Texto[i] := ' ';
    end;

  Result := Texto;

end;

{funçao formata uma string de um valor numerico em uma quantidade de numeros inteiros e decimais}

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

procedure TFContasReceberCad.FormActivate(Sender: TObject);
begin
  inherited;
//Junior da Deion solicitou que este campo não seja bloqueado para facilitar a volta do status enviado ao banco. Alex 11/11/2022
  if (DMParamSistema.CodEmpresa <> 'DEION') then
    DBRadioGroup1.Enabled := false;
  with DMContasReceber do
  begin
    QcontasReceber_Cab.Open;
    QContasReceber_Mov.Open;
  end;
  if DMOracle.BuscaNome('SELECT IND_ACEITE_CR FROM TB_PARAM_SISTEMA',
    'IND_ACEITE_CR IS NOT NULL') = 'S' then
  begin
    DBRGAceite.Visible := True;
    LiberaBaixa.Visible := True;
  end
  else
  begin
    DBRGAceite.Visible := False;
    LiberaBaixa.Visible := False;
  end;
  //---adicionado por Fabio para indicar titulos que foram env. para desc. zadimel 13/12/2004
//  if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ZADIMEL' then comentado por César 22/10/2019
//    DBRGDesconto.Visible := True
//  else
//    DBRGDesconto.Visible := false;
  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ENCOPEL' then
    DBRadioGroup3.Caption := 'Emitido Dupl';
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'KREUZ') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CONCRETA') then
    DBEdit14.Enabled := True;

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'MEDFRIG') then
    PgReceber.Pages[4].TabVisible := true
  else
    PgReceber.Pages[4].TabVisible := false;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' then
    //faz algumas alterações para publicar
  begin //por conta de ter 2 vendedores para cada titulo
    PgReceber.Pages[3].TabVisible := true;
    MMCadSimples.Items[1].Items[16].Enabled := false;
    //desabilita o relatorio de comissão de vendedores
    MMCadSimples.Items[1].Items[16].Visible := false;
    MMCadSimples.Items[1].Items[40].Enabled := true;
    //habilita o relatorio de comissao para publicar
    MMCadSimples.Items[1].Items[40].Visible := true;
    Label18.Visible := false;
    DBEdit18.Visible := false;
    BtVendedor.Visible := false;
    DBEdit23.Visible := false;
    label20.Visible := false;
    DBEdit20.Visible := false;
  end
  else
  begin
    MMCadSimples.Items[1].Items[16].Enabled := true;
    MMCadSimples.Items[1].Items[16].Visible := true;
    MMCadSimples.Items[1].Items[40].Enabled := false;
    MMCadSimples.Items[1].Items[40].Visible := false;
    PgReceber.Pages[3].TabVisible := false;
  end;
  //BtCopia.Visible := false;

  BtnGerarComissao.Visible := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEBONA';

  wExportar := False;
  //BtCopia.Enabled := False;
  //BtCopia.Visible := False;

   // PARA ENVIO DO BOLETO VIA API
   //ExibeBotoesAPI;
end;

procedure TFContasReceberCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo, wCodDoc, wCodCompl, wCodHistorico, wVlrLancto: Real;
  wHistorico_Inclusao, wNumDoc, wTestaNulo, wContaCred, wContaDeb, wGerar,
    wContabiliza_Inclusao: string;
  wDtLancto: TDateTime;
  wFilial, wFilial_Cred: Integer;
begin
  if dmcontasreceber.QContasReceber_CabDT_VENCIMENTO.Text = '' then
  begin
    DBEDtVencto.SetFocus;
    Raise Exception.Create('Informe uma data de vencimento.');
  end;
  if dmcontasreceber.QContasReceber_CabCOD_CADASTRO.Text = '' then
  begin
    DBEdit19.setfocus;
    Raise Exception.Create('Informe um cliente.');
  end;
  if dmcontasreceber.QContasReceber_CabCOD_FINALIDADE.Text = '' then
  begin
    DBEdit2.SetFocus;
    Raise Exception.Create('Informe uma finalidade.');
  end;

  DmUsuario.Checar_Filial_Usuario(DMContasReceber.QContasReceber_CabCOD_FILIAL.Text, 'CONTAS A RECEBER');
  if DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_FINALIDADE',
    'COD_FINALIDADE  = ' +
    FloatToStr(DMContasReceber.QContasReceber_CabCod_Finalidade.Value)) = 'NAO' then
    raise Exception.Create('Finalidade Nao Liberada Para Uso');
  if (DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMContasReceber.QContasReceber_CabDt_Emissao.Value) And
     (PgReceber.ActivePage <> TsObservacao)  then
    raise Exception.Create('Lançamento Não Permitido - Fechamento Contabil');
  wCodHistorico := 0; // Inicializa variavel.
  if DMContasReceber.QContasReceber_Cab.State = dsInsert then
    wGerar := 'Sim'
  else
    wGerar := 'Nao';
  wCodigo := DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
  SetaApiWeb;
  inherited;
  try
  DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise exception.create('Erro! Transação não efetuada');
  end;
  
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceber_Cab.SetVariable('PK', wCodigo);
  DMContasReceber.QContasReceber_Cab.Open;
  if wGerar = 'Sim' then
  begin
    wHistorico_Inclusao :=
      DMOracle.BuscaNome('SELECT COD_HISTORICO_CAIXA_INCLUSAO FROM TB_FINALIDADE',
      'COD_FINALIDADE  = ' +
      FloatToStr(DMContasReceber.QContasReceber_CabCod_Finalidade.Value), True);
    wContabiliza_Inclusao :=
      DMOracle.BuscaNome('SELECT IND_CONTABILIDADE FROM TB_FINALIDADE',
      'COD_FINALIDADE  = ' +
      FloatToStr(DMContasReceber.QContasReceber_CabCod_Finalidade.Value), True);
    if (wHistorico_Inclusao) <> '' then
      if DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Text = '' then
      begin
        DMCaixa.QCaixa_Mov.Open;
        DMCaixa.QCaixa_Mov.Insert;
        DMCaixa.QCaixa_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
        DMCaixa.QCaixa_MovDT_Usuario.Value := DMOracle.DataHoraServ;
        if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
        begin
          DMCaixa.QCaixa_MovCod_Filial.Value := 1;
          DMCaixa.QCaixa_MovCod_Departamento.Value :=
            StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO',
            'COD_USUARIO = ' + FloatToStr(DMUsuario.CodUsuarioCorrente), True));
        end
        else
        begin
          DMCaixa.QCaixa_MovCod_Filial.Value :=
            StrToInt(DMContasReceber.QContasReceber_CabCod_Filial.Text);
          DMCaixa.QCaixa_MovCod_Departamento.Value :=
            StrToInt(DMContasReceber.QContasReceber_CabCod_Departamento.Text);
        end;
        DMCaixa.QCaixa_MovCod_Historico.Value := StrToInt(wHistorico_Inclusao);
        DMcaixa.QCaixa_MovDT_Movimento.value :=
          DMContasReceber.QContasReceber_CabDt_Emissao.Value;
        DMcaixa.QCaixa_MovVal_Movimento.value :=
          DMContasReceber.QContasReceber_CabVal_Titulo.Value;
        DMcaixa.QCaixa_MovNum_Documento.value :=
          DMContasReceber.QContasReceber_CabNum_Titulo.AsInteger;
        DMcaixa.QCaixa_MovCod_Cadastro.value :=
          DMContasReceber.QContasReceber_CabCod_Cadastro.Value;
        DMcaixa.QCaixa_MovCod_Conta_Receber_Cab.value :=
          DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
        DMCaixa.QCaixa_Mov.Post;
        DMCaixa.QCaixa_Mov.Close;
      end
      else
      begin
        DMBancoAgencia.QBancoMovimento.Open;
        DMBancoAgencia.QBancoMovimento.Insert;
        DMBancoAgencia.QBancoMovimentoCod_Usuario.Value :=
          DMUsuario.CodUsuarioCorrente;
        DMBancoAgencia.QBancoMovimentoDT_Usuario.Value :=
          Trunc(DMOracle.DataHoraServ);
        DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value :=
          DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Value;
        DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
          StrToInt(wHistorico_Inclusao);
        DMBancoAgencia.QBancoMovimentoDT_Movimento.value :=
          DMContasReceber.QContasReceber_CabDt_Emissao.Value;
        DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
          DMContasReceber.QContasReceber_CabVal_Titulo.Value;
        DMBancoAgencia.QBancoMovimentoNum_Cheque.value :=
          DMContasReceber.QContasReceber_CabNum_Titulo.AsInteger;
        DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
          DMContasReceber.QContasReceber_CabCod_Cadastro.Value;
        DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
          DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
        DMBancoAgencia.QBancoMovimentoDesc_Observacao.Value :=
          DMContasReceber.QContasReceber_CabDesc_Cliente.Value;
        DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
          DMContasReceber.QContasReceber_CabCod_Departamento.Value;
        DMBancoAgencia.QBancoMovimento.Post;
        DMBancoAgencia.QBancoMovimento.Close;
      end;
    if wContabiliza_Inclusao = 'S' then
    begin
      if DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Text = '' then
        // lancamento por caixa caso contrario por banco
        wContaCred :=
          DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_CRED FROM TB_FINALIDADE',
          'COD_FINALIDADE = ' +
          DMContasReceber.QContasReceber_CabCod_Finalidade.Text,
          True)
      else
        wContaCred :=
          DMOracle.BuscaNome('SELECT COD_CONTABIL_CONTRAPARTIDA FROM TB_BANCO_AGENCIA',
          'COD_BANCO_AGENCIA = ' +
          DMContasReceber.QContasReceber_CabCod_Banco_Agencia.Text, True);
      wContaDeb :=
        DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_DEB FROM TB_FINALIDADE',
        'COD_FINALIDADE = ' +
        DMContasReceber.QContasReceber_CabCod_Finalidade.Text, True);
      if (wContaCred <> '') or
        (wContaDeb <> '') then
      begin
        wCodDoc :=
          DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
        wNumDoc :=
          FloatToStr(DMContasReceber.QContasReceber_CabNum_Titulo.Value);
        wFilial := DMContasReceber.QContasReceber_CabCod_Filial.Value;
        wCodCompl := DMContasReceber.QContasReceber_CabCod_Cadastro.Value;
        wTestaNulo :=
          DMOracle.BuscaNome('SELECT COD_HIST_CONTABIL_INCLUSAO FROM TB_FINALIDADE',
          'COD_FINALIDADE = ' +
          DMContasReceber.QContasReceber_CabCod_Finalidade.Text,
          True);
        if Trim(wTestaNulo) <> '' then
          wCodHistorico := StrToFloat(wTestaNulo);
        wVlrLancto := DMContasReceber.QContasReceber_CabVal_Titulo.Value;
        wDtLancto := DMContasReceber.QContasReceber_CabDt_Emissao.Value;
        if FCaixa_Lanc_Cont = nil then
          FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
        FCaixa_Lanc_Cont.MEContaCredito.text := wContaCred;
        if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
          FCaixa_Lanc_Cont.pFilial := 1
        else
          FCaixa_Lanc_Cont.pFilial := wFilial;
        FCaixa_Lanc_Cont.MEContaDebito.Text := wContaDeb;
        FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
        FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
        FCaixa_Lanc_Cont.Label3.Visible := False;
        FCaixa_Lanc_Cont.Label4.Visible := False;
        FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
        FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
        FCaixa_Lanc_Cont.ShowModal;
        DMOracle.DBCemapa.StartTransaction;
        DMContasReceber.QContasReceber_Mov.Edit;
        wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaCredito.text,
          '.');
        wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MEContaDebito.text, '.');
        wFilial_Cred := wFilial;
        if (DMContasReceber.QContasReceber_CabCod_Conta_Corrente.Text <> '') and
          (DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') then
          wFilial_Cred := 1;
        DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Cred, wContaCred,
          'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto,
          wContaDeb);
        DMContasReceber.QContasReceber_MovCOD_LANCTO_CONTABIL_CRED.Value :=
          DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;

        DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial, wContaDeb,
          'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto,
          wContaCred);
        DMContasReceber.QContasReceber_MovCOD_LANCTO_CONTABIL_DEB.Value :=
          DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;

        DMContasReceber.QContasReceber_Mov.Post;
      end;
    end;

    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end;
  if MELocaliza.CanFocus then
    MELocaliza.SetFocus;
  PgReceber.activePage := TabSheet1;
end;

procedure TFContasReceberCad.SBCancelarClick(Sender: TObject);
var
  wCodigo: Real;
begin
  wCodigo := DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value;
  inherited;
  DMOracle.DBCemapa.RollBack;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceber_Cab.SetVariable('PK', wCodigo);
  DMContasReceber.QContasReceber_Cab.Open;
end;

procedure TFContasReceberCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, Dsedit] then
  begin
    BtnGerarComissao.Enabled := False;
    BtBanco.Enabled := True;
    BtFilial.Enabled := True;
    BtFinalidade.Enabled := True;
    BtCliente.Enabled := True;
    BtDepartamento.Enabled := True;
    BtVendedor.Enabled := True;
    BtContaCorrente.Enabled := True;
    Opcao.Enabled := False;
    SbOrdemCompra.Enabled := True;
    SbObra.Enabled := True;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PUBLICAR' then
    begin
      if PgReceber.Pages[3].TabVisible then
      begin
        SBVendedorPublicar.Enabled := true;
        SBVendedorPublicar1.Enabled := true
      end;
    end;
  end
  else
  begin
    BtnGerarComissao.Enabled := True;
    BtBanco.Enabled := False;
    BtFilial.Enabled := False;
    BtFinalidade.Enabled := False;
    BtCliente.Enabled := False;
    BtDepartamento.Enabled := False;
    BtContaCorrente.Enabled := False;
    BtVendedor.Enabled := False;
    SbOrdemCompra.Enabled := False;
    SbObra.Enabled := False;
    Opcao.Enabled := True;
  end;
  if DSPrimario.State = Dsedit then
  begin
    DBEValorJuro.ReadOnly := True;
    DBEValorTitulo.ReadOnly := True;
    DBEDtEmissao.ReadOnly := True;
  end
  else
  begin
    DBEValorJuro.ReadOnly := False;
    DBEValorTitulo.ReadOnly := False;
    DBEDtEmissao.ReadOnly := False;
  end;

  // PARA ENVIO DO BOLETO VIA API
  ExibeBotoesAPI;
end;

procedure TFContasReceberCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContasReceberCons = nil then
    FContasReceberCons := TFContasReceberCons.Create(Application);
  if FContasReceberCons.ShowModal = mrOK then
  begin
    with DMContasReceber do
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QContasReceber_CabConsCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
    end;
  end;
end;

procedure TFContasReceberCad.BaixadoContasReceber1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberBaixa = nil then
    FContasReceberBaixa := TFContasReceberBaixa.Create(Application);
  FContasReceberBaixa.ShowModal;
end;

procedure TFContasReceberCad.RelaodeContasReceberpVencimentos1Click(
  Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[0].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME0CodFilial.Text,
      'CONTAS A RECEBER');
    if FRContasReceber_Vencimentos = nil then
      FRContasReceber_Vencimentos :=
        TFRContasReceber_Vencimentos.Create(Application);
    with DMContasReceber do
    begin
      QRContasReceber_Vencimentos.Close;
      if Trim(FContasReceberParam.ME0DataInicial.Text) = '' then
        raise
          Exception.Create('Campo Data Vencimento Inicial Deve Ser Informado');
      FRContasReceber_Vencimentos.QRLDataInicial.Caption :=
        DateToStr(StrToDate(FContasReceberParam.ME0DataInicial.Text));
      DataInicial :=
        DateToStr(StrToDate(FContasReceberParam.ME0DataInicial.Text));
      QRContasReceber_Vencimentos.SetVariable('DT_VENC_INICIAL',
        FContasReceberParam.ME0DataInicial.Text);

      if Trim(FContasReceberParam.ME0DataFinal.Text) = '' then
        raise
          Exception.Create('Campo Data Vencimento Inicial Deve Ser Informado');
      FRContasReceber_Vencimentos.QRLDataFinal.Caption :=
        DateToStr(StrToDate(FContasReceberParam.ME0DataFinal.Text));
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME0DataFinal.Text));
      QRContasReceber_Vencimentos.SetVariable('DT_VENC_FINAL',
        FContasReceberParam.ME0DataFinal.Text);

      if Trim(FContasReceberParam.ME0CodFilial.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('FILIAL',
          FContasReceberParam.ME0CodFilial.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.ME0CodFinalidade.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('FINALIDADE',
          FContasReceberParam.ME0CodFinalidade.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('FINALIDADE', Null);

      if Trim(FContasReceberParam.ME0CodCliente.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('CADASTRO',
          FContasReceberParam.ME0CodCliente.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('CADASTRO', Null);

      if Trim(FContasReceberParam.ME0CodBanco.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('BANCO',
          FContasReceberParam.ME0CodBanco.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('BANCO', Null);

      if Trim(FContasReceberParam.ME0Serie.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('DESC_TIPO_DOCUMENTO',
          FContasReceberParam.ME0Serie.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      if Trim(FContasReceberParam.ME0CodDepto.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME0CodDepto.Text)
      else
        QRContasReceber_Vencimentos.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FContasReceberParam.ME0DtEmissaoInicial.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_INICIAL',
          Trim(FContasReceberParam.ME0DtEmissaoInicial.Text))
      else
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_INICIAL', Null);
      if Trim(FContasReceberParam.ME0DtEmissaoFinal.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_FINAL',
          Trim(FContasReceberParam.ME0DtEmissaoFinal.Text))
      else
        QRContasReceber_Vencimentos.SetVariable('DT_EMISSAO_FINAL', Null);

      //FILTRO DO VEICULO....
      if Trim(FContasReceberParam.Me0Placa.Text) <> '' then
        QRContasReceber_Vencimentos.SetVariable('PLACA', Trim(FContasReceberParam.Me0Placa.Text))
      else
        QRContasReceber_Vencimentos.SetVariable('PLACA', Null);

      QRContasReceber_Vencimentos.SetVariable('DT_BASE',
        FContasReceberParam.ME0DtBase.Text);
      DMContasReceber.pDataBase :=
        StrToDate(FContasReceberParam.ME0DtBase.Text);
      {
      if FContasReceberParam.CB0NossoNumero.Checked = true then    //Adicionado a pedido dad Zapoli. Para pesquisar somente títulos que tenham o NOSSO NUMERO. Vanessa 10-04-2014
        QRContasReceber_Vencimentos.SetVariable('NOSSO_NUMERO', 1)
      else
        QRContasReceber_Vencimentos.SetVariable('NOSSO_NUMERO', null); //
        A Deion precisa que esse relatório traga apenas duplicatas, segundo o Junior
        as duplicatas possui Série 1 e COD_NOSSO_NUMERO nulo.
        Gian 21/05/2018.
      }
      case FContasReceberParam.RG0NossoNumero.ItemIndex of
        1: QRContasReceber_Vencimentos.SetVariable('NOSSO_NUMERO', 'AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NOT NULL');
        2: QRContasReceber_Vencimentos.SetVariable('NOSSO_NUMERO', 'AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NULL');
        else QRContasReceber_Vencimentos.SetVariable('NOSSO_NUMERO', 'AND 1=1');
      end;

      QRContasReceber_Vencimentos.Open;
    end;

    if FContasReceberParam.RGTipo.ItemIndex = 0 then // Analítico
    begin
      if FRContasReceber_Vencimentos = nil then
        FRContasReceber_Vencimentos :=
          TFRContasReceber_Vencimentos.Create(Application);
      if FContasReceberParam.ME0Departamento.Text = '' then
        FRContasReceber_Vencimentos.QRLDepartamento.Caption := 'Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: Todos'
      else
        FRContasReceber_Vencimentos.QRLDepartamento.Caption := 'Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: ' +
          FContasReceberParam.ME0Departamento.Text;
      FRContasReceber_Vencimentos.QRLReferencia.Caption :=
        Trim(FContasReceberParam.ME0DtBase.Text);
      FRContasReceber_Vencimentos.QRLPeriodoEmissao.Caption := 'Emissão: ' +
        FContasReceberParam.ME0DtEmissaoInicial.Text + ' Até ' +
        FContasReceberParam.ME0DtEmissaoFinal.Text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Vencimentos.QRPrimario.Preview
      else
        FRContasReceber_Vencimentos.QRPrimario.Print;
    end
    else
    begin
      if FRContasReceber_VencimentosSintetico = nil then
        FRContasReceber_VencimentosSintetico :=
          TFRContasReceber_VencimentosSintetico.Create(Application);
      FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption := 'PERIODO DE : '
        + DataInicial + ' ATÉ : ' + DataFinal;
      FRContasReceber_VencimentosSintetico.QRLPeriodoEmissao.Caption :=
        'Emissão: ' + FContasReceberParam.ME0DtEmissaoInicial.Text + ' Até ' +
        FContasReceberParam.ME0DtEmissaoFinal.Text;
      if FContasReceberParam.ME0Departamento.Text = '' then
        FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption :=
          FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption + ' Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: Todos'
      else
        FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption :=
          FRContasReceber_VencimentosSintetico.QRLPeriodo.Caption + ' Filial:' +
          Trim(FContasReceberParam.ME0Filial.Text) + ' Dep.: ' +
          FContasReceberParam.ME0Departamento.Text;
      FRContasReceber_VencimentosSintetico.QRLReferencia.Caption :=
        Trim(FContasReceberParam.ME0DtBase.Text);
      if Trim(FContasReceberParam.Me0Placa.Text) <> '' then
        FRContasReceber_VencimentosSintetico.QRLPlaca.Caption := FContasReceberParam.Me0Placa.Text
      else
        FRContasReceber_VencimentosSintetico.QRLPlaca.Caption := '';

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_VencimentosSintetico.QRPrimario.Preview
      else
        FRContasReceber_VencimentosSintetico.QRPrimario.Print;
    end;
    DMContasReceber.QRContasReceber_Vencimentos.Close;
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosporCliente1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[1].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME1CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin

       //CRIADA CONSULTA NO DMContasReceber_Cab para evitar necessidade de alterar
         // parâmetros de inserção ao alterar relatório   -  CLEBER - 05/03/2020

      QRContasReceber_Cab.Close;
      QRContasReceber_Mov.Close;
      QRContasReceber_Produtos.Close;
      {
      QRContasReceber_Cab.Sql.Clear;
      QRContasReceber_Cab.Sql.ADD('SELECT TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB,TB_CONTA_RECEBER_CAB.COD_FINALIDADE,TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.COD_FILIAL,TB_CONTA_RECEBER_CAB.NUM_TITULO,TB_CONTA_RECEBER_CAB.NUM_PARCELA,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO,TB_CONTA_RECEBER_CAB.DT_BAIXA,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DT_VENCIMENTO,TB_CONTA_RECEBER_CAB.DT_EMISSAO,TB_CONTA_RECEBER_CAB.DT_CAPITALIZACAO,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DT_CAPITALIZACAO_MOEDA,TB_CONTA_RECEBER_CAB.VAL_TITULO,TB_CONTA_RECEBER_CAB.COD_NOTA_CAB,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.DESC_OBSERVACAO,TB_CONTA_RECEBER_CAB.IND_ACEITE,TB_CONTA_RECEBER_CAB.IND_SITUACAO,');
      QRContasReceber_Cab.Sql.ADD('TB_CONTA_RECEBER_CAB.VAL_ORIGINAL,TB_CONTA_RECEBER_CAB.VAL_JUROS,TB_CADASTRO.NOME,TB_CADASTRO.DESC_ENDERECO,TB_CADASTRO.NUM_CGC_CPF,');
      QRContasReceber_Cab.Sql.ADD('TB_CADASTRO.COD_CADASTRO,TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_BAIRRO,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,');
      QRContasReceber_Cab.Sql.ADD('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_JURO_MORA,TB_FINALIDADE.NUM_DIAS_CARENCIA FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_FINALIDADE,TB_CLASS_CADASTRO,');
      QRContasReceber_Cab.Sql.ADD('TB_NOTA_CAB, TB_OBRA, TB_OBRA_CONTRATO WHERE ');
      QRContasReceber_Cab.Sql.ADD('(TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO) ');
      QRContasReceber_Cab.Sql.ADD(' AND (TB_CONTA_RECEBER_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE) ');
      QRContasReceber_Cab.Sql.ADD(' AND (TB_CADASTRO.COD_CLASS_CADASTRO = TB_CLASS_CADASTRO.COD_CLASS_CADASTRO) ');
      QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB(+) ');
      QRContasReceber_Cab.Sql.ADD(' AND TB_CONTA_RECEBER_CAB.COD_OBRA_CONTRATO = TB_OBRA_CONTRATO.COD_OBRA_CONTRATO(+) ');
      QRContasReceber_Cab.Sql.ADD(' AND TB_OBRA_CONTRATO.COD_OBRA = TB_OBRA.COD_OBRA(+) ');
      }
      if Trim(FContasReceberParam.ME1CodFilial.Text) <> '' then
        QRContasReceber_Cab.SetVariable('COD_FILIAL', Trim(FContasReceberParam.ME1CodFilial.Text))
      else
        QRContasReceber_Cab.SetVariable('COD_FILIAL', null);
      if Trim(FContasReceberParam.ME1Codigo.Text) <> '' then
        QRContasReceber_Cab.SetVariable('COD_CADASTRO', Trim(FContasReceberParam.ME1Codigo.Text))
      else
        QRContasReceber_Cab.SetVariable('COD_CADASTRO', null);
      if Trim(FContasReceberParam.ME1CodDepto.Text) <> '' then
        QRContasReceber_Cab.SetVariable('COD_DEPARTAMENTO', Trim(FContasReceberParam.ME1CodDepto.Text))
      else
        QRContasReceber_Cab.SetVariable('COD_DEPARTAMENTO', null);
      if Trim(FContasReceberParam.ME1Finalidade.Text) <> '' then
        QRContasReceber_Cab.SetVariable('COD_FINALIDADE', Trim(FContasReceberParam.Me1Finalidade.Text))
      else
        QRContasReceber_Cab.SetVariable('COD_FINALIDADE', null);
      if Trim(FContasReceberParam.FmVendedor2.MeVendedor.Text) <> '' then
        QRContasReceber_Cab.SetVariable('COD_VENDEDOR', Trim(FContasReceberParam.FmVendedor2.MeVendedor.Text))
      else
        QRContasReceber_Cab.SetVariable('COD_VENDEDOR', null);
      if Trim(FContasReceberParam.Me1TipoDocumento.Text) <> '' then
        QRContasReceber_Cab.SetVariable('TIPO_DOCUMENTO', Trim(FContasReceberParam.Me1TipoDocumento.Text))
      else
        QRContasReceber_Cab.SetVariable('TIPO_DOCUMENTO', null);
      if Trim(FContasReceberParam.ME1CGCCPF.Text) <> '' then
        QRContasReceber_Cab.SetVariable('NUM_CGC_CPF', Trim(FContasReceberParam.ME1CGCCPF.Text))
      else
        QRContasReceber_Cab.SetVariable('NUM_CGC_CPF', null);

      //obra
      if Trim(FContasReceberParam.FmObra2.MeObra.Text) <> '' then
        QRContasReceber_Cab.SetVariable('COD_OBRA', Trim(FContasReceberParam.FmObra2.MeObra.Text))
      else
        QRContasReceber_Cab.SetVariable('COD_OBRA', null);

      //Junior - 07-05-2013
      if FContasReceberParam.RGSituacao.ItemIndex <> 2 then
        if FContasReceberParam.RGSituacao.ItemIndex = 0 then
          // os que estão em aberto
          QRContasReceber_Cab.SetVariable('IND_SITUACAO', 'ABERTO')
        else // os que estão baixados Total Ou baixados parcial
          QRContasReceber_Cab.SetVariable('IND_SITUACAO', 'BAIXA TOTAL')
      else
         QRContasReceber_Cab.SetVariable('IND_SITUACAO', null);

      if Trim(FContasReceberParam.ME1Inicial.text) <> '' then
         QRContasReceber_Cab.SetVariable('DT_VENCIMENTO_INI',  Trim(FContasReceberParam.ME1Inicial.text))
      else
        QRContasReceber_Cab.SetVariable('DT_VENCIMENTO_INI', null);
      if Trim(FContasReceberParam.ME1Final.Text) <> '' then
         QRContasReceber_Cab.SetVariable('DT_VENCIMENTO_FIM',  Trim(FContasReceberParam.ME1Final.text))
      else
        QRContasReceber_Cab.SetVariable('DT_VENCIMENTO_FIM', null);
      if Trim(FContasReceberParam.Me1DtBaixa_Inic.Text) <> '' then
        QRContasReceber_Cab.SetVariable('DT_BAIXA_INI', Trim(FContasReceberParam.Me1DtBaixa_Inic.text))
      else
       QRContasReceber_Cab.SetVariable('DT_BAIXA_INI', null);
      if Trim(FContasReceberParam.Me1DtBaixa_Fim.Text) <> '' then
        QRContasReceber_Cab.SetVariable('DT_BAIXA_INI', Trim(FContasReceberParam.Me1DtBaixa_Fim.text))
      else
       QRContasReceber_Cab.SetVariable('DT_BAIXA_INI', null);

      case FContasReceberParam.Rg1Ordem.ItemIndex of
        0:
          QRContasReceber_Cab.SetVariable('ORDENACAO', 'TB_CONTA_RECEBER_CAB.COD_CADASTRO,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        1:
          QRContasReceber_Cab.SetVariable('ORDENACAO', 'TB_CONTA_RECEBER_CAB.COD_CADASTRO,TB_CONTA_RECEBER_CAB.DT_EMISSAO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        2:
          QRContasReceber_Cab.SetVariable('ORDENACAO', 'TB_CONTA_RECEBER_CAB.COD_CADASTRO,TB_CONTA_RECEBER_CAB.NUM_TITULO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        3:
          QRContasReceber_Cab.SetVariable('ORDENACAO', 'TB_CADASTRO.NOME,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        4:
          QRContasReceber_Cab.SetVariable('ORDENACAO', 'TB_CADASTRO.NOME,TB_CONTA_RECEBER_CAB.DT_EMISSAO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
        5:
          QRContasReceber_Cab.SetVariable('ORDENACAO', 'TB_CADASTRO.NOME,TB_CONTA_RECEBER_CAB.NUM_TITULO,TB_CONTA_RECEBER_CAB.DT_MOVIMENTO');
      end;
      if Trim(FContasReceberParam.ME1DtReferencia.Text) = '' then
        raise Exception.Create('Preencher Data Referencia de Juros');
      DMContasReceber.pDataReferencia :=
        StrToDate(FContasReceberParam.ME1DtReferencia.Text);

      QRContasReceber_Cab.Open;
      QRContasReceber_Mov.Open;
      QRContasReceber_Produtos.Open;

    end;
    if FRContasReceber_Clientes = nil then
      FRContasReceber_Clientes := TFRContasReceber_Clientes.Create(Application);
    FRContasReceber_Clientes.QRLPeriodo.Caption := 'PERÍODO DE : ' +
      FContasReceberParam.ME1Inicial.text + ' ATÉ : ' +
      FContasReceberParam.ME1Final.text;
    if FContasReceberParam.ME1Departamento.Text = '' then
      FRContasReceber_Clientes.QRLDepartamento.Caption := 'Dt.Referência:' +
        FContasReceberParam.ME1DtReferencia.Text + ' - Filial:' +
        Trim(FContasReceberParam.ME1Filial.Text) + ' - Departamento: Todos'
    else
      FRContasReceber_Clientes.QRLDepartamento.Caption := 'Dt.Referência:' +
        FContasReceberParam.ME1DtReferencia.Text + ' - Filial:' +
        Trim(FContasReceberParam.ME1Filial.Text) + ' - Departamento: ' +
        Trim(FContasReceberParam.ME1Departamento.Text);
    if Trim(FContasReceberParam.FmVendedor2.MeVendedor.Text) <> '' then
      FRContasReceber_Clientes.QRLVendedor.Caption := 'VENDEDOR: ' +
      Trim(FContasReceberParam.FmVendedor2.MeVendedor.Text) + ' ' +
      DMOracle.FastSelect('NOME','TB_VENDEDOR','COD_VENDEDOR = ' +
      Trim(FContasReceberParam.FmVendedor2.MeVendedor.Text))
    else
      FRContasReceber_Clientes.QRLVendedor.Caption := '';

    if Trim(FContasReceberParam.FmObra2.MeObra.Text) <> '' then
      FRContasReceber_Clientes.QRLObra.Caption := 'Obra: ' +
      Trim(FContasReceberParam.FmObra2.MeObra.Text) + ' ' +
      DMOracle.FastSelect('DESC_OBRA','TB_OBRA','COD_OBRA = ' +
      Trim(FContasReceberParam.FmObra2.MeObra.Text))
    else
      FRContasReceber_Clientes.QRLObra.Caption := '';

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'VETRO' then
    begin
      FRContasReceber_Clientes.QRChildBand1.Enabled := True;
    end;
      
    //Se for RUDI, aumenta o tamanho da banda e acresceta campos de endereço, bairro e telefone
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RUDI' then
    begin

      //aumentar banda
      FRContasReceber_Clientes.QRGroup1.Height := 57;
      //endereco
      FRContasReceber_Clientes.QRLabel24.Enabled   := True;
      FRContasReceber_Clientes.QRDBText22.Enabled := True;
      FRContasReceber_Clientes.QRLabel24.Top := 16;
      FRContasReceber_Clientes.QRDBText22.Top := 16;
      //bairro
      FRContasReceber_Clientes.QRLabel26.Enabled := True;
      FRContasReceber_Clientes.QRDBText23.Enabled := True;
      FRContasReceber_Clientes.QRLabel26.Top := 16;
      FRContasReceber_Clientes.QRDBText23.Top := 16;
      //telefone
      FRContasReceber_Clientes.QRLabel25.Enabled := True;
      FRContasReceber_Clientes.QRDBText24.Enabled := True;
      FRContasReceber_Clientes.QRLabel25.Top := 16;
      FRContasReceber_Clientes.QRDBText24.Top := 16;

      //Coloca para baixo labels da banda de baixo
      FRContasReceber_Clientes.QRLabel3.Top := 40;
      FRContasReceber_Clientes.QRLabel4.Top := 40;
      FRContasReceber_Clientes.QRLabel13.Top := 40;
      FRContasReceber_Clientes.QRLabel20.Top := 40;
      FRContasReceber_Clientes.QRLabel19.Top := 40;
      FRContasReceber_Clientes.QRLabel14.Top := 40;
      FRContasReceber_Clientes.QRLabel11.Top := 40;
      FRContasReceber_Clientes.QRLabel12.Top := 40;
      FRContasReceber_Clientes.QRLabel21.Top := 40;

    end;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_Clientes.QRPrimario.Preview
    else
      FRContasReceber_Clientes.QRPrimario.Print;

  end;
    DMContasReceber.QRContasReceber_Cab.Close;
    DMContasReceber.QRContasReceber_Mov.Close;
    DMContasReceber.QRContasReceber_Produtos.Close;
end;

procedure TFContasReceberCad.MovimentoContasReceber1Click(Sender: TObject);
var
  DataInicial, DataFinal, wTipoMovimento, wFormaPagamento: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[2].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME2CodFilial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME2Inicial.text) = '') or
      (Trim(FContasReceberParam.ME2Final.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber do
    begin
      QRCReceber_Mov.Close;
      if Trim(FContasReceberParam.ME2CodCliente.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_CADASTRO',FContasReceberParam.ME2CodCliente.Text)
      else
        QRCReceber_Mov.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME2CodDepto.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_DEPARTAMENTO',FContasReceberParam.ME2CodDepto.Text)
      else
        QRCReceber_Mov.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME2CodFilial.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_FILIAL',FContasReceberParam.ME2CodFilial.Text)
      else
        QRCReceber_Mov.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME2CodVendedor.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_VENDEDOR',FContasReceberParam.ME2CodVendedor.Text)
      else
        QRCReceber_Mov.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME2CC.Text) <> '' then
        QRCReceber_Mov.SetVariable('CC', FContasReceberParam.ME2CC.Text)
      else
        QRCReceber_Mov.SetVariable('CC', Null);

      if Trim(FContasReceberParam.ME2Finalidade.Text) <> '' then
        QRCReceber_Mov.SetVariable('COD_FINALIDADE',trim(FContasReceberParam.ME2Finalidade.Text))
      else
        QRCReceber_Mov.SetVariable('COD_FINALIDADE', Null);
      if Trim(FContasReceberParam.ME2TipoDocumento.Text) <> '' then
        QRCReceber_Mov.SetVariable('DESC_TIPO_DOCUMENTO',Trim(FContasReceberParam.ME2TipoDocumento.Text))
      else
        QRCReceber_Mov.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      QRCReceber_Mov.SetVariable('INICIAL',
        FContasReceberParam.ME2Inicial.Text);
      QRCReceber_Mov.SetVariable('FINAL', FContasReceberParam.ME2Final.Text);

      // vai concatenar todos os tipos de movimento que o usuario escolher nos parametros - César 14/11/2016
      wTipoMovimento := '';
      If FContasReceberParam.Cb2Principal.Checked Then
        wTipoMovimento := QuotedStr('PRINCIPAL');
      If FContasReceberParam.Cb2Baixa.Checked Then
        If wTipoMovimento = '' Then
           wTipoMovimento := QuotedStr('RECEBTO. PRINCIPAL')
        Else
           wTipoMovimento := wTipoMovimento + ','+QuotedStr('RECEBTO. PRINCIPAL');
      If FContasReceberParam.Cb2Desconto.Checked Then
        If wTipoMovimento = '' Then
           wTipoMovimento := QuotedStr('DESC. CONCEDIDO')
        Else
           wTipoMovimento := wTipoMovimento + ','+QuotedStr('DESC. CONCEDIDO');
      If FContasReceberParam.Cb2Juros.Checked Then
        If wTipoMovimento = '' Then
           wTipoMovimento := QuotedStr('JUROS')
        Else
           wTipoMovimento := wTipoMovimento + ','+QuotedStr('JUROS');
      If FContasReceberParam.Cb2PagtoJuros.Checked Then
        If wTipoMovimento = '' Then
           wTipoMovimento := QuotedStr('RECEBTO. JUROS')
        Else
           wTipoMovimento := wTipoMovimento + ','+QuotedStr('RECEBTO. JUROS');
      If wTipoMovimento = '' Then
         QRCReceber_Mov.SetVariable('IND_TIPO_MOVIMENTO', '1=1')
      Else
         QRCReceber_Mov.SetVariable('IND_TIPO_MOVIMENTO', 'TB_CONTA_RECEBER_MOV.IND_TIPO_MOVIMENTO IN ('+wTipoMOvimento + ')');

      case FContasReceberParam.RG2FormaPagamento.ItemIndex of
        0: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Bancos (');
        2: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Contábil');
        3: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Cartão C');
        4: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Cartão D');
        5: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Adiantam');
        6: QRCReceber_Mov.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;

      case FContasReceberParam.RG2Protestado.ItemIndex of
        0: QRCReceber_Mov.SetVariable('IND_PROTESTADO', 'SIM');
        1: QRCReceber_Mov.SetVariable('IND_PROTESTADO', 'NAO');
        2: QRCReceber_Mov.SetVariable('IND_PROTESTADO', Null);
      end;

      QRCReceber_Mov.SQL[QRCReceber_Mov.SQL.Count - 1] := '';
      if FContasReceberParam.RG2Tipo.ItemIndex = 1 then
        QRCReceber_Mov.Sql.Add('ORDER BY TB_CONTA_RECEBER_MOV.DT_MOVIMENTO')
      else

      if fcontasreceberparam.Rg2TotalPor.ItemIndex = 0 then
        case FContasReceberParam.RG2Ordem.ItemIndex of
          0: QRCReceber_Mov.Sql.Add('ORDER BY TB_VENDEDOR.NOME,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
          1: QRCReceber_Mov.Sql.Add('ORDER BY TB_VENDEDOR.NOME,TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          2: QRCReceber_Mov.Sql.Add('ORDER BY TB_VENDEDOR.NOME,TB_CADASTRO.NOME');
          3: QRCReceber_Mov.Sql.Add('ORDER BY TB_VENDEDOR.NOME,TB_CONTA_RECEBER_CAB.NUM_TITULO');
          4: QRCReceber_Mov.Sql.Add('ORDER BY TB_CONTA_RECEBER_MOV.DT_MOVIMENTO');
        end
      else
        case FContasReceberParam.RG2Ordem.ItemIndex of
          0: QRCReceber_Mov.Sql.Add('ORDER BY Tb_conta_RECEBER_mov.DT_MOVIMENTO, TB_VENDEDOR.NOME,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
          1: QRCReceber_Mov.Sql.Add('ORDER BY Tb_conta_RECEBER_mov.DT_MOVIMENTO, TB_VENDEDOR.NOME,TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          2: QRCReceber_Mov.Sql.Add('ORDER BY Tb_conta_RECEBER_mov.DT_MOVIMENTO, TB_VENDEDOR.NOME,TB_CADASTRO.NOME');
          3: QRCReceber_Mov.Sql.Add('ORDER BY Tb_conta_RECEBER_mov.DT_MOVIMENTO, TB_VENDEDOR.NOME,TB_CONTA_RECEBER_CAB.NUM_TITULO');
          4: QRCReceber_Mov.Sql.Add('ORDER BY Tb_conta_RECEBER_mov.DT_MOVIMENTO, TB_CONTA_RECEBER_MOV.DT_MOVIMENTO');
        end;

      QRCReceber_MovTot.Close;
      if Trim(FContasReceberParam.ME2CodCliente.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME2CodCliente.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME2CodFilial.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_FILIAL',
          FContasReceberParam.ME2CodFilial.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME2TipoDocumento.Text) <> '' then
        QRCReceber_MovTot.SetVariable('DESC_TIPO_DOCUMENTO',Trim(FContasReceberParam.ME2TipoDocumento.Text))
      else
        QRCReceber_MovTot.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      QRCReceber_MovTot.SetVariable('INICIAL',
        FContasReceberParam.ME2Inicial.Text);
      DataInicial := DateToStr(StrToDate(FContasReceberParam.ME2Inicial.Text));

      QRCReceber_MovTot.SetVariable('FINAL', FContasReceberParam.ME2Final.Text);
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME2Final.Text));
      if Trim(FContasReceberParam.ME2CodDepto.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME2CodDepto.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_DEPARTAMENTO', Null);
      if Trim(FContasReceberParam.ME2CodVendedor.Text) <> '' then
        QRCReceber_MovTot.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME2CodVendedor.Text)
      else
        QRCReceber_MovTot.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME2CC.Text) <> '' then
        QRCReceber_Mov.SetVariable('CC', FContasReceberParam.ME2CC.Text)
      else
        QRCReceber_Mov.SetVariable('CC', Null);

      If wTipoMovimento = '' Then
         QRCReceber_MovTot.SetVariable('IND_TIPO_MOVIMENTO', '1=1')
      Else
         QRCReceber_MovTot.SetVariable('IND_TIPO_MOVIMENTO', 'TB_CONTA_RECEBER_MOV.IND_TIPO_MOVIMENTO IN ('+wTipoMOvimento + ')');

      case FContasReceberParam.RG2FormaPagamento.ItemIndex of
        0: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Bancos (');
        2: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Contábil');
        3: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Cartão C');
        4: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Cartão D');
        5: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Adiantam');
        6: QRCReceber_MovTot.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;

      case FContasReceberParam.RG2Protestado.ItemIndex of
        0: QRCReceber_MovTot.SetVariable('IND_PROTESTADO', 'SIM');
        1: QRCReceber_MovTot.SetVariable('IND_PROTESTADO', 'NAO');
        2: QRCReceber_MovTot.SetVariable('IND_PROTESTADO', Null);
      end;

      QRCReceber_Mov.Open;
      QRCReceber_MovTot.Open;
    end;
    if FContasReceberParam.RG2Tipo.ItemIndex = 0 then
    begin
      If FRContasReceberMov = nil then
         FRContasReceberMov := TFRContasReceberMov.Create(Application);
      FRContasReceberMov.QRPeriodo.Caption := ' Periodo de ' + DataInicial + ' Até  ' + DataFinal;
      FRContasReceberMov.QRLCC.Caption := 'Conta Corrente: ' + FContasReceberParam.Ed2CC.Text;
      wFormaPagamento := FContasReceberParam.Rg2FormaPagamento.Items.Strings[
          FContasReceberParam.Rg2FormaPagamento.ItemIndex];
      FRContasReceberMov.QRLFormaPagamento.Caption := 'Forma de Pagamento: ' + wFormaPagamento;
      If DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'ZADIMEL' then
       begin
        FRContasReceberMov.QRBand3.Enabled := False;
        FRContasReceberMov.QRBand5.Enabled := True;
       end
      else
       begin
        FRContasReceberMov.QRBand3.Enabled := True;
        FRContasReceberMov.QRBand5.Enabled := False;
       end;
      DMContasReceber.pNrPagina := StrToInt(Trim(FContasReceberParam.Me2NrPagina.Text));
      FRContasReceberMov.wPagina := StrToInt(Trim(FContasReceberParam.Me2NrPagina.Text));
      If FContasReceberParam.Rg2TotalPor.ItemIndex = 0 Then
       Begin
         FRContasReceberMov.QRLVendedor_Data.Caption := 'Vendedor';
         FRContasReceberMov.QRDBCod_Vendedor.DataField := 'Cod_Vendedor';
         FRContasReceberMov.QRDBVendedor.DataField := 'Vendedor';
         FRContasReceberMov.QrGroup2.Expression := 'QRCReceber_mov.COD_VENDEDOR';
       End
      else
       Begin
         FRContasReceberMov.QRLVendedor_Data.Caption := 'Data Baixa';
         FRContasReceberMov.QRDBCod_Vendedor.DataField := '';
         FRContasReceberMov.QRDBVendedor.DataField := 'Dt_Movimento';
         FRContasReceberMov.QrGroup2.Expression := 'QRCReceber_mov.DT_MOVIMENTO';
       End;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberMov.QRPrimario.Preview
      else
        FRContasReceberMov.QRPrimario.Print;
    end
    else
    begin
      If FRContasReceberMovDiario = nil then
         FRContasReceberMovDiario := TFRContasReceberMovDiario.Create(Application);
      FRContasReceberMovDiario.QRPeriodo.Caption := ' Periodo de ' + DataInicial + ' Até  ' + DataFinal;
      wFormaPagamento := FContasReceberParam.Rg2FormaPagamento.Items.Strings[
          FContasReceberParam.Rg2FormaPagamento.ItemIndex];
      FRContasReceberMovDiario.QRLFormaPagamento.Caption := 'Forma de Pagamento: ' + wFormaPagamento;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberMovDiario.QRPrimario.Preview
      else
        FRContasReceberMovDiario.QRPrimario.Print;
    end;
    DMContasReceber.QRCReceber_MovTot.Close;
    DMContasReceber.QRCReceber_Mov.Close;
  end;
end;

procedure TFContasReceberCad.SBExcluirClick(Sender: TObject);
begin
  {inherited;}
  if (DMParamSistema.CodEmpresa = 'RETIFOZ') and   //bloqueia a exclusão de reparcelamentos
     (DMContasReceber.QContasReceber_CabDESC_TIPO_DOCUMENTO.Value = 'Rep') then
    raise Exception.Create('Não é possível excluir um registro de REPARCELAMENTO');    

  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >=
             DMContasReceber.QContasReceber_CabDt_Emissao.Value then
    raise
      Exception.Create('Não é Permitido Baixar Este Título - Fechamento Contabil');
  if DMContasReceber.QContasReceber_CabInd_Situacao.Value <> 'ABERTO' then
    raise Exception.Create('Não é Possível Excluir um Titulo Com Baixas');

  if (DMContasReceber.QContasReceber_CabIND_ENVIADO_BANCO.Value = 'SIM') then
    raise Exception.Create('Não é Possível Excluir um Titulo Com Status Enviado ao Banco');

  if not (DMContasReceber.QContasReceber_CabCod_Nota_Cab.IsNull) Or
     not (DMContasReceber.QContasReceber_CabNUM_OS.IsNull)       Or
     not (DMContasReceber.QContasReceber_CabCod_Obra.IsNull)     Then
    // Não Permite Excluir um Título  Gerado pela Nota
    raise Exception.Create('Não é possível excluir um registro gerado por uma Nota ou Contrato')
  else
  begin
    if DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value > 0 then
    begin
      if
        MessageDlg('A Exclusão deste Registro irá desfazer todos os movimentos contábeis, '
        + #13 + 'Assim como os Movimentos do contas à Receber. Confirma?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOracle.DBCemapa.StartTransaction; // Termina a transação no AfterDelete
        try
          DMContasReceber.ExcluiMovimentos(DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value);
          DMContasReceber.QContasReceber_Cab.Delete;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.RollBack;
          raise; // exception.create('Erro! Transação não efetuada');
        end;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Filial.Value :=
        DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContasReceberCad.BtClienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContasReceberCad.BtBancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Banco_Agencia.Value :=
        DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value;
end;

procedure TFContasReceberCad.BtFinalidadeClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    with DMContasReceber do
      QContasReceber_CabCod_Finalidade.Value :=
        DMFinalidade.QFinalidadeConsCod_Finalidade.Value;
end;

procedure TFContasReceberCad.RelaodeTtulosAbertos1Click(Sender: TObject);
var
  wSql, wRegistrosSelecionados: string;
begin
  inherited;
  if FContasReceberParam = nil then
     FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[4].TabVisible := True;
  FContasReceberParam.CB4SituacaoVendedor.ItemIndex := 0;

  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.Fm4Filial.MeFilial.Text,'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitulosAberto.Close;
      QRContasReceber_TitulosAberto.SQL.Clear;
      wsql :=
        ('SELECT TB_CADASTRO.NOME,TB_VENDEDOR.NOME AS NOME_VENDEDOR,TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CELULAR,TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB');
      wSql := wsql +
        (',TB_CADASTRO.desc_endereco,TB_CADASTRO.COD_CIDADE,TB_CADASTRO.desc_cidade,TB_CADASTRO.desc_cep,TB_CADASTRO.cod_estado,TB_CADASTRO.num_cgc_cpf,TB_CADASTRO.NUM_INSCRICAO,TB_CADASTRO.DT_NASCIMENTO,TB_CADASTRO.DESC_BAIRRO');
      wSql := wsql +
        (',TB_CADASTRO.DESC_FONE_EMPRESA,Tb_conta_RECEBER_cab.COD_FILIAL,Tb_conta_RECEBER_cab.COD_FINALIDADE,Tb_conta_RECEBER_cab.COD_BANCO_AGENCIA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_CADASTRO,Tb_conta_RECEBER_cab.COD_VENDEDOR,Tb_conta_RECEBER_cab.NUM_TITULO,Tb_conta_RECEBER_cab.NUM_PARCELA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_TIPO_DOCUMENTO, Tb_conta_RECEBER_cab.DT_MOVIMENTO,Tb_conta_RECEBER_cab.DT_BAIXA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_VENCIMENTO,Tb_conta_RECEBER_cab.DT_EMISSAO, Tb_conta_RECEBER_cab.DT_CAPITALIZACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_CAPITALIZACAO_MOEDA,Tb_conta_RECEBER_cab.VAL_TITULO AS VALT_TITULO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_NOTA_CAB,Tb_conta_RECEBER_cab.DESC_OBSERVACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.IND_ACEITE,Tb_conta_RECEBER_cab.IND_SITUACAO,Tb_conta_RECEBER_cab.VAL_JUROS');
      wsql := wsql +
        (',Tb_filial.DESC_ENDERECO AS DESC_ENDERECO_FILIAL, Tb_filial.NUM_CGC AS DESC_CNPJ_FILIAL');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.VAL_ORIGINAL,Tb_filial.DESC_FILIAL,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA');
      wsql := wsql +
        (',TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_JURO_MORA,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_AVALISTA1,TB_FINALIDADE.NUM_DIAS_CARENCIA, ''S'' IND_SELECIONADO ');
      wsql := wsql +
        (' FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_VENDEDOR,TB_FILIAL,TB_FINALIDADE,TB_CLASS_CADASTRO ');
      wsql := wsql +
        ('WHERE Tb_conta_RECEBER_cab.COD_FILIAL = Tb_filial.COD_FILIAL ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO ');
      wsql := wsql +
        (' AND Tb_cadastro.COD_CLASS_CADASTRO = Tb_class_cadastro.COD_CLASS_CADASTRO(+)');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_FINALIDADE = Tb_finalidade.COD_FINALIDADE ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) ');
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
        wsql := wsql + (' AND (Tb_conta_RECEBER_cab.IND_SITUACAO <> ' + chr(39)
          +
          'BAIXA TOTAL' + chr(39) + ')')
      else
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RETIFOZ') OR (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MEDFRIG') then
        wsql := wsql + (' AND Tb_conta_RECEBER_cab.IND_SITUACAO <> ' + chr(39)
          +
          'REPARCELAR' + chr(39) + ' AND Tb_conta_RECEBER_cab.IND_SITUACAO <> '  + chr(39)
          +
          'BAIXA TOTAL' + chr(39))
      else
      begin
        wsql := wsql + (' AND ((Tb_conta_RECEBER_cab.IND_SITUACAO <> ' + chr(39)
          +
          'BAIXA TOTAL' + chr(39) + ')');
        if Trim(FContasReceberParam.ME4DtRefEmissao.Text) <> '' then
        begin
          wsql := wsql + ' Or (Tb_conta_RECEBER_cab.DT_BAIXA > ' + chr(39) +
            FContasReceberParam.ME4DtRefEmissao.Text + chr(39) + ')';
          wsql := wsql + ' OR  (Tb_conta_RECEBER_cab.DT_BAIXA IS NULL))';
        end;
      end;
      if Trim(FContasReceberParam.Fm4Cadastro.MeCadastro.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CADASTRO = ' +
          Trim(FContasReceberParam.Fm4Cadastro.MeCadastro.Text));
      //-------------Nutrivet solicitou o filtro de cidade. Junior - 26/02/2014
      if Trim(FContasReceberParam.Fm4Cidade.MeCidade.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_CIDADE = ' +
          Trim(FContasReceberParam.Fm4Cidade.MeCidade.Text));
      //----------------------------------------------------------
      if Trim(FContasReceberParam.Fm4Filial.MeFilial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.Fm4Filial.MeFilial.Text));
      if Trim(FContasReceberParam.Fm4Regiao.MeRegiao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_REGIAO = ' +
          Trim(FContasReceberParam.Fm4Regiao.MeRegiao.Text));
      if Trim(FContasReceberParam.Fm4Estado.MeEstado.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_ESTADO = ' +
          QuoteDStr(Trim(FContasReceberParam.Fm4Estado.MeEstado.Text)));
      if Trim(FContasReceberParam.Fm4Vendedor.MeVendedor.Text) <> '' then
        //if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'QUERENCIA' then
          wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.Fm4Vendedor.MeVendedor.Text))
        else
          wsql := wsql + (' AND TB_CADASTRO.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.Fm4Vendedor.MeVendedor.Text));
      if Trim(FContasReceberParam.Fm4Banco.MeBanco.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.Fm4Banco.MeBanco.Text));
      if Trim(FContasReceberParam.ME4CodFinalidade.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE In (' +
          Trim(FContasReceberParam.ME4CodFinalidade.Text) + ')');
      {Ferragem Medianeira(Dani) pediu filtro de apenas alguns contas a receber no relatório. Autorizado Marcos. - junior 12/03/2019}
      if Trim(FContasReceberParam.Me4CodTitulo.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB In (' +
          Trim(FContasReceberParam.Me4CodTitulo.Text) + ')');
      if Trim(FContasReceberParam.ME4DescDocumento.Text) <> '' then
        wsql := wsql + (' AND upper(TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO) = ' +
          chr(39) + Trim(FContasReceberParam.ME4DescDocumento.Text) + chr(39));
      if Trim(FContasReceberParam.Fm4Departamento.MeDepartamento.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = ' +
          Trim(FContasReceberParam.Fm4Departamento.MeDepartamento.Text));
      wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) +
        FContasReceberParam.ME4DtRefEmissao.Text + chr(39));
  // Alterado para considerar Dt. Vencimento ou Dt. Emissão
      if Trim(FContasReceberParam.ME4Inicial.Text) <> '' then
         if FContasReceberParam.CBDtEmissao.Checked = False then
            wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39) + FContasReceberParam.ME4Inicial.Text + chr(39))
         Else
            wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO >= ' + chr(39) + FContasReceberParam.ME4Inicial.Text + chr(39));
      if Trim(FContasReceberParam.ME4final.Text) <> '' then
         if FContasReceberParam.CBDtEmissao.Checked = False then
            wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39) + FContasReceberParam.ME4Final.Text + chr(39))
         Else
            wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) + FContasReceberParam.ME4Final.Text + chr(39));
      if Trim(FContasReceberParam.ME4ContaNao1.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao1.Text));
      if Trim(FContasReceberParam.ME4ContaNao2.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao2.Text));
      if Trim(FContasReceberParam.ME4ContaNao3.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao3.Text));
      if Trim(FContasReceberParam.ME4ContaNao4.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao4.Text));
      if Trim(FContasReceberParam.ME4ContaNao5.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao5.Text));
      if Trim(FContasReceberParam.ME4ContaNao6.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao6.Text));
      if Trim(FContasReceberParam.ME4ContaNao7.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao7.Text));
      if Trim(FContasReceberParam.ME4ContaNao8.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao8.Text));
      if Trim(FContasReceberParam.ME4ContaNao9.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao9.Text));
      if Trim(FContasReceberParam.ME4ContaNao10.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao10.Text));
      if Trim(FContasReceberParam.Me4Classificacao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_CLASS_CADASTRO = ' +
          Trim(FContasReceberParam.Me4Classificacao.Text));
      if Trim(FContasReceberParam.Me4ContratoVenda.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' +
          Trim(FContasReceberParam.Me4ContratoVenda.Text));
      if FContasReceberParam.Rg4Notas.ItemIndex = 0 then
        // SOMENTE LISTAR TITULOS QUE FORAM EMITIDOS POR NOTA FISCAL
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDFRIG') then //incluido marcos 18/01/2021
        Begin
          wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB IN( SELECT COD_NOTA_CAB FROM TB_NOTA_CAB,TB_OPERACAO  ' +
          ' WHERE IND_CONDICAO_PAGTO = 2 AND IND_ENTRADA_SAIDA = ''S'' AND TB_NOTA_CAB.COD_OPERACAO = TB_OPERACAO.COD_OPERACAO' +
          ' AND (TB_OPERACAO.IND_VENDAS =''V'' OR TB_OPERACAO.IND_SERVICO = ''S'') AND IND_EMITE = ''F'')');
        end
        Else
          wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB > 0 ');

      case FContasReceberParam.CB4SituacaoVendedor.ItemIndex of
        1: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) + 'ATIVO'
            + Chr(39));
        2: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) +
            'INATIVO' + Chr(39));
      end;
      case FContasReceberParam.RG4Boleto.ItemIndex of
        0: wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NOT NULL');
        1: wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NULL');
        2: wsql := wsql;
      end;
      case FContasReceberParam.RG4EnviadoBanco.ItemIndex of
        0: wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.IND_ENVIADO_BANCO = '+ Chr(39) + 'SIM' + Chr(39));
        1: wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.IND_ENVIADO_BANCO = '+ Chr(39) + 'NAO' + Chr(39));
        2: wsql := wsql;
      end;

      if (FContasReceberParam.Me4ValorMin.Text <> '') and (FContasReceberParam.Me4ValorMax.Text <> '') then
      begin
        wSql := wSql + (' AND TB_CONTA_RECEBER_CAB.VAL_ORIGINAL >= ' + FContasReceberParam.Me4ValorMin.Text);
        wSql := wSql + (' AND TB_CONTA_RECEBER_CAB.VAL_ORIGINAL <= ' + FContasReceberParam.Me4ValorMax.Text);
      end;
      case FContasReceberParam.RG4Reparcelado.ItemIndex of
        0: wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO = '+ Chr(39) + 'Rep' + Chr(39));
        1: wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO <> '+ Chr(39) + 'Rep' + Chr(39));
        2: wsql := wsql;
      end; 
      
      QRContasReceber_TitulosAberto.SQL.Add(wSql);
      if wExportar then
      begin
        QRContasReceber_TitulosAberto.SQL.Add(' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO, Tb_conta_RECEBER_cab.NUM_TITULO, TB_CONTA_RECEBER_CAB.DT_EMISSAO');
      end
      else
      begin
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
        begin
          case FContasReceberParam.RG4Ordem.ItemIndex of
            0: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            1: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY   Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            2: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
            3: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY   Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
          end;
        end;
        //--Alterado para filtrar o relatorio só por filial e dt_vencimento. Vanessa 18/12/2013
        if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZAPOLI' then
        begin
          case FContasReceberParam.RG4Ordem.ItemIndex of
            0: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            1: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            2: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
            3: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
            4: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
          end;
        //--
        end
        else
        begin
          case FContasReceberParam.RG4Ordem.ItemIndex of
            0: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            1: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
            2: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
            3: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
            4: QRContasReceber_TitulosAberto.SQL.Add
              (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.DT_VENCIMENTO');
          end;
        end;
      end;

      if (DMParamSistema.CodEmpresa = 'FERRAGMED') or
         (DMParamSistema.CodEmpresa = 'DONABENTA') then
      begin
        if FFiltroRelTitulosAbertos = nil then
          FFiltroRelTitulosAbertos := TFFiltroRelTitulosAbertos.Create(Application);
        FFiltroRelTitulosAbertos.CDSFiltroRelatorio.Close;
        FFiltroRelTitulosAbertos.CDSFiltroRelatorio.Open;
        if FFiltroRelTitulosAbertos.ShowModal = mrOk then
        begin
          wRegistrosSelecionados := '';
          FFiltroRelTitulosAbertos.CDSFiltroRelatorio.First;
          while not FFiltroRelTitulosAbertos.CDSFiltroRelatorio.Eof do
          begin
            if FFiltroRelTitulosAbertos.CDSFiltroRelatorioIND_SELECIONADO.Value = 'S' then
              wRegistrosSelecionados := wRegistrosSelecionados + FFiltroRelTitulosAbertos.CDSFiltroRelatorioCOD_CONTA_RECEBER_CAB.Text + ',';
            FFiltroRelTitulosAbertos.CDSFiltroRelatorio.Next;
          end;
          if wRegistrosSelecionados <> '' then
          begin
            wRegistrosSelecionados := LeftStr(wRegistrosSelecionados, Length(wRegistrosSelecionados) - 1);
            wSql := QRContasReceber_TitulosAberto.SQL[QRContasReceber_TitulosAberto.SQL.Count - 1];
            QRContasReceber_TitulosAberto.SQL.Delete(QRContasReceber_TitulosAberto.SQL.Count - 1);
            QRContasReceber_TitulosAberto.SQL.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB IN ('+
              wRegistrosSelecionados+')');
            QRContasReceber_TitulosAberto.SQL.Add(wSql);
          end;
        end
        else
          Abort;
      end;

      DMContasReceber.pDataBase := StrToDate(FContasReceberParam.ME4DtRefEmissao.Text);
      DMContasReceber.pDataReferencia := StrToDate(FContasReceberParam.ME4DtReferencia.Text);
      QRContasReceber_TitulosAberto.Open;
    end;
    if FRContasReceber_TitulosAberto = nil then
      FRContasReceber_TitulosAberto := TFRContasReceber_TitulosAberto.Create(Application);
    FRContasReceber_TitulosAberto.QRLPeriodo.Caption := 'PERIODO DE : ' +
      FContasReceberParam.ME4Inicial.Text + ' ATÉ : ' +
      FContasReceberParam.ME4Final.Text + ' Finalidade:' +
      FContasReceberParam.ME4CodFinalidade.Text;
    FRContasReceber_TitulosAberto.QRLDepartamento.Caption := 'Filial:' + Trim(FContasReceberParam.Fm4Filial.EdFilial.Text) +
      '  Dt.Referencia:' + FContasReceberParam.ME4DtReferencia.Text;
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CEIFAGRIL' then
       FRContasReceber_TitulosAberto.QRLOutros.Caption := 'Cnpj:'+DMContasReceber.QRContasReceber_TitulosAbertoDESC_CNPJ_FILIAL.Text +
                ' - ' + DMContasReceber.QRContasReceber_TitulosAbertoDESC_ENDERECO_FILIAL.Text
    Else
     Begin
       if FContasReceberParam.Fm4Departamento.MeDepartamento.Text = '' then
          FRContasReceber_TitulosAberto.QRLOutros.Caption := 'Departamento: Todos'
       else
          FRContasReceber_TitulosAberto.QRLOutros.Caption := 'Departamento: ' +
             FContasReceberParam.Fm4Departamento.MeDepartamento.Text;
     End;
    //Nutrivet solicitou o filtro por cidade. Para auxiliar na visualização, criei o Label QRLCidade no cabeçalho do relatório.
    //Junior - 26/02/2014
    if FContasReceberParam.Fm4Cidade.MeCidade.Text = '' then
      FRContasReceber_TitulosAberto.QRLCidade.Caption := 'Cidade: Todos'
    else
      FRContasReceber_TitulosAberto.QRLCidade.Caption := 'Cidade: ' + FContasReceberParam.Fm4Cidade.EdCidade.Text;

    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES' then
    begin
      FRContasReceber_TitulosAberto.QRLabel21.Caption := 'Dt. Baixa';
      FRContasReceber_TitulosAberto.QRDBText9.DataField := 'Dt_Baixa';
      FRContasReceber_TitulosAberto.QRDBText9.Mask := '';
      FRContasReceber_TitulosAberto.QRExpr4.Enabled := False;
      FRContasReceber_TitulosAberto.QRExpr5.Enabled := False;
      FRContasReceber_TitulosAberto.QRExpr6.Enabled := False;
    end;
    //Não aparecer o Rodapé par Zito Auto Peças. Junior - 19/02/2016
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZITO' then
    begin
      FRContasReceber_TitulosAberto.QRBand2.Enabled := False;
    end;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') and
      (Trim(FContasReceberParam.Fm4Cadastro.MeCadastro.Text) <> '') then
    begin
      with DMContrato do
      begin
        QRContrato.Close;
        if Trim(FContasReceberParam.Fm4Filial.MeFilial.Text) <> '' then
          QRContrato.SetVariable('COD_FILIAL',
            FContasReceberParam.Fm4Filial.MeFilial.Text)
        else
          QRContrato.SetVariable('COD_FILIAL', Null);
        QRContrato.SetVariable('COD_PRODUTO', Null);
        QRContrato.SetVariable('COD_CADASTRO',
          FContasReceberParam.Fm4Cadastro.MeCadastro.Text);
        QRContrato.SetVariable('COD_VENDEDOR', Null);
        QRContrato.SetVariable('DT_INICIAL', Null);
        QRContrato.SetVariable('DT_FINAL', Null);
        QRContrato.SetVariable('DT_ANO_SAFRA', Null);
        QRContrato.SetVariable('IND_TIPO_SAFRA', Null);
        QRContrato.SetVariable('IND_SITUACAO', 'ABERTO');
        QRContrato.Open;
        if FRContrato = nil then
          FRContrato := TFRContrato.Create(Application);
        FRContrato.QrlTitulo.Caption := 'Relacao de Contratos Compra e Venda - ';
        FRContasReceber_TitulosAberto.QRCompositeReport1.Reports.Add(FRContasReceber_TitulosAberto.QRPrimario);
        FRContasReceber_TitulosAberto.QRCompositeReport1.Reports.Add(FRContrato.QRPrimario);

        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_TitulosAberto.QRCompositeReport1.Preview
        else
          FRContasReceber_TitulosAberto.QRCompositeReport1.Print;
        QRContrato.Close;
      end;
    end
    else
    begin
      {if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RUDI') or
        (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE') then
        FRContasReceber_TitulosAberto.QrGroup2.Height := 58
      else
        FRContasReceber_TitulosAberto.QrGroup2.Height := 19;  }
        //COMENTADO MARCOS 14/08/2012 PARA PARA O FORM DO RELATORIO

      //--------------Aumenta a Banda Detail para a zadimel p/ Aparecer o avalista do Titulo
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RUDI') then
      begin
        FRContasReceber_TitulosAberto.QrBand3.Height := 43;
        FRContasReceber_TitulosAberto.QRLabel8.Enabled := true;
        FRContasReceber_TitulosAberto.QRDBText2.Enabled := true;
      end
      else
      begin
        FRContasReceber_TitulosAberto.QrBand3.Height := 19;
        FRContasReceber_TitulosAberto.QRLabel8.Enabled := false;
        FRContasReceber_TitulosAberto.QRDBText2.Enabled := false;
      end;

      if wExportar then
      begin
        ExportarSISCOBRA_novo;
      end
      else
      begin
        DMContasReceber.pNrPagina := StrToInt(Trim(FContasReceberParam.Me4NrPagina.Text));
        FRContasReceber_TitulosAberto.wPagina := StrToInt(Trim(FContasReceberParam.Me4NrPagina.Text));

        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_TitulosAberto.QRPrimario.Preview
        else
          FRContasReceber_TitulosAberto.QRPrimario.Print;
      end;
    end;
    DMContasReceber.QRContasReceber_TitulosAberto.Close;
  end;
  
end;

procedure TFContasReceberCad.RelaodeTtulosBaixados1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[3].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME3CodFilial.Text,
      'CONTAS A RECEBER');
    If FRContasReceber_TitulosBaixados = nil then
       FRContasReceber_TitulosBaixados := TFRContasReceber_TitulosBaixados.Create(Application);

    with DMContasReceber do
    begin
      QRContasReceber_TitulosBaixados.Close;
      if Trim(FContasReceberParam.ME3CodCliente.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_CADASTRO',FContasReceberParam.ME3CodCliente.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_CADASTRO', Null);
      if Trim(FContasReceberParam.ME3CodFilial.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_FILIAL',FContasReceberParam.ME3CodFilial.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.Fm3Classificacao.MeClassificacao.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_CLASS_CADASTRO',Trim(FContasReceberParam.Fm3Classificacao.MeClassificacao.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_CLASS_CADASTRO',Null);
        
      if Trim(FContasReceberParam.ME3Departamento.Text) = 'VÁRIOS' then
      begin
        QRContasReceber_TitulosBaixados.SetVariable('COD_DEPARTAMENTO',null);
        QRContasReceber_TitulosBaixados.SetVariable('DEPARTAMENTOS', 'TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasReceberParam.ME3CodDepto.Text) + ')')
      end
      else
      begin
        QRContasReceber_TitulosBaixados.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasReceberParam.ME3CodDepto.Text) <> '' then
          QRContasReceber_TitulosBaixados.SetVariable('COD_DEPARTAMENTO', Trim(FContasReceberParam.ME3CodDepto.Text));
      end;

      if Trim(FContasReceberParam.ME3CodVendedor.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_VENDEDOR', 'TB_CONTA_RECEBER_CAB.COD_VENDEDOR IN (' + Trim(FContasReceberParam.ME3CodVendedor.Text) + ')')
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_VENDEDOR', '1=1');

      if Trim(FContasReceberParam.ME3Finalidade.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('FINALIDADE',FContasReceberParam.ME3Finalidade.Text)
      else
        QRContasReceber_TitulosBaixados.SetVariable('FINALIDADE', Null);

      if Trim(FContasReceberParam.ME3Banco.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_BANCO_AGENCIA',trim(FContasReceberParam.ME3Banco.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_BANCO_AGENCIA', Null);
      if Trim(FContasReceberParam.Fm3Contrato.MeContrato.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('COD_CONTRATO',trim(FContasReceberParam.Fm3Contrato.MeContrato.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_CONTRATO', Null);
      if Trim(FContasReceberParam.Me3TipoDocumento.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('DESC_TIPO_DOCUMENTO',trim(FContasReceberParam.Me3TipoDocumento.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      if (trim(FContasReceberParam.fmregiao3.MeRegiao.Text) <> '' ) then
        QRContasReceber_TitulosBaixados.SetVariable('COD_REGIAO', trim(FContasReceberParam.FmRegiao3.MeRegiao.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('COD_REGIAO', null);  

      if FContasReceberParam.RG3ComBoleto.ItemIndex = 0 then
        QRContasReceber_TitulosBaixados.SetVariable('NOSSO_NUMERO', 'TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NOT NULL');
      if FContasReceberParam.RG3ComBoleto.ItemIndex = 1 then
        QRContasReceber_TitulosBaixados.SetVariable('NOSSO_NUMERO', 'TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NULL');
      if FContasReceberParam.RG3ComBoleto.ItemIndex = 2 then
        QRContasReceber_TitulosBaixados.SetVariable('NOSSO_NUMERO', '1=1');

      if Trim(FContasReceberParam.ME3Inicial.text) = '' then
        raise Exception.Create('Campo Data Pagamento Inicial Deve Ser Informado');
      QRContasReceber_TitulosBaixados.SetVariable('DT_INICIAL',
        FContasReceberParam.ME3Inicial.Text);
      DataInicial := DateToStr(StrToDate(FContasReceberParam.ME3Inicial.Text));

      if Trim(FContasReceberParam.ME3Final.Text) = '' then
        raise Exception.Create('Campo Data Pagamento Final Deve Ser Informado');

      QRContasReceber_TitulosBaixados.SetVariable('DT_FINAL',
        FContasReceberParam.ME3Final.Text + ' 23:59:59');
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME3Final.Text));
      pDataInicial := StrToDate(FContasReceberParam.ME3Inicial.Text);
      pDataFinal := StrToDate(FContasReceberParam.ME3Final.Text);
      QRContasReceber_TitulosBaixados.SQL[QRContasReceber_TitulosBaixados.SQL.Count - 1] := '';
      if FContasReceberParam.RG3Ordem.ItemIndex = 0 then
       Begin
        FRContasReceber_TitulosBaixados.QRLDescricao_Group.Caption := 'Cliente:';
        FRContasReceber_TitulosBaixados.QRDBQuebra.Datafield:= 'NOME';
        FRContasReceber_TitulosBaixados.QRDBQuebra.Left := 106;
        QRContasReceber_TitulosBaixados.SQL.Add('TB_CADASTRO.NOME');
       End
      else
       Begin
        FRContasReceber_TitulosBaixados.QRLDescricao_Group.Caption := 'Data Da Baixa:';
        FRContasReceber_TitulosBaixados.QRDBQuebra.Datafield := 'DT_BAIXA';
        FRContasReceber_TitulosBaixados.QRDBQuebra.Left := 162;
        QRContasReceber_TitulosBaixados.SQL.Add('TB_CONTA_RECEBER_CAB.DT_BAIXA');
       end;
      if Trim(FContasReceberParam.ME3DtVencimentoInicial.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('DT_VENCIMENTO_INICIAL',
          Trim(FContasReceberParam.ME3DtVencimentoInicial.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('DT_VENCIMENTO_INICIAL', Null);
      if Trim(FContasReceberParam.ME3DtVencimentoFinal.Text) <> '' then
        QRContasReceber_TitulosBaixados.SetVariable('DT_VENCIMENTO_FINAL',
          Trim(FContasReceberParam.ME3DtVencimentoFinal.Text))
      else
        QRContasReceber_TitulosBaixados.SetVariable('DT_VENCIMENTO_FINAL', Null);
     
      QRContasReceber_TitulosBaixados.Open;

    end;
    if FContasReceberParam.RG3tipo.ItemIndex = 0 then
      FRContasReceber_TitulosBaixados.QrBand3.Enabled := True
    else
      FRContasReceber_TitulosBaixados.QrBand3.Enabled := False;

    FRContasReceber_TitulosBaixados.QRLFinalidade.Caption := 'Finalidade: ' +
      FContasReceberParam.Ed3Finalidade.Text;
    FRContasReceber_TitulosBaixados.QRLFilial.Caption := 'Filial:' +
      Trim(FContasReceberParam.Me3CodFilial.Text) + ' - ' +
      Trim(FContasReceberParam.Me3Filial.Text);
    FRContasReceber_TitulosBaixados.QRLPeriodo.Caption := 'PERIODO DE : ' +
      DataInicial + ' ATÉ : ' + DataFinal;
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CEIFAGRIL' then
       FRContasReceber_TitulosBaixados.QRLContrato.Caption := 'Cnpj:'+DMContasReceber.QRContasReceber_TitulosBaixadosDESC_CNPJ_FILIAL.Text +
            ' - ' + DMContasReceber.QRContasReceber_TitulosBaixadosDESC_ENDERECO_FILIAL.Text
    Else
     Begin
       if Trim(FContasReceberParam.Fm3Contrato.EdContrato.Text) <> '' then
         FRContasReceber_TitulosBaixados.QRLContrato.Caption := 'Contrato: ' + Trim(FContasReceberParam.Fm3Contrato.EdContrato.Text)
       else if Trim(FContasReceberParam.Fm3Contrato.MeContrato.Text) <> '' then
         FRContasReceber_TitulosBaixados.QRLContrato.Caption := 'Contrato: ' + Trim(FContasReceberParam.Fm3Contrato.MeContrato.Text)
       else
         FRContasReceber_TitulosBaixados.QRLContrato.Caption := '';
     End;
    if FContasReceberParam.ME3Departamento.Text = '' then
      FRContasReceber_TitulosBaixados.QRLPeriodo.Caption :=
        FRContasReceber_TitulosBaixados.QRLPeriodo.Caption + ' Departamento: Todos'
    else
      FRContasReceber_TitulosBaixados.QRLPeriodo.Caption :=
        FRContasReceber_TitulosBaixados.QRLPeriodo.Caption + ' Departamento: ' + FContasReceberParam.ME3Departamento.Text;
    DMContasReceber.pNrPagina := StrToInt(Trim(FContasReceberParam.Me3NrPagina.Text));
    FRContasReceber_TitulosBaixados.wPagina := StrToInt(Trim(FContasReceberParam.Me3NrPagina.Text));
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_TitulosBaixados.QRPrimario.Preview
    else
      FRContasReceber_TitulosBaixados.QRPrimario.Print;

    DMContasReceber.QRContasReceber_TitulosBaixados.Close;
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosVencidos1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[5].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME5CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitVenc.Close;
      if Trim(FContasReceberParam.ME5CodRegiao.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('REGIAO',
          FContasReceberParam.ME5CodRegiao.Text)
      else
        QRContasReceber_TitVenc.SetVariable('REGIAO', Null);

      if Trim(FContasReceberParam.ME5CodDepto.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME5CodDepto.Text)
      else
        QRContasReceber_TitVenc.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME5TipoDocumento.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('DESC_TIPO_DOCUMENTO',
          FContasReceberParam.ME5TipoDocumento.Text)
      else
        QRContasReceber_TitVenc.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      if Trim(FContasReceberParam.ME5CodCliente.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('CADASTRO',
          FContasReceberParam.ME5CodCliente.Text)
      else
        QRContasReceber_TitVenc.SetVariable('CADASTRO', Null);
      if Trim(FContasReceberParam.Me5ClassCadastro.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('COD_CLASS_CADASTRO',
          FContasReceberParam.Me5ClassCadastro.Text)
      else
        QRContasReceber_TitVenc.SetVariable('COD_CLASS_CADASTRO', Null);
      if Trim(FContasReceberParam.ME5CodFilial.Text) <> '' then
        QRContasReceber_TitVenc.SetVariable('FILIAL',
          FContasReceberParam.ME5CodFilial.Text)
      else
        QRContasReceber_Titvenc.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.ME5DataInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRContasReceber_Titvenc.SetVariable('DATA_INICIAL',
        FContasReceberParam.ME5DataInicial.Text);
      DataInicial :=
        DateToStr(StrToDate(FContasReceberParam.ME5DataInicial.Text));

      if Trim(FContasReceberParam.ME5DataFinal.Text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      QRContasReceber_TitVenc.SetVariable('DATA_FINAL',
        FContasReceberParam.ME5DataFinal.Text);
      DataFinal := DateToStr(StrToDate(FContasReceberParam.ME5DataFinal.Text));
      QRContasReceber_TitVenc.SQL[QRContasReceber_TitVenc.SQL.Count - 1] := '';
      case FContasReceberParam.RGOrdem.ItemIndex of
        0: DMContasReceber.QRContasReceber_TitVenc.SQL.Add('ORDER BY NOME');
        1:
          DMContasReceber.QRContasReceber_TitVenc.SQL.Add('ORDER BY TB_CADASTRO.COD_CADASTRO');
      end;
      QRContasReceber_TitVenc.Open;
    end;
    if FRContasReceber_TitVenc = nil then
      FRContasReceber_TitVenc := TFRContasReceber_TitVenc.Create(Application);
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES' then
    begin
      FRContasReceber_TitVenc.QRLabel7.Caption := 'Numero';
      FRContasReceber_TitVenc.QRDBText4.Datafield := 'numero';
      FRContasReceber_TitVenc.QRDBText4.Mask := '';
    end
    else
      FRContasReceber_TitVenc.QRLabel8.Caption := '';
    FRContasReceber_TitVenc.QRLPeriodo.Caption := 'Filial:' +
      FContasReceberParam.Me5Filial.Text + ' PERIODO DE : ' + DataInicial +
      ' ATÉ : ' + DataFinal;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_TitVenc.QRPrimario.Preview
    else
      FRContasReceber_TitVenc.QRPrimario.Print;

    DMContasReceber.QRContasReceber_TitVenc.Close;
  end;
end;

procedure TFContasReceberCad.EmissaodeBloquetoParcialClick(Sender: TObject);
var
  mVerify: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[6].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME6CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if FContasReceberParam.Rg6Vencimento.ItemIndex = 0 then
        pVencimentoBloqueto := 'S'
      else
        pVencimentoBloqueto := 'N';

      QRBloqueto.Close;
      // Gambiarra exorcizada - Djeison A. Selzlein 01/11/2013
//      QRBloqueto.Sql.Clear;
//      QRBloqueto.Sql.Add('SELECT ');
//      QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
//      QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
//      QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
//      QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO AS NOSSO_NUMERO,');
//      QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
//      QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
//      QRBloqueto.Sql.Add('TO_CHAR(Tb_banco_agencia.NOSSO_NUMERO),');
//      QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
//      QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
//      QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
//      if pVencimentoBloqueto = 'N' then
//        QRBloqueto.Sql.Add(CHR(39) + 'APRESENTACAO' + CHR(39) + ' AS DT_VENCIMENTO1,')
//      else
//        QRBloqueto.Sql.Add('TO_CHAR(Tb_conta_receber_cab.DT_VENCIMENTO,' + QuotedStr('DD/MM/YYYY') + ') AS DT_VENCIMENTO1,');
//      QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB,');
//      QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO,');
//      QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,Tb_conta_receber_cab.COD_VENDEDOR,');
//      QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,Tb_conta_receber_cab.COD_FILIAL,TB_CADASTRO.NOME AS NOME_SACADO,');
//      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
//      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
//      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
//      QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
//      QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.CARTEIRA,');
//      QRBloqueto.Sql.Add('TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,TB_CADASTRO.DESC_BAIRRO,TB_CONTA_RECEBER_CAB.IND_ACEITE, ');
//      QRBloqueto.Sql.Add('TB_CONTA_CORRENTE.NR_DIAS_PROTESTO, TB_CONTA_CORRENTE.PRIMEIRA_INSTR_COD, ');
//      QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA, NVL(TB_CADASTRO.PERC_DESCONTO,0) AS PERC_DESCONTO, ');
//      QRBloqueto.Sql.Add('TB_FILIAL.DESC_ENDERECO || '+ CHR(39) +','+ CHR(39) +' || TB_FILIAL.NUM_ENDERECO || '+ CHR(39) +', '+ CHR(39) +' || TB_FILIAL.DESC_BAIRRO || '
//        + CHR(39) +', '+ CHR(39) +' || TB_FILIAL.DESC_CIDADE || '+ CHR(39) +' - '+ CHR(39) +' || TB_FILIAL.COD_ESTADO AS ENDERECO_FILIAL, ');  // Adicionado por Djeison - 07/08/2012
//      QRBloqueto.Sql.Add('TB_FILIAL.NUM_CGC, TB_CONTA_CORRENTE.COD_FORMA_CADAST_BANCO ');
//      QRBloqueto.Sql.Add('FROM ');
//      QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_FILIAL,TB_CONTA_CORRENTE ');
//      QRBloqueto.Sql.Add('Where TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
//      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA ');
//      QRBloqueto.Sql.Add('AND Tb_banco_agencia.COD_BANCO_AGENCIA = Tb_conta_receber_cab.COD_BANCO_AGENCIA ');
//      QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');

      if (Trim(FContasReceberParam.ME6CodContaCorrente.Text) <> '') then
        QRBloqueto.SetVariable('COD_CONTA_CORRENTE',
          Trim(FContasReceberParam.ME6CodContaCorrente.Text));
      if Trim(FContasReceberParam.ME6CodNota.Text) <> '' then
        QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', Trim(FContasReceberParam.ME6CodNota.Text));
      if Trim(FContasReceberParam.ME6CodNotaF.Text) <> '' then
        QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', Trim(FContasReceberParam.ME6CodNotaF.Text));
      if Trim(FContasReceberParam.ME6CodContaReceberCab.Text) <> '' then
        QRBloqueto.SetVariable('COD_CONTA_RECEBER_CAB', Trim(FContasReceberParam.ME6CodContaReceberCab.Text));
      if Trim(FContasReceberParam.ME6CodFilial.Text) <> '' then
        QRBloqueto.SetVariable('COD_FILIAL', Trim(FContasReceberParam.ME6CodFilial.Text));
      if Trim(FContasReceberParam.ME6Inicial.Text) <> '' then
        QRBloqueto.SetVariable('DT_VENCIMENTO_INICIAL', Trim(FContasReceberParam.ME6Inicial.Text));
      if Trim(FContasReceberParam.ME6Final.Text) <> '' then
        QRBloqueto.SetVariable('DT_VENCIMENTO_FINAL', Trim(FContasReceberParam.ME6Final.Text));

      QRBloqueto.SetVariable('VENCIMENTOBLOQUETO', pVencimentoBloqueto);

//      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' +
//        Trim(FContasReceberParam.ME6CodContaCorrente.Text));
//      QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = ' +
//        Trim(FContasReceberParam.ME6CodBanco.Text));
//      QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) +
//        'BAIXA TOTAL' + CHR(39));
//      if Trim(FContasReceberParam.ME6CodNota.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB >= ' +
//          Trim(FContasReceberParam.ME6CodNota.Text));
//      if Trim(FContasReceberParam.ME6CodNotaF.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB <= ' +
//          Trim(FContasReceberParam.ME6CodNotaF.Text));
//      if Trim(FContasReceberParam.ME6CodContaReceberCab.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = '
//          + Trim(FContasReceberParam.ME6CodContaReceberCab.Text));
//      if Trim(FContasReceberParam.ME6CodBanco.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
//          Trim(FContasReceberParam.ME6CodBanco.Text));
//      if Trim(FContasReceberParam.ME6CodFilial.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
//          Trim(FContasReceberParam.ME6CodFilial.Text));
//      if Trim(FContasReceberParam.ME6Inicial.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' +
//          chr(39) + Trim(FContasReceberParam.ME6Inicial.Text) + chr(39));
//      if Trim(FContasReceberParam.ME6Final.Text) <> '' then
//        QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' +
//          chr(39) + Trim(FContasReceberParam.ME6Final.Text) + chr(39));
//      QRBloqueto.Sql.Add(' AND (:COD_CONTA_RECEBER IS NULL OR TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB = :COD_CONTA_RECEBER)');
//      QRBloqueto.Sql.Add(' ORDER BY Tb_conta_receber_cab.NUM_TITULO');

//      if FContasReceberParam.Rg6Vencimento.ItemIndex = 0 then
//        DmContasReceber.pVencimentoBloqueto := 'S'
//      else
//        DmContasReceber.pVencimentoBloqueto := 'N';

      QRBloqueto.Open;

      // Banco do Brasil
      if QRBloquetoCod_Banco.Value = 001 then
      begin
        Bloqueto.EmiteBloqueto(1, 'P');
        if MessageDlg('Todos os bloquetos foram impressos correntamente ?' + #13
          +
          'Caso ainda estejam sendo emitidos, aguarde o término da impressão.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          if Trim(FContasReceberParam.Me6NrBloqueto.Text) <> '' then
            Atualiza_Bloquetos;
      end;

      // Banco Bradesco
      if (QRBloquetoCod_Banco.Value = 237) or
        (QRBloquetoCod_Banco.Value = 291) then
        // BANCO BCN ESTA AQUI SOMENTE PARA EMITIR EM FOLHA EM BRANCO IGUAL BRADESCO
      begin
        Bloqueto.EmiteBloqueto(2, 'P');
        if MessageDlg('Todos os bloquetos foram impressos correntamente ?' + #13
          +
          'Caso ainda estejam sendo emitidos, aguarde o término da impressão.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          if Trim(FContasReceberParam.Me6NrBloqueto.Text) <> '' then
            Atualiza_Bloquetos;
      end;

      // Banco HSBC
      if QRBloquetoCod_Banco.Value = 399 then
      begin
        Bloqueto.EmiteBloqueto(4, 'P');
        if MessageDlg('Todos os bloquetos foram impressos correntamente ?' + #13
          +
          'Caso ainda estejam sendo emitidos, aguarde o término da impressão.',
          mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          if Trim(FContasReceberParam.Me6NrBloqueto.Text) <> '' then
            Atualiza_Bloquetos;
      end;
      // Banco Rural
      if QRBloquetoCod_Banco.Value = 453 then
        Bloqueto.EmiteBloqueto(3, 'P');
      // Caixa Economica
      if QRBloquetoCod_Banco.Value = 104 then
        Bloqueto.EmiteBloqueto(5, 'P');
      // Meridional
      if QRBloquetoCod_Banco.Value = 008 then
        Bloqueto.EmiteBloqueto(6, 'P');
      // Banco Banestado
      if QRBloquetoCod_Banco.Value = 038 then
        Bloqueto.EmiteBloqueto(7, 'P');
      // Banco Itau
      if QRBloquetoCod_Banco.Value = 341 then
        Bloqueto.EmiteBloqueto(8, 'P');
      // Banco Sicredi
      if QRBloquetoCod_Banco.Value = 748 then
        Bloqueto.EmiteBloqueto(9, 'P');
    end;
  end;
end;

procedure TFContasReceberCad.EmissodeNotaPromissria1Click(Sender: TObject);
var
  wTexto: string;
begin
  inherited;
  if (DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Value) > 0 then
  begin
    if (DMParamSistema.QParamSistemaInd_Formulario_Promissoria.value = 'B') Then
    begin
      if FRPromissoria_Branco = nil then
        FRPromissoria_Branco := TFRPromissoria_Branco.Create(Application);
      FRPromissoria_Branco.QRLVencimento.Caption :=
        DMContasReceber.QContasReceber_CabDT_Vencimento.Text;
      FRPromissoria_Branco.QRLNumero.Caption :=
        DMContasReceber.QContasReceber_CabNum_Titulo.Text;
      FRPromissoria_Branco.QRLParcela.Caption :=
        DMContasReceber.QContasReceber_CabNum_Parcela.Text;
      // Para POLLYANA não precisa a mensagem da nota Promissória. Solicitado por LEUCIR. Junior - 26/06/2015
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'POLLYANA' then
      begin
        wTexto := 'Na data de ' +
          DateToStr(DMContasReceber.QContasReceber_CabDT_Vencimento.Value) +
          ', pagarei por esta unica via de NOTA PROMISSORIA a ';
        wTexto := wTexto +
          Trim(DMContasReceber.QContasReceber_CabDesc_Filial.Value);
        wTexto := wTexto + ' CPF/CNPJ: ' +
          DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', 'COD_FILIAL = ' +
          FloatToStr(DMContasReceber.QContasReceber_CabCod_Filial.Value), True);
        wTexto := wTexto + ' ou a sua ordem a quantia de: (';
        if DMContasReceber.QContasReceber_CabVAL_PROMISSORIA.Text <> '' then
        begin
          wTexto := wTexto +
            Bib.extenso(DMContasReceber.QContasReceber_CabVAL_PROMISSORIA.Value,
            'REAL');
          FRPromissoria_Branco.QrLValor.Caption :=
            DMContasReceber.QContasReceber_CabVal_Promissoria.text;
        end
        else
        begin
          wTexto := wTexto +
            Bib.extenso(DMContasReceber.QContasReceber_CabVAL_TITULO.Value,
            'REAL');
          FRPromissoria_Branco.QrLValor.Caption :=
            DMContasReceber.QContasReceber_CabVal_Titulo.text;
        end;
        wTexto := wTexto + '.) em moeda corrente deste pais.';
      end
      else //POLLYANA
        FRPromissoria_Branco.QrLValor.Caption :=
            DMContasReceber.QContasReceber_CabVal_Titulo.text;
    
      FRPromissoria_Branco.QrLocal_Pagamento.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL = '
        +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Filial.Value), True) +
        ' - ' + DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL',
        'COD_FILIAL = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Filial.Value), True);
      FRPromissoria_Branco.QrDescricao.Caption := wTexto;
      FRPromissoria_Branco.QrEmitente.Caption :=
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value) + ' - '
        +
        DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value), True);
      FRPromissoria_Branco.QrCpf_Cnpj.Caption :=
        DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria_Branco.QrEndereco.Caption :=
        DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO',
        'COD_CADASTRO = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value), True);
      FRPromissoria_Branco.QrCidade.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria_Branco.QrCpfEmitente.Caption :=
        DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO',
        'COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria_Branco.QrNomeEmitente.Caption :=
        FRPromissoria_Branco.QrEmitente.Caption;
      FRPromissoria_Branco.QRlAvalista1.Caption :=
        DMContasReceber.QContasReceber_CabDESC_AVALISTA1.Value;
      FRPromissoria_Branco.QRlAvalista2.Caption :=
        DMContasReceber.QContasReceber_CabDESC_AVALISTA2.Value;
      FRPromissoria_Branco.QRLCidade.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL', 'COD_FILIAL =' +
        FloatToStr(DmContasReceber.QContasReceber_CabCod_Filial.Value));
      FRPromissoria_Branco.QRLCidade.Caption :=
        Trim(FRPromissoria_Branco.QRLCidade.Caption) + ', ' +
        FormatDateTime('dd " de " mmmm " de " yyyy ',
        DmContasReceber.QContasReceber_CabDt_Emissao.Value);
      FRPromissoria_Branco.QRPrimario.Preview;
    end
    else
    begin
      if FRPromissoria = nil then
        FRPromissoria := TFRPromissoria.Create(Application);
      FRPromissoria.QRLDia.Caption := FormatDateTime('dd',DMContasReceber.QContasReceber_CabDT_Vencimento.Value);
      FRPromissoria.QRLMes.Caption := FormatDateTime('mmmm',DMContasReceber.QContasReceber_CabDT_Vencimento.Value);
      FRPromissoria.QRLAno.Caption := FormatDateTime('yyyy',DMContasReceber.QContasReceber_CabDT_Vencimento.Value);
      FRPromissoria.QRLEndereco.Caption :=
        DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO','COD_CADASTRO = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value), True);
      FRPromissoria.QRLCidade.Caption :=
        DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria.QRLEstado.Caption :=
        DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria.QRLCGCCPF.Caption :=
        DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '
        + FloatToStr(DMContasReceber.QContasReceber_CabCod_Cadastro.Value),
        True);
      FRPromissoria.QRPrimario.Preview;
    end
  end
  else
    MessageDlg('Atenção é necessário selecionar o título o qual se deseja emitir a Nota Promissória', mtInformation, [mbOk], 0);
end;

procedure TFContasReceberCad.EmissodeDuplicatas1Click(Sender: TObject);
var
  wCont: integer;
  wComando: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') or (DMParamSistema.CodEmpresa = 'RETIFOZ2') then
  begin
    if FContasReceberParam = nil then
      FContasReceberParam := TFContasReceberParam.Create(Application);
    FContasReceberParam.Label36.Visible := False;
    FContasReceberParam.Label47.Visible := False;
    FContasReceberParam.Label59.Visible := False;
    FContasReceberParam.Label241.Visible := False;
    FContasReceberParam.Label145.Visible := False;
    FContasReceberParam.ME7CodDepto.Visible := False;
    FContasReceberParam.ME7CodFilial.Visible := False;
    FContasReceberParam.ME7NrNota.Visible := False;
    FContasReceberParam.ME7CodNota.Visible := False;
    FContasReceberParam.ME7NumParcela.Visible := False;
    FContasReceberParam.ME7Representante.Visible := False;
    FContasReceberParam.Ed7Representante.Visible := False;
    FContasReceberParam.SpeedButton35.Visible := False;
    FContasReceberParam.SpeedButton19.Visible := False;
    FContasReceberParam.SpeedButton29.Visible := False;
    FContasReceberParam.SB7Representante.Visible := False;
    FContasReceberParam.Button3.Visible := False;
    FContasReceberParam.ME7Filial.Visible := False;
    FContasReceberParam.ME7Departamento.Visible := False;
    FContasReceberParam.CB7TodosFilial.Visible := False;
    FContasReceberParam.CB7TodosDepto.Visible := False;

    FContasReceberParam.PGRelatorio.Pages[7].TabVisible := True;

    if FContasReceberParam.ShowModal = mrOk then
    begin
      if Trim(FContasReceberParam.Me7NrTitulo.Text) = '' then
        raise Exception.Create('Deve selecionar um título para imprimir as duplicatas!');

      BibContasReceber.ImprimeDuplicataRetifoz(StrToint(Trim(FContasReceberParam.Me7NrTitulo.Text)));
    end;
  end
  else
  begin
    FContasReceberParam.PGRelatorio.Pages[7].TabVisible := True;
    if FContasReceberParam.ShowModal = MrOk then
    begin
      DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME7CodFilial.Text,
        'CONTAS A RECEBER');
      with DMContasReceber do
      begin
        QRContasReceber_Duplicatas.Close;
        if Trim(FContasReceberParam.ME7CodNota.Text) <> '' then
          QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB',FContasReceberParam.ME7CodNota.Text)
        else
          QRContasReceber_Duplicatas.SetVariable('COD_NOTA_CAB', Null);
        if Trim(FContasReceberParam.ME7CodFilial.Text) <> '' then
          QRContasReceber_Duplicatas.SetVariable('COD_FILIAL',FContasReceberParam.ME7CodFilial.Text)
        else
          QRContasReceber_Duplicatas.SetVariable('COD_FILIAL', Null);
        if Trim(FContasReceberParam.ME7CodDepto.Text) <> '' then
          QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO',FContasReceberParam.ME7CodDepto.Text)
        else
          QRContasReceber_Duplicatas.SetVariable('COD_DEPARTAMENTO', Null);
        if Trim(FContasReceberParam.ME7CodTitulo.Text) <> '' then
          QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB',FContasReceberParam.ME7CodTitulo.Text)
        else
          QRContasReceber_Duplicatas.SetVariable('COD_CONTA_RECEBER_CAB', Null);
        if Trim(FContasReceberParam.ME7Representante.Text) <> '' then
          QRContasReceber_Duplicatas.SetVariable('COD_VENDEDOR',FContasReceberParam.ME7Representante.Text)
        else
          QRContasReceber_Duplicatas.SetVariable('COD_VENDEDOR', Null);
        if Trim(FContasReceberParam.Me7NumParcela.Text) <> '' then
          QRContasReceber_Duplicatas.SetVariable('NUM_PARCELA',Trim(FContasReceberParam.Me7NumParcela.Text))
        else
          QRContasReceber_Duplicatas.SetVariable('NUM_PARCELA', null);
        QRContasReceber_Duplicatas.Open;
        if QRContasReceber_Duplicatas.RecordCount = 0 then
        begin
          MessageDlg('Não existem parcelas para gerar duplicatas',
            mtError, [MbOk], 0);
          Abort;
        end;
      end;

      if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'CGS' then
       begin
         if FRContasReceberDuplicatas_CGS = nil then
           FRContasReceberDuplicatas_CGS := TFRContasReceberDuplicatas_CGS.Create(Application);
         if FContasReceberParam.RGPreview.ItemIndex = 0 then
           FRContasReceberDuplicatas_CGS.QRPrimario.Preview
         else
           FRContasReceberDuplicatas_CGS.QRPrimario.Print;
       end
      else
       if (DMParamSistema.QParamSistemaInd_Formulario_Duplicata.value = 'B') Then
        begin
          if FRContasReceberDuplicatas_MEDIBENS = Nil then
            FRContasReceberDuplicatas_MEDIBENS := TFRContasReceberDuplicatas_MEDIBENS.Create(Application);
          FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa2.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLEmpresa3.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLE_mail.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_E_Mail.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLEndereco.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Endereco_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLCidade.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE_FILIAL.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLPracaPgto.Caption :=
            DMContasReceber.QRContasReceber_DuplicatasDESC_CIDADE_FILIAL.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLPracaPgto.Enabled := True;
          FRContasReceberDuplicatas_MEDIBENS.QRLCGC.caption :=
            DMContasReceber.QRContasReceber_DuplicatasNum_Cgc_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLInscricao.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Inscricao_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLEstado.caption :=
            DMContasReceber.QRContasReceber_DuplicatasCod_Estado_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLCEP.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Cep_Filial.Value;
          FRContasReceberDuplicatas_MEDIBENS.QRLfone.caption :=
            DMContasReceber.QRContasReceber_DuplicatasDesc_Fone_Filial.Value;

          if (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO') or
             (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GRASEL') then
            FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := ''
          else
            FRContasReceberDuplicatas_MEDIBENS.QRLDt_Aceite.Caption := DateToStr(Date);

          if FContasReceberParam.RGPreview.ItemIndex = 0 then
             FRContasReceberDuplicatas_MEDIBENS.QRCompositeReport1.Preview
          else
             FRContasReceberDuplicatas_MEDIBENS.QRCompositeReport1.Print;
        end
       else
         if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
          begin
            FPromissoria.Duplicata_ab;
          end
         else
          begin
            if FRContasReceber_Duplicatas = nil then
               FRContasReceber_Duplicatas := TFRContasReceber_Duplicatas.Create(Application);
               if FContasReceberParam.RGPreview.ItemIndex = 0 then
                  FRContasReceber_Duplicatas.QRPrimario.Preview
               else
                  FRContasReceber_Duplicatas.QRPrimario.Print;
          end;
      DMContasReceber.QRContasReceber_Duplicatas.First;
      while not (DMContasReceber.QRContasReceber_Duplicatas.Eof) do
      begin
        with DMOracle do
        begin
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
            Chr(39) + 'SIM' + Chr(39);
          wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
            FloatToStr(DMContasReceber.QRContasReceber_DuplicatasCOD_CONTA_RECEBER_CAB.Value);
          QExecSQL.SQL.Add(wComando);
          QExecSQL.ExecSQL;
          DMContasReceber.QRContasReceber_Duplicatas.Next
        end;
        DMOracle.DBCemapa.Commit;
      end;
      DMContasReceber.QRContasReceber_Duplicatas.Close;
      If (DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'GONZATTI') then
        EmissodeDuplicatas1Click(Self);

      if (DMParamSistema.QParamSistemaInd_Formulario_Duplicata.value = 'B') Then
       begin
         FRContasReceberDuplicatas_MEDIBENS.Destroy;
         FRContasReceberDuplicatas_MEDIBENS := Nil;
       End;
    end;
  end;
end;

procedure TFContasReceberCad.RelaodeTtulosAbertosSaldos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[8].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME8CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Saldos.Close;
      if Trim(FContasReceberParam.ME8CodCliente.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME8CodCliente.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME8CodDepto.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME8CodDepto.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME8CodBanco.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_BANCO_AGENCIA',
          FContasReceberParam.ME8CodBanco.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_BANCO_AGENCIA', Null);

      if Trim(FContasReceberParam.ME8CodFilial.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_FILIAL',
          FContasReceberParam.ME8CodFilial.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME8CodFinalidade.Text) <> '' then
        QRContasReceber_Saldos.SetVariable('COD_FINALIDADE', FContasReceberParam.ME8CodFinalidade.Text)
      else
        QRContasReceber_Saldos.SetVariable('COD_FINALIDADE', Null);
      QRContasReceber_Saldos.SetVariable('DT_INICIAL',
        FContasReceberParam.ME8DtInicial.Text);
      QRContasReceber_Saldos.SetVariable('DT_FINAL',
        FContasReceberParam.ME8DtFinal.Text + ' 23:59:59');
      QRContasReceber_Saldos.Open;
    end;
    if FRContasReceber_Saldos = nil then
      FRContasReceber_Saldos := TFRContasReceber_Saldos.Create(Application);
    if FContasReceberParam.ME8Departamento.Text = '' then
      FRContasReceber_Saldos.QRLDepartamento.Caption := 'Filial:' +
        FContasReceberParam.Me8Filial.Text + ' - Departamento: Todos'
    else
      FRContasReceber_Saldos.QRLDepartamento.Caption := 'Filial:' +
        FContasReceberParam.Me8Filial.Text + ' - Departamento: ' +
        FContasReceberParam.ME8Departamento.Text;
    if FContasReceberParam.ME8CodFinalidade.Text <> '' then
      FRContasReceber_Saldos.QRLDepartamento.Caption :=
        FRContasReceber_Saldos.QRLDepartamento.Caption +
        ', Finalidade: ' + FContasReceberParam.ME8Finalidade.Text;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRContasReceber_Saldos.QRPrimario.Preview
    else
      FRContasReceber_Saldos.QRPrimario.Print;
    DMContasReceber.QRContasReceber_Saldos.Close;
  end;
end;

procedure TFContasReceberCad.BtDepartamentoClick(Sender: TObject);
var
  wSituacaoDpto: string;
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
  begin
    wSituacaoDpto := DMOracle.FastSelect('IND_SITUACAO','TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + DMDepartamento.QDepartamentoConsCod_Departamento.Text);
    if wSituacaoDpto = 'A' then
      DMContasReceber.QContasReceber_CabCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value
    else
      raise exception.Create('ATENÇÃO - Este departamento não esta ativo. Favor Verificar!');
  end;
end;

procedure TFContasReceberCad.EmissodeRecibos1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[9].TabVisible := True;
  FContasReceberParam.RGPreview.Visible := False;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME9CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRRecibos.Close;
      if Trim(FContasReceberParam.ME9CodCliente.Text) <> '' then
        QRRecibos.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME9CodCliente.Text)
      else
        QRRecibos.SetVariable('COD_CADASTRO', Null);
      QRRecibos.SetVariable('COD_DEPARTAMENTO', Null);
      QRRecibos.SetVariable('COD_REGIAO', Null);
      QRRecibos.SetVariable('COD_BANCO_AGENCIA', Null);
      if Trim(FContasReceberParam.ME9CodFilial.Text) <> '' then
        QRRecibos.SetVariable('COD_FILIAL',
          FContasReceberParam.ME9CodFilial.Text)
      else
        QRRecibos.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME9DtVencInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRRecibos.SetVariable('DT_INICIAL',
        FContasReceberParam.ME9DtVencInicial.Text);
      if Trim(FContasReceberParam.ME9DtVencFinal.Text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      QRRecibos.SetVariable('DT_FINAL',
        FContasReceberParam.ME9DtVencFinal.Text + ' 23:59:59');
      QRRecibos.Open;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK', FContasReceberParam.ME9CodFilial.Text);
      DMFilial.QFilial.Open;
      if FRRecibos2 = nil then
        FRRecibos2 := TFRRecibos2.Create(Application);
      FRRecibos2.QRLRODAPE.Caption := DMFilial.QFilialDesc_Cidade.Value +
        FormatDateTime(', dd "de" mmmm "de" yyyy', Date);
      FRRecibos2.QuickRep1.Preview;
      QRRecibos.Close;
    end;
  end;
end;

procedure TFContasReceberCad.VoltaBaixadeTitulos1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberVoltaBaixa = nil then
    FContasReceberVoltaBaixa := TFContasReceberVoltaBaixa.Create(Application);
  if DMContasReceber.QContasReceber_CabCod_Cadastro.Text <> '' then
  begin
    FContasReceberVoltaBaixa.MECodCliente.Text :=
      DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
    FContasReceberVoltaBaixa.MeNumTitulo.Text :=
      DMContasReceber.QContasReceber_CabNum_Titulo.Text;
  end;
  FContasReceberVoltaBaixa.ShowModal;
end;

procedure TFContasReceberCad.TtulosemAbertoVendedor1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[11].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME11CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.ME11DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');

      if Trim(FContasReceberParam.ME11DtFinal.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRContasReceber_Tit_Abertos_Vend.Close;
      {          QRContasReceber_Tit_Abertos_Vend.Sql.Clear;
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('SELECT Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,Tb_conta_receber_cab.COD_FINALIDADE,Tb_conta_receber_cab.COD_BANCO_AGENCIA,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.COD_FILIAL,Tb_conta_receber_cab.NUM_TITULO,Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.DT_MOVIMENTO,Tb_conta_receber_cab.DT_BAIXA,Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.DT_EMISSAO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.DT_CAPITALIZACAO,Tb_conta_receber_cab.VAL_TITULO,Tb_conta_receber_cab.VAL_NEGOCIO,Tb_conta_receber_cab.IND_ACEITE,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.IND_SITUACAO,(Tb_conta_receber_cab.DESC_OBSERVACAO || DESC_AVALISTA1) AS DESC_OBSERVACAO,Tb_conta_receber_cab.COD_NOTA_CAB,Tb_conta_receber_cab.COD_CADASTRO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.VAL_ORIGINAL,Tb_conta_receber_cab.COD_NOSSO_NUMERO,Tb_conta_receber_cab.VAL_JUROS,Tb_conta_receber_cab.COD_DEPARTAMENTO,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_conta_receber_cab.DT_CAPITALIZACAO_MOEDA,Tb_filial.DESC_FILIAL,Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO,Tb_cadastro.DESC_CIDADE,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('Tb_cadastro.DESC_TELEFONE,Tb_conta_receber_cab.COD_VENDEDOR,Tb_vendedor.NOME,Tb_Departamento.DESC_DEPARTAMENTO,TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add('TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.PERC_JURO_MORA,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_VENDEDOR,TB_DEPARTAMENTO,TB_FINALIDADE,TB_FILIAL,TB_CLASS_CADASTRO ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' WHERE (Tb_conta_receber_cab.COD_FILIAL = Tb_filial.COD_FILIAL) and ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_cadastro.COD_CLASS_CADASTRO = Tb_Class_cadastro.COD_CLASS_CADASTRO) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_conta_receber_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_departamento.COD_DEPARTAMENTO = Tb_CONTA_RECEBER_CAB.COD_DEPARTAMENTO) AND ');
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' (Tb_Finalidade.COD_FINALIDADE = Tb_CONTA_RECEBER_CAB.COD_FINALIDADE) ');
                if Trim(FContasReceberParam.ME11CodFilial.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' + Trim(FContasReceberParam.ME11CodFilial.Text));
                if Trim(FContasReceberParam.ME11CodVendedor.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.COD_VENDEDOR = ' + Trim(FContasReceberParam.ME11CodVendedor.Text));
                if Trim(FContasReceberParam.Me11CodSupervisor.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_vendedor.COD_SUPERVISOR = ' + Trim(FContasReceberParam.Me11CodSupervisor.Text));
                if Trim(FContasReceberParam.ME11CodDepto.Text) <> '' then
                   QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.COD_DEPARTAMENTO = ' + Trim(FContasReceberParam.ME11CodDepto.Text));
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.IND_SITUACAO <> ' + CHR(39) + 'BAIXA TOTAL' + CHR(39));
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO >=' + CHR(39) + FCOntasReceberParam.ME11DTInicial.text + CHR(39));
                QRContasReceber_Tit_Abertos_Vend.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO <=' + CHR(39) + FCOntasReceberParam.ME11DtFinal.text + CHR(39));
                Case FContasReceberParam.RG11Vendedor.ItemIndex of
                  0:QRContasReceber_Tit_Abertos_vend.SQL.Add('AND TB_VENDEDOR.IND_SITUACAO =' + CHR(39) + 'ATIVO' + CHR(39));
                  1:QRContasReceber_Tit_Abertos_vend.SQL.Add('AND TB_VENDEDOR.IND_SITUACAO =' + CHR(39) + 'INATIVO' + CHR(39));
                End;
                Case FContasReceberParam.RG11Ordem.ItemIndex of
                  0:QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CADASTRO.NOME,TB_CADASTRO.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
                  1:QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR, Tb_cadastro.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
                  2:QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO, Tb_cadastro.COD_CADASTRO');
                End;
      }
      if Trim(FContasReceberParam.ME11CodFilial.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_FILIAL',
          Trim(FContasReceberParam.ME11CodFilial.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME11CodVendedor.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_VENDEDOR',
          Trim(FContasReceberParam.ME11CodVendedor.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.Me11CodSupervisor.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_SUPERVISOR',
          Trim(FContasReceberParam.Me11CodSupervisor.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_SUPERVISOR', Null);

      {if Trim(FContasReceberParam.ME11CodDepto.Text) <> '' then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_DEPTO',
          Trim(FContasReceberParam.ME11CodDepto.Text))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_DEPTO', Null);}

      if Trim(FContasReceberParam.Me11Departamento.Text) = 'VÁRIOS' then
      begin
        QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_DEPTO',null);
        QRContasReceber_Tit_Abertos_Vend.SetVariable('DEPARTAMENTOS', 'TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasReceberParam.ME11CodDepto.Text) + ')')
      end
      else
      begin
        QRContasReceber_Tit_Abertos_Vend.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasReceberParam.Me11CodDepto.Text) <> '' then
          QRContasReceber_Tit_Abertos_Vend.SetVariable('COD_DEPTO', Trim(FContasReceberParam.Me11CodDepto.Text));
      end;
      QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Inicial',
          FCOntasReceberParam.ME11DTInicial.text);
      QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Final',
          FCOntasReceberParam.ME11DtFinal.text + ' 23:59:59');

      if (Trim(FCOntasReceberParam.ME11DtBase.text) = '') then
        QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Base',
          DateToStr(Date))
      else
        QRContasReceber_Tit_Abertos_Vend.SetVariable('Dt_Base',
          FCOntasReceberParam.ME11DtBase.text);

      case FContasReceberParam.RG11Vendedor.ItemIndex of
        0: QRContasReceber_Tit_Abertos_vend.SetVariable('IND_SITUACAO',
            'ATIVO');
        1: QRContasReceber_Tit_Abertos_vend.SetVariable('IND_SITUACAO',
            'INATIVO');
        2: QRContasReceber_Tit_Abertos_vend.SetVariable('IND_SITUACAO', Null);
      end;
      QRContasReceber_Tit_Abertos_Vend.SQL[QRContasReceber_Tit_Abertos_Vend.SQL.Count - 1] := '';
      case FContasReceberParam.RG11Ordem.ItemIndex of
        0:
          QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CADASTRO.NOME,Tb_conta_receber_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        1:
          QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR, Tb_conta_receber_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        2:
          QRContasReceber_Tit_Abertos_vend.SQL.Add(' ORDER BY  Tb_conta_receber_cab.COD_VENDEDOR,TB_CONTA_RECEBER_CAB.DT_VENCIMENTO, Tb_conta_receber_cab.COD_CADASTRO');
      end;

      if (Trim(FCOntasReceberParam.ME11DtReferencia.text) = '')then
        DMContasReceber.pDataReferencia := Date
      else
        DMContasReceber.pDataReferencia :=
          StrToDate(FCOntasReceberParam.ME11DtReferencia.text);

      QRContasReceber_Tit_Abertos_Vend.Open;

      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' then
      begin
        if FRContasReceber_Tit_Vend_Aberto_1 = nil then
          FRContasReceber_Tit_Vend_Aberto_1 :=
            TFRContasReceber_Tit_Vend_Aberto_1.create(Application);
        if FContasReceberParam.Rg11Tipo.ItemIndex = 0 then
          FRContasReceber_Tit_Vend_Aberto_1.QRBand3.Enabled := True
        else
          FRContasReceber_Tit_Vend_Aberto_1.QRBand3.Enabled := False;
        FRContasReceber_Tit_Vend_Aberto_1.QRLDepartamento.Caption :=
          'Departamento: ' + FContasReceberParam.ME11Departamento.Text;
        FRContasReceber_Tit_Vend_Aberto_1.QRLTitulo.Caption :=
          'Relatorio Titulos Abertos Por Vendedor de ' +
          FContasReceberParam.ME11DtInicial.Text + ' Ate ' +
          FContasReceberParam.ME11DtFinal.Text;

        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_Tit_Vend_Aberto_1.QRPrimario.Preview
        else
          FRContasReceber_Tit_Vend_Aberto_1.QRPrimario.Print;
        DMContasReceber.QRContasReceber_Tit_Abertos_Vend.Close;
      end
      else
      begin
        if FRContasReceber_Tit_Vend_Aberto = nil then
          FRContasReceber_Tit_Vend_Aberto :=
            TFRContasReceber_Tit_Vend_Aberto.create(Application);
        if FContasReceberParam.Rg11Tipo.ItemIndex = 0 then
        begin
          FRContasReceber_Tit_Vend_Aberto.QRLCadastro.Enabled := True;
          FRContasReceber_Tit_Vend_Aberto.QRBand4.Enabled := True;
          FRContasReceber_Tit_Vend_Aberto.QRBand5.Enabled := True;
        end
        else
        begin
          FRContasReceber_Tit_Vend_Aberto.QRGroup2.Enabled := False;
          FRContasReceber_Tit_Vend_Aberto.QRBand4.Enabled := False;
          FRContasReceber_Tit_Vend_Aberto.QRBand5.Enabled := False;
          FRContasReceber_Tit_Vend_Aberto.QRGroup1.ForceNewPage := False;
        end;
        {              If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then  FOI A ELIANE QUE PEDIU PARA RETIRAR DO PROGRAMA
                       Begin
                         FRContasReceber_Tit_Vend_Aberto.QRDBText11.DataField := 'VAL_ORIGINAL';
                         FRContasReceber_Tit_Vend_Aberto.QRExpr4.Expression := 'SUM(QRContasReceber_Tit_Abertos_vend.VAL_ORIGINAL)';
                         FRContasReceber_Tit_Vend_Aberto.QRExpr2.Expression := 'SUM(QRContasReceber_Tit_Abertos_vend.VAL_ORIGINAL)';
                       End;  }
        FRContasReceber_Tit_Vend_Aberto.QRLDepartamento.Caption := 'Filial:' +
          Trim(FContasReceberParam.ME11Filial.Text) + ' Dep.: ' +
          FContasReceberParam.ME11Departamento.Text;
        FRContasReceber_Tit_Vend_Aberto.QRLTitulo.Caption :=
          'Relatorio Titulos Abertos Por Rep.Comercial Juros Ate ' +
          FContasReceberParam.ME11DtReferencia.Text;
        FRContasReceber_Tit_Vend_Aberto.QRLPeriodo.Caption := 'Periodo de ' +
          FContasReceberParam.ME11DtInicial.Text + ' Ate ' +
          FContasReceberParam.ME11DtFinal.Text;
        FRContasReceber_Tit_Vend_Aberto.QrlMensagem.Caption :=
          FContasReceberParam.Me11Mensagem.Text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_Tit_Vend_Aberto.QRPrimario.Preview
        else
          FRContasReceber_Tit_Vend_Aberto.QRPrimario.Print;
        DMContasReceber.QRContasReceber_Tit_Abertos_Vend.Close;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.BtVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Vendedor.Value :=
        DMVendedor.QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFContasReceberCad.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[12].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME12CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRComissao.Close;
      if Trim(FContasReceberParam.ME12CodFilial.Text) <> '' then
        QRComissao.SetVariable('FILIAL', FContasReceberParam.ME12CodFilial.Text)
      else
        QRComissao.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.Me12TipoDocumento.Text) <> '' then
        QRComissao.SetVariable('COD_SERIE', FContasReceberParam.Me12TipoDocumento.Text)
      else
        QRComissao.SetVariable('COD_SERIE', Null);
      if Trim(FContasReceberParam.ME12CodVendedor.Text) <> '' then
        QRComissao.SetVariable('VENDEDOR', FContasReceberParam.ME12CodVendedor.Text)
      else
        QRComissao.SetVariable('VENDEDOR', Null);
      if Trim(FContasReceberParam.ME12CodVendPreposto.Text) <> '' then
      	QRComissao.SetVariable('VENDEDOR_PREPOSTO', Trim(FContasReceberParam.ME12CodVendPreposto.Text))
      else
        QRComissao.SetVariable('VENDEDOR_PREPOSTO', null);

      if Trim(FContasReceberParam.ME12DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_I', FContasReceberParam.ME12DTInicial.text);

      if Trim(FContasReceberParam.ME12DtFinal.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_F', FContasReceberParam.ME12DtFinal.text + ' 23:59:59');

      if Trim(FContasReceberParam.ME12DtEmissao.text) = '' then
        raise
          Exception.Create('Campo Data Início Calculo Comissões Deve Ser Informado')
      else
        QRComissao.SetVariable('DT_EMISSAO',
          FContasReceberParam.ME12DtEmissao.text);
      if Trim(FContasReceberParam.ME12DtEmissaoFinal.text) = '' then
        raise
          Exception.Create('Campo Data Final Calculo Comissões Deve Ser Informado')
      else
        QRComissao.SetVariable('DT_EMISSAO_FINAL',
          FContasReceberParam.ME12DtEmissaoFinal.text);
      if Trim(FContasReceberParam.ME12DtVencto.Text) = '' then
        QRComissao.SetVariable('DT_VENCTO', Null)
      else
        QRComissao.SetVariable('DT_VENCTO',
          StrToDate(Trim(FContasReceberParam.ME12DtVencto.Text)));

      if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'GRASEL' then
      begin
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '3');
        //paga comissao tambem para notas com cheque
        QRComissao.SetVariable('SUBS_TIPO_MOV', '((Tb_conta_receber_mov.IND_TIPO_MOVIMENTO = ' + QuotedStr('RECEBTO. PRINCIPAL') +
          ') Or (Tb_conta_receber_mov.IND_TIPO_MOVIMENTO = ' + QuotedStr('DESC. CONCEDIDO') + '))');
      end
      else
      begin
        QRComissao.SetVariable('SUBS_TIPO_MOV', '(Tb_conta_receber_mov.IND_TIPO_MOVIMENTO = ' + QuotedStr('RECEBTO. PRINCIPAL') + ')');
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '0');
      end;
      if FContasReceberParam.Rg12Abertos.ItemIndex = 0 then
        QRComissao.SetVariable('LISTAR_TITULOS_ABERTOS', 'SIM')
      else
        QRComissao.SetVariable('LISTAR_TITULOS_ABERTOS', 'NAO');
      if FRComissao = nil then
        FRComissao := TFRComissao.create(Application);
      if FContasReceberParam.Rg12TipoRelatorio.ItemIndex = 0 then
        FRComissao.pTipoRelatorio := 'ANALITICO'
      else
        FRComissao.pTipoRelatorio := 'SINTETICO';

      //if ((FContasReceberParam.RG12Ordem.ItemIndex = 0) or (FContasReceberParam.RG12Ordem.ItemIndex = 1)) then
      QRComissao.SQL[QRComissao.SQL.Count - 1] := '';
      case FContasReceberParam.RG12Ordem.ItemIndex of
        0: QRComissao.SQL.Add('ORDER BY COD_VENDEDOR,DATA');
        1: QRComissao.SQL.Add('ORDER BY COD_VENDEDOR,NUM_TITULO');
      end;
      QRComissao.Open;
      if FRComissao = nil then
        FRComissao := TFRComissao.create(Application);

      FRComissao.QRLTitulo.Caption := 'Relatorio de Comissao De: ' + FContasReceberParam.ME12DTInicial.Text + ' Ate : ' +
        FContasReceberParam.ME12DtFinal.Text;
      FRComissao.QRLFilial.Caption := 'Filial: ' + FContasReceberParam.ME12Filial.Text;
      if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'MOINHO' then
      begin
        FRComissao.QRLabel11.Caption := '  Vend';
        FRComissao.QrDbText10.Datafield := 'Cod_Vendedor';
      end;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRComissao.QRPrimario.Preview
      else
        FRComissao.QRPrimario.Print;
      QRComissao.Close;
    end;
  end;
end;

procedure TFContasReceberCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DbEdit5.SetFocus;
end;

procedure TFContasReceberCad.RelatrioTtulosRecebidos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[13].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME13Filial.Text,
      'CONTAS A RECEBER');

    with DMContasReceber do
    begin
      QRContasReceber_Recebidos.Close;

      if Trim(FContasReceberParam.ME13Filial.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('FILIAL',
          FContasReceberParam.ME13Filial.Text)
      else
        QRContasReceber_Recebidos.SetVariable('FILIAL', Null);

      if Trim(FContasReceberParam.ME13Departamento.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('DEPARTAMENTO',
          FContasReceberParam.ME13Departamento.Text)
      else
        QRContasReceber_Recebidos.SetVariable('DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.Me13CodCliente.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('COD_CADASTRO',
          FContasReceberParam.Me13CodCliente.Text)
      else
        QRContasReceber_Recebidos.SetVariable('COD_CADASTRO', Null);

      QRContasReceber_Recebidos.SetVariable('DT_INICIAL',
        FCOntasReceberParam.ME13DTInicial.text);
      QRContasReceber_Recebidos.SetVariable('DT_FINAL',
        FCOntasReceberParam.ME13DtFinal.text + ' 23:59:59');
      if FCOntasReceberParam.Rg13FormaPagamento.ItemIndex = 0 then
        QRContasReceber_Recebidos.SetVariable('FORMA_PAGAMENTO', 'Caixa')
      else
        QRContasReceber_Recebidos.SetVariable('FORMA_PAGAMENTO', 'Contábil');
      case FCOntasReceberParam.Rg13Troca.ItemIndex of
        0: QRContasReceber_Recebidos.SetVariable('IND_TROCA', 'SIM');
        1: QRContasReceber_Recebidos.SetVariable('IND_TROCA', 'NAO');
        2: QRContasReceber_Recebidos.SetVariable('IND_TROCA', Null);
      end;
      case FCOntasReceberParam.Rg13Devolucao.ItemIndex of
        0: QRContasReceber_Recebidos.SetVariable('IND_DEVOLUCAO', 'SIM');
        1: QRContasReceber_Recebidos.SetVariable('IND_DEVOLUCAO', 'NAO');
        2: QRContasReceber_Recebidos.SetVariable('IND_DEVOLUCAO', Null);
      end;

      if Trim(FContasReceberParam.Me13NumTitulo.Text) <> '' then
        QRContasReceber_Recebidos.SetVariable('NUM_TITULO',
          FContasReceberParam.Me13NumTitulo.Text)
      else
        QRContasReceber_Recebidos.SetVariable('NUM_TITULO', Null);

      if DMParamSistema.CodEmpresa = 'RETIFOZ' then
      begin
        QRContasReceber_Recebidos.SQL[QRContasReceber_Recebidos.SQL.Count - 1] := '';
        QRContasReceber_Recebidos.Sql.Add('ORDER BY DT_MOVIMENTO, NOME')
      end;
      QRContasReceber_Recebidos.Open;

      if FRContasReceber_Recebidos = nil then
        FRContasReceber_Recebidos :=
          TFRContasReceber_Recebidos.create(Application);

      FRContasReceber_Recebidos.QRLFilial.Caption := 'Filial: ' +
        FContasReceberParam.Ed13Filial.Text + ' Depto:' +
        FContasReceberParam.Ed13Departamento.Text;
      FRContasReceber_Recebidos.QRLTitulo.Caption :=
        'Contas a Receber-Titulos Recebidos de ' +
        FContasReceberParam.ME13DtInicial.Text + ' até ' +
        FContasReceberParam.ME13DtFinal.Text;

      if DMParamSistema.CodEmpresa = 'RETIFOZ' then
      begin
        FRContasReceber_Recebidos.QRGroup1.Enabled := False;
        FRContasReceber_Recebidos.QRBand5.Enabled  := False;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Recebidos.QRPrimario.Preview
      else
        FRContasReceber_Recebidos.QRPrimario.Print;
      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') and
        (FContasReceberParam.Me13NumTitulo.Text <> '')) then
        FRContasReceber_Recebidos.QRBand3.Height := 44;
      DMContasReceber.QRContasReceber_Recebidos.Close;
    end;
  end;
end;

procedure TFContasReceberCad.RelatrioTtulosRecebidosBancos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[14].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME14Filial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_Receb_Bco.Close;

      if Trim(FContasReceberParam.ME14Filial.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('FILIAL',
          FContasReceberParam.ME14Filial.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('FILIAL', Null);

      if Trim(FContasReceberParam.ME14Banco.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('BANCO',
          FContasReceberParam.ME14Banco.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('BANCO', Null);

      if Trim(FContasReceberParam.Me14ContaCorrente.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.Me14ContaCorrente.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME14Departamento.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('DEPARTAMENTO',
          FContasReceberParam.ME14Departamento.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.Me14CodCliente.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('COD_CADASTRO',
          FContasReceberParam.Me14CodCliente.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.Me14NumTitulo.Text) <> '' then
        QRContasReceber_Receb_Bco.SetVariable('NUM_TITULO',
          FContasReceberParam.Me14NumTitulo.Text)
      else
        QRContasReceber_Receb_Bco.SetVariable('NUM_TITULO', Null);

      QRContasReceber_Receb_Bco.SetVariable('DT_INICIAL',
        FCOntasReceberParam.ME14DTInicial.text);
      QRContasReceber_Receb_Bco.SetVariable('DT_FINAL',
        FCOntasReceberParam.ME14DtFinal.text + ' 23:59:59');

     


      QRContasReceber_Receb_Bco.Open;

      if FRContasReceber_Receb_Bancos = nil then
        FRContasReceber_Receb_Bancos :=
          TFRContasReceber_Receb_Bancos.create(Application);

      FRContasReceber_Receb_Bancos.QRLFilial.Caption := 'Filial: ' +
        FContasReceberParam.Ed14Filial.Text + ' Banco:' +
        FContasReceberParam.Ed14Banco.Text + ' Dep.:' +
        FContasReceberParam.Ed14Departamento.Text;
      FRContasReceber_Receb_Bancos.QRLTitulo.Caption :=
        'Contas a Receber-Titulos Recebidos de ' +
        FContasReceberParam.ME14DtInicial.Text + ' até ' +
        FContasReceberParam.ME14DtFinal.Text;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceber_Receb_Bancos.QRPrimario.Preview
      else
        FRContasReceber_Receb_Bancos.QRPrimario.Print;
      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI') and
        (FContasReceberParam.Me14NumTitulo.Text <> '')) then
        FRContasReceber_Receb_Bancos.QRBand3.Height := 44;
      DMContasReceber.QRContasReceber_Receb_Bco.Close;
    end;
  end;
end;

procedure TFContasReceberCad.atualiza_Bloquetos;
var
  n_numero: Real;
begin
  with DMContasReceber do
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      n_numero := StrToFloat(FContasReceberParam.Me6NrBloqueto.text);
      QRBloqueto.First;
      while not (QRBloqueto.Eof) do
      begin
        //SERGIO ALTERADO 17/07/2003 INSERIDO CASO O BLOQUETO SEJA BRADESCO
        //rotina original logo abaixo
        case QRBloquetoCod_Banco.Value of
          399:
            begin
              if
                DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                'COD_NOSSO_NUMERO =' + Chr(39) + FloatToStr(n_numero) +
                Bib.DigitoVerificadorHSBC(FloatToStr(n_numero)) + Chr(39), True)
                <>
                '' then
                raise
                  Exception.Create('Nosso Número Já Existente No Banco de Dados');
              QAtuBloq.SetVariable('NUMERO', FloatToStr(n_numero) +
                Bib.DigitoVerificadorHSBC(FloatToStr(n_numero)));
            end;
          237:
            begin
              if
                DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
                'COD_NOSSO_NUMERO =' + Chr(39) + FloatToStr(n_numero) +
                FRBloqueto_Bradesco.CalculaDVNN(QRBloquetoCARTEIRA.Text +
                FloatToStr(n_numero)) + Chr(39), True) <> '' then
                raise
                  Exception.Create('Nosso Número Já Existente No Banco de Dados');

              QAtuBloq.SetVariable('NUMERO', FloatToStr(n_numero) +
                FRBloqueto_Bradesco.CalculaDVNN(QRBloquetoCARTEIRA.Text +
                FloatToStr(n_numero)));
            end;
        else
          begin
            if
              DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB',
              'COD_NOSSO_NUMERO =' + Chr(39) + FloatToStr(n_numero) +
              Bib.DigitoVerificador(FloatToStr(n_numero)) + Chr(39), True) <> '' then
              raise
                Exception.Create('Nosso Número Já Existente No Banco de Dados');
            QAtuBloq.SetVariable('NUMERO', FloatToStr(n_numero) +
              Bib.DigitoVerificador(FloatToStr(n_numero)));
          end;
        end;
        {        if QRBloquetoCod_Banco.Value = 399 then
                 Begin
                  If DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_NOSSO_NUMERO ='+Chr(39)+FloatToStr(n_numero)+Bib.DigitoVerificadorHSBC(FloatToStr(n_numero))+Chr(39)) <> '' Then
                     Raise Exception.Create('Nosso Número Já Existente No Banco de Dados');
                   QAtuBloq.SetVariable('NUMERO',FloatToStr(n_numero)+Bib.DigitoVerificadorHSBC(FloatToStr(n_numero)));
                 End
                Else
                 Begin
                  If DMOracle.BuscaNome('SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB','COD_NOSSO_NUMERO ='+Chr(39)+FloatToStr(n_numero)+Bib.DigitoVerificador(FloatToStr(n_numero))+Chr(39)) <> '' Then
                     Raise Exception.Create('Nosso Número Já Existente No Banco de Dados');
                   QAtuBloq.SetVariable('NUMERO',FloatToStr(n_numero)+Bib.DigitoVerificador(FloatToStr(n_numero)));
                 End;}
        QAtuBloq.SetVariable('COD_CONTA_RECEBER_CAB',
          QRBloquetoCOD_CONTA_RECEBER_CAB.Value);
        QAtuBloq.ExecSQL;
        QAtuBloq.close;
        QRBloqueto.Next;
        n_numero := n_numero + 1;
      end;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.RollBack;
      raise;
    end;
  end;
end;

procedure TFContasReceberCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

procedure TFContasReceberCad.BaixaTituloRetorno(wValor_Juro, wValor_Desconto,
  wValor_Baixa, wPagto_Juro: Real;
  NNumero, mDataLiquidacao, mDataCredito: string);
var
  wCodDoc, wCodCompl, wVlrLancto: Real;
  wNumDoc, wContaCred, wCodHistorico, wContaDeb: string;
  CC, wFilial, wFilial_Contabil: Integer;
begin
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ABATE' then
  begin
    mDataCredito := DateToStr(Date);
    mDataLiquidacao := DateToStr(Date);
  end;
  DMContasReceber.pBaixaMagenetico := 'S';

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',
    DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    if wNum_Titulo = '' then
      QAchaTitulo.SetVariable('TITULO', Null)
    else
      QAchaTitulo.SetVariable('TITULO', wNum_Titulo);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('PK', DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value);
        DMFinalidade.QFinalidade.Open;
        if (wPagto_Juro = 0) and (wValor_Juro = 0) then
          // foi colocado pelo cesar - esta vindo titulos da sicredi com valor a maior e zeros nos juros
          if wValor_Baixa > QContasReceber_CabVal_Titulo.Value then
          begin
            wPagto_Juro := wValor_Baixa - QContasReceber_CabVal_Titulo.Value;
            wValor_Juro := wValor_Baixa - QContasReceber_CabVal_Titulo.Value;
          end;
        wValor_Baixa := wValor_Baixa - wPagto_Juro;

        if (wValor_Baixa <> 0) then // or (wValor_Juro<>0)
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o Juro no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'JUROS';
              QContasReceberBaixaMov.Post;
            end;

            // Inclui no Movimento o Pagamento do Juro
            if wPagto_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wPagto_Juro;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito); // Data do credito.
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'RECEBTO. JUROS';
              QContasReceberBaixaMovIND_FORMA_PAGAMENTO.Value := 'Bancos (';
              if not (DMFinalidade.QFinalidadeCod_Historico_Juro.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value := DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value := StrToDate(mDataCredito); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wPagto_Juro;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value := DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := DMContasReceber.QContasReceber_CabNum_Titulo.AsInteger;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value := 'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) + ' Parcela: ' + FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                DMBancoAgencia.QBancoMovimentoCod_Departamento.Value := QContasReceber_CabCod_Departamento.Value;
                //No Extrato do BANCOS é mostrado o nome do cliente no campo de observação. Quando é feito baixa pelo arquivo de retorno
                //a desc_observacao ficava em branco. Solitação do LEONIR - DEONA. Junior 24/02/2015. Autorizado pelo César.
                DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:= QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_JURO_CRED.Value;
                wContaDeb := DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
                wVlrLancto := wPagto_Juro;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  //wDtLancto:= StrToDate(mDataLiquidacao);  // Data entrada ou liquidacao
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaDeb);

                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaCred);

                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end;

            //Inclui no Movimento a Baixa
            if wValor_Baixa > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Baixa;
              //SERGIO 25/11/02 - wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito); // Data da entrada ou liquidacao
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'RECEBTO. PRINCIPAL';
              QContasReceberBaixaMovIND_FORMA_PAGAMENTO.Value := 'Bancos (';

              if not (DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = false then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value := DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.value := StrToDate(mDataCredito); // data do credito ou liquidacao
                if DMParamSistema.QParamSistemaInd_Tipo_Integracao.Value = 'C' then // Integracao via caixa    Cesar 05/10/2009
                  DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wValor_Baixa + wValor_Desconto
                else
                  DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wValor_Baixa;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value := DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := DMContasReceber.QContasReceber_CabNum_Titulo.AsInteger;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value := 'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) + ' Parcela: ' + FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                DMBancoAgencia.QBancoMovimentoCod_Departamento.Value := QContasReceber_CabCod_Departamento.Value;
                //No Extrato do BANCOS é mostrado o nome do cliente no campo de observação. Quando é feito baixa pelo arquivo de retorno
                //a desc_observacao ficava em branco. Solitação do LEONIR - DEONA. Junior 24/02/2015. Autorizado pelo César.
                DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value := DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
              end;

              // Inclusão do Lançamento Contábil
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Value;
                wContaDeb := DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
                wVlrLancto := wValor_Baixa;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  //wDtLancto:= StrToDate(mDataLiquidacao);   // Data entrada ou liquidação
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;

            end; // Termino da Inclusão dos Movimentos de Baixa

            if wValor_Desconto > 0 then
            begin //Inclui no Movimento o Desconto
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataCredito);
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'DESC. CONCEDIDO';

              if not (DMFinalidade.QFinalidadeCod_Historico_Desc.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value := DMFinalidade.QFinalidadeCOD_HISTORICO_DESC.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value := StrToDate(mDataCredito); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value := wValor_Desconto;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value := DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoNum_Cheque.Value := DMContasReceber.QContasReceber_CabNum_Titulo.AsInteger;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value := 'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) + ' Parcela: ' + FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                DMBancoAgencia.QBancoMovimentoCod_Departamento.Value := QContasReceber_CabCod_Departamento.Value;
                //No Extrato do BANCOS é mostrado o nome do cliente no campo de observação. Quando é feito baixa pelo arquivo de retorno
                //a desc_observacao ficava em branco. Solitação do LEONIR - DEONA. Junior 24/02/2015. Autorizado pelo César.
                DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;

              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil := DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred := DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                wContaDeb := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_DESC_DEB.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Text;
                wVlrLancto := wValor_Desconto;
                ;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  //wDtLancto:= StrToDate(mDataLiquidacao);   // Data entrada ou liquidação
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataCredito), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end; // Término da Inclusao do Movimento de Desconto

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := 0;
            QContasReceber_CabVAL_TITULO.Value := 0;
            // Muda a Situção do Título
            QContasReceber_CabDT_BAIXA.Value := DMOracle.DataServ;
            QContasReceber_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
            QContasReceber_CabDT_CAPITALIZACAO.Value := StrToDate(mDataCredito);
            // Data do credito
            QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value :=
              StrToDate(mDataCredito); // Data do credito
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;

          except
            on E: Exception do
            begin
                DMContasReceber.pBaixaMagenetico := '';
                DMOracle.DBCemapa.RollBack;
                //Por Gian 25/11/2020
                //Agora a exception mostra a mensagem de erro que foi capturada.
                //Antes mostrava apenas Transação não efetuada.
                raise exception.create('Erro! Transação não efetuada: ' + E.Message);
            end;
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Favor verificar. NN-'
          + NNumero + #13 + #10 + 'Título com Baixa Total!');
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';
end;

procedure TFContasReceberCad.AtualizaTituloRetorno(wValor_Juro: Real;
  NNumero, mDataMovimento: string; mComando : Integer);
var
  wCodDoc : Real;
  wNumDoc : string;
begin
  DMContasReceber.pBaixaMagenetico := 'S';

  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    if wNum_Titulo = '' then
      QAchaTitulo.SetVariable('TITULO', Null)
    else
      QAchaTitulo.SetVariable('TITULO', wNum_Titulo);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);

        if (wValor_Juro <> 0) Or (mComando = 09) or (mComando = 23) then // este valor é a despesa de protesto
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o despesas de protesto no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value := QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value := StrToDate(mDataMovimento); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'PROTESTO';
              QContasReceberBaixaMov.Post;
            end;

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := QContasReceber_CabVAL_JUROS.Value + wValor_Juro;
            If mComando = 09 Then
               QContasReceber_CabDESC_OBS.Value := QContasReceber_CabDesc_obs.Value + Chr(13) + chr(10) + ' Baixa de titulo por protesto:' + ' Data:'+mDataMovimento;
            If mComando = 23 Then
               QContasReceber_CabDESC_OBS.Value := QContasReceber_CabDesc_obs.Value + Chr(13) + chr(10) + ' Titulo encaminhado para cartorio:' + ' Data:'+mDataMovimento;
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;
          except
            DMContasReceber.pBaixaMagenetico := '';
            DMOracle.DBCemapa.RollBack;
            raise exception.create('Erro! Transação não efetuada');
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar. NN-'
          + NNumero + #13 + #10 + 'Título está com Baixa Total!');
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';
end;

procedure TFContasReceberCad.RelatrioArquivodeRemessa6411Click(
  Sender: TObject);
begin
  inherited;

  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  FContasReceberParam.Rg17Remessa.Visible := true;
  if FContasReceberParam.ShowModal = mrOk then
  begin
//    Removida filial do parâmetro de geração de arquivo remessa - Djeison A. Selzlein - 24/09/2013
//    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME17CodFilial.Text,
//      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;
//      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
//        QRemessa.SetVariable('COD_FILIAL',
//          FContasReceberParam.ME17CodFilial.text)
//      else
//        raise exception.Create('Código da Filial não pode ficar em branco');
      if Trim(FContasReceberParam.Fm17TituloInicial.MeContasReceber.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Fm17TituloInicial.MeContasReceber.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      if Trim(FContasReceberParam.Fm17TituloFinal.MeContasReceber.Text) <> '' then
        QRemessa.SetVariable('NUM_TITULO_FINAL', FContasReceberParam.Fm17TituloFinal.MeContasReceber.text)
      else
        QRemessa.SetVariable('NUM_TITULO_FINAL', Null);      

      if Trim(FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text)
      else
        raise
          exception.Create('Código da Conta Corrente não pode ficar em branco');
      if Trim(FContasReceberParam.Fm17Datas.MeDtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRemessa.SetVariable('DT_INICIAL',
        FContasReceberParam.Fm17Datas.MeDtInicial.text);
      if Trim(FContasReceberParam.Fm17Datas.MeDtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.Fm17Datas.MeDtFinal.text + ' 23:59:59')
      else
        raise exception.Create('Data Final não pode ficar em branco');

      if FContasReceberParam.RG17Ordem.ItemIndex = 0 then
        QRemessa.SQL[QRemessa.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO '
      else
        QRemessa.SQL[QRemessa.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.NUM_TITULO  ';

      if FContasReceberParam.Rg17Remessa.ItemIndex = 0 then
        QRemessa.SetVariable('IND_REMESSA', 'SIM')
      else
        QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;
      if FRRemessas_641 = nil then
        FRRemessas_641 := TFRRemessas_641.create(Application);
      FRRemessas_641.QRLTitulo.Caption := FContasReceberParam.Me17Titulo.Text +
        FContasReceberParam.Fm17Datas.MeDtInicial.text + ' até ' +
        FContasReceberParam.Fm17Datas.MeDtFinal.text;
      FRRemessas_641.QRLEmpresa.Caption := 'Filial: TODAS';
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRRemessas_641.QRPrimario.Preview
      else
        FRRemessas_641.QRPrimario.Print;
      QRemessa.Close;
    end;
  end;
end;

procedure TFContasReceberCad.GerarArquivoSCI1Click(Sender: TObject);
var
  F: TextFile;
  S: string;
  mValorPago: Real;
  mDataVencimento: string;
  mDataPagamento: string;
  wTelefone: string;
  wEndereco: string;
  wTipoRegistro: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[10].TabVisible := True;

  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME10CodFilial.Text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QCadastroSCI.Close;
      if FContasReceberParam.RG10Tipo.ItemIndex = 0 then
        QCadastroSCI.SetVariable('pTIPO', 'F')
      else
        QCadastroSCI.SetVariable('pTIPO', 'J');

      if Trim(FContasReceberParam.ME10DtInicial.Text) <> '' then
        QCadastroSCI.SetVariable('DT_INICIAL',
          StrtoDate(FContasReceberParam.ME10DtInicial.Text))
      else
        QCadastroSCI.SetVariable('DT_INICIAL', Null);
      if Trim(FContasReceberParam.ME10DtFinal.Text) <> '' then
        QCadastroSCI.SetVariable('DT_FINAL',
          StrtoDate(FContasReceberParam.ME10DtFinal.Text + ' 23:59:59'))
      else
        QCadastroSCI.SetVariable('DT_FINAL', Null);
      if Trim(FContasReceberParam.ME10CodFilial.Text) <> '' then
        QCadastroSCI.SetVariable('COD_FILIAL',
          FContasReceberParam.ME10CodFilial.Text)
      else
        QCadastroSCI.SetVariable('COD_FILIAL', Null);
      QCadastroSCI.SetVariable('DT_VENCTO_INICIAL',
        StrtoDate(FContasReceberParam.MeDtVctoInicial.Text));
      QCadastroSCI.SetVariable('DT_VENCTO_FINAL',
        StrtoDate(FContasReceberParam.MeDtVctoFinal.Text));
      QCadastroSCI.Open;
      QCadastroSCI.First;

      if QCadastroSCI.RecordCount > 0 then
      begin
        S := ''; // Inicializa valor da variavel.
        if FContasReceberParam.RG10Tipo.ItemIndex = 0 then // Pessoa fisica
        begin
          while not QCadastroSCI.Eof do
          begin
            if QCadastroSCIDT_VENCIMENTO.Value = QCadastroSCIDT_EMISSAO.Value then
            begin
              mValorPago := QCadastroSCIVAL_TITULO.Value +
                QCadastroSCIVAL_JUROS.Value;
              mDataPagamento := Copy(QCadastroSCIDT_BAIXA.Text, 1, 2) +
                Copy(QCadastroSCIDT_BAIXA.Text, 4, 2) +
                Copy(QCadastroSCIDT_BAIXA.Text, 7, 4);
            end
            else
            begin
              mValorPago := 0;
              mDataPagamento := '        ';
            end;

            mDataVencimento := Copy(QCadastroSCIDT_VENCIMENTO.Text, 1, 2) +
              Copy(QCadastroSCIDT_VENCIMENTO.Text, 4, 2) +
              Copy(QCadastroSCIDT_VENCIMENTO.Text, 7, 4);

            // Verifica as datas se estão em branco e preenche com ASCII 32
            if Trim(mDataVencimento) = '' then
              mDataVencimento := CHR(32) + CHR(32) + CHR(32) + CHR(32) + CHR(32)
                + CHR(32) + CHR(32) + CHR(32);

            if Trim(mDataPagamento) = '' then
              mDataPagamento := CHR(32) + CHR(32) + CHR(32) + CHR(32) + CHR(32)
                + CHR(32) + CHR(32) + CHR(32);

            Bib.ValidaCPF(QCadastroSCINUM_CGC_CPF.Text); //Validar CPF

            if Length(QCadastroSCIDESC_TELEFONE.Text) > 10 then
              wTelefone := Copy(QCadastroSCIDESC_TELEFONE.Text, 5,
                length(QCadastroSCIDESC_TELEFONE.Text))
            else
              wTelefone := (QCadastroSCIDESC_TELEFONE.Text);

            wTelefone := Bib.LimpaString(wTelefone, '-');
            //----elimina traço do numero do telefone
            wTelefone := Bib.LimpaString(wTelefone, '.');
            //----elimina ponto do numero do telefone
            wTelefone := Bib.LimpaString(wTelefone, ' ');
            //----elimina espaço em branco do numero do telefone

            S := S + 'F' + //  Pessoa fisica
              RMaskCGC_CPF(QCadastroSCINUM_CGC_CPF.Text, 11) + // CPF
              '                    ' + // Identidade/RG
              '    ' + // Orgao emissor.
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCINOME.Value)) + //
              'R' + // Natureza do endereço
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCIDESC_ENDERECO.Value)) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              RemoveAcento(QCadastroSCIDESC_CIDADE.Value)) +
              FormatMaskText('CC', QCadastroSCICOD_ESTADO.Value) +
              RMaskCGC_CPF(QCadastroSCIDESC_CEP.Value, 8) +
              '    ' + // DDD do telefone
              Bib.FormataTextoEsq(wTelefone, 10) + // Telefone
              '    ' + // DDD do fax
              '          ' + // Numero do fax
              '                                                  ' + // E-mail na internet
              Copy(QCadastroSCIDT_CADASTRO.Text, 4, 2) +
              Copy(QCadastroSCIDT_CADASTRO.Text, 7, 4) + // Cliente desde MES/ANO
              FormatMaskText('CCCCCCCCCCCC',
              QCadastroSCICOD_CONTA_RECEBER_CAB.Text) +
              'N' + // Natureza do titulo N=Nota Fiscal
              'R$  ' + // Moeda
              RMaskCGC_CPF(FloatToStr(QCadastroSCIVAL_TITULO.Value * 100), 13) +
              // Valor do titulo/com centavos
            RMaskCGC_CPF(FloatToStr(mValorPago * 100), 13) +
              // Valor pago/com centavos
            Copy(QCadastroSCIDT_EMISSAO.Text, 1, 2) +
              // Data  - Emissão do titulo.
            Copy(QCadastroSCIDT_EMISSAO.Text, 4, 2) + // da
              Copy(QCadastroSCIDT_EMISSAO.Text, 7, 4) + // Venda
              mDataVencimento + // Data de vencimento do titulo.
              mDataPagamento + Chr(13) + Chr(10);
            QCadastroSCI.Next;

          end;
        end
        else // Trata layout para pessoa juridica
        begin
          while not QCadastroSCI.Eof do
          begin
            if length(QCadastroSCINUM_CGC_CPF.TEXT) > 14 then
            begin
              if (QCadastroSCIDT_BAIXA.Text <> '') then
              begin
                mValorPago := QCadastroSCIVAL_TITULO.Value +
                  QCadastroSCIVAL_JUROS.Value;
                mDataPagamento := Copy(QCadastroSCIDT_BAIXA.Text, 1, 2) +
                  Copy(QCadastroSCIDT_BAIXA.Text, 4, 2) +
                  Copy(QCadastroSCIDT_BAIXA.Text, 7, 4);
              end
              else
              begin
                mValorPago := 0;
                mDataPagamento := '        ';
              end;

              mDataVencimento := Copy(QCadastroSCIDT_VENCIMENTO.Text, 1, 2) +
                Copy(QCadastroSCIDT_VENCIMENTO.Text, 4, 2) +
                Copy(QCadastroSCIDT_VENCIMENTO.Text, 7, 4);
              // Verifica as datas se estão em branco e preenche com ASCII 32
              if Trim(mDataVencimento) = '' then
                mDataVencimento := CHR(32) + CHR(32) + CHR(32) + CHR(32) +
                  CHR(32) + CHR(32) + CHR(32) + CHR(32);

              if Trim(mDataPagamento) = '' then
                mDataPagamento := CHR(32) + CHR(32) + CHR(32) + CHR(32) + CHR(32)
                  + CHR(32) + CHR(32) + CHR(32);

              if Length(QCadastroSCIDESC_TELEFONE.Text) > 10 then
                wTelefone := Copy(QCadastroSCIDESC_TELEFONE.Text, 5,
                  length(QCadastroSCIDESC_TELEFONE.Text))
              else
                wTelefone := QCadastroSCIDESC_TELEFONE.Text;

              wTelefone := Bib.LimpaString(wTelefone, '-');
              //----elimina traço do numero do telefone
              wTelefone := Bib.LimpaString(wTelefone, '.');
              //----elimina ponto do numero do telefone
              wTelefone := Bib.LimpaString(wTelefone, ' ');
              //----elimina espaço em branco do numero do telefone
              wEndereco :=
                Bib.LimpaString(RemoveAcento(QCadastroSCIDESC_ENDERECO.Value),
                'ª');
              wEndereco :=
                Bib.LimpaString(RemoveAcento(QCadastroSCIDESC_ENDERECO.Value),
                'º');
              wEndereco := Bib.LimpaString(wEndereco, '-');
              wEndereco := Bib.LimpaString(wEndereco, '.');

              if (QCadastroSCIDT_VENCIMENTO.Value < (date - 15)) then
                wTipoRegistro := 'U' // Negativação de cadastro.
              else
                wTipoRegistro := 'J';
              S := S + wTipoRegistro +
                RMaskCGC_CPF(QCadastroSCINUM_CGC_CPF.Text, 14) +
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCINOME.Value)) +
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', RemoveAcento(QCadastroSCIDESC_FANTASIA.Value)) +
                'M' + // M=Matriz C=Cobrança E=Entrega
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', wEndereco) +
                FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
                RemoveAcento(QCadastroSCIDESC_CIDADE.Value)) +
                FormatMaskText('CC', QCadastroSCICOD_ESTADO.Value) +
                RMaskCGC_CPF(QCadastroSCIDESC_CEP.Value, 8) +
                '    ' + // DDD do telefone
                '          ' {---desc telefone } +
                '    ' + // DDD do fax
                '          ' + // Numero do fax
                '                                                  ' + // E-mail na internet
                Copy(QCadastroSCIDT_CADASTRO.Text, 4, 2) +
                Copy(QCadastroSCIDT_CADASTRO.Text, 7, 4) +
                FormatMaskText('CCCCCCCCCCCC',
                QCadastroSCICOD_CONTA_RECEBER_CAB.Text) +
                'N' + // Natureza do titulo N=Nota Fiscal
                'R$  ' + // Moeda
                RMaskCGC_CPF(FloatToStr(QCadastroSCIVAL_TITULO.Value * 100), 13) +
                // Valor do titulo/com centavos
              RMaskCGC_CPF(FloatToStr(mValorPago * 100), 13) +
                // Valor pago/com centavos
              Copy(QCadastroSCIDT_EMISSAO.Text, 1, 2) +
                // Data  - Emissão do titulo.
              Copy(QCadastroSCIDT_EMISSAO.Text, 4, 2) + // da
                Copy(QCadastroSCIDT_EMISSAO.Text, 7, 4) + // Venda
                mDataVencimento + // Data de vencimento do titulo.
                mDataPagamento + Chr(13) + Chr(10);
            end;
            QCadastroSCI.Next;
          end;
        end;
        // ---------------- Final da geração do arquivo.--------------\\
        if FContasReceberParam.SDlg_Remessa.Execute then
        begin
          AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
          Rewrite(F);
          Writeln(F, S);
          CloseFile(F);
          MessageDlg('Arquivo SCI Gerado com Sucesso!', mtInformation, [mbOk],
            0);
        end
        else
          MessageDlg('Arquivo SCI não foi Gerado!', mtWarning, [mbOk], 0);

      end
      else
        ShowMessage('Não existem registros a serem gerados.');
    end;
  end;
end;

procedure TFContasReceberCad.EmissoRecibo1Click(Sender: TObject);
var wIndexImpressoraPadrao : integer;
  BibContasReceber: TBibContasReceber;
  wCnpj, wValorRecebido: string;
  wValorTotal : double;
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'DINGLIS') or (DMParamSistema.CodEmpresa = 'JASOL') or (DMParamSistema.CodEmpresa = 'RADIO') then
//Imprimir recibo caso necessite de uma segunda via. Solicitado Malcides. Junior 15/05/2019  Adicionado Radiolandia - Alex 29/10/2026
  begin
    if (DMContasReceber.QContasReceber_CabIND_SITUACAO.Text <> 'ABERTO') then
    begin
      if FRReciboTermica = nil then
        FRReciboTermica := TFRReciboTermica.Create(Application);

        wIndexImpressoraPadrao := Printer.PrinterIndex;
        if DMUsuario.ImpressoraPadraoNFCe <> '' then
        begin
          if pos('\\', DMUsuario.ImpressoraPadraoNFCe) > 0 then
            Printer.PrinterIndex :=
            Printer.Printers.IndexOf(Bib.PegaImpressoraPorNomeRede(DMUsuario.ImpressoraPadraoNFCe))
        else
          Printer.PrinterIndex := Printer.Printers.IndexOf(DMUsuario.ImpressoraPadraoNFCe);
        end;
        FRReciboTermica.QRReciboTermica.PrinterSettings.PrinterIndex := Printer.PrinterIndex;
        FRReciboTermica.QRReciboTermica.Print;

//      FRReciboTermica.QRReciboTermica.Preview;
    end
    else
      raise Exception.Create('Não existe baixa para este título.');
  end
  else
  begin
    if FRRecibo = nil then
      FRRecibo := TFRRecibo.Create(Application);

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',DMContasReceber.QContasReceber_CabCod_Filial.Value);
    DMFilial.QFilial.Open;
    wCnpj := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO =' + FloatToStr(DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value));
    FRRecibo.QRLRecebido.Caption :=
      DMContasReceber.QContasReceber_CabDesc_Cliente.Text + ' - ' +
      DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
    FRRecibo.QRLRecebido1.Caption :=
      DMContasReceber.QContasReceber_CabDesc_Cliente.Text + ' - ' +
      DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
    FRRecibo.QRLDataEmissao.Caption :=
      DMContasReceber.QContasReceber_CabDt_Emissao.Text;
    FRRecibo.QRLDataEmissao1.Caption :=
      DMContasReceber.QContasReceber_CabDt_Emissao.Text;
{Alterado para exibir o valor recebido do titulo na copia. Alex 17/10/2023
    FRRecibo.QRLValor.Caption :=
      DMContasReceber.QContasReceber_CabVal_Titulo.text;}

    wValorTotal := (DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value -  DMContasReceber.QContasReceber_CabVAL_TITULO.Value);
    FRRecibo.QRLValor.Caption := FormatFloat('#,##0.00',wValorTotal);
    //FRRecibo.QRLValor.Caption :=  FloatToStr ( ( StrToFloat(FormatFloat DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Text) - StrToFloat(DMContasReceber.QContasReceber_CabVAL_TITULO.Text) ) );

    FRRecibo.QRLValor_Juros.Caption := '0,00';
    FRRecibo.QRLValor_Baixa.Caption := '0,00';
    FRRecibo.QRLDesconto.Caption := '0.00';
{    FRRecibo.QRLValor1.Caption :=
      DMContasReceber.QContasReceber_CabVal_Titulo.text;}
    FRRecibo.QRLValor1.Caption := FormatFloat('#,##0.00',wValorTotal);
    //FRRecibo.QRLValor1.Caption := FloatToStr ( ( StrToFloat(DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Text) - StrToFloat(DMContasReceber.QContasReceber_CabVAL_TITULO.Text) ) );
    FRRecibo.QRLValor_Juros1.Caption := '0,00';
    FRRecibo.QRLValor_Baixa1.Caption := '0,00';
    FRRecibo.QRLDesconto1.Caption := '0.00';
    FRRecibo.QRLValorExtenso.Caption :=
      Bib.Extenso( (DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value - DMContasReceber.QContasReceber_CabVal_Titulo.Value), 'REAL');
    FRRecibo.QRLValorExtenso1.Caption :=
      Bib.Extenso( (DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value - DMContasReceber.QContasReceber_CabVal_Titulo.Value), 'REAL');
    FRRecibo.QRLDescricao.Caption :=
      DMContasReceber.QContasReceber_CabDesc_Finalidade.Text + ' - ' +
      DMContasReceber.QContasReceber_CabDesc_Observacao.Text;
    FRRecibo.QRLDescricao1.Caption :=
      DMContasReceber.QContasReceber_CabDesc_Finalidade.Text + ' - ' +
      DMContasReceber.QContasReceber_CabDesc_Observacao.Text;
    FRRecibo.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy',
      DMContasReceber.QContasReceber_CabDt_Emissao.Value);
    FRRecibo.QRLData1.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy',
      DMContasReceber.QContasReceber_CabDt_Emissao.Value);
    FRRecibo.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.Value;
    FRRecibo.QRLResponsavel1.Caption := DMFilial.QFilialDesc_Filial.Value;
    FRRecibo.QRDBTitulo.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBTitulo.DataField := 'NUM_TITULO';
    FRRecibo.QRDBTitulo1.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBTitulo1.DataField := 'NUM_TITULO';
    FRRecibo.QRDBParcela.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBParcela.DataField := 'NUM_PARCELA';
    FRRecibo.QRDBParcela1.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBParcela1.DataField := 'NUM_PARCELA';
    FRRecibo.QRDBVenc.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBVenc.DataField := 'DT_VENCIMENTO';
    FRRecibo.QRDBVenc1.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBVenc1.DataField := 'DT_VENCIMENTO';
    FRRecibo.QRDBCod_Conta.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBCod_Conta.DataField := 'COD_CONTA_RECEBER_CAB';
    FRRecibo.QRDBCod_Conta1.DataSet := DMContasReceber.QContasReceber_Cab;
    FRRecibo.QRDBCod_Conta1.DataField := 'COD_CONTA_RECEBER_CAB';
//Alterado para imprimir o valor do saldo do titulo. Solicitado por Leni - Injepar. Alex 29/03/2023
//FRRecibo.QRLSaldo.Caption := '0';
    FRRecibo.QRLSaldo.Caption := DMContasReceber.QContasReceber_CabVal_Titulo.Text;
    FRRecibo.QRLSaldo1.Caption := '0';
    FRRecibo.QRLLblFormaPagto.Enabled := False;
    FRRecibo.QRLLblFormaPagto1.Enabled := False;
    FRRecibo.QRLFormaPagto.Enabled := False;
    FRRecibo.QRLFormaPagto1.Enabled := False;
    FRRecibo.QRLabel34.Caption := wCnpj;
    If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED') And
       (DMContasReceber.QContasReceber_CabCod_Finalidade.Value = 21) Then
     Begin
       FRRecibo.QRLRecebido.Caption := DMFilial.QFilialDesc_Filial.Value;
       FRRecibo.QRLRecebido1.Caption := DMFilial.QFilialDesc_Filial.Value;

       FRRecibo.QRLResponsavel.Caption := DMContasReceber.QContasReceber_CabDesc_Cliente.Text + ' - ' +
                                       DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
       FRRecibo.QRLResponsavel1.Caption :=   DMContasReceber.QContasReceber_CabDesc_Cliente.Text + ' - ' +
                                       DMContasReceber.QContasReceber_CabCod_Cadastro.Text;
     End;
    FRRecibo.QuickRep1.Preview;
    FRRecibo.QRLLblFormaPagto.Enabled := True;
    FRRecibo.QRLLblFormaPagto1.Enabled := True;
    FRRecibo.QRLFormaPagto.Enabled := True;
    FRRecibo.QRLFormaPagto1.Enabled := True;
  end;
end;

procedure TFContasReceberCad.PgReceberChange(Sender: TObject);
begin
  inherited;
  //  DMContasReceber.QContasReceber_Mov.Close;
  //  DMContasReceber.QContasReceber_Mov.Open;
  If (PgReceber.ActivePage = TsObservacao) And
     (DSPrimario.State = DsEdit) Then
     DMContasReceber.QContasReceber_CabDESC_OBS.Value := DMContasReceber.QContasReceber_CabDesc_obs.Value + Chr(13) + chr(10) + ' Usuario:'+IntToStr(DMUsuario.CodUsuarioCorrente) + ' Data:'+DateToStr(Date);
end;

procedure TFContasReceberCad.Capitalizao1Click(Sender: TObject);
begin
  inherited;
  if FContasReceber_Capitalizacao = nil then
    FContasReceber_Capitalizacao :=
      TFContasReceber_Capitalizacao.Create(Application);
  FContasReceber_Capitalizacao.Showmodal;
end;

procedure TFContasReceberCad.ResumoPorSiglaBanco1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[16].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME18CodFilial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME18DtInicial.text) = '') or
      (Trim(FContasReceberParam.ME18DtFinal.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber do
    begin
      QRContasReceberResumo.Close;
      if Trim(FContasReceberParam.ME18CodCliente.Text) <> '' then
        QRContasReceberResumo.SetVariable('CADASTRO',
          FContasReceberParam.ME18CodCliente.Text)
      else
        QRContasReceberResumo.SetVariable('CADASTRO', Null);

      if Trim(FContasReceberParam.ME18CodFinalidade.Text) <> '' then
        QRContasReceberResumo.SetVariable('FINALIDADE',
          FContasReceberParam.ME18CodFinalidade.Text)
      else
        QRContasReceberResumo.SetVariable('FINALIDADE', Null);
      if Trim(FContasReceberParam.ME18CodBanco.Text) <> '' then
        QRContasReceberResumo.SetVariable('BANCO',
          FContasReceberParam.ME18CodBanco.Text)
      else
        QRContasReceberResumo.SetVariable('BANCO', Null);

      if Trim(FContasReceberParam.ME18CodDepto.Text) <> '' then
        QRContasReceberResumo.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME18CodDepto.Text)
      else
        QRContasReceberResumo.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME18CodFilial.Text) <> '' then
        QRContasReceberResumo.SetVariable('FILIAL',
          FContasReceberParam.ME18CodFilial.Text)
      else
        QRContasReceberResumo.SetVariable('FILIAL', Null);

      QRContasReceberResumo.SetVariable('DT_VENC_INICIAL',
        FContasReceberParam.ME18DtInicial.Text);
      QRContasReceberResumo.SetVariable('DT_VENC_FINAL',
        FContasReceberParam.ME18DtFinal.Text);
      QRContasReceberResumo.Open;
      if FRContasReceberResumo = nil then
        FRContasReceberResumo := TFRContasReceberResumo.Create(Application);
      FRContasReceberResumo.QRLPeriodo.Caption := 'PERIODO DE: ' +
        FContasReceberParam.Me18DtInicial.Text + ' ATÉ : ' +
        FContasReceberParam.Me18DtFinal.Text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberResumo.QRPrimario.Preview
      else
        FRContasReceberResumo.QRPrimario.Print;
      QRContasReceberResumo.Close;
    end;
  end;
end;

procedure TFContasReceberCad.BaixaTituloRURAL(S: string);
var
  wValor_Juro, wValor_Desconto, wValor_Baixa, wPagto_Juro: Real;
  wCodDoc, wCodCompl, wVlrLancto: Real;
  wNumDoc, wContaCred, wCodHistorico, wContaDeb: string;
  NNumero: string;
  mDataLiquidacao, mDataCredito: string;
  CC, wFilial, wFilial_Contabil: Integer;
begin
  DMContasReceber.pBaixaMagenetico := 'S';
  wValor_Juro := 0;
  wValor_Desconto := 0;
  wValor_Baixa := 0;
  wPagto_Juro := 0;
  mDataLiquidacao := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' + Copy(S,
    300, 02);
  mDataCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' + Copy(S, 300,
    02);

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',
    DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  NNumero := Copy(S, 63, 8);
  //Nosso numero com o dígito verificador ( Numero do titulo no banco )
  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('PK',
          DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value);
        DMFinalidade.QFinalidade.Open;

        // Verifica se valor para baixar é diferente de zero.

        if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor pago.
          wValor_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
        else
          raise exception.Create('Titulo com valor p/baixar igual a zero!');

        if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
        begin
          wValor_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
          wPagto_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
        end;

        if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
          wValor_Desconto := StrToFloat(Copy(S, 241, 13)) / 100 +
            StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

        wValor_Baixa := wValor_Baixa - wPagto_Juro;

        if (wValor_Baixa <> 0) then // or (wValor_Juro<>0)
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o Juro no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'JUROS';
              QContasReceberBaixaMov.Post;
            end;

            // Inclui no Movimento o Pagamento do Juro
            if wPagto_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wPagto_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataCredito); // Data do credito.
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. JUROS';

              if not (DMFinalidade.QFinalidadeCod_Historico_Juro.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value :=
                  StrToDate(mDataLiquidacao); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wPagto_Juro;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:= QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;

                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wPagto_Juro;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end;

            //Inclui no Movimento a Baixa
            if wValor_Baixa > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Baixa;
              //SERGIO 25/11/02 - wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data da entrada ou liquidacao
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. PRINCIPAL';

              if not (DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = false then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.value :=
                  StrToDate(mDataLiquidacao); // data do credito ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wValor_Baixa; //SERGIO 25/11/02 - wValor_Desconto;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
              end;

              // Inclusão do Lançamento Contábil
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_BAIXA_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Baixa;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;

            end; // Termino da Inclusão dos Movimentos de Baixa

            if wValor_Desconto > 0 then
            begin //Inclui no Movimento o Desconto
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao);
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'DESC. CONCEDIDO';

              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                wContaDeb :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_DEB FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Desconto;
                ;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
                QContasReceberBaixaMov.Post;
              end;
            end; // Término da Inclusao do Movimento de Desconto

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := 0;
            QContasReceber_CabVAL_TITULO.Value := 0;
            // Muda a Situção do Título
            QContasReceber_CabDT_BAIXA.Value := DMOracle.DataServ;
            QContasReceber_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
            QContasReceber_CabDT_CAPITALIZACAO.Value := StrToDate(mDataCredito);
            // Data do credito
            QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value :=
              StrToDate(mDataCredito); // Data do credito
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;
          except
            DMContasReceber.pBaixaMagenetico := '';
            DMOracle.DBCemapa.RollBack;
            raise exception.create('Erro! Transação não efetuada');
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar.');
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';

end;

procedure TFContasReceberCad.BaixaTituloHSBC(S: string);
var
  wValor_Juro, wValor_Desconto, wValor_Baixa, wPagto_Juro: Real;
  wCodDoc, wCodCompl, wVlrLancto: Real;
  wNumDoc, wContaCred, wCodHistorico, wContaDeb: string;
  NNumero: string;
  mDataLiquidacao, mDataCredito: string;
  CC, wFilial_Contabil, wFilial: Integer;
begin
  DMContasReceber.pBaixaMagenetico := 'S';
  wValor_Juro := 0;
  wValor_Desconto := 0;
  wValor_Baixa := 0;
  wPagto_Juro := 0;
  mDataLiquidacao := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' + Copy(S,
    115, 02);
  mDataCredito := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' + Copy(S, 115,
    02);

  DMBancoAGencia.QBancoAgencia.Close;
  DMBancoAgencia.QBancoAgencia.SetVariable('PK',
    DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value);
  DMBancoAGencia.QBancoAgencia.Open;
  CC := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  NNumero := Copy(S, 127, 11);
  //Nosso numero com o dígito verificador ( Numero do titulo no banco )
  wNum_Titulo := copy(S, 117, 10);
  with DMContasReceber do
  begin
    QContasReceberBaixaMov.Close;
    QContasReceberBaixaMov.Master := nil;
    QContasReceberBaixaMov.MasterFields := '';
    QContasReceberBaixaMov.DetailFields := '';
    QAchaTitulo.Close;
    QAchaTitulo.SetVariable('NOSSO_NUMERO', NNumero);
    QAchaTitulo.SetVariable('TITULO', wNum_Titulo);
    QAchaTitulo.Open;
    if not QAchaTitulo.Eof then
      // titulo não foi localizado nos arquivo de titulos
    begin
      QContasReceber_Cab.Close;
      QContasReceber_Cab.SetVariable('PK',
        QAchaTituloCod_Conta_Receber_Cab.Value);
      QContasReceber_Cab.Open;
      if QContasReceber_CabInd_Situacao.Value <> 'BAIXA TOTAL' then
      begin
        if Trim(NNumero) <> Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) then
          raise exception.Create('Nosso número não confere! RETORNO : ' + NNumero
            + ' - BASE DE DADOS : ' + QContasReceber_CabCOD_NOSSO_NUMERO.Text);
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('PK',
          DMContasReceber.QContasReceber_CabCOD_FINALIDADE.Value);
        DMFinalidade.QFinalidade.Open;

        // Verifica se valor para baixar é diferente de zero.

        if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor pago.
          wValor_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
        else
          raise exception.Create('Titulo com valor p/baixar igual a zero!');

        if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
        begin
          wValor_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
          wPagto_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
        end;

        if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
          wValor_Desconto := StrToFloat(Copy(S, 241, 13)) / 100 +
            StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

        wValor_Baixa := wValor_Baixa - wPagto_Juro;

        if (wValor_Baixa <> 0) then // or (wValor_Juro<>0)
        begin // Se o Lançamento não vai gerar um valor negativo.
          try
            if not DMOracle.DBCemapa.InTransaction then
              // Verifica se já foi iniciada uma transação.
              DMOracle.DBCemapa.StartTransaction; // Inicia a transação

            //Inclui no Movimento o Juro no movimento contas a receber
            if wValor_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data entrada ou liquidação
              QContasReceberBaixaMovInd_Tipo_Movimento.Value := 'JUROS';
              QContasReceberBaixaMov.Post;
            end;

            // Inclui no Movimento o Pagamento do Juro
            if wPagto_Juro > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wPagto_Juro;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataCredito); // Data do credito.
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. JUROS';

              if not (DMFinalidade.QFinalidadeCod_Historico_Juro.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = False then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_JURO.Value;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.Value :=
                  StrToDate(mDataLiquidacao); // Data entrada ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wPagto_Juro;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
              end;
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:= QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Juro_Bco_Deb.Value;

                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wPagto_Juro;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_CRED.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCOD_LANCTO_CONTABIL_DEB.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;
            end;

            //Inclui no Movimento a Baixa
            if wValor_Baixa > 0 then
            begin
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Baixa;
              //SERGIO 25/11/02 - wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao); // Data da entrada ou liquidacao
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'RECEBTO. PRINCIPAL';

              if not (DMFinalidade.QFinalidadeCod_Historico_Cheque.isNull) then
              begin
                if DMBancoAgencia.QBancoMovimento.Active = false then
                  DMBancoAgencia.QBancoMovimento.Open;
                DMBancoAgencia.QBancoMovimento.Insert;
                DMBancoAgencia.QBancoMovimentoCod_Historico.Value :=
                  DMFinalidade.QFinalidadeCOD_HISTORICO_CHEQUE.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Corrente.Value := CC;
                DMBancoAgencia.QBancoMovimentoDT_Movimento.value :=
                  StrToDate(mDataLiquidacao); // data do credito ou liquidacao
                DMBancoAgencia.QBancoMovimentoVal_Movimento.value :=
                  wValor_Baixa; //SERGIO 25/11/02 - wValor_Desconto;
                DMBancoAgencia.QBancoMovimentoCod_Cadastro.value :=
                  DMContasReceber.QContasReceber_CabCOD_CADASTRO.Value;
                DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.value :=
                  DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                DMBancoAgencia.QBancoMovimentoDesc_Complemento1.Value :=
                  'Título :' + FloatToStr(QContasReceber_CabNUM_TITULO.Value) +
                  ' Parcela: ' +
                  FloatToStr(QContasReceber_CabNUM_PARCELA.Value);
                if DmParamSistema.QParamSistemaCOD_EMPRESA.value = 'ENCOPEL' then
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente), True))
                else
                  DMBancoAgencia.QBancoMovimentoCod_Departamento.Value :=
                    QContasReceber_CabCod_Departamento.Value;
                DMBancoAgencia.QBancoMovimento.Post;
                QContasReceberBaixaMovCod_Bco_Movimento.Value :=
                  DMBancoAGencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
              end;

              // Inclusão do Lançamento Contábil
              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_BAIXA_CRED FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wContaDeb :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Prin_Bco_Deb.Value;
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Baixa;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
              end;
              QContasReceberBaixaMov.Post;

            end; // Termino da Inclusão dos Movimentos de Baixa

            if wValor_Desconto > 0 then
            begin //Inclui no Movimento o Desconto
              QContasReceberBaixaMov.Close;
              QContasReceberBaixaMov.Open;
              QContasReceberBaixaMov.Insert;
              QContasReceberBaixaMovCod_Conta_Receber_Cab.Value :=
                QContasReceber_CabCod_Conta_Receber_Cab.Value;
              QContasReceberBaixaMovVal_Movimento.Value := wValor_Desconto;
              QContasReceberBaixaMovDt_Movimento.Value :=
                StrToDate(mDataLiquidacao);
              QContasReceberBaixaMovInd_Tipo_Movimento.Value :=
                'DESC. CONCEDIDO';

              if DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' then
              begin
                wCodDoc := QContasReceber_CabCod_Conta_Receber_Cab.Value;
                wNumDoc := FloatToStr(QContasReceber_CabNum_Titulo.Value);
                wFilial := QContasReceber_CabCod_Filial.Value;
                //                wFilial_Contabil:=QContasReceber_CabCod_Filial.Value;
                wFilial_Contabil :=
                  DMBancoAgencia.QContaCorrenteConsCod_Filial.Value;
                wContaCred :=
                  DMBancoAgencia.QBancoAgenciaCod_Contabil_Vl_Desc_Bco_Cred.Value;
                wContaDeb :=
                  DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_DESC_DEB FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wCodCompl := QContasReceber_CabCod_Cadastro.Value;
                wCodHistorico :=
                  DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_FINALIDADE',
                  'COD_FINALIDADE =' +
                  FloatToStr(QContasReceber_CabCod_Finalidade.Value),
                  True);
                wVlrLancto := wValor_Desconto;
                ;
                if (wContaCred <> '') and (wContaDeb <> '') then
                begin
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial_Contabil,
                    wContaCred, 'CREDITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaDeb);
                  QContasReceberBaixaMovCod_lancto_contabil_Cred.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                  DMPlanilha.GravaLanc('CR', wCodDoc, wNumDoc, wFilial,
                    wContaDeb, 'DEBITO', wCodCompl, StrToFloat(wCodHistorico),
                    wVlrlancto, StrToDate(mDataLiquidacao), wContaCred);
                  QContasReceberBaixaMovCod_lancto_contabil_Deb.Value :=
                    DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
                end;
                QContasReceberBaixaMov.Post;
              end;
            end; // Término da Inclusao do Movimento de Desconto

            // Término da Inclusão de Movimentos
            QContasReceber_Cab.Edit;
            QContasReceber_CabVAL_JUROS.Value := 0;
            QContasReceber_CabVAL_TITULO.Value := 0;
            // Muda a Situção do Título
            QContasReceber_CabDT_BAIXA.Value := DMOracle.DataServ;
            QContasReceber_CabIND_SITUACAO.Value := 'BAIXA TOTAL';
            QContasReceber_CabDT_CAPITALIZACAO.Value := StrToDate(mDataCredito);
            // Data do credito
            QContasReceber_CabDT_CAPITALIZACAO_MOEDA.Value :=
              StrToDate(mDataCredito); // Data do credito
            QContasReceber_Cab.Post;
            DMOracle.DBCemapa.Commit; // Fim da transação
            QContasReceberBaixaMov.Close;
          except
            DMContasReceber.pBaixaMagenetico := '';
            DMOracle.DBCemapa.RollBack;
            raise exception.create('Erro! Transação não efetuada');
          end //  End If
        end;
      end // teste de situacao do titulo 'BAIXA TOTAL'
      else
      begin
        DMContasReceber.pBaixaMagenetico := '';
        ShowMessage('Erro! Valores incorretos na Baixa. Valores Negativos não podem ser gerados, favor verificar. NN-'
          + NNumero);
      end;
    end; // End With
  end;
  DMContasReceber.QContasReceberBaixaMov.Close;
  DMFinalidade.QFinalidade.Close;
  DMContasReceber.QContasReceber_Cab.Close;
  DMContasReceber.QContasReceberBaixaMov.Master :=
    DMContasReceber.QContasReceberBaixa;
  DMContasReceber.QContasReceberBaixaMov.MasterFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.QContasReceberBaixaMov.DetailFields :=
    'COD_CONTA_RECEBER_CAB';
  DMContasReceber.pBaixaMagenetico := '';

end;

procedure TFContasReceberCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMContasReceber do
  begin
    QcontasReceber_Cab.Close;
    QContasReceber_Mov.Close;
  end;
  Action := CaFree;
  FContasReceberCad := nil;
end;

procedure TFContasReceberCad.EmissaoBloquetoClick(Sender: TObject);
var
  wBanco: string;
begin
  inherited;
  if FContasReceberParam = Nil then
     FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[17].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if FContasReceberParam.RG19ApiWeb.ItemIndex <> 0 then   // SE NÃO FOR API DE BOLETO (HÍBRIDO)
    begin
      if Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text) = '' then
         raise Exception.Create('Informe uma Conta Corrente.');
      DmUsuario.Checar_Filial_Usuario(FContasReceberParam.Fm18Filial.MeFilial.Text,'CONTAS A RECEBER');
      with DMContasReceber do
      begin
        if FContasReceberParam.Rg19Vencimento.ItemIndex = 0 then
          DmContasReceber.pVencimentoBloqueto := 'S'
        else
          DmContasReceber.pVencimentoBloqueto := 'N';

        //-------------------Envio de boleto por e-mail---------------------------
        if (FContasReceberParam.RG19TipoEmissao.ItemIndex = 1) then
        begin
          QRBloquetoEmail.Close;
          QRBloquetoEmail.ClearVariables;
          QRBloquetoEmail.SetVariable('COD_CONTA_CORRENTE',
            Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text));
          if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
            QRBloquetoEmail.SetVariable('COD_NOTA_CAB_INICIAL',Trim(FContasReceberParam.ME19CodNota.Text));
          if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
            QRBloquetoEmail.SetVariable('COD_NOTA_CAB_FINAL',Trim(FContasReceberParam.ME19CodNotaF.Text));
          if Trim(FContasReceberParam.Fm18Filial.MeFilial.Text) <> '' then
            QRBloquetoEmail.SetVariable('COD_FILIAL',Trim(FContasReceberParam.Fm18Filial.MeFilial.Text));
          if Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text) <> '' then
            QRBloquetoEmail.SetVariable('DT_VENCIMENTO_INICIAL',
              Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text));
          if Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text) <> '' then
            QRBloquetoEmail.SetVariable('DT_VENCIMENTO_FINAL',
              Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text));
          if Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text) <> '' then
            QRBloquetoEmail.SetVariable('DT_EMISSAO_INICIAL',
              Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text));
          if Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text) <> '' then
            QRBloquetoEmail.SetVariable('DT_EMISSAO_FINAL',
              Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text));

          if Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text) <> '' then
            QRBloquetoEmail.SetVariable('COD_CONTA_RECEBER',
              Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text));
          if Trim(FContasReceberParam.Fm19Cadastro.MeCadastro.Text) <> '' then
            QRBloquetoEmail.SetVariable('COD_CADASTRO',Trim(FContasReceberParam.Fm19Cadastro.MeCadastro.Text));

          // para emissão dos  bloquetos por e_mail estava dando um problema devido a quantidade
          Case FContasReceberParam.Rg19NumeroBloquetos.ItemIndex Of
            0 : QRBloquetoEmail.SetVariable('Numero_Titulos','1=1');
            //1 : QRBloquetoEmail.SetVariable('Numero_Titulos','RowNum <= 30 And Cod_Nosso_Numero is Null');
            //2 : QRBloquetoEmail.SetVariable('Numero_Titulos','RowNum <= 50 And Cod_Nosso_Numero is Null');
            1 : QRBloquetoEmail.SetVariable('Numero_Titulos','RowNum <= 30');
            2 : QRBloquetoEmail.SetVariable('Numero_Titulos','RowNum <= 50');
          End;

          QRBloquetoEmail.Open;

          QRBloquetoEmail.First;
          while not QRBloquetoEmail.Eof do
          begin
            QRBloqueto.Close;
            QRBloqueto.SetVariable('Numero_Titulos','1=1');
            QRBloqueto.SetVariable('COD_CONTA_RECEBER', QRBloquetoEmailCOD_CONTA_RECEBER_CAB.Text);

              if FContasReceberParam.RG19TipoEmissao.ItemIndex = 1 then
                Chama_Emissao_Bloqueto(1); //pDefineEmissaoBoleto: Imprime = 0, EnviaEmail = 1, ImprimeEnviaEmail = 2
              if FContasReceberParam.RG19TipoEmissao.ItemIndex = 2 then
                Chama_Emissao_Bloqueto(2);

            QRBloquetoEmail.Next;
          end;
            ShowMessage('Boleto(s) Enviado(s) com Sucesso.');
        end

        //-------Fim de boleto por e-mail e início da impressão do boleto---------
        else if ((FContasReceberParam.RG19TipoEmissao.ItemIndex = 0) or
          (FContasReceberParam.RG19TipoEmissao.ItemIndex = 2)or
          (FContasReceberParam.RG19TipoEmissao.ItemIndex = 3)) then
        begin
          QRBloqueto.Close;
          QRBloqueto.ClearVariables;

          if (Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text) <> '') then
            QRBloqueto.SetVariable('COD_CONTA_CORRENTE',
              Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text));
          if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
            QRBloqueto.SetVariable('COD_NOTA_CAB_INICIAL', Trim(FContasReceberParam.ME19CodNota.Text));
          if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
            QRBloqueto.SetVariable('COD_NOTA_CAB_FINAL', Trim(FContasReceberParam.ME19CodNotaF.Text));
          if Trim(FContasReceberParam.Fm18Filial.MeFilial.Text) <> '' then
            QRBloqueto.SetVariable('COD_FILIAL', Trim(FContasReceberParam.Fm18Filial.MeFilial.Text));
          if Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text) <> '' then
            QRBloqueto.SetVariable('DT_VENCIMENTO_INICIAL', Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text));
          if Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text) <> '' then
            QRBloqueto.SetVariable('DT_VENCIMENTO_FINAL', Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text));
          if Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text) <> '' then
            QRBloqueto.SetVariable('DT_EMISSAO_INICIAL', Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text));
          if Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text) <> '' then
            QRBloqueto.SetVariable('DT_EMISSAO_FINAL', Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text));

          // Informar COD_CONTA_RECEBER_CAB
          if Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text) <> '' then
            QRBloqueto.SetVariable('COD_CONTA_RECEBER', Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text));

          QRBloqueto.SetVariable('VENCIMENTOBLOQUETO', DmContasReceber.pVencimentoBloqueto);
          if Trim(FContasReceberParam.Fm19Cadastro.MeCadastro.Text) <> '' then
            QRBloqueto.SetVariable('COD_CADASTRO',Trim(FContasReceberParam.Fm19Cadastro.MeCadastro.Text));

          if trim(FContasReceberParam.ME19Instrucoes.Text) <> '' then
            DMContasReceber.pCodMensagem :=
              strtoint(trim(FContasReceberParam.ME19Instrucoes.Text))
          else
            DMContasReceber.pCodMensagem := 0;

          Case FContasReceberParam.Rg19NumeroBloquetos.ItemIndex Of
            0 : QRBloqueto.SetVariable('Numero_Titulos','1=1');
            //1 : QRBloqueto.SetVariable('Numero_Titulos','RowNum <= 30 And Cod_Nosso_Numero is Null');
            //2 : QRBloqueto.SetVariable('Numero_Titulos','RowNum <= 50 And Cod_Nosso_Numero is Null');
            1 : QRBloqueto.SetVariable('Numero_Titulos','RowNum <= 30');
            2 : QRBloqueto.SetVariable('Numero_Titulos','RowNum <= 50');
          End;

          if FContasReceberParam.RG19TipoEmissao.ItemIndex = 0 then
            Chama_Emissao_Bloqueto(0); //pDefineEmissaoBoleto: Imprime = 0, EnviaEmail = 1, ImprimeEnviaEmail = 2
          if FContasReceberParam.RG19TipoEmissao.ItemIndex = 2 then
            Chama_Emissao_Bloqueto(2);
          if FContasReceberParam.RG19TipoEmissao.ItemIndex = 3 then
          begin
            if not DirectoryExists('C:\boletos') then
              ForceDirectories('C:\boletos');
            Chama_Emissao_Bloqueto(3); //pDefineEmissaoBoleto: Imprime = 0, EnviaEmail = 1, ImprimeEnviaEmail = 2 , GerarPDF = 3
            ShowMessage('Boleto salvo com sucesso em c:\boletos');
          end;
          DMContasReceber.pCodMensagem := 0;
        end;
      end;
      DMContasReceber.QContasReceber_Cab.Refresh;   //coloquei para aparecer o nosso numero depois de gerar o boleto. Vanessa 30/04/2019
    end
    else  /// APENAS PARA BOLETOS HÍBRIDOS
    begin

      with DMContasReceber do
      begin

        QBoletoAPI.Close;
        QBoletoAPI.ClearVariables;

        DmUsuario.Checar_Filial_Usuario(FContasReceberParam.Fm18Filial.MeFilial.Text,'CONTAS A RECEBER');
        iWCodFilial  := StrToInt(Trim(FContasReceberParam.Fm18Filial.MeFilial.Text));
        if (iWCodFilial = 0) then
          raise Exception.Create('A filial é obrigatória para boletos híbridos.');

        if (Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text) <> '') then
        begin
          QBoletoAPI.SetVariable('COD_CONTA_CORRENTE',
            Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text));
          iWCodContaCorrente := StrToInt(Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text));
        end;
        if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
          QBoletoAPI.SetVariable('COD_NOTA_CAB_INICIAL', StrToInt(Trim(FContasReceberParam.ME19CodNota.Text)));
        if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
          QBoletoAPI.SetVariable('COD_NOTA_CAB_FINAL', StrToInt(Trim(FContasReceberParam.ME19CodNotaF.Text)));
        if Trim(FContasReceberParam.Fm18Filial.MeFilial.Text) <> '' then
          QBoletoAPI.SetVariable('COD_FILIAL', StrToInt(Trim(FContasReceberParam.Fm18Filial.MeFilial.Text)));
        if Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text) <> '' then
          QBoletoAPI.SetVariable('DT_VENCIMENTO_INICIAL', Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text));
        if Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text) <> '' then
          QBoletoAPI.SetVariable('DT_VENCIMENTO_FINAL', Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text));
        if Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text) <> '' then
          QBoletoAPI.SetVariable('DT_EMISSAO_INICIAL', Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text));
        if Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text) <> '' then
          QBoletoAPI.SetVariable('DT_EMISSAO_FINAL', Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text));

        // Informar COD_CONTA_RECEBER_CAB
        if Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text) <> '' then
          QBoletoAPI.SetVariable('COD_CONTA_RECEBER', StrToInt(Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text)));

        if Trim(FContasReceberParam.Fm19Cadastro.MeCadastro.Text) <> '' then
          QBoletoAPI.SetVariable('COD_CADASTRO',StrToInt(Trim(FContasReceberParam.Fm19Cadastro.MeCadastro.Text)));

        if FContasReceberParam.RG19TipoEmissao.ItemIndex = 0 then
        begin
          sWEnviaBoletoEmail := False;
          sWEGeraPdf := False;
          ImprimeBoletoApi;
        end;
        if FContasReceberParam.RG19TipoEmissao.ItemIndex = 1 then
        begin
          sWEnviaBoletoEmail := True;
          sWEGeraPdf := False;
          EnviarEmailBoletoApi;
        end;
        if FContasReceberParam.RG19TipoEmissao.ItemIndex = 2 then
        begin
          sWEnviaBoletoEmail := True;
          sWEGeraPdf := False;
          ImprimeBoletoApi;
          EnviarEmailBoletoApi;
        end;
        if FContasReceberParam.RG19TipoEmissao.ItemIndex = 3 then
        begin
          sWEnviaBoletoEmail := False;
          sWEGeraPdf := True;
          ImprimeBoletoApi;
        end;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.VoltarStatusregistros1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberTituloEnviado = nil then
    FContasReceberTituloEnviado :=
      TFContasReceberTituloEnviado.Create(Application);
  FContasReceberTituloEnviado.ShowModal;
end;

procedure TFContasReceberCad.ResumoCtaReceberDiario1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[18].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.MEEmissaoI18.Text) = '') or
      (Trim(FContasReceberParam.MEEmissaoF18.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.MECodFilial18.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContaReceberTotalDia.Close;

      if Trim(FContasReceberParam.MECodFilial18.Text) <> '' then
        QRContaReceberTotalDia.SetVariable('COD_FILIAL',
          FContasReceberParam.MECodFilial18.Text)
      else
        QRContaReceberTotalDia.SetVariable('COD_FILIAL', Null);
      QRContaReceberTotalDia.SetVariable('DT_VENCIMENTO_I',
        FContasReceberParam.MEEmissaoI18.Text);
      QRContaReceberTotalDia.SetVariable('DT_VENCIMENTO_F',
        FContasReceberParam.MEEmissaoF18.Text);

      QRContaReceberTotalDia.Open;

      if FRContaReceberTotalDia = nil then
        FRContaReceberTotalDia := TFRContaReceberTotalDia.Create(Application);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContaReceberTotalDia.QRPrimario.Preview
      else
        FRContaReceberTotalDia.QRPrimario.Print;
      QRContaReceberTotalDia.Close;
    end;
  end;
end;

procedure TFContasReceberCad.LiberaBaixaClick(Sender: TObject);
begin
  inherited;
  if FLiberaBaixa = nil then
    FLiberaBaixa := TFLiberaBaixa.create(Application);
  FLiberaBaixa.ShowModal;
end;

procedure TFContasReceberCad.ReciboComplementarJuro1Click(Sender: TObject);
var
  wCont: Integer;

begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[19].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (FContasReceberParam.ME20Val_Juro.Text <> '') and
      (FContasReceberParam.ME20DT_Vencimento.Text <> '') then
    begin
      with DmContasReceber do
      begin
        DMCadastro.QCadastro.Close;
        DMCadastro.QCadastro.SetVariable('PK',
          QContasReceber_CabConsCod_Cadastro.Value);
        DMCadastro.QCadastro.Open;

        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora; //----------abre impressora
        Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 40);
        //-----configurar pagina
        wCont := 6;
        Imp.WriteXY(13.7, wCont, copy(DateToStr(date), 1, 2));
        Imp.WriteXY(14.8, wCont, copy(DateToStr(date), 4, 2));
        Imp.WriteXY(15.9, wCont, copy(DateToStr(date), 7, 4));
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(12.5, wCont,
          DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' +
          DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CONTA_RECEBER_CAB',
          'COD_CONTA_RECEBER_CAB = ' +
          QContasReceber_CabConsCod_conta_Receber_Cab.Text, True)));
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(11.8, wCont,
          IntToStr(DMSequencia.Sequencia(QContasReceber_CabConsCod_Filial.Value,
          'RECIBO')));
        wCont := 16;
        Imp.WriteXY(6.0, wCont,
          IntToStr(QContasReceber_CabConsNum_Titulo.AsInteger));
        Imp.WriteXY(13.0, wCont, FContasReceberParam.ME20DT_Vencimento.Text);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(3.0, wCont,
          Bib.NumToTexto(StrToFloat(FContasReceberParam.ME20Val_Juro.Text), 2,
          6));
        Inc(wCont);
        Inc(wCont);
        Inc(wCont);
        Imp.WriteXY(6.0, wCont,
          Bib.NumToTexto(StrToFloat(FContasReceberParam.ME20Val_Juro.Text), 2,
          6));
        Imp.WriteXY(16.0, wCont, FContasReceberParam.ME20DT_Vencimento.Text);
        wCont := 24;
        Imp.WriteXY(3.0, wCont, DMCadastro.QCadastroNome.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(2.0, wCont, DMCadastro.QCadastroDesc_Endereco.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(2.0, wCont, DMCadastro.QCadastroDesc_Cidade.Value);
        Imp.WriteXY(12.5, wCont, DMCadastro.QCadastroCod_Estado.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(3.0, wCont, DMCadastro.QCadastroDesc_Cidade.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(2.5, wCont, DMCadastro.QCadastroNUM_CGC_CPF.Value);
        Imp.WriteXY(12.5, wCont, DMCadastro.QCadastroNum_Inscricao.Value);
        inc(wCont);
        inc(wCont);
        Imp.WriteXY(4.0, wCont,
          Bib.extenso(StrToFloat(FContasReceberParam.ME20Val_Juro.Text),
          'REAL'));
        Imp.SaltaPagina;
        Imp.FechaImpressora; // Finaliza os serviços de Impressao
      end;
    end
    else
      showmessage('Devem ser informados a data de vencimento e o valor do Juro');
  end;
end;

procedure TFContasReceberCad.BtContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Conta_Corrente.Value :=
        DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;

      if DMBancoAgencia.QContaCorrenteIND_API_BOLETO.Value = 'SIM' then
        QContasReceber_CabIND_WEB_API.Value :=
          Copy(DMBancoAgencia.QContaCorrenteIND_API_BOLETO.Value, 1, 1)
      else
        QContasReceber_CabIND_WEB_API.Value := 'N';
    end;
end;

function RetornaCodCarteira(wNCarteira: Integer): char;
var
  Cod: Char;
begin
  Cod := ' ';
  case (wNCarteira) of
    168: Cod := '3';
    147: Cod := 'E';
    166: Cod := 'F';
    112, 212, 104, 105, 114, 113, 108, 109, 110, 111, 210, 126, 121, 221, 180,
      280, 175, 198, 122,
      142, 143, 179, 174, 177, 120, 129, 139, 169, 140, 141, 172, 102, 195, 107,
      173, 103, 196, 106
      : Cod := 'I';
    150: Cod := 'U';
  end;

  Result := Cod;
end;

//****** PROCEDIMENTO DE RETORNO DE ERROS **************************************

function TFContasReceberCad.RetornaErroItau(CodErro, Erro: string): string;
var
  Res: string;
begin
  if (Copy(Erro, 1, 2) <> '') and (Copy(Erro, 1, 2) <> '00') then
  begin
    if CodErro = '03' then
    begin
      case StrToInt(Erro) of
        3: Res :=
          'NÃO FOI POSSÍVEL ATRIBUIR A AGÊNCIA  PELO CEP OU CEP INVÁLIDO ';
        4: Res := 'SIGLA do ESTADO INVÁLIDA';
        5: Res :=
          'PRAZO DA OPERAÇÃO MENOR QUE PRAZO MÍNIMO OU MAIOR QUE O MÁXIMO';
        7: Res := 'VALOR DO TÍTULO MAIOR QUE 10.000.000,00';
        8: Res := 'NÃO INFORMADO OU DESLOCADO ';
        9: Res := 'AGÊNCIA ENCERRADA';
        10: Res := 'Não INFORMADO ou DESLOCADO (logradouro)';
        11: Res := 'CEP não Numérico';
        12: Res := 'NOME NÃO INFORMADO OU DESLOCADO (BANCOS CORRESPONDENTES) ';
        13: Res := 'CEP INCOMPATÍVEL COM A SIGLA DO ESTADO';
        14: Res :=
          'NOSSO NÚMERO JÁ REGISTRADO NO CADASTRO DO BANCO OU FORA DA FAIXA';
        15: Res := 'NOSSO NÚMERO EM DUPLICIDADE NO MESMO MOVIMENTO';
        18: Res := 'DATA DE ENTRADA INVÁLIDA PARA OPERAR COM ESTA CARTEIRA';
        19: Res := 'OCORRÊNCIA INVÁLIDA';
        21: Res := ' - CARTEIRA NÃO ACEITA DEPOSITÁRIA CORRESPONDENTE' +
          ' - ESTADO DA AGÊNCIA DIFERENTE DO ESTADO DO SACADO' +
            ' - AG. COBRADORA NÃO CONSTA NO CADASTRO OU  ENCERRANDO';
        22: Res := 'CARTEIRA NÃO PERMITIDA (NECESSÁRIO CADASTRAR FAIXA LIVRE)';
        27: Res := 'CGC DO CEDENTE INAPTO';
        29: Res := 'CATEGORIA DA CONTA INVÁLIDA';
        35: Res := 'IOF MAIOR QUE 5%';
        36: Res := 'QUANTIDADE DE MOEDA INCOMPATÍVEL COM VALOR DO TÍTULO';
        37: Res := 'NÃO NUMÉRICO OU IGUAL A ZEROS';
        42: Res := 'NOSSO NÚMERO FORA DE FAIXA';
        52: Res := 'EMPRESA NÃO ACEITA BANCO CORRESPONDENTE';
        53: Res :=
          'EMPRESA NÃO ACEITA BANCO CORRESPONDENTE  - COBRANÇA MENSAGEM';
        54: Res :=
          'BANCO CORRESPONDENTE - TÍTULO COM VENCIMENTO INFERIOR A 15 DIAS';
        55: Res := 'CEP NÃO PERTENCE A DEPOSITÁRIA INFORMADA';
        56: Res := 'VENCTO SUPERIOR A 180 DIAS DA DATA DE ENTRADA';
        57: Res :=
          'CEP SÓ DEPOSITÁRIA BCO DO BRASIL COM VENCTO INFERIOR A 8 DIAS';
        60: Res := 'VALOR DO ABATIMENTO INVÁLIDO';
        61: Res := 'JUROS DE MORA MAIOR QUE O PERMITIDO';
        62: Res := 'VALOR DO DESCONTO MAIOR QUE O VALOR DO TÍTULO';
        63: Res := 'NÃO PERMITIDO (IMPORTÂNCIA POR DIA DE DESCONTO)';
        64: Res := 'DATA DE EMISSÃO DO TÍTULO INVÁLIDA (VENDOR)';
        65: Res := 'TAXA INVÁLIDA (VENDOR)';
        66: Res :=
          'INVALIDA/FORA DE PRAZO DE OPERAÇÃO (MÍNIMO OU MÁXIMO, DATA VENCTO)';
        67: Res := 'VALOR DO TÍTULO/QUANTIDADE DE MOEDA INVÁLIDO';
        68: Res := 'CARTEIRA INVÁLIDA';

        { Para carteiras 102,103,106,107,172,173,195,196  }
        91: Res := 'DAC AGÊNCIA / CONTA CORRENTE INVÁLIDO';
        92: Res := 'DAC AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO INVÁLIDO';
        93: Res := 'SIGLA ESTADO INVÁLIDA';
        94: Res := 'SIGLA ESTADO INCOMPATÍVEL COM CEP DO SACADO';
        95: Res := 'CEP DO SACADO NÃO NUMÉRICO OU INVÁLIDO';
        96: Res := 'ENDEREÇO / NOME / CIDADE SACADO INVÁLIDO';

        98: Res :=
          'REGISTRO MENSAGEM SEM FLASH CADASTRADO OU FLASH INFORMADO DIFERENTE DO CADASTRADO';
        99: Res :=
          'CONTA DE COBRANÇA COM FLASH CADASTRADO E SEM REGISTRO DE MENSAGEM CORRESPONDENTE';
      end;
    end;

    if (CodErro = '06') or (CodErro = '08') or (CodErro = '10') then
    begin
      case StrToInt(CodErro) of
        06: Res := 'LIQUIDACAO NORMAL';
        08: Res := 'LIQUIDACAO EM CARTORIO';
        10: Res := 'BAIXA POR TER SIDO LIQUIDADO';
      end;
    end;

    if CodErro = '15' then
    begin
      case StrToInt(Erro) of
        1: Res := 'CARTEIRA/Nº NÚMERO NÃO NUMÉRICO';
        4: Res := 'NOSSO NÚMERO EM DUPLICIDADE NUM MESMO MOVIMENTO';
        5: Res := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO JÁ BAIXADO OU LIQUIDADO ';
        6: Res := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO NÃO REGISTRADO NO SISTEMA ';
        7: Res :=
          'COBRANÇA PRAZO CURTO - SOLICITAÇÃO DE BAIXA P/ TÍTULO NÃO REGISTRADO NO SISTEMA';
        8: Res := 'SOLICITAÇÃO DE BAIXA PARA TÍTULO EM FLOATING';
      end;
    end;

    if CodErro = '16' then
    begin
      case StrToInt(Erro) of
        1: Res := 'INSTRUÇÃO/OCORRÊNCIA NÃO EXISTENTE';
        6: Res := 'NOSSO NÚMERO IGUAL A ZEROS';
        9: Res := 'CGC/CPF  DO SACADOR/AVALISTA INVÁLIDO';
        10: Res := 'VALOR DO ABATIMENTO IGUAL OU MAIOR QUE O VALOR DO TÍTULO';
        14: Res := 'REGISTRO EM DUPLICIDADE ';
        15: Res := 'CGC/CPF INFORMADO SEM NOME DO SACADOR/AVALISTA';
        21: Res := 'TÍTULO NÃO REGISTRADO NO SISTEMA';
        23: Res :=
          'INSTRUÇÃO NÃO ACEITA POR TER SIDO EMITIDO ÚLTIMO AVISO AO SACADO';
        24: Res :=
          'INSTRUÇÃO INCOMPATÍVEL - EXISTE INSTRUÇÃO DE PROTESTO PARA O TÍTULO';
        25: Res :=
          'INSTRUÇÃO INCOMPATÍVEL - NÃO EXISTE INSTRUÇÃO DE PROTESTO PARA O TÍTULO';
        26: Res :=
          'INSTRUÇÃO NÃO ACEITA POR TER SIDO EMITIDO ÚLTIMO AVISO AO SACADO';
        27: Res :=
          'INSTRUÇÃO NÃO ACEITA POR NÃO TER SIDO EMITIDA A ORDEM DE PROTESTO AO CARTÓRIO';
        28: Res :=
          'JÁ EXISTE UMA MESMA INSTRUÇÃO CADASTRADA ANTERIORMENTE PARA O TÍTULO';
        29: Res :=
          'VALOR LÍQUIDO + VALOR DO ABATIMENTO DIFERENTE DO VALOR DO TÍTULO REGISTRADO, OU VALOR DO ABATIMENTO MAIOR QUE 90% DO VALOR DO TÍTULO';
        30: Res := 'EXISTE UMA INSTRUÇÃO DE NÃO PROTESTAR ATIVA PARA O TÍTULO';
        31: Res := 'EXISTE UMA OCORRÊNCIA DO SACADO QUE BLOQUEIA A INSTRUÇÃO';
        32: Res :=
          'DEPOSITÁRIA DO TÍTULO = 9999 OU CARTEIRA NÃO ACEITA PROTESTO';
        33: Res :=
          'ALTERAÇÃO DE VENCIMENTO IGUAL À REGISTRADA NO SISTEMA OU QUE TORNA O TÍTULO VENCIDO';
        34: Res :=
          'INSTRUÇÃO DE EMISSÃO DE AVISO DE COBRANÇA PARA TÍTULO VENCIDO ANTES DO VENCIMENTO';
        35: Res := 'SOLICITAÇÃO DE CANCELAMENTO DE INSTRUÇÃO INEXISTENTE';
        36: Res :=
          'TÍTULO SOFRENDO ALTERAÇÃO DE CONTROLE (AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO)';
        37: Res := 'INSTRUÇÃO NÃO PERMITIDA PARA A CARTEIRA';
      end;
    end;

    if CodErro = '17' then
    begin
      case StrToInt(Erro) of
        2: Res := 'AGÊNCIA COBRADORA INVÁLIDA OU COM O MESMO CONTEÚDO';
        4: Res := 'SIGLA DO ESTADO INVÁLIDA';
        5: Res := 'DATA DE VENCIMENTO INVÁLIDA OU COM O MESMO CONTEÚDO';
        6: Res := 'VALOR DO TÍTULO COM OUTRA ALTERAÇÃO SIMULTÂNEA';
        8: Res := 'NOME DO SACADO COM O MESMO CONTEÚDO';
        9: Res := 'AGÊNCIA/CONTA INCORRETA';
        11: Res := 'CEP INVÁLIDO';
        13: Res := 'SEU NÚMERO COM O MESMO CONTEÚDO';
        16: Res :=
          'ABATIMENTO/ALTERAÇÃO DO VALOR DO TÍTULO OU SOLICITAÇÃO DE BAIXA BLOQUEADA';
        21: Res :=
          'AGÊNCIA COBRADORA NÃO CONSTA NO CADASTRO DE DEPOSITÁRIA OU EM ENCERRAMENTO';
        53: Res := 'INSTRUÇÃO COM O MESMO CONTEÚDO';
        54: Res :=
          'DATA VENCIMENTO PARA BANCOS CORRESPONDENTES INFERIOR AO ACEITO PELO BANCO';
        55: Res :=
          'ALTERAÇÕES IGUAIS PARA O MESMO CONTROLE (AGÊNCIA/CONTA/CARTEIRA/NOSSO NÚMERO)';
        56: Res := 'CGC/CPF INVÁLIDO NÃO NUMÉRICO OU ZERADO';
        57: Res := 'PRAZO DE VENCIMENTO INFERIOR A 15 DIAS';
        60: Res :=
          'VALOR DE IOF - ALTERAÇÃO NÃO PERMITIDA PARA CARTEIRAS DE N.S. - MOEDA VARIÁVEL';
        61: Res :=
          'TÍTULO JÁ BAIXADO OU LIQUIDADO OU NÃO EXISTE TÍTULO CORRESPONDENTE NO SISTEMA';
        66: Res :=
          'ALTERAÇÃO NÃO PERMITIDA PARA CARTEIRAS DE NOTAS DE SEGUROS - MOEDA VARIÁVEL';
        81: Res := 'ALTERAÇÃO BLOQUEADA - TÍTULO COM PROTESTO';
      end;
    end;

    if CodErro = '18' then
    begin
      case StrToInt(Erro) of
        16: Res :=
          'ABATIMENTO/ALTERAÇÃO DO VALOR DO TÍTULO OU SOLICITAÇÃO DE BAIXA BLOQUEADOS';
      end;
    end;

    if CodErro = '35' then
      Res := 'NÃO BAIXADO (CUSTAS DE CARTORIO DISTRIBUIDOR)';

  end;
  Result := (Res);
end;

procedure TFContasReceberCad.CartadeCobrana1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[20].TabVisible := True;
  if (DMParamSistema.CodEmpresa = 'ZADIMEL') or (DMParamSistema.CodEmpresa = 'FAVILLE') then
  begin
    FContasReceberParam.RG20Cartas.visible := true;
    FContasReceberParam.ME20DtCarta.visible := true;
    FContasReceberParam.Label162.visible := true;
  end;
  if DMParamSistema.CodEmpresa = 'RADIO' then
    FContasReceberParam.RG20Modelo.visible := true;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.ME20DtIni.Text) = '') or
      (Trim(FContasReceberParam.ME20DtFin.Text) = '') then
      raise Exception.Create('Informar o Período');
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME20CodFilial.Text),
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRCartaCobranca.Close;
      if Trim(FContasReceberParam.ME20CodCliente.Text) <> '' then
        QRCartaCobranca.SetVariable('CADASTRO',
          Trim(FContasReceberParam.ME20CodCliente.Text))
      else
        QRCartaCobranca.SetVariable('CADASTRO', null);
      if Trim(FContasReceberParam.ME20CodFilial.Text) <> '' then
        QRCartaCobranca.SetVariable('FILIAL',
          Trim(FContasReceberParam.ME20CodFilial.Text))
      else
        QRCartaCobranca.SetVariable('FILIAL', null);
      if Trim(FContasReceberParam.ME20DtIni.Text) <> '' then
        QRCartaCobranca.SetVariable('DATA_INICIAL',
          Trim(FContasReceberParam.ME20DtIni.Text));
      if Trim(FContasReceberParam.ME20DtFin.Text) <> '' then
        QRCartaCobranca.SetVariable('DATA_FINAL',
          Trim(FContasReceberParam.ME20DtFin.Text));
      QRCartaCobranca.Open;
    end;

    if (DMParamSistema.CodEmpresa = 'ZADIMEL') or (DMParamSistema.CodEmpresa = 'FAVILLE') then
    begin
      if FRCartaCobrancaFaville = nil then
        FRCartaCobrancaFaville := TFRCartaCobrancaFaville.Create(Application);
      FRCartaCobrancaFaville.QRlabel12.Font.Color := ClWindowText;
      FRCartaCobrancaFaville.QRlabel13.Font.Color := ClWindowText;
      FRCartaCobrancaFaville.QRDbText7.Font.Color := ClWindowText;
      FRCartaCobrancaFaville.QrExpr2.Font.Color := ClWindowText;
      case FContasReceberParam.RG20Cartas.ItemIndex of
        0, 2:
          begin
            FRCartaCobrancaFaville.QRLabel8.Caption :=
              'AVISO DE FALTA DE PAGAMENTO DE TÍTULO';
            FRCartaCobrancaFaville.QRLabel20.Caption := '        ' +
              DMContasReceber.QRCartaCobrancaDESC_FILIAL.Text +
              ', localizada na rodovia BR163-Km277 na cidade de Marechal Cândido Rondon, Estado do Paraná, vem, por' +
              ' intermédio desta, notificá-lo de que consta em nosso sistema a existência de débitos referentes ao não' +
              ' pagamento de títulos, conforme demonstrativo abaixo:';
            if FContasReceberParam.RG20Cartas.ItemIndex = 2 then
            begin
              FRCartaCobrancaFaville.QRLabel14.Caption :=
                'Informamos que os valores serao acrescidos de juros e correção monetaria na data do pagamento.';
              FRCartaCobrancaFaville.QRlabel12.Font.Color := ClWhite;
              FRCartaCobrancaFaville.QRlabel13.Font.Color := ClWhite;
              FRCartaCobrancaFaville.QRDbText7.Font.Color := ClWhite;
              FRCartaCobrancaFaville.QrExpr2.Font.Color := ClWhite;
            end
            else
              FRCartaCobrancaFaville.QRLabel14.Caption :=
                'Informamos que os valores foram corrigidos até a data de ' +
                DateToStr(DMOracle.DataServ) +
                ', utilizando-se como índice o INPC + 1% de juros.';
            FRCartaCobrancaFaville.QRLabel15.Caption :=
              'Com o intuito de uma solução amigável, solicitamos que entre em contato, junto ao departamento de ' +
              'CONTAS A RECEBER, na pessoa da Sr.(a) ' +
              DMContasReceber.QRCartaCobrancaCONTATO_FILIAL.Text + ', pelo fone '
              + DMContasReceber.QRCartaCobrancaFONE_FILIAL.Text +
              ', para que possamos regularizar sua situação. ';
            FRCartaCobrancaFaville.QRLabel16.Caption :=
              'Obs: Caso o referido débito já tenha sido quitado ao tempo do recebimento desta, favor desconsiderar essa notificação.';
            FRCartaCobrancaFaville.QRLabel17.Caption :=
              'Certos de que seremos prontamente atendidos nesse pedido, prosseguindo com nosso bom relacionamento comercial,' +
              'desde já agradecemos sua compreensão.';
            FRCartaCobrancaFaville.QRLabel18.Caption := 'Atenciosamente,';
          end;
        1:
          begin
            FRCartaCobrancaFaville.QRLabel8.Caption :=
              '2° E ÚLTIMO AVISO DE FALTA DE PAGAMENTO DE TÍTULO';
            FRCartaCobrancaFaville.QRLabel20.Caption := '        ' +
              DMContasReceber.QRCartaCobrancaDESC_FILIAL.Text +
              ', localizada na rodovia BR163-Km277 na cidade de Marechal Cândido Rondon, Estado do Paraná, vem, por' +
              ' intermédio desta, expor o que se segue:                      ' +
              '        Em data de ' + FContasReceberParam.ME20DtCarta.Text +
              ', Vossa Senhoria foi devidamente notificado de que consta em nosso sistema a existência de débitos referentes ao não' +
              ' pagamento de títulos, conforme demonstrativo abaixo:';
            FRCartaCobrancaFaville.QRLabel14.Caption := '';
            FRCartaCobrancaFaville.QRLabel15.Caption :=
              '        Como não houve resposta à notificação anterior, a qual foi dado ciência de recebimento em data de ' +
              FContasReceberParam.ME20DtCarta.Text +
              ', solicitamos, novamente, que entre em contato, no PRAZO ' +
              'MÁXIMO DE 3 (TRÊS) DIAS do recebimento desta, com o DEPARTAMENTO JURÍDICO desta empresa, na pessoa do Sr. Jean, pelo fone ' +
              DMContasReceber.QRCartaCobrancaFONE_FILIAL.Text +
              ', sob pena de serem tomadas as medidas judiciais cabíveis.';

            FRCartaCobrancaFaville.QRLabel16.Caption :=
              'Obs: Caso o referido débito já tenha sido quitado ao tempo do recebimento desta, favor desconsiderar essa notificação.';
            FRCartaCobrancaFaville.QRLabel17.Caption :=
              '        Pedimos que entre em contato e solucione a pendência acima exposta para que possamos continuar nosso bom relacionamento comercial.';
            FRCartaCobrancaFaville.QRLabel18.Caption := 'Atenciosamente,';
          end;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCartaCobrancaFaville.QRepCartaCobrancaFaville.Preview
      else
        FRCartaCobrancaFaville.QRepCartaCobrancaFaville.Print;
    end
    else if DMParamSistema.CodEmpresa = 'RADIO' then
    begin
      if FRCartaCobrancaCiviero = nil then
        FRCartaCobrancaCiviero := TFRCartaCobrancaCiviero.Create(Application);
      case FContasReceberParam.RG20Modelo.ItemIndex of
        0: FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
          ('Notamos que sua parcela passou despercebida, pedimos o seu comparecimento para a solução.');
        1:
          begin
            FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
              ('É lamentável o descumprimento do seu contrato, pedimos o seu comparecimento em 48 horas para a solução.')
              +
              ('                                                                                                                                          ')
              + ('Atenciosamente : Departamento Jurídico');
            FRCartaCobrancaCiviero.QRMemo3.Lines.Text :=
              ('Departamento Jurídico');
          end;
        2:
          begin
            FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
              ('Atenção : Aviso de Interpelação Extra-Judicial                                                                                             ')
              +
              ('Comunicamos a vossa senhoria que estaremos ajuizando ação de execução contra devedor solvente no Fórum ')
              +
              ('desta Comarca. Pedimos o seu comparecimento imediato, como última tentativa de solução amigável.');
            FRCartaCobrancaCiviero.QRMemo3.Lines.Text :=
              ('Departamento Jurídico');
          end;
        3:
          begin
            FRCartaCobrancaCiviero.QRMemo1.Lines.Text :=
              ('                                  NÃO PERCA ESTA OPORTUNIDADE')
              +
              chr(13)
              +
              ('                                         REABILITE SEU CREDITO')
              + chr(13) + chr(13)
              +
              ('A Radiolândia está oferecendo a oportunidade de quitar seus débitos em atraso sem juros.')
              + chr(13)
              +
              ('                                Se preferir podendo utilizar seu 13 salário')
              + chr(13) + chr(13)
              + ('Venha a nossa loja para negociar à vista ou parcelado') +
              chr(13) + chr(13)
              + ('A hora é agora, não espere para amanhã.') + chr(13) + chr(13)
              + chr(13)
              + ('Favor trazer esta carta quando vier a loja');
          end;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCartaCobrancaCiviero.QRepCartaCobranca.Preview
      else
        FRCartaCobrancaCiviero.QRepCartaCobranca.Print;
    end
    else
    begin
      if FRCartaCobranca = nil then
        FRCartaCobranca := TFRCartaCobranca.Create(Application);
      if DMParamSistema.CodEmpresa = 'MOINHO' then
      begin
        FRCartaCobranca.QRLabel3.Font.Color := ClWhite;
        FRCartaCobranca.QRDbText3.Font.Color := ClWhite;
        FRCartaCobranca.QRExpr2.Font.Color := ClWhite;
      end;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCartaCobranca.QRepCartaCobranca.Preview
      else
        FRCartaCobranca.QRepCartaCobranca.Print;
    end;
  end;
  DMContasReceber.QRCartaCobranca.Close;
end;

procedure TFContasReceberCad.SbOrdemCompraClick(Sender: TObject);
begin
  inherited;
  if FOrdemCompraCons = nil then
    FOrdemCompraCons := TFOrdemCompraCons.Create(Application);
  if FOrdemCompraCons.ShowModal = mrOk then
    DMContasReceber.QContasReceber_CabCod_Ordem_Compra_Cab.Value :=
      DMOrdemCompra.QOrdemCompraConsCod_Ordem_Compra_Cab.Value;

end;

function TFContasReceberCad.RetornoErroSicredi(pOcorrencia, pMotivo : string): string;
var
  Aux: Integer;
  wS,wSMotivo : string;
begin
  ws := '';
  wSMotivo := '';
  if (pOcorrencia <> '') then
  begin
    Aux := strtoint(Trim(pOcorrencia));   //ocorrencias
    case Aux of
       2: wS := 'Entrada Confirmada';
       3: wS := 'Entrada Rejeitada';
       6: wS := 'Liquidação Normal';
       9: wS := 'Baixado automáticamente via arquivo';
      10: wS := 'Baixado conforme instruções da cooperativa de crédito';
      12: wS := 'Abatimento concedido';
      13: wS := 'Abatimento cancelado';
      14: wS := 'Vencimento alterado';
      15: wS := 'Liquidação em cartório';
      17: wS := 'Liquidação após baixa';
      19: wS := 'Confirmação de recebimento de instrução de protesto';
      20: wS := 'Confirmação de recebimento de instrução de sustação de protesto';
      23: wS := 'Entrada de título em cartório';
      24: wS := 'Entrada Rejeitada por CEP irregular';
      27: wS := 'Baixa Rejeitada';
      28: wS := 'Tarifa';
      29: wS := 'Rejeição do pagador';
      30: wS := 'Alteração rejeitada';
      32: wS := 'Instrução rejeitada';
      33: wS := 'Confirmação de pedido de alteração de outros dados';
      34: wS := 'Retirada de cartório e manutenção de carteira';
      35: wS := 'Aceite do Pagador';
    end;
  end;

  if pOcorrencia = '28' then
  begin
    if pMotivo = '3' then
      wS := wS + ' - Tarifa de sustação';
    if pMotivo = '4' then
      wS := wS + ' - Tarifa de protesto';
    if pMotivo = '8' then
      wS := wS + ' - Tarifa de custas de protesto';
  end;

  if pMotivo <> '' then
  begin
    if pMotivo = '00' then
      wSMotivo := 'Sem Motivo';
    if pMotivo = '01' then
      wSMotivo := 'Código do Banco Inválido';
    if pMotivo = '02' then
      wSMotivo := 'Código do Registro Detalhe Inválido';
    if pMotivo = '03' then
      wSMotivo := 'Código da Ocorrência Inválido';
    if pMotivo = '04' then
      wSMotivo := 'Código de Ocorrência não permitida para a Carteira';
    if pMotivo = '05' then
      wSMotivo := 'Código de Ocorrência não numérico';
    if pMotivo = '07' then
      wSMotivo := 'Agência/Conta/Dígito Inválidos';
    if pMotivo = '08' then
      wSMotivo := 'Nosso Número Inválido';
    if pMotivo = '09' then
      wSMotivo := 'Nosso Número duplicado';
    if pMotivo = '10' then
      wSMotivo := 'Carteira Inválida';
    if pMotivo = '14' then
      wSMotivo := 'Título Protestado';
    if pMotivo = '15' then
      wSMotivo := 'Carteira/Agência/Conta/Nosso Número Inválidos';
    if pMotivo = '16' then
      wSMotivo := 'Data de Vencimento Inválida';
    if pMotivo = '17' then
      wSMotivo := 'Data de Vencimento anterior à data de Emissão';
    if pMotivo = '18' then
      wSMotivo := 'Vencimento fora do prazo de operação';
    if pMotivo = '20' then
      wSMotivo := 'Valor do Título Inválido';
    if pMotivo = '21' then
      wSMotivo := 'Espécie do Título Inválida';
    if pMotivo = '22' then
      wSMotivo := 'Espécie não permitida para a Carteira';
    if pMotivo = '24' then
      wSMotivo := 'Data de Emissão Inválida';
    if pMotivo = '29' then
      wSMotivo := 'Valor do Desconto maior/igual ao valor do Título';
    if pMotivo = '31' then
      wSMotivo := 'Concessão de Desconto/existe desconto anterior';
    if pMotivo = '33' then
      wSMotivo := 'Valor do Abatimento Inválido';
    if pMotivo = '34' then
      wSMotivo := 'Valor do Abatimento maior/igual ao valor do Título';
    if pMotivo = '36' then
      wSMotivo := 'Concessão de Abatimento/existe abatimento anterior';
    if pMotivo = '38' then
      wSMotivo := 'Prazo para Protesto Inválido';
    if pMotivo = '39' then
      wSMotivo := 'Pedido para protesto não permitido para o Título';
    if pMotivo = '40' then
      wSMotivo := 'Título com ordem de protesto emitida';
    if pMotivo = '41' then
      wSMotivo := 'Pedido Cancelamento/Sustação sem Instrução de Protesto';
    if pMotivo = '44' then
      wSMotivo := 'Agência Cedente não prevista';
    if pMotivo = '45' then
      wSMotivo := 'Nome do Sacado Inválido';
    if pMotivo = '46' then
      wSMotivo := 'Tipo/Número de Inscrição do Sacado Inválidos';
    if pMotivo = '47' then
      wSMotivo := 'Endereço do sacado não Informado';
    if pMotivo = '48' then
      wSMotivo := 'CEP irregular';
    if pMotivo = '49' then
      wSMotivo := 'Número de Inscrição do Sacador/Avalista Inválido';
    if pMotivo = '50' then
      wSMotivo := 'Sacador/Avalista não Informado';
    if pMotivo = '60' then
      wSMotivo := 'Movimento para Título não cadastrado';
    if pMotivo = '63' then
      wSMotivo := 'Entrada para Título já cadastrado';

    if UpperCase(pMotivo) = ' A' then
      wSMotivo := 'Aceito';
    if UpperCase(pMotivo) = ' D' then
      wSMotivo := 'Desprezado';
    if UpperCase(pMotivo) = 'A1' then
      wSMotivo := 'Praça do Sacado não cadastrada';
    if UpperCase(pMotivo) = 'A3' then
      wSMotivo := 'Agência Depositária divergente: ATUALIZA O CADASTRO DE PRAÇAS DA AG.CEDENTE';
    if UpperCase(pMotivo) = 'A4' then
      wSMotivo := 'Cedente não cadastrado ou possui CGC/CIC Inválido';
    if UpperCase(pMotivo) = 'A5' then
      wSMotivo := 'Sacado não cadastrado';
    if UpperCase(pMotivo) = 'A6' then
      wSMotivo := 'Data da Instrução/Ocorrência Inválida';
    if UpperCase(pMotivo) = 'A8' then
      wSMotivo := 'Recebimento da Liquidação fora da rede Bansicredi/via Compensação Eletrônica';
    if UpperCase(pMotivo) = 'A9' then
      wSMotivo := 'Tarifa de Manutenção de Título Vencido';
    if UpperCase(pMotivo) = 'B1' then
      wSMotivo := 'Tarifa de Baixa da Carteira';
    if UpperCase(pMotivo) = 'B3' then
      wSMotivo := 'Tarifa de Registro de Entrada do Título';
    if UpperCase(pMotivo) = 'B4' then
      wSMotivo := 'Tipo de Moeda Inválido';
    if UpperCase(pMotivo) = 'B5' then
      wSMotivo := 'Tipo de Desconto/Juros Inválido';
    if UpperCase(pMotivo) = 'B6' then
      wSMotivo := 'Mensagem padrão não cadastrada';
    if UpperCase(pMotivo) = 'B7' then
      wSMotivo := 'Seu Número Inválido';
    if UpperCase(pMotivo) = 'B8' then
      wSMotivo := 'Percentual de multa Inválido';
    if UpperCase(pMotivo) = 'B9' then
      wSMotivo := 'Valor ou percentual de juros Inválido';
    if UpperCase(pMotivo) = 'C1' then
      wSMotivo := 'Data limite para concessão de desconto Inválida';
    if UpperCase(pMotivo) = 'C2' then
      wSMotivo := 'Aceite do Título Inválido';
    if UpperCase(pMotivo) = 'C3' then
      wSMotivo := 'Campo alterado na Instrução 31 (Alteração de Outros Dados) Inválido';
    if UpperCase(pMotivo) = 'C4' then
      wSMotivo := 'Título ainda não confirmado pela Centralizadora';
    if UpperCase(pMotivo) = 'C5' then
      wSMotivo := 'Título rejeitado pela Centralizadora';
    if UpperCase(pMotivo) = 'C6' then
      wSMotivo := 'Título já baixado';
    if UpperCase(pMotivo) = 'C7' then
      wSMotivo := 'Título já liquidado';
    if UpperCase(pMotivo) = 'C8' then
      wSMotivo := 'Existe mesma Instrução pendente de confirmação para este Título';
    if UpperCase(pMotivo) = 'C9' then
      wSMotivo := 'Instrução prévia de Concessão de Abatimento não existe ou não confirmada';
    if UpperCase(pMotivo) = 'D1' then
      wSMotivo := 'Título dentro do prazo de vencimento (em dia)';
    if UpperCase(pMotivo) = 'D2' then
      wSMotivo := 'Espécie de documento não permite protesto de Título';
    if UpperCase(pMotivo) = 'D3' then
      wSMotivo := 'Título possui instrução de baixa pendente de confirmação';
    if UpperCase(pMotivo) = 'D4' then
      wSMotivo := 'Quantidade de Mensagens Padrão excede o limite permitido';
    if UpperCase(pMotivo) = 'D5' then
      wSMotivo := 'Quantidade Inválida no Pedido de Bloquetos Pré-Impressos da Cobrança SEM Registro';
    if UpperCase(pMotivo) = 'D6' then
      wSMotivo := 'Tipo de Impressão inválida para Cobrança SEM Registro';
    if UpperCase(pMotivo) = 'D7' then
      wSMotivo := 'Cidade ou Estado do sacado não Informados';
    if UpperCase(pMotivo) = 'D8' then
      wSMotivo := 'Sequencia para composição do Nosso Número do ano atual esgotada';
    if UpperCase(pMotivo) = 'D9' then
      wSMotivo := 'Registro Mensagem (instruções para impressão no bloqueto da Cobrança SEM Registro) para Título não cadastrado';
    if UpperCase(pMotivo) = 'E2' then
      wSMotivo := 'Registro COMPLEMENTAR ao cadastro do Título da Cobrança COM Registro não Cadastrado';
    if UpperCase(pMotivo) = 'H5' then
      wSMotivo := 'Recebimento de liquidação fora da rede SICREDI/VLB Inferior/Via Compensação';
    if UpperCase(pMotivo) = 'H6' then
      wSMotivo := 'Recebimento de liquidação fora da rede SICREDI/VLB Superior/Via Compensação';
    if UpperCase(pMotivo) = 'H8' then
      wSMotivo := 'Recebimento de liquidação fora da rede SICREDI/Contigência Via Compe';
    if UpperCase(pMotivo) = 'X1' then
      wSMotivo := 'Regularização Centralizadora/Rede Bansicredi';
    if UpperCase(pMotivo) = 'X2' then
      wSMotivo := 'Regularização Centralizadora/Compensação';
    if UpperCase(pMotivo) = 'X3' then
      wSMotivo := 'Regularização Centralizadora/Banco Correspondente';
  end;
  Result := wS + ' - ' + wSMotivo;
end;

function TFContasReceberCad.RetornoErroBanco(wCodMovimento, wRejeicao: string): string;
var
  Aux: Integer;
  wS, wSR, wSL : string;
begin
  Aux := StrToInt(Trim(wCodMovimento));
    case Aux of
      02: wS := 'Entrada Confirmada - ';
      03: wS := 'Entrada Rejeitada - ';
      04: wS := 'Transferência de carteira/entrada';
      05: wS := 'Transferência de carteira/baixa';
      06: wS := 'Liquidação - ';
      09: wS := 'Baixa - ';
      11: wS := 'Títulos em carteira';
      12: wS := 'Confirmação recebimento instrução de abatimento';
      13: wS := 'Confirmação recebimento instrução de cancelamento abatimento';
      14: wS := 'Confirmação recebimento instrução de alteração de vencimento';
      17: wS := 'Liquidação após baixa, ou liquidação de título não registrado - ';
      19: wS := 'Confirmação de recebimento instrução de protesto';
      20: wS := 'Confirmação receb sustação/não protestar';
      23: wS := 'Remessa a cartório (aponte em cartório)';
      24: wS := 'Retirada de cartório e manutenção em carteira';
      25: wS := 'Pretestado e baixadao (baixa por ter sido protestado)';
      26: wS := 'Instrução rejeitada - ';
      27: wS := 'Confirmação do pedido de alteração de outros dados';
      28: wS := 'Débito de tarifas/custas';
      29: wS := 'Ocorrências do sacado';
      30: wS := 'Alteração de dados rejeitada - ';
      51: wS := 'Título DDA reconhecido pelo sacado';
      52: wS := 'Título DDA não reconhecido pelo sacado';
      53: wS := 'Título DDA recusado pela CIP';
    end;

    if Strtoint(Trim(wCodMovimento)) in [03,26,30] then
    begin
      Aux := StrToInt(Trim(wRejeicao)); //Rejeições do Registro detalhe
        case Aux of
           1: wSR := 'Código do Banco Inválido';
           2: wSR := 'Código do Registro Detalhe Inválido';
           3: wSR := 'Código do segmento inválido';
           4: wSR := 'Código do movimento não permitida para a Carteira';
           5: wSR := 'Código do movimento inválido';
           6: wSR := 'Tipo/Número de inscrição do cedente inválido';
           7: wSR := 'Agência/Conta/Dígito Verificador Inválidos';
           8: wSR := 'Nosso Número Inválido';
           9: wSR := 'Nosso Número duplicado';
          10: wSR := 'Carteira Inválida';
          11: wSR := 'cadasto do título inválido. Se desconto, titulo rejaietado';
          12: wSR := 'Tipo de documento inválido';
          13: wSR := 'Identificação da emissão do boleto inválido';
          14: wSR := 'Identificação da distribuição do boleto inválido';
          15: wSR := 'Carteira/Agência/Conta/Nosso Número Inválidos';
          16: wSR := 'Data de Vencimento Inválida';
          17: wSR := 'Data de Vencimento anterior à data de Emissão';
          18: wSR := 'Vencimento fora do prazo de operação';
          19: wSR := 'ítulo a cargo de bancos correspondentes com vencimento inferior a XX dias';
          20: wSR := 'Valor do Título Inválido';
          21: wSR := 'Espécie do Título Inválida';
          22: wSR := 'Espécie não permitida para a Carteira';
          23: wSR := 'Aceite inválido';
          24: wSR := 'Data de Emissão Inválida';
          25: wSR := 'Data de emissão posterior a data de entrada';
          26: wSR := 'Código de juros de mora inválido';
          27: wSR := 'Valor/Taxa de juros de mora inválida';
          28: wSR := 'Código do desconto inválido';
          29: wSR := 'Valor do Desconto maior/igual ao valor do Título';
          30: wSR := 'Desconto a conceder não confere';
          31: wSR := 'Concessão de Desconto - já existe desconto anterior';
          32: wSR := 'Valor do IOF';
          33: wSR := 'Valor do Abatimento Inválido';
          34: wSR := 'Valor do Abatimento maior/igual ao valor do Título';
          35: wSR := 'Abatimento a conceder não confere';
          36: wSR := 'Concessão de Abatimento já existe abatimento anterior';
          37: wSR := 'Código para protesto inválido';
          38: wSR := 'Prazo para Protesto Inválido';
          39: wSR := 'Pedido para protesto não permitido para o Título';
          40: wSR := 'Título com ordem de protesto emitida';
          41: wSR := 'Pedido Cancelamento/Sustação para titulo sem Instrução de Protesto';
          42: wSR := 'Código para baixa/devolução inválido';
          43: wSR := 'Prazo para baixa/devolução inválido';
          44: wSR := 'Código de moeda inválido';
          45: wSR := 'Nome do Sacado não informado';
          46: wSR := 'Tipo/Número de Inscrição do Sacado Inválidos';
          47: wSR := 'Endereço do sacado não Informado';
          48: wSR := 'CEP irregular';
          49: wSR := 'CEP sem praça de cobrança (não localizado)';
          50: wSR := 'CEP referente a um banco correspondente';
          51: wSR := 'CEP incompatível com a unidade de federação';
          52: wSR := 'Unidade de federação inválida';
          53: wSR := 'Tipo/Número de inscrição do sacado/avalista inválido';
          54: wSR := 'Sacado/Avalista não informado';
          55: wSR := 'Nosso número do banco correspondente não informado';
          56: wSR := 'Código do banco correspondente não informado';
          57: wSR := 'Código da multa inválido';
          58: wSR := 'Data da multa inválida';
          59: wSR := 'Valor/Percentual da multa inválida';
          60: wSR := 'Movimento para Título não cadastrado';
          61: wSR := 'Alteração da agência cobradora/dv inválida';
          62: wSR := 'Tipo de impresão inválida';
          63: wSR := 'Entrada para título já cadastrado';
          64: wSR := 'Número da linha inválida';
        end;
    end
    else if Strtoint(Trim(wCodMovimento)) in [06,09,17] then
    begin
        Aux := StrToInt(Trim(wRejeicao)); //Rejeições do Registro detalhe
        case Aux of
          1:  wSL := 'Liquidação por saldo';
          2:  wSL := 'Liquidação por conta';
          3:  wSL := 'Liquidação no próprio banco';
          4:  wSL := 'Liquidação Compensação eletrônica';
          5:  wSL := 'Liquidação Compensação convencional';
          6:  wSL := 'Liquidação arquivo magnético';
          7:  wSL := 'Liquidação após feriado local';
          8:  wSL := 'Liquidação em cartório';
          9:  wSL := 'Baixa comandada banco';
          10: wSL := 'Baixa comandada cliente arquivo';
          11: wSL := 'Baixa comandada cliente on-line';
          12: wSL := 'Baixa decurso prazo-cliente';
          13: wSL := 'Baixa decurso prazo-banco';
          00: wSL := 'Sem rejeição';
        end;
    end;
  Result := wS + wSR + wSL;
end;

function TFContasReceberCad.RetornaErroBradesco(wstrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código da ocorrência inválida';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de ocorrência não numérico';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Dublicado';
    10: wstrS := 'Carteira Inválida';
    15: wstrS := 'Carteira/Agência/Conta/Nosso Número Inválidos';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie não permitida para a carteira';
    24: wstrS := 'Data de emissão Inválida';
    28: wstrS := 'Código de desconto via Telebradesco Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução via Telebradesco inválido';
    44: wstrS := 'Agência Cedente não prevista';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    50: wstrS := 'CEP irregular - Banco Correspondente';
    53: wstrS := 'Tipo de inscrição do sacador avalista inválidos';
    60: wstrS := 'Movimento para Título não cadastrado';
    63: wstrS := 'Entrada para Título já cadastrado';
    68: wstrS := 'Débito não agendado - erro nos dados de remessa';
    69: wstrS :=
      'Débito não agendado - Sacado não consta no cadastro de autorizante';
    70: wstrS := 'Débito não agendado - Cedente não autorizado pelo Sacado';
    71: wstrS :=
      'Débito não agendado - Cedente não participa da modalidade de débito automático';
    72: wstrS := 'Débito não agendado - Código de moeda diferente de R$';
    73: wstrS := 'Débito não agendado - Data de vencimento inválida';
    74: wstrS :=
      'Débito não agendado - Conforme seu pedido. Título não registrado';
    75: wstrS :=
      'Débito não agendado - Tipo de número de inscrição do debitado inválido';
    77: wstrS := 'Transferência para desconto não permitido para a carteira';
    85: wstrS := 'Título com pagamento vinculado';
    86: wstrS := 'Seu número inválido';
  end;
  Result := (wstrS);
end;

function TFContasReceberCad.RetornaErroBBSicoob(wCodOcorrencia, wRejeicao: string): string;
var
  Aux: Integer;
  wS, wSR, wSL : string;
begin
  Aux := StrToInt(Trim(wCodOcorrencia));
    case Aux of
      02: wS := 'Entrada Confirmada';
      03: wS := 'Entrada Rejeitada - ';
      04: wS := 'Transferência de carteira/entrada';
      05: wS := 'Transferência de carteira/baixa';
      06: wS := 'Liquidação - ';
      09: wS := 'Baixa - ';
      11: wS := 'Títulos em carteira';
      12: wS := 'Confirmação recebimento instrução de abatimento';
      13: wS := 'Confirmação recebimento instrução de cancelamento abatimento';
      14: wS := 'Confirmação recebimento instrução de alteração de vencimento';
      17: wS := 'Liquidação após baixa, ou liquidação de título não registrado - ';
      19: wS := 'Confirmação de recebimento instrução de protesto';
      20: wS := 'Confirmação receb sustação/não protestar';
      23: wS := 'Remessa a cartório (aponte em cartório)';
      24: wS := 'Retirada de cartório e manutenção em carteira';
      25: wS := 'Pretestado e baixadao (baixa por ter sido protestado)';
      26: wS := 'Instrução rejeitada - ';
      27: wS := 'Confirmação do pedido de alteração de outros dados';
      28: wS := 'Débito de tarifas/custas';
      29: wS := 'Ocorrências do sacado';
      30: wS := 'Alteração de dados rejeitada - ';
      51: wS := 'Título DDA reconhecido pelo sacado';
      52: wS := 'Título DDA não reconhecido pelo sacado';
      53: wS := 'Título DDA recusado pela CIP';
    end;

    if Strtoint(Trim(wCodOcorrencia)) in [03,26,30] then
    begin
      Aux := StrToInt(Trim(wRejeicao)); //Rejeições do Registro detalhe
        case Aux of
           1: wSR := 'Código do Banco Inválido';
           2: wSR := 'Código do Registro Detalhe Inválido';
           3: wSR := 'Código do segmento inválido';
           4: wSR := 'Código do movimento não permitida para a Carteira';
           5: wSR := 'Código do movimento inválido';
           6: wSR := 'Tipo/Número de inscrição do cedente inválido';
           7: wSR := 'Agência/Conta/Dígito Verificador Inválidos';
           8: wSR := 'Nosso Número Inválido';
           9: wSR := 'Nosso Número duplicado';
          10: wSR := 'Carteira Inválida';
          11: wSR := 'cadasto do título inválido. Se desconto, titulo rejaietado';
          12: wSR := 'Tipo de documento inválido';
          13: wSR := 'Identificação da emissão do boleto inválido';
          14: wSR := 'Identificação da distribuição do boleto inválido';
          15: wSR := 'Carteira/Agência/Conta/Nosso Número Inválidos';
          16: wSR := 'Data de Vencimento Inválida';
          17: wSR := 'Data de Vencimento anterior à data de Emissão';
          18: wSR := 'Vencimento fora do prazo de operação';
          19: wSR := 'ítulo a cargo de bancos correspondentes com vencimento inferior a XX dias';
          20: wSR := 'Valor do Título Inválido';
          21: wSR := 'Espécie do Título Inválida';
          22: wSR := 'Espécie não permitida para a Carteira';
          23: wSR := 'Aceite inválido';
          24: wSR := 'Data de Emissão Inválida';
          25: wSR := 'Data de emissão posterior a data de entrada';
          26: wSR := 'Código de juros de mora inválido';
          27: wSR := 'Valor/Taxa de juros de mora inválida';
          28: wSR := 'Código do desconto inválido';
          29: wSR := 'Valor do Desconto maior/igual ao valor do Título';
          30: wSR := 'Desconto a conceder não confere';
          31: wSR := 'Concessão de Desconto - já existe desconto anterior';
          32: wSR := 'Valor do IOF';
          33: wSR := 'Valor do Abatimento Inválido';
          34: wSR := 'Valor do Abatimento maior/igual ao valor do Título';
          35: wSR := 'Abatimento a conceder não confere';
          36: wSR := 'Concessão de Abatimento já existe abatimento anterior';
          37: wSR := 'Código para protesto inválido';
          38: wSR := 'Prazo para Protesto Inválido';
          39: wSR := 'Pedido para protesto não permitido para o Título';
          40: wSR := 'Título com ordem de protesto emitida';
          41: wSR := 'Pedido Cancelamento/Sustação para titulo sem Instrução de Protesto';
          42: wSR := 'Código para baixa/devolução inválido';
          43: wSR := 'Prazo para baixa/devolução inválido';
          44: wSR := 'Código de moeda inválido';
          45: wSR := 'Nome do Sacado não informado';
          46: wSR := 'Tipo/Número de Inscrição do Sacado Inválidos';
          47: wSR := 'Endereço do sacado não Informado';
          48: wSR := 'CEP irregular';
          49: wSR := 'CEP sem praça de cobrança (não localizado)';
          50: wSR := 'CEP referente a um banco correspondente';
          51: wSR := 'CEP incompatível com a unidade de federação';
          52: wSR := 'Unidade de federação inválida';
          53: wSR := 'Tipo/Número de inscrição do sacado/avalista inválido';
          54: wSR := 'Sacado/Avalista não informado';
          55: wSR := 'Nosso número do banco correspondente não informado';
          56: wSR := 'Código do banco correspondente não informado';
          57: wSR := 'Código da multa inválido';
          58: wSR := 'Data da multa inválida';
          59: wSR := 'Valor/Percentual da multa inválida';
          60: wSR := 'Movimento para Título não cadastrado';
          61: wSR := 'Alteração da agência cobradora/dv inválida';
          62: wSR := 'Tipo de impresão inválida';
          63: wSR := 'Entrada para título já cadastrado';
          64: wSR := 'Número da linha inválida';
          65: wSR := 'Código do banco para débito inválido';
          66: wSR := 'Agência/conta/dv para débito inválido';
          67: wSR := 'Dados para débito incompatível com a ident. emissão do boleto.';
          88: wSR := 'Arquivo em duplicidade';
          99: wSR := 'Contrato inesistente';
        end;
    end
    else if Strtoint(Trim(wCodOcorrencia)) in [28] then
    begin
        Aux := StrToInt(Trim(wRejeicao)); //Rejeições do Registro detalhe
        case Aux of
          1:  wSL := 'Tarifa de extrato de posição';
          2:  wSL := 'Tarifa de manutenção de título vencido';
          3:  wSL := 'Tarifa de sustação';
          4:  wSL := 'Tarifa de protesto';
          5:  wSL := 'Tarifa de outras instruções';
          6:  wSL := 'Tarifa de outras ocorrências';
          7:  wSL := 'Tarifa de envio de duplicata de pagamento';
          8:  wSL := 'Custas de protesto';
          9:  wSL := 'Custas de sustação de protesto';
          10: wSL := 'Custas de cartório distribuidor';
          11: wSL := 'Custas de edital';
          00: wSL := 'Sem rejeição';
        end;
    end;
  Result := wS + wSR + wSL;
end;

procedure TFContasReceberCad.TtulosporFinalidade1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
  begin
    FContasReceberParam := TFContasReceberParam.Create(Application);
    FContasReceberParam.ME21DtBase.Text := DateToStr(Date);
  end;
  FContasReceberParam.PGRelatorio.Pages[21].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.ME21DtInicio.Text) = '') or
      (Trim(FContasReceberParam.ME21DtFim.Text) = '') then
      raise Exception.Create('Informar o Período');
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME21CodFilial.Text),
      'CONTAS A RECEBER');
    if FContasReceberParam.RG21Tipo.ItemIndex = 0 then
    Begin
      with DMContasReceber do
      begin
        QRContasReceber_Finalidade.Close;

        if Trim(FContasReceberParam.ME21CodFilial.Text) <> '' then
          QRContasReceber_Finalidade.SetVariable('FILIAL',
            Trim(FContasReceberParam.ME21CodFilial.Text))
        else
          QRContasReceber_Finalidade.SetVariable('FILIAL', null);

        {if Trim(FContasReceberParam.Me21CodFinalidade.Text) <> '' then
          QRContasReceber_Finalidade.SetVariable('FINALIDADE',
            Trim(FContasReceberParam.Me21CodFinalidade.Text))
        else
          QRContasReceber_Finalidade.SetVariable('FINALIDADE', null);}

        if Trim(FContasReceberParam.Me21Finalidade.Text) = 'VÁRIOS' then
          QRContasReceber_Finalidade.SetVariable('FINALIDADES', 'CRC.COD_FINALIDADE IN (' + Trim(FContasReceberParam.Me21CodFinalidade.Text) + ')')
        else
        begin
          QRContasReceber_Finalidade.SetVariable('FINALIDADES', '1=1');
          if Trim(FContasReceberParam.Me21CodFinalidade.Text) <> '' then
            QRContasReceber_Finalidade.SetVariable('FINALIDADE', Trim(FContasReceberParam.Me21CodFinalidade.Text));
        end;

        QRContasReceber_Finalidade.SetVariable('DT_INICIAL',
          Trim(FContasReceberParam.ME21DtInicio.Text));
        QRContasReceber_Finalidade.SetVariable('DT_FINAL',
          Trim(FContasReceberParam.ME21DtFim.Text) + ' 23:59:59');

        DMContasReceber.pDataBase :=
          StrToDate(FContasReceberParam.ME21DtBase.Text);
        QRContasReceber_Finalidade.Open;

        if FRContasReceber_Finalidade = nil then
          FRContasReceber_Finalidade :=
            TFRContasReceber_Finalidade.Create(Application);
        FRContasReceber_Finalidade.QRLbFilial.Caption := 'Filial: ' +
          Trim(FContasReceberParam.Me21CodFilial.Text) +
          Trim(FContasReceberParam.Me21Filial.Text);
        FRContasReceber_Finalidade.QRLbPeriodo.Caption := 'Período de ' +
          FContasReceberParam.Me21DtInicio.Text + ' Até ' +
          FContasReceberParam.Me21DtFim.Text + ' Data base: ' +
          FContasReceberParam.Me21DtBase.Text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRContasReceber_Finalidade.QRPrimario.Preview
        else
          FRContasReceber_Finalidade.QRPrimario.Print;
        QRContasReceber_Finalidade.Close;
      end;
    end
    else
    if FContasReceberParam.RG21Tipo.ItemIndex = 1 then //analitico
    Begin
     with DMContasReceber do
      begin
        QRTitulos_Finalidade_Analitico.Close;

        if Trim(FContasReceberParam.ME21CodFilial.Text) <> '' then
          QRTitulos_Finalidade_Analitico.SetVariable('FILIAL',Trim(FContasReceberParam.ME21CodFilial.Text))
        else
          QRTitulos_Finalidade_Analitico.SetVariable('FILIAL', null);

        if Trim(FContasReceberParam.Me21Finalidade.Text) = 'VÁRIOS' then
          QRTitulos_Finalidade_Analitico.SetVariable('FINALIDADES', 'CRC.COD_FINALIDADE IN (' + Trim(FContasReceberParam.Me21CodFinalidade.Text) + ')')
        else
        begin
          QRTitulos_Finalidade_Analitico.SetVariable('FINALIDADES', '1=1');
          if Trim(FContasReceberParam.Me21CodFinalidade.Text) <> '' then
            QRTitulos_Finalidade_Analitico.SetVariable('FINALIDADE', Trim(FContasReceberParam.Me21CodFinalidade.Text));
        end;

        QRTitulos_Finalidade_Analitico.SetVariable('DT_INICIAL',
          Trim(FContasReceberParam.ME21DtInicio.Text));
        QRTitulos_Finalidade_Analitico.SetVariable('DT_FINAL',
          Trim(FContasReceberParam.ME21DtFim.Text) + ' 23:59:59');

        QRTitulos_Finalidade_Analitico.Open;

        if FRTitulosFinalidadeAnalitico = nil then
          FRTitulosFinalidadeAnalitico :=
            TFRTitulosFinalidadeAnalitico.Create(Application);
        FRTitulosFinalidadeAnalitico.QRLFilial.Caption := 'Filial: ' + Trim(FContasReceberParam.Me21CodFilial.Text) +
          Trim(FContasReceberParam.Me21Filial.Text);
        FRTitulosFinalidadeAnalitico.QRLPeriodo.Caption := 'Período de ' +
          FContasReceberParam.Me21DtInicio.Text + ' Até ' + FContasReceberParam.Me21DtFim.Text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRTitulosFinalidadeAnalitico.QRPrimario.Preview
        else
          FRTitulosFinalidadeAnalitico.QRPrimario.Print;
        QRTitulos_Finalidade_Analitico.Close;
      end;
    end;
  end;
end;

procedure TFContasReceberCad.TtulospDtEmisso1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[22].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.ME22DtInicio.Text) = '') or
      (Trim(FContasReceberParam.ME22DtFim.Text) = '') then
      raise Exception.Create('Informar o Período');
    //if (Trim(FContasReceberParam.ME22CodFinalidade.Text) = '') then
      //raise Exception.Create('Informe uma Finalidade');
    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME21CodFilial.Text),
      'CONTAS A RECEBER');

    with DMContasReceber do
    begin
      QRTituloEmissao.Close;

      if Trim(FContasReceberParam.ME22CodFilial.Text) <> '' then
        QRTituloEmissao.SetVariable('FILIAL',
          Trim(FContasReceberParam.ME22CodFilial.Text))
      else
        QRTituloEmissao.SetVariable('FILIAL', null);

      if Trim(FContasReceberParam.Me22CodFinalidade.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_FINALIDADE',
          Trim(FContasReceberParam.Me22CodFinalidade.Text))
      else
        QRTituloEmissao.SetVariable('COD_FINALIDADE', null);

      if Trim(FContasReceberParam.ME22CodBanco.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_BANCO_AGENCIA',
          Trim(FContasReceberParam.ME22CodBanco.Text))
      else
        QRTituloEmissao.SetVariable('COD_BANCO_AGENCIA', null);

      if Trim(FContasReceberParam.Fm22Departamento.MeDepartamento.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_DEPARTAMENTO',
          Trim(FContasReceberParam.Fm22Departamento.MeDepartamento.Text))
      else
        QRTituloEmissao.SetVariable('COD_DEPARTAMENTO', null);

      if Trim(FContasReceberParam.Fm22Vendedor.MeVendedor.Text) <> '' then
        QRTituloEmissao.SetVariable('COD_VENDEDOR',
          Trim(FContasReceberParam.Fm22Vendedor.MeVendedor.Text))
      else
        QRTituloEmissao.SetVariable('COD_VENDEDOR', null);

      QRTituloEmissao.SetVariable('DATA_I',
        Trim(FContasReceberParam.ME22DtInicio.Text));
      QRTituloEmissao.SetVariable('DATA_F',
        Trim(FContasReceberParam.ME22DtFim.Text) + ' 23:59:59');

      if FContasReceberParam.Rg22remessa.ItemIndex = 0 then
      begin
        QRTituloEmissao.SetVariable('IND_REMESSA', 'SIM');
      if FContasReceberParam.Rg22remessa.ItemIndex = 1 then
        QRTituloEmissao.SetVariable('IND_REMESSA', 'NAO');
      end
      else
        QRTituloEmissao.SetVariable('IND_REMESSA', null);

      if FContasReceberParam.RG22ComBoleto.ItemIndex = 0 then
        QRTituloEmissao.SetVariable('NOSSO_NUMERO', 'TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NOT NULL');
      if FContasReceberParam.RG22ComBoleto.ItemIndex = 1 then
        QRTituloEmissao.SetVariable('NOSSO_NUMERO', 'TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO IS NULL');
      if FContasReceberParam.RG22ComBoleto.ItemIndex = 2 then
        QRTituloEmissao.SetVariable('NOSSO_NUMERO', '1=1');

      case FContasReceberParam.RG22Situacao.ItemIndex of
        0: QRTituloEmissao.SetVariable('SITUACAO', 'ABERTO');
        1: QRTituloEmissao.SetVariable('SITUACAO', 'BAIXA_PARCIAL');
        2: QRTituloEmissao.SetVariable('SITUACAO', 'BAIXA_TOTAL');
        3: QRTituloEmissao.SetVariable('SITUACAO', null);
      end;

      QRTituloEmissao.SQL[QRTituloEmissao.SQL.Count - 1] := '';
      case FContasReceberParam.RG22Ordem.ItemIndex of
        0: DMContasReceber.QRTituloEmissao.SQL.Add('TB_VENDEDOR.NOME,NUM_TITULO,DT_EMISSAO');
        1: DMContasReceber.QRTituloEmissao.SQL.Add('TB_CONTA_RECEBER_CAB.DT_EMISSAO');
        2: DMContasReceber.QRTituloEmissao.SQL.Add('TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        3: DMContasReceber.QRTituloEmissao.SQL.Add('TB_CADASTRO.NOME');
        4: DMContasReceber.QRTituloEmissao.SQL.Add('TB_CONTA_RECEBER_CAB.NUM_TITULO');
      end;

      QRTituloEmissao.Open;

      if FRTitulosEmissao = nil then
        FRTitulosEmissao := TFRTitulosEmissao.Create(Application);
      FRTitulosEmissao.QRLFilial.Caption :=
        Trim(FContasReceberParam.Me22CodFilial.Text) + ' - ' +
        Trim(FContasReceberParam.Me22Filial.Text);
      FRTitulosEmissao.QRLPeriodo.Caption := 'Período de ' +
        FContasReceberParam.Me22DtInicio.Text + ' Até ' +
        FContasReceberParam.Me22DtFim.Text;
      FRTitulosEmissao.QRLFinalidade.Caption :=
        Trim(FContasReceberParam.Me22CodFinalidade.Text) + ' - ' +
        Trim(FContasReceberParam.Me22Finalidade.Text);

      FRTitulosEmissao.QRLBanco.Caption :=
        Trim(FContasReceberParam.ME22CodBanco.Text) + ' - ' +
        Trim(FContasReceberParam.ME22Banco.Text);

      if FContasReceberParam.Rg22remessa.ItemIndex = 0 then
        FRTitulosEmissao.qrremessa.caption := 'Remessa enviada a Banco.';
      if FContasReceberParam.Rg22remessa.ItemIndex = 1 then
        FRTitulosEmissao.qrremessa.caption := 'Remessa não enviada a Banco.';
      if FContasReceberParam.Rg22remessa.ItemIndex = 2 then
        FRTitulosEmissao.qrremessa.caption := 'Títulos com/sem Boleto.';

      if FContasReceberParam.RG22ComBoleto.ItemIndex = 0 then
        FRTitulosEmissao.qrboleto.caption := 'Títulos com Boleto.';
      if FContasReceberParam.RG22ComBoleto.ItemIndex = 1 then
        FRTitulosEmissao.qrboleto.caption := 'Títulos sem Boleto.';
      if FContasReceberParam.RG22ComBoleto.ItemIndex = 2 then
        FRTitulosEmissao.qrboleto.caption := 'Títulos com/sem Remessa.';

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRTitulosEmissao.QRPrimario.Preview
      else
        FRTitulosEmissao.QRPrimario.Print;
      QRTituloEmissao.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ReciboComissao1Click(Sender: TObject);
var
  wQBVendedor: Integer;
  wVal_Comissao: Real;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[12].TabVisible := True;
  FContasReceberParam.Rg12TipoRelatorio.Visible := False;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME12CodFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRComissao.Close;
      if Trim(FContasReceberParam.ME12CodFilial.Text) <> '' then
        QRComissao.SetVariable('FILIAL', FContasReceberParam.ME12CodFilial.Text)
      else
        QRComissao.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.Me12TipoDocumento.Text) <> '' then
        QRComissao.SetVariable('COD_SERIE',
          FContasReceberParam.Me12TipoDocumento.Text)
      else
        QRComissao.SetVariable('COD_SERIE', Null);
      if Trim(FContasReceberParam.ME12CodVendedor.Text) <> '' then
        QRComissao.SetVariable('VENDEDOR',
          FContasReceberParam.ME12CodVendedor.Text)
      else
        QRComissao.SetVariable('VENDEDOR', Null);

      if Trim(FContasReceberParam.ME12DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_I', FContasReceberParam.ME12DTInicial.text);

      if Trim(FContasReceberParam.ME12DtFinal.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissao.SetVariable('DATA_F', FContasReceberParam.ME12DtFinal.text + ' 23:59:59');

      if Trim(FContasReceberParam.ME12DtEmissao.text) = '' then
        raise
          Exception.Create('Campo Data Início Calculo Comissões Deve Ser Informado');
      if Trim(FContasReceberParam.ME12DtVencto.Text) = '' then
        QRComissao.SetVariable('DT_VENCTO', Null)
      else
        QRComissao.SetVariable('DT_VENCTO',
          StrToDate(Trim(FContasReceberParam.ME12DtVencto.Text)));
      QRComissao.SetVariable('DT_EMISSAO',
        FContasReceberParam.ME12DtEmissao.text);
      if Trim(FContasReceberParam.ME12DtEmissaoFinal.text) = '' then
        raise
          Exception.Create('Campo Data Final Calculo Comissões Deve Ser Informado')
      else
        QRComissao.SetVariable('DT_EMISSAO_FINAL',
          FContasReceberParam.ME12DtEmissaoFinal.text);
      if DMParamSistema.CodEmpresa = 'ZADIMEL' then
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '3')
          //paga comissao tambem para notas com cheque
      else
        QRComissao.SetVariable('IND_CONDICAO_PAGTO', '0');
      if FReciboComissao = nil then
        FReciboComissao := TFReciboComissao.create(Application);
      QRComissao.Open;
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',
        StrToInt(Trim(FContasReceberParam.ME12CodFilial.Text)));
      DMFilial.QFilial.Open;
      wQBVendedor := Trunc(QRComissaoCod_Vendedor.Value);
      wVal_Comissao := 0;
      while not (QRComissao.Eof) do
      begin
        if QRComissaoCod_Vendedor.Value <> wQBVendedor then
        begin
          Imprime_Comissao(wQBVendedor, wVal_Comissao);
          wQBVendedor := Trunc(QRComissaoCod_Vendedor.Value);
          wVal_Comissao := 0;
        end;
        wVal_Comissao := wVal_Comissao + QRComissaoVal_Comissao.Value;
        QRComissao.Next;
      end;
      Imprime_Comissao(wQBVendedor, wVal_Comissao);
      // este serve para o ultimo vendedor
      QRComissao.Close;
    end;
  end;
end;

procedure TFContasReceberCad.Imprime_Comissao(wVendedor: Integer; wComissao:
  Real);
var
  wIRRF, wVal_Liquido: Real;
begin
  DMVendedor.QVendedor.Close;
  DMVendedor.QVendedor.SetVariable('Pk', wVendedor);
  DMVendedor.QVendedor.Open;
  with FReciboComissao do
  begin
    QRLCodigoVendedor.Caption := IntToStr(wVendedor);
    QRLNomeVendedor.Caption := DMVendedor.QVendedorNome.Value;
    QRLEndereco.Caption := DMVendedor.QVendedorDESC_ENDERECO.Value;
    QRLCep.Caption := DMVendedor.QVendedorDESC_CEP.Value;
    QRLCidade.Caption := DMVendedor.QVendedorDESC_CIDADE.Value;
    QRLEstado.Caption := DMVendedor.QVendedorCOD_ESTADO.Value;
    QRLCnpj.Caption := DMVendedor.QVendedorDESC_CPF.Value;
    QRLFone.Caption := DMVendedor.QVendedorDESC_TELEFONE.Value;
    QRLComissao.Caption := Bib.NumToTexto(wComissao, 2, 13);
    wIRRF := 0;
    if Trim(FContasReceberParam.Me12TipoDocumento.Text) <> 'PE' then
    begin
      if DMVendedor.QVendedorPerc_Irrf.Value <> 0 then
        wIrrf := wComissao * DMVendedor.QVendedorPerc_Irrf.Value / 100;
      if wIrrf <= 10 then
        wIrrf := 0;
    end;
    QRLIrrf.Caption := Bib.NumToTexto(wIrrf, 2, 13);
    wVal_Liquido := wComissao - wIrrf;
    QRLValLiquido.Caption := Bib.NumToTexto(wVal_Liquido, 2, 13);
    QRLExtenso.Caption := Bib.extenso(wVal_Liquido, 'REAL');
    QRLDescFilial.Caption := FContasReceberParam.ME12Filial.Text;
    QRLHistorico.Caption := 'RECEBIMENTO DE COMISSAO REF ' +
      Copy(FContasReceberParam.ME12DtFinal.text, 4, 7);
    QRLDescCidade.Caption := DMFilial.QFilialDesc_Cidade.Text;
    QRLVendedor.Caption := DMVendedor.QVendedorNome.Value;
    QRLData.Caption := FormatDateTime('dd", de" mmmm "de" yyyy"."',
      StrToDate(FContasReceberParam.ME12DtFinal.text));
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FReciboComissao.QRPrimario.Preview
    else
      FReciboComissao.QRPrimario.Print;
  end;
end;

procedure TFContasReceberCad.RelatoSerasa1Click(Sender: TObject);
var
  mTipoInscricao, mNUM_CEDENTE: string;
  mCodNossoNumero, mBrancos, S: string;
  x, mSequencial: Integer;
  mSEQ_REMESSA: Real;
  F: TextFile;
begin
  inherited; // Rotina para banco Rural
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
//    Não é mais informada Filial para gerar arquivo remessa.
//    DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME17CodFilial.text),
//      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRemessa.Close;
//      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
//        QRemessa.SetVariable('COD_FILIAL',
//          FContasReceberParam.ME17CodFilial.text)
//      else
//        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.Text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.Fm17Datas.MeDtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.Fm17Datas.MeDtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.Fm17Datas.MeDtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.Fm17Datas.MeDtFinal.text + ' 23:59:59')
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Fm17TituloInicial.MeContasReceber.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Fm17TituloInicial.MeContasReceber.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      if Trim(FContasReceberParam.Fm17TituloFinal.MeContasReceber.Text) <> '' then
        QRemessa.SetVariable('NUM_TITULO_FINAL', FContasReceberParam.Fm17TituloFinal.MeContasReceber.text)
      else
        QRemessa.SetVariable('NUM_TITULO_FINAL', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if QRemessa.RecordCount > 0 then
      begin
        try
          // REGISTRO HEADER ARQUIVO REMESSA

          mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_BCO_RURAL');

          mBrancos := '';
          for x := 1 to 279 do
          begin
            mBrancos := mBrancos + ' ';
          end;

          S := ''; // Inicia variavel.
          S := S + '09REMESSA01COBRANCA       ' +
            RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
            RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Value, 10) +
            '      ' +
            FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
            RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
            '453RURAL                         ' +
            'CD0V01' +
            mBrancos +
            '000001' + Chr(13) + Chr(10);

          // REGISTRO DETALHE ARQUIVO REMESSA

          mSequencial := 2; { 1=Registro HEADER }
          while not QRemessa.Eof do
          begin

            if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'F' then
              // Pessoa fisica
              mTipoInscricao := '01' // CPF
            else
              mTipoInscricao := '02'; // CNPJ

            mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;

            { Número da sequencia segundo layout DETALHE }
            S := S + '1' +
              '                ' +
              {04-17}RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
              RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.text, 10) +
              {32-33}'05' +
            {34-35}'00' +
            {36-37}'2' +
              '4' +
              {38-62}RMaskCGC_CPF(QRemessaCOD_CONTA_RECEBER_CAB.Text +
              QRemessaNUM_TITULO.Text, 25) +
              RMaskCGC_CPF(mCodNossoNumero, 8) +
              {71-80}RMaskCGC_CPF(QRemessaCOD_CONVENIO_CUSTODIA.Text, 10) +
            {81-82}'  ' +
              mTipoInscricao +
              RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14) +
              '         ' +
              '2' +
              '01' +
              {111-120}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
            {121-126}formatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value) +
            {127-139}StrZero(QRemessaVAL_TITULO.Value, 13, 2) +
              '0000000' +
              ' ' +
              '01A' +
              {151-156}formatDateTime('ddmmyy', QRemessaDT_EMISSAO.Value) +
            {157-160}'0000';
            {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
            else
              S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
            {174-179}S := S + '      ' +
            {180-192}'0000000000000' +
            {193-205}'0000000000000' +
            {206-218}'0000000000000' +
            {206-218}mTipoInscricao +
              RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaNOME.Text))) +
              FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
              '            ' + // NÃO SEI O QUE VAI AQUI
              RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              FormatMaskText('CCCCCCCCCCCCCCC',
              UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
              FormatMaskText('CC', UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text))
              +
              '1' +
              '                                          ' +
              RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
            mSequencial := mSequencial + 1;
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            //--------- registro mensagem ----------------------\\
            mBrancos := '';
            for x := 1 to 193 do
            begin
              mBrancos := mBrancos + ' '; // Usado anteriormente também.
            end;
            S := S + '2' +
              'PROTESTAR NO 5 (QUINTO) DIA APOS O VENCIMENTO.    ' +
              '                                                  ' +
              '                                                  ' +
              '                                                  ' +
              mbrancos +
              RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
            //--------- final registro mensagem ----------------------\\
            QRemessa.Next;
          end; // fim do while --final registro detalhe

          // -------------  Inicio Registro Trailler -------------- \\
          mBrancos := '';
          for x := 1 to 393 do
          begin
            mBrancos := mBrancos + ' '; // Usado anteriormente também.
          end;
          S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
          // +Chr(13)+Chr(10);

        //------------------ Fim --------------------------\\

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA-RURAL Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA-RURAL não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.EmissoCarn1Click(Sender: TObject);
//var
//  wCont: Integer;
//  wTotal, wComando: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[23].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if CarneImp = nil then
      CarneImp := TCarneImp.Create;

    if (DMParamSistema.CodEmpresa = 'RADIO') then
      CarneImp.CarneRadio(Trim(FContasReceberParam.ME23Filial.Text),
        Trim(FContasReceberParam.Me23Cliente.Text),
        Trim(FContasReceberParam.ME23Titulo.Text),
        Trim(FContasReceberParam.ME23Parcela.Text));

    if (DMParamSistema.CodEmpresa = 'ENCOPEL') then
      CarneImp.CarneEncopel(Trim(FContasReceberParam.ME23Filial.Text),
        Trim(FContasReceberParam.Me23Cliente.Text),
        Trim(FContasReceberParam.ME23Titulo.Text),
        Trim(FContasReceberParam.ME23Parcela.Text));
//
//  if FContasReceberParam = nil then
//    FContasReceberParam := TFContasReceberParam.Create(Application);
//  FContasReceberParam.PGRelatorio.Pages[23].TabVisible := True;
//  if FContasReceberParam.ShowModal = mrOk then
//
//    with DMContasReceber do
//    begin
//      QEmissaoCarne.close;
//
//      if Trim(FContasReceberParam.ME23Filial.Text) <> '' then
//        QEmissaoCarne.SetVariable('FILIAL',
//          Trim(FContasReceberParam.ME23Filial.Text))
//      else
//        QEmissaoCarne.SetVariable('FILIAL', null);
//
//      if Trim(FContasReceberParam.Me23Cliente.Text) <> '' then
//        QEmissaoCarne.SetVariable('CADASTRO',
//          Trim(FContasReceberParam.Me23Cliente.Text))
//      else
//        QEmissaoCarne.SetVariable('CADASTRO', null);
//
//      if Trim(FContasReceberParam.ME23Titulo.Text) <> '' then
//        QEmissaoCarne.SetVariable('TITULO',
//          Trim(FContasReceberParam.ME23Titulo.Text))
//      else
//        QEmissaoCarne.SetVariable('TITULO', null);
//
//      if Trim(FContasReceberParam.ME23Parcela.Text) <> '' then
//        QEmissaoCarne.SetVariable('PARCELA',
//          Trim(FContasReceberParam.ME23Parcela.Text))
//      else
//        QEmissaoCarne.SetVariable('PARCELA', null);
//
//      QEmissaoCarne.open;
//
//      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'RADIO') then
//      begin
//        if QEmissaoCarneCOD_CADASTRO.Text = '' then
//          raise Exception.Create('Nenhum Cliente Selecionado!');
//        if imp = nil then
//          imp := Timp.create;
//        imp.AbreImpressora;
//        imp.ConfiguraImpressora('CONDENSADO_ON', 'SEXTOS', 22);
//        QEmissaoCarne.First;
//        while not QEmissaoCarne.EOF do
//        begin
//          wCont := 3;
//          Imp.WriteXY(0.5, wCont, QEmissaoCarneNOME.Value);
//          Imp.WriteXY(8, wCont, QEmissaoCarneNOME.Value);
//          Imp.WriteXY(15.2, wCont, QEmissaoCarneNOME.Value);
//          wCont := 6;
//          Imp.WriteXY(1, wCont, QEmissaoCarneCOD_CADASTRO.Text);
//          Imp.WriteXY(4, wCont, QEmissaoCarneNUM_TITULO.Text);
//          Imp.WriteXY(8.5, wCont, QEmissaoCarneCOD_CADASTRO.Text);
//          Imp.WriteXY(11.5, wCont, QEmissaoCarneNUM_TITULO.Text);
//          Imp.WriteXY(15.5, wCont, QEmissaoCarneCOD_CADASTRO.Text);
//          Imp.WriteXY(18.5, wCont, QEmissaoCarneNUM_TITULO.Text);
//          WCont := 8;
//          Imp.WriteXY(0.5, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
//          Imp.WriteXY(2.7, wCont, QEmissaoCarneNUM_PARCELA.Text);
//          Imp.WriteXY(3.8, wCont,
//            Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 10));
//          Imp.WriteXY(7.9, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
//          Imp.WriteXY(10, wCont, QEmissaoCarneNUM_PARCELA.Text);
//          Imp.WriteXY(11, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
//            2, 10));
//          Imp.WriteXY(15, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
//          Imp.WriteXY(17.1, wCont, QEmissaoCarneNUM_PARCELA.Text);
//          Imp.WriteXY(18, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
//            2, 10));
//          Imp.SaltaPagina;
//          with DMOracle do
//          begin
//            QExecSQL.Close;
//            QExecSQL.SQL.Clear;
//            wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
//              Chr(39) + 'SIM' + Chr(39);
//            wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
//              FloatToStr(QEmissaoCarneCOD_CONTA_RECEBER_CAB.Value);
//            QExecSQL.SQL.Add(wComando);
//            QExecSQL.ExecSQL;
//          end;
//          QEmissaoCarne.Next;
//        end;
//        DMOracle.DBCemapa.Commit;
//        Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
//        Imp.FechaImpressora;
//        QEmissaoCarne.Close;
//      end;
//
//      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') then
//      begin
//        if QEmissaoCarneCOD_CADASTRO.Text = '' then
//          raise Exception.Create('Nenhum Cliente Selecionado!');
//        if not (QEmissaoCarneCod_Nota_Cab.Value = Null) then
//          wTotal :=
//            DMOracle.BuscaNome('SELECT SUM(VAL_ORIGINAL) FROM TB_CONTA_RECEBER_CAB', 'COD_NOTA_CAB =' + QEmissaoCarneCod_Nota_Cab.Text);
//        if imp = nil then
//          imp := Timp.create;
//        imp.AbreImpressora;
//        imp.ConfiguraImpressora('CONDENSADO_OFF', 'OITAVOS', 24);
//        QEmissaoCarne.First;
//        while not QEmissaoCarne.EOF do
//        begin
//          if wTotal = Null then
//            wTotal := QEmissaoCarneVAL_ORIGINAL.Text;
//          wCont := 0;
//          Imp.WriteXY(8, wCont, QEmissaoCarneCOD_CADASTRO.Text);
//          Imp.WriteXY(18.8, wCont, QEmissaoCarneCOD_CADASTRO.Text);
//          wCont := 4;
//          Imp.WriteXY(0.8, wCont, QEmissaoCarneNOME.Value);
//          Imp.WriteXY(11.2, wCont, QEmissaoCarneNOME.Value);
//          wCont := 8;
//          Imp.WriteXY(0.5, wCont, QEmissaoCarneDT_EMISSAO.Text);
//          Imp.WriteXY(4, wCont, Bib.NumToTexto(StrToFloat(wTotal), 2, 10));
//          Imp.WriteXY(8, wCont, Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value,
//            2, 8));
//          Imp.WriteXY(11.2, wCont, QEmissaoCarneDT_EMISSAO.Text);
//          Imp.WriteXY(15, wCont, Bib.NumToTexto(StrToFloat(wTotal), 2, 10));
//          Imp.WriteXY(18.1, wCont,
//            Bib.NumToTexto(QEmissaoCarneVAL_ORIGINAL.Value, 2, 7));
//          wCont := 12;
//          Imp.WriteXY(0.8, wCont, QEmissaoCarneNUM_PARCELA.Text);
//          Imp.WriteXY(2.2, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
//          Imp.WriteXY(11.5, wCont, QEmissaoCarneNUM_PARCELA.Text);
//          Imp.WriteXY(12.8, wCont, QEmissaoCarneDT_VENCIMENTO.Text);
//          wCont := 18;
//          Imp.WriteXY(0.8, wCont, 'Juro diario de R$ ' + FormatFloat('#,##0.00',
//            (QEmissaoCarnePERC_TAXA.Value /
//            DMoracle.DiasNoMes(QEmissaoCarneDT_VENCIMENTO.Value) *
//            QEmissaoCarneVal_Original.Value / 100)) + ' por atraso de Pgto.');
//          Imp.SaltaPagina;
//          with DMOracle do
//          begin
//            QExecSQL.Close;
//            QExecSQL.SQL.Clear;
//            wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO_CARNE=' +
//              Chr(39) + 'SIM' + Chr(39);
//            wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
//              FloatToStr(QEmissaoCarneCOD_CONTA_RECEBER_CAB.Value);
//            QExecSQL.SQL.Add(wComando);
//            QExecSQL.ExecSQL;
//          end;
//          QEmissaoCarne.Next;
//        end;
//        DMOracle.DBCemapa.Commit;
//        Imp.ConfiguraImpressora('CONDENSADO_OFF', 'SEXTOS', 66);
//        Imp.FechaImpressora;
//        QEmissaoCarne.Close;
//      end;
  end;
end;

procedure TFContasReceberCad.GeraContratoClick(Sender: TObject);
var
  Path, campo: string;
begin
  inherited;
  if DMContasReceber.QContasReceber_cabCOD_CONTA_RECEBER_CAB.value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMContasReceber.QContasReceber_cabCOD_FILIAL.Text), 'CONTAS A RECEBER');
    Path := ExtractFilePath(ParamStr(0)) + 'Contratos\';
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_FILIAL.Value);
    DMFilial.QFilial.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;
    DMFinalidade.QFinalidade.Close;
    DMFinalidade.QFinalidade.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_FINALIDADE.Value);
    DMFinalidade.QFinalidade.Open;

    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'ContratoContasReceber.Doc');

    campo := DMFilial.QFilialDESC_FILIAL.Value;
    Doc.Content.Find.Execute(FindText := '%desc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialNum_CGC.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_filial', ReplaceWith :=
      campo, Replace := 2);
    campo := DMFilial.QFilialDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialCod_estado.Value;
    Doc.Content.Find.Execute(FindText := '%estado_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%inscricao_filial', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroNOME.Value;
    Doc.Content.Find.Execute(FindText := '%nome_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%rg_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_CGC_CPF.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroCOD_ESTADO.value;
    Doc.Content.Find.Execute(FindText := '%uf_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := FormatFloat('#,##0.00',
      DMContasReceber.QContasReceber_cabVAL_TITULO.value);
    Doc.Content.Find.Execute(FindText := '%valor_titulo', ReplaceWith := campo,
      Replace := 2);
    campo := Bib.extenso(DMContasReceber.QContasReceber_cabVAL_TITULO.value,
      'REAL');
    Doc.Content.Find.Execute(FindText := '%extenso', ReplaceWith := campo,
      Replace := 2);
    campo := FormatFloat('#,##0.00', DMFinalidade.QFinalidadePERC_TAXA.value);
    Doc.Content.Find.Execute(FindText := '%taxa_juro', ReplaceWith := campo,
      Replace := 2);
    campo := DateToStr(DMContasReceber.QContasReceber_cabDT_EMISSAO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_emissao', ReplaceWith := campo,
      Replace := 2);
    campo := DateToStr(DMContasReceber.QContasReceber_cabDT_VENCIMENTO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_vencimento', ReplaceWith := campo,
      Replace := 2);

    // Grava documento
    Doc.SaveAs(Path + 'ContratoContasReceber1.Doc');
    // Imprime
    //Doc.PrintOut(false);
    // Fecha o Word
//      WinWord.Quit;
  end
  else
    MessageDlg('Primeiro selecione uma Conta para IMPRESSÃO', mtInformation,
      [mbOk], 0);

end;

// Procedimento antigo de geração de Arq.Remessa - Comentado por Djeison A. S. - 01/08/2013
//procedure TFContasReceberCad.ArquivoRemessaCNAB2401Click(Sender: TObject);
//var
//  mNUM_CEDENTE: string; // 2a Edition by Robson.
//  mNUM_CONVENENTE: string;
//  mBrancos: string;
//  mPrefixoTitulo: string;
//  x, iSeq: Integer;
//  mContaCaucao: string;
//  mTipoInscricao: string;
//  mSequencial: Integer;
//  mSEQ_REMESSA: Real;
//  s, wVal: string;
//  F: TextFile;
//  mCodNossoNumero: string;
//  wNumTitulo: string;
//  iQtdRegLote: integer;
//begin
//  inherited;
//  if FContasReceberParam = nil then
//    FContasReceberParam := TFContasReceberParam.Create(Application);
//  FContasReceberParam.PGRelatorio.Pages[24].TabVisible := True;
//  if FContasReceberParam.ShowModal = mrOk then
//  begin
//    S := '';
//    with DMContasReceber do
//    begin
//      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME24CodFilial.text), 'CONTAS A RECEBER');
//      QRemessa.Close;
//
//      if Trim(FContasReceberParam.ME24CodFilial.text) <> '' then
//        QRemessa.SetVariable('COD_FILIAL',
//          FContasReceberParam.ME24CodFilial.text)
//      else
//        QRemessa.SetVariable('COD_FILIAL', Null);
//
//      if Trim(FContasReceberParam.ME24CodContaCorrente.text) <> '' then
//        QRemessa.SetVariable('COD_CONTA_CORRENTE',
//          FContasReceberParam.ME24CodContaCorrente.text)
//      else
//        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);
//
//      if Trim(FContasReceberParam.ME24DtInicial.text) <> '' then
//        QRemessa.SetVariable('DT_INICIAL',
//          FContasReceberParam.ME24DtInicial.text)
//      else
//        QRemessa.SetVariable('DT_INICIAL', Null);
//
//      if Trim(FContasReceberParam.ME24DtFinal.text) <> '' then
//        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME24DtFinal.text)
//      else
//        QRemessa.SetVariable('DT_FINAL', Null);
//
//      if Trim(FContasReceberParam.Me24NrTitulo.text) <> '' then
//        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me24NrTitulo.text)
//      else
//        QRemessa.SetVariable('NUM_TITULO', Null);
//
//      QRemessa.SetVariable('IND_REMESSA', 'NAO');
//
//      QRemessa.Open;
//
//      if not QRemessa.Eof then
//      begin
//        try
//          {-------HEADER DO ARQUIVO - REGISTRO 0-------}
//          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
//          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
//          s := s + '0000'; {004-007|04|LOTE DE SERVICO}
//          s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
//          s := s + '        '; {009-016|08|USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '2'; {017-017|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}
//
//          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
//          s := s + wVal; {018-032|15|N DE INSCRICAO DA EMPRESA}
//
//          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
//          s := s + wVal; {033-036|04|AGENCIA MANTENEDORA DA CONTA}
//
//          wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
//          s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA AGENCIA}
//
//          wVal :=
//            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
//            9)), 9);
//          s := s + wVal; {038-046|09|NUMERO DA CONTA CORRENTE}
//
//          wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1, 1);
//          s := s + wVal; {047-047|01|DIGITO VERIFICADOR DA CONTA}
//
//          s := s + '                         ';
//          {048-072|25|PARA USO RESERVADO DO BANCO}
//
//          wVal := copy(QRemessaDESC_FILIAL.Text +
//            '                              ', 1, 30);
//          s := s + wVal; {073-102|30|NOME DA EMPRESA}
//
//          wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
//            '                              ', 1, 30);
//          s := s + wVal; {103-132|30|NOME DO BANCO}
//
//          s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}
//
//          s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}
//
//          wVal :=
//            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
//            '');
//          s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}
//
//          s := s + '      '; {152-157|06|PARA USO RESERVADO DO BANCO}
//
//          if QRemessaCOD_BANCO.Text = '347' then
//          begin
//            wVal :=
//              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
//              'ARQ_REM_SUDAMERIS')), 6);
//            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
//          end
//          else if QRemessaCOD_BANCO.Text = '353' then
//          begin
//            wVal :=
//              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
//              'ARQ_REM_SANTANDER')), 6);
//            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
//          end;
//
//          s := s + '040'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}
//
//          s := s + '                    ';
//          {167-240|74|PARA USO RESERVADO DO BANCO}
//          s := s + '                    ';
//          {167-240|74|PARA USO RESERVADO DO BANCO}
//          s := s + '                    ';
//          {167-240|74|PARA USO RESERVADO DO BANCO}
//          s := s + '              '; {167-240|74|PARA USO RESERVADO DO BANCO}
//
//          {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}
//
//          {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
//          s := s + #13#10; {QUEBRA DE LINHA}
//
//          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
//          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
//          s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
//          s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
//          s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
//          s := s + '01'; {010-011|02|TIPO DE SERVICO}
//          s := s + '  '; {012-013|02|USO DO BANCO}
//
//          if QRemessaCOD_BANCO.Text = '347' then
//            s := s + '040' {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
//          else
//            s := s + '030'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
//          s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}
//
//          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
//          s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}
//
//          s := s + '                    '; {--034-053|20|USO DO BANCO---}
//
//          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
//          s := s + wVal; {054-057|04|AGENCIA MANTENEDORA DA CONTA}
//
//          wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
//          s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}
//
//          wVal :=
//            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
//            9)), 9);
//          s := s + wVal; {059-067|09|NUMERO DA CONTA CORRENTE}
//
//          wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1, 1);
//          s := s + wVal; {068-068|01|DIGITO VERIFICADOR DA CONTA}
//
//          s := s + '     '; {069-073|05|USO DO BANCO---}
//
//          wVal := copy(QRemessaDESC_FILIAL.Text +
//            '                              ', 1, 30);
//          s := s + wVal; {074-103|30|NOME DA EMPRESA}
//
//          wVal := '                                        ';
//          s := s + wVal; {104-143|40|MENSAGEM 1}
//
//          wVal := '                                        ';
//          s := s + wVal; {144-183|40|MENSAGEM 2}
//
//          if QRemessaCOD_BANCO.Text = '347' then
//          begin
//            wVal :=
//              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
//              'ARQ_REM_SUDAMERIS')), 8);
//            s := s + wVal; {184-191|08|NUMERO REMESSA RETORNO}
//          end
//          else if QRemessaCOD_BANCO.Text = '353' then
//          begin
//            wVal :=
//              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
//              'ARQ_REM_SANTANDER')), 8);
//            s := s + wVal; {184-191|08|NUMERO REMESSA RETORNO}
//          end;
//
//          wVal :=
//            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
//            '');
//          s := s + wVal; {192-199|08|DATA DE GRAVACAO REMESSA/RETORNO}
//
//          wVal := '                                         ';
//          s := s + wVal; {200-240|41|USO DO BANCO}
//          {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
//
//          iSeq := 1;
//          iQtdRegLote := 2; //2--> header e trailer
//          while not QRemessa.Eof do
//          begin
//            s := s + #13#10;
//            {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}
//
//            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
//            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
//            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
//            s := s + '3'; {008-008|01|REGISTRO DETALHE}
//
//            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
//            s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
//            s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
//            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
//            s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}
//
//            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
//            s := s + wVal; {018-021|04|AGENCIA MANTENEDORA DA CONTA}
//
//            wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
//            s := s + wVal; {022-022|01|DIGITO VERIFICADOR DA AGENCIA}
//
//            wVal :=
//              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
//              9)), 9);
//            s := s + wVal; {023-031|09|NUMERO DA CONTA CORRENTE}
//
//            wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1,
//              1);
//            s := s + wVal; {032-032|01|DIGITO VERIFICADOR DA CONTA}
//
//            wVal :=
//              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCOD_CONVENIO_CUSTODIA.Text, 10)), 10);
//            s := s + wVal; {033-041|09|NUMERO DA CONTA CORRENTE}
//            {042-042|01|DIGITO VERIFICADOR DA CONTA}
//
//// wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text+'0',1,1);
//// s := s + wVal;       {042-042|01|DIGITO VERIFICADOR DA CONTA}
//
//            s := s + '  '; {043-044|02|USO DO BANCO}
//
//            wVal := RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 13);
//            s := s + wVal; {045-057|13|NOSSO NUMERO}
//
//            s := s + '3'; {058-058|01|TIPO DE COBRANÇA}
//
//            wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
//            s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}
//
//            wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text + '0', 1, 1);
//            s := s + wVal;
//            {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}
//
//            s := s + '  '; {061-062|02|USO DO BANCO}
//
//            wVal := copy(QRemessaNUM_TITULO.Text + '000000000000000', 1, 15);
//            s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}
//
//            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
//              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
//              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
//            wVal := copy(wVal + '        ', 1, 8);
//            s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}
//
//            wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
//            s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}
//
//            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
//            s := s + wVal; {101-104|04|AGENCIA MANTENEDORA DA CONTA}
//
//            wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
//            s := s + wVal; {105-105|01|DIGITO VERIFICADOR DA AGENCIA}
//
//            s := s + ' '; {106-106|01|USO DO BANCO}
//
//            s := s + '02'; {107-108|02|ESPECIE DO TITULO}
//
//            wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
//            s := s + wVal;
//            {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}
//
//            wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
//              copy(QRemessaDT_EMISSAO.Text, 4, 2) +
//              copy(QRemessaDT_EMISSAO.Text, 7, 4);
//            wVal := copy(wVal + '        ', 1, 8);
//            s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}
//
//            s := s + '2'; {118-118|01|CODIGO DE JUROS DE MORA}
//
//            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
//              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
//              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
//            wVal := copy(wVal + '        ', 1, 8);
//            s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}
//
//            wVal := StrZero(QRemessaPERC_JURO_BLOQUETO.Value, 15, 2);
//            s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}
//
//            s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
//            s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
//            s := s + '000000000000000';
//            {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
//            s := s + '000000000000000';
//            {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
//            s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}
//
//            wVal := RMaskCGC_CPF(QRemessaCOD_FILIAL.Text, 6);
//            s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
//            wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
//            s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
//            wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
//            s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
//            wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
//            s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
//            s := s + '0000'; {217-220|4|USO DA CEMAPA}
//
//            wVal := copy(QRemessaCOD_PROTESTO.Text + '0', 1, 1);
//            s := s + wVal;
//            {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA}
//
//            wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
//            s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}
//
//            s := s + '2';
//            {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}
//
//            s := s + '000';
//            {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
//            s := s + '00'; {228-229|02|CODIGO DA MOEDA (REAL)}
//
//            s := s + '           '; {230-240|11|USO EXCLUSIVO DO BANCO}
//
//            iSeq := iSeq + 1;
//            iQtdRegLote := iQtdRegLote + 1;
//            {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}
//
//            s := s + #13#10; {QUEBRA DE LINHA}
//            {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
//
//            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
//            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
//            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
//            s := s + '3'; {008-008|01|REGISTRO DETALHE}
//
//            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
//            s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
//            s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
//            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
//            s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}
//
//            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
//            if wVal = 'F' then
//              wVal := '1'
//            else if wVal = 'J' then
//              wVal := '2'
//            else
//              wVal := '0';
//
//            s := s + wVal; {018-018|01|TIPO DE INSCRICAO}
//
//            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
//            s := s + wVal; {019-033|15|N DE INSCRICAO}
//
//            wVal := copy(QRemessaNOME.Text +
//              '                                        ', 1, 40);
//            s := s + wVal; {034-073|40|NOME}
//
//            wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
//              '                                        ', 1, 40);
//            s := s + wVal; {074-113|40|ENDERECO}
//
//            wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
//            s := s + wVal; {114-128|15|BAIRRO}
//
//            wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
//              '     ', 1, 8);
//            s := s + wVal; {129-136|08|CEP}
//
//            // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
//            // s := s + wVal;       {134-136|03|SUFIXO DO CEP}
//
//            wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
//              1, 15);
//            s := s + wVal; {137-151|15|CIDADE}
//
//            wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
//            s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}
//
//            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
//            if wVal = 'F' then
//              wVal := '1'
//            else if wVal = 'J' then
//              wVal := '2'
//            else
//              wVal := '0';
//            s := s + wVal; {154-154|01|TIPO DE INSCRICAO}
//
//            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
//            s := s + wVal; {155-169|15|N DE INSCRICAO}
//
//            wVal := copy(QRemessaNOME.Text +
//              '                                        ', 1, 40);
//            s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}
//
//            s := s + '000'; {210-212|03|IDENTIFICADOR DE CARNE}
//
//            s := s + '000';
//            {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}
//
//            s := s + '000'; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}
//
//            s := s + '000'; {219-221|03|NUMERO DO PLANO}
//
//            s := s + '                   '; {222-240|19|USO DO BANCO}
//
//            iSeq := iSeq + 1;
//            iQtdRegLote := iQtdRegLote + 1;
//            {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
//            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
//              QRemessaCOD_CONTA_RECEBER_CAB.Value);
//            QEnviadoBanco.ExecSQL;
//            QRemessa.Next;
//          end;
//
//          QRemessa.First;
//
//          s := s + #13#10;
//          {------------TRAILER DE LOTE--------------------}
//          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
//          s := s + wVal; {CODIGO DO BANCO NA COMPENSACAO}
//          s := s + '0001'; {LOTE DE SERVICO}
//          s := s + '5'; {REGISTRO TRAILER DE LOTE}
//          s := s + '         '; {USO EXCLUSIVO DO BANCO}
//
//          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote), 6);
//          s := s + wVal; {QUANTIDADE DE REGISTROS DO LOTE}
//
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}
//
//          {------------FIM - TRAILER DE LOTE--------------------}
//
//          s := s + #13#10; {QUEBRA DE LINHA}
//          {------------TRAILER DE ARQUIVO-----------------}
//          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
//          s := s + wVal; {CODIGO DO BANCO NA COMPENSACAO}
//
//          s := s + '9999'; {LOTE DE SERVICO}
//          s := s + '9'; {REGISTRO TRAILER DE ARQUIVO}
//          s := s + '         '; {USO EXCLUSIVO FEBRABAN}
//          s := s + '000001'; {QUANTID. DE LOTES DO ARQUIV}
//
//          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
//          s := s + wVal; {QTDADE DE REGISTROS DO ARQUIV}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
//          s := s + '           '; {USO EXCLUSIVO FEBRABAN/CNAB}
//
//          {------------TRAILER DE ARQUIVO-----------------}
//
//          if FContasReceberParam.SDlg_Remessa.Execute then
//          begin
//            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
//            Rewrite(F);
//            Writeln(F, S);
//            CloseFile(F);
//            DMOracle.DBCemapa.Commit;
//            MessageDlg('Arquivo REMESSA CNAB240 Gerado com Sucesso!',
//              mtInformation, [mbOk], 0);
//          end;
//        except
//          MessageDlg('Sem Movimento nesse Periodo', mtInformation, [mbOk], 0);
//        end;
//      end;
//    end;
//  end;
//end;

procedure TFContasReceberCad.HistricoContrato1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[25].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then

    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.MEContrato.Text) = '' then
        raise exception.create('É necessário escolher um Contrato');

      QRHistoricoContrato.Close;
      QRHistoricoContrato.setVariable('COD_OBRA_CONTRATO',
        Trim(FContasReceberParam.MEContrato.Text));
      QRHistoricoContrato.open;

      if FRHistoricoContrato = nil then
        FRHistoricoContrato := TFRHistoricoContrato.Create(Application);

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRHistoricoContrato.QRPrimario.Preview
      else
        FRHistoricoContrato.QRPrimario.Print;
    end;
end;

procedure TFContasReceberCad.RelDescontoCheque1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
//    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME17CodFilial.Text,
//      'CONTAS A RECEBER');
    with DMContasReceber_Rel do
    begin
      QRRemessaDesconto.Close;
//      if Trim(FContasReceberParam.ME17CodFilial.text) <> '' then
//        QRRemessaDesconto.SetVariable('COD_FILIAL',
//          FContasReceberParam.ME17CodFilial.text)
//      else
//        raise exception.Create('Código da Filial não pode ficar em branco');
      if Trim(FContasReceberParam.Fm17TituloInicial.MeContasReceber.text) <> '' then
        QRRemessaDesconto.SetVariable('NUM_TITULO',
          FContasReceberParam.Fm17TituloInicial.MeContasReceber.text)
      else
        QRRemessaDesconto.SetVariable('NUM_TITULO', Null);
      if Trim(FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text) <> '' then
        QRRemessaDesconto.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text)
      else
        raise
          exception.Create('Código da Conta Corrente não pode ficar em branco');
      if Trim(FContasReceberParam.Fm17Datas.MeDtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRRemessaDesconto.SetVariable('DT_INICIAL',
        FContasReceberParam.Fm17Datas.MeDtInicial.text);
      if Trim(FContasReceberParam.Fm17Datas.MeDtFinal.text) <> '' then
        QRRemessaDesconto.SetVariable('DT_FINAL',
          FContasReceberParam.Fm17Datas.MeDtFinal.text + ' 23:59:59')
      else
        raise exception.Create('Data Final não pode ficar em branco');

      if FContasReceberParam.RG17Ordem.ItemIndex = 0 then
        QRRemessaDesconto.SQL[QRRemessaDesconto.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO '
      else
        QRRemessaDesconto.SQL[QRRemessaDesconto.SQL.Count - 1] :=
          '  TB_CONTA_RECEBER_CAB.NUM_TITULO  ';

      QRRemessaDesconto.Open;
      if FRRemessasDesconto = nil then
        FRRemessasDesconto := TFRRemessasDesconto.create(Application);
      FRRemessasDesconto.QRLTitulo.Caption := FContasReceberParam.Me17Titulo.Text
        + FContasReceberParam.Fm17Datas.MeDtInicial.text + ' até ' +
        FContasReceberParam.Fm17Datas.MeDtFinal.text;
      FRRemessasDesconto.QRLEmpresa.Caption := 'Filial: TODAS';
//        FContasReceberParam.ME17Filial.text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRRemessasDesconto.QRPrimario.Preview
      else
        FRRemessasDesconto.QRPrimario.Print;
      QRRemessaDesconto.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ClculodeDesconto1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[26].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin

    if trim(FContasReceberParam.ME26Cadastro.Text) = '' then
      raise Exception.Create('Informe o cadastro.');

    if trim(FContasReceberParam.ME26PercDescAntecipacao.Text) = '' then
      raise Exception.Create('Informe o percentual de Antecipação.');

    if trim(FContasReceberParam.ME26PercDescPontualidade.Text) = '' then
      raise Exception.Create('Informe o percentual de Pontualidade.');

    if trim(FContasReceberParam.ME26DtVencimentoInicio.Text) = '' then
      raise Exception.Create('Informe a data de vencimento inicial.');

    if trim(FContasReceberParam.ME26DtVencimentoFim.Text) = '' then
      raise Exception.Create('Informe a data de vencimento final.');

    if trim(FContasReceberParam.ME26DtPagamento.Text) = '' then
      raise Exception.Create('Informe a data de pagamento.');

    with DMContasReceber_Rel do
    begin
      QRCalculoDesconto.Close;

      QRCalculoDesconto.SetVariable('COD_CADASTRO',
        strtoint(trim(FContasReceberParam.ME26Cadastro.Text)));
      QRCalculoDesconto.SetVariable('PERC_ANTECIPACAO_MES',
        StrToFloat(trim(FContasReceberParam.ME26PercDescAntecipacao.Text)));
      QRCalculoDesconto.SetVariable('PERC_PONTUALIDADE',
        StrToFloat(trim(FContasReceberParam.ME26PercDescPontualidade.Text)));
      QRCalculoDesconto.SetVariable('DT_VENCIMENTO_INI',
        StrToDate(trim(FContasReceberParam.ME26DtVencimentoInicio.Text)));
      QRCalculoDesconto.SetVariable('DT_VENCIMENTO_FIM',
        StrToDate(trim(FContasReceberParam.ME26DtVencimentoFim.Text)));
      QRCalculoDesconto.SetVariable('DT_PAGAMENTO',
        StrToDate(trim(FContasReceberParam.ME26DtPagamento.Text)));
      if trim(FContasReceberParam.FM26Departamento.MeDepartamento.Text) = '' then
        QRCalculoDesconto.SetVariable('COD_DEPARTAMENTO', Null)
      else
        QRCalculoDesconto.SetVariable('COD_DEPARTAMENTO',
          Trim(FContasReceberParam.FM26Departamento.MeDepartamento.Text));

      QRCalculoDesconto.Open;
      if FRCalculoDesconto = nil then
        FRCalculoDesconto := TFRCalculoDesconto.create(Application);

      FRCalculoDesconto.QRLCliente.Caption :=
        FContasReceberParam.Ed26Cadastro.Text;
      FRCalculoDesconto.QRLDtPagamento.Caption :=
        trim(FContasReceberParam.ME26DtPagamento.Text);
      FRCalculoDesconto.QRLVencimentoIni.Caption :=
        trim(FContasReceberParam.ME26DtVencimentoInicio.Text);
      FRCalculoDesconto.QRLVencimentoFim.Caption :=
        trim(FContasReceberParam.ME26DtVencimentoFim.Text);
      FRCalculoDesconto.QRLDescAntecipacao.Caption := FormatFloat('#,##0.00%',
        StrToFloat(trim(FContasReceberParam.ME26PercDescAntecipacao.Text)));
      FRCalculoDesconto.QRLDescPontualidade.Caption := FormatFloat('#,##0.00%',
        StrToFloat(trim(FContasReceberParam.ME26PercDescPontualidade.Text)));

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRCalculoDesconto.QRPrimario.Preview
      else
        FRCalculoDesconto.QRPrimario.Print;
      QRRemessaDesconto.Close;
    end;
  end;
end;

procedure TFContasReceberCad.CopiadeBloquetoClick(Sender: TObject);
begin
  inherited;
  MessageDlg('Opção desativada. Utilize o menu Relatórios -> Emissão de Bloqueto para ' +
    'impressão de boletos.' , mtInformation, [mbOk], 0);
end;

function TFContasReceberCad.RetornaErroSantander(wStrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código da ocorrência inválida';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de movimento inválido';
    06: wstrS := 'Tipo/número de inscrição do cedente inválidos';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Duplicado';
    10: wstrS := 'Carteira Inválida';
    11: wstrS := 'Forma de cadastramento do titulo inválida';
    12: wstrS := 'Tipo de documento inválido';
    13: wstrS := 'Identificação da emissão do bloqueto Inválida';
    14: wstrS := 'Identificação da distribuição do bloqueto Inválida';
    15: wstrS := 'Características da cobrança imcompatíveis';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    19: wstrS :=
      'Título a cargo de bancos correspondentes com vencimento inferior a XX dias';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie não permitida para a carteira';
    23: wstrS := 'aceite inválido';
    24: wstrS := 'Data de emissão Inválida';
    25: wstrS := 'Data de emissão posterior a data de entrada';
    26: wstrS := 'Código de juros de mora inválido';
    27: wstrS := 'Valor/taxa de juros de mora inválido';
    28: wstrS := 'Código de desconto Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    32: wstrS := 'Valor do IOF';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    35: wstrS := 'Abatimento a conceder não confere';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    37: wstrS := 'Código para protesto inválido';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução inválido';
    43: wstrS := 'Prazo para baixa/devolução inválido';
    44: wstrS := 'Código de moeda inválido';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    49: wstrS := 'CEP sem praça de cobrança(não localizado)';
    50: wstrS := 'CEP irregular referente a um Banco Correspondente';
    51: wstrS := 'CEP incompatível com a unidade de federação';
    52: wstrS := 'Unidade de federação inválida';
    53: wstrS := 'Tipo/número de inscrição do sacador/avalista inválidos';
    54: wstrS := 'Sacador/avalista não informado';
    55: wstrS := 'Nosso Número no banco correspondente não informado';
    56: wstrS := 'Código do banco correspondente não informado';
    57: wstrS := 'Código da Multa inválido';
    58: wstrS := 'Data da multa inválida';
    59: wstrS := 'Valor/Percentual da multa inválido';
    60: wstrS := 'Movimento para Título não cadastrado';
    61: wstrS := 'Alteração de agência cobradora/dv inválida';
    62: wstrS := 'Tipo de impressão inválido';
    63: wstrS := 'Entrada para Título já cadastrado';
    64: wstrS := 'Número da linha inválido';
  end;
  Result := (wstrS);
end;

function TFContasReceberCad.RetornaErroUnibanco(wStrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código da ocorrência inválida';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de movimento inválido';
    06: wstrS := 'Tipo/número de inscrição do cedente inválidos';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Duplicado';
    10: wstrS := 'Carteira Inválida';
    11: wstrS := 'Forma de cadastramento do titulo inválida';
    12: wstrS := 'Tipo de documento inválido';
    13: wstrS := 'Identificação da emissão do bloqueto Inválida';
    14: wstrS := 'Identificação da distribuição do bloqueto Inválida';
    15: wstrS := 'Características da cobrança imcompatíveis';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    19: wstrS :=
      'Título a cargo de bancos correspondentes com vencimento inferior a XX dias';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie do Título não permitida para a carteira';
    23: wstrS := 'aceite inválido';
    24: wstrS := 'Data de emissão Inválida';
    25: wstrS := 'Data de emissão posterior a data de entrada';
    26: wstrS := 'Código de juros de mora inválido';
    27: wstrS := 'Valor/taxa de juros de mora inválido';
    28: wstrS := 'Código de desconto Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    32: wstrS := 'Valor do IOF inválido';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    35: wstrS := 'Abatimento a conceder não confere';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    37: wstrS := 'Código para protesto inválido';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução inválido';
    43: wstrS := 'Prazo para baixa/devolução inválido';
    44: wstrS := 'Código de moeda inválido';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    49: wstrS := 'CEP sem praça de cobrança(não localizado)';
    50: wstrS := 'CEP irregular referente a um Banco Correspondente';
    51: wstrS := 'CEP incompatível com a unidade de federação';
    52: wstrS := 'Unidade de federação inválida';
    53: wstrS := 'Tipo/número de inscrição do sacador/avalista inválidos';
    54: wstrS := 'Sacador/avalista não informado';
    55: wstrS := 'Nosso Número no banco correspondente não informado';
    56: wstrS := 'Código do banco correspondente não informado';
    57: wstrS := 'Código da Multa inválido';
    58: wstrS := 'Data da multa inválida';
    59: wstrS := 'Valor/Percentual da multa inválido';
    60: wstrS := 'Movimento para Título não cadastrado';
    61: wstrS := 'Alteração de agência cobradora/dv inválida';
    62: wstrS := 'Tipo de impressão inválido';
    63: wstrS := 'Entrada para Título já cadastrado';
    64: wstrS := 'Número da linha inválido';
    65: wstrS := 'Código do Banco para Débito Inválido';
    66: wstrS := 'Agência/conta/DV para Débito Inválido';
    67: wstrS :=
      'Dados para débito incompatível com a identificação da emissaõ do bloqueto';
    68: wstrS := 'Débito automático agendado';
    69: wstrS := 'Débito não agendado - Erro nos dados da Remessa';
    70: wstrS :=
      'Débito não agendado - Sacado não consta do cadastro de autorizante';
    71: wstrS := 'Débito não agendado - Cedente não autorizado pelo sacado';
    72: wstrS :=
      'Débito não agendado - Cedente não participa da modalidade débito automático';
    73: wstrS := 'Débito não agendado - Código da moeda diferente de real(R$)';
    74: wstrS := 'Débito não agendado - Data Vencimento Inválida';
    75: wstrS :=
      'Débito não agendado, conforme seu pedido, título não registrado';
    76: wstrS :=
      'Débito não agendado, Tipo/Num. Inscrição do debitado, inválido';
    77: wstrS :=
      'Tranferência para desconto não permitida para a carteira do título';
    78: wstrS := 'Data Inferior ou igual ao vencimento para débito automático';
    79: wstrS := 'Data juros de mora inválido';
    80: wstrS := 'Data do desconto inválida';
    81: wstrS := 'Tentativas de débito esgotadas - Baixado';
    82: wstrS := 'Tentativas de débito esgotadas - Pendente';
    83: wstrS := 'Limite Excedido';
    84: wstrS := 'Número Autorização Inexistente';
    85: wstrS := 'Título com pagamento vinculado';
    86: wstrS := 'Seu Número Inválido';
    87: wstrS := 'e-mail/SMS enviado';
    88: wstrS := 'e-mail lido';
    89: wstrS :=
      'e-mail/SMS devolvido - endereço de e-mail ou número do celular incorreto';
    90: wstrS := 'e-mail devolvido - caixa postal cheia';
    91: wstrS := 'e-mail/número do celular do saado não informado';
    92: wstrS := 'Sacado optante por bloqueto eletrônico - e-mail não enviado';
    93: wstrS := 'Código para emissão de bloqueto não permite envio e-mail';
    94: wstrS := 'Código da Carteira inválido para envio de e-mail';
    95: wstrS := 'Contrato não permite o envio de e-mail';
    96: wstrS := 'Número de Contrato Inválido'; 
  end;
  Result := (wstrS);
end;


function TFContasReceberCad.RetornaErroCaixaSigcb(wStrErro: string): string;
var
  wintErro: Integer;
  wstrS: string;
begin
  wintErro := StrToInt(wstrErro);
  case wintErro of
    01: wstrS := 'Código do Banco inválido';
    02: wstrS := 'Código do registro detalhe inválido';
    03: wstrS := 'Código do Segmento inválido';
    04: wstrS := 'Código de ocorrência não permitida para a carteira';
    05: wstrS := 'Código de movimento inválido';
    06: wstrS := 'Tipo/número de inscrição do cedente inválidos';
    07: wstrS := 'Agência/Conta/Dígito - Inválido';
    08: wstrS := 'Nosso Número Inválido';
    09: wstrS := 'Nosso Número Duplicado';
    10: wstrS := 'Carteira Inválida';
    11: wstrS := 'Forma de cadastramento do titulo inválida';
    12: wstrS := 'Tipo de documento inválido';
    13: wstrS := 'Identificação da emissão do bloqueto Inválida';
    14: wstrS := 'Identificação da distribuição do bloqueto Inválida';
    15: wstrS := 'Características da cobrança imcompatíveis';
    16: wstrS := 'Data de Vencimento Inválida';
    17: wstrS := 'Data de Vencimento anterior a data de emissão';
    18: wstrS := 'Vencimento fora do prazo de operação';
    19: wstrS :=
      'Título a cargo de bancos correspondentes com vencimento inferior a XX dias';
    20: wstrS := 'Valor do Título Inválido';
    21: wstrS := 'Espécie do Título Inválida';
    22: wstrS := 'Espécie do Título não permitida para a carteira';
    23: wstrS := 'aceite inválido';
    24: wstrS := 'Data de emissão Inválida';
    25: wstrS := 'Data de emissão posterior a data de entrada';
    26: wstrS := 'Código de juros de mora inválido';
    27: wstrS := 'Valor/taxa de juros de mora inválido';
    28: wstrS := 'Código de desconto Inválido';
    29: wstrS := 'Valor do desconto maior/igual ao valor do Título';
    30: wstrS := 'Desconto a conceder não confere';
    31: wstrS := 'Concessão de desconto já existente (Desconto anterior)';
    32: wstrS := 'Valor do IOF inválido';
    33: wstrS := 'Valor do abatimento Inválido';
    34: wstrS := 'Valor do abatimento maior/igual ao valor do Título';
    35: wstrS := 'Abatimento a conceder não confere';
    36: wstrS := 'Concessão abatimento - Já existe abatimento anterior';
    37: wstrS := 'Código para protesto inválido';
    38: wstrS := 'Prazo para protesto inválido';
    39: wstrS := 'Pedido de protesto não permitido para o Título';
    40: wstrS := 'Título com Ordem de protesto emitido';
    41: wstrS :=
      'Pedido cancelamento/sustação para Título sem instrução de protesto';
    42: wstrS := 'Código para baixa/devolução inválido';
    43: wstrS := 'Prazo para baixa/devolução inválido';
    44: wstrS := 'Código de moeda inválido';
    45: wstrS := 'Nome do Sacado não Informado';
    46: wstrS := 'Tipo/número de inscrição do Sacado inválidos';
    47: wstrS := 'Endereço do Sacado não informado';
    48: wstrS := 'CEP Inválido';
    49: wstrS := 'CEP sem praça de cobrança(não localizado)';
    50: wstrS := 'CEP irregular referente a um Banco Correspondente';
    51: wstrS := 'CEP incompatível com a unidade de federação';
    52: wstrS := 'Unidade de federação inválida';
    53: wstrS := 'Tipo/número de inscrição do sacador/avalista inválidos';
    54: wstrS := 'Sacador/avalista não informado';
    55: wstrS := 'Nosso Número no banco correspondente não informado';
    56: wstrS := 'Código do banco correspondente não informado';
    57: wstrS := 'Código da Multa inválido';
    58: wstrS := 'Data da multa inválida';
    59: wstrS := 'Valor/Percentual da multa inválido';
    60: wstrS := 'Movimento para Título não cadastrado';
    61: wstrS := 'Alteração de agência cobradora/dv inválida';
    62: wstrS := 'Tipo de impressão inválido';
    63: wstrS := 'Entrada para Título já cadastrado';
    64: wstrS := 'Número da linha inválido';
    65: wstrS := 'Código do Banco para Débito Inválido';
    66: wstrS := 'Agência/conta/DV para Débito Inválido';
    67: wstrS :=
      'Dados para débito incompatível com a identificação da emissaõ do bloqueto';
    68: wstrS := 'Débito automático agendado';
    69: wstrS := 'Débito não agendado - Erro nos dados da Remessa';
    70: wstrS :=
      'Débito não agendado - Sacado não consta do cadastro de autorizante';
    71: wstrS := 'Débito não agendado - Cedente não autorizado pelo sacado';
    72: wstrS :=
      'Débito não agendado - Cedente não participa da modalidade débito automático';
    73: wstrS := 'Débito não agendado - Código da moeda diferente de real(R$)';
    74: wstrS := 'Débito não agendado - Data Vencimento Inválida';
    75: wstrS :=
      'Débito não agendado, conforme seu pedido, título não registrado';
    76: wstrS :=
      'Débito não agendado, Tipo/Num. Inscrição do debitado, inválido';
    77: wstrS :=
      'Tranferência para desconto não permitida para a carteira do título';
    78: wstrS := 'Data Inferior ou igual ao vencimento para débito automático';
    79: wstrS := 'Data juros de mora inválido';
    80: wstrS := 'Data do desconto inválida';
    81: wstrS := 'Tentativas de débito esgotadas - Baixado';
    82: wstrS := 'Tentativas de débito esgotadas - Pendente';
    83: wstrS := 'Limite Excedido';
    84: wstrS := 'Número Autorização Inexistente';
    85: wstrS := 'Título com pagamento vinculado';
    86: wstrS := 'Seu Número Inválido';
    87: wstrS := 'e-mail/SMS enviado';
    88: wstrS := 'e-mail lido';
    89: wstrS :=
      'e-mail/SMS devolvido - endereço de e-mail ou número do celular incorreto';
    90: wstrS := 'e-mail devolvido - caixa postal cheia';
    91: wstrS := 'e-mail/número do celular do saado não informado';
    92: wstrS := 'Sacado optante por bloqueto eletrônico - e-mail não enviado';
    93: wstrS := 'Código para emissão de bloqueto não permite envio e-mail';
    94: wstrS := 'Código da Carteira inválido para envio de e-mail';
    95: wstrS := 'Contrato não permite o envio de e-mail';
    96: wstrS := 'Número de Contrato Inválido'; 
  end;
  Result := (wstrS);
end;

procedure TFContasReceberCad.GeraArquivoSERASA1Click(Sender: TObject);
var
  F: TextFile;
  S, wVencto, wTipoCliente, wCont: string;
  wContRelac, wContDupli: Integer;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[27].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    wContRelac := 0;
    wContDupli := 0;
    with DMContasReceber_rel do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME27Filial.Text),
        'CONTAS A RECEBER');
      QRSerasa.Close;
      QRSerasa_Tempo.Close;
      QSerasa_Recebto.Close;

      if Trim(FContasReceberParam.ME27Filial.Text) <> '' then
      begin
        QRSerasa.SetVariable('COD_FILIAL', FContasReceberParam.ME27Filial.Text);
        QSerasa_Recebto.SetVariable('COD_FILIAL',
          FContasReceberParam.ME27Filial.Text);
      end
      else
        raise exception.Create('Informar código da filial');

      if Trim(FContasReceberParam.ME27DATA_I.Text) <> '' then
      begin
        QRSerasa.SetVariable('DATA_I',
          StrtoDate(FContasReceberParam.ME27DATA_I.Text));
        QSerasa_Recebto.SetVariable('DATA_I',
          StrtoDate(FContasReceberParam.ME27DATA_I.Text));
      end
      else
      begin
        QRSerasa.SetVariable('DATA_I', Null);
        QSerasa_Recebto.SetVariable('DATA_I', Null);
      end;

      if Trim(FContasReceberParam.ME27DATA_F.Text) <> '' then
      begin
        QRSerasa.SetVariable('DATA_F',
          StrtoDate(FContasReceberParam.ME27DATA_F.Text + ' 23:59:59'));
        QSerasa_Recebto.SetVariable('DATA_F',
          StrtoDate(FContasReceberParam.ME27DATA_F.Text + ' 23:59:59'));
      end
      else
      begin
        QRSerasa.SetVariable('DATA_F', Null);
        QSerasa_Recebto.SetVariable('DATA_F', Null);
      end;
      QRSerasa.Open;
      QRSerasa_Tempo.Open;
      QSerasa_Recebto.Open;

      if QRSerasa.RecordCount <= 0 then
        raise exception.create('Não Existem registros a serem exportados');

      //----Inicio Registro Header
   {01}S := '00';
      {02}S := S + 'RELATO COMP NEGOCIOS';
      {03}S := S +
        RMaskCGC_CPF(DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL',
        'COD_FILIAL =' + Trim(FContasReceberParam.ME27Filial.Text), True), 14);
      if FContasReceberParam.Rg27Tipo.ItemIndex = 0 then
        {04}S := S + FormatDateTime('yyyymmdd',
          StrToDate(FContasReceberParam.ME27Data_I.text))
      else
        S := S + 'CORRECAO';
      {05}S := S + FormatDateTime('yyyymmdd',
        StrToDate(FContasReceberParam.ME27Data_F.text));
      {06}case FContasReceberParam.Rg27Periodicidade.ItemIndex of
        0: S := S + 'D';
        1: S := S + 'M';
        2: S := S + 'S';
        3: S := S + '1';
      end;
      {07}S := S + '               ';
      {08}S := S + '   ';
      {09}S := S + Bib.FormataTexto(' ', 29);
      {10/11}S := S + 'V.01';
      {12}S := S + Bib.FormataTexto(' ', 26);
      S := S + Chr(13) + Chr(10);
      //----FINAL Registro Header

            //----Inicio Registro Detalhe (TEMPO DE RELACIONAMENTO)
      QRSerasa_Tempo.First;
      while not (QRSerasa_Tempo.eof) do
      begin
        inc(wContRelac);
        {01}S := S + '01';
        {02}S := S + RMaskCGC_CPF(QRSerasa_TempoNum_CGC_CPF.Text, 14);
        {03}S := S + '01';
        {04}S := S + FormatDateTime('yyyymmdd',
          QRSerasa_TempoDt_Cadastro.Value);
        if (date - QRSerasa_TempoDt_Cadastro.Value) > 365 then
          wTipoCliente := '1'
        else
          wTipoCliente := '2';
        {05}S := S + wTipoCliente;
        {6-9}S := S + Bib.FormataTexto(' ', 103) + Chr(13) + Chr(10);
        QRSerasa_Tempo.next;
        if FContasReceberParam.Rg27TipoMov.ItemIndex = 1 then
          // para arquivo teste somente gera 1000 registros
          if wContRelac = 1000 then
            Break;
      end;
      //----FINAL Registro TEMPO DE RELACIONAMENTO

      //----Inicio Registro Detalhe (DUPLICATAS/TITULOS)
      QRSerasa.First;
      while not (QRSerasa.eof) do
      begin
        inc(wContDupli);
        {01}S := S + '01';
        {02}S := S + RMaskCGC_CPF(QRSerasaNum_CGC_CPF.Text, 14);
        {03}S := S + '05';
        {04}S := S + RMaskCGC_CPF(QRSerasaNum_Nota.Text +
          QRSerasaNum_Parcela.Text, 10);
        {05}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Emissao.Value);
        if QRSerasaVal_Original.Text <> '' then
        begin
          {06}S := S + intdecimais(QRSerasaVAL_ORIGINAL.Text, 13, 2);
          {07}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Vencimento.Value);
          // VENCIMENTO
        {08}S := S + '        '; // DATA DE PAGAMENTO
        end
        else
        begin
          {06}S := S + intdecimais(QRSerasaVAL_TITULO.Text, 13, 2);
          {07}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Emissao.Value);
          {08}S := S + FormatDateTime('yyyymmdd', QRSerasaDt_Emissao.Value);
          ;
        end;
        {09}S := S + Bib.FormataTexto(' ', 65) + Chr(13) + Chr(10);
        QRSerasa.next;
        if FContasReceberParam.Rg27TipoMov.ItemIndex = 1 then
          // para arquivo teste somente gera 1000 registros
          if wContDupli >= 1000 then
            Break;
      end;
      //----Inicio Registro Detalhe (DUPLICATAS/TITULOS)

      //----Inicio Registro Detalhe (TITULOS BAIXADOS)
      QSerasa_Recebto.First;
      while not (QSerasa_Recebto.eof) do
      begin
        if QSerasa_RecebtoVal_Titulo.Value > 0 then
        begin
          inc(wContDupli);
          {01}S := S + '01';
          {02}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_CGC_CPF.Text, 14);
          {03}S := S + '05';
          {04}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_Titulo.Text + 'A', 10);
          {05}S := S + FormatDateTime('yyyymmdd',
            QSerasa_RecebtoDt_Emissao.Value);
          {06}S := S + intdecimais(QSerasa_RecebtoVal_Titulo.Text, 13, 2);
          {07}S := S + FormatDateTime('yyyymmdd',
            QSerasa_RecebtoDt_Vencimento.Value); // VENCIMENTO
          {08}S := S + '        '; // DATA DE PAGAMENTO
          {09}S := S + Bib.FormataTexto(' ', 65) + Chr(13) + Chr(10);
        end;
        // até aqui foi para gerar o valor do titulo que ficou em aberto
        // agora vai gerar a baixa do titulo
        inc(wContDupli);
        {01}S := S + '01';
        {02}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_CGC_CPF.Text, 14);
        {03}S := S + '05';
        wCont := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_CONTA_RECEBER_MOV',
          'COD_CONTA_RECEBER_CAB =' + QSerasa_RecebtoCod_Conta_Receber_Cab.Text
          +
          ' And Ind_Tipo_Movimento=' + Chr(39) + 'RECEBTO. PRINCIPAL' +
          Chr(39));
        if StrToInt(wCont) = 1 then
          // quando gera pela primeira vez - é a parcela na baixa parcial é colocado um A no numero da parcela
          {04}S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_Titulo.Text +
            QSerasa_RecebtoNum_Parcela.Text, 10)
        else
          S := S + RMaskCGC_CPF(QSerasa_RecebtoNum_Titulo.Text + 'A', 10);
        {05}S := S + FormatDateTime('yyyymmdd',
          QSerasa_RecebtoDt_Emissao.Value);
        {06}S := S + intdecimais(QSerasa_RecebtoVal_Movimento.Text, 13, 2);
        {07}S := S + FormatDateTime('yyyymmdd',
          QSerasa_RecebtoDt_Vencimento.Value); // VENCIMENTO
        {08}S := S + FormatDateTime('yyyymmdd',
          QSerasa_RecebtoDt_Movimento.Value); // DATA DE PAGAMENTO
        {09}S := S + Bib.FormataTexto(' ', 65) + Chr(13) + Chr(10);
        QSerasa_Recebto.next;
        if FContasReceberParam.Rg27TipoMov.ItemIndex = 1 then
          // para arquivo teste somente gera 1000 registros
          if wContDupli >= 1000 then
            Break;
      end;
      //----Inicio Registro Detalhe (DUPLICATAS/TITULOS)

      //----Inicio Registro Trailer
        {01}S := S + '99';
      {02}S := S + RMaskCGC_CPF(IntToStr(wContRelac), 11);
      {03}S := S + Bib.FormataTexto(' ', 44);
      {04}S := S + RMaskCGC_CPF(IntToStr(wContDupli), 11);
      {08}S := S + Bib.FormataTexto(' ', 61);
      QRSerasa.next;
      //--------Fim Registro Trailer

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        MessageDlg('Arquivo Serasa Gerado com Sucesso!', mtInformation, [mbOk],
          0);
      end
      else
        MessageDlg('Arquivo Serasa não foi Gerado!', mtWarning, [mbOk], 0);
    end;
  end;

end;

procedure TFContasReceberCad.TotaldeCRporPerodo1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[28].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME28Filial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber_Rel do
    begin
      QRTotalCRPeriodo.Close;

      if Trim(FContasReceberParam.ME28Class.Text) <> '' then
        QRTotalCRPeriodo.SetVariable('CLASSIFICACAO',
          FContasReceberParam.ME28Class.Text)
      else
        QRTotalCRPeriodo.SetVariable('CLASSIFICACAO', Null);

      if Trim(FContasReceberParam.ME28Filial.Text) <> '' then
        QRTotalCRPeriodo.SetVariable('FILIAL',
          FContasReceberParam.ME28Filial.Text)
      else
        QRTotalCRPeriodo.SetVariable('FILIAL', Null);

      if ((Trim(FContasReceberParam.ME28DtInicial.text) = '') or
        (Trim(FContasReceberParam.ME28Dtfinal.text) = '')) then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado')
      else
        QRTotalCRPeriodo.SetVariable('DT_INICIAL',
          FContasReceberParam.ME28DtInicial.Text);
      QRTotalCRPeriodo.SetVariable('DT_FINAL',
        FContasReceberParam.ME28DtFinal.Text + ' 23:59:59');

      QRTotalCRPeriodo.Open;
    end;
    if FRTotalCRPeriodo = nil then
      FRTotalCRPeriodo := TFRTotalCRPeriodo.Create(Application);
    FRTotalCRPeriodo.QRLPeriodo.Caption := 'Período de : ' +
      FContasReceberParam.Me28DtInicial.Text + ' Até : ' +
      FContasReceberParam.Me28DtFinal.Text;
    FRTotalCRPeriodo.QRLFilial.Caption := 'Filial:' +
      Trim(FContasReceberParam.Me28Filial.Text) + ' - ' +
      FContasReceberParam.Ed28Filial.Text +
      ' Classificação: ' + FContasReceberParam.Ed28Class.Text;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRTotalCRPeriodo.QRPrimario.Preview
    else
      FRTotalCRPeriodo.QRPrimario.Print;

    DMContasReceber_Rel.QRTotalCRPeriodo.Close;
  end;
end;

procedure TFContasReceberCad.BoletimdeRegistroSCPC1Click(Sender: TObject);
var
  Path, campo: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[29].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    Path := ExtractFilePath(ParamStr(0)) + 'doc\';
    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'scpc.doc');

    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('SELECT ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DT_NASCIMENTO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NUM_INSCRICAO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NUM_CGC_CPF, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_ENDERECO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_BAIRRO, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_CEP, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME_PAI, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME_MAE, ');
    DMOracle.QExecSQL.SQL.Add('  TE.DESC_ESTADO_CIVIL, ');
    DMOracle.QExecSQL.SQL.Add('  TC.NOME_CONJUGE, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DT_NASCIMENTO_CONJUGE, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_NATURALIDADE, ');
    DMOracle.QExecSQL.SQL.Add('  TC.DESC_ESTADO_NATURAL ');
    DMOracle.QExecSQL.SQL.Add('FROM');
    DMOracle.QExecSQL.SQL.Add('  TB_CADASTRO TC,');
    DMOracle.QExecSQL.SQL.Add('  TB_ESTADO_CIVIL TE');
    DMOracle.QExecSQL.SQL.Add('WHERE');
    DMOracle.QExecSQL.SQL.Add('  TC.COD_ESTADO_CIVIL = TE.COD_ESTADO_CIVIL(+)');
    DMOracle.QExecSQL.SQL.Add('  AND');
    DMOracle.QExecSQL.SQL.Add('  TC.COD_CADASTRO = ' +
      DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
    DMOracle.QExecSQL.open;

    campo := DMOracle.QExecSQL.fieldbyName('NOME').AsString;
    Doc.Content.Find.Execute(FindText := '%nome_completo', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DT_NASCIMENTO').AsString;
    Doc.Content.Find.Execute(FindText := '%dt_nascimento_pessoa', ReplaceWith :=
      campo, Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('NUM_INSCRICAO').AsString;
    Doc.Content.Find.Execute(FindText := '%rg', ReplaceWith := campo, Replace :=
      2);

    campo := DMOracle.QExecSQL.fieldbyName('NUM_CGC_CPF').AsString;
    Doc.Content.Find.Execute(FindText := '%cpf', ReplaceWith := campo, Replace
      := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_ENDERECO').AsString;
    Doc.Content.Find.Execute(FindText := '%endereco', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_BAIRRO').AsString;
    Doc.Content.Find.Execute(FindText := '%bairro', ReplaceWith := campo, Replace
      := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_CEP').AsString;
    Doc.Content.Find.Execute(FindText := '%cep', ReplaceWith := campo, Replace
      := 2);

    campo := DMOracle.QExecSQL.fieldbyName('NOME_MAE').AsString + '/' +
      DMOracle.QExecSQL.fieldbyName('NOME_PAI').AsString;
    Doc.Content.Find.Execute(FindText := '%filiacao', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_ESTADO_CIVIL').AsString;
    Doc.Content.Find.Execute(FindText := '%estado_civil', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('NOME_CONJUGE').AsString;
    Doc.Content.Find.Execute(FindText := '%nome_esposa', ReplaceWith := campo,
      Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DT_NASCIMENTO_CONJUGE').AsString;
    Doc.Content.Find.Execute(FindText := '%dt_nascimento_esposa', ReplaceWith :=
      campo, Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_NATURALIDADE').AsString;
    Doc.Content.Find.Execute(FindText := '%naturalidade_devedor', ReplaceWith :=
      campo, Replace := 2);

    campo := DMOracle.QExecSQL.fieldbyName('DESC_ESTADO_NATURAL').AsString;
    Doc.Content.Find.Execute(FindText := '%estado_naturalidade_devedor',
      ReplaceWith := campo, Replace := 2);

    campo := FContasReceberParam.ME29NomeAvalista.Text;
    Doc.Content.Find.Execute(FindText := '%nome_avalista', ReplaceWith := campo,
      Replace := 2);

    if FContasReceberParam.RG29RegistroIntercambio.ItemIndex = 0 then
    begin
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_sim',
        ReplaceWith := 'X', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_nao',
        ReplaceWith := ' ', Replace := 2);
    end;

    if FContasReceberParam.RG29RegistroIntercambio.ItemIndex = 1 then
    begin
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_sim',
        ReplaceWith := ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%registro_intercambio_nao',
        ReplaceWith := 'X', Replace := 2);
    end;

    campo := DMContasReceber.QContasReceber_CabDT_EMISSAO.Text;
    Doc.Content.Find.Execute(FindText := '%dt_compra', ReplaceWith := campo,
      Replace := 2);

    campo := DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Text;
    Doc.Content.Find.Execute(FindText := '%dt_vencimento', ReplaceWith := campo,
      Replace := 2);

    campo := FContasReceberParam.ME29DtEmissaoSCPC.Text;
    Doc.Content.Find.Execute(FindText := '%dt_envio_scpc', ReplaceWith := campo,
      Replace := 2);

    campo := DMContasReceber.QContasReceber_CabNUM_TITULO.Text;
    Doc.Content.Find.Execute(FindText := '%num_contrato', ReplaceWith := campo,
      Replace := 2);

    campo := DMContasReceber.QContasReceber_CabVAL_TITULO.Text;
    Doc.Content.Find.Execute(FindText := '%val_divida', ReplaceWith := campo,
      Replace := 2);

    if FContasReceberParam.RG29MotivoRegistro.ItemIndex = 0 then
    begin
      Doc.Content.Find.Execute(FindText := '%mot_saldo_devedor', ReplaceWith :=
        'X', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_avalista_devedor', ReplaceWith
        := ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_cheque', ReplaceWith := ' ',
        Replace := 2);
    end;

    if FContasReceberParam.RG29MotivoRegistro.ItemIndex = 1 then
    begin
      Doc.Content.Find.Execute(FindText := '%mot_saldo_devedor', ReplaceWith :=
        ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_avalista_devedor', ReplaceWith
        := 'X', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_cheque', ReplaceWith := ' ',
        Replace := 2);
    end;

    if FContasReceberParam.RG29MotivoRegistro.ItemIndex = 2 then
    begin
      Doc.Content.Find.Execute(FindText := '%mot_saldo_devedor', ReplaceWith :=
        ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_avalista_devedor', ReplaceWith
        := ' ', Replace := 2);
      Doc.Content.Find.Execute(FindText := '%mot_cheque', ReplaceWith := 'X',
        Replace := 2);
    end;

    Doc.SaveAs(Path + 'scpc_gerado.Doc');
  end;
end;

procedure TFContasReceberCad.ResumoMovContasaReceber1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[30].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME30CodFilial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME30Inicial.text) = '') or
      (Trim(FContasReceberParam.ME30Final.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber do
    begin
      QRResumoMovCReceber.Close;
      if Trim(FContasReceberParam.ME30CodCliente.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME30CodCliente.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.ME30CodDepto.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.ME30CodDepto.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.ME30CodFilial.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_FILIAL',
          FContasReceberParam.ME30CodFilial.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_FILIAL', Null);
      if Trim(FContasReceberParam.ME30CodVendedor.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_VENDEDOR',
          FContasReceberParam.ME30CodVendedor.Text)
      else
        QRResumoMovCReceber.SetVariable('COD_VENDEDOR', Null);
      if Trim(FContasReceberParam.ME30CC.Text) <> '' then
        QRResumoMovCReceber.SetVariable('CC', FContasReceberParam.ME30CC.Text)
      else
        QRResumoMovCReceber.SetVariable('CC', Null);

      if Trim(FContasReceberParam.ME30Finalidade.Text) <> '' then
        QRResumoMovCReceber.SetVariable('COD_FINALIDADE',
          trim(FContasReceberParam.ME30Finalidade.Text))
      else
        QRResumoMovCReceber.SetVariable('COD_FINALIDADE', Null);

      QRResumoMovCReceber.SetVariable('INICIAL',
        FContasReceberParam.ME30Inicial.Text);
      QRResumoMovCReceber.SetVariable('FINAL',
        FContasReceberParam.ME30Final.Text);

      case FContasReceberParam.RG30FormaPagamento.ItemIndex of
        0: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', 'Bancos (');
        2: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', 'Contábil');
        3: QRResumoMovCReceber.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;

      QRResumoMovCReceber.open;
    end;
    if FRResumoMovCReceber = nil then
      FRResumoMovCReceber := TFRResumoMovCReceber.Create(Application);
    FRResumoMovCReceber.QRLPeriodo.Caption := 'PERIODO DE: ' +
      FContasReceberParam.ME30Inicial.Text + ' ATÉ : ' +
      FContasReceberParam.ME30Final.Text;
    //   FRResumoMovCReceber.QRLCC.Caption:='Conta Corrente: '+FContasReceberParam.Ed2CC.Text;

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRResumoMovCReceber.QRPrimario.Preview
    else
      FRResumoMovCReceber.QRPrimario.Print;

  end;
end;

procedure TFContasReceberCad.SpeedButton1Click(Sender: TObject);
var
  wObs, wComando: string;
begin
  inherited;
  if InputQuery('Alteração', 'Observação', wObs) then
  begin
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET DESC_OBSERVACAO=' + Chr(39) +
        wObs + Chr(39);
      wComando := wComando + ' WHERE COD_CONTA_RECEBER_CAB = ' +
        FloatToStr(DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    end;
  end;
end;

procedure TFContasReceberCad.Autorizaodefatura1Click(Sender: TObject);
var
  Path, campo, rg_contato_cli, cpf_contato_cli, cid_contato_cli,
    est_contato_cli, rg_contato_fil, cpf_contato_fil, cid_contato_fil,
    est_contato_fil: string;
begin
  if DMContasReceber.QContasReceber_cabCOD_CONTA_RECEBER_CAB.value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMContasReceber.QContasReceber_cabCOD_FILIAL.Text), 'CONTAS A RECEBER');
    Path := ExtractFilePath(ParamStr(0)) + 'Contratos\';

    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_FILIAL.Value);
    DMFilial.QFilial.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',
      DMContasReceber.QContasReceber_cabCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;

    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'Autorizacao');

    campo := DMFilial.QFilialDESC_FILIAL.Value;
    Doc.Content.Find.Execute(FindText := '%desc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialNum_CGC.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_filial', ReplaceWith :=
      campo, Replace := 2);
    campo := DMFilial.QFilialDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialCod_estado.Value;
    Doc.Content.Find.Execute(FindText := '%estado_filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%I.E._filial', ReplaceWith := campo,
      Replace := 2);
    campo := DMFilial.QFilialDESC_CEP.Value;
    Doc.Content.Find.Execute(FindText := '%cep_filial', ReplaceWith := campo,
      Replace := 2);

    campo := DMCadastro.QCadastroNOME.Value;
    Doc.Content.Find.Execute(FindText := '%nome_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := IntToStr(DMCadastro.QCadastroCOD_CADASTRO.Value);
    Doc.Content.Find.Execute(FindText := '%cod_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%rg_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_CGC_CPF.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_cadastro', ReplaceWith :=
      campo, Replace := 2);
    campo := DMCadastro.QCadastroCOD_ESTADO.value;
    Doc.Content.Find.Execute(FindText := '%uf_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%I.E._cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroDESC_CEP.Value;
    Doc.Content.Find.Execute(FindText := '%cep_cadastro', ReplaceWith := campo,
      Replace := 2);
    campo := DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Value;
    Doc.Content.Find.Execute(FindText := '%inscricao_municipal_cadastro',
      ReplaceWith := campo, Replace := 2);

    //campo:=DateToStr(DMContasReceber.QContasReceber_CabDT_EMISSAO.Value);
    //Doc.Content.Find.Execute(FindText := '%dt_emissao',ReplaceWith := campo,Replace:=2);
    //campo:=DateToStr(DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Value);
    //Doc.Content.Find.Execute(FindText := '%dt_vencimento',ReplaceWith := campo,Replace:=2);
    campo := FormatDateTime(' dd "de" MMMM "de" yyyy',
      DMContasReceber.QContasReceber_CabDT_EMISSAO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_emissao_ext', ReplaceWith :=
      campo, Replace := 2);
    campo := FormatDateTime(' dd "de" MMMM "de" yyyy',
      DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_venc_ext', ReplaceWith := campo,
      Replace := 2);

    // Grava documento
    Doc.SaveAs(Path + 'Autorizacao-' + chr(39) + DMCadastro.QCadastroNOME.Value
      + chr(39));
    // Imprime
    //Doc.PrintOut(false);
    // Fecha o Word
//      WinWord.Quit;
  end
  else
    MessageDlg('Primeiro selecione uma CONTA a RECEBER', mtInformation, [mbOk],
      0);
end;

procedure TFContasReceberCad.TitAbertosSintticoporDepto1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[31].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME31Filial.Text,
      'CONTAS A RECEBER');
    if (Trim(FContasReceberParam.ME31DtInicial.text) = '') or
      (Trim(FContasReceberParam.ME31DtFinal.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');
    with DMContasReceber_Rel do
    begin
      QRTitulosAberto_Depto_Sint.Close;

      {if Trim(FContasReceberParam.ME31Departamento.Text) <> '' then
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTO',
          FContasReceberParam.ME31Departamento.Text)
      else
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTO', Null);}

      if Trim(FContasReceberParam.Ed31Departamento.Text) = 'VÁRIOS' then
      begin
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTO',null);
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTOS', 'TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasReceberParam.ME31departamento.Text) + ')')
      end
      else
      begin
        QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasReceberParam.ME31departamento.Text) <> '' then
          QRTitulosAberto_Depto_Sint.SetVariable('DEPARTAMENTO', Trim(FContasReceberParam.ME31departamento.Text));
      end;

      if Trim(FContasReceberParam.ME31Filial.Text) <> '' then
        QRTitulosAberto_Depto_Sint.SetVariable('FILIAL',
          FContasReceberParam.ME31Filial.Text)
      else
        QRTitulosAberto_Depto_Sint.SetVariable('FILIAL', Null);

      QRTitulosAberto_Depto_Sint.SetVariable('DT_INICIAL',
        FContasReceberParam.ME31DtInicial.Text);
      QRTitulosAberto_Depto_Sint.SetVariable('DT_FINAL',
        FContasReceberParam.ME31DtFinal.Text + ' 23:59:59');

      QRTitulosAberto_Depto_Sint.open;
    end;
    if FRTituloAberto_Depto_Sint = nil then
      FRTituloAberto_Depto_Sint :=
        TFRTituloAberto_Depto_Sint.Create(Application);
    FRTituloAberto_Depto_Sint.QRLPeriodo.Caption := 'PERIODO DE: ' +
      FContasReceberParam.ME31DtInicial.Text + ' ATÉ : ' +
      FContasReceberParam.ME31DtFinal.Text;

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRTituloAberto_Depto_Sint.QRPrimario.Preview
    else
      FRTituloAberto_Depto_Sint.QRPrimario.Print;

  end;

end;

procedure TFContasReceberCad.RelatrioMovimentao1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[32].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    if (Trim(FContasReceberParam.ME32Data_I.text) = '') or
      (Trim(FContasReceberParam.ME32Data_F.Text) = '') then
      raise Exception.Create('Data ínicial/Final não pode ficar em branco!');

    if (Trim(FContasReceberParam.ME32Cadastro.text) = '') then
      raise Exception.Create('Cadastro não pode ficar em branco!');

    with DMContasReceber_Rel do
    begin
      QRMovimentacao.close;
      if Trim(FContasReceberParam.ME32Filial.Text) <> '' then
        QRMovimentacao.SetVariable('COD_FILIAL',
          FContasReceberParam.ME32Filial.Text)
      else
        QRMovimentacao.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME32Cadastro.Text) <> '' then
        QRMovimentacao.SetVariable('COD_CADASTRO',
          FContasReceberParam.ME32Cadastro.Text)
      else
        QRMovimentacao.SetVariable('COD_CADASTRO', Null);

      QRMovimentacao.SetVariable('DATA_I', FContasReceberParam.ME32Data_I.Text);
      QRMovimentacao.SetVariable('DATA_F', FContasReceberParam.ME32Data_F.Text + ' 23:59:59');

      if FContasReceberParam.RG32Ordem.ItemIndex = 1 then
        QRMovimentacao.SQL[QRMovimentacao.SQL.Count - 1] :=
          'TB_CONTA_RECEBER_CAB.NUM_TITULO, TB_CONTA_RECEBER_CAB.NUM_PARCELA';

      QRMovimentacao.open;
    end;

    if FRMovimentacao = nil then
      FRMovimentacao := TFRMovimentacao.Create(Application);

    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRMovimentacao.QRPrimario.Preview
    else
      FRMovimentacao.QRPrimario.Print;
  end;
end;

procedure TFContasReceberCad.DBEdit19KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 123 then //123 --> F12
    BtCliente.Click;
end;

procedure TFContasReceberCad.Sicredicnab240v0811Click(Sender: TObject);
var
  mNUM_CEDENTE, mNUM_CONVENENTE, mBrancos, mPrefixoTitulo, mContaCaucao,
    mTipoInscricao, s, wVal, mCodNossoNumero: string;
  wNumTitulo, wNumCC: string;
  x, iSeq, mSequencial, iQtdRegLote: Integer;
  mSEQ_REMESSA, wval_total: Real;
  F: TextFile;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[24].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    S := '';
    with DMContasReceber do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.ME24CodFilial.text), 'CONTAS A RECEBER');
      QRemessa.Close;

      if Trim(FContasReceberParam.ME24CodFilial.text) <> '' then
        QRemessa.SetVariable('COD_FILIAL',
          FContasReceberParam.ME24CodFilial.text)
      else
        QRemessa.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.ME24CodContaCorrente.text) <> '' then
        QRemessa.SetVariable('COD_CONTA_CORRENTE',
          FContasReceberParam.ME24CodContaCorrente.text)
      else
        QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

      if Trim(FContasReceberParam.ME24DtInicial.text) <> '' then
        QRemessa.SetVariable('DT_INICIAL',
          FContasReceberParam.ME24DtInicial.text)
      else
        QRemessa.SetVariable('DT_INICIAL', Null);

      if Trim(FContasReceberParam.ME24DtFinal.text) <> '' then
        QRemessa.SetVariable('DT_FINAL', FContasReceberParam.ME24DtFinal.text + ' 23:59:59')
      else
        QRemessa.SetVariable('DT_FINAL', Null);

      if Trim(FContasReceberParam.Me24NrTitulo.text) <> '' then
        QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Me24NrTitulo.text)
      else
        QRemessa.SetVariable('NUM_TITULO', Null);

      QRemessa.SetVariable('IND_REMESSA', 'NAO');

      QRemessa.Open;

      if not QRemessa.Eof then
      begin

        try
          {-------HEADER DO ARQUIVO - REGISTRO 0-------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0000'; {004-007|04|LOTE DE SERVICO}
          s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
          s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14);
          s := s + wVal; {019-032|14|N DE INSCRICAO DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '1' then
            wVal := copy(QRemessaNUM_CONVENIO.Text + '                    ', 1,
              20)
          else
            wVal := '                    ';
          s := s + wVal; {033-052|20|N convenio DA EMPRESA}

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
          s := s + wVal; {053-057|05|AGENCIA MANTENEDORA DA CONTA}

          wVal := ' ';
          s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            12)), 12);
          s := s + wVal; {059-070|12|NUMERO DA CONTA CORRENTE}

          wVal := ' ';
          s := s + wVal; {071-071|01|DIGITO VERIFICADOR DA CONTA}

          wVal := ' ';
          s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {073-102|30|NOME DA EMPRESA}

          wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
            '                              ', 1, 30);
          s := s + wVal; {103-132|30|NOME DO BANCO}

          s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

          s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
            '');
          s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

          wVal :=
            DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''HH24MISS'') FROM DUAL',
            '');
          s := s + wVal; {152-157|06|DATA DE GERACAO DO ARQUIVO}

          if QRemessaCOD_BANCO.Text = '1' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_BB')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '422' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SAFRA')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else if QRemessaCOD_BANCO.Text = '748' then
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_SICREDI-V240')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end
          else
          begin
            wVal :=
              RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
              'ARQ_REM_UNIBANCO')), 6);
            s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          end;

          if QRemessaCOD_BANCO.Text = '1' then
            s := s + '082' {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}
          else
            s := s + '081'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

          s := s + '01600'; {167-171|05|DENSIDADE DA GRAVAÇÃO DO ARQUIVO}

          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '                    ';
          {172-240|69|PARA USO RESERVADO DO BANCO}
          s := s + '         '; {172-240|69|PARA USO RESERVADO DO BANCO}

          {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

          {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
          s := s + #13#10; {QUEBRA DE LINHA}

          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
          s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
          s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
          s := s + '01'; {010-011|02|TIPO DE SERVICO}
          s := s + '  '; {012-013|02|USO DO BANCO}
          s := s + '040'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
          s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
          s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

          if QRemessaCOD_BANCO.Text = '1' then
            wVal := copy(QRemessaNUM_CONVENIO.Text + '                    ', 1,
              20)
          else
            wVal := '                    ';
          s := s + wVal; {--034-053|20|CODIGO DO CONVENIO NO BANCO---}

          wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
          s := s + wVal; {054-058|05|AGENCIA MANTENEDORA DA CONTA}

          wVal := ' ';
          s := s + wVal; {059-059|01|DIGITO VERIFICADOR DA AGENCIA}

          wVal :=
            RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
            12)), 12);
          s := s + wVal; {060-071|12|NUMERO DA CONTA CORRENTE}

          wVal := ' ';
          s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA}

          wVal := ' ';
          s := s + wVal; {073-073|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

          wVal := copy(QRemessaDESC_FILIAL.Text +
            '                              ', 1, 30);
          s := s + wVal; {074-103|30|NOME DA EMPRESA}

          wVal := '                                        ' +
            '                                        ' +
            '                00000000                ' +
            '                 ';
          s := s + wVal; {104-240|137|USO DO BANCO}
          {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

          iSeq := 1;
          iQtdRegLote := 2; //2--> header e trailer
          while not QRemessa.Eof do
          begin
            s := s + #13#10;
            {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

            wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
            s := s + wVal; {018-022|05|AGENCIA MANTENEDORA DA CONTA}

            wVal := ' ';
            s := s + wVal; {023-023|01|DIGITO VERIFICADOR DA AGENCIA}

            wVal :=
              RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
              12)), 12);
            s := s + wVal; {024-035|12|NUMERO DA CONTA CORRENTE}

            wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ', 1,
              1);
            s := s + wVal; {036-036|01|DIGITO VERIFICADOR DA CONTA}

            wVal := ' ';
            s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA CONTA}

            wVal := copy(QRemessaCOD_NOSSO_NUMERO.Text + '00000000000000000000',
              1, 20);
            s := s + wVal; {038-057|20|NOSSO NUMERO}

            s := s + '1'; {058-058|01|TIPO DE COBRANÇA}

            wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
            s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

            wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text + ' ', 1, 1);
            s := s + wVal;
            {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

          //wVal := copy(QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO.Text+' ',1,1);
          //s := s + wVal;       {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}
            if QRemessaCOD_NOSSO_NUMERO.Text = '' then
              wVal := '1'
            else
              wVal := '2';
            s := s + wVal; {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}

            wVal := copy(QRemessaCOD_IDENTIF_DISTRIBUICAO.Text + ' ', 1, 1);
            s := s + wVal; {062-062|01|IDENTIFICAÇÃO DA DISTRIBUIÇÃO)}

            wVal := copy(QRemessaNUM_TITULO.Text + '               ', 1, 15);
            s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}

            wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
              copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

            wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
            wval_total := wval_total + QRemessaVAL_TITULO.Value;
            s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

            wVal := '00000';
            s := s + wVal; {101-105|05|AGENCIA MANTENEDORA DA CONTA}

            wVal := ' ';
            s := s + wVal; {106-106|01|DIGITO VERIFICADOR DA AGENCIA}

            s := s + '03'; {107-108|02|ESPECIE DO TITULO}

            wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
            s := s + wVal;
            {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

            wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
              copy(QRemessaDT_EMISSAO.Text, 4, 2) +
              copy(QRemessaDT_EMISSAO.Text, 7, 4);
            wVal := copy(wVal + '        ', 1, 8);
            s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}

            s := s + '1'; {118-118|01|CODIGO DE JUROS DE MORA}

            //wVal := copy(QRemessaDT_VENCIMENTO.Text,1,2) +
            //        copy(QRemessaDT_VENCIMENTO.Text,4,2) +
            //        copy(QRemessaDT_VENCIMENTO.Text,7,4);
            //wVal := copy(wVal + '        ',1,8);
            wVal := '00000000';
            s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}

            if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
              //alterado Marcos 15/05/06
              wVal := IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                (QRemessaVal_Titulo.Value / 100)), 15, 2)
            else
              wVal := StrZero(QRemessaPERC_TAXA.Value, 15, 2);

            s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

            s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
            s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
            s := s + '000000000000000';
            {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
            s := s + '000000000000000';
            {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
            s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

            wVal := copy('      ' + QRemessaCOD_FILIAL.Text, 1, 6);
            s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
            s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
            s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
            wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
            s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
            s := s + '    '; {217-220|4|USO DA CEMAPA}

            if QRemessaCOD_PROTESTO.Value = '1' then
              wVal := copy(QRemessaCOD_PROTESTO.Text + '0', 1, 1)
            else
              wVal := '3';
            s := s + wVal;
            {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA}

            wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
            s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}

            s := s + '1';
            {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}

            s := s + ' 60';
            {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
            s := s + '09'; {228-229|02|CODIGO DA MOEDA (REAL)}

            s := s + '0000000000'; {230-239|11|USO EXCLUSIVO DO BANCO}

            s := s + ' '; {240-240|11|USO EXCLUSIVO DO BANCO}
            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

            s := s + #13#10; {QUEBRA DE LINHA}
            {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

            wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
            s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
            s := s + '0001'; {004-007|04|LOTE DE SERVICO}
            s := s + '3'; {008-008|01|REGISTRO DETALHE}

            wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
            s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
            s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
            s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
            s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}

            wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text, 1, 1);
            if wVal = 'F' then
              wVal := '1'
            else if wVal = 'J' then
              wVal := '2'
            else
              wVal := '0';

            s := s + wVal; {018-018|01|TIPO DE INSCRICAO}

            wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
            s := s + wVal; {019-033|15|N DE INSCRICAO}

            wVal := copy(QRemessaNOME.Text +
              '                                        ', 1, 40);
            s := s + wVal; {034-073|40|NOME}

            wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
              '                                        ', 1, 40);
            s := s + wVal; {074-113|40|ENDERECO}

            wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
            s := s + wVal; {114-128|15|BAIRRO}

            wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
              '     ', 1, 8);
            s := s + wVal; {129-136|08|CEP}

            // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
            // s := s + wVal;       {134-136|03|SUFIXO DO CEP}

            wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
              1, 15);
            s := s + wVal; {137-151|15|CIDADE}

            wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
            s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}

            //wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text,1,1);
            //if wVal = 'F' then
            //  wVal := '1'
            //else if wVal = 'J' then
            //  wVal := '2'
            //else
            //  wVal := '0';
            //s := s + wVal;       {154-154|01|TIPO DE INSCRICAO}

            //wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,15);
            //s := s + wVal;       {155-169|15|N DE INSCRICAO}
            wVal := '0000000000000000';
            s := s + wVal; {154-154|01|TIPO DE INSCRICAO}
            {155-169|15|N DE INSCRICAO}

            wVal := '                                        ';
            s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}

            s := s + '000'; {210-212|03|Cod. banco correpondente}

            s := s + '   ';
            {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}

            s := s + '   '; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}

            s := s + '   '; {219-221|03|NUMERO DO PLANO}

            s := s + '                   '; {222-240|19|USO DO BANCO}

            iSeq := iSeq + 1;
            iQtdRegLote := iQtdRegLote + 1;
            {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
            QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
              QRemessaCOD_CONTA_RECEBER_CAB.Value);
            QEnviadoBanco.ExecSQL;
            QRemessa.Next;
          end;

          QRemessa.First;

          s := s + #13#10;
          {------------TRAILER DE LOTE--------------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
          s := s + '0001'; {004-007|04|LOTE DE SERVICO}
          s := s + '5'; {008-008|01|REGISTRO TRAILER DE LOTE}
          s := s + '         '; {009-017|09|USO EXCLUSIVO DO BANCO}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote), 6);
          s := s + wVal; {018-023|06|QUANTIDADE DE REGISTROS DO LOTE}

          wVal := RMaskCGC_CPF(FloatToStr((iQtdRegLote - 2) / 2), 6);
          s := s + wVal; {024-029|06|QUANTIDADE DE TITULOS EM COBRANÇA}

          wVal := StrZero(wval_total, 17, 2);
          s := s + wVal; {030-046|15,2|VALOR TOTAL DOS TITULOS EM CARTEIRA}

          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------FIM - TRAILER DE LOTE--------------------}

          s := s + #13#10; {QUEBRA DE LINHA}
          {------------TRAILER DE ARQUIVO-----------------}
          wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
          s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}

          s := s + '9999'; {004-007|04|LOTE DE SERVICO}
          s := s + '9'; {008-008|01|REGISTRO TRAILER DE ARQUIVO}
          s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN}
          s := s + '000001'; {018-023|06|QUANTID. DE LOTES DO ARQUIV}

          wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
          s := s + wVal; {024-029|06|QTDADE DE REGISTROS DO ARQUIV}
          s := s + '000000'; {030-035|06|USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
          s := s + '     '; {USO EXCLUSIVO FEBRABAN/CNAB}

          {------------TRAILER DE ARQUIVO-----------------}

                   //------------------ Fim --------------------------\\
          wNumCC := ''; //USADO PARA MONTAR O NOME DO ARQUIVO REMESSA
          mSequencial := StrToInt(FormatDateTime('MM', Date));
          case mSequencial of
            10: wNumCC := 'O';
            11: wNumCC := 'N';
            12: wNumCC := 'D';
          else
            wNumCC := IntToStr(mSequencial);
          end;

          Insert(RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5), wNumCC, 1);
          wNumCC := wNumCC + FormatDateTime('dd', Date) + '.CRM';
          FContasReceberParam.SDlg_Remessa.FileName := wNumCC;
          FContasReceberParam.SDlg_Remessa.Filter :=
            'Arquivo de Remessa Bansicredi';
          FContasReceberParam.SDlg_Remessa.DefaultExt := '';
          FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

          if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, wNumCC);
            Rewrite(F);
            Writeln(F, S);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA Sicredi CNAB240 Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA Sicredi não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
          DMOracle.DBCemapa.Rollback;
          raise
            exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
            + #13 +
            'Verifique se não existem campos em branco no cadastro de bancos' + #13
            +
            'ou no cadastro de Clientes/Fornecedores.');
        end;
      end
      else
        MessageDlg('Não existem registros a serem gerados!', mtInformation,
          [mbOk], 0);

      //  if FContasReceberParam.SDlg_Remessa.Execute then
    //    begin
    //      AssignFile( F, FContasReceberParam.SDlg_Remessa.FileName );
     //     Rewrite(F);
     //     Writeln(F, S);
     //     CloseFile(F);
    //      DMOracle.DBCemapa.Commit;
    //      MessageDlg('Arquivo REMESSA CNAB240 VERSÃO 080 Gerado com Sucesso!', mtInformation,[mbOk], 0);
    //    end;
   //   except
   //   MessageDlg('Sem Movimento nesse Periodo', mtInformation,[mbOk], 0);
   //   end;
    end;
  end;
end;

procedure TFContasReceberCad.NumBloqEmitidosporBanco1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[33].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    with DMBancoAgenciaRel do
    begin
      QRBloquetosEmitidosBanco.Close;

      if FContasReceberParam.Me34CodFilial.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('COD_FILIAL', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('COD_FILIAL',
          StrToInt(trim(FContasReceberParam.Me34CodFilial.Text)));

      if FContasReceberParam.Me34CodBanco.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('COD_BANCO', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('COD_BANCO',
          StrToInt(trim(FContasReceberParam.Me34CodBanco.Text)));

      if FContasReceberParam.ME34DataI.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('DT_INICIAL', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('DT_INICIAL',
          StrToDate(trim(FContasReceberParam.Me34DataI.Text)));

      if FContasReceberParam.ME34DataF.Text = '' then
        QRBloquetosEmitidosBanco.SetVariable('DT_FINAL', null)
      else
        QRBloquetosEmitidosBanco.SetVariable('DT_FINAL',
          StrToDate(trim(FContasReceberParam.Me34DataF.Text)));

      QRBloquetosEmitidosBanco.Open;
    end;
  end;

  if FRBloqEmitBanco = nil then
    FRBloqEmitBanco := TFRBloqEmitBanco.Create(Application);

  if FContasReceberParam.RGPreview.ItemIndex = 0 then
    FRBloqEmitBanco.QRPrimario.Preview
  else
    FRBloqEmitBanco.QRPrimario.Print;

end;

procedure TFContasReceberCad.Monta_SQL_Safra_Bradesco;
begin
  // Gambiarra exorcizada - Djeison A. Selzlein 01/11/2013
//  with DMContasReceber do
//  begin
//    QRBloqueto.Close;
//    QRBloqueto.Sql.Clear;
//    QRBloqueto.Sql.Add('SELECT ');
//    QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
//    QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
//    QRBloqueto.Sql.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
//    QRBloqueto.Sql.Add('Tb_filial.DESC_FILIAL,Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
//    QRBloqueto.Sql.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,Tb_banco_agencia.IND_TIPO_JURO,');
//    QRBloqueto.Sql.Add('NVL(Tb_banco_agencia.NOSSO_NUMERO,TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) AS NOSSO_NUMERO,');
//    QRBloqueto.Sql.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,Tb_banco_agencia.COD_BANCO,');
//    QRBloqueto.Sql.Add('Tb_banco_agencia.COD_AGENCIA,Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
//    QRBloqueto.Sql.Add('(TB_CONTA_RECEBER_CAB.VAL_TITULO+TB_CONTA_RECEBER_CAB.VAL_JUROS) AS VAL_TITULO,');
//    QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.COD_NOTA_CAB,Tb_conta_receber_cab.COD_FILIAL,');
//    QRBloqueto.Sql.Add('Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.NUM_TITULO,');
//    QRBloqueto.Sql.Add('Tb_conta_receber_cab.NUM_PARCELA,Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,');
//    QRBloqueto.Sql.Add('Tb_conta_receber_cab.IND_ACEITE,');
//    QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_VENDEDOR,');
//    QRBloqueto.Sql.Add('Tb_conta_receber_cab.COD_CONTA_RECEBER_CAB,TB_CADASTRO.NOME AS NOME_SACADO,');
//    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,TB_CADASTRO.COD_CADASTRO,');
//    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CIDADE_COBRANCA,');
//    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,TB_CADASTRO.DESC_ENDERECO,');
//    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_CIDADE,TB_CADASTRO.DESC_CEP_COBRANCA,');
//    QRBloqueto.Sql.Add('TB_CADASTRO.NUM_CGC_CPF,TB_CADASTRO.COD_ESTADO,TB_CONTA_CORRENTE.CARTEIRA,');
//    QRBloqueto.Sql.Add('TB_CADASTRO.DESC_BAIRRO,TB_CONTA_CORRENTE.VARIACAO,TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
//    QRBloqueto.Sql.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA '); //--- adicionado por Fabio na Faville 16/07/2004
//    QRBloqueto.Sql.Add('FROM ');
//    QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL ');
//    QRBloqueto.Sql.Add('WHERE ');
//    QRBloqueto.Sql.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
//    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.COD_CONTA_CORRENTE');
//    QRBloqueto.Sql.Add('AND Tb_conta_receber_cab.COD_BANCO_AGENCIA = Tb_banco_agencia.COD_BANCO_AGENCIA ');
//    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL ');
//    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO is NULL');
//    //Sergio alterado 01/08/2003}
//    QRBloqueto.Sql.Add('AND TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) +
//      'BAIXA TOTAL' + CHR(39));
//
//    DmContasReceber.pVencimentoBloqueto := 'S';
//
//    QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' +
//      Trim(FContasReceberParam.Fm18ContaCorrente.MeContaCorrente.Text));
////    QRBloqueto.Sql.Add('AND TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = ' +
////      Trim(FContasReceberParam.ME19CodBanco.Text));
//
//    if Trim(FContasReceberParam.ME19CodNota.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB >= ' +
//        Trim(FContasReceberParam.ME19CodNota.Text));
//    if Trim(FContasReceberParam.ME19CodNotaF.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB <= ' +
//        Trim(FContasReceberParam.ME19CodNotaF.Text));
////    if Trim(FContasReceberParam.ME19CodBanco.Text) <> '' then
////      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
////        Trim(FContasReceberParam.ME19CodBanco.Text));
//    if Trim(FContasReceberParam.Fm18Filial.MeFilial.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
//        Trim(FContasReceberParam.Fm18Filial.MeFilial.Text));
//    if Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39)
//        + Trim(FContasReceberParam.Fm18DataVenc.MeDtInicial.Text) + chr(39));
//    if Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39)
//        + Trim(FContasReceberParam.Fm18DataVenc.MeDtFinal.Text) + chr(39));
//
//    if Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO >= ' +
//        chr(39) + Trim(FContasReceberParam.Fm18DataEmissao.MeDtInicial.Text) + chr(39));
//    if Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' +
//        chr(39) + Trim(FContasReceberParam.Fm18DataEmissao.MeDtFinal.Text) + chr(39));
//
//    // Filtros de numero de titulo criados por Djeison A. S. - 21/09/2013
//    if Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO >= ' +
//        Trim(FContasReceberParam.Fm18TituloI.MeContasReceber.Text));
//    if Trim(FContasReceberParam.Fm18TituloF.MeContasReceber.Text) <> '' then
//      QRBloqueto.Sql.Add(' AND TB_CONTA_RECEBER_CAB.NUM_TITULO <= ' +
//        Trim(FContasReceberParam.Fm18TituloF.MeContasReceber.Text));
//
//    QRBloqueto.Sql.Add(' ORDER BY Tb_conta_receber_cab.NUM_TITULO');
//    if FContasReceberParam.Rg19Vencimento.ItemIndex = 0 then
//      DmContasReceber.pVencimentoBloqueto := 'S'
//    else
//      DmContasReceber.pVencimentoBloqueto := 'N';
//
//    QRBloqueto.Open;
//  end;
//
//  if (FRBloqueto_Bradesco = nil) then
//    FRBloqueto_Bradesco := TFRBloqueto_Bradesco.Create(Application);
//  FRBloqueto_Bradesco.QRPrimario.Print;

end;

procedure TFContasReceberCad.ZerarComisso1Click(Sender: TObject);
var
  wComissao: string;
begin
  inherited;
  wComissao := '0';
  if InputQuery('Informe Nova Comissão', 'Comissão', wComissao) then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      with DMOracle do
      begin
        if DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value <> 0 then
        begin
          wComissao := Bib.TrocaVirgulaPorPonto(wComissao);
          QexecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTA_RECEBER_CAB SET PERC_COMISSAO = ' +
            wComissao);
          QExecSQL.SQL.Add('WHERE COD_CONTA_RECEBER_CAB =' +
            FloatToStr(DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value));
          QExecSQL.ExecSQL;
          if DMContasReceber.QContasReceber_CabCOD_NOTA_CAB.Value <> Null then
          begin
            QexecSQL.Close;
            QExecSQL.SQL.Clear;
            QExecSQL.SQL.Add('UPDATE TB_NOTA_CAB SET PERC_COMISSAO = ' +
              wComissao);
            QExecSQL.SQL.Add('WHERE TB_NOTA_CAB.COD_NOTA_CAB =' +
              FloatToStr(DMContasReceber.QContasReceber_CabCOD_NOTA_CAB.Value));
            QExecSQL.ExecSQL;

            QexecSQL.Close;
            QExecSQL.SQL.Clear;
            QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM SET PERC_COMISSAO = ' +
              wComissao);
            QExecSQL.SQL.Add('WHERE TB_NOTA_ITEM.COD_NOTA_CAB =' +
              FloatToStr(DMContasReceber.QContasReceber_CabCOD_NOTA_CAB.Value));
            QExecSQL.ExecSQL;
          end;
          DMOracle.DBCemapa.Commit;
          DMContasReceber.QContasReceber_Cab.Close;
          DMContasReceber.QContasReceber_Cab.Open;
          ShowMessage('Operação Efetuada com Sucesso')
        end
        else
          ShowMessage('Selecionar o Titulo Para Zerar Comissão');
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('Operação não Efetuada!');
    end;
  end;
end;

procedure TFContasReceberCad.SBVendedorPublicarClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Vendedor.Value :=
        DMVendedor.QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFContasReceberCad.SBVendedorPublicar1Click(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    with DMContasReceber do
    begin
      QContasReceber_CabCod_Vendedor1.Value :=
        DMVendedor.QVendedorConsCod_Vendedor.Value;
    end;
end;

procedure TFContasReceberCad.RelComissaoClick(Sender: TObject);
begin
  inherited;
  // Relatório de Comissao somente para PUBLICAR
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[34].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.FmFilial35.MeFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRComissaoPublicar.Close;
      if Trim(FContasReceberParam.FmFilial35.MeFilial.Text) <> '' then
        QRComissaoPublicar.SetVariable('FILIAL',Trim(FContasReceberParam.FmFilial35.MeFilial.Text))
      else
        QRComissaoPublicar.SetVariable('FILIAL', Null);
      if Trim(FContasReceberParam.Me35TipoDocumento.Text) <> '' then
        QRComissaoPublicar.SetVariable('COD_SERIE',Trim(FContasReceberParam.Me35TipoDocumento.Text))
      else
        QRComissaoPublicar.SetVariable('COD_SERIE', Null);
      if Trim(FContasReceberParam.Fm1Vendedor35.MeVendedor.Text) <> '' then
        QRComissaoPublicar.SetVariable('VENDEDOR',Trim(FContasReceberParam.Fm1Vendedor35.MeVendedor.Text))
      else
        QRComissaoPublicar.SetVariable('VENDEDOR', Null);
      if Trim(FContasReceberParam.Me35MovimentoData_I.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      QRComissaoPublicar.SetVariable('DATA_I',Trim(FContasReceberParam.Me35MovimentoData_I.text));

      if Trim(FContasReceberParam.Me35MovimentoData_F.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      QRComissaoPublicar.SetVariable('DATA_F',Trim(FContasReceberParam.Me35MovimentoData_F.text) + ' 23:59:59');

      if Trim(FContasReceberParam.Me35EmissaoData_I.Text) = '' then
        raise
          Exception.Create('Campo Data Início Calculo Comissões Deve Ser Informado')
      else
        QRComissaoPublicar.SetVariable('DT_EMISSAO',Trim(FContasReceberParam.Me35EmissaoData_I.Text));
      if Trim(FContasReceberParam.Me35EmissaoData_F.Text) = '' then
        raise
          Exception.Create('Campo Data Final Calculo Comissões Deve Ser Informado')
      else
        QRComissaoPublicar.SetVariable('DT_EMISSAO_FINAL',Trim(FContasReceberParam.Me35EmissaoData_F.Text));
      if Trim(FContasReceberParam.Me35Data_Vencimento.Text) = '' then
        QRComissaoPublicar.SetVariable('DT_VENCTO', Null)
      else
        QRComissaoPublicar.SetVariable('DT_VENCTO',StrToDate(Trim(FContasReceberParam.Me35Data_Vencimento.Text)));

      if FContasReceberParam.Rg35Abertos.ItemIndex = 0 then
        QRComissaoPublicar.SetVariable('LISTAR_TITULOS_ABERTOS', 'SIM')
      else
        QRComissaoPublicar.SetVariable('LISTAR_TITULOS_ABERTOS', 'NAO');

      if FRComissaoPublicar = nil then
        FRComissaoPublicar := TFRComissaoPublicar.create(Application);

      if FContasReceberParam.RG35TipoRelatorio.ItemIndex = 0 then
        FRComissaoPublicar.pTipoRelatorio := 'ANALITICO'
      else
        FRComissaoPublicar.pTipoRelatorio := 'SINTETICO';

      QRComissaoPublicar.Open;

      FRComissaoPublicar.QRLTitulo.Caption := 'Relatorio de Comissao De: ' +
        FContasReceberParam.Me35MovimentoData_I.Text + ' Ate : ' +
        FContasReceberParam.Me35MovimentoData_F.Text;
      FRComissaoPublicar.QRLFilial.Caption := 'Filial: ' +
        FContasReceberParam.FmFilial35.MeFilial.Text;

      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRComissaoPublicar.QRPrimario.Preview
      else
        FRComissaoPublicar.QRPrimario.Print;
      QRComissaoPublicar.Close;
    end;
  end;

end;

procedure TFContasReceberCad.SBAlterarClick(Sender: TObject);
begin
  if DMContasReceber.QContasReceber_CabInd_Situacao.Value = 'BAIXA TOTAL' then
    raise Exception.Create('Não é Possível Alterar um Titulo Com Baixas');

  if (DMParamSistema.CodEmpresa = 'RETIFOZ') and   //bloqueia a exclusão de reparcelamentos
     (DMContasReceber.QContasReceber_CabDESC_TIPO_DOCUMENTO.Value = 'Rep') then
    raise Exception.Create('Não é possível editar um registro de REPARCELAMENTO');

  inherited;
end;

procedure TFContasReceberCad.BloquetoAgrupadopPeriodo1Click(
  Sender: TObject);
begin
  inherited;
  // Removido por Djeison A. Selzlein 04/11/2013
  // não emitir um boleto do valor total do cliente.

  MessageDlg('Opção desativada. Utilize o menu Relatórios -> Emissão de Bloquetos' +
    ' para impressão de bloquetos.', mtInformation, [mbOK], 0);

//  if FContasReceberParam = nil then
//    FContasReceberParam := TFcontasReceberParam.Create(Application);
//  FContasReceberParam.PGRelatorio.Pages[35].TabVisible := True;
//  if FContasReceberParam.ShowModal = mrOk then
//  begin
//    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME36Filial.Text,
//      'CONTAS A RECEBER');
//    with DMContasReceber do
//    begin
//      QRBloqueto.Close;
//      QRBloqueto.Sql.Clear;
//      QRBloqueto.Sql.Add('SELECT ');
//      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE) AS CODIGO_CEDENTE,');
//      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE) AS DIGITO_VERIFICADOR_CEDENTE,');
//      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO) AS NUM_CONVENIO,');
//      QRBloqueto.SQL.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO) as NOSSO_NUMERO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.IND_TIPO_JURO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_BANCO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_AGENCIA,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
//      QRBloqueto.SQL.Add('SUM(TB_CONTA_RECEBER_CAB.VAL_TITULO) AS VAL_TITULO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.NOME AS NOME_SACADO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.COD_CADASTRO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_TELEFONE,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CEP_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.NUM_CGC_CPF,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.COD_ESTADO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_BAIRRO,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.VARIACAO,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.CARTEIRA,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
//      QRBloqueto.SQL.Add('TB_FILIAL.COD_FILIAL,');
//      QRBloqueto.SQL.Add('TB_FILIAL.DESC_FILIAL,');
//      QRBloqueto.SQL.Add('TB_BANCO_AGENCIA.COD_CONVENIO_CUSTODIA,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.DIG_VERIFICADOR_AGENCIA_CONTA,');
//      QRBloqueto.SQL.Add('to_date(' + chr(39) +
//        FContasReceberParam.ME36Vencimento.Text + chr(39) +
//        ',''DD/MM/YYYY'') AS DT_VENCIMENTO,');
//      QRBloqueto.SQL.Add('to_date(' + chr(39) + DateToStr(date) + chr(39) +
//        ',''DD/MM/YYYY'') AS DT_EMISSAO,');
//      QRBloqueto.SQL.Add('0 AS NUM_TITULO,');
//      QRBloqueto.SQL.Add('0 AS COD_NOTA_CAB,');
//      QRBloqueto.SQL.Add('0 AS NUM_PARCELA,');
//      QRBloqueto.SQL.Add(chr(39) + 'BLO' + chr(39) +
//        ' AS DESC_TIPO_DOCUMENTO,');
//      QRBloqueto.SQL.Add(chr(39) + 'N' + chr(39) + ' AS IND_ACEITE,');
//      QRBloqueto.SQL.Add('0 AS COD_VENDEDOR,');
//      QRBloqueto.SQL.Add('0 AS COD_CONTA_RECEBER_CAB');
//
//      QRBloqueto.SQL.Add(' FROM ');
//      QRBloqueto.SQL.Add('TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_BANCO_AGENCIA,TB_CONTA_CORRENTE,TB_FILIAL');
//      QRBloqueto.SQL.Add(' WHERE ');
//      QRBloqueto.SQL.Add('TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO and ');
//      QRBloqueto.SQL.Add('TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA and ');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE and ');
//      QRBloqueto.SQL.Add('TB_FILIAL.COD_FILIAL = TB_CONTA_RECEBER_CAB.COD_FILIAL and ');
//      QRBloqueto.SQL.Add('TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + CHR(39) +
//        'BAIXA TOTAL' + CHR(39));
//
//      if Trim(FContasReceberParam.ME36Filial.Text) <> '' then
//        QRBloqueto.SQL.Add(' and TB_FILIAL.COD_FILIAL =' +
//          Trim(FContasReceberParam.ME36Filial.Text));
//
//      if Trim(FContasReceberParam.FMCadastro36.MECadastro.Text) <> '' then
//        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.COD_CADASTRO =' +
//          Trim(FContasReceberParam.FMCadastro36.MECadastro.Text));
//
//      if Trim(FContasReceberParam.ME36ContaCorrente.Text) <> '' then
//        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.COD_CONTA_CORRENTE =' +
//          Trim(FContasReceberParam.ME36ContaCorrente.Text))
//      else
//        raise Exception.Create('Informe a Conta Corrente!');
//
//      if Trim(FContasReceberParam.ME36Banco.Text) <> '' then
//        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA =' +
//          Trim(FContasReceberParam.ME36Banco.Text))
//      else
//        raise Exception.Create('Informe a Conta Corrente!');
//
//      if (Trim(FContasReceberParam.ME36DtInicial.Text) = '') or
//        (Trim(FContasReceberParam.ME36DtFinal.Text) = '') then
//        raise Exception.Create('Informe o Período desejado!')
//      else
//      begin
//        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' +
//          chr(39) + Trim(FContasReceberParam.ME36DtInicial.Text + chr(39)));
//        QRBloqueto.SQL.Add(' and TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' +
//          chr(39) + Trim(FContasReceberParam.ME36DtFinal.Text) + chr(39));
//      end;
//
//      QRBloqueto.SQL.Add(' GROUP BY ');
//      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.COD_CEDENTE,Tb_banco_agencia.CODIGO_CEDENTE),');
//      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.DIG_VERIFICADOR_CEDENTE,Tb_banco_agencia.DIGITO_VERIFICADOR_CEDENTE),');
//      QRBloqueto.SQL.Add('NVL(TB_CONTA_CORRENTE.NUM_CONVENIO,Tb_banco_agencia.NUM_CONVENIO),');
//      QRBloqueto.SQL.Add('NVL(TO_CHAR(TB_BANCO_AGENCIA.NOSSO_NUMERO),TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO),');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_LOCAL_PGTO_BLOQ,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.DESC_INSTRUCAO_BLOQUETO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.IND_TIPO_JURO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.PERC_JURO_BLOQUETO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_BANCO,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_AGENCIA,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.DIGITO_VERIFICADOR_AGENCIA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.NOME,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.COD_CADASTRO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_TELEFONE,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ESTADO_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_ENDERECO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CIDADE,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_CEP_COBRANCA,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.NUM_CGC_CPF,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.COD_ESTADO,');
//      QRBloqueto.SQL.Add('TB_CADASTRO.DESC_BAIRRO,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.VARIACAO,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.CARTEIRA,');
//      QRBloqueto.SQL.Add('TB_CONTA_CORRENTE.NUM_CONTA_CORRENTE,');
//      QRBloqueto.SQL.Add('TB_FILIAL.COD_FILIAL,');
//      QRBloqueto.SQL.Add('TB_FILIAL.DESC_FILIAL,');
//      QRBloqueto.SQL.Add('Tb_banco_agencia.COD_CONVENIO_CUSTODIA,');
//      QRBloqueto.SQL.Add('tb_conta_corrente.DIG_VERIFICADOR_AGENCIA_CONTA');
//
//      QRBloqueto.SQL.Add(' ORDER BY ');
//      QRBloqueto.SQL.Add('Tb_CADASTRO.COD_CADASTRO');
//
//      QRBloqueto.open;
//
//      //BANCO DO BRASIL
//      if QRBloquetoCod_Banco.Value = 001 then
//      begin
//        if FRBoletaBB = nil then
//          FRBoletaBB := TFRBoletaBB.Create(Application);
//        FRBoletaBB.QRPrimario.Print;
//      end;
//
//      //BANCO BRADESCO
//      if QRBloquetoCod_Banco.Value = 237 then
//      begin
//        if FRBloqueto_Bradesco = nil then
//          FRBloqueto_Bradesco := TFRBloqueto_Bradesco.Create(Application);
//        FRBloqueto_Bradesco.QRPrimario.Print;
//      end;
//
//    end;
//  end;
end;

procedure TFContasReceberCad.tulosAbertosOutrasMoedas1Click(
  Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[36].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.Me37DtInicial.Text) = '' then
        raise Exception.Create('Por favor, informe a data inicial.');
      if Trim(FContasReceberParam.Me37DtFinal.Text) = '' then
        raise Exception.Create('Por favor, informe a data final.');
      if Trim(FContasReceberParam.ME37DtBase.Text) = '' then
        raise Exception.Create('Por favor, informe a data base.');
      QRTitulosAbertos_OutrasMoedas.Close;
      if Trim(FContasReceberParam.Fm37Filial.MeFilial.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FILIAL',
          Trim(FContasReceberParam.Fm37Filial.MeFilial.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FILIAL', null);
      if Trim(FContasReceberParam.Fm37Departamento.MeDepartamento.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_DEPARTAMENTO',
          Trim(FContasReceberParam.Fm37Departamento.MeDepartamento.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_DEPARTAMENTO', null);
      if Trim(FContasReceberParam.Fm37Finalidade.MeFinalidade.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FINALIDADE',
          Trim(FContasReceberParam.Fm37Finalidade.MeFinalidade.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FINALIDADE', null);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_INICIAL',
        FContasReceberParam.Me37DtInicial.Text);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_FINAL',
        FContasReceberParam.Me37DtFinal.Text + ' 23:59:59');
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_BASE',
        FContasReceberParam.ME37DtBase.Text);

      if FRTitulosAbertos_OutrasMoedas = nil then
        FRTitulosAbertos_OutrasMoedas :=
          TFRTitulosAbertos_OutrasMoedas.Create(Application);
      with FRTitulosAbertos_OutrasMoedas do
      begin
        QRLFilial.Caption := FContasReceberParam.Fm37Filial.EdFilial.Text;
        QRLFinalidade.Caption :=
          FContasReceberParam.Fm37Finalidade.EdFinalidade.Text;
        QRLDtInicial.Caption := FContasReceberParam.Me37DtInicial.Text;
        QRLDtFinal.Caption := FContasReceberParam.Me37DtFinal.Text;
        QRLDtBase.Caption := FContasReceberParam.ME37DtBase.Text;
        QRLDepartamento.Caption :=
          FContasReceberParam.Fm37Departamento.EdDepartamento.Text;
      end;
      QRTitulosAbertos_OutrasMoedas.open;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRTitulosAbertos_OutrasMoedas.QRPrimario.Preview
      else
        FRTitulosAbertos_OutrasMoedas.QRPrimario.Print;
      QRTitulosAbertos_OutrasMoedas.Close;
    end;
  end;
end;

procedure TFContasReceberCad.CalculaVariaoCambial1Click(Sender: TObject);
var
  wDD, wMM, WYY: string;
  wDtAnterior, wDtAtual: tDateTime;
  wVariacao, wVlMoeda: Real;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFcontasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[37].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.Fm38Filial.MeFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      if Trim(FContasReceberParam.Me38DtInicial.text) = '' then
        raise Exception.Create('Campo Data Inicial Deve Ser Informado');
      if Trim(FContasReceberParam.Me38DtFinal.text) = '' then
        raise Exception.Create('Campo Data Final Deve Ser Informado');
      if Trim(FContasReceberParam.Me38DtBase.text) = '' then
        raise Exception.Create('Campo Data Base Deve Ser Informado');
      QVariacao_Cambial.Close;
      if Trim(FContasReceberParam.Fm38Filial.MeFilial.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_FILIAL',
          FContasReceberParam.Fm38Filial.MeFilial.Text)
      else
        QVariacao_Cambial.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.Fm38Departamento.MeDepartamento.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_DEPARTAMENTO',
          FContasReceberParam.Fm38Departamento.MeDepartamento.Text)
      else
        QVariacao_Cambial.SetVariable('COD_DEPARTAMENTO', Null);

      if Trim(FContasReceberParam.Fm38Finalidade.MeFinalidade.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_FINALIDADE',
          FContasReceberParam.Fm38Finalidade.MeFinalidade.Text)
      else
        QVariacao_Cambial.SetVariable('COD_FINALIDADE', Null);

      if Trim(FContasReceberParam.Fm38Cadastro.MeCadastro.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_CADASTRO',
          FContasReceberParam.Fm38Cadastro.MeCadastro.Text)
      else
        QVariacao_Cambial.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.Fm38Contrato.MeContrato.Text) <> '' then
        QVariacao_Cambial.SetVariable('COD_CONTRATO_VEND',
          FContasReceberParam.Fm38Contrato.MeContrato.Text)
      else
        QVariacao_Cambial.SetVariable('COD_CONTRATO_VEND', Null);

      QVariacao_Cambial.SetVariable('DT_INICIAL',
        FContasReceberParam.Me38DtInicial.text);
      QVariacao_Cambial.SetVariable('DT_FINAL',
        FContasReceberParam.Me38DtFinal.text + ' 23:59:59');
      QVariacao_Cambial.SetVariable('DT_EMISSAO',
        FContasReceberParam.Me38DtBase.text);
      pDataBase := StrToDate(FContasReceberParam.Me38DtBase.text);
      QVariacao_Cambial.Open;

      if QVariacao_Cambial.Eof then
        raise
          Exception.Create('Neste Periodo Não Tem Contas a Receber em Dólar');
      DMMoeda.QCotacaoDia.Close;
      DMMoeda.QCotacaoDia.SetVariable('Moeda', 2);
      DMMoeda.QCotacaoDia.SetVariable('Data',
        FContasReceberParam.Me38DtBase.text);
      DMMoeda.QCotacaoDia.Open;
      if DMMoeda.QCotacaoDia.Eof then
        raise Exception.Create('Dólar Não Cadastrado Para Data Base');
      wVlMoeda := DMMoeda.QCotacaoDiaVlr_Cotacao.Value;
      DMOracle.DBCemapa.StartTransaction;
      try
        while not (QVariacao_Cambial.Eof) do
        begin
          //              wDD      := '01';
          //              wMM      := Copy(FContasReceberParam.Me38DtBase.Text,4,2);
          //              wYY      := Copy(FContasReceberParam.Me38DtBase.Text,7,4);
          //              wDtAnterior := StrToDate(wDD+'/'+wMM+'/'+wYY) - 1;   // pega ultimo dia do mes anterior
          //              If QVariacao_CambialDt_Emissao.Value > wDtAnterior Then
          wDtAnterior := QVariacao_CambialDt_Emissao.Value;
          DMMoeda.QCotacaoDia.Close;
          DMMoeda.QCotacaoDia.SetVariable('Moeda', 2);
          DMMoeda.QCotacaoDia.SetVariable('Data', wDtAnterior);
          DMMoeda.QCotacaoDia.Open;
          if DMMoeda.QCotacaoDia.Eof then
            raise
              Exception.Create('Dolar não cadastrado para contas a receber');
          wVariacao := (QVariacao_CambialVal_Titulo.Value -
            (QVariacao_CambialVal_Original.Value /
            DMMoeda.QCotacaoDiaVlr_Cotacao.Value -
            QVariacao_Cambialval_dolar_baixa.Value) * wVlMoeda) * -1;

          QContasReceber_Cab.Close;
          QContasReceber_Cab.SetVariable('Pk',
            QVariacao_CambialCod_Conta_Receber_Cab.Value);
          QContasReceber_Cab.Open;

          QContasReceber_Mov.Insert;
          QContasReceber_MovDt_Movimento.Value :=
            StrToDate(FContasReceberParam.Me38DtBase.text);
          QContasReceber_MovVal_Movimento.Value := wVariacao;
          QContasReceber_MovDesc_Observacao.Value :=
            'Gerado a partir de uma Variacao cambial';
          QContasReceber_MovInd_Tipo_Movimento.Value := 'VARIACAO';
          QContasReceber_Mov.Post;
          QVariacao_Cambial.Next;
        end;
      except
        QVariacao_Cambial.Cancel;
        DMOracle.DBCemapa.RollBack;
        raise;
      end;
      DMOracle.DBCemapa.Commit;
      QVariacao_Cambial.Close;
      DMMoeda.QCotacaoDia.Close;
    end;
  end;
end;

procedure TFContasReceberCad.ProtocolodeEntregadeDocumentos1Click(
  Sender: TObject);
begin
  inherited;
  if FRProtocoloEntregaDocumento = nil then
    FRProtocoloEntregaDocumento :=
      TFRProtocoloEntregaDocumento.Create(Application);
  FRProtocoloEntregaDocumento.MMensagem.Lines.Text :=
    'Declaro para os devidos fins, que recebi a documentação relativa ao Boleto Nº ' +
    DMContasReceber.QContasReceber_CabCOD_NOSSO_NUMERO.Text +
    ' com vencimento em '
    + FormatDateTime('dd/MM/yyyy',
    DMContasReceber.QContasReceber_CabDT_VENCIMENTO.Value) + ' no valor de R$ '
    +
    FormatFloat('#,##0.00', DMContasReceber.QContasReceber_CabVAL_TITULO.Value)
    +
    ' referente à compra de produtos e/ou assistência técnica prestados, conforme relatório em anexo.';
  FRProtocoloEntregaDocumento.LEmpresa.Caption :=
    DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO ', 'COD_CADASTRO = ' +
    DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
  FRProtocoloEntregaDocumento.LEndereco.Caption :=
    DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO ',
    'COD_CADASTRO = '
    + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
  FRProtocoloEntregaDocumento.LTelefone.Caption :=
    DMOracle.BuscaNome('SELECT DESC_TELEFONE FROM TB_CADASTRO ',
    'COD_CADASTRO = '
    + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text);
  FRProtocoloEntregaDocumento.LData.Caption := FormatDateTime('dd/MM/yyyy',
    Date);
  FRProtocoloEntregaDocumento.QRPrimario.Preview;
end;

procedure TFContasReceberCad.ExportaContas1Click(Sender: TObject);
var
  wSql, S: string;
  F: TextFile;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[4].TabVisible := True;
  FContasReceberParam.CB4SituacaoVendedor.ItemIndex := 0;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.Fm4Filial.MeFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRContasReceber_TitulosAberto.Close;
      QRContasReceber_TitulosAberto.SQL.Clear;
      wsql :=
        ('SELECT TB_CADASTRO.NOME,TB_VENDEDOR.NOME AS NOME_VENDEDOR,TB_CADASTRO.DESC_TELEFONE,TB_CADASTRO.DESC_CELULAR,TB_CONTA_RECEBER_CAB.COD_CONTA_RECEBER_CAB');
      wSql := wsql +
        (',TB_CADASTRO.desc_endereco,TB_CADASTRO.desc_cidade,TB_CADASTRO.desc_cep,TB_CADASTRO.cod_estado,TB_CADASTRO.num_cgc_cpf');
      wSql := wsql +
        (',TB_CADASTRO.DESC_FONE_EMPRESA,Tb_conta_RECEBER_cab.COD_FILIAL,Tb_conta_RECEBER_cab.COD_FINALIDADE,Tb_conta_RECEBER_cab.COD_BANCO_AGENCIA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_CADASTRO,Tb_conta_RECEBER_cab.COD_VENDEDOR,Tb_conta_RECEBER_cab.NUM_TITULO,Tb_conta_RECEBER_cab.NUM_PARCELA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_TIPO_DOCUMENTO,Tb_conta_RECEBER_cab.DT_MOVIMENTO,Tb_conta_RECEBER_cab.DT_BAIXA');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_VENCIMENTO,Tb_conta_RECEBER_cab.DT_EMISSAO,Tb_conta_RECEBER_cab.DT_CAPITALIZACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DT_CAPITALIZACAO_MOEDA,Tb_conta_RECEBER_cab.VAL_TITULO AS VALT_TITULO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.COD_NOTA_CAB,Tb_conta_RECEBER_cab.DESC_OBSERVACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.IND_ACEITE,Tb_conta_RECEBER_cab.IND_SITUACAO,Tb_conta_RECEBER_cab.VAL_JUROS');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.VAL_ORIGINAL,Tb_filial.DESC_FILIAL,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA');
      wsql := wsql +
        (',TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_JURO_MORA,TB_CLASS_CADASTRO.DESC_CLASSIFICACAO');
      wsql := wsql +
        (',Tb_conta_RECEBER_cab.DESC_AVALISTA1,TB_FINALIDADE.NUM_DIAS_CARENCIA ');
      wsql := wsql +
        (' FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO,TB_VENDEDOR,TB_FILIAL,TB_FINALIDADE,TB_CLASS_CADASTRO ');
      wsql := wsql +
        ('WHERE Tb_conta_RECEBER_cab.COD_FILIAL = Tb_filial.COD_FILIAL ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO ');
      wsql := wsql +
        (' AND Tb_cadastro.COD_CLASS_CADASTRO = Tb_class_cadastro.COD_CLASS_CADASTRO');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_FINALIDADE = Tb_finalidade.COD_FINALIDADE ');
      wsql := wsql +
        (' AND Tb_conta_RECEBER_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) ');
      if DMParamSistema.CodEmpresa = 'ARISTIDES' then
        wsql := wsql + (' AND (Tb_conta_RECEBER_cab.IND_SITUACAO <> ' + chr(39)
          +
          'BAIXA TOTAL' + chr(39) + ')')
      else
      begin
        wsql := wsql + (' AND ((Tb_conta_RECEBER_cab.IND_SITUACAO = ' + chr(39)
          +
          'BAIXA PARCIAL' + chr(39) + ')');
        if Trim(FContasReceberParam.ME4DtRefEmissao.Text) <> '' then
        begin
          wsql := wsql + ' OR (Tb_conta_RECEBER_cab.DT_BAIXA > ' + chr(39) +
            FContasReceberParam.ME4DtRefEmissao.Text + chr(39) + ')';
          wsql := wsql + ' OR  (Tb_conta_RECEBER_cab.DT_BAIXA IS NULL))';
        end;
      end;
      if Trim(FContasReceberParam.Fm4Cadastro.MeCadastro.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CADASTRO = ' +
          Trim(FContasReceberParam.Fm4Cadastro.MeCadastro.Text));
      if Trim(FContasReceberParam.Fm4Filial.MeFilial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FILIAL = ' +
          Trim(FContasReceberParam.Fm4Filial.MeFilial.Text));
      if Trim(FContasReceberParam.Fm4Regiao.MeRegiao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_REGIAO = ' +
          Trim(FContasReceberParam.Fm4Regiao.MeRegiao.Text));
      if Trim(FContasReceberParam.Fm4Vendedor.MeVendedor.Text) <> '' then
        if DMParamSistema.CodEmpresa = 'GONZATTI' then
          wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.Fm4Vendedor.MeVendedor.Text))
        else
          wsql := wsql + (' AND TB_CADASTRO.COD_VENDEDOR = ' +
            Trim(FContasReceberParam.Fm4Vendedor.MeVendedor.Text));
      if Trim(FContasReceberParam.Fm4Banco.MeBanco.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_BANCO_AGENCIA = ' +
          Trim(FContasReceberParam.Fm4Banco.MeBanco.Text));
      if Trim(FContasReceberParam.ME4CodFinalidade.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE In (' +
          Trim(FContasReceberParam.ME4CodFinalidade.Text) + ')');
      if Trim(FContasReceberParam.ME4DescDocumento.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DESC_TIPO_DOCUMENTO = ' +
          chr(39) + Trim(FContasReceberParam.ME4DescDocumento.Text) + chr(39));
      if Trim(FContasReceberParam.Fm4Departamento.MeDepartamento.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = ' +
          Trim(FContasReceberParam.Fm4Departamento.MeDepartamento.Text));
      wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_EMISSAO <= ' + chr(39) +
        FContasReceberParam.ME4DtRefEmissao.Text + chr(39));
      if Trim(FContasReceberParam.ME4Inicial.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO >= ' + chr(39)
          + FContasReceberParam.ME4Inicial.Text + chr(39));
      if Trim(FContasReceberParam.ME4final.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.DT_VENCIMENTO <= ' + chr(39)
          + FContasReceberParam.ME4Final.Text + chr(39));
      if Trim(FContasReceberParam.ME4ContaNao1.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao1.Text));
      if Trim(FContasReceberParam.ME4ContaNao2.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao2.Text));
      if Trim(FContasReceberParam.ME4ContaNao3.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao3.Text));
      if Trim(FContasReceberParam.ME4ContaNao4.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao4.Text));
      if Trim(FContasReceberParam.ME4ContaNao5.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao5.Text));
      if Trim(FContasReceberParam.ME4ContaNao6.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao6.Text));
      if Trim(FContasReceberParam.ME4ContaNao7.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao7.Text));
      if Trim(FContasReceberParam.ME4ContaNao8.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao8.Text));
      if Trim(FContasReceberParam.ME4ContaNao9.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao9.Text));
      if Trim(FContasReceberParam.ME4ContaNao10.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_FINALIDADE <> ' +
          Trim(FContasReceberParam.ME4ContaNao10.Text));
      if Trim(FContasReceberParam.Me4Classificacao.Text) <> '' then
        wsql := wsql + (' AND TB_CADASTRO.COD_CLASS_CADASTRO = ' +
          Trim(FContasReceberParam.Me4Classificacao.Text));
      if Trim(FContasReceberParam.Me4ContratoVenda.Text) <> '' then
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_CONTRATO_VEND = ' +
          Trim(FContasReceberParam.Me4ContratoVenda.Text));
      if FContasReceberParam.Rg4Notas.ItemIndex = 0 then
        // SOMENTE LISTAR TITULOS QUE FORAM EMITIDOS POR NOTA FISCAL
        wsql := wsql + (' AND TB_CONTA_RECEBER_CAB.COD_NOTA_CAB > 0 ');
      case FContasReceberParam.CB4SituacaoVendedor.ItemIndex of
        1: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) + 'ATIVO'
            + Chr(39));
        2: wsql := wsql + (' AND TB_VENDEDOR.IND_SITUACAO = ' + Chr(39) +
            'INATIVO' + Chr(39));
      end;

      if (FContasReceberParam.Me4ValorMin.Text <> '') and (FContasReceberParam.Me4ValorMax.Text <> '') then
      begin
        if FContasReceberParam.Me4ValorMin.Text <> '' then
          Wsql := wSql + (' AND TB_CONTA_RECEBER_CAB.VAL_ORIGINAL >= ' + FContasReceberParam.Me4ValorMin.Text);
        if FContasReceberParam.Me4ValorMax.Text <> '' then
          Wsql := wSql + (' AND TB_CONTA_RECEBER_CAB.VAL_ORIGINAL <= ' + FContasReceberParam.Me4ValorMax.Text);
      end;

      case FContasReceberParam.RG4Ordem.ItemIndex of
        0: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        1: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_cadastro.NOME, Tb_conta_RECEBER_cab.COD_CADASTRO, TB_CONTA_RECEBER_CAB.DT_VENCIMENTO');
        2: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.NUM_TITULO');
        3: wsql := wsql +
          (' ORDER BY  TB_CONTA_RECEBER_CAB.COD_FILIAL, Tb_conta_RECEBER_cab.COD_CADASTRO,  TB_CONTA_RECEBER_CAB.DT_EMISSAO');
      end;

      QRContasReceber_TitulosAberto.SQL.Add(wSql);
      DMContasReceber.pDataBase := StrToDate(FContasReceberParam.ME4DtRefEmissao.Text);
      DMContasReceber.pDataReferencia := StrToDate(FContasReceberParam.ME4DtReferencia.Text);
      QRContasReceber_TitulosAberto.Open;
    end;
    S := '';
    while not (DMContasReceber.QRContasReceber_TitulosAberto.Eof) do
    begin
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Cadastro.Value, 6, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Filial.Value, 6, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoNum_Titulo.Value, 6, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoNum_Parcela.Value, 6, 0);
      S := S + FormatMaskText('CCC', DMContasReceber.QRContasReceber_TitulosAbertoDesc_Tipo_Documento.Text);
      S := S + DMContasReceber.QRContasReceber_TitulosAbertoDt_Emissao.Text;
      S := S + DMContasReceber.QRContasReceber_TitulosAbertoDt_Vencimento.Text;
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Finalidade.Value, 6, 0);
      S := S + IntDecimais(FloatToStr(DMContasReceber.QRContasReceber_TitulosAbertoVal_Titulo.Value), 13, 2);
      S := S + IntDecimais(FloatToStr(DMContasReceber.QRContasReceber_TitulosAbertoVal_Original.Value), 13, 2);
      S := S + IntDecimais(FloatToStr(DMContasReceber.QRContasReceber_TitulosAbertosVal_Juros.Value), 13, 2);
      S := S + FormatMaskText('CCCCCCCCCCCCC', DMContasReceber.QRContasReceber_TitulosAbertoInd_Situacao.Text);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoPerc_Comissao.Value * 100, 5, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoPerc_Taxa.Value * 100, 5, 0);
      S := S + StrZero(DMContasReceber.QRContasReceber_TitulosAbertoCod_Vendedor.Value, 6, 0);
      S := S + Chr(13) + Chr(10);
      DMContasReceber.QRContasReceber_TitulosAberto.Next;
    end;
    if FContasReceberParam.SDlg_Remessa.Execute then
    begin
      AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
      Rewrite(F);
      Writeln(F, S);
      CloseFile(F);
    end;
    DMContasReceber.QRContasReceber_TitulosAberto.Close;
  end;
end;

procedure TFContasReceberCad.ExportarparaSISCOBRA1Click(Sender: TObject);
begin
  wExportar := True;
  RelaodeTtulosAbertos1.Click;
  wExportar := False;
end;

procedure TFContasReceberCad.ExportarSISCOBRA_novo;
var
  f: TextFile;
  linha: string;
  wCadastroAtual, wTituloAtual: Integer;
  wEstadoCivil, wSexo: string;
  wClientes, wTitulos: Integer;
  wValVencidos, wValNaoVencidos, wVenc, wNaoVenc: Extended;
begin
  try
    try
      if (not (SdArquivo.Execute)) then
        Exit;

      AssignFile(f, SdArquivo.FileName);
      Rewrite(f);

      wClientes := 0;
      wTitulos := 0;
      wValVencidos := 0;
      wValNaoVencidos := 0;

      with DMContasReceber do
      begin
        QRContasReceber_TitulosAberto.First;
        wCadastroAtual := -1;
        wTituloAtual := -1;

        while not QRContasReceber_TitulosAberto.Eof do
        begin
         //Só mostra o cadastro quando mudar
          if wCadastroAtual <> QRContasReceber_TitulosAbertoCOD_CADASTRO.Value then
          begin
            wCadastroAtual := QRContasReceber_TitulosAbertoCOD_CADASTRO.Value;

            //Registro 00
            Write(f, '00');
            Write(f, FormatDateTime('ddmmyyyy', DMOracle.DataServ));
            Write(f, Bib.AjustaStr('', 590));
            WriteLn(f);

            //Registro 01
            Write(f, '01');
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(QRContasReceber_TitulosAbertoNUM_CGC_CPF.Value), 1, 18)), 18));
            Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoNOME.Value, 1, 40)), 40));
            Write(f, DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text));
            wSexo := DMOracle.BuscaNome('SELECT NVL(IND_SEXO_CATEGORIA, ' + QuotedStr(' ') + ') FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text);
            if wSexo = '' then
              wSexo := ' ';
            Write(f, wSexo);
            Write(f, Bib.AjustaStr('', 4));
            Write(f, bib.AjustaStr(trim(copy(bib.RemoveNumEndereco(QRContasReceber_TitulosAbertoDESC_ENDERECO.Value, Bib.NumEndereco(QRContasReceber_TitulosAbertoDESC_ENDERECO.Value)), 1, 40)), 40));
            Write(f, bib.AjustaStr(trim(copy(Bib.NumEndereco(QRContasReceber_TitulosAbertoDESC_ENDERECO.Value), 1, 10)), 10));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_COMPLEMENTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 25)), 25));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_BAIRRO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 25)), 25));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 25)), 25));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 2)), 2));
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(QRContasReceber_TitulosAbertoDESC_CEP.Value), 1, 9)), 9));
            Write(f, Bib.AjustaStr('', 40));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoDESC_TELEFONE.Value, 1, 20)), 20));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_FAX FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 14)), 14));
            Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoDESC_CELULAR.Value, 1, 20)), 20));
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(DMOracle.BuscaNome('SELECT NUM_INSCRICAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text)), 1, 18)), 18));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_ORGAO_EMISSOR FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 5)), 5));
            Write(f, Bib.AjustaStr('', 2));
            Write(f, Bib.AjustaStr('', 8));
            try
              Write(f, FormatDateTime('ddmmyyyy', StrToDate(DMOracle.BuscaNome('SELECT decode(IND_FISICA_JURIDICA, ' + QuotedStr('F') + ', DT_NASCIMENTO, DT_FUNDACAO) FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text))));
            except
              Write(f, '        ');
            end;
            wEstadoCivil := DMOracle.BuscaNome('SELECT E.DESC_ESTADO_CIVIL FROM TB_CADASTRO C INNER JOIN TB_ESTADO_CIVIL E ON C.COD_ESTADO_CIVIL = E.COD_ESTADO_CIVIL', 'C.COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text);
            if wEstadoCivil = 'Casado' then
              Write(f, 'C')
            else if wEstadoCivil = 'Solteiro' then
              Write(f, 'S')
            else if wEstadoCivil = 'Divorciado' then
              Write(f, 'D')
            else if wEstadoCivil = 'Desquitado' then
              Write(f, 'R')
            else if wEstadoCivil = 'Viúvo' then
              Write(f, 'V')
            else
              Write(f, 'X');
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_NATURALIDADE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 30)), 30));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_ESTADO_NATURAL FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 2)), 2));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT NOME_MAE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT NOME_PAI FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, Bib.AjustaStr('', 20));
            Write(f, Bib.AjustaStr('', 70));
            Write(f, bib.AjustaStr(trim(QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 20));
            Write(f, Bib.AjustaStr('', 18));
            WriteLn(f);

            if DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text) = 'F' then
            begin
              //Registro 02
              Write(f, '02');
              Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_EMPRESA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
              Write(f, Bib.AjustaStr('', 20));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, Bib.AjustaStr('', 40));
              Write(f, Bib.AjustaStr('', 6));
              Write(f, Bib.AjustaStr('', 25));
              Write(f, Bib.AjustaStr('', 25));
              Write(f, Bib.AjustaStr('', 25));
              Write(f, Bib.AjustaStr('', 2));
              Write(f, Bib.AjustaStr('', 9));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, bib.AjustaStr(trim(copy(QRContasReceber_TitulosAbertoDESC_FONE_EMPRESA.Value, 1, 20)), 20));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, Bib.AjustaStr('', 4));
              Write(f, Bib.AjustaStr('', 14));
              Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_FUNCAO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 30)), 30));
              Write(f, Bib.AjustaStr('', 8));
              Write(f, FormatFloat('00000000000', Trunc(StrToFloat(DMOracle.BuscaNome('SELECT NVL(VAL_SALARIO, 0) FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text)) * 100)));
              Write(f, Bib.AjustaStr('', 302));
              WriteLn(f);
            end;

            //Registro 03
            Write(f, '03');
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT NOME_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, bib.AjustaStr(trim(copy(Bib.LimpaNumero(DMOracle.BuscaNome('SELECT DESC_CPF_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text)), 1, 15)), 15));
            try
              Write(f, FormatDateTime('ddmmyyyy', StrToDate(DMOracle.BuscaNome('SELECT DT_NASCIMENTO_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text))));
            except
              Write(f, '        ');
            end;
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_EMPRESA_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 45)), 45));
            Write(f, Bib.AjustaStr('', 45));
            Write(f, Bib.AjustaStr('', 10));
            Write(f, Bib.AjustaStr('', 25));
            Write(f, Bib.AjustaStr('', 25));
            Write(f, Bib.AjustaStr('', 25));
            Write(f, Bib.AjustaStr('', 9));
            Write(f, Bib.AjustaStr('', 2));
            Write(f, Bib.AjustaStr('', 4));
            Write(f, Bib.AjustaStr('', 20));
            Write(f, bib.AjustaStr(trim(copy(DMOracle.BuscaNome('SELECT DESC_PROFISSAO_CONJUGE FROM TB_CADASTRO', 'COD_CADASTRO = ' + QRContasReceber_TitulosAbertoCOD_CADASTRO.Text), 1, 30)), 30));
            Write(f, Bib.AjustaStr('', 290));
            WriteLn(f);

            inc(wClientes);
          end;

          //Só mostra o título quando mudar
          if wTituloAtual <> QRContasReceber_TitulosAbertoNUM_TITULO.Value then
          begin
            wTituloAtual := QRContasReceber_TitulosAbertoNUM_TITULO.AsInteger;

            wVenc := StrToFloat(DMOracle.BuscaNome('SELECT NVL(SUM(Tb_conta_receber_cab.VAL_TITULO) + SUM(Tb_conta_receber_cab.VAL_JUROS), 0) from tb_conta_receber_cab', 'DT_VENCIMENTO < CURRENT_DATE and IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL') + ' and num_titulo = ' + QRContasReceber_TitulosAbertoNUM_TITULO.Text));
            wNaoVenc := StrToFloat(DMOracle.BuscaNome('SELECT NVL(SUM(Tb_conta_receber_cab.VAL_TITULO), 0) from tb_conta_receber_cab', 'DT_VENCIMENTO >= CURRENT_DATE and IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL') + ' and num_titulo = ' + QRContasReceber_TitulosAbertoNUM_TITULO.Text));

            //Registro 04
            Write(f, '04');
            Write(f, bib.AjustaStr(trim(QRContasReceber_TitulosAbertoNUM_TITULO.Text), 20));
            Write(f, Bib.AjustaStr('', 3));
            Write(f, FormatFloat('00000', QRContasReceber_TitulosAbertoCOD_FILIAL.Value));
            Write(f, FormatFloat('000', StrToInt(DMOracle.BuscaNome('SELECT COUNT(*) from tb_conta_receber_cab', 'DT_VENCIMENTO >= CURRENT_DATE and IND_SITUACAO <> ' + QuotedStr('BAIXA TOTAL') + ' and num_titulo = ' + QRContasReceber_TitulosAbertoNUM_TITULO.Text))));
            Write(f, FormatDateTime('ddmmyyyy', QRContasReceber_TitulosAbertoDT_EMISSAO.Value));
            Write(f, Bib.AjustaStr('', 14));
            Write(f, FormatFloat('00000000000', Trunc(wVenc * 100)));
            Write(f, FormatFloat('00000000000', Trunc(wNaoVenc * 100)));
            Write(f, Bib.AjustaStr('', 8));
            Write(f, Bib.AjustaStr('', 15));
            Write(f, Bib.AjustaStr('', 500));
            WriteLn(f);

            inc(wTitulos);
            wValVencidos := wValVencidos + wVenc;
            wValNaoVencidos := wValNaoVencidos + wNaoVenc;
          end;

          //Registro 06
          Write(f, '06');
          Write(f, FormatFloat('000', QRContasReceber_TitulosAbertoNUM_PARCELA.Value));
          Write(f, FormatFloat('00000000000', Trunc(QRContasReceber_TitulosAbertoVALT_TITULO.Value * 100)));
          Write(f, FormatDateTime('ddmmyyyy', QRContasReceber_TitulosAbertoDT_VENCIMENTO.Value));
          Write(f, Bib.AjustaStr('', 576));
          WriteLn(f);

          QRContasReceber_TitulosAberto.Next;
        end;

        //Registro 99
        Write(f, '99');
        Write(f, FormatFloat('0000000000', wClientes));
        Write(f, FormatFloat('0000000000', wTitulos));
        Write(f, FormatFloat('00000000000000', Trunc(wValVencidos * 100)));
        Write(f, FormatFloat('00000000000000', Trunc(wValNaoVencidos * 100)));
        Write(f, Bib.AjustaStr('', 550));
        WriteLn(f);
      end;
    except
      MessageDlg('Erro na geração do arquivo.', mtError, [mbOK], 0);
      Exit;
    end;
  finally
    CloseFile(f);
  end;
  MessageDlg('Arquivo gerado com sucesso.', mtInformation, [mbOK], 0);
end;

procedure TFContasReceberCad.LanaJurosManual1Click(Sender: TObject);
begin
  inherited;
  if DMContasReceber.QContasReceber_CabCod_Conta_Receber_Cab.Text = '' then
    raise Exception.Create('Selecionar Titulo Para Lançar Juros');
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[38].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    try
      DMContasReceber.QContasReceber_Cab.Edit;
      DMContasReceber.QContasReceber_Mov.Insert;
      DMContasReceber.QContasReceber_MovDt_Movimento.Value := StrToDate(Trim(FContasReceberParam.Me39DtLancamento.Text));
      DMContasReceber.QContasReceber_MovVal_Movimento.Value := StrToFloat(Trim(FContasReceberParam.Me39VlJiuros.Text));
      DMContasReceber.QContasReceber_MovDesc_Observacao.Value := Trim(FContasReceberParam.Me39Observacao.Text);
      DMContasReceber.QContasReceber_MovInd_Tipo_Movimento.Value := 'JUROS';
      DMContasReceber.QContasReceber_Mov.Post;
      DMContasReceber.QContasReceber_CabVal_Juros.Value := DMContasReceber.QContasReceber_CabVal_Juros.Value +
        StrToFloat(Trim(FContasReceberParam.Me39VlJiuros.Text));
      DMContasReceber.QContasReceber_Cab.Post;
      DMOracle.DBCemapa.Commit;
    except
      DMContasReceber.QContasReceber_Mov.Cancel;
      DMContasReceber.QContasReceber_Cab.Cancel;
      DMOracle.DBCemapa.RollBack;
      raise exception.create('Erro! Transação não efetuada');
    end;
  end;

end;

procedure TFContasReceberCad.PrazoMdio1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[39].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DMContasReceber.QContasReceberPrazoMedio.Close;
    if Trim(FContasReceberParam.Fm40Filial.MeFilial.Text) <> '' then
      DMContasReceber.QContasReceberPrazoMedio.SetVariable('COD_FILIAL', Trim(FContasReceberParam.Fm40Filial.MeFilial.Text))
    else
      DMContasReceber.QContasReceberPrazoMedio.SetVariable('COD_FILIAL', Null);
    if Trim(FContasReceberParam.Fm40Finalidade.MeFinalidade.Text) <> '' then
      DMContasReceber.QContasReceberPrazoMedio.SetVariable('COD_FINALIDADE', Trim(FContasReceberParam.Fm40Finalidade.MeFinalidade.Text))
    else
      DMContasReceber.QContasReceberPrazoMedio.SetVariable('COD_FINALIDADE', Null);
    DMContasReceber.QContasReceberPrazoMedio.SetVariable('DT_INICIAL', Trim(FContasReceberParam.Me40DtInicial.Text));
    DMContasReceber.QContasReceberPrazoMedio.SetVariable('DT_FINAL', Trim(FContasReceberParam.Me40DtFinal.Text) + ' 23:59:59');
    DMContasReceber.QContasReceberPrazoMedio.Open;
    ShowMessage('Prazo Médio Contas Receber:' + DMContasReceber.QContasReceberPrazoMedioPrazo_Medio.Text);
  end;
end;

procedure TFContasReceberCad.ComissoAnalitico1Click(Sender: TObject);
begin
  inherited;
  If DMParamSistema.CodEmpresa = 'DEION' then
  Begin
    if FContasReceberParam = nil then
      FContasReceberParam := TFContasReceberParam.Create(Application);
    FContasReceberParam.PGRelatorio.Pages[44].TabVisible := True;
    if FContasReceberParam.ShowModal = mrOk then
    begin
       DMContasReceber_Rel.QRComissaoRecebidosClasse.Close;
       DmUsuario.Checar_Filial_Usuario(FContasReceberParam.ME30CodFilial.Text, 'CONTAS A RECEBER');

    if Trim(FContasReceberParam.Fm44Filial.MeFilial.text) <> '' then
       DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('FILIAL',
          FContasReceberParam.Fm44Filial.MeFilial.text)
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('FILIAL', Null);

    if Trim(FContasReceberParam.Fm44Vendedor.MeVendedor.text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('VENDEDOR',
          FContasReceberParam.Fm44Vendedor.MeVendedor.text)
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('VENDEDOR', Null);

      if Trim(FContasReceberParam.FmDtEmissao44.MeDtInicial.text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_EMISSAO_I',
          Trim(FContasReceberParam.FmDtEmissao44.MeDtInicial.text))
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_EMISSAO_I', Null);

      if Trim(FContasReceberParam.FmDtEmissao44.MeDtFinal.Text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_EMISSAO_F',
          Trim(FContasReceberParam.FmDtEmissao44.MeDtFinal.Text))
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_EMISSAO_F', Null);

      if Trim(FContasReceberParam.FmDtRecto44.MeDtInicial.text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_RECTO_I',
          Trim(FContasReceberParam.FmDtRecto44.MeDtInicial.text))
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_RECTO_I', Null);

      if Trim(FContasReceberParam.FmDtRecto44.MeDtFinal.text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_RECTO_F',
          Trim(FContasReceberParam.FmDtRecto44.MeDtFinal.text))
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('DT_RECTO_F', Null);

      if Trim(FContasReceberParam.ME44Classe.Text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('CLASSE','TB_CLASSE.NUM_CLASSE IN (' + Trim(FContasReceberParam.ME44Classe.text) + ')')
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('CLASSE', '1=1');

      if Trim(FContasReceberParam.Fm44Regiao.MeRegiao.Text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('REGIAO',
          FContasReceberParam.Fm44Regiao.MeRegiao.text)
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('REGIAO', Null);

      if Trim(FContasReceberParam.Fm44Cidade.MeCidade.text) <> '' then
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('CIDADE',
          FContasReceberParam.Fm44Cidade.MeCidade.text)
      else
        DMContasReceber_Rel.QRComissaoRecebidosClasse.SetVariable('CIDADE', Null);

      DMContasReceber_Rel.QRComissaoRecebidosClasse.Open;

      if FRComissaoRecebidosClasse = nil then
        FRComissaoRecebidosClasse := TFRComissaoRecebidosClasse.Create(Application);

      FRComissaoRecebidosClasse.QRLabel3.Caption := 'Filial: ' +
          Trim(FContasReceberParam.Fm44Filial.EdFilial.Text) + ' - ' +
          Trim(FContasReceberParam.Fm44Filial.MeFilial.Text) +
         ' Período de Recebimento ' +
          FContasReceberParam.FmDtRecto44.MeDtInicial.Text + ' Até ' +
          FContasReceberParam.FmDtRecto44.MeDtFinal.Text;

      FRComissaoRecebidosClasse.QRLabel7.Caption := 'Região: ' +
          Trim(FContasReceberParam.Fm44Regiao.MeRegiao.Text) + ' - Cidade : ' +
          Trim(FContasReceberParam.Fm44Cidade.MeCidade.Text) + ' - Classe : ' +
          FContasReceberParam.ME44Classe.Text;


      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRComissaoRecebidosClasse.QRPrimario.Preview
      else
        FRComissaoRecebidosClasse.QRPrimario.Print;

    end
  end
  else
  Begin
    if FContasReceberParam = nil then
      FContasReceberParam := TFContasReceberParam.Create(Application);
    FContasReceberParam.PGRelatorio.Pages[40].TabVisible := True;
    if FContasReceberParam.ShowModal = mrOk then
      with DMContasReceber_Rel do
      begin
        QRComissaoAnalitico.Close;
        DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.Fm41Filial.MeFilial.Text), 'CONTAS A RECEBER');

        if Trim(FContasReceberParam.Fm41Filial.MeFilial.Text) <> '' then
          QRComissaoAnalitico.SetVariable('FILIAL', Trim(FContasReceberParam.Fm41Filial.MeFilial.Text))
        else
          QRComissaoAnalitico.SetVariable('FILIAL', Null);

        if Trim(FContasReceberParam.Fm41Vendedor.MeVendedor.Text) <> '' then
          QRComissaoAnalitico.SetVariable('VENDEDOR', Trim(FContasReceberParam.Fm41Vendedor.MeVendedor.Text))
        else
          QRComissaoAnalitico.SetVariable('VENDEDOR', Null);

        QRComissaoAnalitico.SetVariable('DATA_I', Trim(FContasReceberParam.Fm41Datas.MeDtInicial.Text));
        QRComissaoAnalitico.SetVariable('DATA_F', Trim(FContasReceberParam.Fm41Datas.MeDtFinal.Text) + ' 23:59:59');

        QRComissaoAnalitico.Open;

        if FRComissaoAnalitico = nil then
          FRComissaoAnalitico := TFRComissaoAnalitico.Create(Application);
        FRComissaoAnalitico.QRLTitulo.Caption := 'Relatório de Comissão - Filial: ' +
          Trim(FContasReceberParam.Fm41Filial.EdFilial.Text) + ' - ' +
          Trim(FContasReceberParam.Fm41Filial.MeFilial.Text);
        FRComissaoAnalitico.QRLPeriodo.Caption := 'Período de ' +
          FContasReceberParam.Fm41Datas.MeDtInicial.Text + ' Até ' +
          FContasReceberParam.Fm41Datas.MeDtFinal.Text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRComissaoAnalitico.QRPrimario.Preview
        else
          FRComissaoAnalitico.QRPrimario.Print;
        QRComissaoAnalitico.Close;
      end;
  end;
end;

procedure TFContasReceberCad.SbObraClick(Sender: TObject);
begin
  inherited;
  if FObraCons = nil then
    FObraCons := TFObraCons.Create(Application);
  if FObraCons.ShowModal = mrOk then
    DMContasReceber.QContasReceber_CabCod_Obra.Value := DMObra.QObra_ConsCod_Obra.Value;
end;

procedure TFContasReceberCad.BtnGerarComissaoClick(Sender: TObject);
var valor, valOriginalTotal, percComissao: Extended;
  percComissaoStr, valorStr: string;
  codPrimeiraParcela: Integer;
begin
  inherited;
  if DMContasReceber.QContasReceber_CabCOD_VENDEDOR.IsNull then
  begin
    MessageDlg('Para gerar comissão é necessário possuir um vendedor informado.', mtError, [mbOK], 0);
    Exit;
  end;

  if DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.IsNull then
  begin
    MessageDlg('Seleciona uma conta a receber.', mtError, [mbOK], 0);
    Exit;
  end;

  DMContasReceber.QComissao.Close;
  DMContasReceber.QComissao.SetVariable('COD_CONTA_RECEBER_CAB', DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);
  DMContasReceber.QComissao.SetVariable('NUM_PARCELA'
    , DMContasReceber.QContasReceber_CabNUM_PARCELA.Value);
  DMContasReceber.QComissao.Open;

//  if ((not DMContasReceber.QComissao.IsEmpty) or
//    (DMOracle.FastSelect('COUNT(*)', 'TB_COMISSAO_VENDEDOR', 'COD_CONTA_RECEBER_CAB IN (' + 'SELECT COD_CONTA_RECEBER_CAB FROM TB_CONTA_RECEBER_CAB WHERE NUM_TITULO = ' + DMContasReceber.QContasReceber_CabNUM_TITULO.Text + ' AND DESC_TIPO_DOCUMENTO = ' + QuotedStr(DMContasReceber.QContasReceber_CabDESC_TIPO_DOCUMENTO.Text) + ' AND COD_CADASTRO = ' + DMContasReceber.QContasReceber_CabCOD_CADASTRO.Text + ' AND COD_FILIAL = ' + DMContasReceber.QContasReceber_CabCOD_FILIAL.Text + ')') <> '0')
//    ) then
//  begin
//    MessageDlg('Esta conta a receber já tem comissão gerada.', mtError, [mbOK], 0);
//    Exit;
//  end;

  if (not DMContasReceber.QComissao.IsEmpty) then
    if (MessageDlg('Esta conta a receber já possui comissão gerada.' + #13 + #10 + 'Deseja alterar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
      Exit;

  valOriginalTotal := DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value;

  percComissaoStr := FormatFloat('#,###,##0.00', DMContasReceber.QContasReceber_CabPERC_COMISSAO.Value);
  if (not InputQuery('Percentual de Comissão', 'Informe o percentual de comissão sobre o valor total de R$ ' + FormatFloat('#,###,##0.00', valOriginalTotal) + ': ', percComissaoStr)) then
    Exit;
  percComissao := StrToFloat(Bib.LimpaNumero(percComissaoStr, True));

  valorStr := FormatFloat('#,###,##0.00', ((valOriginalTotal * percComissao) / 100));
  if (not InputQuery('Valor da Comissão', 'Confirme o valor real da comissão (R$): ', valorStr)) then
    Exit;
  valor := StrToFloat(Bib.LimpaNumero(valorStr, True));

//  valor := (DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value * DMContasReceber.QContasReceber_CabPERC_COMISSAO.Value) / 100;

  if (MessageDlg('Deseja realmente gerar uma comissão para ' + DMContasReceber.QContasReceber_Cabdesc_Vendedor.Value + ' no valor de R$ ' + FormatFloat('#,###,##0.00', valor) + '?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  try
    DMOracle.ExecutaSql('UPDATE TB_CONTA_RECEBER_CAB SET PERC_COMISSAO = '
      + Bib.TrocaVirgulaPorPonto(Bib.LimpaNumero(percComissaoStr, True))
      + ' WHERE COD_CONTA_RECEBER_CAB = '
      + DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text
    );

    if DMContasReceber.QComissao.IsEmpty then
      DMContasReceber.QComissao.Append
    else
      DMContasReceber.QComissao.Edit;
    DMContasReceber.QComissaoCOD_CONTA_RECEBER_CAB.Value := DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value;
    DMContasReceber.QComissaoVAL_COMISSAO.Value := valor;
    DMContasReceber.QComissaoCOD_VENDEDOR.Value := DMContasReceber.QContasReceber_CabCOD_VENDEDOR.Value;
    DMContasReceber.QComissao.Post;

    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
  end;
end;

procedure TFContasReceberCad.FormCreate(Sender: TObject);
begin
  inherited;
  DSPrimario.DataSet := DMContasReceber.QContasReceber_Cab;
end;

procedure TFContasReceberCad.PosioMensal1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[41].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
    with DMContasReceber_Rel do
    begin
      QRContasReceberPosicaoMensal.Close;
      DmUsuario.Checar_Filial_Usuario(Trim(FContasReceberParam.Fm42Filial.MeFilial.Text), 'CONTAS A RECEBER');

      if Trim(FContasReceberParam.Fm42Filial.MeFilial.Text) <> '' then
        QRContasReceberPosicaoMensal.SetVariable('COD_FILIAL', Trim(FContasReceberParam.Fm42Filial.MeFilial.Text))
      else
        QRContasReceberPosicaoMensal.SetVariable('COD_FILIAL', Null);

      if Trim(FContasReceberParam.Fm42Cadastro.MeCadastro.Text) <> '' then
        QRContasReceberPosicaoMensal.SetVariable('COD_CADASTRO', Trim(FContasReceberParam.Fm42Cadastro.MeCadastro.Text))
      else
        QRContasReceberPosicaoMensal.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasReceberParam.Fm42Departamento.MeDepartamento.Text) <> '' then
        QRContasReceberPosicaoMensal.SetVariable('COD_DEPARTAMENTO', Trim(FContasReceberParam.Fm42Departamento.MeDepartamento.Text))
      else
        QRContasReceberPosicaoMensal.SetVariable('COD_DEPARTAMENTO', Null);

      QRContasReceberPosicaoMensal.SetVariable('DT_INICIAL', Trim(FContasReceberParam.Fm42Datas.MeDtInicial.Text));
      QRContasReceberPosicaoMensal.SetVariable('DT_FINAL', Trim(FContasReceberParam.Fm42Datas.MeDtFinal.Text) + ' 23:59:59');

      QRContasReceberPosicaoMensal.Open;

      if FRContasReceberPosicaoMensal = nil then
        FRContasReceberPosicaoMensal := tFRContasReceberPosicaoMensal.Create(Application);
      FRContasReceberPosicaoMensal.QRLPeriodo.Caption := 'Período de ' + FContasReceberParam.Fm42Datas.MeDtInicial.Text + ' Até ' +
                                           FContasReceberParam.Fm42Datas.MeDtFinal.Text;
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContasReceberPosicaoMensal.QRPrimario.Preview
      else
        FRContasReceberPosicaoMensal.QRPrimario.Print;
      QRContasReceberPosicaoMensal.Close;
    end;

end;
procedure TFContasReceberCad.AcrescentarValoraoTtulo1Click(
  Sender: TObject);
var wValor: string;
    wVlTitulo,wVlOriginal : Real;
    ClickedOK: Boolean;
begin
  inherited;
  // Acrescentar valor ao Título a Receber,
  // similar ao que é feito no C. Pagar - Djeison A. S. 24/07/2013
  if DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text <> '' then
  begin
    If DMContasReceber.QContasReceber_CabIND_SITUACAO.Value = 'BAIXA TOTAL' Then
       Raise Exception.Create('Titulo já baixado totalmente - não permite acrescentar valor');
    wValor := '0';
    ClickedOK := InputQuery('Digite Valor de Acréscimo', 'Valor:', wValor);
    if ClickedOK then
      with DMOracle do
      begin
        try
          wVlTitulo := DMContasReceber.QContasReceber_CabVAL_TITULO.Value + StrToFloat(wValor);
          wVlOriginal := DMContasReceber.QContasReceber_CabVAL_ORIGINAL.Value + StrToFloat(wValor);
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTA_RECEBER_CAB SET VAL_ORIGINAL = ' +
            Bib.TrocaVirgulaPorPonto(FloatToStr(wVlOriginal)) + ', VAL_TITULO = ' +
            Bib.TrocaVirgulaPorPonto(FloatToStr(wVlTitulo)));
          QExecSQL.SQL.Add(' WHERE Cod_Conta_Receber_Cab = ' +
            DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text);
          QExecSQL.ExecSQL;

          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTA_RECEBER_MOV SET VAL_MOVIMENTO = ' +
            Bib.TrocaVirgulaPorPonto(FloatToStr(wVlOriginal)));
          QExecSQL.SQL.Add(' WHERE Cod_Conta_Receber_Cab = ' +
            DMContasReceber.QContasReceber_CabCOD_CONTA_RECEBER_CAB.Text);
          QExecSQL.SQL.Add(' And Ind_Tipo_Movimento = ' + QuotedStr('PRINCIPAL'));
          QExecSQL.ExecSQL;

          DMOracle.DBCemapa.Commit;
          DMContasReceber.QContasReceber_Cab.Refresh;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Valor não foi atualizado');
        end;
      end;
  end;

end;

procedure TFContasReceberCad.ArquivoRemessa1Click(Sender: TObject);
{
    Procedimento criado para centralizar chamadas da Geração de Arquivos de
    Remessa. - Djeison A. S. - 29/07/2013
}
var
  wAux, wValSequencia: string;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    with DMContasReceber do
    begin
    QRemessa.Close;
    if Trim(FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text) <> '' then
      QRemessa.SetVariable('COD_CONTA_CORRENTE',
        FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.text)
    else
      QRemessa.SetVariable('COD_CONTA_CORRENTE', Null);

    if Trim(FContasReceberParam.Fm17Datas.MeDtInicial.text) <> '' then
      QRemessa.SetVariable('DT_INICIAL',
        FContasReceberParam.Fm17Datas.MeDtInicial.text)
    else
      QRemessa.SetVariable('DT_INICIAL', Null);

    if Trim(FContasReceberParam.Fm17Datas.MeDtFinal.text) <> '' then
      QRemessa.SetVariable('DT_FINAL', FContasReceberParam.Fm17Datas.MeDtFinal.text + ' 23:59:59')
    else
      QRemessa.SetVariable('DT_FINAL', Null);

    if Trim(FContasReceberParam.Fm17TituloInicial.MeContasReceber.text) <> '' then
      QRemessa.SetVariable('NUM_TITULO', FContasReceberParam.Fm17TituloInicial.MeContasReceber.text)
    else
      QRemessa.SetVariable('NUM_TITULO', Null);

    if Trim(FContasReceberParam.Fm17TituloFinal.MeContasReceber.Text) <> '' then
      QRemessa.SetVariable('NUM_TITULO_FINAL', FContasReceberParam.Fm17TituloFinal.MeContasReceber.text)
    else
      QRemessa.SetVariable('NUM_TITULO_FINAL', Null);

    if Trim(FContasReceberParam.Me17Instrucoes.Text) <> '' then
      wAux := DMOracle.BuscaNome('SELECT DESC_MENSAGEM FROM TB_MENSAGEM',
        'COD_MENSAGEM = ' + Trim(FContasReceberParam.Me17Instrucoes.text),
        True);

    QRemessa.SetVariable('IND_REMESSA', 'NAO');

    QRemessa.Open;
    if (QRemessa.RecordCount > 0) and
      (MessageDlg('Deseja gerar o relatório dos títulos que constam nesta remessa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      if FRRemessas_641 = nil then
        FRRemessas_641 := TFRRemessas_641.create(Application);

      //Pega a sequencia do arquivo remessa para mostrar no relatório.
      if (QRemessaCOD_BANCO.Value = 748) then  // Sicredi
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_SICREDI') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end;
      if (QRemessaCOD_BANCO.Value = 756) then  // Sicoob Bancoob Cnab 240
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_SICOOB_240') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end;
      if (QRemessaCOD_BANCO.Value = 341) then  //Itau
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_ITAU') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end;
      if (QRemessaCOD_BANCO.Value = 001) then  //Brasil
      begin
        if (DMParamSistema.QParamSistemaIND_SICOOB_BB.Text = 'S') then
        begin
          wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_BBSICOOB') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
          if wValSequencia <> '' then
            FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
        end
        else
        begin
          wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_BB') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
          if wValSequencia <> '' then
            FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
        end;
      end;
      if (QRemessaCOD_BANCO.Value = 237) then //Bradesco
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_BRADESCO') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end;
      if (QRemessaCOD_BANCO.Value = 133) then //Cresol  antes estava 555
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_CRESOL') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end;
      if (QRemessaCOD_BANCO.Value = 099) then //Uniprime
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_UNIPRIME') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end;
      if (QRemessaCOD_BANCO.Value = 033) then //Santander
      begin
        wValSequencia := DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA = ' + QuotedStr('ARQ_REM_SANTANDER') + 'AND COD_FILIAL = ' + QRemessaCOD_FILIAL.Text);
        if wValSequencia <> '' then
          FRRemessas_641.QRLSeqRemessa.Caption := IntToStr(strtoint(wValSequencia) + 1);
      end
      else
        FRRemessas_641.QRLTitulo.Caption := FContasReceberParam.Me17Titulo.Text +
        FContasReceberParam.Fm17Datas.MeDtInicial.text + ' até ' +
        FContasReceberParam.Fm17Datas.MeDtFinal.text + ' - Conta Corrente: ' +
          FContasReceberParam.Fm17ContaCorrente.MeContaCorrente.Text;
        FRRemessas_641.QRLEmpresa.Caption := 'Filial: ' + QRemessaDESC_FILIAL.Text;
        if FContasReceberParam.RGPreview.ItemIndex = 0 then
          FRRemessas_641.QRPrimario.Preview
        else
          FRRemessas_641.QRPrimario.Print;
        QRemessa.First;
      end;

    if QRemessa.RecordCount > 0 then
    begin
      if (QRemessaCOD_BANCO.Value = 001) then // Banco do Brasil
      begin
        if (DMParamSistema.QParamSistemaIND_SICOOB_BB.Text = 'S') then
          GeraRemessaSicoobBB //quando o boleto for BB e a remessa correspondente Sicoob
        else
          GeraRemessaBB;
      end
      else if (QRemessaCOD_BANCO.Value = 748) then  // Sicredi
        GeraRemessaSicredi
      else if (QRemessaCOD_BANCO.Value = 237) then  // Bradesco
        GeraRemessaBradesco
       else if (QRemessaCOD_BANCO.Value = 099) then  // Uniprime
        GeraRemessaUniprime
      else if (QRemessaCOD_BANCO.Value = 133) then  // Cresol antes estava 555
        GeraRemessaCresol
      else if (QRemessaCOD_BANCO.Value = 756) then  // Sicoob
        GeraRemessaSicoob
      else if (QRemessaCOD_BANCO.Value = 341) then  // Itau
        GeraRemessaItau
      else if (QRemessaCOD_BANCO.Value = 399) then  // HSBC
        GeraRemessaHSBC
      else if (QRemessaCOD_BANCO.Value = 453) then  // Banco Rural
        GeraRemessaRural
      else if (QRemessaCOD_BANCO.Value = 353) or
              (QRemessaCOD_BANCO.Value = 033) or   // Santander
              (QRemessaCOD_BANCO.Value = 347) then // Sudameris
        GeraRemessaSantander
      else if (QRemessaCOD_BANCO.Value = 104) and
              (DMParamSistema.QParamSistemaDESC_LAYOUT_CAIXA.Text = 'SIGCB') then
        GeraRemessaCaixaSIGCB
      else if (QRemessaCOD_BANCO.Value = 409) or   //  UNIBANCO
              (QRemessaCOD_BANCO.Value = 422) or   //  SAFRA
              (QRemessaCOD_BANCO.Value = 104) then //  CAIXA
        GeraRemessaCaixa
    end
    else
      MessageDlg('Não existem registros a serem gerados!', mtInformation,
        [mbOk], 0);
  end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaBB;
var
  mNUM_CEDENTE: string;
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  S: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo, mTipo_Cobranca: string;
  wAux: string;
  wDesconto: Real;
  wBoleta7: Boolean;
begin
  With DMContasReceber do
  begin
    try
      wBoleta7 := (Length(QRemessaNUM_CONVENIO.Text) = 7); //Variavel para alterar emissao do boleto quando for convenio de 7 digitos.

      // REGISTRO HEADER ARQUIVO REMESSA 641-CBR
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'ZADIMEL') then
        mSEQ_REMESSA := DMSequencia.Sequencia(2, 'ARQ_REM_BB');

      mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_BB');
      mNUM_CEDENTE := Copy(QRemessaNUM_CONTA_CORRENTE.Text,
        Length(QRemessaNUM_CONTA_CORRENTE.Value), 1);

      if (UpperCase(mNUM_CEDENTE) >= 'A') and (UpperCase(mNUM_CEDENTE) <=
        'Z') then
      begin
        mNUM_CEDENTE := RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 8);
        mNUM_CEDENTE := mNUM_CEDENTE + Copy(QRemessaNUM_CONTA_CORRENTE.Text,
          Length(QRemessaNUM_CONTA_CORRENTE.Text), 1);
      end
      else
        mNUM_CEDENTE := RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 8) +
                        QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text;

      if QRemessaNUM_CONVENIO.Value <= 9999 then
        mNUM_CONVENENTE := RMaskCGC_CPF(QRemessaCOD_CONVENENTE_LIDER.Text, 4) + '00'
      else
        mNUM_CONVENENTE := RMaskCGC_CPF(QRemessaCOD_CONVENENTE_LIDER.Text, 6);

      mBrancos := '';
      for x := 1 to 287 do
      begin
        mBrancos := mBrancos + ' ';
      end;

      S := ''; // Inicia variavel.

      S := S + '01REMESSA01COBRANCA       ' +
        RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
        RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Value, 1) +
        mNUM_CEDENTE;
      if not (wBoleta7) then
      begin
        S := S + mNUM_CONVENENTE +
          FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
          RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
          '001BANCO DO BRASIL' +
          Copy(DateToStr(Date), 1, 2) +
          Copy(DateToStr(Date), 4, 2) +
          RMaskCGC_CPF(Copy(DateToStr(Date), 9, 2), 2) +
          RMaskCGC_CPF(FloatToStr(mSEQ_REMESSA), 7) +
        {Pegar funcao e Não esquecer incrementar arquivo sequencia}
        mBrancos +
          '000001' + Chr(13) + Chr(10); // Sequencial do registro=0001
      end
      else
      begin
        S := S + '000000' +
          FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
          RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
          '001BANCO DO BRASIL' +
          Copy(DateToStr(Date), 1, 2) +
          Copy(DateToStr(Date), 4, 2) +
          RMaskCGC_CPF(Copy(DateToStr(Date), 9, 2), 2) +
          RMaskCGC_CPF(FloatToStr(mSEQ_REMESSA), 7) +
        {Pegar funcao e Não esquecer incrementar arquivo sequencia}
        copy(mBrancos, 1, 22) +
          QRemessaNUM_CONVENIO.Text +
          copy(mBrancos, 1, 258) +
          '000001' + Chr(13) + Chr(10); // Sequencial do registro=0001
      end;

      // REGISTRO DETALHE ARQUIVO REMESSA 641-CBR

      mSequencial := 2; { 1=Registro HEADER }
      while not QRemessa.Eof do
      begin
        mBrancos := '';
        for x := 1 to 8 do
        begin
          mBrancos := mBrancos + ' '; // Usado anteriormente também.
        end;

        // Prefixo do titulo \\
        mPrefixoTitulo := 'AI ';
        if (QRemessaCARTEIRA.Value = 11) or (QRemessaCARTEIRA.Value = 13) or
          (QRemessaCARTEIRA.Value = 15) or (QRemessaCARTEIRA.Value = 17) then
          mPrefixoTitulo := 'AI '
        else if QRemessaCARTEIRA.Value = 12 then
          mPrefixoTitulo := 'AIU'
        else if (QRemessaCARTEIRA.Value = 31) or (QRemessaCARTEIRA.Value = 51) or
          (QRemessaCARTEIRA.Value = 54) then
          mPrefixoTitulo := 'SD ';
        if QRemessaDesc_Tipo_Cobranca.Value = 'VINCULADA' then // TIPO DE COBRANCA
          mTipo_Cobranca := '02VIN'
        else
          if QRemessaDesc_Tipo_Cobranca.Value = 'DESCONTADA' then
            mTipo_Cobranca := '04DSC'
          else
            if QRemessaDesc_Tipo_Cobranca.Value = 'BBVENDOR' then
              mTipo_Cobranca := '08VDR'
            else
              mTipo_Cobranca := '     ';

        mContaCaucao := '0';

        {           if QRemessaCARTEIRA.Value = 31 then  // foi conversado com a Jussara no fone 041-321-2570 e ela informou que este campo nao é mais tratado entao preencher com 0
                     if (StrToDate(QRemessaDT_VENCIMENTO.Text) <= date + 180 ) then
                        mContaCaucao := '1'
                     else
                        mContaCaucao := '2';  }

  //            if Length(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14)) = 14 then
        if QRemessaIND_FISICA_JURIDICA.Value = 'J'  then
          mTipoInscricao := '02'
        else
          mTipoInscricao := '01';

        // Isto é necessario para nosso numero com letras exemplo : X
        mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;
        while Pos(' ', mCodNossoNumero) > 0 do
          mCodNossoNumero[Pos(' ', mCodNossoNumero)] := '0';
        if Trim(mCodNossoNumero) = '' then
          mCodNossoNumero := '00000000000 ';
        //---adicionado pelo Fabio para corrigir problema de conversao de layout 400 p/240 zadimel
        if (DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA', '') = 'ZADIMEL') then
          wNumTitulo := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 7) + '/' + RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2)
        else
          if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') then
              wNumTitulo := FormatMaskText('CCCCCCCCCC',QRemessaNUM_TITULO.Text)
  //                wNumTitulo := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 7) + '-' + RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2)
          else
            wNumTitulo := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10);

        { Número da sequencia segundo layout }
        if not (wBoleta7) then
        begin // convenio com 7 digitos
          {1 e 2 }S := S + '102' +
          {3}RMaskCGC_CPF(QRemessanum_cgc_filial_conta.Text, 14) +
          {4}RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
          {5}RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Value, 1) +
          {6}Copy(mNUM_CEDENTE, 1, 8) +
          {7}FormatMaskText('C', QRemessaDIGITO_VERIFICADOR_CEDENTE.Value) +
          {8}RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 6) +
          {9}RMaskCGC_CPF(QRemessaCOD_FILIAL.Text, 2) +
          {9}RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 7) +
          {9}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6) +
          {9}RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2) +
          {9}'        ' +
          {10}RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 11) + //vitor
          //{10}mCodNossoNumero +        //vitor
          {11-12-13-14-15}'00000    ' +
          {16}mPrefixoTitulo +
          {17}RMaskCGC_CPF(QRemessaVARIACAO.Text, 3) +
          {18}mContaCaucao +
          {19-20-21}'000000000000' +
          {22}mTipo_Cobranca +
          {23}RMaskCGC_CPF(QRemessaCARTEIRA.Text, 2) +
          {24}RMaskCGC_CPF(QRemessaCOMANDO.Text, 2) +
            wNumTitulo +
            // {25}    RMaskCGC_CPF(QRemessaNUM_TITULO.Text,10)                                         +
          {26} Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          {26} Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          {26}RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2) +
          {27}StrZero(QRemessaVAL_TITULO.Value, 13, 2) +
          {28}'001' +
          {29-30}'0000 ' +
          {31}'01' + // 01=Duplicata mercatil
          {32}'N' +
          {33}Copy(QRemessaDT_EMISSAO.Text, 1, 2) +
          {33}Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
          {33}RMaskCGC_CPF(Copy(QRemessaDT_EMISSAO.Text, 9, 2), 2) +
          {34}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2);
          {35}if qremessaPERC_JURO_BLOQUETO.Text <> '' then
                S := S + '01'
              else
                S := S + '00';// sem instrucao
          {36}{if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
            S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
            else
            //S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
              S := S + IntDecimais(FloatToStr(QRemessaPerc_Juro_Dia.Value), 13, 2);} //estava sobrepondo o juro cadastrado no banco  12/04/2018
          {36} S := S + '0000000000000'; //Estava sobrepondo o valor de juros cadastrado no banco conforme email 05/04/2018 do Leonir e do Banco
                                         //Conversado com a Vanessa e fiz essa alteração - Junior 12/04/2018.

          wDesconto := StrToFloat('0' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO=' + DMContasReceber.QRemessaCOD_CADASTRO.Text, True));
          if wDesconto > 0 then
             {37}S := S + Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) + Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) + RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2)
          else
             {37}S := S + '000000'; // Data para desconto //
          wDesconto := ((DMContasReceber.QRemessaVAL_TITULO.Value * wDesconto) / 100);
          {38}S := S + IntDecimais(FloatToStr(wDesconto), 13, 2);
          {39}S := S + '0000000000000' + // CARTEIRA 15 OU 12
          {40}'0000000000000' + // Valor do abatimento
          {41}mTipoInscricao +
          {42}RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          {43}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',UpperCase(RemoveAcento(QRemessaNOME.Text))) +
          {44}'   ' +
          {45}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
          {45}'               ' +
          {46}RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          {47}FormatMaskText('CCCCCCCCCCCCCCC',
            UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
          {48}FormatMaskText('CC',UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text)) +
          {49}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', wAux)
            +
            {50}'00' + // Quantidade de dias p/protesto.
          {51}' ' +
          {52}RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
        end
        else
        begin // convenio com 7 digitos
          {1 e 2 }S := S + '702' +
          {3}RMaskCGC_CPF(QRemessanum_cgc_filial_conta.Text, 14) +
          {4}RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
          {5}RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Value, 1) +
          {6}Copy(mNUM_CEDENTE, 1, 8) +
          {7}FormatMaskText('C', QRemessaDIGITO_VERIFICADOR_CEDENTE.Value) +
          {8}RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 7) +
          {9}RMaskCGC_CPF(QRemessaCOD_FILIAL.Text, 2) +
          {9}RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 7) +
          {9}bib.FormataTextoEsq(QRemessaNUM_TITULO.Text, 6) +
  //              {9}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6) +
          {9}RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2) +
          {9}mBrancos +
          {10}mCodNossoNumero +
          {11-12-13-14}'0000    ' +
          {15}'   ' + // mPrefixoTitulo +
          {16}RMaskCGC_CPF(QRemessaVARIACAO.Text, 3) +
          {17}mContaCaucao +
          {18}'000000' +
          {19}mTipo_Cobranca +
          {20}RMaskCGC_CPF(QRemessaCARTEIRA.Text, 2) +
          {21}RMaskCGC_CPF(QRemessaCOMANDO.Text, 2) +
            wNumTitulo +
            // {25}    RMaskCGC_CPF(QRemessaNUM_TITULO.Text,10)                                         +
          {23}Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          {23}Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          {23}RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2) +
          {24}StrZero(QRemessaVAL_TITULO.Value, 13, 2) +
          {25}'001' +
          {26}'0000' +
          {27}' ' +
          {28}'01' + // 01=Duplicata mercatil
          {29}'N' +
          {30}Copy(QRemessaDT_EMISSAO.Text, 1, 2) +
          {30}Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
          {30}RMaskCGC_CPF(Copy(QRemessaDT_EMISSAO.Text, 9, 2), 2) +
          {34}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2);
          {35}if qremessaPERC_JURO_BLOQUETO.Text <> '' then
                S := S + '01'
              else
                S := S + '00';// sem instrucao
          {36}{if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then         //AQUII
                S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
              else
                //S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
                S := S + IntDecimais(FloatToStr(QRemessaPerc_Juro_Dia.Value), 13, 2);}//estava sobrepondo o juro cadastrado no banco  12/04/2018
          {36} S := S + '0000000000000'; //Estava sobrepondo o valor de juros cadastrado no banco conforme email 05/04/2018 do Leonir e do Banco
                                         //Conversado com a Vanessa e fiz essa alteração - Junior 12/04/2018.
          wDesconto := StrToFloat('0' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO=' + DMContasReceber.QRemessaCOD_CADASTRO.Text, True));
          if wDesconto > 0 then
             {34}S := S + Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) + Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) + RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2)
          else
             {34}S := S + '000000'; // Data para desconto //
          wDesconto := ((DMContasReceber.QRemessaVAL_TITULO.Value * wDesconto) / 100);
          {35}S := S + IntDecimais(FloatToStr(wDesconto), 13, 2);
          {36}S := S + '0000000000000' + // CARTEIRA 15 OU 12
          {37}'0000000000000' + // Valor do abatimento
          {38}mTipoInscricao +
          {39}RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          {40}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
            UpperCase(RemoveAcento(QRemessaNOME.Text))) +
          {41}'   ' +
          {42}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
            UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
          {43}FormatMaskText('CCCCCCCCCCCC',
            UpperCase(RemoveAcento(QRemessaDESC_BAIRRO.Text))) +
          {44}RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          {45}FormatMaskText('CCCCCCCCCCCCCCC',
            UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
          {46}FormatMaskText('CC',
            UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text)) +
          {47}FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC', wAux);
           //-- INICIO ALTERAÇÃO - JUNIOR - 10/07/2014.
           //Quando a instrução for 06 deve ter os dias de protesto na possição 392 a 393.
          {48}if QRemessaPRIMEIRA_INSTR_COD.Value = '06' then
                S := S + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2)
              else
                S := S + '  ' ;
//        {48} '  ' + //comentei por usar o IF logo acima - junior 10/07/2014.
//        {48}RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2) + // Quantidade de dias p/protesto.
          {49}S := S + ' ' +    //incrementei o s := s + 
          {50}RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
        end;
        mSequencial := mSequencial + 1;

        { - Registro tipo 5 - Multa - Djeison A. S. - 20/12/2013 }
        if (QRemessaPERC_JURO_MORA.Value > 0.00) then
        begin
          S := S +
          '5' +   {001-001 - Registro}
          '99' +  {002-003 - Tipo de Serviço}
          '2' +   {004-004 - Código da Multa 1-Valor; 2-Percentual; 9-Não Cobrar}
          FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value + 1) + {005-010 - Data de início da cobrança}
          RMaskCGC_CPF(QRemessaPERC_JURO_MORA.Text, 12) + {011-022 - Valor/Percentual de multa}
          Bib.FormataTexto(' ', 372) + {023-394 - Complemento do Registro: “Brancos”}
          RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10); {395-400 -  Número Seqüencial do Registro no Arquivo }
          mSequencial := mSequencial + 1;
        end;
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end; // fim do while

      // -------------   Registro Trailler -------------- \\

      mBrancos := '';
      for x := 1 to 393 do
      begin
        mBrancos := mBrancos + ' '; // Usado anteriormente também.
      end;
      S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
      // +Chr(13)+Chr(10);

    //------------------ Fim --------------------------\\

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA-CBR 641 Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end
      else
        MessageDlg('Arquivo REMESSA-CBR 641 não foi Gerado!', mtWarning,
          [mbOk], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaSicredi;
var
  mSequencial: Integer;
  mSEQ_REMESSA, wDesconto: Real;
  S: string;
  F: TextFile;
  wNumCC, wPraca: string;
begin
  mSequencial := 1;
  With DMContasReceber do
  begin
    if QRemessa.RecordCount > 0 then
    begin
      try
      DMORACLE.DBCemapa.StartTransaction;
        // INICIO REGISTRO HEADER ARQUIVO REMESSA SICREDI--------------------------------\\
        mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SICREDI');
        S := ''; // Inicia variavel.
        S := '01REMESSA01COBRANCA       ' +
          RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5) +
          {32-45}RMaskCGC_CPF(Trim(DMOracle.BuscaNome('SELECT NUM_CGC FROM TB_FILIAL', ' COD_FILIAL = ' +
          Trim(QRemessaCOD_FILIAL.Text), True)), 14) +
        {46-76}Bib.FormataTexto(' ', 31) +
          '748SICREDI        ' +
          FormatDateTime('yyyymmdd', Date) +
          {111-117}Bib.FormataTexto(' ', 8);
        if mSEQ_REMESSA > 9999999 then
          raise Exception.Create('A sequência precisa ser reinicializada')
        else
          S := S + RMaskCGC_CPF(FloatToStr(mSEQ_REMESSA), 7);
        S := S + Bib.FormataTexto(' ', 273) +
          '2.00' +
          RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
        Inc(mSequencial);
        // FIM DO REGISTRO HEADER ARQUIVO REMESSA SICREDI---------------------------------\\

        // INICIO REGISTRO DETALHE ARQUIVO REMESSA SICREDI--------------------------------\\
        while not QRemessa.Eof do
        begin
          S := S + '1AAA' +
            Bib.FormataTexto(' ', 12) +
            'A' +
            {18-18}'A';
          {19-19}if Trim(QRemessaIND_TIPO_JURO.Text) = 'VALOR' then
            S := S + 'A'
          else
            S := S + 'B';
          {20-31}S := S + Bib.FormataTexto(' ', 12) +
          {32-47}Bib.FormataTexto(' ', 16) +
          {*48-62}RMaskCGC_CPF(Trim(QRemessaCOD_NOSSO_NUMERO.Text), 9) +
            '      ' +
            {*}FormatDateTime('yyyymmdd', Date) +
          {*71-72}' ' +
          {*72-72}'N' +

          //pos.73 alter. Marcos 1/8/08
            {*73-73}' ' +
          //{*73-73}    'N'                                                                              +
              {74-74}'B' +
          {75-78}'0000' +
            '    ' +
          {83-92}'0000000000';
          {93-96}
            if QRemessaPERC_JURO_MORA.value > 0 then
              //S := S + RMaskCGC_CPF(floattostr(QRemessaVAL_MULTA.value),4)
              S := S + intdecimais(QRemessaPERC_JURO_MORA.TEXT,4,2)
            else
              S := S + '0000';
          S := S + Bib.FormataTexto(' ', 12) +
            '01';
          {111-120}  S := S + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10); //Alteração Vanessa 24/08/2016
          S := S + RMaskCGC_CPF(FormatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value), 6) +
            intdecimais(QRemessaVAL_TITULO.Text, 13, 2) +
            Bib.FormataTexto(' ', 9);

          if Length(bib.LimpaNumero(QRemessaNUM_CGC.Value)) = 11 then   //Junior 18/08/2025.
            S := S + 'B' {149-149} //B - Duplicata rural (Emissor Rural)
          else
            S := S + 'A'; {149-149} // A Duplicata mercantil (Emissor CNPJ)
          if Trim(QRemessaIND_ACEITE.Text) = 'NAO' then
            S := S + 'N'
          else
            S := S + 'S';
          {151-156}S := S + RMaskCGC_CPF(FormatDateTime('ddmmyy', QRemessaDT_EMISSAO.Value), 6);
          {157-160}if QRemessaNR_DIAS_PROTESTO.Value > 0 then // instrucoes de protesto
            S := S + '06' + RMaskCGC_CPF(Trim(QRemessaNR_DIAS_PROTESTO.Text), 2)
          else
            S := S + '0000';
          {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
            S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
          else
            S := S + IntDecimais(FloatToStr(QRemessaPerc_Juro_Dia.Value), 13, 2);

          S := S + RMaskCGC_CPF(FormatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value), 6);
          wDesconto := StrToFloat('0' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO=' + QRemessaCOD_CADASTRO.Text, True));
          wDesconto := ((QRemessaVAL_TITULO.Value * wDesconto) / 100);
          S := S + IntDecimais(FloatToStr(wDesconto), 13, 2);

          S := S + RMaskCGC_CPF('0', 13) + RMaskCGC_CPF('0', 13);
          {219-219}if QRemessaIND_FISICA_JURIDICA.Text = 'J' then
            S := S + '2'
          else
            S := S + '1';
          S := S + '0' +
            RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
            Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaNOME.Text)), 40) +
            Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text)), 40) +
          {315-319}RMaskCGC_CPF('0', 5);
          {326-326}S := S + '000000 ' +
          {327-334}RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          {335-339}Bib.StrZero('0', 5) +
          {340-353}Bib.FormataTexto(' ', 14) +
          {354-394}Bib.FormataTexto(' ', 41) +
          {395-400}RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);

          mSequencial := mSequencial + 1;
          QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
            QRemessaCOD_CONTA_RECEBER_CAB.Value);
          QEnviadoBanco.ExecSQL;
          QRemessa.Next;
        end; // fim do while
        // FIM REGISTRO DETALHE ARQUIVO REMESSA SICREDI

        //-INICIO DO REGISTRO TRAILER---------------------------------------------------\\
        S := S + '91748' +
          RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5) +
          Bib.FormataTexto(' ', 384) +
          RMaskCGC_CPF(IntToStr(mSequencial), 6);
        // FIM DO REGISTRO TRAILER------------------------------------------------------\\

        //------------------ Fim --------------------------\\
        wNumCC := ''; //USADO PARA MONTAR O NOME DO ARQUIVO REMESSA
        mSequencial := StrToInt(FormatDateTime('MM', Date));
        case mSequencial of
          10: wNumCC := 'O';
          11: wNumCC := 'N';
          12: wNumCC := 'D';
        else
          wNumCC := IntToStr(mSequencial);
        end;

        Insert(RMaskCGC_CPF(Trim(QRemessaCODIGO_CEDENTE.Text), 5), wNumCC, 1);
        wNumCC := wNumCC + FormatDateTime('dd', Date) + '.CRM';
        FContasReceberParam.SDlg_Remessa.FileName := wNumCC;
        FContasReceberParam.SDlg_Remessa.Filter :=
          'Arquivo de Remessa Bansicredi';
        FContasReceberParam.SDlg_Remessa.DefaultExt := '';
        FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

        if FContasReceberParam.SDlg_Remessa.Execute then
        begin
          AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
          Rewrite(F);
          Writeln(F, S);
          CloseFile(F);
          DMOracle.DBCemapa.Commit;
          MessageDlg('Arquivo REMESSA Sicredi Gerado com Sucesso!',
            mtInformation, [mbOk], 0);
        end
        else
        begin
          DMOracle.DBCemapa.Rollback;
          MessageDlg('Arquivo REMESSA Sicredi não foi Gerado!', mtWarning,
            [mbOk], 0);
        end;
      except
        DMOracle.DBCemapa.Rollback;
        raise
          exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
          + #13 +
          'Verifique se não existem campos em branco no cadastro do Banco' + #13
          +
          'ou no cadastro de Clientes/Fornecedores.');
      end;
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaBradesco;
var
  wstrS: string;
  wstrCodEmpresa: string;
  wintContador: Integer;
  wintSeqArquivo: Integer;
  F: TextFile;
  wDesconto: Real;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MARICOTA' then
  begin
  with DMContasReceber do
  begin
    try
      wintContador := 2;
      wstrS := '';
      wstrCodEmpresa := '';

      wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_BRADESCO');
      wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
        IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
        IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
        + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);

      //REGISTRO HEADER
      {001-026} wstrS := '01REMESSA01COBRANCA       ' +
          //IntDecimais(Bib.StrZero(QRemessaNUM_CONVENIO.Text, 20), 20, 0) +
      {027-046} Intdecimais(Bib.StrZero(QRemessaNUM_COD_EMPRESA.Text, 20), 20, 0) +  //Adicionado pois não aparecia na remessa. Vanessa 10/04/2014
      {047-076} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
      {077-079} '237BRADESCO       ' +
      {095-110} FormatDateTime('DDMMYY', Date) + Bib.FormataTexto(' ', 8) +
        'MX' +
      {111-117} IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
      {118-400} Bib.FormataTexto(' ', 277) + '000001' + Chr(13) + Chr(10);

      //REGISTRO DETALHE
      while not QRemessa.Eof do
      begin
        {001-037} wstrS := wstrS + '1' + RMaskCGC_CPF('0', 19) + wstrCodEmpresa +
        {038-065} RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 25) + '000';//RMaskCGC_CPF('0', 8) +

        {066-066} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + '2'
                  else
                    wstrS := wstrS + '0';

        {067-070} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + intdecimais(QRemessaPERC_JURO_MORA.Text,4,2)
                  else
                    wstrS := wstrS + '0000';

        {071-082} wstrS := wstrS + RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
        {083-106} RMaskCGC_CPF('0', 10) + '2N' + Bib.FormataTexto(' ', 11) + '2' +
        {107-120} '  01' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
        {121-126} FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
        {127-139} IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
        {140-147} '0000000001';
        {150-150} if (QRemessaIND_ACEITE.Text = 'SIM') then
                    wstrS := wstrS + 'A'
                  else
                    wstrS := wstrS + 'N';
        {151-156} wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_EMISSAO.Value);
        {157-160} if QRemessaNR_DIAS_PROTESTO.Text <> '' then
                    wstrS := wstrS + '06' + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2)
                  else //ALTERADO MARCOS 15/12/2010
                    wstrS := wstrS + '0000';

        {161-173} //if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then comentado marcos 09/04/14 para o remessa sempre vai valor diario de juros
                    wstrS := wstrS + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                    DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                    (QRemessaVal_Titulo.Value / 100)), 13, 2);
        {174-179} wstrs := wstrS + RMaskCGC_CPF('0', 6);

        //dala limite p/ concessao de desconto

        {180-192} if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') or
                    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL')) then
                  begin
                    wDesconto := StrToFloat(DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO',
                      'COD_CADASTRO=' + DMContasReceber.QRemessaCOD_CADASTRO.Text, True));
                    wDesconto := ((DMContasReceber.QRBloquetoVAL_TITULO.Value * wDesconto) / 100);
                    wstrs := wstrS + IntDecimais(FloatToStr(wDesconto), 13, 2);
                    //valor do desconto
                  end
                  else
                    wstrs := wstrS + RMaskCGC_CPF('0', 13); //valor do desconto

        {193-205} wstrS := wstrS + RMaskCGC_CPF('0', 13); //valor do IOF
        {206-218} wstrS := wstrS + RMaskCGC_CPF('0', 13);
        //valor do abatimento a ser concedido ou cancelado
        {219-220} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                    wstrS := wstrS + '01'
                  else
                  begin
                    if (QRemessaIND_FISICA_JURIDICA.Text = 'J') then
                      wstrS := wstrS + '02'
                    else
                      wstrS := wstrS + '98';
                  end;
        {221-234} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
        {235-274} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
        {275-314} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
        {315-326} Bib.FormataTexto(' ', 12) +
        {327-334} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
        {335-394} Bib.FormataTexto(' ', 60) +
        {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);

        Inc(wintContador);
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end; //fim do while

      //registro trailler
      wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
      RMaskCGC_CPF(IntToStr(wintContador), 6);

      FContasReceberParam.SDlg_Remessa.FileName := 'CB' +
        FormatDateTime('DDMM', Date) + '01.REM';
      FContasReceberParam.SDlg_Remessa.Filter :=
        'Arquivo de Remessa Bradesco';
      FContasReceberParam.SDlg_Remessa.DefaultExt := '';
      FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, wstrS);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA Bradesco Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo REMESSA Bradesco não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
  end //If Maricota
  else
  with DMContasReceber do
  begin
    try
      wintContador := 2;
      wstrS := '';
      wstrCodEmpresa := '';
      wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_BRADESCO');
      wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
        IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
        IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
        + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);
      //REGISTRO HEADER
      {001-026} wstrS := '01REMESSA01COBRANCA       ' +
          //IntDecimais(Bib.StrZero(QRemessaNUM_CONVENIO.Text, 20), 20, 0) +
      {027-046} Intdecimais(Bib.StrZero(QRemessaNUM_COD_EMPRESA.Text, 20), 20, 0) +
      {047-076} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
      {077-079} '237BRADESCO       ' +
      {095-110} FormatDateTime('DDMMYY', Date) + Bib.FormataTexto(' ', 8) +
        'MX' +
      {111-117} IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
      {118-400} Bib.FormataTexto(' ', 277) + '000001' +
      {401-444} RMaskCGC_CPF('0', 44) + Chr(13) + Chr(10);

      //REGISTRO DETALHE
      while not QRemessa.Eof do
      begin
        {001-037} wstrS := wstrS + '1' + RMaskCGC_CPF('0', 19) + wstrCodEmpresa +
        {038-065} RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 25) + '000';

        {066-066} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + '2'
                  else
                    wstrS := wstrS + '0';

        {067-070} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + intdecimais(QRemessaPERC_JURO_MORA.Text,4,2)
                  else
                    wstrS := wstrS + '0000';

        {071-082} wstrS := wstrS + RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
        {083-106} RMaskCGC_CPF('0', 10) + '2N' + Bib.FormataTexto(' ', 11) + '2' +
        {107-120} '  01' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
        {121-126} FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
        {127-139} IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
        {140-147} '0000000002';
        {150-150} if (QRemessaIND_ACEITE.Text = 'SIM') then
                    wstrS := wstrS + 'A'
                  else
                    wstrS := wstrS + 'N';
        {151-156} wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_EMISSAO.Value);
        {157-160} if QRemessaNR_DIAS_PROTESTO.Text <> '' then
                    wstrS := wstrS + '06' + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2)
                  else
                    wstrS := wstrS + '0000';

        {161-173}
                    wstrS := wstrS + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                    DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                    (QRemessaVal_Titulo.Value / 100)), 13, 2);
        {174-179} wstrs := wstrS + RMaskCGC_CPF('0', 6);
        {180-192} if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FAVILLE') or
                    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZADIMEL')) then
                  begin
                    wDesconto := StrToFloat(DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO',
                      'COD_CADASTRO=' + DMContasReceber.QRemessaCOD_CADASTRO.Text, True));
                    wDesconto := ((DMContasReceber.QRBloquetoVAL_TITULO.Value * wDesconto) / 100);
                    wstrs := wstrS + IntDecimais(FloatToStr(wDesconto), 13, 2);
                    //valor do desconto
                  end
                  else
                    wstrs := wstrS + RMaskCGC_CPF('0', 13); //valor do desconto

        {193-205} wstrS := wstrS + RMaskCGC_CPF('0', 13); //valor do IOF
        {206-218} wstrS := wstrS + RMaskCGC_CPF('0', 13);
        //valor do abatimento a ser concedido ou cancelado
        {219-220} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                    wstrS := wstrS + '01'
                  else
                  begin
                    if (QRemessaIND_FISICA_JURIDICA.Text = 'J') then
                      wstrS := wstrS + '02'
                    else
                      wstrS := wstrS + '98';
                  end;
        {221-234} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
        {235-274} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
        {275-314} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
        {315-326} Bib.FormataTexto(' ', 12) +
        {327-334} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
        {335-394} Bib.FormataTexto(' ', 60) +
        {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6) +
        {401-444} RMaskCGC_CPF(QRemessaDESC_CHAVE_ACESSO.Text, 44) + Chr(13) + Chr(10);

        Inc(wintContador);
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end; //fim do while

      //registro trailler
      wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
      RMaskCGC_CPF(IntToStr(wintContador), 6) +
      RMaskCGC_CPF('0', 44);

      FContasReceberParam.SDlg_Remessa.FileName := 'CB' +
        FormatDateTime('DDMM', Date) + '01.REM';
      FContasReceberParam.SDlg_Remessa.Filter :=
        'Arquivo de Remessa Bradesco';
      FContasReceberParam.SDlg_Remessa.DefaultExt := '';
      FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, wstrS);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA Bradesco Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo REMESSA Bradesco não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaItau;
var
  mBrancos: string;
  x: Integer;
  mSequencial: Integer;
  mSEQ_REMESSA, wDesconto: Real;
  S: string;
  F: TextFile;
  wNumCC: string;
  //  mCodNossoNumero       : String;
begin
  wDesconto := 0;
  with DMContasReceber do
  begin
    try
      // REGISTRO HEADER ARQUIVO REMESSA ITAU

      mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_ITAU');

      mBrancos := '';
      for x := 1 to 294 do
      begin
        mBrancos := mBrancos + ' ';
      end;

      wNumCC :=
        RMaskCGC_CPF(Trim(DMContasReceber.QRemessaNUM_CONTA_CORRENTE.Text
        + DMContasReceber.QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text), //Add dv. Estava dando erro na geração da Remessa para a Provina. Vanessa 16/09/2014
        6);

      S := ''; // Inicia variavel.

      S := S + '01REMESSA01COBRANCA       ' +
        RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
        '00' +
        Copy(wNumCC, 1, 5) +
        Copy(wNumCC, 6, 1) +
        Bib.FormataTexto(' ', 8) +
        Bib.FormataTexto(RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Text)),
        30) +
        '341' +
        'BANCO ITAU SA  ' +
        Copy(DateToStr(Date), 1, 2) +
        Copy(DateToStr(Date), 4, 2) +
        Copy(DateToStr(Date), 9, 2) +
        mBrancos +
        '000001' + Chr(13) + Chr(10); // Sequencial do registro=0001


//------------- REGISTRO DETALHE ARQUIVO REMESSA -------------------------
      mSequencial := 2; { 1=Registro HEADER }
      while not QRemessa.Eof do
      begin
        if DMContasReceber.QRemessaperc_desconto_financeiro.value > 0 then
          wdesconto := ((dmcontasreceber.QRemessaVAL_TITULO.Value * DMContasReceber.QRemessaperc_desconto_financeiro.value) / 100)
        else
          wdesconto := 0;

        mBrancos := '';

        {1 e 3}S := S + '102' +
          RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14) +
          RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
          '00' +
          Copy(wNumCC, 1, 5) +
          Copy(wNumCC, 6, 1) +
          '    ' +
          {34-37}'0000' +
          Bib.FormataTexto(QRemessaNUM_TITULO.Text, 10) +
          Bib.FormataTexto(QRemessaCOD_CONTA_RECEBER_CAB.Text, 15) +
          {*no banco é definido como VC2 15 Nota 3}RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 8) +
          RMaskCGC_CPF('0', 13) +
          RMaskCGC_CPF(QRemessaCARTEIRA.Text, 3) +
          {*87-107    Uso do banco}Bib.FormataTexto(' ', 21) +
          RetornaCodCarteira(QRemessaCARTEIRA.Value) +
          '01' +
          {111-120 }Bib.FormataTexto(QRemessaNUM_TITULO.Text, 10) +
          Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          Copy(QRemessaDT_VENCIMENTO.Text, 9, 2) +
          intdecimais(QRemessaVAL_TITULO.Text, 13, 2) +
          '341' +
          '00000' +
          {148-149}'01'; //DUPLICATA MERCANTIL
        if QRemessaIND_ACEITE.Text = 'SIM' then
          S := S + 'A'
        else
          S := S + 'N';
        S := S + Copy(QRemessaDT_EMISSAO.Text, 1, 2) +
          Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
          Copy(QRemessaDT_EMISSAO.Text, 9, 2) +
          {157-158}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2) +
        {*159-160}'  ';
        {*161-173}if (Trim(QRemessaIND_TIPO_JURO.Text) = 'VALOR') then
          S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
          //S := S + IntDecimais(FloatToStr(QRemessaVAL_TITULO.Value *
          //  QRemessainstrucao_juro.Value / 100 / 30), 13, 2);
        else
          S := S + intdecimais(QRemessainstrucao_juro.Text,13,2);
        {*}S := S + '000000' +
        {*182-192}//'0000000000000' +
        {*182-192} StrZero(wDesconto,13,2) +   //não estava saindo o desconto no arquivo remessa - Vanessa 30/10/2015
        {*}'0000000000000' +
        {*}'0000000000000';
        {219-220}if QRemessaIND_FISICA_JURIDICA.Text = 'J' then
          S := S + '02'
        else
          S := S + '01';
        S := S + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaNOME.Text)), 30) +
          '          ';
        S := S +
          Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text)), 40);
        S := S +
          Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_BAIRRO.Text)),
          12);
        S := S + RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text)), 15) +
          Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_ESTADO_COBRANCA.Text)), 02);
        {352-381}S := S +
          Bib.FormataTexto(UpperCase(RemoveAcento(QRemessaDESC_AVALISTA1.Text)), 30) +
          '    ' +
          {*386-391}'000000' +
        {392-393}RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2) +
          ' ' +
          RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);

          mSequencial := mSequencial + 1;

        //---------------Registro Detalhe Multa-------------\\
        {001-001} s := s + '2'; {Identificacao do registro de transacao}
        {002-002} s := s + '2';                                         {código da multa|02|quando percentual é 2}
        {003-010} s := s +
          FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value); {data da multa|08|}
          //FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value + 1); {data da multa|08|}  Tirado a soma do dia conforme solicitado pela equipe do banco 27/05/2024\\
        {011-023} s := s + intdecimais(QRemessaPERC_JURO_MORA.Text,13,2);   {valor/percentual a ser aplicado|13|}
        {024-394} s := s + Bib.FormataTexto(' ', 371);                 {brancos}
        {395-400} s := s + RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);{sequencial registro arquivo|06|}
        //-------------FIM Registro Detalhe Multa-------------\\

        mSequencial := mSequencial + 1;

        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;

      end; // fim do while detalhe

      // -------------   Registro Trailler -------------- \\

      mBrancos := '';
      for x := 1 to 393 do
      begin
        mBrancos := mBrancos + ' '; // Usado anteriormente também.
      end;
      S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
      //Verificar mSequencial

    //------------------ Fim --------------------------\\

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA Itaú Gerado com Sucesso!',
          mtInformation,
          [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo REMESSA Itaú não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaHSBC;
var
  mTipoInscricao, mNUM_CEDENTE: string;
  mCodNossoNumero, mBrancos, S: string;
  x, mSequencial: Integer;
  mSEQ_REMESSA: Real;
  F: TextFile;
begin
  // Rotina para banco H.S.B.C  {CODIGO RANGER HSBC-59863}
  with DMContasReceber do
  begin
    try
      // REGISTRO HEADER ARQUIVO REMESSA

      mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_HSBC');

      mBrancos := '';
      for x := 1 to 277 do
      begin
        mBrancos := mBrancos + ' ';
      end;

      S := ''; // Inicia variavel.

      S := S + '01REMESSA01COBRANCA       0' +
        RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
        '55' +
        RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
        RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Value, 7) +
        '  ' +
        FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
        RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
        '399HSBC           ' +
        Copy(DateToStr(Date), 1, 2) +
        Copy(DateToStr(Date), 4, 2) +
        RMaskCGC_CPF(Copy(DateToStr(Date), 9, 2), 2) +
        '01600' +
        'BPI' +
        '  ' +
        'LANCV08' +
        mBrancos +
        '000001' + Chr(13) + Chr(10);

      // REGISTRO DETALHE ARQUIVO REMESSA

      mSequencial := 2; { 1=Registro HEADER }
      while not QRemessa.Eof do
      begin

        if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'F' then
          // Pessoa fisica
          mTipoInscricao := '01' // CPF
        else if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'J' then
          // Pessoa juridica
          mTipoInscricao := '02' // CNPJ
        else if Trim(QRemessaIND_FISICA_JURIDICA.Value) = '' then
          // Nada gravado.
          mTipoInscricao := '98' // Não tem
        else
          mTipoInscricao := '99'; // Outros

        // Isto é necessario para nosso numero com letras exemplo : X
        mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;
        while Pos(' ', mCodNossoNumero) > 0 do
          mCodNossoNumero[Pos(' ', mCodNossoNumero)] := '0';

        { Número da sequencia segundo layout DETALHE }
        S := S + '1' +
          mTipoInscricao +
          RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) + '0' + {19-22}
          RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) + '55' + //SERGIO ALTERADO ERA 97 {25-35}
          RMaskCGC_CPF(IntToStr(QRemessaCOD_AGENCIA.Value) +
          QRemessaNUM_CONTA_CORRENTE.Value, 11) + '  ' + {38-62} '*' +
          RMaskCGC_CPF(QRemessaCOD_CONTA_RECEBER_CAB.Text +
          QRemessaNUM_TITULO.Text, 24) + RMaskCGC_CPF(mCodNossoNumero, 11) +
          {74-79}'999999' +
          '00000000000' + //SERGIO ALTERADO ERA '        002'
          '999999' +
          '00000000000' + //SERGIO ALTERADO ERA '        002'
          '1' + // Cobrança simples
          '01' + // Remessa
        {111-120}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
          Copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          Copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          RMaskCGC_CPF(Copy(QRemessaDT_VENCIMENTO.Text, 9, 2), 2) +
          {128-139}StrZero(QRemessaVAL_TITULO.Value, 13, 2) + '399' + '00000'; {148-149}
        S := S + '98';
        S := S + 'N' + // N= Não aceito - aceito
          Copy(QRemessaDT_EMISSAO.Text, 1, 2) + Copy(QRemessaDT_EMISSAO.Text, 4, 2) +
          RMaskCGC_CPF(Copy(QRemessaDT_EMISSAO.Text, 9, 2), 2) +
          {157-158}RMaskCGC_CPF(QRemessaPRIMEIRA_INSTR_COD.Text, 2) + '00';
        {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
          S := S + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value
            / DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
            (QRemessaVal_Titulo.Value / 100)), 13, 2)
        else
          S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
        {174-179}S := S + '999999' +
          '0000000000000' + //SERGIO ALTERADO ERA '        002'
          '0000000000000' + //SERGIO ALTERADO ERA '        002'
          '0000000000000' + //SERGIO ALTERADO ERA '        002'
          mTipoInscricao +
          RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
          UpperCase(RemoveAcento(QRemessaNOME.Text))) +
          FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
          UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
          '  ' + // NÃO SEI O QUE VAI AQUI
          FormatMaskText('CCCCCCCCCCCC', Trim(QRemessaDESC_BAIRRO.Text)) +
          RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          FormatMaskText('CCCCCCCCCCCCCCC',
          UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
          FormatMaskText('CC', UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text))
          +
          '                                       ' +
          ' ' +
          '  ' +
          '9' + // Tipo de moeda 9=Real
          RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
        mSequencial := mSequencial + 1;
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end; // fim do while
      // -------------   Registro Trailler -------------- \\
      mBrancos := '';
      for x := 1 to 393 do
      begin
        mBrancos := mBrancos + ' '; // Usado anteriormente também.
      end;
      S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
      // +Chr(13)+Chr(10);

    //------------------ Fim --------------------------\\

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA-HSBC Gerado com Sucesso!',
          mtInformation,
          [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo REMESSA-HSBC não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaRural;
var
  mTipoInscricao, mNUM_CEDENTE: string;
  mCodNossoNumero, mBrancos, S: string;
  x, mSequencial: Integer;
  mSEQ_REMESSA: Real;
  F: TextFile;
begin
  // Rotina para banco Rural
  with DMContasReceber do
  begin
    try
      // REGISTRO HEADER ARQUIVO REMESSA

      mSEQ_REMESSA := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_BCO_RURAL');

      mBrancos := '';
      for x := 1 to 279 do
      begin
        mBrancos := mBrancos + ' ';
      end;

      S := ''; // Inicia variavel.
      S := S + '09REMESSA01COBRANCA       ' +
        RMaskCGC_CPF(FloatToStr(QRemessaCOD_AGENCIA.Value), 4) +
        RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Value, 10) +
        '      ' +
        FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
        RemoveAcento(UpperCase(QRemessaDESC_FILIAL.Value))) +
        '453RURAL                         ' +
        'CD0V01' +
        mBrancos +
        '000001' + Chr(13) + Chr(10);

      // REGISTRO DETALHE ARQUIVO REMESSA

      mSequencial := 2; { 1=Registro HEADER }
      while not QRemessa.Eof do
      begin

        if Trim(QRemessaIND_FISICA_JURIDICA.Value) = 'F' then
          // Pessoa fisica
          mTipoInscricao := '01' // CPF
        else
          mTipoInscricao := '02'; // CNPJ

        mCodNossoNumero := QRemessaCOD_NOSSO_NUMERO.Value;

        { Número da sequencia segundo layout DETALHE }
        S := S + '1' +
          '                ' +
          {04-17}RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text, 4) +
          RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.text, 10) +
          {32-33}'05' +
        {34-35}'00' +
        {36-37}'2' +
          '4' +
          {38-62}RMaskCGC_CPF(QRemessaCOD_CONTA_RECEBER_CAB.Text +
          QRemessaNUM_TITULO.Text, 25) +
          RMaskCGC_CPF(mCodNossoNumero, 8) +
          {71-80}RMaskCGC_CPF(QRemessaCOD_CONVENIO_CUSTODIA.Text, 10) +
        {81-82}'  ' +
          mTipoInscricao +
          RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14) +
          '         ' +
          '2' +
          '01' +
          {111-120}RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
        {121-126}formatDateTime('ddmmyy', QRemessaDT_VENCIMENTO.Value) +
        {127-139}StrZero(QRemessaVAL_TITULO.Value, 13, 2) +
          '0000000' +
          ' ' +
          '01A' +
          {151-156}formatDateTime('ddmmyy', QRemessaDT_EMISSAO.Value) +
        {157-160}'0000';
        {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
          S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
        else
          S := S + IntDecimais(QRemessainstrucao_juro.Text, 13, 2);
        {174-179}S := S + '      ' +
        {180-192}'0000000000000' +
        {193-205}'0000000000000' +
        {206-218}'0000000000000' +
        {206-218}mTipoInscricao +
          RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
          UpperCase(RemoveAcento(QRemessaNOME.Text))) +
          FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',
          UpperCase(RemoveAcento(QRemessaDESC_ENDERECO_COBRANCA.Text))) +
          '            ' + // NÃO SEI O QUE VAI AQUI
          RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          FormatMaskText('CCCCCCCCCCCCCCC',
          UpperCase(RemoveAcento(QRemessaDESC_CIDADE_COBRANCA.Text))) +
          FormatMaskText('CC', UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text))
          +
          '1' +
          '                                          ' +
          RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
        mSequencial := mSequencial + 1;
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        //--------- registro mensagem ----------------------\\
        mBrancos := '';
        for x := 1 to 193 do
        begin
          mBrancos := mBrancos + ' '; // Usado anteriormente também.
        end;
        S := S + '2' +
          'PROTESTAR NO 5 (QUINTO) DIA APOS O VENCIMENTO.    ' +
          '                                                  ' +
          '                                                  ' +
          '                                                  ' +
          mbrancos +
          RMaskCGC_CPF(IntToStr(mSequencial), 6) + Chr(13) + Chr(10);
        //--------- final registro mensagem ----------------------\\
        QRemessa.Next;
      end; // fim do while --final registro detalhe

      // -------------  Inicio Registro Trailler -------------- \\
      mBrancos := '';
      for x := 1 to 393 do
      begin
        mBrancos := mBrancos + ' '; // Usado anteriormente também.
      end;
      S := S + '9' + mBrancos + RMaskCGC_CPF(IntToStr(mSequencial), 6);
      // +Chr(13)+Chr(10);

    //------------------ Fim --------------------------\\

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA-RURAL Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo REMESSA-RURAL não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaSantander;
var
  mNUM_CEDENTE: string; // 2a Edition by Robson.
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x, iSeq: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  s, wVal: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo: string;
  iQtdRegLote: integer;
begin
  with DMContasReceber do
  begin
    try
      {-------HEADER DO ARQUIVO - REGISTRO 0-------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0000'; {004-007|04|LOTE DE SERVICO}
      s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
      s := s + '        '; {009-016|08|USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '2'; {017-017|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

      wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
      s := s + wVal; {018-032|15|N DE INSCRICAO DA EMPRESA}

      wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
      s := s + wVal; {033-036|04|AGENCIA MANTENEDORA DA CONTA}

      wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
      s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA AGENCIA}

      wVal :=
        RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCODIGO_CEDENTE.Text,
        9)), 9);
      s := s + wVal; {038-046|09|NUMERO DA CONTA CORRENTE}

      wVal := copy(QRemessaDIGITO_VERIFICADOR_CEDENTE.Text + '0', 1, 1);
      s := s + wVal; {047-047|01|DIGITO VERIFICADOR DA CONTA}

      s := s + '                         ';
      {048-072|25|PARA USO RESERVADO DO BANCO}

      wVal := copy(QRemessaDESC_FILIAL.Text +
        '                              ', 1, 30);
      s := s + wVal; {073-102|30|NOME DA EMPRESA}

      wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
        '                              ', 1, 30);
      s := s + wVal; {103-132|30|NOME DO BANCO}

      s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

      s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

      wVal :=
        DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
        '');
      s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

      s := s + '      '; {152-157|06|PARA USO RESERVADO DO BANCO}

      if QRemessaCOD_BANCO.Text = '347' then
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SUDAMERIS')), 6);
        s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
      end
      else if ((QRemessaCOD_BANCO.Text = '353') or (QRemessaCOD_BANCO.Text = '33')) then
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SANTANDER')), 6);
        s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
      end;

      s := s + '040'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

      s := s + '                    ';
      {167-240|74|PARA USO RESERVADO DO BANCO}
      s := s + '                    ';
      {167-240|74|PARA USO RESERVADO DO BANCO}
      s := s + '                    ';
      {167-240|74|PARA USO RESERVADO DO BANCO}
      s := s + '              '; {167-240|74|PARA USO RESERVADO DO BANCO}

      {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

      {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
      s := s + #13#10; {QUEBRA DE LINHA}

      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
      s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
      s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
      s := s + '01'; {010-011|02|TIPO DE SERVICO}
      s := s + '  '; {012-013|02|USO DO BANCO}

      if QRemessaCOD_BANCO.Text = '347' then
        s := s + '040' {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
      else
        s := s + '030'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
      s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

      wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
      s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

      s := s + '                    '; {--034-053|20|USO DO BANCO---}

      wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
      s := s + wVal; {054-057|04|AGENCIA MANTENEDORA DA CONTA}

      wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
      s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

      wVal :=
        RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCODIGO_CEDENTE.Text,
        9)), 9);
      s := s + wVal; {059-067|09|NUMERO DA CONTA CORRENTE}

      wVal := copy(QRemessaDIGITO_VERIFICADOR_CEDENTE.Text + '0', 1, 1);
      s := s + wVal; {068-068|01|DIGITO VERIFICADOR DA CONTA}

      s := s + '     '; {069-073|05|USO DO BANCO---}

      wVal := copy(QRemessaDESC_FILIAL.Text +
        '                              ', 1, 30);
      s := s + wVal; {074-103|30|NOME DA EMPRESA}

      wVal := '                                        ';
      s := s + wVal; {104-143|40|MENSAGEM 1}

      wVal := '                                        ';
      s := s + wVal; {144-183|40|MENSAGEM 2}

      if QRemessaCOD_BANCO.Text = '347' then
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SUDAMERIS')), 8);
        s := s + wVal; {184-191|08|NUMERO REMESSA RETORNO}
      end
      else if ((QRemessaCOD_BANCO.Text = '353') or (QRemessaCOD_BANCO.Text = '33')) then
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SANTANDER')), 8);
        s := s + wVal; {184-191|08|NUMERO REMESSA RETORNO}
      end;

      wVal :=
        DMOracle.BuscaNome('SELECT TO_CHAR(SYSDATE,''DDMMYYYY'') FROM DUAL',
        '');
      s := s + wVal; {192-199|08|DATA DE GRAVACAO REMESSA/RETORNO}

      wVal := '                                         ';
      s := s + wVal; {200-240|41|USO DO BANCO}
      {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

      iSeq := 1;
      iQtdRegLote := 2; //2--> header e trailer
      while not QRemessa.Eof do
      begin
        s := s + #13#10;
        {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}

        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
        s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

        wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
        s := s + wVal; {018-021|04|AGENCIA MANTENEDORA DA CONTA}

        wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
        s := s + wVal; {022-022|01|DIGITO VERIFICADOR DA AGENCIA}

        wVal :=
          RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,
          9)), 9);
        s := s + wVal; {023-031|09|NUMERO DA CONTA CORRENTE}

        wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + '0', 1,
          1);
        s := s + wVal; {032-032|01|DIGITO VERIFICADOR DA CONTA}

        wVal :=
          RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCOD_CONVENIO_CUSTODIA.Text, 10)), 10);
        s := s + wVal; {033-041|09|NUMERO DA CONTA CORRENTE}
        {042-042|01|DIGITO VERIFICADOR DA CONTA}

        s := s + '  '; {043-044|02|USO DO BANCO}

        wVal := RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 13);
        s := s + wVal; {045-057|13|NOSSO NUMERO}

        //s := s + '3'; {058-058|01|TIPO DE COBRANÇA}
        s := s + copy(QRemessaCARTEIRA.Text,1,1);  {058-058|01|TIPO DE COBRANÇA}

        wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
        s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

        wVal := '1';
        s := s + wVal;
        {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

        s := s + '  '; {061-062|02|USO DO BANCO}

        wVal := QRemessaNUM_TITULO.Text + '-' + QRemessaNUM_PARCELA.Text;
        wVal := copy(wVal + '000000000000000',1,15);
        s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}

        wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

        wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
        s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

        wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 4), 4);
        s := s + wVal; {101-104|04|AGENCIA MANTENEDORA DA CONTA}

        wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + '0', 1, 1);
        s := s + wVal; {105-105|01|DIGITO VERIFICADOR DA AGENCIA}

        s := s + ' '; {106-106|01|USO DO BANCO}

        s := s + '02'; {107-108|02|ESPECIE DO TITULO}

        wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
        s := s + wVal;
        {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

        wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
          copy(QRemessaDT_EMISSAO.Text, 4, 2) +
          copy(QRemessaDT_EMISSAO.Text, 7, 4);
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}

        //s := s + '1'; {118-118|01|CODIGO DE JUROS DE MORA (01 se for em reais)} //Junior 03/10/2023. Retorno da homologação, precisa ser 0.
        s := s + '1'; {118-118|01|CODIGO DE JUROS DE MORA (01- valor por dia 02-taxa mensal)}

        wVal := FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value);
        s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}

        wVal := intdecimais((QRemessainstrucao_juro.Text), 15, 2);
        //wVal := intdecimais(QRemessaPERC_TAXA.Text,15,2);
        s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

        s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
        s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
        s := s + '000000000000000';
        {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
        s := s + '000000000000000';
        {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
        s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

        wVal := RMaskCGC_CPF(QRemessaCOD_FILIAL.Text, 6);
        s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
        wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
        s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
        wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
        s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
        wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
        s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
        s := s + '0000'; {217-220|4|USO DA CEMAPA}

        wVal := copy(QRemessaCOD_PROTESTO.Text, 1, 1);
        s := s + wVal;
        {221-221|01|CODIGO PARA PROTESTO 0-NAO PROTESTA, 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3 (nao tem opção no sistema cemapa)-UTILIZAR PERFIL CEDENTE}

        wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
        s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}

        s := s + '2';
        {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}

        s := s + '000';
        {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
        s := s + '00'; {228-229|02|CODIGO DA MOEDA (REAL)}

        s := s + '           '; {230-240|11|USO EXCLUSIVO DO BANCO}

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;
        {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

        s := s + #13#10; {QUEBRA DE LINHA}
        {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}

        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
        s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}

        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
        if wVal = 'F' then
          wVal := '1'
        else if wVal = 'J' then
          wVal := '2'
        else
          wVal := '0';

        s := s + wVal; {018-018|01|TIPO DE INSCRICAO}

        wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
        s := s + wVal; {019-033|15|N DE INSCRICAO}

        wVal := copy(QRemessaNOME.Text +
          '                                        ', 1, 40);
        s := s + wVal; {034-073|40|NOME}

        wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
          '                                        ', 1, 40);
        s := s + wVal; {074-113|40|ENDERECO}

        wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
        s := s + wVal; {114-128|15|BAIRRO}

        wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          '     ', 1, 8);
        s := s + wVal; {129-136|08|CEP}

        // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
        // s := s + wVal;       {134-136|03|SUFIXO DO CEP}

        wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
          1, 15);
        s := s + wVal; {137-151|15|CIDADE}

        wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
        s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}


        {   COMENTADO PARA NAO GERAR DADOS DE AVALISTA - VERIFICADO COM A ASSISTENCIA SANTANDER EM 05-09-2019 - CLEBER}
        {   DESCOMENTADO PARA GERAR DADOS DE AVALISTA OU ZERADOS QND NÃO TIVER - VERIFICADO/VALIDADE COM O SANTANDER EM 20-04-2020 - VITOR}
//        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
//        if wVal = 'F' then 1 - cpf 2 - cnpj
//          wVal := '1'
//        else if wVal = 'J' then
//          wVal := '0';
        wVal := '2';

        s := s + wVal; {154-154|01|TIPO DE INSCRICAO }

        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
        if wval = 'F' then
          wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15)
        else
          wval := '000000000000000';
        s := s + wVal; {155-169|15|N DE INSCRICAO}

        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
        if wval = 'F' then
          wVal := copy(QRemessaDESC_FILIAL.Text +
          '                                        ', 1, 40)
        else
          wVal := '                                        ';
        s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}

        //56 ESPAÇOS EM SUBSTITUIÇÃO AOS DADOS DE AVALISTA - VERIFICADO COM ASSISTENCIA SANTANDER - 05-09-2019 - CLEBER
        //comentado linha abaixo para voltar novamente sem os espaços conforme validação feita para homologação da Metal Truck junto ao banco - 20-04-2020 - Vitor
       // s :=  s + '                                                        ';

        s := s + '000'; {210-212|03|IDENTIFICADOR DE CARNE}

        s := s + '000';
        {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}

        s := s + '000'; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}

        s := s + '000'; {219-221|03|NUMERO DO PLANO}

        s := s + '                   '; {222-240|19|USO DO BANCO}

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;
        {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

        s := s + #13#10; {QUEBRA DE LINHA}
        
        {-----------DETALHE SEGMENTO R /OBRIGATORIO/--------------}
        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}

        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
        s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'R';  {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' ';  {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}
        s := s + '0';  {018-018|01|CODIGO DO DESCONTO 2}
        s := s + '00000000'; {019-026|08|DATA DO DESCONTO}
        s := s + '000000000000000'; {027-041|15|02|VALOR PERCENTUAL A SER CONCEDIDO}
        s := s + Bib.FormataTexto(' ', 24); {042-065|24|RESERVADO BANCO - BRANCOS}
        S := S + '2';
        wVal := FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value);
        s := s + wVal; {119-126|08|DATA DA MULTA}

        wVal := intdecimais(QRemessaPERC_JURO_MORA.Text,15,2); //no banco é val_multa, mas na tela da conta corrente é informado o percentual. Vanessa 20/01/2016
        S := S + wVal;{075-089|15| - PERCENTUAL DA MULTA}
        S := S + Bib.FormataTexto(' ', 151); {090-240|141|}

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;
        {-----------FIM DETALHE SEGMENTO R /OBRIGATORIO/--------------}

        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end;

      QRemessa.First;

      s := s + #13#10;
      {------------TRAILER DE LOTE--------------------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0001'; {LOTE DE SERVICO}
      s := s + '5'; {REGISTRO TRAILER DE LOTE}
      s := s + '         '; {USO EXCLUSIVO DO BANCO}

      wVal := RMaskCGC_CPF(inttostr(iQtdRegLote), 6);
      s := s + wVal; {QUANTIDADE DE REGISTROS DO LOTE}

      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                 '; {USO EXCLUSIVO FEBRABAN/CNAB}

      {------------FIM - TRAILER DE LOTE--------------------}

      s := s + #13#10; {QUEBRA DE LINHA}
      {------------TRAILER DE ARQUIVO-----------------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {CODIGO DO BANCO NA COMPENSACAO}

      s := s + '9999'; {LOTE DE SERVICO}
      s := s + '9'; {REGISTRO TRAILER DE ARQUIVO}
      s := s + '         '; {USO EXCLUSIVO FEBRABAN}
      s := s + '000001'; {QUANTID. DE LOTES DO ARQUIV}

      wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
      s := s + wVal; {QTDADE DE REGISTROS DO ARQUIV}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '           '; {USO EXCLUSIVO FEBRABAN/CNAB}

      {------------TRAILER DE ARQUIVO-----------------}

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA CNAB240 Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end;
    except
      MessageDlg('Sem Movimento nesse Periodo', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaCaixa;
var
  mNUM_CEDENTE: string; // 2a Edition by Robson.
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x, iSeq: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  s, wVal, wNsa: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo: string;
  iQtdRegLote: integer;
  wTotal: Real;
begin
  with DMContasReceber do
  begin
    try
      {-------HEADER DO ARQUIVO - REGISTRO 0-------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0000'; {004-007|04|LOTE DE SERVICO}
      s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
      s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '2'; {018-018|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

      wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14);
      s := s + wVal; {019-032|14|N DE INSCRICAO DA EMPRESA}

      if QRemessaCOD_BANCO.Text = '104' then //CAIXA ECONOMICA FEDERAL
      begin
        wVal := RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text + QRemessaNUM_CONVENIO.Text +
          RMaskCGC_CPF(QRemessaCODIGO_CEDENTE.Text, 8) + QRemessaDIGITO_VERIFICADOR_CEDENTE.Text, 16);
        s := s + wVal; {033-048|16|N DE INSCRICAO DA EMPRESA}

        s := s + '    '; {049-052|04|uso exclusivo caixa}
      end
      else
      begin
        wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 20);
        s := s + wVal; {033-052|20|N DE INSCRICAO DA EMPRESA}
      end;

      wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
      s := s + wVal; {053-057|05|AGENCIA MANTENEDORA DA CONTA}

      wVal := RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text, 1);
      s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

      wVal :=
        RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCODIGO_CEDENTE.Text,
        12)), 12);
      s := s + wVal; {059-070|12|NUMERO DA CONTA CORRENTE}

      wVal := RMaskCGC_CPF(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1);
      s := s + wVal; {071-071|01|DIGITO VERIFICADOR DA CONTA}

      if QRemessaCOD_BANCO.Text = '748' then
        wVal := ' '
      else
        wVal := RMaskCGC_CPF(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1);
      s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

      wVal := copy(QRemessaDESC_FILIAL.Text +
        '                              ', 1, 30);
      s := s + wVal; {073-102|30|NOME DA EMPRESA}

      wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
        '                              ', 1, 30);
      s := s + wVal; {103-132|30|NOME DO BANCO}

      s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

      s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

      wVal := Bib.LimpaString(DateToStr(DMOracle.DataServ), '/' );
      s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

      wVal := FormatDateTime('HHMMSS', DMOracle.DataHoraServ);
      s := s + wVal; {152-157|06|HORA DE GERACAO DO ARQUIVO}

      if QRemessaCOD_BANCO.Text = '422' then
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SAFRA')), 6);
        s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
      end
      else if QRemessaCOD_BANCO.Text = '748' then
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SICREDI-V240')), 6);
        s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
      end
      else if QRemessaCOD_BANCO.Text = '104' then
      begin
        if DMParamSistema.QParamSistemaDESC_LAYOUT_CAIXA.Text = 'SICOB' then
        begin
          wVal :=
            RMaskCGC_CPF(IntToStr(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_CEF')), 6);
          s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          wNsa := wVal;
        end
        else
        begin
          wVal :=
            RMaskCGC_CPF(IntToStr(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
            'ARQ_REM_CEF_SIGCB')), 6);
          s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          wNsa := wVal;
        end;
      end
      else
      begin
        wVal :=
          RMaskCGC_CPF(INTTOSTR(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_UNIBANCO')), 6);
        s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
      end;

      if QRemessaCOD_BANCO.Text = '104' then
        s := s + '030' {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}
        //versao caixa
      else
        s := s + '080'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

      s := s + '00000'; {167-171|05|DENSIDADE DA GRAVAÇÃO DO ARQUIVO}

      s := s + '                    ';
      {172-240|69|PARA USO RESERVADO DO BANCO}
      s := s + '                    ';
      {172-240|69|PARA USO RESERVADO DO BANCO}
      s := s + '                    ';
      {172-240|69|PARA USO RESERVADO DO BANCO}
      s := s + '         '; {172-240|69|PARA USO RESERVADO DO BANCO}

      {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

      {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
      s := s + Chr(13) + Chr(10); {QUEBRA DE LINHA}

      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
      s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
      s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
      s := s + '01'; {010-011|02|TIPO DE SERVICO}

      if QRemessaCOD_BANCO.Text = '104' then
      begin
        s := s + '00'; {012-013|02|USO DO BANCO} //VERSAO CAIXA
        s := s + '020'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
      end
      else
      begin
        s := s + '  '; {012-013|02|USO DO BANCO}
        s := s + '040'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
      end;
      s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

      wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
      s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

      if QRemessaCOD_BANCO.Text = '104' then //CAIXA ECONOMICA FEDERAL
      begin
        // Alterado p/ Djeison 28/11/2013 - Trazia somente NUM_CONVENIO
        wVal := RMaskCGC_CPF(QRemessaCOD_AGENCIA.Text + QRemessaNUM_CONVENIO.Text +
          RMaskCGC_CPF(QRemessaCODIGO_CEDENTE.Text, 8) + QRemessaDIGITO_VERIFICADOR_CEDENTE.Text, 16);
        s := s + wVal; {034-049|16|N DE INSCRICAO DA EMPRESA}

        s := s + '    '; {050-053|04|uso exclusivo caixa}
      end
      else
      begin
        wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 20);
        s := s + wVal; {034-053|20|N DE INSCRICAO DA EMPRESA}
      end;

      wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
      s := s + wVal; {054-058|05|AGENCIA MANTENEDORA DA CONTA}

      wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + ' ', 1, 1);
      s := s + wVal; {059-059|01|DIGITO VERIFICADOR DA AGENCIA}

      wVal :=
        RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCODIGO_CEDENTE.Text,
        12)), 12);
      s := s + wVal; {060-071|12|NUMERO DA CONTA CORRENTE}

      wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ', 1, 1);
      s := s + wVal; {072-072|01|DIGITO VERIFICADOR DA CONTA}

      wVal := RMaskCGC_CPF(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1);
      s := s + wVal; {073-073|01|DIGITO VERIFICADOR DA CONTA E AGENCIA}

      wVal := copy(QRemessaDESC_FILIAL.Text +
        '                              ', 1, 30);
      s := s + wVal; {074-103|30|NOME DA EMPRESA}

      if QRemessaCOD_BANCO.Text = '104' then //CAIXA ECONOMICA FEDERAL
      begin
        wVal := Bib.FormataTexto(' ', 80);
        {104-183|80| USO DO BANCO}
        s := s + wVal;
        wVal := RMaskCGC_CPF(wNsa, 8);
        {184-191|08| NUMERO DA REMESSA}
        s := s + wVal;
        wVal := Bib.LimpaString(DateToStr(DMOracle.DataServ), '/' );
        {192-199|08| DATA GRAVACAO}
        s := s + wVal;
        wVal := RMaskCGC_CPF('', 8);
        {200-207|08| DATA CREDITO}
        s := s + wVal;
        wVal := Bib.FormataTexto(' ', 33);
        {208-240|33| USO DO BANCO}
        s := s + wVal;
      end
      else
      begin
        wVal := '                                        ' +
          '                                        ' +
          '                                        ' +
          '                 ';
        s := s + wVal; {104-240|137|USO DO BANCO}
      end;
      {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

      iSeq := 1;
      iQtdRegLote := 2; //2--> header e trailer
      while not QRemessa.Eof do
      begin
        s := s + Chr(13) + Chr(10);
        {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}

        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
        s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

        wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
        s := s + wVal; {018-022|05|AGENCIA MANTENEDORA DA CONTA}

        wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + ' ', 1, 1);
        s := s + wVal; {023-023|01|DIGITO VERIFICADOR DA AGENCIA}

        wVal :=
          RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaCODIGO_CEDENTE.Text,
          12)), 12);
        s := s + wVal; {024-035|12|CODIGO CEDENTE}

        wVal := copy(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ', 1,
          1);
        s := s + wVal; {036-036|01|DIGITO VERIFICADOR DA CONTA}

        wVal := '1';
        s := s + wVal; {037-037|01|DIGITO VERIFICADOR DA CONTA}

        if QRemessaCOD_BANCO.Text = '104' then
        begin
          s := s + '         ';
          wVal := Bib.LimpaString(QRemessaCOD_NOSSO_NUMERO.Text, '-');
          s := s + wVal; {038-057|20|NOSSO NUMERO}
        end
        else
        begin
          wVal := copy(QRemessaCOD_NOSSO_NUMERO.Text +
            '00000000000000000000', 1, 20);
          s := s + wVal; {038-057|20|NOSSO NUMERO}
        end;

        s := s + '1'; {058-058|01|TIPO DE COBRANÇA}

        wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
        s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

        wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text + '2', 1, 1);
        s := s + wVal;
        {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

        wVal := copy(QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO.Text + '0', 1, 1);
        s := s + wVal; {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}

        wVal := copy(QRemessaCOD_IDENTIF_DISTRIBUICAO.Text + ' ', 1, 1);
        s := s + wVal; {062-062|01|IDENTIFICAÇÃO DA DISTRIBUIÇÃO)}

        if QRemessaCOD_BANCO.Text = '104' then
        begin
          wVal := copy(QRemessaNUM_TITULO.Text + '           ', 1, 11);
          s := s + wVal; {063-073|15|NUMERO DO DOCUMENTO DE COBRANCA}
          S := s + '    ';
        end
        else
        begin
          wVal := copy(QRemessaNUM_TITULO.Text + '000000000000000', 1, 15);
          s := s + wVal; {063-077|15|NUMERO DO DOCUMENTO DE COBRANCA}
        end;

        wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

        wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
        s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

//        wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
        wVal := '00000';
        s := s + wVal; {101-105|05|AGENCIA MANTENEDORA DA CONTA}

        wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text + ' ', 1, 1);
        s := s + wVal; {106-106|01|DIGITO VERIFICADOR DA AGENCIA}

        s := s + '02'; {107-108|02|ESPECIE DO TITULO}

        wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
        s := s + wVal;
        {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

        wVal := copy(QRemessaDT_EMISSAO.Text, 1, 2) +
          copy(QRemessaDT_EMISSAO.Text, 4, 2) +
          copy(QRemessaDT_EMISSAO.Text, 7, 4);
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}

        s := s + '1'; {118-118|01|CODIGO DE JUROS DE MORA}

        wVal := copy(QRemessaDT_VENCIMENTO.Text, 1, 2) +
          copy(QRemessaDT_VENCIMENTO.Text, 4, 2) +
          copy(QRemessaDT_VENCIMENTO.Text, 7, 4);
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO- DATA MORA}

        if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
          //alterado Marcos 15/05/06
          wVal := IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
            DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
            (QRemessaVal_Titulo.Value / 100)), 15, 2)
        else
          wVal := StrZero(QRemessaPERC_TAXA.Value, 15, 2);

        s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

        s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
        s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
        s := s + '000000000000000';
        {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
        s := s + '000000000000000';
        {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
        s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

        wVal := copy('000000' + QRemessaCOD_FILIAL.Text, 1, 6);
        s := s + wVal; {196-201|06|CODIGO DA FILIAL-USO DA CEMAPA}
        wVal := RMaskCGC_CPF(QRemessaCOD_CADASTRO.Text, 6);
        s := s + wVal; {202-207|06|CODIGO CADASTRO - USO DA CEMAPA}
        wVal := RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3);
        s := s + wVal; {208-210|03|NUMERO DA PARCELA - USO DA CEMAPA}
        wVal := RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6);
        s := s + wVal; {211-216|06|NUMERO DO TITULO - USO DA CEMAPA}
        s := s + '0000'; {217-220|4|USO DA CEMAPA}

        wVal := copy(QRemessaCOD_PROTESTO.Text + '0', 1, 1);
        s := s + wVal;
        {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA}

        wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2);
        s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}

        s := s + '2';
        {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}{0-corrigido pelo banco do brasil}

        s := s + '000';
        {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
        s := s + '09'; {228-229|02|CODIGO DA MOEDA (REAL)}

        s := s + '           '; {230-240|11|USO EXCLUSIVO DO BANCO}

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;
        {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

        s := s + Chr(13) + Chr(10); {QUEBRA DE LINHA}
        {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}

        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
        s := s + wVal; {009_013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}

        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
        if wVal = 'F' then
          wVal := '1'
        else if wVal = 'J' then
          wVal := '2'
        else
          wVal := '0';

        s := s + wVal; {018-018|01|TIPO DE INSCRICAO}

        wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
        s := s + wVal; {019-033|15|N DE INSCRICAO}

        wVal := copy(QRemessaNOME.Text +
          '                                        ', 1, 40);
        s := s + wVal; {034-073|40|NOME}

        wVal := copy(QRemessaDESC_ENDERECO_COBRANCA.Text +
          '                                        ', 1, 40);
        s := s + wVal; {074-113|40|ENDERECO}

        wVal := copy(QRemessaDESC_BAIRRO.Text + '               ', 1, 15);
        s := s + wVal; {114-128|15|BAIRRO}

        wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          '     ', 1, 8);
        s := s + wVal; {129-136|08|CEP}

        // wVal := copy(copy(RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text,8),6,3) + '   ',1,3);
        // s := s + wVal;       {134-136|03|SUFIXO DO CEP}

        wVal := copy(QRemessaDESC_CIDADE_COBRANCA.Text + '               ',
          1, 15);
        s := s + wVal; {137-151|15|CIDADE}

        wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
        s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}

//        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
//        if wVal = 'F' then
//          wVal := '1'
//        else if wVal = 'J' then
//          wVal := '2'
//        else

        wVal := '0';
        s := s + wVal; {154-154|01|TIPO DE INSCRICAO}

//        wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
        wVal := RMaskCGC_CPF('', 15);
        s := s + wVal; {155-169|15|N DE INSCRICAO}

        wVal := '                                        ';
        s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}

        if QRemessaCOD_BANCO.Text = '104' then
        begin
          s := s + '            '; {210-221|012|CAIXA ECONOMICA}
          s := s + '                   '; {222-240|19|CAIXA ECONOMICA}
        end
        else
        begin
          s := s + '000'; {210-212|03|IDENTIFICADOR DE CARNE}
          s := s + '   ';
          {213-215|03|SEQUENCIAL DA PARCELA OU NUMERO INICIAL DA PARCELA}
          s := s + '   '; {216-218|03|QUANTIDADE TOTAL DE PARCELAS}
          s := s + '   '; {219-221|03|NUMERO DO PLANO}
          s := s + '                   '; {222-240|19|USO DO BANCO}
        end;

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;
        {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end;

      QRemessa.First;

      s := s + Chr(13) + Chr(10);
      {------------TRAILER DE LOTE--------------------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0001'; {004-007|04|LOTE DE SERVICO}
      s := s + '5'; {008-008|01|REGISTRO TRAILER DE LOTE}
      s := s + Bib.FormataTexto(' ', 9); {009-017|09|USO EXCLUSIVO DO BANCO}

      wVal := RMaskCGC_CPF(IntToStr(iQtdRegLote), 6);
      s := s + wVal; {018-023|06|QUANTIDADE DE REGISTROS DO LOTE}
      s := s + RMaskCGC_CPF(IntToStr(QRemessa.RecordCount), 6);
        {024-029|06|QUANTIDADE DE TITULOS EM COBRANCA}

      wTotal := 0;
      while not QRemessa.Eof do
      begin
        wTotal := wTotal + QRemessaVAL_TITULO.Value;
        QRemessa.Next;
      end;
      s := s + RMaskCGC_CPF(FloatToStr(wTotal), 17);
      {030-046|17|VALOR TOTAL BOLETOS}

      s := s + RMaskCGC_CPF('', 23);
      {047-069|23|FEBRABAN}

      s := s + RMaskCGC_CPF('', 46);
      {070-115|23|COBRANCA CAUCIONADA E DESCONTADA}

      s := s + Bib.FormataTexto(' ', 125);

      {------------FIM - TRAILER DE LOTE--------------------}

      s := s + Chr(13) + Chr(10); {QUEBRA DE LINHA}
      {------------TRAILER DE ARQUIVO-----------------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}

      s := s + '9999'; {004-007|04|LOTE DE SERVICO}
      s := s + '9'; {008-008|01|REGISTRO TRAILER DE ARQUIVO}
      s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN}
      s := s + '000001'; {018-023|06|QUANTID. DE LOTES DO ARQUIV}

      wVal := RMaskCGC_CPF(inttostr(iQtdRegLote + 2), 6);
      s := s + wVal; {024-029|06|QTDADE DE REGISTROS DO ARQUIV}
      s := s + '000000'; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '                    '; {USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '     '; {USO EXCLUSIVO FEBRABAN/CNAB}

      {------------TRAILER DE ARQUIVO-----------------}

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA CNAB240 VERSÃO 080 Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end;
    except
      MessageDlg('Sem Movimento nesse Periodo', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.RetornoRemessa1Click(Sender: TObject);
{
    Procedimento criado para centralizar chamadas da Retorno de Remessa de
    Bancos. - Djeison A. S. - 29/07/2013
}
var
  wCodBanco : integer;
begin
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOK then
  begin
    wCodBanco := StrToInt(DMOracle.BuscaNome('SELECT COD_BANCO FROM TB_BANCO_AGENCIA',
      'COD_BANCO_AGENCIA = ' + DMBancoAgencia.QContaCorrenteConsCOD_BANCO_AGENCIA.Text));

    DMContasReceber.CdRetornoRemessa.Close;
    DMContasReceber.CdRetornoRemessa.Open;

    if (wCodBanco = 001) then
      if DMParamSistema.QParamSistemaIND_SICOOB_BB.Text = 'S' then
        RetornoRemessaBBSicoob
      else
        RetornoRemessaBB
    else if (wCodBanco = 748) then
      RetornoRemessaSicredi
    else if (wCodBanco = 237) then  // Bradesco
      RetornoRemessaBradesco
    else if (wCodBanco = 756) then  // Sicoob
      RetornoRemessaSicoob
    else if (wCodBanco = 099) then  // Uniprime
      RetornoRemessaUniprime
    else if (wCodBanco = 341) then
      RetornoRemessaItau
    else if (wCodBanco = 399) then
      RetornoRemessaHSBC
    else if (wCodBanco = 453) then
      RetornoRemessaRural
    else if (wCodBanco = 033) then // Santander
      RetornoRemessaSantander
    else if (wCodBanco = 133) then // Cresol
      RetornoRemessaCresol
    else if (wCodBanco = 409) or   //  UNIBANCO
            (wCodBanco = 422) or   //  SAFRA
            ((wCodBanco = 104) and
             (DMParamSistema.QParamSistemaDESC_LAYOUT_CAIXA.Text = 'SICOB')) then //  CAIXA SICOB
      RetornoRemessaCaixa
    else if ((wCodBanco = 104) and
             (DMParamSistema.QParamSistemaDESC_LAYOUT_CAIXA.Text = 'SIGCB')) then
      RetornoRemessaCaixaSigcb
  end;

  // Relatório unificado para retornos
  if not DMContasReceber.CdRetornoRemessa.IsEmpty then
    GeraRelatorioRetorno;
end;

procedure TFContasReceberCad.RetornoRemessaSicredi;
var
  wCont: integer;
  F: TextFile;
  S: string;
  wErro1, wErro2, wErro3, wErro4, wErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  wErro1 := '';
  wErro2 := '';
  wErro3 := '';
  wErro4 := '';
  wErro5 := '';
  // Abre arquivo de retorno SICREDI
  OpenDialog1.Filter := 'Arquivo de Retorno Bansicredi';
  OpenDialog1.FilterIndex := 0;
  OpenDialog1.DefaultExt := '*.CRT';
  OpenDialog1.FileName := '*.CRT';

  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 15) <> 'BANSICREDI     ' then
      raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-SICREDI}

    Readln(F, S); //Le a proxima linha do arquivo
    while (Trim(S) <> '') do // Arquivo contém registro para processar.
    begin
      if Copy(Trim(S), 1, 1) = '1' then //registro detalhe
      begin
        // Condições possiveis para executar baixa do titulo.
        if StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17] then
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;

          wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' + Copy(S, 115, 02);

          if Trim(Copy(S, 335, 02)) = '' then //Pgto por QRCode não gera dt de crédito. Pegar data de ocorrência. Junior 10/07/2025
            wDtCredito := wDtLiquida
          else
            wDtCredito := Copy(S, 335, 02) + '/' + Copy(S, 333, 02) + '/' + Copy(S, 331, 02);

          wNNumero := Copy(S, 48, 9); // Nosso numero
          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
            wVal_Baixa := (StrToFloat(Copy(S, 254, 13)) / 100)
          else
            raise exception.Create('Titulo com valor p/baixar igual a zero!');

          if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100 +
              (StrToFloat(Copy(S, 280, 13)) / 100);
            wpgto_juro := (StrToFloat(Copy(S, 267, 13)) / 100) +
              (StrToFloat(Copy(S, 280, 13)) / 100);
          end;

          if (StrToFloat(Copy(S, 241, 13)) <> 0) or (StrToFloat(Copy(S, 228, 13)) <> 0) then // Desconto concedido
            wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
              StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

            BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
              wNNumero, wDtLiquida, wDtCredito);
            //Chama procedimento para baixa de titulo.
        end;

        wErro1 := '';
        wErro2 := '';
        wErro3 := '';
        wErro4 := '';
        wErro5 := '';

        if (strtoint(copy(Trim(S), 109,2)) in [02,03,06,09,10,12,13,14,15,17,19,20,23,24,27,28,29,30,32,33,34,35]) then  //if ocorrencias then
        begin
          if Copy(Trim(S), 319, 2) <> '' then
            wErro1 := RetornoErroSicredi(Copy(Trim(S), 109, 2), Copy(Trim(S), 319, 2));   //passa a ocorrencia e o motivo
          if (Copy(Trim(S), 321, 2) <> '  ') and (Copy(Trim(S), 321, 2) <> '00') then
            wErro2 := RetornoErroSicredi(Copy(Trim(S), 109, 2),Copy(Trim(S), 321, 2));
          if (Copy(Trim(S), 323, 2) <> '  ') and (Copy(Trim(S), 323, 2) <> '00') then
            wErro3 := RetornoErroSicredi(Copy(Trim(S), 109, 2),Copy(Trim(S), 323, 2));
          if (Copy(Trim(S), 325, 2) <> '  ') and (Copy(Trim(S), 325, 2) <> '00') then
            wErro4 := RetornoErroSicredi(Copy(Trim(S), 109, 2),Copy(Trim(S), 325, 2));
          if (Copy(Trim(S), 327, 2) <> '  ') and (Copy(Trim(S), 327, 2) <> '00') then
            wErro5 := RetornoErroSicredi(Copy(Trim(S), 109, 2),Copy(Trim(S), 327, 2));
        end;
        // Inicia impressao dos erros \\
        With DMContasReceber do
          begin
            if wErro1 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 48, 15);
              CdRetornoRemessaDESC_CLIENTE.Text := Copy(S, 20, 05);
              CdRetornoRemessaDESC_REGISTRO.Text := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 319, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro1;
              CdRetornoRemessa.Post;
            end;
            if wErro2 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 48, 15);
              CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 20, 05);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 321, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro2;
              CdRetornoRemessa.Post;
            end;
            if wErro3 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 48, 15);
              CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 20, 05);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 323, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro3;
              CdRetornoRemessa.Post;
            end;
            if wErro4 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 48, 15);
              CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 20, 05);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 325, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro4;
              CdRetornoRemessa.Post;
            end;
            if wErro5 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 48, 15);
              CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 20, 05);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 327, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro5;
              CdRetornoRemessa.Post;
            end;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaBB;
var
  wCont, i: integer;
  x, wRECUSA: string;
  F: TextFile;
  S: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;

begin
  // Abre arquivo de retorno 643
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }
    Readln(F, S); {Le a proxima linha do arquivo }

    //  DMOracle.DBCemapa.StartTransaction;

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros
    i := 0;
                                 // '1' = layout convenio 6 posicoes  '7' = layout convenio 7 posicoes
    while (Trim(S) <> ' ') and ((Trim(Copy(S, 1, 1)) = '1') or (Trim(Copy(S, 1, 1)) = '7')) do // Caso seja um registro em branco finaliza nao entrar.
    begin
      {Verifica se a linha inteira ou o comando estão diferentes de brancos.}
      if (Trim(S) <> '') and (Copy(S, 109, 2) <> '  ') then
      begin
        x := Copy(S, 109, 2); // Pega COMANDO-24
        If Trim(Copy(S, 1, 1)) = '1' Then
           wNNumero := Copy(S, 63, 12)
        Else
           wNNumero := Copy(S, 64, 17);
        if (StrToFloat(x) <> 3) and (wNNumero <> '') then
          // Comando não recusado.
        begin
          if StrToInt(x) in [5, 6, 7, 8, 9, 10, 15, 23, 96, 97] then  // 96 E 97 É SOMENTE PARA LANCAR A DESPESA DO PROTESTO EM JUROS NO TITULO (CÉSAR 25/09/2014)
          begin                                                      // 09 e 10 somente observação no titulo
            wVal_Juro := 0;                                          // 23 é baixa solicitada pela empresa (realizar baixa pelo arquivo)
            wVal_Desc := 0;
            wVal_Baixa := 0;
            wpgto_juro := 0;

            wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
              Copy(S, 115, 02);
            wDtCredito := Copy(S, 176, 02) + '/' + Copy(S, 178, 02) + '/' +
              Copy(S, 180, 02);
//            wNNumero := Copy(S, 63, 12);
            // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
            If Trim(Copy(S, 1, 1)) = '1' Then  // diferencia retorno de convenio 6 digitos do convenio 7 digitos
               wNum_Titulo := Trim(copy(S, 47, 6))
            Else
               wNum_Titulo := Trim(copy(S, 48, 6));
            //numero do titulo no sistema cemapa
          // Verifica se valor para baixar é diferente de zero.
            if not(StrToInt(x) in [09, 10, 23, 96, 97]) then  // 96 E 97 É SOMENTE PARA LANCAR A DESPESA DO PROTESTO EM JUROS NO TITULO (CÉSAR 25/09/2014)
              if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
                wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
              else
                raise exception.Create('Título com valor a baixar igual a zero!');

            if StrToInt(x) = 10 Then  // para tipo baixa 10 é solicitação feita pelo cliente - não vem o valor da baixa por isso pega o valor do titulo
             Begin
               wVal_Baixa := StrToFloat(Copy(S, 153, 13)) / 100;
               wDtCredito := wDtLiquida;
             End;

            if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
            begin
              wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
              wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
            end;

            if StrToFloat(Copy(S, 280, 13)) <> 0 then // Outros Recebimentos
            begin
              wVal_Juro := wVal_Juro + StrToFloat(Copy(S, 280, 13)) / 100;
              //wpgto_juro := wVal_Juro + StrToFloat(Copy(S, 280, 13)) / 100;
              wpgto_juro := wVal_Juro;
            end;

            if (StrToFloat(Copy(S, 241, 13)) <> 0) or (StrToFloat(Copy(S, 228,
              13)) <> 0) then // Desconto concedido
              wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
                StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

            if StrToInt(x) in [09, 23, 96, 97] then  // 96 E 97 É SOMENTE PARA LANCAR A DESPESA DO PROTESTO EM JUROS NO TITULO (CÉSAR 25/09/2014)
             Begin
               wVal_Juro := StrToFloat(Copy(S, 189, 13)) / 100;
               AtualizaTituloRetorno(wVal_Juro,wNNumero, wDtLiquida, StrToInt(x) );
             End
            Else
               BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro, wNNumero, wDtLiquida, wDtCredito);
            // Chama procedimento para baixa de titulo.
          end;
        end;
      end
      else if Copy(S, 63, 11) = '' then // Nosso numero esta em branco.
      begin
        x := '100'
      end;
      If Trim(Copy(S, 1, 1)) = '1' Then
        case StrToInt(x) of
          1: wRECUSA := 'Identificação inválida';
          2: wRECUSA := 'Variação da carteira inválida';
          3: wRECUSA := 'Valor de juros por um dia';
          4: wRECUSA := 'Valor de desconto inválido';
          5: wRECUSA := 'Espécie de título inválida para carteira/variação';
          6: wRECUSA := 'Espécie de valor variável inválido';
          7: wRECUSA := 'Prefixo da agência usuária inválido';
          8: wRECUSA := 'Valor do título/apólice inválido';
          9: wRECUSA := 'Data de vencimento inválida';
          10: wRECUSA := 'Fora do prazo(só admissível na carteira 11)';
          11: wRECUSA := 'Inexistência de margem para desconto';
          12: wRECUSA := 'O Banco não tem agência na praça do sacado';
          13: wRECUSA := 'Razões cadastrais';
          14: wRECUSA :=
            'Sacado interligado com o sacador(só admissível em cobrança simples-cart.11 e 17)';
          15: wRECUSA :=
            'Título sacado contra órgão do Poder Público(só admissível na cart.11 e sem ordem de protesto)';
          16: wRECUSA := 'Títulos preenchidos de forma irregular';
          17: wRECUSA := 'Título rasurado';
          18: wRECUSA := 'Endereço do sacado não localizado ou incompleto';
          19: wRECUSA := 'Código do cedente inválido';
          20: wRECUSA := 'Nome/endereço do cliente não informado(ECT)';
          21: wRECUSA := 'Carteira inválida';
          22: wRECUSA := 'Quantidade de valor variável inválida';
          23: wRECUSA := 'Faixa nosso número execedida';
          24: wRECUSA := 'Valor do abatimento inválido';
          25: wRECUSA := 'Novo número do título dado pelo cedente';
          26: wRECUSA := 'Valor do IOF de seguro invalido';
          27: wRECUSA := 'Nome do sacado/cedente inválido ou não informado';
          28: wRECUSA := 'Data do novo vencimento inválida';
          29: wRECUSA := 'Endereço não informado';
          30: wRECUSA := 'Registro de título já liquidado(carteira 17 tipo 4)';
          31: wRECUSA := 'Número de borderô inválido';
          32: wRECUSA := 'Nome da pessoa autorizada inválido';
          33: wRECUSA := 'Nosso número já existe';
          34: wRECUSA := 'Número da prestação do contrato inválido';
          35: wRECUSA := 'Percentual de desconto inválido';
          36: wRECUSA := 'Dias para fichamento de protesto invalido';
          37: wRECUSA := 'Data de emissão do titulo inválido';
          38: wRECUSA :=
            'Data do vencimento anterior à data da emissão do título';
          39: wRECUSA := 'Comando de alteração indevido para carteira';
          40: wRECUSA := 'Tipo de moeda inválida';
          41: wRECUSA := 'Abatimento não permitido';
          42: wRECUSA := 'CEP do sacado inválido';
          43: wRECUSA :=
            'Código de unidade variável incompatível com a data de emissão do título';
          44: wRECUSA := 'Dados para débito ao sacado inválidos';
          45: wRECUSA := 'Carteira/variação encerrada';
          46: wRECUSA := 'Convênio encerrado';
          47: wRECUSA := 'Título tem valor diverso do informado';
          48: wRECUSA := 'Motivo de baixa inválido para carteira';
          49: wRECUSA := 'Abatimento a cancelar não consta do título';
          50: wRECUSA := 'Comando incompatível com a carteira';
          51: wRECUSA := 'Código do convenente inválido';
          52: wRECUSA := 'Abatimento igual ou maior que o valor do título';
          53: wRECUSA := 'Título já se encontra na situação pretendida';
          54: wRECUSA := 'Título fora do prazo admitido para a conta 1';
          55: wRECUSA := 'Novo vencimento fora dos limites da carteira';
          56: wRECUSA := 'Título não pertence ao convenente';
          57: wRECUSA := 'Variação incompatível com a carteira';
          58: wRECUSA := 'Impossível a transferência para carteira indicada';
          59: wRECUSA := 'Título vencido em transferência para a carteira 51';
          60: wRECUSA :=
            'Título com prazo superior a 179 dias em transferência para cart.51';
          61: wRECUSA := 'Título já foi fichado para protesto';
          62: wRECUSA :=
            'Alteração da situação de débito inválida para o código de responsabilidade';
          63: wRECUSA := 'DV do nosso número inválido';
          64: wRECUSA := 'Título não passível de débito/baixa-situação anormal';
          65: wRECUSA :=
            'Título com ordem de não protestar-não pode ser encaminhado à cartório';
          80: wRECUSA := 'Nosso número inválido';
          81: wRECUSA := 'Data para concessão de desconto inválida';
          82: wRECUSA := 'CEP do sacado inválido';
          83: wRECUSA := 'Carteira/variação não localizada no cedente';
          84: wRECUSA := 'Título não localizado na existência';
          99: wRECUSA := 'Outros motivos';
          100: wRECUSA := 'Número do convênio retornou em branco';
        end
      Else
        case StrToInt(x) of
          2:   wRECUSA := 'Entrada de Título';
          3:   wRECUSA := 'Recusa de Título';
          5:   wRECUSA := 'Liquidado sem registro';
          6:   wRECUSA := 'Liquidação Normal';
          7:   wRECUSA := 'Liquidação por Conta';
          8:   wRECUSA := 'Liquidação por Saldo';
          9:   wRECUSA := 'Baixa de Titulo';
          10:  wRECUSA := 'Baixa Solicitada';
          12:  wRECUSA := 'Abatimento Concedido';
          13:  wRECUSA := 'Abatimento Cancelado';
          14:  wRECUSA := 'Alteração de Vencimento do título';
          15:  wRECUSA := 'Liquidação em Cartório';
          16:  wRECUSA := 'Confirmação de alteração de juros de mora';
          19:  wRECUSA := 'Confirmação de recebimento de instruções para protesto';
          20:  wRECUSA := 'Debito em Conta';
          21:  wRECUSA := 'Alteração do Nome do Sacado';
          22:  wRECUSA := 'Alteração do Endereço do Sacado';
          23:  wRECUSA := 'Indicação de encaminhamento a cartório';
          24:  wRECUSA := 'Sustar Protesto';
          25:  wRECUSA := 'Dispensar Juros de mora';
          26:  wRECUSA := 'Alteração do número do título dado pelo Cedente (Seu número)';
          28:  wRECUSA := 'Manutenção de titulo vencido';
          31:  wRECUSA := 'Conceder desconto';
          32:  wRECUSA := 'Não conceder desconto';
          33:  wRECUSA := 'Retificar desconto';
          34:  wRECUSA := 'Alterar data para desconto';
          35:  wRECUSA := 'Cobrar Multa';
          36:  wRECUSA := 'Dispensar Multa';
          37:  wRECUSA := 'Dispensar Indexador';
          38:  wRECUSA := 'Dispensar prazo limite para recebimento';
          39:  wRECUSA := 'Alterar prazo limite para recebimento';
          41:  wRECUSA := 'Alteração do número do controle do participante';
          42:  wRECUSA := 'Alteração do número do documento do sacado';
          44:  wRECUSA := 'Título pago com cheque devolvido';
          46:  wRECUSA := 'Título pago com cheque, aguardando compensação';
          72:  wRECUSA := 'Alteracao de tipo de Cobrança';
          96:  wRECUSA := 'Despesas de Protesto';
          97:  wRECUSA := 'Despesas de Sustação de Protesto';
          98:  wRECUSA := 'Debito de Custas Antecipadas';
        End;
      With DMContasReceber do
      begin
        CdRetornoRemessa.Append;
        // Alterado para trazer Nosso Numero, ao invés do Num. Titulo
//        CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
        CdRetornoRemessaDESC_TITULO.Value := Copy(S, 64, 17);
//        CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 23, 08);
        CdRetornoRemessaDESC_CLIENTE.Value :=
          DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
           'CR.COD_NOSSO_NUMERO LIKE ' + Copy(S, 64, 17) +
           ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
        CdRetornoRemessaDESC_REGISTRO.Value := IntToStr(i);
        CdRetornoRemessaDESC_RECUSA.Value := x;
        CdRetornoRemessaDESC_MENSAGEM.Value := wRECUSA;
        CdRetornoRemessa.Post;
      end;

      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

//    if FRRetornoRemessaBB = nil then
//      FRRetornoRemessaBB := TFRRetornoRemessaBB.Create(Application);
//    FRRetornoRemessaBB.QRPrimario.Preview;
//
//    DMContasReceber.CdRetornoRemessa.Close;
//  Comentadas linhas acima, chamada para procedimento que gera relatório - Djeison - 15/10/2013
//    GeraRelatorioRetorno;

    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaBradesco;
var
  wCont, wCont1: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  // Abre arquivo de retorno BRADESCO
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont1 := 0;
    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 10, 2) <> '01' then //alterado por marcos 14/11/06
      raise exception.Create('Retorno Inválido!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 8) <> 'BRADESCO' then
      raise exception.Create('Nome do banco inválido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-BRADESCO}
//    if Imp = nil then
//      Imp := TImp.Create;
//    Imp.AbreImpressora;
//    Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

    Readln(F, S); //Le a proxima linha do arquivo
    // Arquivo contém registro para processar.
    while ((Trim(S) <> '') and (Copy(Trim(S), 1, 1) <> '9')) do
    begin
      // Condições possiveis para executar baixa do titulo.
      if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) or
        ((StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20)) then // Pagina 36
      begin
        wVal_Juro := 0;
        wVal_Desc := 0;
        wVal_Baixa := 0;
        wpgto_juro := 0;
        wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
          Copy(S, 115, 02);
        wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
          Copy(S, 300, 02);
        wNNumero := Copy(S, 135, 12); // Numero do titulo no banco
        wNum_Titulo := Trim(Copy(S, 117, 10)); //
        // Verifica se valor para baixar é diferente de zero.
        if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
          wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
        else
          ShowMessage('Titulo ' + Copy(S, 117, 10) +
            ' com valor p/baixar igual a zero!');

        if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
        begin
          wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
          wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
        end;

        if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
          wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 + StrToFloat(Copy(S,
            228, 13)) / 100; // Valor do abatimento

        BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
          wNNumero, wDtLiquida, wDtCredito);
        // Chama procedimento para baixa de titulo.
        inc(wCont1);
      end;
      // Erros
      wstrErro1 := '';
      wstrErro2 := '';
      wstrErro3 := '';
      wstrErro4 := '';
      wstrErro5 := '';
      if Copy(Trim(S), 109, 2) = '02' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := 'ENTRADA CONFIRMADA';
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;
      if Copy(Trim(S), 109, 2) = '03' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '24' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '27' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '30' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '32' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) then // baixa normal do titulo
        wstrErro1 := 'BAIXA DE TITULO';
      if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20) then
        wstrErro1 := 'BAIXA DE TITULO - DESCONTADO';
      if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 16) then
        wstrErro1 := 'TITULO BAIXADO PELO BANCO DECURSO DE PRAZO';



      with DMContasReceber do
      begin
        if wstrErro1 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 319, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro1;
          CdRetornoRemessa.Post;
        end;
        if wstrErro2 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 321, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro2;
          CdRetornoRemessa.Post;
        end;
        if wstrErro3 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 323, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro3;
          CdRetornoRemessa.Post;
        end;
        if wstrErro4 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 325, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro4;
          CdRetornoRemessa.Post;
        end;
        if wstrErro5 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 327, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro5;
          CdRetornoRemessa.Post;
        end;
      end;


//      // Inicia impressao dos erros \\
//
//      if wCont = 1 then
//      begin
//        Imp.WriteXY(4.5, wCont,
//          'R E L A T O R I O   D E   E R R O S  - BRADESCO  - RETORNO    -    Data: ' +
//          DateTimeToStr(Now));
//        wCont := wCont + 2;
//        Inc(wCont);
//        Imp.WriteXY(0, wCont,
//          'Titulo     Num. Registro    Cod.Recusa    Mensagem');
//        Inc(WCont);
//        Imp.WriteXY(0, wCont,
//          '--------------------------------------------------------------------------------------------------------------------');
//        Inc(WCont);
//      end;
//      if wstrErro1 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 319, 2) +
//          '       ' + wstrErro1);
//        Inc(WCont);
//      end;
//      if wstrErro2 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 321, 2) +
//          '       ' + wstrErro2);
//        Inc(WCont);
//      end;
//      if wstrErro3 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 323, 2) +
//          '       ' + wstrErro3);
//        Inc(WCont);
//      end;
//      if wstrErro4 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 325, 2) +
//          '       ' + wstrErro4);
//        Inc(WCont);
//      end;
//      if wstrErro5 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 327, 2) +
//          '       ' + wstrErro5);
//        Inc(WCont);
//      end;
//      if wCont >= 66 then
//      begin
//        Imp.SaltaPagina;
//        wCont := 1;
//      end;

      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

//    if imp <> nil then
//      // É necessario pois caso não tenha impressão ocorre erro.
//    begin
//      Imp.SaltaPagina;
//      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
//    end;
//    showMessage('Baixado ' + IntToStr(wCont1) + 'Títulos');
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaUniprime;
var
  wCont, wCont1: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  // Abre arquivo de retorno UNIPRIME
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont1 := 0;
    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 10, 2) <> '01' then //alterado por marcos 14/11/06
      raise exception.Create('Retorno Inválido!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 8) <> 'UNIPRIME' then
      raise exception.Create('Nome do banco inválido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-BRADESCO}
//    if Imp = nil then
//      Imp := TImp.Create;
//    Imp.AbreImpressora;
//    Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);

    Readln(F, S); //Le a proxima linha do arquivo
    // Arquivo contém registro para processar.
    while ((Trim(S) <> '') and (Copy(Trim(S), 1, 1) <> '9')) do
    begin
      // Condições possiveis para executar baixa do titulo.
      if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) or
        ((StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20)) then // Pagina 36
      begin
        wVal_Juro := 0;
        wVal_Desc := 0;
        wVal_Baixa := 0;
        wpgto_juro := 0;
        wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
          Copy(S, 115, 02);
        wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
          Copy(S, 300, 02);
        wNNumero := Copy(S, 135, 12); // Numero do titulo no banco
        wNum_Titulo := Trim(Copy(S, 117, 10)); //
        // Verifica se valor para baixar é diferente de zero.
        if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
          wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
        else
          ShowMessage('Titulo ' + Copy(S, 117, 10) +
            ' com valor p/baixar igual a zero!');

        if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
        begin
          wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
          wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
        end;

        if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
          wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 + StrToFloat(Copy(S,
            228, 13)) / 100; // Valor do abatimento

        BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
          wNNumero, wDtLiquida, wDtCredito);
        // Chama procedimento para baixa de titulo.
        inc(wCont1);
      end;
      // Erros
      wstrErro1 := '';
      wstrErro2 := '';
      wstrErro3 := '';
      wstrErro4 := '';
      wstrErro5 := '';
      if Copy(Trim(S), 109, 2) = '02' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := 'ENTRADA CONFIRMADA';
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;
      if Copy(Trim(S), 109, 2) = '03' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '24' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '27' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '30' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if Copy(Trim(S), 109, 2) = '32' then // Houve recusa do registro enviado.
      begin
        wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
        wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
        wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
        wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
        wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
      end;

      if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) then // baixa normal do titulo
        wstrErro1 := 'BAIXA DE TITULO';
      if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20) then
        wstrErro1 := 'BAIXA DE TITULO - DESCONTADO';
      if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 16) then
        wstrErro1 := 'TITULO BAIXADO PELO BANCO DECURSO DE PRAZO';



      with DMContasReceber do
      begin
        if wstrErro1 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 319, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro1;
          CdRetornoRemessa.Post;
        end;
        if wstrErro2 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 321, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro2;
          CdRetornoRemessa.Post;
        end;
        if wstrErro3 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 323, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro3;
          CdRetornoRemessa.Post;
        end;
        if wstrErro4 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 325, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro4;
          CdRetornoRemessa.Post;
        end;
        if wstrErro5 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value := Copy(S, 135, 12);
//          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
          CdRetornoRemessaDESC_CLIENTE.Value :=
            DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO CAD, TB_CONTA_RECEBER_CAB CR',
             'CR.COD_NOSSO_NUMERO LIKE ' + QuotedStr('%'+Copy(S, 135, 12)+'%') +
             ' AND CR.COD_CADASTRO = CAD.COD_CADASTRO');
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 327, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro5;
          CdRetornoRemessa.Post;
        end;
      end;


//      // Inicia impressao dos erros \\
//
//      if wCont = 1 then
//      begin
//        Imp.WriteXY(4.5, wCont,
//          'R E L A T O R I O   D E   E R R O S  - BRADESCO  - RETORNO    -    Data: ' +
//          DateTimeToStr(Now));
//        wCont := wCont + 2;
//        Inc(wCont);
//        Imp.WriteXY(0, wCont,
//          'Titulo     Num. Registro    Cod.Recusa    Mensagem');
//        Inc(WCont);
//        Imp.WriteXY(0, wCont,
//          '--------------------------------------------------------------------------------------------------------------------');
//        Inc(WCont);
//      end;
//      if wstrErro1 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 319, 2) +
//          '       ' + wstrErro1);
//        Inc(WCont);
//      end;
//      if wstrErro2 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 321, 2) +
//          '       ' + wstrErro2);
//        Inc(WCont);
//      end;
//      if wstrErro3 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 323, 2) +
//          '       ' + wstrErro3);
//        Inc(WCont);
//      end;
//      if wstrErro4 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 325, 2) +
//          '       ' + wstrErro4);
//        Inc(WCont);
//      end;
//      if wstrErro5 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 117, 10) + '    ' + Copy(S, 395, 6) +
//          '          ' + Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 327, 2) +
//          '       ' + wstrErro5);
//        Inc(WCont);
//      end;
//      if wCont >= 66 then
//      begin
//        Imp.SaltaPagina;
//        wCont := 1;
//      end;

      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

//    if imp <> nil then
//      // É necessario pois caso não tenha impressão ocorre erro.
//    begin
//      Imp.SaltaPagina;
//      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
//    end;
//    showMessage('Baixado ' + IntToStr(wCont1) + 'Títulos');
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaHSBC;
var
  wCont, wCont1, i: integer;
  x, wRECUSA: string;
  F: TextFile;
  S: string;
begin
  // Abre arquivo de retorno 643
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }
    wCont1 := 0;
    wCont := 1; // Inicializa valor para salto de linha-relatório de erros
    i := 0;

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 10, 2) <> '01' then //alterado por marcos 14/11/06
      raise exception.Create('Retorno Inválido!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 4) <> 'HSBC' then
      raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-HSBC}

    Readln(F, S); //Le a proxima linha do arquivo
    while (Trim(S) <> ' ') and (Trim(Copy(S, 1, 1)) = '1') do
      // Arquivo contém registro para processar.
    begin
      x := '100'; // Inicializa valor para número do erro/recusa.

      if StrToInt(Copy(Trim(S), 109, 2)) in [06, 07, 15, 16, 32, 33] then
        // Ver tabela explicativa NOTA 13
      begin
        BaixaTituloHSBC(S); // Chama procedimento para baixa de titulo.
        inc(wCont1);
      end
      else if Copy(Trim(S), 109, 2) = '03' then
        // Houve recusa do registro enviado.
      begin
        x := Copy(Trim(S), 302, 2);

        case StrToInt(x) of
          1: wRECUSA := 'Valor de desconto não informado';
          2: wRECUSA :=
            'Inexistëncia de agëncia do HSBC na praça do sacado informado';
          3: wRECUSA := 'CEP do sacado incorreto ou inválido';
          4: wRECUSA := 'Cadastro do cedente não aceita banco correspondente';
          5: wRECUSA := 'Tipo de moeda inválido';
          6: wRECUSA := 'Prazo de protesto indefinido/inválido';
          7: wRECUSA := 'Data do vencimento inválida';
          8: wRECUSA :=
            'Nosso número(Número bancário) utilizado não possui vinculação com a conta cobrança';
          9: wRECUSA := 'Taxa mensal de mora acima do permitido (170% ao mës).';
          10: wRECUSA := 'Taxa de multa acima do permitido (10% ao mës)';
          11: wRECUSA := 'Data limite do desconto inválida';
          12: wRECUSA :=
            'Código da agëncia depositaria do HSBC informado é inválido.';
          13: wRECUSA := 'Taxa de multa inválida';
          14: wRECUSA := 'Valor diário da multa não informado.)';
          15: wRECUSA :=
            'Quantidade de dias após vencimento para incidëncia da multa não informada.';
          16: wRECUSA := 'Outras irregularidades.';
          17: wRECUSA := 'Data de ínicio da multa inválida.';
          18: wRECUSA :=
            'Nosso número (número bancario) já existe para outro título.';
          19: wRECUSA := 'Valor do título inválido';
          20: wRECUSA := 'Ausëncia do nome do sacado';
          21: wRECUSA := 'Título sem borderö';
          22: wRECUSA := 'Número da conta do cedente não cadastrado.';
          23: wRECUSA :=
            'Instrução não permitida para título em garantia de operação.';
          24: wRECUSA :=
            'Condição de desconto não permitida para titulo em garantia de operação.';
          25: wRECUSA := 'Utilizada mais de uma instrução de multa.';
          26: wRECUSA := 'Ausëncia do endereço do sacado.';
          27: wRECUSA := 'Ausëncia do CEP do sacado.';
          28: wRECUSA :=
            'Ausëncia do CPF/CNPJ do sacado em título com instrução de protesto.';
          29: wRECUSA := 'Agëncia cedente informada inválida.';
          30: wRECUSA := 'Número da conta do cedente inválida.';
          31: wRECUSA := 'Contrato garantia não cadastrado/inválido.';
          32: wRECUSA := 'Tipo de carteira inválido.';
          33: wRECUSA :=
            'Conta corrente do cedente não compativel com orgão do contratante.';
          34: wRECUSA := 'Faixa de aplicação não cadastrada/ínválida.';
          36: wRECUSA := 'Data de emissão do titulo inválido';
          37: wRECUSA :=
            'Valor dos títulos acima de R$ 5.000.000,00(Cinco milhões de reais).';
          38: wRECUSA := 'Data de desconto menor que data de emissão.';
          39: wRECUSA := 'Espécie inválida.';
          40: wRECUSA := 'Auséncia no nome do sacador avalista.';
          41: wRECUSA := 'Data de ínicio de multa menor que data de emissão.';
          42: wRECUSA := 'Quantidade de moeda variavel inválida.';
          43: wRECUSA := 'Controle de participante inválido.';
          44: wRECUSA :=
            'Nosso número (número bancário) duplicado no mesmo movimento.';
          50: wRECUSA :=
            'Título baixado em ../../...(Vide data nas posições 111 a 116).';
          51: wRECUSA := 'Data de emissão da ocorrëncia inválida.';
          52: wRECUSA := 'Nosso número (número bancário) duplicado.';
          53: wRECUSA := 'Código de ocorrëncia comandada inválido.';
          54: wRECUSA :=
            'Valor do desconto concedido inválido.(Víde valor nas posições 228 a 240).';
          55: wRECUSA := 'Data de prorrogação de vencimento não informada.';
          56: wRECUSA := 'Outras irregularidades.';
          57: wRECUSA :=
            'Instrução não permitida para título em garantia de operações.';
          58: wRECUSA :=
            'Nosso número (número bancário) comando na instr/ocorr não possui vinculação com a conta cobrança.';
          59: wRECUSA :=
            'Nosso número (número bancário) comandado na baixa não possui vinculação com a conta cobrança.';
          60: wRECUSA :=
            'Valor do desconto igual ou maior que o valor do título.';
          61: wRECUSA :=
            'Título com valor em moeda variável não possui não permite condição de desconto.';
          62: wRECUSA :=
            'Data do desconto informada não coincide com o registro do título.';
          63: wRECUSA := 'Título não possui condição de desconto diário';
          64: wRECUSA :=
            'Título baixado em ../../...(Vide data nas posições 111 a 116).';
          65: wRECUSA :=
            'Título devolvido em ../../...(Vide data nas posições 111 a 116).';
          66: wRECUSA := 'Valor do título não confere com o registrado.';
          67: wRECUSA := 'Nosso número (Número bancário) não informado.';
          68: wRECUSA := 'Nosso número (Número bancário) não inválido.';
          69: wRECUSA :=
            'Concessão de abatimento não é permitida para moeda diferente de Real.';
          70: wRECUSA :=
            'Valor do abatimento concedido inválido.(Víde valor nas posições 111 a 116).';
          71: wRECUSA := 'Cancelamento comandado sobre título sem abatimento.';
          72: wRECUSA :=
            'Concessão de desconto não é permitida para moeda diferente de real.';
          73: wRECUSA := 'Valor do desconto não informado.';
          74: wRECUSA := 'Cancelamento comandado sobre título sem desconto';
          75: wRECUSA :=
            'Data de vencimento alterado inválida.(Víde data nas posições 111 a 116).';
          76: wRECUSA := 'Data de prorrogação de vencimento inválida.';
          77: wRECUSA := 'Data de instrução inválida.';
          78: wRECUSA := 'Protesto comandado em duplicidade no mesmo dia.';
          79: wRECUSA := 'Título não possui instrução de protesto.';
          80: wRECUSA := 'Título não possui condição de desconto.';
          81: wRECUSA := 'Título não possui instrução de abatimento.';
          82: wRECUSA := 'Valor de juros inválido.';
          83: wRECUSA := 'Nosso número (Número bancário) inexistente.';
          84: wRECUSA := 'Baixa/Liquidação por orgão não autorizado.';
          85: wRECUSA := 'Instrução de protesto recusada/inválida.';
          86: wRECUSA := 'Instrução não permitida para banco correspondente.';
          87: wRECUSA := 'Valor de instrução inválida.';
          88: wRECUSA := 'Instrução inválida para tipo de carteira.';
          89: wRECUSA :=
            'Valor do desconto informado não coincide com o registro do título.';
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;

        if wCont = 1 then
        begin
          Imp.WriteXY(6.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - HSBC  -RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(1, wCont,
            'Titulo     Cliente   Nº Registro    Cmd. de Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(1, wCont,
            '----------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        Imp.WriteXY(5, wCont, Copy(S, 117, 10) + ' ' + Copy(S, 23, 08) + ' ' +
          IntToStr(i) + '                   ' + x + '           ' + wRECUSA);
        Inc(WCont);
        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
    begin
      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
    end;
    ShowMessage('Baixado ' + IntToStr(wCont1) + 'Títulos');
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaItau;
var
  wCont, wCont1: integer;
  F: TextFile;
  S: string;
  Erro1, Erro2, Erro3, Erro4: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  // Abre arquivo de retorno ITAU
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont1 := 0;
    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 15) <> 'BANCO ITAU S.A.' then
      raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-ITAU}

    Readln(F, S); //Le a proxima linha do arquivo
    while (Trim(S) <> '') do // Arquivo contém registro para processar.
    begin
      // Condições possiveis para executar baixa do titulo.
      if Copy(Trim(S), 1, 1) = '1' then //identificacao de registro transacao
      begin
        if StrToInt(Copy(Trim(S), 109, 2)) in [6, 8, 10] then
          // ???? Ver tabela explicativa NOTA 17
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;

          wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
            Copy(S, 115, 02);
          wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
            Copy(S, 300, 02);
          wNNumero := Copy(S, 127, 8);
          // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
          wNum_Titulo := Trim(Copy(S, 38, 6));
          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 254, 13)) <> 0 then
            // Valor recebido + valor despesa de cobranca
            wVal_Baixa := (StrToFloat(Copy(S, 254, 13)) / 100) +
              (StrToFloat(Copy(S, 176, 13)) / 100)
          else
            raise exception.Create('Titulo com valor p/baixar igual a zero!');

          if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
            wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
          end;

          if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
            wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
              StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito);
          // Chama procedimento para baixa de titulo.
          inc(wCont1);
        end;

        IF Copy(Trim(S), 109, 2) <> '' THEN
          Erro1 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 378, 2))
          ELSE IF ((Copy(Trim(S), 380, 2)) <> '') THEN
            Erro2 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 380, 2))
          ELSE IF Copy(Trim(S), 382, 2) <> '' THEN
            Erro3 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 382, 2))
          ELSE IF Copy(Trim(S), 384, 2) <> '' THEN
            Erro4 := RetornaErroItau(Copy(Trim(S), 109, 2), Copy(Trim(S), 384, 2));

        With DMContasReceber do
        begin
          if Erro1 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 9);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 325, 30);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 378, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := Erro1;
            CdRetornoRemessa.Post;
          end;
          if Erro2 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 9);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 325, 30);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 380, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := Erro2;
            CdRetornoRemessa.Post;
          end;
          if Erro3 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 9);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 325, 30);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 382, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := Erro3;
            CdRetornoRemessa.Post;
          end;
          if Erro4 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 9);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 325, 30);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 395, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2) + '-' + Copy(Trim(S), 384, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := Erro4;
            CdRetornoRemessa.Post;
          end;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaRural;
var
  wCont, i: integer;
  x, wRECUSA, wErro: string;
  F: TextFile;
  S: string;
begin
  // Abre arquivo de retorno 643
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros
    i := 0;

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 9) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 15) <> 'RURAL' then
      raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-BANCO RURAL}

    Readln(F, S); //Le a proxima linha do arquivo
    S := Trim(S);
    while (S <> '') do // Arquivo contém registro para processar.
    begin
      x := '100'; // Inicializa valor para número do erro/recusa.

      // Condições possiveis para executar baixa do titulo.
      if StrToInt(copy(S, 109, 2)) <> 3 then // Ver tabela explicativa NOTA 13
        BaixaTituloRURAL(S);
      // Chama procedimento para baixa de titulo BANCO RURAL

      if Copy(S, 109, 2) = '03' then // Houve recusa do registro enviado.
      begin

        //---bloco de montagem da string que contem os erros
        x := Copy(S, 334, 61); //copia lista erros no reg. de entrada de remessa
        wErro := '';
        for i := 1 to 61 do //indenfica erro pela posicao
        begin
          if copy(x, i, 1) <> '0' then
            if StrToInt(x) < 10 then
              wErro := wErro + '0' + IntToStr(i)
            else
              wErro := wErro + IntToStr(i);
        end;
        //---fim do bloco de montagem da string que contem os erros
        i := 1;
        while (i <= length(wErro) / 2) do
        begin
          case StrToInt(copy(wErro, i, 2)) of
            1: wRECUSA := wRECUSA + 'CÓDIGO MOEDA INVÁLIDO' + chr(13) + chr(10);
            2: wRECUSA := wRECUSA + 'CÓDIGO MOEDA INVÁLIDO PARA SEGURO - REAIS'
              + chr(13) + chr(10);
            3: wRECUSA := wRECUSA + 'CÓDIGO MOEDA / MORA INCONSISTENTES' +
              chr(13) + chr(10);
            4: wRECUSA := wRECUSA + 'VALOR EM REAIS - MORA EM MOEDA' + chr(13) +
              chr(10);
            5: wRECUSA := wRECUSA + 'PROIBIDO PROTESTAR - TÍTULO NÃO VENCIDO' +
              chr(13) + chr(10);
            6: wRECUSA := wRECUSA + 'ESPÉCIE DOCUMENTO INVÁLIDA' + chr(13) +
              chr(10);
            7: wRECUSA := wRECUSA + 'ESPÉCIE DOCUMENTO INEXISTENTE' + chr(13) +
              chr(10);
            8: wRECUSA := wRECUSA + 'TIPO DE OPERAÇÃO INV. P/ SEGUROS C/ IOS' +
              chr(13) + chr(10);
            9: wRECUSA := wRECUSA + 'TIPO DE OPERAÇÃO INEXISTENTE' + chr(13) +
              chr(10);
            10: wRECUSA := wRECUSA + 'CONTRATO PROIBIDO PARA ESTA CARTEIRA' +
              chr(13) + chr(10);
            11: wRECUSA := wRECUSA + 'FALTA NÚMERO DO CONTRATO' + chr(13) +
              chr(10);
            12: wRECUSA := wRECUSA + 'PROIBIDO INFORMAR TIPO DE CONTA' + chr(13)
              + chr(10);
            13: wRECUSA := wRECUSA + 'TIPO DE CONTA DO CONTRATO INEXISTENTE' +
              chr(13) + chr(10);
            14: wRECUSA := wRECUSA + 'DÍGITO DO CONTRATO NÃO CONFERE' + chr(13)
              + chr(10);
            15: wRECUSA := wRECUSA + 'CONTRATO INEXISTENTE' + chr(13) + chr(10);
            16: wRECUSA := wRECUSA + 'DATA DA EMISSÃO INVÁLIDA' + chr(13) +
              chr(10);
            17: wRECUSA := wRECUSA + 'VALOR DO TÍTULO INVÁLIDO' + chr(13) +
              chr(10);
            18: wRECUSA := wRECUSA + 'DATA VENCIMENTO INVÁLIDA' + chr(13) +
              chr(10);
            19: wRECUSA := wRECUSA + 'DATA DE VENCIMENTO ANTERIOR À EMISSÃO' +
              chr(13) + chr(10);
            20: wRECUSA := wRECUSA + 'FALTA VENCIMENTO DESCONTO' + chr(13) +
              chr(10);
            21: wRECUSA := wRECUSA + 'DATA VENCIMENTO DESCONTO INVÁLIDA' +
              chr(13) + chr(10);
            22: wRECUSA := wRECUSA + 'DATA DESCONTO POSTERIOR AO VENCIMENTO' +
              chr(13) + chr(10);
            23: wRECUSA := wRECUSA + 'FALTA VALOR DESCONTO' + chr(13) + chr(10);
            24: wRECUSA := wRECUSA;
            25: wRECUSA := wRECUSA + 'BANCO/AGÊNCIA COBRADOR INEXISTENTE' +
              chr(13) + chr(10);
            26: wRECUSA := wRECUSA;
            27: wRECUSA := wRECUSA + 'VALOR/TAXA DE MORA MUITO ALTO' + chr(13) +
              chr(10);
            28: wRECUSA := wRECUSA + 'FALTA CEP, BANCO E AGÊNCIA COBRADOR' +
              chr(13) + chr(10);
            29: wRECUSA := wRECUSA + 'FALTA NOME DO SACADO' + chr(13) + chr(10);
            30: wRECUSA := wRECUSA + 'FALTA ENDEREÇO' + chr(13) + chr(10);
            31: wRECUSA := wRECUSA + 'FALTA CIDADE' + chr(13) + chr(10);
            32: wRECUSA := wRECUSA + 'FALTA ESTADO' + chr(13) + chr(10);
            33: wRECUSA := wRECUSA + 'ESTADO INVÁLIDO' + chr(13) + chr(10);
            34: wRECUSA := wRECUSA + 'FALTA CPF/CGC DO SACADO' + chr(13) +
              chr(10);
            35: wRECUSA := wRECUSA + 'FALTA NUMERAÇÃO - BLOQUETE CLIENTE' +
              chr(13) + chr(10);
            36: wRECUSA := wRECUSA + 'TÍTULO PRÉ-NUMERADO JÁ EXISTENTE' + chr(13)
              + chr(10);
            37: wRECUSA := wRECUSA + 'DÍGITO NOSSO NÚMERO NÃO CONFERE' + chr(13)
              + chr(10);
            38: wRECUSA := wRECUSA + 'SERVIÇO INVÁLIDO' + chr(13) + chr(10);
            39: wRECUSA := wRECUSA + 'REGISTRO 2 - MENSAGEM INVÁLIDO OU INEXIST.'
              + chr(13) + chr(10);
            40: wRECUSA := wRECUSA + 'DÍGITO DO CLIENTE /CONTRATO COM ERRO' +
              chr(13) + chr(10);
            41: wRECUSA := wRECUSA;
            42: wRECUSA := wRECUSA + 'TÍTULO INEXISTENTE' + chr(13) + chr(10);
            43: wRECUSA := wRECUSA + 'TÍTULO LIQUIDADO' + chr(13) + chr(10);
            44: wRECUSA := wRECUSA + 'TÍTULO NÃO PODE SER BAIXADO' + chr(13) +
              chr(10);
            45: wRECUSA := wRECUSA + 'VALOR NOMINAL INCORRETO' + chr(13) +
              chr(10);
            46: wRECUSA := wRECUSA;
            47: wRECUSA := wRECUSA + 'FALTA TIPO DE CONTA DO CONTRATO' + chr(13)
              + chr(10);
            48: wRECUSA := wRECUSA + 'CPF/CNPJ DO SACADOR COM ERRO' + chr(13) +
              chr(10);
            49: wRECUSA := wRECUSA +
              'CPF/CNPJ DO SACADOR IGUAL CPF/CNPJ DO CEDENTE' + chr(13) +
                chr(10);
            50: wRECUSA := wRECUSA +
              'CPF/CNPJ DO SACADOR IGUAL CPF/CNPJ DO SACADO' + chr(13) +
                chr(10);
            51: wRECUSA := wRECUSA;
            52: wRECUSA := wRECUSA + 'VALOR ABATIMENTO INVÁLIDO' + chr(13) +
              chr(10);
            53: wRECUSA := wRECUSA;
            54: wRECUSA := wRECUSA;
            55: wRECUSA := wRECUSA + 'FALTA TIPO DE PESSOA PARA ALTERAR CGC/CPF'
              + chr(13) + chr(10);
            56: wRECUSA := wRECUSA + 'CPF/CNPJ DO SACADO COM ERRO' + chr(13) +
              chr(10);
            57: wRECUSA := wRECUSA;
            58: wRECUSA := wRECUSA;
            59: wRECUSA := wRECUSA + 'ACEITE INVÁLIDO PARA ESPÉCIE DOCUMENTO' +
              chr(13) + chr(10);
            60: wRECUSA := wRECUSA + 'ALTERAÇÃO PRAZO PROTESTO INVÁLIDO' +
              chr(13) + chr(10);
            61: wRECUSA := wRECUSA + 'DEPOSITÁRIA NÃO CADASTRADA' + chr(13) +
              chr(10);
          end;
          i := i + 2;
        end;

        // Inicia impressao dos erros \\
        if Imp = nil then
          Imp := TImp.Create;
        Imp.AbreImpressora;

        if wCont = 1 then
        begin
          Imp.WriteXY(6.5, wCont,
            'R E L A T O R I O   D E   E R R O S  - BANCO RURAL  -RETORNO    -    Data: ' +
            DateTimeToStr(Now));
          wCont := wCont + 2;
          Inc(wCont);
          Imp.WriteXY(1, wCont,
            'Titulo     Cliente   Nº Registro    Cmd. de Recusa    Mensagem');
          Inc(WCont);
          Imp.WriteXY(1, wCont,
            '----------------------------------------------------------------------------------------------------------');
          Inc(WCont);
        end;
        Imp.WriteXY(5, wCont, Copy(S, 117, 10) + ' ' + Copy(S, 23, 08) + ' ' +
          IntToStr(i) + '                   ' + x + '           ' + wRECUSA);
        Inc(WCont);
        if wCont >= 66 then
        begin
          Imp.SaltaPagina;
          wCont := 1;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while

    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
    begin
      Imp.SaltaPagina;
      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
    end;
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaSantander;
var
  wCont, wNum_Baixa : integer;
  F: TextFile;
  S: string;
  wErro1, wErro2, wErro3, wErro4, wErro5 : string;
  wVal_Juro, wVal_Desc, wPgto_Juro, wVal_Baixa : Real;
  wDtLiquida, wDtCredito, wNNumero : string;
begin
  inherited;
  wVal_Baixa := 0;
  wVal_Juro := 0;
  wVal_Desc := 0;
  wPgto_Juro := 0;
  wNum_Baixa := 0;
  wErro1 := '';
  wErro2 := '';

  // Abre arquivo de retorno CNAB 240
  if OpenDialog1.Execute then {Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    if Copy(Trim(S), 8, 1) <> '0' then
      raise exception.Create('Registro Header inválido');
    if Copy(Trim(S), 103, 15) <> 'BANCO SANTANDER' then
      raise exception.Create('Nome do banco inválido');
    if Copy(Trim(S), 143, 1) <> '2' then
      raise exception.Create('Não é um arquivo de RETORNO');

    Readln(F, S); //Le a proxima linha do arquivo
    Readln(F, S); //Le a proxima linha do arquivo

    // Arquivo contém registro para processar.
    while (((Copy(Trim(S), 14, 1) = 'T') and (Copy(Trim(S), 8, 1) = '3')) or
           ((Copy(Trim(S), 14, 1) = 'U') and (Copy(Trim(S), 8, 1) = '3'))) do
    begin
      if (StrToInt(Copy(Trim(S), 16, 2)) in [6,15,17]) then //03,26,30 é alguma rejeição
        begin
          wVal_Baixa := 0;
          wVal_Juro  := 0;
          wVal_Desc  := 0;
          wpgto_juro := 0;
          wNNumero    := Copy(S, 41, 13);
          wNum_Titulo := Trim(copy(S, 116, 6));
          if StrToFloat(Copy(S, 78, 15)) <> 0 then // Verifica se valor para baixar é diferente de zero.
          begin
            wVal_Baixa := strtofloat(trim(Copy(S,  78, 15)))/100; //val titulo
            wVal_Juro  := strtoint  (trim(Copy(S, 194, 15)))/100; //despesas
          end
          else
            Showmessage('Título com NN ' + wNNumero + ' zerado');

      if (StrToInt(Copy(Trim(S), 16, 2)) in [02,04,05,06,09,11,12,13,14,17,19,20,23,24,25,27,28,29,51,52,53]) then
      begin
        if (Copy(Trim(S), 16, 2) <> '') or (Copy(Trim(S), 209, 2) <> '00') then
          wErro1 := RetornoErroBanco(Copy(Trim(S), 16, 2), Copy(Trim(S), 209, 2))
        else
          wErro1 := '';
      end;

      With DMContasReceber do
      begin
        if wErro1 <> '' then
        begin
          CdRetornoRemessa.Append;
          CdRetornoRemessaDESC_TITULO.Value :=  Copy(S, 41, 13);
          CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 144, 40);
          CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 16, 2);
          CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 209, 2) + Copy(Trim(S), 211, 2) + Copy(Trim(S), 213, 2) + Copy(Trim(S), 215, 2) + Copy(Trim(S), 217, 2);
          CdRetornoRemessaDESC_MENSAGEM.Value := wErro1;
          CdRetornoRemessa.Post;
        end;
        wErro1 := '';
      end;

      Readln(F, S); //Le a proxima linha do arquivo - aqui vai para a linha U (juros multa essas coisas)

      wDtLiquida := Copy(S, 138, 02) + '/' + Copy(S, 140, 02) + '/' + Copy(S, 142, 04);
      wDtCredito := Copy(S, 146, 02) + '/' + Copy(S, 148, 02) + '/' + Copy(S, 150, 04);

      if StrToFloat(Copy(S, 18, 15)) <> 0 then  // Juros de mora/multa/encargos
      begin
        wVal_Juro  := wVal_Juro + StrToFloat(Copy(S, 18, 15)) / 100;
      end;

      if StrToFloat(Copy(S, 33, 15)) <> 0 then // Desconto concedido
        wVal_Desc := StrToFloat(Copy(S, 33, 15)) / 100 +
                     StrToFloat(Copy(S, 48, 15)) / 100; // Valor do abatimento

        BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
        wNNumero, wDtLiquida, wDtCredito); // Chama procedimento para baixa de titulo.
          inc(wNum_Baixa);

  end; //fim baixa titulo
    ReadLn(F, S); // Pula para proximo registro no arquivo texto.
   end;//fim do while
    CloseFile(F); // Fecha arquivo aberto.
  end;// Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.RetornoRemessaCaixa;
var
  wCont: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero, wCodMov: string;
begin
  wVal_Baixa := 0;
  wVal_Desc := 0;
  wPgto_Juro := 0;
  wVal_Juro := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 8, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 143, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    //if Copy(Trim(S),3,7) <> 'RETORNO' then  // Verifica se realmente é um arquivo de retorno.
      //raise exception.Create('Não é um arquivo de RETORNO!');
    //if Copy(Trim(S),12,15) <> 'COBRANCA       ' then
      //raise exception.Create('Não é um arquivo de COBRANÇA!');
    if (Copy(Trim(S), 103, 14) <> 'BANCO UNIBANCO') And
       (Copy(Trim(S), 103, 23) <> 'CAIXA ECONOMICA FEDERAL') then
       Raise exception.Create('Nome do banco invalido!');

    {Acima está sendo verificado se o registro HEADER é
     realmente um arquivo de retorno-SANTANDER}

    Readln(F, S); //Le a proxima linha do arquivo
    while (Trim(S) <> '') do // Arquivo contém registro para processar.
    begin
      // Condições possiveis para executar baixa do titulo.
      if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'T')) then
        //identificacao de registro transacao
      begin

        wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
        wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
        wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
        wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
        wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));

        wCodMov := Copy(Trim(S), 16, 2);

        case StrToInt(Copy(Trim(S), 16, 2)) of
          2:  begin
                wstrErro5 := 'Entrada Confirmada';
              end;
          6:  begin // Liquidacao
                wstrErro5 := 'Liquidação';
              end;
          9:  begin // Baixa
                wstrErro5 := 'Baixa';
              end;
         17:  begin // Liquidacao de Titulo Nao Registrado
                wstrErro5 := 'Liquidação Após Baixa ou Liquidação Título Não Registrado';
              end;
        end;

        With DMContasReceber do
        begin
          if wstrErro1 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 47, 10) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 214, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro1;
            CdRetornoRemessa.Post;
          end;
          if wstrErro2 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 47, 10) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 216, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro2;
            CdRetornoRemessa.Post;
          end;
          if wstrErro3 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 47, 10) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 218, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro3;
            CdRetornoRemessa.Post;
          end;
          if wstrErro4 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 47, 10) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 220, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro4;
            CdRetornoRemessa.Post;
          end;
          if wstrErro5 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 47, 10) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 222, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro5;
            CdRetornoRemessa.Post;
          end;
        end;

        if StrToInt(Copy(Trim(S), 16, 2)) in [06, 09, 17] then
          // ???? Ver tabela explicativa NOTA 17
        begin
          wVal_Baixa := 0;
          wNNumero := Trim(Copy(S, 38, 19) + '-' + Copy(S, 57, 1));
          // 10 - 63/73 Nosso numero com o dígito verificador ( Numero do titulo no banco )
        // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 82, 15)) <> 0 then
            // Valor recebido + valor despesa de cobranca
            wVal_Baixa := (StrToFloat(Copy(S, 82, 15)) / 100) +
              (StrToFloat(Copy(S, 199, 15)) / 100)
          else
            raise exception.Create('Titulo com valor p/baixar igual a zero!');

          Readln(F, S); //Le a proxima linha do arquivo
          if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'U')) then //identificacao de registro transacao
          begin
            wVal_Juro := 0;
            wVal_Desc := 0;
            wVal_Baixa := 0;
            wpgto_juro := 0;
            wDtLiquida := Copy(S, 138, 02) + '/' + Copy(S, 140, 02) + '/' +
              Copy(S, 142, 04);
            wDtCredito := Copy(S, 146, 02) + '/' + Copy(S, 148, 02) + '/' +
              Copy(S, 150, 04);

            //Verifica se valor recebido é diferente de zero.
            if StrToFloat(Copy(S, 78, 15)) <> 0 then // Valor pago pelo sacado
              wVal_Baixa := (StrToFloat(Copy(S, 78, 15)) / 100);
//  Comentado por Djeison - não disparar excessão se valor for igual a zero.
//            else
//              raise
//                exception.Create('Titulo com valor p/baixar igual a zero!');

            if StrToFloat(Copy(S, 18, 15)) <> 0 then
              // Juros de mora/multa/encargos
            begin
              wVal_Juro := StrToFloat(Copy(S, 18, 15)) / 100;
              wpgto_juro := StrToFloat(Copy(S, 18, 15)) / 100;
            end;

            if StrToFloat(Copy(S, 33, 15)) <> 0 then // Desconto concedido
              wVal_Desc := StrToFloat(Copy(S, 33, 15)) / 100 +
                StrToFloat(Copy(S, 48, 15)) / 100; // Valor do abatimento
          end;
          // Chama procedimento para baixa de titulo.
          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito);
        end;

        // Movimentações (Erros e Eventos)
//        wstrErro1 := '';
//        wstrErro2 := '';
//        wstrErro3 := '';
//        wstrErro4 := '';
//        wstrErro5 := '';

//        wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
//        wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
//        wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
//        wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
//        wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));



//        if wCodMov = '02' then // Entrada Confirmada.
//        begin
//          // Alterado por Djeison - Boletos que registraram não estavam saindo no relatório
////          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
//          wstrErro1 := 'Entrada Confirmada';
////          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
////          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
////          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
////          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
//        end;

//        if wCodMov = '03' then // Entrada Rejeitada
//        begin
//          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
//          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
//          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
//          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
//          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
//        end;

//        if wCodMov = '06' then // Liquidação
//        begin
//          wstrErro1 := 'Liquidação';
//        end;
//
//        if wCodMov = '09' then // Baixa
//        begin
//          wstrErro1 := 'Baixa';
//        end;

//        if wCodMov = '17' then // Liquidação Título Não Registrado
//        begin
//          wstrErro1 := 'Liquidação Após Baixa ou Liquidação Título Não Registrado';
//        end;

//        if wCodMov = '26' then // Instrução Rejeitada.
//        begin
//          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
//          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
//          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
//          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
//          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
//        end;

//        if wCodMov = '30' then // Alteração de Dados Rejeitada.
//        begin
//          wstrErro1 := RetornaErroUnibanco(Copy(Trim(S), 214, 2));
//          wstrErro2 := RetornaErroUnibanco(Copy(Trim(S), 216, 2));
//          wstrErro3 := RetornaErroUnibanco(Copy(Trim(S), 218, 2));
//          wstrErro4 := RetornaErroUnibanco(Copy(Trim(S), 220, 2));
//          wstrErro5 := RetornaErroUnibanco(Copy(Trim(S), 222, 2));
//        end;

      end;

//      // Inicia impressao dos erros \\
//      if Imp = nil then
//        Imp := TImp.Create;
//      Imp.AbreImpressora;
//      Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 66);
//
//      if wCont = 1 then
//      begin
//        Imp.WriteXY(4.5, wCont,
//          'R E L A T O R I O   D E   E R R O S  - SANTANDER  -RETORNO    -    Data: ' +
//          DateTimeToStr(Now));
//        wCont := wCont + 2;
//        Inc(wCont);
//        Imp.WriteXY(0, wCont,
//          'Titulo     Num. Registro    Cod.Recusa    Mensagem');
//        Inc(WCont);
//        Imp.WriteXY(0, wCont,
//          '--------------------------------------------------------------------------------------------------------------------');
//        Inc(WCont);
//      end;
//      if wstrErro1 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
//          '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 214, 2) +
//          '       ' + wstrErro1);
//        Inc(WCont);
//      end;
//      if wstrErro2 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
//          '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 216, 2) +
//          '       ' + wstrErro2);
//        Inc(WCont);
//      end;
//      if wstrErro3 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
//          '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 218, 2) +
//          '       ' + wstrErro3);
//        Inc(WCont);
//      end;
//      if wstrErro4 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
//          '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 220, 2) +
//          '       ' + wstrErro4);
//        Inc(WCont);
//      end;
//      if wstrErro5 <> '' then
//      begin
//        Imp.WriteXY(0, wCont, Copy(S, 59, 15) + '    ' + Copy(S, 38, 20) +
//          '          ' + Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 222, 2) +
//          '       ' + wstrErro5);
//        Inc(WCont);
//      end;
//
//      if wCont >= 66 then
//      begin
//        Imp.SaltaPagina;
//        wCont := 1;
//      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end;
//    if imp <> nil then // É necessario pois caso não tenha impressão ocorre erro.
//    begin
//      Imp.SaltaPagina;
//      Imp.FechaImpressora; // Finaliza os serviços de Impressao}
//    end;

//    GeraRelatorioRetorno;

    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.GeraRemessaSicoob;
var
  wstrS,wstrS3, wVal: string;
  wstrCodEmpresa: string;
  wintContador, wQtdTitulos: Integer;
  wintSeqArquivo, iSeq, iQtdRegLote : Integer;
  F: TextFile;
  wDesconto, wValTotal, wTotal: Real;
begin
  if ((DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'S') and
     (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'N') and
     (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB_CNAB240.Text = 'N')) then  //Novo layout arquivo remessa SICOOB - Modelo BANCOOB - CNAB 400 - Vanessa 21/11/2015
  begin
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMContasReceber.QRemessaCOD_FILIAL.Value);
      QFilial.Open;
    end;
    with DMContasReceber do
    begin
      try
        wintContador := 2;
        wstrS := '';
        wstrCodEmpresa := '';

        wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SICOOB');
        wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
          IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
          IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
          + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);

        //REGISTRO HEADER
        {001-026} wstrS := '01REMESSA01COBRANÇA       ' +
        // CODIGO DA COOPERATIVA
        {027-030} intdecimais(QRemessaCOD_AGENCIA.Text, 4, 0) +
        {031-031} QRemessaDIGITO_VERIFICADOR_AGENCIA.Text +
        {032-039} intdecimais(QRemessaCODIGO_CEDENTE.Text, 8, 0) +
        {040-040} QRemessaDIGITO_VERIFICADOR_CEDENTE.Text +
        {041-046} '      ' +
        {047-076} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
        {077-094} '756BANCOOBCED     ' +
        {095-100} FormatDateTime('DDMMYY', Date) +
        {101-107} IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
        {108-400} Bib.FormataTexto(' ', 287) + '000001' + Chr(13) + Chr(10); 

        //REGISTRO DETALHE
        while not QRemessa.Eof do
        begin
          {001-001} wstrS := wstrS + '102';
          {002-003}
                    //if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                    //  wstrS := wstrS + '01'
                    //else
                    //  wstrS := wstrS + '02';
          {004-017} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC.Text,14) +
          {018-022} QRemessaCOD_AGENCIA.Text + QRemessaDIGITO_VERIFICADOR_AGENCIA.Text +
          {023-031} intdecimais(QRemessaNUM_CONTA_CORRENTE.Text,8,0) + QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text +
          {032-037} '000000' +
          {038-062} '                         ' +
          {063-074} RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
          {075-081} intdecimais(QRemessaNUM_PARCELA.Text,2,0) + '00' + '   ' +
          {082-082} ' ' + //não sei o que vai haha
          {083-085} '   ' +
          {086-089} '000' + '0';
          {090-094} if QRemessaCARTEIRA.Text = '1' then
                      wstrS := wstrS + '00000'
                    else //carteira 3
                      wstrS := wstrS + '     ';

          {095-095} if QRemessaCARTEIRA.Text = '1' then
                      wstrS := wstrS + '0'
                    else //carteira 3
                      wstrS := wstrS + ' '; //informar dv do contrato

          {096-101} if QRemessaCARTEIRA.Text = '1' then
                      wstrS := wstrS + '      '
                    else //carteira 3
                      wstrS := wstrS + '      '; //informar borderô para carteira 3

          {102-105} wstrS := wstrS + '    ' +
          {106-106} '1'; //tipo de emissao. 1 cooperativa, 2 Cliente

          {107-108} if QRemessaCARTEIRA.Text = '1' then //Carteira/Modalidade
                      wstrS := wstrS + '01'
                    else //carteira 3
                      wstrS := wstrS + '03';

          {109-120} wstrS := wstrS + '01' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
          {121-126} FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
          {127-139} IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
          {140-142} intdecimais(QRemessaCOD_BANCO.Text, 3, 0) +
          {143-147} intdecimais(QRemessaCOD_AGENCIA.Text,4,0) + QRemessaDIGITO_VERIFICADOR_AGENCIA.Text +
          {148-149} '01';

          {150-150} if (QRemessaIND_ACEITE.Text = 'NAO') then
                      wstrS := wstrS + '0'  //sem aceite
                    else
                      wstrS := wstrS + '1'; // com aceite

          {151-156} wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_EMISSAO.Value) +
          {157-158} QRemessaPRIMEIRA_INSTR_COD.Text +
          {159-160} '00' ; //Segunda instrucao: vide SEQ 33
          wstrS3 := intdecimais(FloatToStr(QRemessaPERC_JURO_BLOQUETO.Value * 10000),6,0);

          {161-166} wstrS := wstrS + intdecimais(FloatToStr(QRemessaPERC_JURO_BLOQUETO.Value * 10000),6,0);
          {167-172} wstrS := wstrS + intdecimais(floattostr(QRemessaPERC_JURO_MORA.Value * 10000), 6, 0);
          {173-173} wstrS := wstrS + '2'; //tipo de distribuição, 1 Cooperativa - 2 Cliente

          {174-179} if DMContasReceber.QRemessaperc_desconto_financeiro.value > 0 then
                      wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value)
                    else
                      wstrS := wstrS + '000000';

          {180-192} if DMContasReceber.QRemessaperc_desconto_financeiro.value > 0 then
                      wdesconto := ((dmcontasreceber.QRemessaVAL_TITULO.Value * DMContasReceber.QRemessaperc_desconto_financeiro.value) / 100)
                    else
                      wdesconto := 0;
                    wstrS := wstrS + intDecimais(FloatToStr(wDesconto),13,2);

          {193-205} wstrS := wstrS + '9' + '000000000000' +  //cod moeda / IOF
          {206-218} '0000000000000';
          {219-220} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                      wstrS := wstrS + '01'
                    else
                      wstrS := wstrS + '02';

          {221-234} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          {235-274} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
          {275-311} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 37) +
          {312-326} Bib.FormataTexto(UpperCase(QRemessaDESC_BAIRRO_COBRANCA.Text), 15) +
          {327-334} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          {335-349} Bib.FormataTexto(UpperCase(QRemessaDESC_CIDADE_COBRANCA.Text), 15) +
          {350-351} Bib.FormataTexto(UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text), 2) +
          {352-391} Bib.FormataTexto(' ', 40) +
          {392-395} INTDECIMAIS(QRemessaNR_DIAS_PROTESTO.Text,2,0) + ' ' +
          {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);

          Inc(wintContador);
          QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
            QRemessaCOD_CONTA_RECEBER_CAB.Value);
          QEnviadoBanco.ExecSQL;
          QRemessa.Next;
       end; //fim do while

        //REGISTRO TRAILLER
        {001-394} wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
        {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6);

        FContasReceberParam.SDlg_Remessa.FileName := 'CB' +
          FormatDateTime('DDMM', Date) + FormatDateTime('YY', Date) + '.REM';
        FContasReceberParam.SDlg_Remessa.Filter :=
          'Arquivo de Remessa Sicoob - Bancoob';
        FContasReceberParam.SDlg_Remessa.DefaultExt := '';
        FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

        if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, wstrS);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA SICOOB - BANCOOB Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA SICOOB - BANCOOB não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
        DMOracle.DBCemapa.Rollback;
        raise
          exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
          + #13 +
          'Verifique se não existem campos em branco no cadastro de bancos' + #13
          +
          'ou no cadastro de Clientes/Fornecedores.');
    end;
    end;
  end
  else if(
    (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'N') and
    (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'N')and
    (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB_CNAB240.Text = 'S')) then  //Remessa SICOOB - CNAB 240 - Modelo BANCOOB - Vanessa 31/08/2018
  begin
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMContasReceber.QRemessaCOD_FILIAL.Value);
      QFilial.Open;
    end;

    with DMContasReceber do
    begin
      try
        wVal := '';
        wQtdTitulos := 0;
        iQtdRegLote := 1;
        iSeq := 1;
        wTotal := 0;
        wintContador := 0;

        wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SICOOB_240');

        {------------------------- HEADER DO ARQUIVO --------------------------}
        {001-018} wVal := wVal + '75600000         2' +
        {019-032} RMaskCGC_CPF(QRemessaNUM_CGC.Text,14) +
        {033-052} '                    ' +
        {053-058} intdecimais(QRemessaCOD_AGENCIA.Text,5,0) + QRemessaDIGITO_VERIFICADOR_AGENCIA.Text +
        {059-070} intdecimais(QRemessaNUM_CONTA_CORRENTE.Text, 12, 0) +
        {071-071} QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + //dv conta corrente
        {072-072} '0' +
        {073-102} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
        {103-132} 'SICOOB                        ' +
        {133-142} '          ' +
        {143-143} '1' +
        {144-157} FormatDateTime('DDMMYYYYHHMMSS', now) +
        {158-163} IntDecimais(IntToStr(wintSeqArquivo), 6, 0) +
        {164-166} '081' + //lAYOUT DO ARQUIVO - VALOR FIXO
        {167-171} '00000' +
        {172-240} Bib.FormataTexto(' ', 69) + Chr(13) + Chr(10);
        inc(wintContador);

        {------------------------- HEADER DO LOTE -----------------------------}
        {001-018} wVal := wVal + '75600011R01  040 2' +
        {019-033} RMaskCGC_CPF(QRemessaNUM_CGC.Text,15) +
        {034-053} '                    ' +
        {054-059} intdecimais(QRemessaCOD_AGENCIA.Text,5,0) + QRemessaDIGITO_VERIFICADOR_AGENCIA.Text +
        {060-072} intdecimais(QRemessaNUM_CONTA_CORRENTE.Text, 12, 0) + QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text +
        {073-073} ' ' +
        {074-103} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
        {104-183} Bib.FormataTexto(' ', 80) +
        {184-191} IntDecimais(IntToStr(wintSeqArquivo), 8, 0) +
        {192-199} FormatDateTime('DDMMYYYY', now) +
        {200-207} '00000000' +
        {208-240} Bib.FormataTexto(' ', 33) + Chr(13) + Chr(10);
        inc(wintContador);

        {----------------------- DETALHE SEGMENTO P ---------------------------}
        while not QRemessa.Eof do
        begin
        {001-003} wVal := wVal + RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3) +
        {004-008} '0001' + '3' +
        {009-015} RMaskCGC_CPF(inttostr(iSeq), 5) + 'P ' +
        {016-017} '01' +
        {018-022} RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5) +
        {023-023} QRemessaDIGITO_VERIFICADOR_AGENCIA.Text +
        {024-035} RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONTA_CORRENTE.Text,12)), 12) +
        {036-037} QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text + ' ' +
        {038-057} RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 10) +
                  RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 2) +
                  '01' +
                  '1' +
                  Bib.FormataTexto(' ', 5) +
        {058-060} QRemessaCARTEIRA.Text + '0' + ' ' +
        {061-061} QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO.Text +
        {062-062} QRemessaCOD_IDENTIF_DISTRIBUICAO.Text +
        {063-077} RMaskCGC_CPF(bib.StrZero(QRemessaNUM_TITULO.Text,13),13) + RMaskCGC_CPF(bib.StrZero(QRemessaNUM_PARCELA.Text,2),2) +
        {078-085} FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value) +
        {086-105} StrZero(QRemessaVAL_TITULO.Value, 15, 2) + '00000' + ' ' +
        {107-108} '02' + //02 INDICA A ESPECIE DO TITULO
        {109-109} QRemessaCOD_IDENTIF_ACEITO.Text +
        {110-117} FormatDateTime('DDMMYYYY', QRemessaDT_EMISSAO.Value);
        {118-118} if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
                    wVal := wVal + '1'
                  else if (QRemessaIND_TIPO_JURO.Text = 'PERCENTUAL') then    //falta o else Junior 07/02/2019
                    wVal := wVal + '2'
                  else
                    wVal := wVal + '0';
        {119-126} wVal := wVal + FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value+1) +
        {127-141} intdecimais((QRemessainstrucao_juro.Text), 15, 2) +
        {142-142} '0' + //ZERO IDENTIFICA NAO CONCEDER DESCONTO NO BOLETO
        {143-195} RMaskCGC_CPF('0', 53) + //JOGAR DESCONTO ZERADO
        {196-220} 'TITULO: ' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 6) + '-' + RMaskCGC_CPF(QRemessaNUM_PARCELA.Text, 3) + '       ';
        {221-221} if (QRemessaCOD_PROTESTO.Text = '0') then
                    wVal := wVal + '3'
                  else
                    wVal := wVal + QRemessaCOD_PROTESTO.Text;
        {222-223} wVal := wVal + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2) +
       // {224-224} QRemessaCOD_IDENTIF_TIPO_BOLETO.Text +
        {224-224} '0' +      //segue layout zero fixo - vitor
        {225-229} '   ' + '09' +
        {230-240} '0000000000 ' + Chr(13) + Chr(10);
        inc(wintContador);
        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;

        {----------------------- DETALHE SEGMENTO Q ---------------------------}
        {001-003} wVal := wval + RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3) +
        {004-008} '0001' + '3' +
        {009-013} RMaskCGC_CPF(inttostr(iSeq), 5) +
        {014-014} 'Q' +
        {015-015} ' ' +
        {016-017} '01';
        {018-018} if QRemessaIND_FISICA_JURIDICA.Text = 'F' then
                    wVal := wVal + '1'
                  else
                    wVal := wVal + '2';
        {019-033} wVal := wVal + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15) +
        {034-073} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
        {074-113} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
        {114-128} Bib.FormataTexto(UpperCase(QRemessaDESC_BAIRRO.Text), 15) +
        {129-136} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
        {137-151} Bib.FormataTexto(UpperCase(QRemessaDESC_CIDADE_COBRANCA.Text), 15) +
        {152-153} Bib.FormataTexto(UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text), 2) +
        {154-154} '0' +
        {155-159} '000000000000000' +
        {170-209} Bib.FormataTexto(' ', 40) +
        {210-240} '000' + '                    ' + '        ' + Chr(13) + Chr(10);  //trocados zero por espaço - vitor
        inc(wintContador);
        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;

        {------------------------- DETALHE SEGMENTO R -------------------------}
        {001-003} wVal := wVal + RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3) +
        {004-007} '0001' +
        {008-008} '3' +
        {009-013} RMaskCGC_CPF(inttostr(iSeq), 5) +
        {014-014} 'R' +
        {015-015} ' ' +
        {016-017} '01' +
        {018-018} '0' +
        {019-026} '00000000' +
        {027-041} '000000000000000' +
        {042-065} RMaskCGC_CPF('0', 24);
        {066-066} if (QRemessaPERC_JURO_MORA.Text <> '') and (QRemessaPERC_JURO_MORA.Value > 0) then
                  begin
                    wVal := wVal + '2' +
        {067-074}   FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value+1) + //COM MULTA, PASSAR DATA DE VENCIMENTO
        {075-089}   intdecimais(QRemessaPERC_JURO_MORA.Text,15,2)               //COM MULTA, PASSAR O PERCENTUAL DA MULTA
                  end
                  else
                  begin
                    wVal := wVal + '0'+
        {067-074}   '00000000' +      //SEM MULTA, PASSAR ZERO NA DATA
        {075-089}   '000000000000000';  //SEM MULTA, PASSAR ZERO NO PERCENTUAL
                  end;
//        {067-074}   wVal := wVal + FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value+1);
//        {075-089} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
//                    wVal := wVal + intdecimais(QRemessaPERC_JURO_MORA.Text,15,2)
//                  else
//                    wVal := wVal + '0000000000000';
        {090-199} wVal := wVal + Bib.FormataTexto(' ', 110) +
        {200-216} RMaskCGC_CPF('0', 16) + ' ' +
        {217-230} RMaskCGC_CPF('0', 12) + ' ' + ' ' +
        {231-231} '0' +
        {232-240} Bib.FormataTexto(' ', 9) + Chr(13) + Chr(10);
        inc(wintContador);
        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;
        //wintContador := wintContador + 1;
        wQtdTitulos := wQtdTitulos + 1;
        wTotal := wTotal + QRemessaVAL_TITULO.Value;

        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end;

      QRemessa.First;

      {-------------------------- TRAILER DO LOTE -----------------------------}
      {001-003} wVal := wVal + RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3) +
      {004-007} '0001' +
      {008-008} '5' +
      {009-017} Bib.FormataTexto(' ', 9) +
      {018-023} RMaskCGC_CPF(IntToStr(wintContador), 6) +
//      {018-023} '000003' +
      {024-029} RMaskCGC_CPF(inttostr(wQtdTitulos), 6) +
      {030-046} intdecimais(floattostr(wTotal),17,2) + //total de cobranca simples
      {047-115} RMaskCGC_CPF('0', 69) +
      {116-240} Bib.FormataTexto(' ', 125) + Chr(13) + Chr(10);
      inc(wintContador);
      {------------------------- Trailler do Arquivo --------------------------}
      {001-008} wVal := wval + RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3) + '99999' +
      {009-017} Bib.FormataTexto(' ', 9) +
      {018-023} '000001' + //quantidade de titulos em lote
      {024-029} RMaskCGC_CPF(IntToStr(wintContador), 6) +
//      {024-029} '000003' + //quantidad de registros do arquivo
      {030-035} '000000' +
      {047-240} Bib.FormataTexto(' ', 205);

      FContasReceberParam.SDlg_Remessa.FileName := 'CB' +
          FormatDateTime('DDMM', Date) + FormatDateTime('YY', Date) + '.REM';
        FContasReceberParam.SDlg_Remessa.Filter :=
          'Arquivo de Remessa Sicoob - Bancoob CNAB 240';
        FContasReceberParam.SDlg_Remessa.DefaultExt := '';
        FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

        if FContasReceberParam.SDlg_Remessa.Execute then
          begin
            AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
            Rewrite(F);
            Writeln(F, wVal);
            CloseFile(F);
            DMOracle.DBCemapa.Commit;
            MessageDlg('Arquivo REMESSA SICOOB/CNAB240 Gerado com Sucesso!',
              mtInformation, [mbOk], 0);
          end
          else
          begin
            DMOracle.DBCemapa.Rollback;
            MessageDlg('Arquivo REMESSA SICOOB - BANCOOB não foi Gerado!', mtWarning,
              [mbOk], 0);
          end;
        except
        DMOracle.DBCemapa.Rollback;
        raise
          exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
          + #13 +
          'Verifique se não existem campos em branco no cadastro de bancos' + #13
          +
          'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
  end //Fim CNAB Bancoob CNAB 240 - Vanessa 31/08/2018
  else if (
    (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'N') and
    (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'S') and
    (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB_CNAB240.Text = 'N')) then //Bradesco correspondente Sicoob - Boleto Bradesco - remessa sicoob 29/09/2016
  begin
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMContasReceber.QRemessaCOD_FILIAL.Value);
      QFilial.Open;
    end;
  
    with DMContasReceber do
    begin
      try
        wintContador := 2;
        wstrS := '';
        wstrCodEmpresa := '';

        wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_SICOOB');
        wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
          IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
          IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
          + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);

        //REGISTRO HEADER
        {001-026} wstrS := '01REMESSA01COBRANCA       ' +
        // CODIGO DA COOPERATIVA
        {027-039} '0000000004343';
        if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then  //COD_COBRANCA
        {040-046} wstrS := wstrS + '0000617'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SRDECORA' then
        {040-046} wstrS := wstrS + '0000418'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASMIL' then
        {040-046} wstrS := wstrS + '0000802'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DLM' then
        {040-046} wstrS := wstrS + '0000598'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZORZINCO' then
        {040-046} wstrS := wstrS + '0001011'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI' then  //Provina
        {040-046} wstrS := wstrS + '0000756'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BICHOS' then 
        {040-046} wstrS := wstrS + '0001252'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MFARINHA' then
        {040-046} wstrS := wstrS + '0001271'
        else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GOLDEN' then
        {040-046} wstrS := wstrS + '0000552';
                  wstrS := wstrS +
  //      {040-046} IntDecimais(QRemessaCODIGO_CEDENTE.Text, 7, 0) +
        {047-076} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
        {077-079} '756BANCOOB        ' +
        {095-110} FormatDateTime('DDMMYY', Date) + Bib.FormataTexto(' ', 8) + 'SX' +
        {111-117} IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
        {118-400} Bib.FormataTexto(' ', 277) + '000001' + Chr(13) + Chr(10);

        //REGISTRO DETALHE
        while not QRemessa.Eof do
        begin
          {001-020} wstrS := wstrS + '1' + '00' + RMaskCGC_CPF('0', 17) +
          {021-030} '0000004343';
          if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then   //COD_COBRANCA
            wstrS := wstrS + '0000617'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SRDECORA' then
            wstrS := wstrS + '0000418'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GRASMIL' then
            wstrS := wstrS + '0000802'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DLM' then
            wstrS := wstrS + '0000598'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZORZINCO' then
            wstrS := wstrS + '0001011'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZAPOLI' then   //Provina
            wstrS := wstrS + '0000756'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BICHOS' then
            wstrS := wstrS + '0001252'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MFARINHA' then
            wstrS := wstrS + '0001271'
          else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GOLDEN' then
            wstrS := wstrS + '0000552';
                    wstrS := wstrS +
          {038-070} RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 25) + RMaskCGC_CPF('0', 8) +
          {071-082} RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
          {083-094} RMaskCGC_CPF('0', 10) + '2N' +
          {095-108} Bib.FormataTexto(' ', 14) +
          {109-120} '01' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
          {121-126} FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
          {127-139} IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
          {140-147} '0000000001';
          {150-150} if ((QRemessaIND_ACEITE.Text = 'SIM') or
                      (DMParamSistema.QParamSistemaIND_ACEITE_CR.Text = 'N')) then
                      wstrS := wstrS + 'A'
                    else
                      wstrS := wstrS + 'N';
          {151-156} wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_EMISSAO.Value);
          {157-160} if QRemessaNR_DIAS_PROTESTO.Text <> '' then
                      wstrS := wstrS + '06' + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2)
                    else //ALTERADO MARCOS 15/12/2010
                      wstrS := wstrS + '0000';

  //        {161-173} if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
  //                    wstrS := wstrS + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
  //                    DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
  //                    (QRemessaVal_Titulo.Value / 100)), 13, 2);

          // Quando juro for Percentual não estava jogando no arquivo - Registro ficava incompleto - Djeison - 04/12/2013
          {161-173}if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
            wstrS := wstrS + IntDecimais(QRemessainstrucao_juro.Text, 13, 2)
          else
            wstrS := wstrS + IntDecimais(FloatToStr(QRemessaPerc_Juro_Dia.Value), 13, 2);

          {174-179} wstrs := wstrS + RMaskCGC_CPF('0', 6);

          //dala limite p/ concessao de desconto

          {180-192}  wstrs := wstrS + RMaskCGC_CPF('0', 13); //valor do desconto

          {193-205} wstrS := wstrS + RMaskCGC_CPF('0', 13); //valor do IOF
          {206-218} wstrS := wstrS + RMaskCGC_CPF('0', 13);
          //valor do abatimento a ser concedido ou cancelado
          {219-220} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                      wstrS := wstrS + '01'
                    else
                    begin
                      if (QRemessaIND_FISICA_JURIDICA.Text = 'J') then
                        wstrS := wstrS + '02'
                      else
                        wstrS := wstrS + '98';
                    end;
          {221-234} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          {235-274} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
          {275-314} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
          {315-326} Bib.FormataTexto(' ', 12) +
          {327-334} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) + {335} ' ' +
          {336-349} RMaskCGC_CPF(DMFilial.QFilialNUM_CGC.Text, 14) +
          {350-351} '02' +
          {352-394} Bib.FormataTexto(UpperCase(DMFilial.QFilialDESC_FILIAL.Text), 43) +
          {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);

          Inc(wintContador);
          QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
            QRemessaCOD_CONTA_RECEBER_CAB.Value);
          QEnviadoBanco.ExecSQL;
          QRemessa.Next;
        end; //fim do while

        //registro trailler
        wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
        RMaskCGC_CPF(IntToStr(wintContador), 6);

        FContasReceberParam.SDlg_Remessa.FileName := 'CB' +
          FormatDateTime('DDMM', Date) + '15.REM';
        FContasReceberParam.SDlg_Remessa.Filter :=
          'Arquivo de Remessa Sicoob';
        FContasReceberParam.SDlg_Remessa.DefaultExt := '';
        FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

        if FContasReceberParam.SDlg_Remessa.Execute then
        begin
          AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
          Rewrite(F);
          Writeln(F, wstrS);
          CloseFile(F);
          DMOracle.DBCemapa.Commit;
          MessageDlg('Arquivo REMESSA Sicoob Gerado com Sucesso!',
            mtInformation, [mbOk], 0);
        end
        else
        begin
          DMOracle.DBCemapa.Rollback;
          MessageDlg('Arquivo REMESSA Sicoob não foi Gerado!', mtWarning,
            [mbOk], 0);
        end;
      except
        DMOracle.DBCemapa.Rollback;
        raise
          exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
          + #13 +
          'Verifique se não existem campos em branco no cadastro de bancos' + #13
          +
          'ou no cadastro de Clientes/Fornecedores.');
      end;
    end;
  end; //end do else
end;

procedure TFContasReceberCad.RetornoRemessaSicoob;
var
  wCont, wCont1, wNum_Baixa: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero, wErro1, wErro2: string;
begin
  if ((DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'S') and
      (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'N') and
      (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB_CNAB240.Text = 'N')) then //novo modelo retorno remessa sicoob apartir 01/01/2016 - BANCOOB
  begin
    // Abre arquivo de retorno SICOOB
    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont1 := 0;
      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 1, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header inválido.');
      if Copy(Trim(S), 2, 1) <> '2' then
        raise exception.Create('Identificação do Tipo de Arquivo inválida.');
      if Copy(Trim(S), 3, 7) <> 'RETORNO' then
        // Verifica se realmente é um arquivo de retorno.
        raise exception.Create('Não é um arquivo de RETORNO.');
      if Copy(Trim(S), 10, 2) <> '01' then
        raise exception.Create('Retorno Inválido.');
      if Copy(Trim(S), 12, 15) <> 'COBRANÇA       ' then
        raise exception.Create('Não é um arquivo de COBRANÇA.');
      if Trim(Copy(Trim(S), 77, 17)) <> '756 - BANCOOB S/A' then
        raise exception.Create('Nome do banco inválido!');

      Readln(F, S); //Le a proxima linha do arquivo
      // Arquivo contém registro para processar.
      while ((Trim(S) <> '') and (Copy(Trim(S), 1, 1) <> '9')) do
      begin
        // Condições possiveis para executar baixa do titulo.
        if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) or
          ((StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20)) then // Pagina 36
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;
          wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' + Copy(S, 115, 02);
          wDtCredito := wDtLiquida;
          wNNumero := Copy(S, 67, 8); // Nosso Numero
          
          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
            wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
          else
            ShowMessage('Título ' + Copy(S, 117, 10) +
              ' esta com valor igual a zero no arquivo retorno.');

          if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
            wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
          end;

          if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
            wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 + StrToFloat(Copy(S,
              228, 13)) / 100; // Valor do abatimento

          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito);
          // Chama procedimento para baixa de titulo.
          inc(wCont1);
        end;
        // Erros
        wstrErro1 := '';
        wstrErro2 := '';
        wstrErro3 := '';
        wstrErro4 := '';
        wstrErro5 := '';
        if Copy(Trim(S), 109, 2) = '02' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := 'ENTRADA CONFIRMADA';
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;
        if Copy(Trim(S), 109, 2) = '03' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '24' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '27' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '30' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '32' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if (StrToInt(Copy(Trim(S), 109, 2)) in [6,17]) then // baixa normal do titulo
          wstrErro1 := 'BAIXA DE TITULO';
        if (StrToInt(Copy(Trim(S), 109, 2)) = 15) then // baixa cartorio
          wstrErro1 := 'LIQUIDACAO CARTORIO';
        if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20) then
          wstrErro1 := 'BAIXA DE TITULO - DESCONTADO';
        if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 16) then
          wstrErro1 := 'TITULO BAIXADO PELO BANCO DECURSO DE PRAZO';

        With DMContasReceber do
        begin
          if wstrErro1 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 12);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 319, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro1;
            CdRetornoRemessa.Post;
          end;
          if wstrErro2 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 12);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 321, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro2;
            CdRetornoRemessa.Post;
          end;
          if wstrErro3 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 12);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 323, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro3;
            CdRetornoRemessa.Post;
          end;
          if wstrErro4 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 12);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 325, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro4;
            CdRetornoRemessa.Post;
          end;
          if wstrErro5 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 63, 12);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 327, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro5;
            CdRetornoRemessa.Post;
          end;
        end;
        ReadLn(F, S);//Pula para proximo registro no arquivo texto.
      end; 
      //GeraRelatorioRetorno;
      CloseFile(F);
    end;
  end



  //  A Vanessa estava fazendo. Descomentei para testar arquivo retorno do universo dos bichos e funcionou. Junior 21/02/2019
  //--------------- F A Z E N D O.
  else if (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'N') and
    (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'N') and
    (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB_CNAB240.Text = 'S') then //Retorno remessa Sicoob Cnab 240 - Vanessa 18/09/2018
  begin
    wVal_Baixa := 0;
    wVal_Juro := 0;
    wVal_Desc := 0;
    wPgto_Juro := 0;
    wNum_Baixa := 0;
    wErro1 := '';
    wErro2 := '';

    // Abre arquivo de retorno CNAB 240
    if OpenDialog1.Execute then {Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      if Copy(Trim(S), 8, 1) <> '0' then
        raise exception.Create('Registro Header inválido');
      if Copy(Trim(S), 103, 6) <> 'SICOOB' then
        raise exception.Create('Nome do banco inválido');
      if Copy(Trim(S), 143, 1) <> '2' then
        raise exception.Create('Não é um arquivo de RETORNO');

      Readln(F, S); //Le a proxima linha do arquivo
      Readln(F, S);

      //Equanto arquivo contém registro para processar.
      while (((Copy(Trim(S), 14, 1) = 'T') and (Copy(Trim(S), 8, 1) = '3')) or
             ((Copy(Trim(S), 14, 1) = 'U') and (Copy(Trim(S), 8, 1) = '3'))) do
      begin
        if (StrToInt(Copy(Trim(S), 16, 2)) in [6,09,15,17]) then //03,26,30 é alguma rejeição - add cod. 09 - Baixa diretamente no site do banco - Junior 15/05/2019
        begin
            wVal_Baixa  := 0;
            wVal_Juro   := 0;
            wVal_Desc   := 0;
            wpgto_juro  := 0;
            wNNumero    := Copy(S, 40, 8);
            wNum_Titulo := floattostr(strtofloat(Trim(copy(S, 59, 13))));
            if StrToFloat(Copy(S, 82, 15)) <> 0 then // Verifica se valor para baixar é diferente de zero.
              wVal_Baixa := strtofloat(trim(Copy(S, 82, 15)))/100 //val titulo
            else
              Showmessage('Título com NN ' + wNNumero + ' zerado');

        if (StrToInt(Copy(Trim(S), 16, 2)) in [02,03,06,09,10,12,13,14,15,17,19,20,23,24,26,27,28,29,30,32,33,34,35]) then
        begin
          if (Copy(Trim(S), 16, 2) <> '') or (Copy(Trim(S), 222, 2) <> '00') then
            wErro1 := RetornoErroBanco(Copy(Trim(S), 16, 2), Copy(Trim(S), 222, 2))  //cod_movimento, cod_rejeicao
          else
            wErro1 := '';
        end;

        With DMContasReceber do
        begin
          if wErro1 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value :=  Copy(S, 40, 8);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 16, 2);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 214, 2) + Copy(Trim(S), 216, 2) + Copy(Trim(S), 218, 2) + Copy(Trim(S), 220, 2) + Copy(Trim(S), 222, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wErro1;
            CdRetornoRemessa.Post;
          end;
          wErro1 := '';
        end;


        Readln(F, S); //Le a proxima linha do arquivo - aqui vai para a linha U (juros multa essas coisas)

        wDtLiquida := Copy(S, 138, 02) + '/' + Copy(S, 140, 02) + '/' + Copy(S, 142, 04);
        wDtCredito := wDtLiquida;

        wVal_Baixa := strtofloat(trim(Copy(S, 78, 15)))/100; //val baixa (pagamento)  //Estava descontando juro do valor principal. Tive que colocar nesse lugar. Junior 06/10/2020.

        if StrToFloat(Copy(S, 18, 15)) <> 0 then  // Juros de mora/multa/encargos //estava pegando apenas 13 casas para juros. Junior 01/10/2020
        begin
          wVal_Juro  := wVal_Juro + StrToFloat(Copy(S, 18, 15)) / 100;
          wpgto_juro := StrToFloat(Copy(S, 18, 15)) / 100; //nao estava fazendo a baixa do recebimento de juros - Deion. suporte(1103). Junior 02/10/2020
        end;

        if StrToFloat(Copy(S, 33, 15)) <> 0 then // Desconto concedido
          wVal_Desc := StrToFloat(Copy(S, 33, 15)) / 100 +
                       StrToFloat(Copy(S, 48, 15)) / 100; // Valor do abatimento

        BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
        wNNumero, wDtLiquida, wDtCredito); // Chama procedimento para baixa de titulo.

        inc(wNum_Baixa);

    end; //fim baixa titulo
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
     end;//fim do while
      CloseFile(F); // Fecha arquivo aberto.
    end;// Fim do begin OpenDialog.
  end
  //------------------------ fazendo



  else if (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'S') and
          (DMParamSistema.QParamSistemaIND_SICOOB_BANCOOB.Text = 'N') and
          (DMParamSistema.QParamSistemaIND_SICOOB_BRADESCO.Text = 'N') then //boleto bradesco - remessa sicoob 400 posições
  begin
    // Abre arquivo de retorno SICOOB - IGUAL AO RETORNO BRADESCO - Djeison A. S. 07/08/2013
    if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      AssignFile(F, OpenDialog1.FileName);
      {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      wCont1 := 0;
      wCont := 1; // Inicializa valor para salto de linha-relatório de erros

      if Copy(Trim(S), 1, 1) <> '0' then
        raise exception.Create('Identificação do Registro Header invalido!');
      if Copy(Trim(S), 2, 1) <> '2' then
        raise exception.Create('Identificação do Tipo de Arquivo invalida!');
      if Copy(Trim(S), 3, 7) <> 'RETORNO' then
        // Verifica se realmente é um arquivo de retorno.
        raise exception.Create('Não é um arquivo de RETORNO!');
      if Copy(Trim(S), 10, 2) <> '01' then
        raise exception.Create('Retorno Inválido!');
      if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
        raise exception.Create('Não é um arquivo de COBRANÇA!');
      if Trim(Copy(Trim(S), 80, 8)) <> 'BANCOOB' then
        raise exception.Create('Nome do banco inválido!');

      Readln(F, S); //Le a proxima linha do arquivo
      // Arquivo contém registro para processar.
      while ((Trim(S) <> '') and (Copy(Trim(S), 1, 1) <> '9')) do
      begin
        // Condições possiveis para executar baixa do titulo.
        if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) or
          ((StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20)) then // Pagina 36
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;
          wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
            Copy(S, 115, 02);
          wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
            Copy(S, 300, 02);
          wNNumero := Copy(S, 71, 12); // Nosso Numero
          // Comentado por Djeison A. S. 07/08/2013
          //wNum_Titulo := Trim(Copy(S, 117, 10)); //

          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
            wVal_Baixa := StrToFloat(Copy(S, 254, 13)) / 100
          else
            ShowMessage('Titulo ' + Copy(S, 117, 10) +
              ' com valor p/baixar igual a zero!');

          if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100;
            wpgto_juro := StrToFloat(Copy(S, 267, 13)) / 100;
          end;

          if StrToFloat(Copy(S, 241, 13)) <> 0 then // Desconto concedido
            wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 + StrToFloat(Copy(S,
              228, 13)) / 100; // Valor do abatimento

          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito);
          // Chama procedimento para baixa de titulo.
          inc(wCont1);
        end;
        // Erros
        wstrErro1 := '';
        wstrErro2 := '';
        wstrErro3 := '';
        wstrErro4 := '';
        wstrErro5 := '';
        if Copy(Trim(S), 109, 2) = '02' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := 'ENTRADA CONFIRMADA';
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;
        if Copy(Trim(S), 109, 2) = '03' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '24' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '27' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '30' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if Copy(Trim(S), 109, 2) = '32' then // Houve recusa do registro enviado.
        begin
          wstrErro1 := RetornaErroBradesco(Copy(Trim(S), 319, 2));
          wstrErro2 := RetornaErroBradesco(Copy(Trim(S), 321, 2));
          wstrErro3 := RetornaErroBradesco(Copy(Trim(S), 323, 2));
          wstrErro4 := RetornaErroBradesco(Copy(Trim(S), 325, 2));
          wstrErro5 := RetornaErroBradesco(Copy(Trim(S), 327, 2));
        end;

        if (StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17]) then // baixa normal do titulo
          wstrErro1 := 'BAIXA DE TITULO';
        if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 20) then
          wstrErro1 := 'BAIXA DE TITULO - DESCONTADO';
        if (StrToInt(Copy(Trim(S), 109, 2)) = 10) and (StrToInt(Copy(Trim(S), 319, 2)) = 16) then
          wstrErro1 := 'TITULO BAIXADO PELO BANCO DECURSO DE PRAZO';

        With DMContasReceber do
        begin
          if wstrErro1 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 319, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro1;
            CdRetornoRemessa.Post;
          end;
          if wstrErro2 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 321, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro2;
            CdRetornoRemessa.Post;
          end;
          if wstrErro3 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 323, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro3;
            CdRetornoRemessa.Post;
          end;
          if wstrErro4 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 325, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro4;
            CdRetornoRemessa.Post;
          end;
          if wstrErro5 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 117, 10);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 48, 15);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 295, 6);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 109, 2)+'-' + Copy(Trim(S), 327, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro5;
            CdRetornoRemessa.Post;
          end;
        end;
        ReadLn(F, S); // Pula para proximo registro no arquivo texto.
      end; // Fim do while
      CloseFile(F); // Fecha arquivo aberto.
    end; // Fim do begin OpenDialog.
  end; //end do else
end;

procedure TFContasReceberCad.GeraRemessaSicoobBB; //boleto bb - remessa sicoob cnb 240
var
  wstrS: string;
  wSequenciaLote, wSeqArquivo: Integer;
  F: TextFile;
  wDesconto, wTotal: Real;
begin
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMContasReceber.QRemessaCOD_FILIAL.Value);
      QFilial.Open;
    end;

    with DMContasReceber do
    begin
      try
        wSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value, 'ARQ_REM_BBSICOOB');

        //REGISTRO HEADER
        {001-022} wstrS := '75600001R0000000  4370' +
        {023-029} intdecimais(QRemessaCOD_COBRANCA.Text, 7, 0) +
        {030-040} IntDecimais(QRemessaNUM_CONTA_CORRENTE.Text, 10, 0) +  //conta corrente + dv
                  IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text,1,0) +
        {041-070} Bib.FormataTexto(' ', 30) +
        {071-100} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
        {101-180} Bib.FormataTexto(' ', 80) +
        {181-188} IntDecimais(IntToStr(wSeqArquivo), 8, 0) +
        {189-196} FormatDateTime('DDMMYYYY', Date) +
        {197-207} RMaskCGC_CPF('0', 11) +
        {208-240} Bib.FormataTexto(' ', 33) + Chr(13) + Chr(10);

        wSequenciaLote := 1;
        //REGISTRO DETALHE
        while not QRemessa.Eof do
        begin
          {001-013} wstrS := wstrS + RMaskCGC_CPF('0', 7) + '3' +
          {009-013} IntDecimais(IntToStr(wSequenciaLote),5,0) +
          {014-015} 'P' + ' ' +
          {016-017} '01' + //entrada de titulos
          {018-040} Bib.FormataTexto(' ', 23) +
          {041-057} RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 17) +
          {058-060} '9' + '02' + //9 - carteira|DM - duplicata mercantil
          {061-062} '2' + ' ' + //identificacao da emissao do boleto|2-benificiario emite
          {063-077} RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 15) +
          {078-085} FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value) +
          {086-100} IntDecimais(QRemessaVAL_TITULO.Text, 15, 2) +
          {101-107} RMaskCGC_CPF('0', 6) + 'N' + '  ' +
          {110-117} FormatDateTime('DDMMYYYY', QRemessaDT_EMISSAO.Value);;

          {118-118} if QRemessaIND_TIPO_JURO.Text = 'VALOR' then //tipo de mora: 2 Valor | 3 Percentual
                      wstrS := wstrS + '2'
                    else
                      wstrS := wstrS + '3';

          {119-133} if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
                      wstrS := wstrS + IntDecimais(QRemessainstrucao_juro.Text, 15, 2)
                    else
                      wstrS := wstrS + IntDecimais(FloatToStr(QRemessaPerc_Juro_Dia.Value), 15, 2);

          {134-142} wstrS := wstrS + RMaskCGC_CPF('0', 9) +
          {143-150} FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value) +
          {151-165} RMaskCGC_CPF('0', 15) + //valor do desconto concedido
          {166-180} Bib.FormataTexto(' ', 15) +
          {181-195} RMaskCGC_CPF('0', 15) + //valor do abatimento
          {196-220} RMaskCGC_CPF(QRemessaNUM_TITULO.Text + '-' + QRemessaNUM_PARCELA.Text, 25); //controle do beneficiario (valor unico para cada titulo)

          {221-221} if QRemessaCOD_PROTESTO.text = '0' then //nao protestar
                      wstrS := wstrS + '0'
                    else
                      wstrS := wstrS + '1';

          {222-223} if QRemessaCOD_PROTESTO.text = '0' then
                      wstrS := wstrS + '00'
                    else
                      RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text,2);

          {224-229} wstrS := wstrS + RMaskCGC_CPF('0', 4) + '09' +
          {230-240} RMaskCGC_CPF('0', 10) + '0' + Chr(13) + Chr(10); //numero do contrato da operacao de credito

          inc(wSequenciaLote);

          //REGISTRO DETALHE SEGMENTO Q
          {001-013} wstrS := wstrS + RMaskCGC_CPF('0', 7) + '3' +
          {009-013} IntDecimais(IntToStr(wSequenciaLote),5,0) +
          {014-015} 'Q' + ' ' +
          {016-017} '01'; //entrada de titulos

          {018-019} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                      wstrS := wstrS + '01'
                    else
                      wstrS := wstrS + '02';

          {020-033} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
          {034-073} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
          {074-113} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
          {114-128} Bib.FormataTexto(UpperCase(QRemessaDESC_BAIRRO.Text), 15) +
          {129-136} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          {137-151} Bib.FormataTexto(UpperCase(QRemessaDESC_CIDADE_COBRANCA.Text), 15) +
          {152-153} Bib.FormataTexto(UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text), 2) +
          {154-155} '02' + //tipo de inscricao do sacado 2: cnpj
          {156-169} RMaskCGC_CPF(DMFilial.QFilialNUM_CGC.Text, 14) +
          {170-209} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 40) +
          {210-240} Bib.FormataTexto(' ', 31) + Chr(13) + Chr(10);

          wTotal := wTotal + QRemessaVAL_TITULO.Value;
          inc(wSequenciaLote);

          QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
            QRemessaCOD_CONTA_RECEBER_CAB.Value);
          QEnviadoBanco.ExecSQL;
          QRemessa.Next;
        end; //fim do while

        //********************* Trailer **********************
        {001-008} wstrS := wstrS + RMaskCGC_CPF('0', 7) + '5' +
        {009-017} Bib.FormataTexto(' ', 9) +
        {018-023} IntDecimais(IntToStr(wSequenciaLote + 1),6,0);//RMaskCGC_CPF(IntToStr(QRemessa.RecordCount), 6); //quantidade de titulos em lote
        {024-040} wstrS := wstrS + IntDecimais(RMaskCGC_CPF(FloatToStr(wTotal), 17), 17, 2); //valor total dos titulos em lote
        {041-046} wstrS := wstrS + RMaskCGC_CPF('0', 6) +
        {047-240} Bib.FormataTexto(' ', 194);

        FContasReceberParam.SDlg_Remessa.FileName := 'CBR' +
          FormatDateTime('YYYYMMDD', QRemessaDT_EMISSAO.Value) +
          IntDecimais(IntToStr(wSeqArquivo),2,0) + '.REM';
          //FormatDateTime('DDMM', Date) +
          //FormatDateTime('YY', QRemessaDT_VENCIMENTO.Value) + '.REM';
        FContasReceberParam.SDlg_Remessa.Filter :=
          'Arquivo de Remessa Sicoob/BB';
        FContasReceberParam.SDlg_Remessa.DefaultExt := '';
        FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

        if FContasReceberParam.SDlg_Remessa.Execute then
        begin
          AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
          Rewrite(F);
          Writeln(F, wstrS);
          CloseFile(F);
          DMOracle.DBCemapa.Commit;
          MessageDlg('Arquivo REMESSA Sicoob BB Gerado com Sucesso!',
            mtInformation, [mbOk], 0);
        end
        else
        begin
          DMOracle.DBCemapa.Rollback;
          MessageDlg('Arquivo REMESSA Sicoob não foi Gerado!', mtWarning,
            [mbOk], 0);
        end;
      except
        DMOracle.DBCemapa.Rollback;
        raise
          exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
          + #13 +
          'Verifique se não existem campos em branco no cadastro de bancos' + #13
          +
          'ou no cadastro de Clientes/Fornecedores.');
      end;
    end;
end;

procedure TFContasReceberCad.GeraRelatorioRetorno;
begin
  if FRRetornoRemessaBB = nil then
    FRRetornoRemessaBB := TFRRetornoRemessaBB.Create(Application);
  FRRetornoRemessaBB.QRLTitulo.Caption := 'Relatório sobre o Retorno da Remessa';
  FRRetornoRemessaBB.QRPrimario.Preview;
  DMContasReceber.CdRetornoRemessa.Close;
end;

procedure TFContasReceberCad.GeraRemessaCaixaSIGCB; //Vanessa 16/03/2016
var
  mNUM_CEDENTE: string;
  mNUM_CONVENENTE: string;
  mBrancos: string;
  mPrefixoTitulo: string;
  x, iSeq: Integer;
  mContaCaucao: string;
  mTipoInscricao: string;
  mSequencial: Integer;
  mSEQ_REMESSA: Real;
  s, wVal, wNsa: string;
  F: TextFile;
  mCodNossoNumero: string;
  wNumTitulo: string;
  iQtdRegLote: integer;
  wTotal: Real;
begin
  with DMContasReceber do
  begin
    try
      {-------HEADER DO ARQUIVO - REGISTRO 0-------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0000'; {004-007|04|LOTE DE SERVICO}
      s := s + '0'; {008-008|01|REGISTRO HEADER DE ARQUIVO}
      s := s + '         '; {009-017|09|USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '2'; {018-018|01|TIPO DE INSCRIÇÃO DA EMPRESA (1-CPF, 2-CGC)}

      wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 14);
      s := s + wVal; {019-032|14|N DE INSCRICAO DA EMPRESA}

      s := s + '00000000000000000000'; {033-052|04|uso exclusivo caixa}

      wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
      s := s + wVal; {053-057|05|AGENCIA MANTENEDORA DA CONTA}

      wVal := RMaskCGC_CPF(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text, 1);
      s := s + wVal; {058-058|01|DIGITO VERIFICADOR DA AGENCIA}

      wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 6);
      s := s + wVal; {059-064|06|NUMERO CONVENIO}

      s := s + '00000000'; {065-072|08|uso exclusivo caixa}

      wVal := copy(QRemessaDESC_FILIAL.Text +
        '                              ', 1, 30);
      s := s + wVal; {073-102|30|NOME DA EMPRESA}

      wVal := copy(QRemessaDESC_BANCO_AGENCIA.Text +
        '                              ', 1, 30);
      s := s + wVal; {103-132|30|NOME DO BANCO}

      s := s + '          '; {133-142|10|PARA USO RESERVADO DO BANCO}

      s := s + '1'; {143-143|01|CODIGO REMESSA/RETORNO 1-REM, 2-RET}

      wVal := Bib.LimpaString(DateToStr(DMOracle.DataServ), '/' );
      s := s + wVal; {144-151|08|DATA DE GERACAO DO ARQUIVO}

      wVal := FormatDateTime('HHMMSS', DMOracle.DataHoraServ);
      s := s + wVal; {152-157|06|HORA DE GERACAO DO ARQUIVO}

      wVal :=
        RMaskCGC_CPF(IntToStr(DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
          'ARQ_REM_CEF_SIGCB')), 6);
          s := s + wVal; {158-163|06|N SEQUENCIAL DO ARQUIVO}
          wNsa := wVal;

      s := s + '050'; {164-166|03|N DA VERSAO DO LAYOUT DO ARQUIVO}

      s := s + '00000'; {167-171|05|DENSIDADE DA GRAVAÇÃO DO ARQUIVO}

      s := s + '                    ';
      {172-191|20|PARA USO RESERVADO DO BANCO}
      s := s + 'REMESSA-PRODUCAO    ';
      {192-211|20|PARA USO RESERVADO DO BANCO}
      s := s + 'V232                ';  {212-215|04|versao do aplicativo - informacao vinda do banco}
      {212-231|69|PARA USO RESERVADO DO BANCO}
      s := s + '         '; {232-240|69|PARA USO RESERVADO DO BANCO}
      {-------FIM - HEADER DO ARQUIVO - REGISTRO 0-------}

      {--------------HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}
      s := s + Chr(13) + Chr(10); {QUEBRA DE LINHA}

      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0001'; {004-007|04|LOTE DE SERVIÇO}
      s := s + '1'; {008-008|01|REGISTRO HEADER DO LOTE}
      s := s + 'R'; {009-009|01|TIPO DE OPERACAO}
      s := s + '01'; {010-011|02|TIPO DE SERVICO}
      s := s + '00'; {012-013|02|USO DO BANCO} //VERSAO CAIXA
      s := s + '030'; {014-016|03|N DA VERSAO DO LAYOUT DO LOTE}
      s := s + ' '; {017-017|01|USO EXCLUSIVO FEBRABAN/CNAB}
      s := s + '2'; {018-018|01|TIPO DE INSCRICAO DA EMPRESA}

      wVal := RMaskCGC_CPF(QRemessaNUM_CGC.Text, 15);
      s := s + wVal; {019-033|15|N DE INSCRICAO DA EMPRESA}

      wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 6);
      s := s + wVal; {034-039|06|N DE INSCRICAO DA EMPRESA}

      s := s + '00000000000000'; {040-053|04|uso exclusivo caixa}

      wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
      s := s + wVal; {054-058|05|AGENCIA MANTENEDORA DA CONTA}

      wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text, 1, 1);
      s := s + wVal; {059-059|01|DIGITO VERIFICADOR DA AGENCIA}

      wVal :=
        RMaskCGC_CPF(formatCC(BIb.StrZero(QRemessaNUM_CONVENIO.Text,
        6)), 6);
      s := s + wVal; {060-065|12|NUMERO DA CONTA CORRENTE}

      s := s + '00000000'; {066-073|07|CODIGO DO MODELO PERSONALIZADO}

      wVal := copy(QRemessaDESC_FILIAL.Text +
        '                              ', 1, 30);
      s := s + wVal; {074-103|30|NOME DA EMPRESA}
      
        wVal := Bib.FormataTexto(' ', 80);
        {104-183|80| USO DO BANCO}
        s := s + wVal;
        wVal := RMaskCGC_CPF(wNsa, 8);
        {184-191|08| NUMERO DA REMESSA}
        s := s + wVal;
        wVal := Bib.LimpaString(DateToStr(DMOracle.DataServ), '/' );
        {192-199|08| DATA GRAVACAO}
        s := s + wVal;
        wVal := RMaskCGC_CPF('', 8);
        {200-207|08| DATA CREDITO}
        s := s + wVal;
        wVal := Bib.FormataTexto(' ', 33);
        {208-240|33| USO DO BANCO}
        s := s + wVal;

      {--------FIM - HEADER DE LOTE-----------BLOQUETO ELETRONICO------------}

      iSeq := 1;
      iQtdRegLote := 1; //2--> header e trailer
      while not QRemessa.Eof do
      begin
        s := s + Chr(13) + Chr(10);

      {-----------DETALHE SEGMENTO P /OBRIGATORIO/--------------}

        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}

        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);

        s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'P'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DO MOVIMENTO}

        wVal := RMaskCGC_CPF(Bib.StrZero(QRemessaCOD_AGENCIA.Text, 5), 5);
        s := s + wVal; {018-022|05|AGENCIA MANTENEDORA DA CONTA}

        wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text, 1, 1);
        s := s + wVal; {023-023|01|DIGITO VERIFICADOR DA AGENCIA}


        wVal := RMaskCGC_CPF(QRemessaNUM_CONVENIO.Text, 6);
        s := s + wVal; {024-029|06|CODIGO CONVENIO NO BANCO}

        s := s + '00000000000'; {030-040|11|uso exclusivo caixa}

        S := S + Bib.StrZero(QRemessaCARTEIRA.Text,2); {041-042|2|CARTEIRA}

        wVal := Bib.LimpaString(QRemessaCOD_NOSSO_NUMERO.Text, '-');
        s := s + copy(wVal,3,15); {043-057|15|NOSSO NUMERO}

        s := s + '1'; {058-058|01 - REGISTRADA|TIPO DE COBRANÇA}

        wVal := copy(QRemessaCOD_FORMA_CADAST_BANCO.Text + '0', 1, 1);
        s := s + wVal; {059-059|01|FORMA DE CADASTRAMENTO DO TITULO NO BANCO}

        wVal := copy(QRemessaCOD_TIPO_DOCUMENTO.Text,1,1);
        s := s + wVal;
        {060-060|01|TIPO DE DOCUMENTO (1-TRADICIONAL 2-ESCRITURAL)}

        wVal := copy(QRemessaCOD_IDENTIF_EMISSAO_BLOQUETO.Text, 1, 1);
        s := s + wVal; {061-061|01|IDENTIFICAÇÃO DA EMISSÃO DO BLOQUETO)}

        s := s + '0'; {062-062|01|IDENTIFICAÇÃO DA DISTRIBUIÇÃO||0 - POSTAGEM PELO CEDENTE)}

        s := s + 'NF '; {063-065|03|TIPO DE DOCUMENTO DE COBRANCA}
        s := s + copy(QRemessaNUM_TITULO.Text + '            ', 1, 12); {066-077|12|NUMERO DO DOCUMENTO DE COBRANCA}

        wVal := FormatDateTime('DDMMYYYY', QRemessaDT_VENCIMENTO.Value);
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {078-085|08|DATA DE VENCIMENTO DO TITULO}

        wVal := StrZero(QRemessaVAL_TITULO.Value, 15, 2);
        s := s + wVal; {086-100|13|02|VALOR NOMINAL DO TITULO}

        wVal := '00000';
        s := s + wVal; {101-105|05|AGENCIA MANTENEDORA DA CONTA}

        wVal := copy(QRemessaDIGITO_VERIFICADOR_AGENCIA.Text, 1, 1);
        s := s + wVal; {106-106|01|DIGITO VERIFICADOR DA AGENCIA}

        s := s + '23'; {107-108|02|ESPECIE DO TITULO}

        wVal := copy(QRemessaCOD_IDENTIF_ACEITO.Text + ' ', 1, 1);
        s := s + wVal;
        {109-109|01|IDENTIFICACAO DE TITULO ACEITO/NAO ACEITO (A-ACEITO N-NAO ACEITO)}

        wVal := FormatDateTime('DDMMYYYY', (QRemessaDT_EMISSAO.Value));
        wVal := copy(wVal + '        ', 1, 8);
        s := s + wVal; {110-117|08|DATA DE EMISSAO DO TITULO}
        s := s + '1'; {118-118|01|CODIGO DE JUROS DE MORA}

        wVal := FormatDateTime('DDMMYYYY', (QRemessaDT_VENCIMENTO.Value + 1));
        s := s + wVal; {119-126|08|DATA DE VENCIMENTO DO TITULO - DATA MORA}

        if (QRemessaIND_TIPO_JURO.Text = 'VALOR') then
          wVal := IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
            DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
            (QRemessaVal_Titulo.Value / 100)), 15, 2)
        else
          wVal := StrZero(QRemessaPERC_TAXA.Value, 15, 2);
        s := s + wVal; {127-141|13|02|VALOR TAXA MENSAL}

        s := s + '0'; {142-142|01|CODIGO DO DESCONTO 1}
        s := s + '00000000'; {143-150|08|DATA DO DESCONTO 1}
        s := s + '000000000000000'; {151-165|13|02|VALOR/PERCENTUAL A SER CONCEDIDO}
        s := s + '000000000000000'; {166-180|13|02|VALOR DO IOF A SER RECOLHIDO}
        s := s + '000000000000000'; {181-195|13|02|VALOR DO ABATIMENTO}

        s := s + 'NF '; {196-198|03|TIPO DE DOCUMENTO}
        s := s + copy(QRemessaNUM_TITULO.Text + '            ', 1, 12);
        {199-209|12|NUMERO DO DOCUMENTO DE COBRANCA}
        s := s + Bib.FormataTexto(' ', 10); {210-220|10|USO EXCLUSIVO DO BANCO}

        wVal := copy(QRemessaCOD_PROTESTO.Text, 1, 1);
        if QRemessaCOD_PROTESTO.Text = '1' then //Na tela Dias corridos
          s := s + '1'; // Protestar
        if QRemessaCOD_PROTESTO.Text = '2' then //Na tela Dias uteis
          s := s + '1'; //Protestar
        if QRemessaCOD_PROTESTO.Text = '0' then //Na tela Não protestar
          s := s + '3'; //Não protestar
        {221-221|01|CODIGO PARA PROTESTO 1-DIAS CORRIDOS, 2-DIAS UTEIS, 3-NAO PROTESTA} //Para a Caixa SIGCB muda os códigos

        wVal := RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2); //de 2 a 5 dias = dias uteis || mais de 5 dias é dias corridos.
        s := s + wVal; {222-223|02|NUMERO DE DIAS PARA PROTESTO}
        s := s + '1'; {224-224|01|CODIGO PARA BAIXA/DEVOLUCAO (1-BAIXAR/DEV, 2-NAO BAIXAR/NAO DEVOLVER)}
        s := s + '029'; {225-227|03|NUMERO DE DIAS PARA BAIXA/DEVOL (DIAS CORRIDOS)}
        s := s + '09'; {228-229|02|CODIGO DA MOEDA (REAL)}
        s := s + '0000000000 '; {230-240|10|USO EXCLUSIVO DO BANCO}

        {-----FIM - DETALHE SEGMENTO P /OBRIGATORIO/--------------}

        s := s + Chr(13) + Chr(10); {QUEBRA DE LINHA}

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;

        {-----------DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

        wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
        s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
        s := s + '0001'; {004-007|04|LOTE DE SERVICO}
        s := s + '3'; {008-008|01|REGISTRO DETALHE}
        wVal := RMaskCGC_CPF(inttostr(iSeq), 5);
        s := s + wVal; {009-013|05|N SEQUENCIAL DO REG. NO LOTE}
        s := s + 'Q'; {014-014|01|COD. SEGMENTO DO REG. DETALHE}
        s := s + ' '; {015-015|01|USO EXCLUSIVO FEBRABAN/CNAB}
        s := s + '01'; {016-017|02|CODIGO DE MOVIMENTO}
        wVal := Copy(QRemessaIND_FISICA_JURIDICA.Text + ' ', 1, 1);
        if wVal = 'F' then
          wVal := '1'
        else if wVal = 'J' then
          wVal := '2'
        else
          wVal := '0';
        s := s + wVal; {018-018|01|TIPO DE INSCRICAO}
        wVal := RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 15);
        s := s + wVal; {019-033|15|N DE INSCRICAO}
        wVal := copy(bib.removeacentos(QRemessaNOME.Text) +
          '                                        ', 1, 40);
        s := s + wVal; {034-073|40|NOME}
        wVal := copy(bib.removeacentos(QRemessaDESC_ENDERECO_COBRANCA.Text) + '                                        ', 1, 40);
        s := s + wVal; {074-113|40|ENDERECO}
        wVal := copy(bib.removeacentos(QRemessaDESC_BAIRRO.Text) + '               ', 1, 15);
        s := s + wVal; {114-128|15|BAIRRO}
        wVal := copy(RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
          '     ', 1, 8);
        s := s + wVal; {129-136|08|CEP}
        wVal := copy(bib.removeacentos(QRemessaDESC_CIDADE_COBRANCA.Text) + '               ',
          1, 15);
        s := s + wVal; {137-151|15|CIDADE}
        wVal := copy(QRemessaDESC_ESTADO_COBRANCA.Text + '  ', 1, 2);
        s := s + wVal; {152-153|02|UNIDADE DA FEDERACAO}
        wVal := '0';
        s := s + wVal; {154-154|01|TIPO DE INSCRICAO}
        wVal := RMaskCGC_CPF('', 15);
        s := s + wVal; {155-169|15|N DE INSCRICAO}
        wVal := '                                        ';
        s := s + wVal; {170-209|40|NOME DO SACADOR/AVALISTA}
        s := s + '            '; {210-221|012|CAIXA ECONOMICA}
        s := s + '                   '; {222-240|19|CAIXA ECONOMICA}

        {-----FIM - DETALHE SEGMENTO Q /OBRIGATORIO/--------------}

        iSeq := iSeq + 1;
        iQtdRegLote := iQtdRegLote + 1;

        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end;

      QRemessa.First;

      s := s + Chr(13) + Chr(10);

      {------------TRAILER DE LOTE--------------------}
      
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '0001'; {004-007|04|LOTE DE SERVICO}
      s := s + '5'; {008-008|01|REGISTRO TRAILER DE LOTE}
      s := s + Bib.FormataTexto(' ', 9); {009-017|09|USO EXCLUSIVO DO BANCO}

      wVal := RMaskCGC_CPF(IntToStr(iQtdRegLote + 1), 6);
      s := s + wVal; {018-023|06|QUANTIDADE DE REGISTROS DO LOTE}
      s := s + RMaskCGC_CPF(IntToStr(QRemessa.RecordCount), 6); {024-029|06|QUANTIDADE DE TITULOS EM COBRANCA}

      wTotal := 0;
      while not QRemessa.Eof do
      begin
        wTotal := wTotal + QRemessaVAL_TITULO.Value;
        QRemessa.Next;
      end;

      s := s + RMaskCGC_CPF(FloatToStr(wTotal), 17); {030-046|17|VALOR TOTAL BOLETOS}

      s := s + Bib.StrZero2(0,46,0); {047-092||COBRANCA CAUSIONADA E DESCONTADA}
      s := s + Bib.FormataTexto(' ', 31);  {093-123|031|USO FEBRABAN}
      s := s + Bib.FormataTexto(' ', 117); {124-240|117|USO FEBRABAN}

      {------------FIM - TRAILER DE LOTE--------------------}

      s := s + Chr(13) + Chr(10);

      {------------TRAILER DE ARQUIVO--------------------}
      wVal := RMaskCGC_CPF(QRemessaCOD_BANCO.Text, 3);
      s := s + wVal; {001-003|03|CODIGO DO BANCO NA COMPENSACAO}
      s := s + '9999'; {004-007|04|LOTE DE SERVICO}
      s := s + '9'; {008-008|01|REGISTRO TRAILER DE LOTE}
      s := s + Bib.FormataTexto(' ', 9); {009-017|09|USO EXCLUSIVO DO BANCO}

      wVal := '000001';//RMaskCGC_CPF(IntToStr(iQtdRegLote + 1), 6);
      s := s + wVal; {018-023|06|QUANTIDADE DE REGISTROS DO LOTE}
      iSeq := iSeq + 3;
      wVal := RMaskCGC_CPF(inttostr(iSeq), 6);
      s := s + wVal;//RMaskCGC_CPF(IntToStr(QRemessa.RecordCount), 6); {024-029|06|QUANTIDADE DE TITULOS EM COBRANCA}
      s := s + Bib.FormataTexto(' ', 6);  {030-035|031|USO FEBRABAN}
      s := s + Bib.FormataTexto(' ', 205); {36-240|117|USO FEBRABAN}

      {------------FIM - TRAILER DE ARQUIVO--------------------}

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, S);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA CNAB240 VERSÃO 232 Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end;
    except
      MessageDlg('Sem Movimento nesse Periodo', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure TFContasReceberCad.RetornoRemessaCaixaSigcb;
var
  wCont: integer;
  F: TextFile;
  S: string;
  wstrErro1, wstrErro2, wstrErro3, wstrErro4, wstrErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero, wCodMov: string;
begin
  wVal_Baixa := 0;
  wVal_Desc := 0;
  wPgto_Juro := 0;
  wVal_Juro := 0;
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 8, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 143, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if (Copy(Trim(S), 103, 23) <> 'C ECON FEDERAL         ') then
       Raise exception.Create('Nome do banco invalido!');
    Readln(F, S); //Le a proxima linha do arquivo
    Readln(F, S);
    while (Trim(S) <> '') do // Arquivo contém registro para processar.
    begin
      // Condições possiveis para executar baixa do titulo.
      if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'T')) then
        //identificacao de registro transacao
      begin
        wstrErro1 := RetornaErroCaixaSigcb(Copy(Trim(S), 214, 2));
        wstrErro2 := RetornaErroCaixaSigcb(Copy(Trim(S), 216, 2));
        wstrErro3 := RetornaErroCaixaSigcb(Copy(Trim(S), 218, 2));
        //wstrErro4 := RetornaErroCaixaSigcb(Copy(Trim(S), 220, 2)); //arrumar - Comentei porque as posições do arquivo retorno veiram em branco. Vanessa 25/06/2016
        //wstrErro5 := RetornaErroCaixaSigcb(Copy(Trim(S), 222, 2));

        wCodMov := Copy(Trim(S), 16, 2);

        case StrToInt(Copy(Trim(S), 16, 2)) of
          2:  begin
                wstrErro5 := 'Entrada Confirmada';
              end;
          6:  begin
                wstrErro5 := 'Liquidação';
              end;
          9:  begin
                wstrErro5 := 'Baixa';
              end;
          28: begin
                wstrErro5 := 'Débito de Tarifas/Custas';
              end;
        end;

        With DMContasReceber do
        begin
         if wstrErro5 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 40, 17) + '   ' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '   ' + Copy(Trim(S), 222, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro5;
            CdRetornoRemessa.Post;
          end;
          if wstrErro1 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 40, 17) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 214, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro1;
            CdRetornoRemessa.Post;
          end;
          if wstrErro2 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 40, 17) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 216, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro2;
            CdRetornoRemessa.Post;
          end;
          if wstrErro3 <> '' then
          begin
            CdRetornoRemessa.Append;
            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 40, 17) + '-' + Copy(S, 57, 1);
            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 218, 2);
            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro3;
            CdRetornoRemessa.Post;
          end;
         // if wstrErro4 <> '' then
//          begin
//            CdRetornoRemessa.Append;
//            CdRetornoRemessaDESC_TITULO.Value := Copy(S, 40, 17) + '-' + Copy(S, 57, 1);
//            CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 149, 40);
//            CdRetornoRemessaDESC_REGISTRO.Value := Copy(S, 38, 20);
//            CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 16, 2) + '-' + Copy(Trim(S), 220, 2);
//            CdRetornoRemessaDESC_MENSAGEM.Value := wstrErro4;
//            CdRetornoRemessa.Post;
//          end;
        end;

        if StrToInt(Copy(Trim(S), 16, 2)) in [06, 09, 17] then
        begin
          wVal_Baixa := 0;
          wNNumero := Trim(Copy(S, 38, 19) + '-' + Copy(S, 57, 1));
          if StrToFloat(Copy(S, 82, 15)) <> 0 then
            // Valor recebido + valor despesa de cobranca
            wVal_Baixa := (StrToFloat(Copy(S, 82, 15)) / 100) +
              (StrToFloat(Copy(S, 199, 15)) / 100)
          else
            raise exception.Create('Titulo com valor p/baixar igual a zero!');

          Readln(F, S); //Le a proxima linha do arquivo
          if ((Copy(Trim(S), 8, 1) = '3') and (Copy(Trim(S), 14, 1) = 'U')) then //identificacao de registro transacao
          begin
            wVal_Juro := 0;
            wVal_Desc := 0;
            wVal_Baixa := 0;
            wpgto_juro := 0;
            wDtLiquida := Copy(S, 138, 02) + '/' + Copy(S, 140, 02) + '/' +
              Copy(S, 142, 04);
            wDtCredito := Copy(S, 146, 02) + '/' + Copy(S, 148, 02) + '/' +
              Copy(S, 150, 04);

            //Verifica se valor recebido é diferente de zero.
            if StrToFloat(Copy(S, 78, 15)) <> 0 then // Valor pago pelo sacado
              wVal_Baixa := (StrToFloat(Copy(S, 78, 15)) / 100);
            if StrToFloat(Copy(S, 18, 15)) <> 0 then
              // Juros de mora/multa/encargos
            begin
              wVal_Juro := StrToFloat(Copy(S, 18, 15)) / 100;
              wpgto_juro := StrToFloat(Copy(S, 18, 15)) / 100;
            end;

            if StrToFloat(Copy(S, 33, 15)) <> 0 then // Desconto concedido
              wVal_Desc := StrToFloat(Copy(S, 33, 15)) / 100 +
                StrToFloat(Copy(S, 48, 15)) / 100; // Valor do abatimento
          end;
          // Chama procedimento para baixa de titulo.
          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            copy(wNNumero,1,17), wDtLiquida, wDtCredito);
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end;
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.AvisoVencimentoBoletos1Click(Sender: TObject);
var
  wComando : String;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[42].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    with DMContasReceber do
    begin
    if ((trim(FContasReceberParam.Me42QtdDias.Text) = '') or
        (strtoint(trim(FContasReceberParam.Me42QtdDias.Text)) > 30)  or
        (strtoint(trim(FContasReceberParam.Me42QtdDias.Text)) <= 0)) then
      raise exception.Create('Quantidade de dias inválido.')
    else
      DMContasReceber.QEmailBoletoaVencer.Close;
      if Trim(FContasReceberParam.Me42QtdDias.Text) <> '' then
       QEmailBoletoaVencer.SetVariable('QTD_DIAS_VENCER',FContasReceberParam.Me42QtdDias.Text)
      else
       QEmailBoletoaVencer.SetVariable('QTD_DIAS_VENCER', Null);
       QEmailBoletoaVencer.Open;

      if QEmailBoletoaVencer.RecordCount <= 0 then //mostra quantos emails serao enviados
        ShowMessage('Nenhum boleto vencerá dentro de ' + FContasReceberParam.Me42QtdDias.Text + ' dias.')
      else
        if MessageDlg('Serão enviados ' + IntToStr(QEmailBoletoaVencer.RecordCount) +
         ' e-mails. Deseja continuar?', mtConfirmation,
            [mbYes, mbNo],0) = mrYes then
        begin
          QEmailBoletoaVencer.First;
          while not QEmailBoletoaVencer.Eof do
          begin
            //QRBloqueto.Close;
            //QRBloqueto.SetVariable('Numero_Titulos','1=1');
            //QRBloqueto.SetVariable('COD_CONTA_RECEBER', QEmailBoletoaVencerCOD_CONTA_RECEBER_CAB.Text);
            //Seleciona_Banco_Emissao();
            EnviaEmailBoletoAvencer();
            With DMOracle do
            Begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_AVISO_BOLETO =' + QuotedStr('S') +' WHERE COD_CONTA_RECEBER_CAB = ' + QEmailBoletoaVencerCOD_CONTA_RECEBER_CAB.Text;
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
            End;
            DMOracle.DBCemapa.Commit;
            QEmailBoletoaVencer.Next;
          end;
            ShowMessage('E-mails enviados com sucesso.');
        end;
    end;
  end; //end do FContasReceberParam
end;

//procedure TFContasReceberCad.Seleciona_Banco_Emissao;
//begin
//  dmcontasreceber.QRBloqueto.Open;
//  if ((DMContasReceber.QEmailBoletoaVencerCod_Banco.Value = 104) and
//      (DMParamSistema.QParamSistemaDESC_LAYOUT_CAIXA.Text = 'SICOB')) then  // Caixa Economica
//  begin
//    if FRBloqueto_CEF = nil Then //CAIXA SICOB
//    begin
//      FRBloqueto_CEF := TFRBloqueto_CEF.Create(Application);
//      EnviaEmailBoletoAvencer(FRBloqueto_CEF.QRPrimario);
//      FRBloqueto_CEF := nil;
//    end
//    else if ((DMContasReceber.QEmailBoletoaVencerCod_Banco.Value = 104) and
//            (DMParamSistema.QParamSistemaDESC_LAYOUT_CAIXA.Text = 'SIGCB')) then
//    begin
//      if FRBloqueto_CEF_SIGCB = nil Then
//      begin
//        FRBloqueto_CEF_SIGCB := TFRBloqueto_CEF_SIGCB.Create(Application);
//        EnviaEmailBoletoAvencer(FRBloqueto_CEF_SIGCB.QRPrimario);
//        FRBloqueto_CEF := nil;
//      end;
//    end;
//    dmcontasreceber.QRBloqueto.close;
//  end;
//end;

//procedure TFContasReceberCad.EnviaEmailBoletoAvencer(pBoleto: TQuickRep);
procedure TFContasReceberCad.EnviaEmailBoletoAvencer();
var
  wMensagem, wAnexo : String;
begin
  //wAnexo := '';//bib.PegaTempDir + 'bloqueto' + FormatDateTime('DDMMYYYYHHMMSSZZZ',NOW)+'.pdf';
  try
    //dmcontasreceber.GravaBoletoTemp(pBoleto, wAnexo);
    if FEnviaEmail = Nil then
      FEnviaEmail := TFEnviaEmail.Create(Application);
      FEnviaEmail.passunto_email := 'AVISO PRÉVIO DE VENCIMENTO DE BOLETO NN ' +
        DMContasReceber.QEmailBoletoaVencerCOD_NOSSO_NUMERO.Text;

      wMensagem :=
      'Seu Boleto nº: '
        + DMContasReceber.QEmailBoletoaVencerNUM_TITULO.Text + '/' + DMContasReceber.QEmailBoletoaVencerNUM_PARCELA.Text

        + '<p>' + 'Nosso Número: ' + DMContasReceber.QEmailBoletoaVencerCOD_NOSSO_NUMERO.Text + '</P>'

        + '<p>' + 'Valor de: R$ '  + floattostr(DMContasReceber.QEmailBoletoaVencerVAL_TITULO.value) + '</P>'

        + '<p>' + 'Vencerá dia: '  + DMContasReceber.QEmailBoletoaVencerDT_VENCIMENTO.text + '</p><br />'
        
        + '<b>' + 'Att.' + '</b><br />' + DMContasReceber.QEmailBoletoaVencerDESC_FILIAL.Text

        + '<font size="1">'
        +     '<p>' + 'Mensagem Automática Sistema Cemapa (45) 3264-3773' + '</p>'
        +  '</font>';

      if DMContasReceber.QEmailBoletoaVencerDESC_E_MAIL1.Text <> '' then
      begin
        FEnviaEmail.pMostraMsgConclusao := false;
        FEnviaEmail.edEmail.Text := DMContasReceber.QEmailBoletoaVencerDESC_E_MAIL1.Text;
        FEnviaEmail.pmensagem_email := wMensagem;
        Fenviaemail.caminhoAnexo := '';
        FEnviaEmail.BtEnviarClick(Self);
      end;
  Except
    on e: Exception do
      MessageDlg('Erro no envio de e-mail:' + Chr(13) + e.Message, mtError, [mbOk], 0);
  end;
end;

procedure TFContasReceberCad.RetornoRemessaBBSicoob;
var
  wCont, wCont1: integer;
  F: TextFile;
  S: string;
  wErro1, wErro2, wErro3, wErro4, wErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero: string;
begin
  if OpenDialog1.Execute then { Mostra caixa de dialogo}
    begin
      wCont1 := 0;
      AssignFile(F, OpenDialog1.FileName); {Pega arquivo selecionado em dialogo box}
      Reset(F);
      Readln(F, S); {Le a primeira linha do arquivo }

      if Copy(Trim(S), 1, 3) <> '756' then
        raise exception.Create('Banco Inválido.');
      if Copy(Trim(S), 8, 1) <> '1' then
        raise exception.Create('Identificação do Registro Header inválido.');
      if Copy(Trim(S), 9, 1) <> 'T' then //T = retorno
        raise exception.Create('Não é um arquivo de Retorno.');
      if Copy(Trim(S), 10, 7) <> '0000000' then
        raise exception.Create('Retorno Inválido');

      Readln(F, S); //Le a proxima linha do arquivo

      //Detalhes*********************
      while ((Trim(S) <> '') and (Copy(Trim(S), 8, 1) = '3')) do // Arquivo contém registro para processar.
      begin
        // Condições possiveis para executar baixa do titulo.
        if (StrToInt(Copy(Trim(S), 16, 2)) in [6, 15, 17]) then
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;

          wDtLiquida := Copy(S, 75, 02) + '/' + Copy(S, 77, 02) + '/' + Copy(S, 79, 04);
          wDtCredito := wDtLiquida;
          wNNumero := Copy(S, 41, 17); //Nosso Numero

          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 83, 15)) <> 0 then // Valor recebido
            wVal_Baixa := StrToFloat(Copy(S, 83, 15)) / 100
          else
            ShowMessage('Título com NN: ' + wNNumero + ' zerado.');

          if (StrToInt(Copy(Trim(S), 16, 2)) in [02,04,05,06,09,10,11,12,13,14,17,19,20,23,24,25,26,27,28,29,30]) then
          begin
            if (Copy(Trim(S), 16, 2) <> '') or (Copy(Trim(S), 215, 2) <> '00') then
              wErro1 := RetornaErroBBSicoob(Copy(Trim(S), 16, 2), Copy(Trim(S), 215, 2));
          end;

          With DMContasReceber do
          begin
            if wErro1 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value :=  Copy(S, 41, 17);
              CdRetornoRemessaDESC_CLIENTE.Value := Copy(S, 144, 40);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 16, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 215, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro1;
              CdRetornoRemessa.Post;
            end;
            wErro1 := '';
          end;

          ReadLn(F, S); //passa para a linha do U

          if StrToFloat(Copy(S, 18, 15)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 18, 15)) / 100;
            wpgto_juro := StrToFloat(Copy(S, 18, 15)) / 100;
            wVal_baixa := wVal_baixa + wPgto_Juro;
          end;

          BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
            wNNumero, wDtLiquida, wDtCredito); // Chama procedimento para baixa de titulo.
           inc(wCont1);
        end; //fim baixa titulo
        ReadLn(F, S); // Pula para proximo registro no arquivo texto.
      end;//fim do while
    CloseFile(F); // Fecha arquivo aberto.
  end;// Fim do begin OpenDialog.
end;



procedure TFContasReceberCad.GeraRemessaCresol;
var
  wstrS: string;
  wstrCodEmpresa: string;
  wintContador: Integer;
  wintSeqArquivo: Integer;
  F: TextFile;
  wDesconto: Real;
begin
  with DMContasReceber do
  begin
    try
      wintContador := 2;
      wstrS := '';
      wstrCodEmpresa := '';

      wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_CRESOL');
      wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
        IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
        IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
        + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);

      //REGISTRO HEADER
      {001-026} wstrS := '01REMESSA01COBRANCA       ' +
          //IntDecimais(Bib.StrZero(QRemessaNUM_CONVENIO.Text, 20), 20, 0) +
      {027-046} Intdecimais(Bib.StrZero(QRemessaNUM_COD_EMPRESA.Text, 20), 20, 0) +
      {047-076} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
      {077-079} '133CRESOL         ' +
      {095-110} FormatDateTime('DDMMYY', Date) + Bib.FormataTexto(' ', 8) +
        '  ' +
      {111-117} IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
      {118-400} Bib.FormataTexto(' ', 277) + '000001' + Chr(13) + Chr(10);

      //REGISTRO DETALHE
      while not QRemessa.Eof do
      begin
//        {001-037} wstrS := wstrS + '1' + RMaskCGC_CPF(' ', 19) + wstrCodEmpresa +
        {001-037} wstrS := wstrS + '1' + Bib.FormataTexto(' ', 19) + wstrCodEmpresa +
        {038-062} RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 25) +
        {063-065} Bib.FormataTexto(' ',3);

        {066-066} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + '2'
                  else
                    wstrS := wstrS + '0';

        {067-070} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + intdecimais(QRemessaPERC_JURO_MORA.Text,4,2)
                  else
                    wstrS := wstrS + '0000';

        {071-082} wstrS := wstrS + RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
        {083-106} RMaskCGC_CPF('0', 10) + '2 ' + Bib.FormataTexto(' ', 11) + '2' +
        {107-120} '  01' + RMaskCGC_CPF(QRemessaNUM_TITULO.Text, 10) +
        {121-126} FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
        {127-139} IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
        {140-149} '        02';
        {150-150} if (QRemessaIND_ACEITE.Text = 'SIM') then
                    wstrS := wstrS + 'A'
                  else
                    wstrS := wstrS + 'N';
        {151-156} wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_EMISSAO.Value);
        {157-160} if QRemessaNR_DIAS_PROTESTO.Text <> '' then
                    wstrS := wstrS + '06' + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2)
                  else //ALTERADO MARCOS 15/12/2010
                    wstrS := wstrS + '0000';

        {161-173}   wstrS := wstrS + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                    DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                    (QRemessaVal_Titulo.Value / 100)), 13, 2);
        {174-179} wstrs := wstrS + RMaskCGC_CPF('0', 6);

        {180-192} wstrs := wstrS + RMaskCGC_CPF('0', 13); //valor do desconto

        {193-205} wstrS := wstrS + RMaskCGC_CPF('0', 13); //valor do IOF
        {206-218} wstrS := wstrS + RMaskCGC_CPF('0', 13);
        //valor do abatimento a ser concedido ou cancelado
        {219-220} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                    wstrS := wstrS + '01'
                  else if (QRemessaIND_FISICA_JURIDICA.Text = 'J') then
                    wstrS := wstrS + '02'
                  else
                    wstrS := wstrS + '98';
           
        {221-234} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
        {235-274} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
        {275-314} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
        {315-326} Bib.FormataTexto(' ', 12) +
        {327-334} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +
        {335-394} Bib.FormataTexto(' ', 60) +
        {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);

        Inc(wintContador);
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end; //fim do while

      //registro trailler
      wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
      RMaskCGC_CPF(IntToStr(wintContador), 6);

      FContasReceberParam.SDlg_Remessa.FileName := 'REM' +
        FormatDateTime('DDMMYYYY', Date) + '.rem';
      FContasReceberParam.SDlg_Remessa.Filter :=
        'Arquivo Remessa Cresol';
      FContasReceberParam.SDlg_Remessa.DefaultExt := '';
      FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, wstrS);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo REMESSA CRESOL Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo REMESSA CRESOL não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.GeraRemessaUniprime;
var
  wstrS: string;
  wstrCodEmpresa: string;
  wintContador: Integer;
  wintSeqArquivo: Integer;
  F: TextFile;
  wDesconto, wJuro: Real;
begin
  with DMContasReceber do
  begin
    try
      wintContador := 2;
      wstrS := '';
      wstrCodEmpresa := '';

      wintSeqArquivo := DMSequencia.Sequencia(QRemessaCOD_FILIAL.Value,
        'ARQ_REM_UNIPRIME');
      wstrCodEmpresa := '0' + IntDecimais(QRemessaCARTEIRA.Text, 3, 0) +
        IntDecimais(QRemessaCOD_AGENCIA.Text, 5, 0) +
        IntDecimais(RMaskCGC_CPF(QRemessaNUM_CONTA_CORRENTE.Text, 7), 7, 0)
        + IntDecimais(QRemessaDIG_VERIFICADOR_AGENCIA_CONTA.Text, 1, 0);

      //REGISTRO HEADER
      {001-026} wstrS := '01REMESSA01COBRANCA       ' +
          //IntDecimais(Bib.StrZero(QRemessaNUM_CONVENIO.Text, 20), 20, 0) +
      {027-046} Intdecimais(Bib.StrZero(QRemessaNUM_COD_EMPRESA.Text, 20), 20, 0) +
      {047-076} Bib.FormataTexto(UpperCase(QRemessaDESC_FILIAL.Text), 30) +
      {077-094} '099UNIPRIME       ' +
      {095-110} FormatDateTime('DDMMYY', Date) + Bib.FormataTexto(' ', 8) +
        'MX' +
      //vitorteste{111-117} IntDecimais(IntToStr(wintSeqArquivo), 7, 0) +
         {111-117} '       '+
      {118-400} Bib.FormataTexto(' ', 277) + '000001' + Chr(13) + Chr(10);

      //REGISTRO DETALHE
      while not QRemessa.Eof do
      begin
        {001-037} wstrS := wstrS + '1' + Bib.FormataTexto(' ', 19) + wstrCodEmpresa +
        {038-065} Bib.FormataTexto(' ', 25) + '   ';

        {066-066} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + '2'
                  else
                    wstrS := wstrS + '0';

        {067-070} if (QRemessaPERC_JURO_MORA.Text <> '') or (QRemessaPERC_JURO_MORA.Value <> 0) then
                    wstrS := wstrS + intdecimais(QRemessaPERC_JURO_MORA.Text,4,2)
                  else
                    wstrS := wstrS + '0000';

        {071-082} wstrS := wstrS + RMaskCGC_CPF(QRemessaCOD_NOSSO_NUMERO.Text, 12) +
        {083-106} Bib.FormataTexto(' ', 10) + '2 ' + Bib.FormataTexto(' ', 11) + ' ' +
        {107-120} '  01' + Bib.FormataTexto(UpperCase(QRemessaNUM_TITULO.Text), 10) +
        {121-126} FormatDateTime('DDMMYY', QRemessaDT_VENCIMENTO.Value) +
        {127-139} IntDecimais(QRemessaVAL_TITULO.Text, 13, 2) +
        {140-149} '        01';
        {150-150} if (QRemessaIND_ACEITE.Text = 'SIM') then
                    wstrS := wstrS + 'A'
                  else
                    wstrS := wstrS + 'N';
        {151-156} wstrS := wstrS + FormatDateTime('DDMMYY', QRemessaDT_EMISSAO.Value);
        {157-160} if QRemessaNR_DIAS_PROTESTO.Text <> '' then
                    wstrS := wstrS + '07' + RMaskCGC_CPF(QRemessaNR_DIAS_PROTESTO.Text, 2)   //Na homoloçao foi avisado que a agencia 099-x nao tem pro
                    //protesto(06), mas sim negativação que é código 07  - Vitor Longo
                  else
                    wstrS := wstrS + '0000';

                    // RESPONSAVEL PELO BANCO RECLAMA DA DIFERENCA DE 1 CENTAVO PELO PERCENTUAL DO JURO, POR ISSO
                    // FOI CRIADO UMA OPCAO COM ARREDONDAMENTO
                    if DMParamSistema.CodEmpresa <> 'PURINA' then
        {161-173}      wstrS := wstrS + IntDecimais(FloatToStr((QRemessaPERC_JURO_BLOQUETO.Value /
                            DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                            (QRemessaVal_Titulo.Value / 100)), 13, 2)
                    else
                    begin
                      wstrS := wstrS + IntDecimais(FloatToStr(Round(QRemessaPERC_JURO_BLOQUETO.Value /
                            (DMoracle.DiasNoMes(QRemessaDT_VENCIMENTO.Value)) *
                            (QRemessaVal_Titulo.Value))/100), 13, 2);
                    end;


        {174-179} wstrs := wstrS + RMaskCGC_CPF('0', 6);

        {180-192} wstrs := wstrS + RMaskCGC_CPF('0', 13); //valor do desconto

        {193-205} wstrS := wstrS + RMaskCGC_CPF('0', 13); //valor do IOF
        {206-218} wstrS := wstrS + RMaskCGC_CPF('0', 13);
        //valor do abatimento a ser concedido ou cancelado
        {219-220} if (QRemessaIND_FISICA_JURIDICA.Text = 'F') then
                    wstrS := wstrS + '01'
                  else if (QRemessaIND_FISICA_JURIDICA.Text = 'J') then
                    wstrS := wstrS + '02'
                  else
                    wstrS := wstrS + '98';
           
        {221-234} wstrS := wstrS + RMaskCGC_CPF(QRemessaNUM_CGC_CPF.Text, 14) +
        {235-274} Bib.FormataTexto(UpperCase(QRemessaNOME.Text), 40) +
        {275-314} Bib.FormataTexto(UpperCase(QRemessaDESC_ENDERECO_COBRANCA.Text), 40) +
        {315-326} Bib.FormataTexto(' ', 12) +
        {327-334} RMaskCGC_CPF(QRemessaDESC_CEP_COBRANCA.Text, 8) +

        // Vitorteste{335-394} Bib.FormataTexto(' ', 60) +
        {335-354} Bib.FormataTexto(UpperCase(QRemessaDESC_BAIRRO.Text), 20)  +  //bairro
        {355-392} Bib.FormataTexto(UpperCase(QRemessaDESC_CIDADE_COBRANCA.Text), 38)  +  //cidade
        {393-394} Bib.FormataTexto(UpperCase(QRemessaDESC_ESTADO_COBRANCA.Text), 2)  +  //UF
        {395-400} RMaskCGC_CPF(IntToStr(wintContador), 6) + Chr(13) + Chr(10);

        Inc(wintContador);
        QEnviadoBanco.SetVariable('COD_CONTA_RECEBER_CAB',
          QRemessaCOD_CONTA_RECEBER_CAB.Value);
        QEnviadoBanco.ExecSQL;
        QRemessa.Next;
      end; //fim do while

      //registro trailler
      wstrS := wstrS + '9' + Bib.FormataTexto(' ', 393) +
      RMaskCGC_CPF(IntToStr(wintContador), 6);

      FContasReceberParam.SDlg_Remessa.FileName := 'REM' +
        FormatDateTime('DDMMYYYY', Date) + '.rem';
      FContasReceberParam.SDlg_Remessa.Filter :=
        'Arquivo Remessa Uniprime';
      FContasReceberParam.SDlg_Remessa.DefaultExt := '';
      FContasReceberParam.SDlg_Remessa.FilterIndex := 0;

      if FContasReceberParam.SDlg_Remessa.Execute then
      begin
        AssignFile(F, FContasReceberParam.SDlg_Remessa.FileName);
        Rewrite(F);
        Writeln(F, wstrS);
        CloseFile(F);
        DMOracle.DBCemapa.Commit;
        MessageDlg('Arquivo Remessa Uniprime Gerado com Sucesso!',
          mtInformation, [mbOk], 0);
      end
      else
      begin
        DMOracle.DBCemapa.Rollback;
        MessageDlg('Arquivo Remessa Uniprime não foi Gerado!', mtWarning,
          [mbOk], 0);
      end;
    except
      DMOracle.DBCemapa.Rollback;
      raise
        exception.create('Erro! Não foi possível gerar o arquivo de remessa,'
        + #13 +
        'Verifique se não existem campos em branco no cadastro de bancos' + #13
        +
        'ou no cadastro de Clientes/Fornecedores.');
    end;
  end;
end;

procedure TFContasReceberCad.RetornoRemessaCresol;
var
  wCont: integer;
  F: TextFile;
  S: string;
  wErro1, wErro2, wErro3, wErro4, wErro5: string;
  wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro: Real;
  wDtLiquida, wDtCredito, wNNumero, wCliente: string;
begin
  wErro1 := '';
  wErro2 := '';
  wErro3 := '';
  wErro4 := '';
  wErro5 := '';

  OpenDialog1.Filter := 'Arquivo de Retorno Cresol';
  OpenDialog1.FilterIndex := 0;
  OpenDialog1.DefaultExt := '*.RET';
  OpenDialog1.FileName := '*.RET';

  if OpenDialog1.Execute then { Mostra caixa de dialogo}
  begin
    AssignFile(F, OpenDialog1.FileName);
    {Pega arquivo selecionado em dialogo box}
    Reset(F);
    Readln(F, S); {Le a primeira linha do arquivo }

    wCont := 1; // Inicializa valor para salto de linha-relatório de erros

    if Copy(Trim(S), 1, 1) <> '0' then
      raise exception.Create('Identificação do Registro Header invalido!');
    if Copy(Trim(S), 2, 1) <> '2' then
      raise exception.Create('Identificação do Tipo de Arquivo invalida!');
    if Copy(Trim(S), 3, 7) <> 'RETORNO' then
      // Verifica se realmente é um arquivo de retorno.
      raise exception.Create('Não é um arquivo de RETORNO!');
    if Copy(Trim(S), 12, 15) <> 'COBRANCA       ' then
      raise exception.Create('Não é um arquivo de COBRANÇA!');
    if Copy(Trim(S), 80, 15) <> 'CRESOL         ' then
      raise exception.Create('Nome do banco inválido!');

    Readln(F, S); //Le a proxima linha do arquivo
    while (Trim(S) <> '') do // Arquivo contém registro para processar.
    begin
      if Copy(Trim(S), 1, 1) = '1' then //registro detalhe
      begin
        // Condições possiveis para executar baixa do titulo.
        if StrToInt(Copy(Trim(S), 109, 2)) in [6, 15, 17] then
        begin
          wVal_Juro := 0;
          wVal_Desc := 0;
          wVal_Baixa := 0;
          wpgto_juro := 0;

          wDtLiquida := Copy(S, 111, 02) + '/' + Copy(S, 113, 02) + '/' +
            Copy(S, 115, 02);
          wDtCredito := Copy(S, 296, 02) + '/' + Copy(S, 298, 02) + '/' +
            Copy(S, 300, 02);
          wNNumero := Copy(S, 71, 12); // Nosso numero
          // Verifica se valor para baixar é diferente de zero.
          if StrToFloat(Copy(S, 254, 13)) <> 0 then // Valor recebido
            wVal_Baixa := (StrToFloat(Copy(S, 254, 13)) / 100)
          else
            raise exception.Create('Titulo com valor p/baixar igual a zero!');

          if StrToFloat(Copy(S, 267, 13)) <> 0 then // Juros de mora
          begin
            wVal_Juro := StrToFloat(Copy(S, 267, 13)) / 100 +
              (StrToFloat(Copy(S, 280, 13)) / 100);
            wpgto_juro := (StrToFloat(Copy(S, 267, 13)) / 100) +
              (StrToFloat(Copy(S, 280, 13)) / 100);
          end;

          if (StrToFloat(Copy(S, 241, 13)) <> 0) or (StrToFloat(Copy(S, 228, 13)) <> 0) then // Desconto concedido
            wVal_Desc := StrToFloat(Copy(S, 241, 13)) / 100 +
              StrToFloat(Copy(S, 228, 13)) / 100; // Valor do abatimento

            BaixaTituloRetorno(wVal_Juro, wVal_Desc, wVal_Baixa, wPgto_Juro,
              wNNumero, wDtLiquida, wDtCredito);
            //Chama procedimento para baixa de titulo.
        end;

        wErro1 := '';
        wErro2 := '';
        wErro3 := '';
        wErro4 := '';
        wErro5 := '';

        if (strtoint(copy(Trim(S), 109,2)) in [02,03,06,09,10,12,13,14,15,17,19,20,23,24,27,28,29,30,32,33,34,35]) then  //if ocorrencias then
        begin
//          ShowMessage(Copy(Trim(S), 319, 2));
          if (Copy(Trim(S), 319, 2) <> '  ') then
            wErro1 := RetornoErroBanco(Copy(Trim(S), 109, 2), Copy(Trim(S), 319, 2));   //passa a ocorrencia e o motivo
          if (Copy(Trim(S), 321, 2) <> '  ') and (Copy(Trim(S), 321, 2) <> '00') then
            wErro2 := RetornoErroBanco(Copy(Trim(S), 109, 2),Copy(Trim(S), 321, 2));
          if (Copy(Trim(S), 323, 2) <> '  ') and (Copy(Trim(S), 323, 2) <> '00') then
            wErro3 := RetornoErroBanco(Copy(Trim(S), 109, 2),Copy(Trim(S), 323, 2));
          if (Copy(Trim(S), 325, 2) <> '  ') and (Copy(Trim(S), 325, 2) <> '00') then
            wErro4 := RetornoErroBanco(Copy(Trim(S), 109, 2),Copy(Trim(S), 325, 2));
          if (Copy(Trim(S), 327, 2) <> '  ') and (Copy(Trim(S), 327, 2) <> '00') then
            wErro5 := RetornoErroBanco(Copy(Trim(S), 109, 2),Copy(Trim(S), 327, 2));
        end;
        // Inicia impressao dos erros \\
        With DMContasReceber do
          begin
            wCliente := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO, TB_CONTA_RECEBER_CAB ',' TB_CONTA_RECEBER_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO' +
                 ' AND TB_CONTA_RECEBER_CAB.COD_NOSSO_NUMERO = ' + QuotedStr(Copy(S,71,12)) );
            if wErro1 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 71, 12);
              CdRetornoRemessaDESC_CLIENTE.Text := wCliente; //Copy(S, 4, 17);
              CdRetornoRemessaDESC_REGISTRO.Text := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 319, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro1;
              CdRetornoRemessa.Post;
            end;
            if wErro2 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 71, 12);
              CdRetornoRemessaDESC_CLIENTE.Value := wCliente; //Copy(S, 04, 17);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 321, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro2;
              CdRetornoRemessa.Post;
            end;
            if wErro3 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 71, 02);
              CdRetornoRemessaDESC_CLIENTE.Value := wCliente; //Copy(S, 04, 17);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 323, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro3;
              CdRetornoRemessa.Post;
            end;
            if wErro4 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 71, 12);
              CdRetornoRemessaDESC_CLIENTE.Value := wCliente; //Copy(S, 04, 17);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 325, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro4;
              CdRetornoRemessa.Post;
            end;
            if wErro5 <> '' then
            begin
              CdRetornoRemessa.Append;
              CdRetornoRemessaDESC_TITULO.Value := Copy(S, 71, 12);
              CdRetornoRemessaDESC_CLIENTE.Value := wCliente; //Copy(S, 04, 17);
              CdRetornoRemessaDESC_REGISTRO.Value := Copy(Trim(S), 109, 2);
              CdRetornoRemessaDESC_RECUSA.Value := Copy(Trim(S), 327, 2);
              CdRetornoRemessaDESC_MENSAGEM.Value := wErro5;
              CdRetornoRemessa.Post;
            end;
        end;
      end;
      ReadLn(F, S); // Pula para proximo registro no arquivo texto.
    end; // Fim do while
    CloseFile(F); // Fecha arquivo aberto.
  end; // Fim do begin OpenDialog.
end;

procedure TFContasReceberCad.tulosBaixadosSaldos1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[43].TabVisible := True;
  if FContasReceberParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.FmFilial44.MeFilial.Text,
      'CONTAS A RECEBER');
    with DMContasReceber do
    begin
      QRTitulosBaixadosSaldos.Close;

      if Trim(FContasReceberParam.FmFilial44.MeFilial.Text) <> '' then
        QRTitulosBaixadosSaldos.SetVariable('COD_FILIAL', FContasReceberParam.FmFilial44.MeFilial.Text)
      else
        QRTitulosBaixadosSaldos.SetVariable('COD_FILIAL', Null);

      QRTitulosBaixadosSaldos.SetVariable('DT_MOV_INICIAL', FContasReceberParam.FmDataPgto44.MeDtInicial.Text );
      QRTitulosBaixadosSaldos.SetVariable('DT_MOV_FINAL', FContasReceberParam.FmDataPgto44.MeDtFinal.Text );
      QRTitulosBaixadosSaldos.SetVariable('DT_BASE', FContasReceberParam.MeDtBase44.Text);

      QRTitulosBaixadosSaldos.Open;
    end;
    if FRTitulosBaixadosSaldos = nil then
      FRTitulosBaixadosSaldos := TFRTitulosBaixadosSaldos.Create(Application);

    FRTitulosBaixadosSaldos.QRLPeriodo.Caption  := 'Data Pagamento: ' + FContasReceberParam.FmDataPgto44.MeDtInicial.Text + ' até ' + FContasReceberParam.FmDataPgto44.MeDtFinal.Text;
    FRTitulosBaixadosSaldos.QRLDataBase.Caption :=  'Data Base: ' + FContasReceberParam.MeDtBase44.Text;
    if FContasReceberParam.RGPreview.ItemIndex = 0 then
      FRTitulosBaixadosSaldos.QRPrimario.Preview
    else
      FRTitulosBaixadosSaldos.QRPrimario.Print;
      
  end;

end;

procedure TFContasReceberCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
//Solicitado pela Espindola para que o valor do titulo e o valor original ao duplicar seja zero. Alex 27/12/2022
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') then
  begin
    DBEValorTitulo.Text := '';
    DBEdit10.Text := DBEValorTitulo.Text
  end;
  DMContasReceber.QContasReceber_CabCOD_NOSSO_NUMERO.Value := '';
end;

procedure TFContasReceberCad.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit4.Text);
end;

procedure TFContasReceberCad.GeraBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMContasReceber do
  begin

    QBoletoAPICR.Close;
    QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);
    QBoletoAPICR.Open;

    if (QBoletoAPICRIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);
                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(iWCodFilial,  // PRECISA FILIAL
                                           0,  // SE CONTARECEBER, NÃO PRECISA COD NOTA
                                           0,  // SE CONTARECEBER, NÃO PRECISA NUM NOTA
                                           QBoletoAPICRCOD_BANCO.Value,
                                           0,  // SE CONTARECEBER, NÃO PRECISA O CONTRATO
                                           TGBContasReceber,   // ESSE O TIPO NOTA
                                           QBoletoAPICRIND_AMBIENTE_API_BOLETO.Value,
                                           sWEnviaBoletoEmail,
                                           sWEGeraPdf);  // sWEnviaBoletoEmail e sWEGeraPdf vem do FContasReceberParam.RG19TipoEmissao

      wBoletoApi.EnviarBoletosApi;
      if not wBoletoApi.GetIndTemRejeicao then
        if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          wBoletoApi.GerarPDF;
        end
    end;
  end;
end;

procedure TFContasReceberCad.ImprimeBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMContasReceber do
  begin
    QBoletoAPICR.Close;
    QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);
    QBoletoAPICR.Open;



    if (QBoletoAPICRIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);

                   // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(iWCodFilial,  // PRECISA FILIAL
                                           0,  // SE CONTARECEBER, NÃO PRECISA COD NOTA
                                           0,  // SE CONTARECEBER, NÃO PRECISA NUM NOTA
                                           QBoletoAPICRCOD_BANCO.Value,
                                           0,  // SE CONTARECEBER, NÃO PRECISA O CONTRATO
                                           TGBContasReceber,   // ESSE O TIPO NOTA
                                           QBoletoAPICRIND_AMBIENTE_API_BOLETO.Value,
                                           sWEnviaBoletoEmail,
                                           sWEGeraPdf);  // sWEnviaBoletoEmail e sWEGeraPdf vem do FContasReceberParam.RG19TipoEmissao

      wBoletoApi.ImprimirBoletosApi;
    end;
  end;
end;

procedure TFContasReceberCad.EnviarEmailBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMContasReceber do
  begin
    QBoletoAPICR.Close;
    QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);
    QBoletoAPICR.Open;



    if (QBoletoAPICRIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);

                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(iWCodFilial,  // PRECISA FILIAL
                                           0,  // SE CONTARECEBER, NÃO PRECISA COD NOTA
                                           0,  // SE CONTARECEBER, NÃO PRECISA NUM NOTA
                                           QBoletoAPICRCOD_BANCO.Value,
                                           0,  // SE CONTARECEBER, NÃO PRECISA O CONTRATO
                                           TGBContasReceber,   // ESSE O TIPO NOTA
                                           QBoletoAPICRIND_AMBIENTE_API_BOLETO.Value,
                                           sWEnviaBoletoEmail,
                                           sWEGeraPdf);  // sWEnviaBoletoEmail e sWEGeraPdf vem do FContasReceberParam.RG19TipoEmissao

      wBoletoApi.EnviaEmailBoletosApi;
    end;
  end;
end;

procedure TFContasReceberCad.btnEnviarApiClick(Sender: TObject);
begin
  inherited;

  with DMContasReceber do
  begin

    if Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) = '' then
    begin
      QRBloqueto.Close;
      QRBloqueto.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);
      QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
      Chama_Emissao_Bloqueto_API;
    end;

    iWCodFilial  := QContasReceber_CabCOD_FILIAL.Value;
    iWCodContaCorrente := QContasReceber_CabCOD_CONTA_CORRENTE.Value;
    QBoletoAPI.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);

{    QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', QContasReceber_CabCOD_CONTA_CORRENTE.Value);
    QBoletoAPI.SetVariable('COD_NOTA_CAB_INICIAL', QContasReceber_CabCOD_NOTA_CAB.Value);
    QBoletoAPI.SetVariable('COD_NOTA_CAB_FINAL', QContasReceber_CabCOD_NOTA_CAB.Value);
    QBoletoAPI.SetVariable('COD_FILIAL', iWCodFilial);
    QBoletoAPI.SetVariable('DT_VENCIMENTO_INICIAL', QContasReceber_CabDT_VENCIMENTO.Value);
    QBoletoAPI.SetVariable('DT_VENCIMENTO_FINAL', QContasReceber_CabDT_VENCIMENTO.Value);
    QBoletoAPI.SetVariable('DT_EMISSAO_INICIAL', QContasReceber_CabDT_EMISSAO.Value);
    QBoletoAPI.SetVariable('DT_EMISSAO_FINAL', QContasReceber_CabDT_EMISSAO.Value);

    QBoletoAPI.SetVariable('COD_CADASTRO', QContasReceber_CabCOD_CADASTRO.Value);
 }
    GeraBoletoApi;
    QContasReceber_Cab.Refresh;
  end;

  ExibeBotoesAPI;

end;

procedure TFContasReceberCad.btnImprimirApiClick(Sender: TObject);
begin
  inherited;

  with DMContasReceber do
  begin

   iWCodFilial  := QContasReceber_CabCOD_FILIAL.Value;
    iWCodContaCorrente := QContasReceber_CabCOD_CONTA_CORRENTE.Value;
    QBoletoAPI.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);

{    QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', QContasReceber_CabCOD_CONTA_CORRENTE.Value);
    QBoletoAPI.SetVariable('COD_NOTA_CAB_INICIAL', QContasReceber_CabCOD_NOTA_CAB.Value);
    QBoletoAPI.SetVariable('COD_NOTA_CAB_FINAL', QContasReceber_CabCOD_NOTA_CAB.Value);
    QBoletoAPI.SetVariable('COD_FILIAL', iWCodFilial);
    QBoletoAPI.SetVariable('DT_VENCIMENTO_INICIAL', QContasReceber_CabDT_VENCIMENTO.Value);
    QBoletoAPI.SetVariable('DT_VENCIMENTO_FINAL', QContasReceber_CabDT_VENCIMENTO.Value);
    QBoletoAPI.SetVariable('DT_EMISSAO_INICIAL', QContasReceber_CabDT_EMISSAO.Value);
    QBoletoAPI.SetVariable('DT_EMISSAO_FINAL', QContasReceber_CabDT_EMISSAO.Value);

    QBoletoAPI.SetVariable('COD_CADASTRO', QContasReceber_CabCOD_CADASTRO.Value);
 }

    ImprimeBoletoApi;
  end;

end;

procedure TFContasReceberCad.SetaApiWeb;
begin

  if (DMContasReceber.QContasReceber_Cab.State in [dsEdit, dsInsert]) and (Trim(DBEdit25.Text) <> '' ) then
  begin
    DMContasReceber.QContasReceber_CabIND_WEB_API.Value :=
          Copy(DMOracle.BuscaNome('SELECT IND_API_BOLETO FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE =' + DBEdit25.Text), 1, 1);
  end;
end;

procedure TFContasReceberCad.DBEdit25Exit(Sender: TObject);
begin
  inherited;
  SetaApiWeb;
end;

procedure TFContasReceberCad.ExibeBotoesAPI;
begin

  // PARA ENVIO DO BOLETO VIA API
  if (DBRadioGroup6.ItemIndex = 0) then
  begin
    btnImprimirApi.Visible := True;
    btnEnviarApi.Visible := True;
    CancelarBoleto1.Enabled := True;
    if (DMContasReceber.QContasReceber_CabIND_ENVIADO_BANCO.Value = 'SIM') then
    begin
      btnImprimirApi.Enabled := True;
      btnEnviarApi.Enabled := False;
    end
    else
    begin
      btnImprimirApi.Enabled := False;
      btnEnviarApi.Enabled := True;
    end
  end
  else
  begin
    btnImprimirApi.Visible := False;
    btnEnviarApi.Visible := False;
    CancelarBoleto1.Enabled := False;
  end;
end;

procedure TFContasReceberCad.ConsultarBoletosAPI;
begin

  with DMContasReceber do
  begin

    if Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) = '' then
    begin
      QRBloqueto.Close;
      QRBloqueto.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);
      QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
      Chama_Emissao_Bloqueto_API;
    end;

    iWCodFilial  := QContasReceber_CabCOD_FILIAL.Value;
    iWCodContaCorrente := QContasReceber_CabCOD_CONTA_CORRENTE.Value;
    QBoletoAPI.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);

{    QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', QContasReceber_CabCOD_CONTA_CORRENTE.Value);
    QBoletoAPI.SetVariable('COD_NOTA_CAB_INICIAL', QContasReceber_CabCOD_NOTA_CAB.Value);
    QBoletoAPI.SetVariable('COD_NOTA_CAB_FINAL', QContasReceber_CabCOD_NOTA_CAB.Value);
    QBoletoAPI.SetVariable('COD_FILIAL', iWCodFilial);
    QBoletoAPI.SetVariable('DT_VENCIMENTO_INICIAL', QContasReceber_CabDT_VENCIMENTO.Value);
    QBoletoAPI.SetVariable('DT_VENCIMENTO_FINAL', QContasReceber_CabDT_VENCIMENTO.Value);
    QBoletoAPI.SetVariable('DT_EMISSAO_INICIAL', QContasReceber_CabDT_EMISSAO.Value);
    QBoletoAPI.SetVariable('DT_EMISSAO_FINAL', QContasReceber_CabDT_EMISSAO.Value);

    QBoletoAPI.SetVariable('COD_CADASTRO', QContasReceber_CabCOD_CADASTRO.Value);
 }
    GeraBoletoApi;
    QContasReceber_Cab.Refresh;
  end;

  ExibeBotoesAPI;


end;

procedure TFContasReceberCad.ConsultaStatus1Click(Sender: TObject);
var
  wBoletoApi: IBoletoApi;
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[45].TabVisible := True;

  bEstaConectado := InternetCheckConnection('http://google.com', 1, 0); // Chama a função que verifica a rede
  if bEstaConectado then
  begin

    if FContasReceberParam.ShowModal = mrOk then
    begin
      with DMContasReceber do
      begin
        QBoletoAPICR.Close;
        QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FContasReceberParam.FmContaCorrenteAPI.MeContaCorrente.Text)));
        QBoletoAPICR.Open;

        iWCodFilial := StrToInt(Trim(FContasReceberParam.FmFilialAPI.MeFilial.Text));

        if (QBoletoAPICRIND_API_BOLETO.Value = 'SIM') then
        begin
          QBoletoAPI.Close;
          QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', StrToInt(Trim(FContasReceberParam.FmContaCorrenteAPI.MeContaCorrente.Text)));
          QBoletoAPI.SetVariable('COD_FILIAL', iWCodFilial);
          QBoletoAPI.SetVariable('DT_EMISSAO_INICIAL', StrToDate(FContasReceberParam.FmDatasAPI.MeDtInicial.Text));
          QBoletoAPI.SetVariable('DT_EMISSAO_FINAL', StrToDate(FContasReceberParam.FmDatasAPI.MeDtFinal.Text));
                        // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
          wBoletoApi := TBoletoFactory.RetornaBoletoBanco(iWCodFilial,  // PRECISA FILIAL
                                               0,  // SE CONTARECEBER, NÃO PRECISA COD NOTA
                                               0,  // SE CONTARECEBER, NÃO PRECISA NUM NOTA
                                               QBoletoAPICRCOD_BANCO.Value,
                                               0,  // SE CONTARECEBER, NÃO PRECISA O CONTRATO
                                               TGBContasReceber,   // ESSE O TIPO NOTA
                                               QBoletoAPICRIND_AMBIENTE_API_BOLETO.Value,
                                               false,
                                               false);  // sWEnviaBoletoEmail e sWEGeraPdf vem do FContasReceberParam.RG19TipoEmissao

          wBoletoApi.SetCodContaCorrente(StrToInt(Trim(FContasReceberParam.FmContaCorrenteAPI.MeContaCorrente.Text)));
          wBoletoApi.ConsultarBoletos;
          GeraRelatorioRetorno;
        end;
      end;
    end;
  end
  else
    ShowMessage('Sem conexão! Aguarde a internet, por favor!');


end;

procedure TFContasReceberCad.CancelarBoleto1Click(Sender: TObject);
var
  wBoletoApi: IBoletoApi;
  indSituacao: Boolean;
begin
  inherited;
  indSituacao := ('ABERTO' = DMContasReceber.QContasReceber_CabIND_SITUACAO.Value);

  if indSituacao then
  begin
    if MessageDlg('Tem certeza que deseja excluir o Contas Receber Atual?',
                      mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin

      with DMContasReceber do
      begin

        if Trim(QContasReceber_CabCOD_NOSSO_NUMERO.Text) = '' then
        begin
          QRBloqueto.Close;
          QRBloqueto.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);
          QRBloqueto.SetVariable('NUMERO_TITULOS', '1 = 1');
          Chama_Emissao_Bloqueto_API;
        end;

        iWCodFilial  := QContasReceber_CabCOD_FILIAL.Value;
        iWCodContaCorrente := QContasReceber_CabCOD_CONTA_CORRENTE.Value;
        QBoletoAPI.SetVariable('COD_CONTA_RECEBER', QContasReceber_CabCOD_CONTA_RECEBER_CAB.Value);

    {    QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', QContasReceber_CabCOD_CONTA_CORRENTE.Value);
        QBoletoAPI.SetVariable('COD_NOTA_CAB_INICIAL', QContasReceber_CabCOD_NOTA_CAB.Value);
        QBoletoAPI.SetVariable('COD_NOTA_CAB_FINAL', QContasReceber_CabCOD_NOTA_CAB.Value);
        QBoletoAPI.SetVariable('COD_FILIAL', iWCodFilial);
        QBoletoAPI.SetVariable('DT_VENCIMENTO_INICIAL', QContasReceber_CabDT_VENCIMENTO.Value);
        QBoletoAPI.SetVariable('DT_VENCIMENTO_FINAL', QContasReceber_CabDT_VENCIMENTO.Value);
        QBoletoAPI.SetVariable('DT_EMISSAO_INICIAL', QContasReceber_CabDT_EMISSAO.Value);
        QBoletoAPI.SetVariable('DT_EMISSAO_FINAL', QContasReceber_CabDT_EMISSAO.Value);

        QBoletoAPI.SetVariable('COD_CADASTRO', QContasReceber_CabCOD_CADASTRO.Value);
     }
        CancelarBoletoAPI;
        QContasReceber_Cab.Refresh;
      end;

      ExibeBotoesAPI;
    end;
  end
  else
    ShowMessage('Já possui pagamento realizado!');

end;

procedure TFContasReceberCad.CancelarBoletoAPI;
var
  wBoletoApi: IBoletoApi;
begin

  with DMContasReceber do
  begin

    QBoletoAPICR.Close;
    QBoletoAPICR.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);
    QBoletoAPICR.Open;

    if (QBoletoAPICRIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_CONTA_CORRENTE', iWCodContaCorrente);
                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(iWCodFilial,  // PRECISA FILIAL
                                           0,  // SE CONTARECEBER, NÃO PRECISA COD NOTA
                                           0,  // SE CONTARECEBER, NÃO PRECISA NUM NOTA
                                           QBoletoAPICRCOD_BANCO.Value,
                                           0,  // SE CONTARECEBER, NÃO PRECISA O CONTRATO
                                           TGBContasReceber,   // ESSE O TIPO NOTA
                                           QBoletoAPICRIND_AMBIENTE_API_BOLETO.Value,
                                           sWEnviaBoletoEmail,
                                           sWEGeraPdf);  // sWEnviaBoletoEmail e sWEGeraPdf vem do FContasReceberParam.RG19TipoEmissao

      wBoletoApi.CancelarBoleto;
    end;
  end;
end;

procedure TFContasReceberCad.DBEdit8Exit(Sender: TObject);
var
  wSituacaoDpto: string;
begin
  inherited;
  wSituacaoDpto := DMOracle.FastSelect('IND_SITUACAO','TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + DBEdit8.Text);
  if wSituacaoDpto <> 'A' then
  begin
    DBEdit8.SetFocus;
    raise exception.Create('ATENÇÃO - Este departamento não esta ativo. Favor Verificar!');
  end;
end;

end.

