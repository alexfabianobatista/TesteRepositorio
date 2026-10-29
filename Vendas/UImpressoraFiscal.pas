unit UImpressoraFiscal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DB, OracleData, OraTeste, strUtils, ExtCtrls, ComCtrls,
  IdHashMessageDigest, idHash, Registry, Oracle,Variants;
type
  TAliquotasSet = set of 1..16;

  TFImpressoraFiscal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    BtLeituraX: TBitBtn;
    BtLeituraZ: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    BtnIniciarDia: TBitBtn;
    BtnAvancarLinha: TBitBtn;
    BtnFecharCupom: TBitBtn;
    BtCancelaCupom: TBitBtn;
    BtArquivoMagnetico: TBitBtn;
    BtResumoMensal: TBitBtn;
    QImportado: TOracleDataSet1;
    QImportadoDT_EMISSAO: TDateTimeField;
    QImportadoCOD_REGISTRO_MESTRE: TIntegerField;
    QInsAnalitico: TOracleDataSet1;
    QInsMestre: TOracleDataSet1;
    QInsResumo: TOracleDataSet1;
    OracleDataSet11: TOracleDataSet1;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    OracleDataSet12: TOracleDataSet1;
    OracleDataSet13: TOracleDataSet1;
    OracleDataSet14: TOracleDataSet1;
    TabSheet2: TTabSheet;
    btLX: TBitBtn;
    btLMFC: TBitBtn;
    btLMFS: TBitBtn;
    btRZ: TBitBtn;
    btEspelho: TBitBtn;
    btArqMFD: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BtIdentificacao: TBitBtn;
    btIdentificaPAF: TBitBtn;
    TabSheet3: TTabSheet;
    btSangria: TBitBtn;
    btSuprimento: TBitBtn;
    BtIndiceAliquota: TBitBtn;
    BtVendasNoPeriodo: TBitBtn;
    BitBtn5: TBitBtn;
    open: TBitBtn;
    btIndiceTec: TBitBtn;
    BtRegistros: TBitBtn;
    procedure BtLeituraXClick(Sender: TObject);
    procedure BtLeituraZClick(Sender: TObject);
    procedure BtnAvancarLinhaClick(Sender: TObject);
    procedure BtnIniciarDiaClick(Sender: TObject);
    function EmiteCF_Yanco(mCod_Nota: Variant):Boolean;
    procedure BtnFecharCupomClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure Analisa_iRetorno(pAbortar: Boolean=false);
    Function Retorno_Impressora(pMostraMsg: Boolean=true):Boolean;
    procedure BtCancelaCupomClick(Sender: TObject);
    procedure BtArquivoMagneticoClick(Sender: TObject);
    procedure BtResumoMensalClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btLXClick(Sender: TObject);
    procedure btLMFCClick(Sender: TObject);
    procedure btLMFSClick(Sender: TObject);
    procedure btEspelhoClick(Sender: TObject);
    procedure btArqMFDClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btRZClick(Sender: TObject);
    procedure BtIdentificacaoClick(Sender: TObject);
    procedure btIdentificaPAFClick(Sender: TObject);
    procedure btSangriaClick(Sender: TObject);
    procedure btSuprimentoClick(Sender: TObject);
    procedure ImprimeComprovanteNaoFiscalVinculado(pVinculado: boolean=true);
    procedure BtVendasNoPeriodoClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure openClick(Sender: TObject);
    procedure btIndiceTecClick(Sender: TObject);
    procedure BtIndiceAliquotaClick(Sender: TObject);
    procedure BtRegistrosClick(Sender: TObject);
    function VerificaReducaoPendente: Boolean;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GeraArquivoRZAutomatico;

  private
    wFoi: string;
    fPafEcfLiberado: Boolean;
    FStatusTEF: Integer;
    FArqConfigValidado: Boolean;
    procedure LeituraMemoriaFiscal();
    Function procurarArquivoGerado(pesquisa: string): String;
    function pathArquivosPAFECF: String;
    function getMarcaModeloTipo(var pMarca: String; var pModelo: String; var pTipo: String): Boolean;
    function getDataUsuarioSWBasicoMFAdicional(var pDataUsuario: TDateTime; var pDataSWBasico: TDateTime; var MFAdicional: String): Boolean;
    function getNumCaixa(var pNumCaixa: String): Boolean;
    function getCnpjIE(var pCnpj: String; var pIE: String): Boolean;
    function getVersaoFirmware(var pVersao: String): Boolean;
    procedure GeraArqMovEstoque(pNumSerie: String; pDtInicial, pDtFinal: TDate);
    function getArquivoSintegra(pCaminhoArquivo, pMes, pAno: String; pTiposRegistro: Integer): Boolean;
    function getNumeroSubstituicoes(var pNumeroSubstituicoes: String): Boolean;
    function getDataHoraReducao(var wDataEmissao: TDateTime): Boolean;
    function getIndDescontoIssqn(var pIndicador: String): Boolean;
    function getIndiceAliquotasIss: TAliquotasSet;
    function ultimoCupomAberto: Integer;
    function RetornaDataHora(pData: string): TDateTime;
    procedure CancelaCupomCompleto;
    function CriaDiretorioRepositorio(pNomeRepositorio: String): String;
    procedure PersisteReducaoRepositorio(pNumSerie,pArquivo,pDados: String;
      pDtReducao: TDate; pNumSeq: Integer);
    function RecuperaArquivoAuxiliar: Boolean;
    procedure CadastraAliquota;
    function FaltaPapel: Boolean;
    function VerificaInclusaoExclusao(pDataIni,pDataFin: String): Boolean;

    { Private declarations }
  public
    function Analisa_iST1: TStrings;
    function Analisa_iST2: TStrings;
    function Analisa_iST3: String;
    procedure ChecaReducaoZAutomatica;
    procedure LeArquivoTexto(Arquivo: String; pRegistros: Integer;
      pImportacao: boolean=false; Dados: String = '');
    function PathBematech(): String;
    procedure Y8000ECF(Comando: string);
    function AbreCF(pCadastro: Integer; var pData:TDateTime;
      var pNumeroCupom: Integer; var pNumCOO: Integer;
      var pNumSerieEcf:string;
      FClienteSemCad: TForm=Nil): Boolean;
    function VendeItem(var pNumItem: Integer): Boolean;
    function CancelaCupom: Boolean;
    function verificaCupomAberto: boolean;
    function getDataHoraImpressora(var pData: String; var pHora: String): Boolean;
    function CancelaItem(pNumItem: Integer): Boolean;
    function AdicionaDescontoItem: Boolean;
    function CancelaDescontoItem: Boolean;
    function SubTotal(var pSubTotal: Real): Boolean;
    function AdicionaDescontoSubtotal: Boolean;
    function CancelaDescontoSubtotal: Boolean;
    function AdicionaDespesasSubtotal: Boolean;
    function CancelaDespesasSubtotal: Boolean;
    function SubTotalizaCupom: Boolean;
    function TotalizaCupom: Boolean;
    function EfetuaFormaPagamento(pFormaPgto: String; pValorPgto: Real): Boolean;
    function ValorPago(var pValorPago: Real): Boolean;
    function TerminaFechamentoCupom(pMensagem: String): Boolean;
    function IniciaFechamento: Boolean;
    procedure geraRelMd5Executaveis;
    function MD5(const fileName : string) : string;
    function VerificaPAFECFLiberado(pMostraMsg: Boolean = true): Boolean;
    function VerificaNumSerie_GT: Boolean;
    procedure atualizaGT(pGrandeTotal: String);
    function getGT(var pGT:String):Boolean;
    function getMD5ArqConfig: String;
    function sangria(pValor: Real): Boolean;
    function suprimento(pValor: Real): Boolean;
    function cupomAberto: Boolean;
    function NumSerie: String;
//    function verificaCupomCancelado2Horas: Boolean;
    property pPafEcfLiberado: Boolean read fPafEcfLiberado write fPafEcfLiberado default False;
    function verificaImpressoraLigada: boolean;
    property StatusTEF: Integer read FStatusTEF write FStatusTEF default 1;
    procedure CancelaNota;
    procedure VoltaConfirmacao;
    function NumeroUltimoCupom: String;
    procedure ImprimeRelatorioGerencial;
    function RelatorioVendasNoPeriodoLiberado: Boolean;
    procedure CadastraImpressora;
    property pArqConfigValidado: Boolean read FArqConfigValidado write FArqConfigValidado default false;
    Procedure AtualizaEstoqueDiario;
    procedure InsereDemaisDocumentos(pDenominacao: string;
      pCodNotaCab: Integer=0; pValor: Double=0);
    procedure ImprimeRelatorioGerencialMFD(Texto: String; Descricao: String = ''; Indice: String = '');
    procedure AdicionaPagamento(pFormaPgto: String;
      pValorPagamento: Double; pCodNota: Integer);
    procedure HabilitaBotoes(pHabilita: Boolean);
    procedure RegistroTipo60D(pFilial: Integer; pMes,pAno: String);

    { Public declarations }
  end;

const
  CHAVE_PRIVADA: AnsiString = 'FAA57497BAEA42A73C6C94702A0E897CCD288E5C85D02C207AA9492731AE88E7FB8F8F4980CF5B938538444' + 'A4321731A7259B8FB5AAEF26A6F79117EBDF4B36FF446CE1C18DBBCA7E725B85BC850116829DA1341032BB8153C408F25C46F78F54196D2C05EEDB2C6815330C9404395C834D73481529F68F099E9CA5FA864A6DB';
  CHAVE_PUBLICA: AnsiString = 'EF2B062B25E5E3C56FC5739AB0E79184CCE13F294AB371F55E59A8855BFB73B2E8685DED3942ADB94057BCB' + 'D6D916EEC831D25F299CE93277084014EAF0A18D84EB17CDD88D0B2B046D47CFD0318268AA70F521423927694EFB8BB9B4D7E9C64BE35DA44C6348172302BEEDABC685826FA3F70BC9F71570C1A801C211C0B79F5';
  // Funções dos Relatórios Fiscais

function Bematech_FI_LeituraX: Integer; StdCall; External 'BEMAFI32.DLL' ;
function Bematech_FI_ReducaoZ( Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupomResumido( FormaPagamento: String; Mensagem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaCupom( FormaPagamento: String; AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String; ValorPago: String; Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItem( Codigo: String; Descricao: String; Aliquota: String; TipoQuantidade: String; Quantidade: String; CasasDecimais: Integer; ValorUnitario: String; TipoDesconto: String; Desconto: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendeItemDepartamento( Codigo: String; Descricao: String; Aliquota: String; ValorUnitario: String; Quantidade: String; Acrescimo: String; Desconto: String; IndiceDepartamento: String; UnidadeMedida: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaCupom: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AberturaDoDia( ValorCompra: string; FormaPagamento: string ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreCupom( CGC_CPF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreCupomMFD(CGC: string; Nome: string; Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IncluiCidadeFavorecido( Cidade: String; Favorecido: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamento( FormaPgto , cValorPago : String ) : Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressora( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';

function Bematech_FI_IniciaFechamentoCupom( AcrescimoDesconto: String; TipoAcrescimoDesconto: String; ValorAcrescimoDesconto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EfetuaFormaPagamentoDescricaoForma( FormaPagamento: string; ValorFormaPagamento: string; DescricaoFormaPagto: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TerminaFechamentoCupom( Mensagem: String): Integer; StdCall; External 'BEMAFI32.DLL';

function Bematech_FI_RelatorioTipo60Analitico: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Analitico';
function Bematech_FI_RelatorioTipo60Mestre: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RelatorioTipo60Mestre';
function Bematech_FI_RegistrosTipo60: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_RegistrosTipo60';
function Bematech_FI_VerificaImpressoraLigada: Integer; StdCall; External 'BEMAFI32.DLL' Name 'Bematech_FI_VerificaImpressoraLigada';
function Bematech_FI_RelatorioSintegraMFD(iRelatorios: Integer; cArquivo: String; cMes: String; cAno: String; cRazaoSocial: String; cEndereco: String; cNumero: String; cComplemento: String; cBairro: String; cCidade: String; cCep: String; cTelefone: String; cFax: String; cContato: String): Integer; StdCall; External 'BEMAFI32.DLL';


function Bematech_FI_LeituraMemoriaFiscalSerialDataPAFECF( cDataInicial: String; cDataFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialReducaoPAFECF( cCRZInicial: String; cCRZFinal: String; cFlagLeitura: String; cChavePublica: String; cChavePrivada: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalSerialDataMFD(DataInicial, DataFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_LeituraMemoriaFiscalReducaoMFD(ReducaoInicial, ReducaoFinal, FlagLeitura : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ArquivoMFD( cNomeArquivoOrigem: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; iTipoGeracao: integer; cChavePublica: String; cChavePrivada: String; iUnicoArquivo: integer ): Integer;  StdCall; External'BEMAFI32.DLL';
function Bematech_FI_DownloadMFD( Arquivo: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FormatoDadosMFD( ArquivoOrigem: String; ArquivoDestino: String; TipoFormato: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EspelhoMFD( cNomeArquivoDestino: String; cDadoInicial: String; cDadoFinal: String; cTipoDownload: String; cUsuario: String; cChavePublica: String; cChavePrivada: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSerieMFD(NumeroSerie : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_MarcaModeloTipoImpressoraMFD(Marca, Modelo, Tipo : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional( dataUsuario: string; dataSoftwareBasico: string; var letraAdicional: char ): integer; stdcall; external 'BEMAFI32.DLL';
function Bematech_FI_NumeroCaixa( NumeroCaixa: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CGC_IE( CGC: String; IE: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VersaoFirmwareMFD(VersaoFirmware: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraReducao(Data: String; Hora: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroSubstituicoesProprietario(NumeroSubstituicoes: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DadosUltimaReducaoMFD(DadosReducao: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_InicioFimCOOsMFD( cCOOIni, cCOOFim: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FlagsFiscais3MFD( Var Flag: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RetornoAliquotas( Aliquotas: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ProgramaAliquota( Aliquota: String; ICMS_ISS: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaIndiceAliquotasIss( Aliquota: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VendaBruta( ValorVenda: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_IdentificacaoPAFECF( cIndice: String; cNumeroLaudo: String; cCNPJDesenvolvedor: String; cRazaoSocial: String; cEndereco: String; cTelefone: String; cContato: String; cNomeComercial: String; cVersao: String; cPrincipalExecutavel: String; cMD5PrincipalExecutavel: String; cDemaisArquivos: String; cMD5DemaisArquivos: String; cNumerosFabricacao: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatoriosPAFECF(): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioIdentificacaoPAFECF(): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroCupom(NumeroCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaItemGenerico( NumeroItem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UltimoItemVendido( NumeroItem: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoItemMFD (numItem, IndAcrescimoDesconto, IndTipoAcrescimoDesconto, ValorAcrescimoDesconto: string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoItemMFD( cFlag, cItem: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorCupomFiscalMFD(CuponsEmitidos : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotal( SubTotal: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_TotalizaCupomMFD: integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_SubTotalizaCupomMFD: integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AcrescimoDescontoSubtotalMFD( cFlag, cTipo, cValor: string): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CancelaAcrescimoDescontoSubtotalMFD( cFlag: string): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ValorPagoUltimoCupom( ValorCupom: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataMovimentoUltimaReducaoMFD(Data: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GrandeTotal(GrandeTotal: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaEstadoImpressoraMFD( Var ACK: Integer; Var ST1: Integer; Var ST2: Integer; Var ST3: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Sangria( Valor: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_Suprimento( Valor: String; FormaPagamento: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AtivaDesativaCancelamentoCupom2HorasMFD(flag: Integer): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NumeroOperacoesNaoFiscais( NumeroOperacoes: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorRelatoriosGerenciaisMFD (Relatorios : String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_ContadorComprovantesCreditoMFD(Comprovantes : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DataHoraUltimoDocumentoMFD( cDataHora: string ): integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_EstornoNaoFiscalVinculadoMFD(CGC, Nome, Endereco : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaComprovanteNaoFiscalVinculado( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_FechaComprovanteNaoFiscalVinculado: Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_RelatorioGerencial( Texto: String ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_GeraRegistrosSpedCompleto( cArquivoMFD: string; cArquivoTXT: string;
  cDataInicial: string; cDataFinal: string; cPerfil: string; cCFOP: string; cCODOBSFiscal: string;
  cAliqPIS: string; cAliqCOFINS: string; cEmpresa: string; cCodMunicipio: string): Integer;  StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_CNPJMFD(CNPJ : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_VerificaTotalizadoresParciaisMFD(Totalizadores : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_NomeiaRelatorioGerencialMFD (Indice, Descricao : string): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_UsaRelatorioGerencialMFD (cMsg: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_AbreRelatorioGerencialMFD(cIndice: String): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_StatusEstendidoMFD( Var iStatus: Integer ): Integer; StdCall; External 'BEMAFI32.DLL';
function Bematech_FI_DownloadMF( Arquivo: String ): Integer; StdCall; External 'BemaFI32.DLL';
function Bematech_FI_FormatoDadosMF( ArquivoOrigem: String; ArquivoDestino: String; TipoFormato: String; TipoDownload: String; ParametroInicial: String; ParametroFinal: String; UsuarioECF: String ): Integer; StdCall; External 'BemaFI32.DLL';
function Bematech_FI_DataMovimento( Data: String ): Integer; StdCall; External 'BEMAFI32.DLL'; 
function Bematech_FI_MapaResumoMFD:Integer; StdCall; External 'BEMAFI32.DLL';

//Funções para assinar os arquivos
function genkkey( cChavePublica: String; cChavePrivada: String ): integer; stdcall; external 'sign_bema.dll';
function setLibType( iTipo: integer ): integer; stdcall; external 'sign_bema.dll';
function generateEAD( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String; cEAD:String; iSign: Integer): integer; stdcall; external 'sign_bema.dll';
function validateFile( cNomeArquivo: String; cChavePublica: String; cChavePrivada: String ): integer; stdcall; external 'sign_bema.dll';

var
  FImpressoraFiscal: TFImpressoraFiscal;
  Retorno : string;
  iRetorno : Integer;         // Variável com o retorno da função
  iControle : Integer;
  iACK: Integer;
  iST1: Integer;
  iST2: Integer;
  iST3: Integer; // Variáveis com o retorno do Status da Impressora
  Registry: TRegistry;
  wContReducao: Integer = 0;
  wListaMD5Gerada: Boolean=false;

implementation

Uses UOracle_cl, UUsuario_cl, UNotaSaida_cl, UParamSistema_cl,
  UFilial_cl, TefUtils, UTef, UTef_cl,UImpressoraFiscalParam,
  UFmDatas, UAguarde, UImpressoraFiscal_cl, UTefInputBox,
  USenha, UNotaSaida_Cancela, UOperacao_cl, DelRun, UAliquotasImpressora,
  DateUtils, UCupomFiscalParam, Ubiblioteca, MaskUtils;

{$R *.DFM}


 //returns MD5 has for a file
 function TFimpressoraFiscal.MD5(const fileName : string) : string;
 var
   idmd5 : TIdHashMessageDigest5;
   fs : TFileStream;
   hash : T4x4LongWordRecord;
 begin
   idmd5 := TIdHashMessageDigest5.Create;
   fs := TFileStream.Create(fileName, fmOpenRead OR fmShareDenyWrite) ;
   try
     result := idmd5.AsHex(idmd5.HashValue(fs)) ;
   finally
     fs.Free;
     idmd5.Free;
   end;
 end;


procedure AnaliseRet;
var ArqRet:textfile;
    Linha1:string;
begin
  if FileExists('yancoecf') then
  begin
    AssignFile(ArqRet,'yancoecf');
    Reset(ArqRet);
    Readln(ArqRet,Linha1);
    Retorno:=(linha1);
    CloseFile(ArqRet);
  end;
end;

procedure TFImpressoraFiscal.BtLeituraXClick(Sender: TObject);
var    wUsuario: string;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     if DMUsuario.QUsuario.Active = False then
        DMUsuario.QUsuario.Open;
     if DMUsuario.QUsuarioNOME.Value = '' then
        wUsuario:= 'Supervisor'
     else
        wUsuario:= Copy(Trim(DmUsuario.QUsuarioNOME.Value),1,13);
     Y8000ECF('24|1|'+wUsuario+'|');
   End
  Else
   Begin
     iRetorno := Bematech_FI_LeituraX();
     Analisa_iRetorno();
     Retorno_Impressora();
   End;
  CadastraImpressora;
end;

function TFImpressoraFiscal.CriaDiretorioRepositorio(pNomeRepositorio: String): String;
var diretorio: string;
begin
  diretorio := PathBematech+'\'+pNomeRepositorio;
  if not DirectoryExists(diretorio) then
    CreateDir(diretorio);
  Result := diretorio;
end;

procedure TFImpressoraFiscal.BtLeituraZClick(Sender: TObject);
var wUsuario: string;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     if MessageDlg('ATENÇÃO: Após o Fechamento não será mais permitida a '
                    +#13+'Impressão de nenhum cupom Fiscal!'
                    +#13+#13+'Fechar o Dia?',mtWarning,[mbYes,mbNo],0) = mrYes Then
     begin
       if DMUsuario.QUsuario.Active = False then
          DMUsuario.QUsuario.Open;
       if DMUsuario.QUsuarioNOME.Value = '' then
          wUsuario:= 'Supervisor'
       else
          wUsuario:= Copy(Trim(DmUsuario.QUsuarioNOME.Value),1,13);
       Y8000ECF('22|1|'+wUsuario+'|');
     end;
   End
  Else
    Begin
      If MessageDlg('A Redução Z impossibilitará novas impressões'+#13
              +'de Cupons Fiscais!'+#13+#13+'Continua ?', mtConfirmation,
               [mbYes, mbNo], 0) = mrYes then
       Begin
         iRetorno := Bematech_FI_ReducaoZ('', '');
         Analisa_iRetorno();
         Retorno_Impressora();
       End;
    End;

//  if (MessageDlg('Deseja gerar as informações de expotação para arquivo magnético?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  BtArquivoMagnetico.Click;
end;

function TFImpressoraFiscal.EmiteCF_Yanco(mCod_Nota: Variant): Boolean;
var wTotal,wVlUnitario,wVlDesconto : Real;
    wDecimal: Integer;
    wCod_Produto, wTributacao, wDesc_Produto,wCnpj,wEndereco,wNome,wTipoQtde,wAcreDesc,wImpressora,wNomeVend,wAcrescimo,wIndice : String;
    wDinheiro, wEnviar, wVl_Unitario, wQt_Quantidade, wVl_Total,wDesconto,wTipoDesconto,wVendedor,wEntrada,wCondicao, wVl_Total_Trib : String;
    wReceber1,wReceber2,wReceber3,wReceber4,wFormaPagto,wCidade,wEstado,wUnidade : String;
    wFormaPgto1, wFormaPgto2, wValorPgto1, wValorPgto2, wDescPgto1, wDescPgto2, wHabilita: String;
    wFinaliza: Boolean;
    wDescPrazoVencimento: String;
    wIsTef: Boolean;
begin
  with DMNotaSaida do
  begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',mCod_Nota);
    QNotaSaida.Open;
    if DMOracle.FastSelect('IND_PAF_ECF','TB_PARAM_SISTEMA','1=1') = 'S' then
      wImpressora := DMOracle.FastSelect('DESC_MARCA','TB_ECF','COD_FILIAL = ' +
        QNotaSaidaCOD_FILIAL.Text)
    else
      wImpressora:= DMOracle.BuscaNome('SELECT DESC_IMPRESSORA_FISCAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QNotaSaidaCOD_FILIAL.Value));
    //ImpFiscal.AbreCupom; *
    wTotal := 0;
    QItemNF.First;
    Y8000ECF('13|0|');   // Abre cupom fiscal - ja foi aberto ao iniciar o dia.
    //wDinheiro:=InputBox('Informe valor recebido!','Valor: ','');
    wDinheiro:= '';
    wCnpj:=''; //copy(DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value)),1,30);
    If wImpressora = 'BEMATECH' Then
    begin
      //iRetorno := Bematech_FI_CancelaCupom;
//      Analisa_iRetorno();
//      if iRetorno <> 1 then
//        Abort;
      iRetorno := Bematech_FI_AbreCupom(pchar(wCnpj));
    end;
    If QNotaSaidaInd_Condicao_Pagto.Value = '1' Then
     Begin
       If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BRASIL' Then
          wFormaPagto := 'DINHEIRO'
       Else
          wFormaPagto := 'A VISTA'
     End
    Else
      If QNotaSaidaInd_Condicao_Pagto.Value  = '4' Then
      begin
        wFormaPagto := 'CARTAO';
        //configuração para o desenvolvimento do T.E.F.
        if DMOracle.FastSelect('NVL(DESC_IP_TEF,0)','TB_FILIAL',
          'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) <> '0' then
          wFormaPagto := 'T.E.F.';
      end
      Else
         wFormaPagto := 'A PRAZO';

    //Para tef da aristides
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') and
      (DMOracle.FastSelect('NVL(DESC_IP_TEF,0)','TB_FILIAL',
          'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) <> '0') then
      if QNotaSaidaCOD_PRAZO_VENCIMENTO.Text <> '' then
      begin
        wDescPrazoVencimento :=
          DMOracle.FastSelect('DESC_PRAZO_VENCIMENTO','TB_PRAZO_VENCIMENTO',
            'COD_PRAZO_VENCIMENTO = ' + QNotaSaidaCOD_PRAZO_VENCIMENTO.Text);
        if Pos('CARTAO',UpperCase(Trim(wDescPrazoVencimento)))>0 then
          wFormaPagto := 'T.E.F.';
      end;

    wVlDesconto := 0;  // para calcular o valor total de desconto que foi dado nos itens
    while not QItemNF.Eof do
    begin
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
         wDesc_Produto:=Copy(QItemNFDesc_Complemento.Value,1,25)
      Else
         wDesc_Produto:=QItemNFDesc_Complemento.Value;
      if Trim(wDesc_Produto) = '' then
         if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
            wDesc_Produto:=Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True),1,25)
         Else
            wDesc_Produto:=DMOracle.BuscaNome('SELECT DESC_PRODUTO || ' + QuoteDSTR('  ') +  '|| DESC_UNIDADE ||' + QuoteDSTR('  ') + '|| NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True);
      if Trim(wDesc_Produto) = '' then
         wDesc_Produto:= 'PRODUTO NÃO ENCONTRADO???';
      wTributacao:= DMOracle.BuscaNome('SELECT COD_TRIB_IMP_FISCAL FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(QItemNFCOD_TRIBUTACAO.Value),True);
      if Trim(wTributacao) = 'T01' then
         wTributacao:= '01'
      else if Trim(wTributacao) = 'T02' then
              wTributacao:= '02'
      else if Trim(wTributacao) = 'T03' then
              wTributacao:= '03'
      else if Trim(wTributacao) = 'T04' then
              wTributacao:= '04'
      else if Trim(wTributacao) = 'T05' then
              wTributacao:= '05'
      else if Trim(wTributacao) = 'T06' then
              wTributacao:= '06'
      else if Trim(wTributacao) = 'S01' then
              wTributacao:= '07'
      else if Trim(wTributacao) = 'S02' then
              wTributacao:= '08'
      else if Trim(wTributacao) = 'S03' then
              wTributacao:= '09'
      else if Trim(wTributacao) = 'F' then
              If wImpressora = 'BEMATECH' Then
                 wTributacao:= 'FF'
              ELSE
                 wTributacao:= '14'
      else if Trim(wTributacao) = 'N' then
              If wImpressora = 'BEMATECH' Then
                 wTributacao:= 'NN'
              ELSE
                 wTributacao:= '16'
      else
        If wImpressora = 'BEMATECH' Then
           wTributacao:= 'II'
        ELSE
           wTributacao:= '15';   // Isento.
      wCod_Produto  := Copy(Trim(FloatToStr(QItemNFCod_Produto.Value)),1,13);
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
         wDesc_Produto := Copy(wDesc_Produto,1,25);
      wVlUnitario   := QItemNFVal_Unitario.Value - QItemNFVAL_DESCONTO.Value;
      wQt_Quantidade:=FormatFloat('0.000',QItemNFQt_Quantidade.Value);
{      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' Then
      Begin
        If (QItemNFPerc_Desc.Text <> '') And (QItemNFPerc_Desc.Text <> '0') Then
        Begin
          wVlUnitario := (wVlUnitario * 100) / (100 - QItemNFPerc_Desc.Value); // este calculo acha o valor unitario sem desconto
          wVlUnitario := strtofloat(FormatFloat('0.00',wVlUnitario));
          wVlDesconto := wVlDesconto + ((wVlUnitario - QItemNFVal_Unitario.Value)*QItemNFQt_Quantidade.Value); // para achar o valor que foi dado de desconto
          wVlDesconto := strtofloat(formatfloat('0.00',wVlDesconto));
        End;
      End;

}     if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
         wVl_Unitario  :=FormatFloat('0.00',wVlUnitario)
      Else
         wVl_Unitario  :=FormatFloat('0.000',wVlUnitario);
      wVl_Total     :=FormatFloat('0.00',(QItemNFQt_Quantidade.Value*StrToFloat(wVl_Unitario)) - QItemNFVAL_DESCONTO_RATEIO.Value);
      If wImpressora <> 'BEMATECH' Then  // IMPRESSORA YANCO DA ENCOPEL FOI COLOCADO <> PARA NAO DAR PROBLEMA NA ENCOPEL
       Begin
         wEnviar       := '14|' + wCod_Produto + '|' + wDesc_Produto + '|' + wVl_Unitario + '|' +
                         wQt_Quantidade + '|' + wVl_Total + '|' + wTributacao + '|0|';
         Y8000ECF(wEnviar);
       End
      Else
       Begin
         if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ' then
         begin
           wDecimal := 3;
           wTipoQtde := 'F';  //quantidade fracionaria
           wTipoDesconto := '%';
           wDesconto := FormatFloat('00.00',StrToFloat(bib.LimpaNumero(QItemNFPERC_DESCONTO.Text,true)));
           wDesconto := bib.LimpaNumero(wDesconto,false);
           wAcrescimo := '0';
           wIndice := '0';
           wQt_Quantidade := formatFloat('#0.000',QItemNFQT_QUANTIDADE.Value);
           wVl_Unitario  := formatFloat('#0.000', QItemNFVAL_UNITARIO.Value);
           wUnidade:=DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True);
         end
         else
         begin
           wDecimal := 2;
           wTipoQtde := 'F';  //quantidade fracionaria
           wTipoDesconto := '%';
           wDesconto := '0000';
           wAcrescimo := '0';
           wIndice := '0';
           wQt_Quantidade:=FloatToStr(Trunc(QItemNFQt_Quantidade.Value*1000));
           wVlUnitario  := Int(wVlUnitario*100);
           wVl_Total    :=FloatToStr(Int((QItemNFQt_Quantidade.Value*wVlUnitario) - QItemNFVAL_DESCONTO_RATEIO.Value)*100);
           wUnidade:=DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True);
         end;
         if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
            iRetorno := Bematech_FI_VendeItem( pchar(wCod_Produto), pchar(wDesc_Produto), pchar(wTributacao),
                        pchar(wTipoQtde), pchar(wQt_Quantidade), wDecimal, pchar(wVl_Unitario),
                        pchar(wTipoDesconto), pchar(wDesconto) )
         Else
            iRetorno := Bematech_FI_VendeItemDepartamento( pchar( wCod_Produto ),
                                              pchar( wDesc_Produto ),
                                              pchar( wTributacao ),
                                              pchar( wVl_Unitario ),
                                              pchar( wQt_Quantidade ),
                                              pchar( wAcrescimo ),
                                              pchar( wDesconto ),
                                              pchar( wIndice ),
                                              pchar( WUnidade ) );

         Analisa_iRetorno();
         Retorno_Impressora();
       End;
      wTotal := wTotal + (QItemNFVAL_TOTAL.Value - QItemNFVAL_DESCONTO.Value * QItemNFQt_Quantidade.Value);
      wVlDesconto := wVlDesconto + QItemNFVAL_DESCONTO_RATEIO.Value;
      QItemNF.Next;
    end;
    wDesconto := '0';
    If wVlDesconto > 0 Then
       wDesconto := FormatFloat('0.00',wVlDesconto);
    If wImpressora <> 'BEMATECH' Then
       Y8000ECF('1B|'+wDesconto+'|0000|0|');
    if Trim(wDinheiro) = '' then
       wDinheiro:= FormatFloat('0.00',wTotal - wVlDesconto);
{    else if StrToFloat(wDinheiro) <= wTotal then
            wDinheiro:=FormatFloat('0.00',wTotal);  }
    wEndereco := Copy(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value),True),1,42);
    wNome := Copy(DMOracle.BuscaNome('SELECT NOME FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value),True),1,42);
    If Trim(wNome) = '' Then
       wNome:=Copy(DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value),True),1,42);
    If wImpressora <> 'BEMATECH' Then
     Begin
       wNome := Trim(QNotaSaidaCod_Cadastro.Text)+'-'+wNome;
       wEnviar := ('31|'+wCnpj+'|'+wNome+'|'+wEndereco+'|'+Trim(QNotaSaidaObs.Value)+' |'+QNotaSaidaNum_Nota.Text+' |');
       If QNotaSaidaInd_Condicao_Pagto.Value = '1' Then
          Y8000ECF('15|01|'+wDinheiro+'|')   // Finalizar cupom a vista
       else If QNotaSaidaInd_Condicao_Pagto.Value = '4' Then
               Y8000ECF('15|03|'+wDinheiro+'|')   // Finalizar cupom cartao de credito
            else
               Y8000ECF('15|04|'+wDinheiro+'|');  // Finalizar cupom a prazo   era '15|07|'
       Y8000ECF(wEnviar);
       Y8000ECF('16|00|                 GRATOS|                  PELA|           P R E F E R E N C I A| |'); //Fecha cupom
       Result := True;
     End
    Else
     Begin
       if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BORGES' Then
       Begin
         wAcreDesc := 'D';
         wTipoDesconto := '$';
         wCNPJ := Copy(DMOracle.BuscaNome('SELECT DESC_CGC_CPF FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         If Trim(wCNPJ) = '' Then
            wCNPJ := Copy(DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value),True),1,48);
         wCidade := Copy(DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         If Trim(wCidade) = '' Then
            wCidade := Copy(DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value),True),1,48);
         wEndereco := Copy(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         If Trim(wEndereco) = '' Then
            wEndereco := Copy(DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value),True),1,48);
         wEstado := Copy(DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value)),1,48);
         wNomeVend:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QNotaSaidaCod_Vendedor.Value));
         wNomeVend:=wNomeVend + ' Nf Nr.:'+QNotaSaidaNum_Nota.Text;
         wCidade := wCidade + ' UF:'+wEstado;
         wNome := Copy(('Nome:'+Trim(QNotaSaidaCod_Cadastro.Text)+'-'+wNome + '                                                '),1,48);
         wVendedor := Copy(('Vendedor:'+wNomeVend + '                                                '),1,48);
         wCNPJ := Copy(('CPF/CNPJ:'+ wCNPJ +'                                                '),1,48);
         wEndereco := Copy(('Endereco:'+wEndereco + '                                                '),1,48);
         wCidade := Copy(('Cidade:'+ wCidade + '                                                '),1,48);
         wVl_Total_Trib := Copy(('Val. Total Aprox. Trib.:'+ StringReplace(QSomaItemNotaVAL_TOTAL_TRIB.Text,'.',',',[rfReplaceAll])  + '                                                '),1,48);
         iRetorno := Bematech_FI_FechaCupom( pchar(wFormaPagto), pchar(wAcreDesc), pchar(wTipoDesconto),
                     pchar(wDesconto), pchar(wDinheiro),pchar(wNome+wCNPJ+wEndereco+wCidade+wVendedor+wVl_Total_Trib));

         Analisa_iRetorno();
         Retorno_Impressora();
       end
       else
       Begin
         wNomeVend:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QNotaSaidaCod_Vendedor.Value),True);
         wNomeVend:=wNomeVend + ' Nf Nr.:'+QNotaSaidaNum_Nota.Text;
//         wCondicao:=''; //DMOracle.BuscaNome('SELECT DESC_PRAZO_VENCIMENTO FROM TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = '+FloatToStr(QNotaSaidaCod_Prazo_Vencimento.Value));
         wCondicao := DMOracle.BuscaNome('SELECT DESC_CGC_CPF || ' + QuoteDSTR(' IE:') +  '|| DESC_INSCRICAO FROM TB_NOME_NOTA','COD_NOTA_CAB = '+FloatToStr(QNotaSaidaCod_Nota_Cab.Value));
         if wCondicao = '' Then
            wCondicao := DMOracle.BuscaNome('SELECT NUM_CGC_CPF || ' + QuoteDSTR(' IE:') +  '|| NUM_INSCRICAO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QNotaSaidaCod_Cadastro.Value),True);
         wAcreDesc := 'D';
         wTipoDesconto := '$';
         wNome := Copy(('Nome:'+Trim(QNotaSaidaCod_Cadastro.Text)+'-'+wNome + '                                                '),1,48);
         If QNotaSaidaDt_Emissao.Value <> QNotaSaidaDt_Recebimento.Value Then
            wCondicao := 'Cpf/Cnpj:'+wCondicao + ' Emissao:'+QNotaSaidaDt_Emissao.Text;
         wCondicao := Copy(('Cnpj/Cpf:'+wCondicao + '                                                '),1,48);
         wVendedor := Copy(('Vendedor:'+wNomeVend + '                                                '),1,48);
         wEntrada := Copy(('Entrada:'+QNotaSaidaVal_Avista.Text + '                                                '),1,48);
         wReceber1 := '';
         wReceber2 := '';
         wReceber3 := '';
         wReceber4 := '';
         wVl_Total_Trib := Copy(('Val. Total Aprox. Trib.:'+ FormatFloat( '#,##0.00',QSomaItemNotaVAL_TOTAL_TRIB.Value)  + '                                                '),1,48);
         QContaReceber.Open;
         QContaReceber.First;
         While not QContaReceber.Eof Do
          Begin
            If QContaReceberNum_Parcela.Value = 1 Then
               wReceber1 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 2 Then
               wReceber1 := wReceber1 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 3 Then
               wReceber2 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 4 Then
               wReceber2 := wReceber2 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 5 Then
               wReceber3 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 6 Then
               wReceber3 := wReceber3 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 7 Then
               wReceber4 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            If QContaReceberNum_Parcela.Value = 8 Then
               wReceber4 := wReceber4 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
            QContaReceber.Next;
          End;
          QContaReceber.Close;
          If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GERVASIO') Or
            (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOMBELLI') Then
            wReceber4 := 'Placa:' + QNotaSaidaDesc_Placa.Value + '  Km:'+IntToStr(QNotaSaidaNum_Km.Value);

          wReceber1 := Copy((wReceber1 + '                                                '),1,48);
          wReceber2 := Copy((wReceber2 + '                                                '),1,48);
          wReceber3 := Copy((wReceber3 + '                                                '),1,48);
          wReceber4 := Copy((wReceber4 + '                                                '),1,48);
  //       iRetorno := Bematech_FI_EfetuaFormaPagamento( pchar( wFormaPagto ), pchar( wDinheiro ) );


//**************************************************************************
        //rotina do TEF
          wIsTef := false;
          if wFormaPagto = 'T.E.F.' then
          begin
            wIsTef := true;
//            iRetorno := Bematech_FI_IniciaFechamentoCupom(pchar(wAcreDesc), pchar(wTipoDesconto), pchar(wDesconto) );
//            Analisa_iRetorno();
//            Retorno_Impressora();

            //Guarda no registro o códiogo da filial
            //para o caso de dar erro na impressão do TEF
            Registry := TRegistry.Create;//executa o tregistry
            Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
            Registry.OpenKey('SOFTWARE\CemapaSistema',true);
            Registry.WriteString('FilialTEF',QNotaSaidaCOD_FILIAL.Text);
            //-------------------------------------------
            if FTef = nil then
              FTef := TFTef.Create(Application);
            FTEF.ValorTransacao := (DMNotaSaida.QSomaItemNotaSVal_Total_Nota.Value -
              DMNotaSaida.QNotaSaidaVAL_AVISTA.Value);
            FTEF.Modalidade := 0;
            FTEF.NumNota := DMNotaSaida.QNotaSaidaNUM_NOTA.Text;
			      FTEF.CodNotaCab := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
            FTEF.btIniciaTef.Visible := true;
            FTEF.Comprovantes := TStringList.Create;
            FTEF.lbMensagem.Caption := '';
            FTEF.ValorDinheiro := 0;
            FTEF.ValorDesconto := 0;
            //FTEF.PrimeiraInicializacao := True;
            if FTEF.ShowModal = mrOk then
            begin
              if not(verificaImpressoraLigada) then
              begin
                FTEF.Finaliza(FINALIZA_CANCELANDO);
                FTEF.FormStyle := fsNormal;
                MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
                FTEF.FormStyle := fsStayOnTop;
                FStatusTEF := FINALIZA_CANCELANDO;
                Abort;
              end;
              wDesconto := formatfloat('#####0.00',(StrToFloat(wDesconto) + FTEF.ValorDesconto));
              iRetorno := Bematech_FI_IniciaFechamentoCupom(pchar(wAcreDesc), pchar(wTipoDesconto), pchar(wDesconto) );
              Analisa_iRetorno();
              Retorno_Impressora();
			        if FTEF.FormaPagamento <> '' then
              begin
			  	      if not(verificaImpressoraLigada) then
              	begin
				          FTEF.Finaliza(FINALIZA_CANCELANDO);
                  FTEF.FormStyle := fsNormal;
                  MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
                  FTEF.FormStyle := fsStayOnTop;
                  FStatusTEF := FINALIZA_CANCELANDO;
                  Abort;
			          end;
                iRetorno := Bematech_FI_EfetuaFormaPagamento(pchar(FTEF.FormaPagamento), pchar(FloatToStr((FTEF.ValorTransacao - ftef.ValorDesconto)*100)));
                Analisa_iRetorno();
                Retorno_Impressora();
			        end;
              if ftef.ValorDinheiro > 0 then
              begin
                if not(verificaImpressoraLigada) then
                begin
                  FTEF.Finaliza(FINALIZA_CANCELANDO);
                  FTEF.FormStyle := fsNormal;
                  MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
                  FTEF.FormStyle := fsStayOnTop;
                  FStatusTEF := FINALIZA_CANCELANDO;
                  Abort;
                end;
                iRetorno := Bematech_FI_EfetuaFormaPagamento(pchar('Dinheiro'), pchar(FloatToStr(FTEF.ValorDinheiro*100)));
                Analisa_iRetorno();
                Retorno_Impressora();
              end;
              if not(verificaImpressoraLigada) then
              begin
                FTEF.Finaliza(FINALIZA_CANCELANDO);
                FTEF.FormStyle := fsNormal;
                MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
                FTEF.FormStyle := fsStayOnTop;
                FStatusTEF := FINALIZA_CANCELANDO;
                Abort;
              end;

              Bematech_FI_TerminaFechamentoCupom(pchar(wNome+wVendedor+wEntrada+wVl_Total_Trib+wCondicao+wReceber1+wReceber2+wReceber3+wReceber4));
              Analisa_iRetorno();
              Retorno_Impressora();
			        with DMTEF do
              begin
                if not QTefCab.Eof then
                begin
                  QTefCab.Edit;
                  QTefCabIND_STATUS.Value := 'PENDENTE';
                  QTefCabDT_EMISSAO.Value := Now;
                  QTefCab.Post;
                end;
              end;
              wFinaliza := true;
              if FTEF.Comprovantes.Count > 0 then
                wFinaliza := FTEF.ImprimeTransacaoTEF;

              if wFinaliza then
              begin
                FTEF.Finaliza(FINALIZA_CONFIRMANDO);
                FStatusTEF := FINALIZA_CONFIRMANDO;
              end
              else
              begin
                FTEF.Finaliza(FINALIZA_CANCELANDO);
                FTEF.FormStyle := fsNormal;
                MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
                FTEF.FormStyle := fsStayOnTop;
                FStatusTEF := FINALIZA_CANCELANDO;
                CancelaCupomCompleto;
              end;
            end
            else
            begin
              FTEF.Finaliza(FINALIZA_CANCELANDO);
              MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
              FStatusTEF := FINALIZA_CANCELANDO;
              CancelaCupomCompleto;
            end;
          end
          else
          begin
            iRetorno := Bematech_FI_FechaCupom( pchar(wFormaPagto), pchar(wAcreDesc), pchar(wTipoDesconto),
                       pchar(wDesconto), pchar(wDinheiro),pchar(wNome+wVendedor+wEntrada+wVl_Total_Trib+wCondicao+wReceber1+wReceber2+wReceber3+wReceber4));  //+'Obrigado, volte sempre !!!'
            Analisa_iRetorno();
            Retorno_Impressora();
          end;
      //Fim da rotina do TEF
//**************************************************************************

       end;
       // 2 via de cupom fiscal
       if DMOracle.FastSelect('IND_SEGUNDA_VIA_CUPOM','TB_OPERACAO',
        'COD_OPERACAO = ' + QNotaSaidaCOD_OPERACAO.Text) = 'SIM' then
        if not wIsTef then
          ImprimeComprovanteNaoFiscalVinculado
     End;
  end;
end;

function TFImpressoraFiscal.verificaImpressoraLigada: boolean;
begin
  iRetorno := Bematech_FI_VerificaImpressoraLigada;
  while((iRetorno <> 1) and (MessageDlg('Impressora não responde. Deseja tentar novamente? (Sim/Não)', mtConfirmation, [mbYes, mbNo], 0) = mrYes)) do
  begin
    iRetorno := Bematech_FI_VerificaImpressoraLigada;
  end;
  result := iRetorno = 1;
end;

procedure TFImpressoraFiscal.Y8000ECF(Comando: string);
var Arqenv:textfile;
begin
  AssignFile(arqenv,'yancoecf');
  Rewrite(arqenv);
  Writeln(arqenv,Comando);
  CloseFile(Arqenv);
  AnaliseRet;
  Edit1.Text:=retorno;
  AnaliseRet;
  Edit2.Text:=retorno;
end;

procedure TFImpressoraFiscal.BtnAvancarLinhaClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     Edit1.Text:= '';
     Edit2.Text:= '';
     Y8000ECF('21|3|');  // Avançar tres linhas.
   End;
end;

procedure TFImpressoraFiscal.BtnIniciarDiaClick(Sender: TObject);
var    wUsuario,wValor,wFormaPagamento: string;
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
   Begin
     if DMUsuario.QUsuario.Active = False then
        DMUsuario.QUsuario.Open;
     if DMUsuario.QUsuarioNOME.Value = '' then
        wUsuario:= 'Supervisor'
     else
        wUsuario:= Copy(Trim(DmUsuario.QUsuarioNOME.Value),1,13);

     Y8000ECF('12|1|'+wUsuario+'|');
   End
  Else
   Begin
    wValor := '0000';
    wFormaPagamento := 'DINHEIRO';
    iRetorno := Bematech_FI_AberturaDoDia(pchar(wValor), pchar(wFormaPagamento));
    Analisa_iRetorno;
    Retorno_Impressora;
   End;

end;

procedure TFImpressoraFiscal.BtnFecharCupomClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
     Y8000ECF('16|00|**************|*****FMU****|************| |');
  // FMU = Fechamento manual pelo usuario. Causa provavel problema de impressão.
end;

procedure TFImpressoraFiscal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //comentado pois as funções desta unit são usadas em outras tela, considerando que esta já está criada.
  //E tambem porque no onCreate dela, faz a verificação de se a impressora está OK. Alessandro em 05/04/13
  //Action := CaFree;
  //FImpressoraFiscal := Nil;
end;

Procedure TFImpressoraFiscal.Analisa_iRetorno(pAbortar: Boolean=false);
  var wErro: Boolean;
Begin
  wErro := false;
    if iRetorno = 0 then
    begin
       Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                                MB_IconError + MB_OK);
       wErro := true;
    end;
    If iRetorno = -1 Then
    begin
       Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                                MB_IconError + MB_OK);
      wErro := true;
    end;
    if iRetorno = -2  then
    begin
       Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                                MB_IconError + MB_OK);
      wErro := true;
    end;
    if iRetorno = -3  then
    begin
       Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    If iRetorno = -4 Then
    begin
       Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    If iRetorno = -5 Then
    begin
       Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);
      wErro := true;
    end;

    If iRetorno = -6 Then
    begin
       Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    If iRetorno = -7 Then
    begin
       Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    If iRetorno = -8 Then
    begin
       Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);
      wErro := true;
    end;

    if iRetorno = -18 then
    begin
       Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -19 then
    begin
       Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -20 then
    begin
       Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -21 then
    begin
       Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -22 then
    begin
       Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -23 then
    begin
       Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -24 then
    begin
       Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -25 then
    begin
       Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -26 then
    begin
       Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if iRetorno = -28 then
    begin
       Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);
      wErro := true;
    end;

    if wErro then
    begin
      pPafEcfLiberado := false;
      HabilitaBotoes(pPafEcfLiberado);
      if pAbortar then
        Abort;
    end;
end;

Function TFImpressoraFiscal.Retorno_Impressora(pMostraMsg: Boolean=true): Boolean;
var
  wMsg: TStrings;
Begin
  wMsg := TStringList.Create;
  wMsg.Clear;
  iACK := 0; iST1 := 0; iST2 := 0; iST3 := 0;
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  if (iST1 > 0) then
    wMsg.AddStrings(Analisa_iST1);
  if (iST2 > 0) then
    wMsg.AddStrings(Analisa_iST2);
  if (iST3 > 0) then
    wMsg.Add(Analisa_iST3());
  if (wMsg.Count > 0) and pMostraMsg then
    MessageDlg(Trim(wMsg.Text), mtError, [mbOK], 0);

  result := wMsg.Count = 0;
End;

procedure TFImpressoraFiscal.BtCancelaCupomClick(Sender: TObject);
begin
  If DMParamSistema.QParamSistemaCod_Empresa.Value =  'ENCOPEL' Then
     Y8000ECF('1E')
  Else
   Begin
     iRetorno := Bematech_FI_CancelaCupom();
     Analisa_iRetorno();
     Retorno_Impressora();
   End;

end;

procedure TFImpressoraFiscal.BtArquivoMagneticoClick(Sender: TObject);
var retImpressora: Integer;
begin
  retImpressora := Bematech_FI_VerificaImpressoraLigada;
  if retImpressora = 1 then
   Begin
     Bematech_FI_RegistrosTipo60;
     if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
     FAguarde.Show();
     Application.ProcessMessages;
     Sleep(5000);
     FAguarde.Close;
     if DMParamSistema.CodEmpresa = 'SAVI' then
       LeArquivoTexto(PathBematech()+'RETORNO.TXT', 3)
     else
       LeArquivoTexto('C:\RETORNO.TXT', 3)
   End
  else
    MessageDlg('Impressora desligada ou com problema de comunicação.'+#13+#10+'Erro: ' + IntToStr(retImpressora), mtWarning, [mbOK], 0);
  MessageDlg('Importação concluída.', mtInformation, [mbOK], 0);
end;

procedure TFImpressoraFiscal.LeArquivoTexto(Arquivo: String; pRegistros: Integer;
  pImportacao: boolean = false; Dados: String = '');
var arq: TextFile;
  linha, wData, wHora, wNumSubst, wDados: String;
  mestre, wQtdeReg, wCount,wSeq,wContReducao: Integer;
  wDataEmissao: TDateTime;
  wDataMovimento, wAuxData, wAno, wMes, wDia, wNumSerie: String;
  wArquivo, wCooRz, wModelo, wIndDescontoIssqn, wAuxAliq: String;
  wAuxValor: Real;
  wAliquotasIss: TAliquotasSet;
  wPafEcf: Boolean;
  wRepositorio: String;
  wArquivoRepositorio,wArquivoBackupPaf: Textfile;
  wDataReducaoPersistencia, wDadosArqRep, wDataAuxEmissao: String;
Begin
  wAliquotasIss := getIndiceAliquotasIss;
  //wArquivo := 'c:\Retorno.TXT';
  wArquivo := Arquivo;
  wRepositorio := CriaDiretorioRepositorio('REDUCAOZ');
  wPafEcf := (DMOracle.FastSelect('IND_PAF_ECF','TB_PARAM_SISTEMA','1=1') = 'S');

  //Para pegar o número sequencial da ipressora fiscal
  try
    AssignFile (arq, wArquivo);
    Reset(arq);
    while not Eof(arq) do
    begin
      Readln(arq,linha);
      if (copy(linha, 3, 1) = 'M') then
      begin
        wSeq := StrToInt(Copy(linha, 32, 3));
        linha := '';
        break;
      end;
    end;
  Except
    if MessageDlg('Não foi possível localizar o arquivo de retorno.'+#13#10+
      'Deseja tentar gerar o arquivo novamente?',mtError,[mbYes,mbNo],0) = mrYes then
      BtArquivoMagneticoClick(Self)
    else
      Exit;
  end;

  //Checa se é um arquivo de redução z
  Inc(wContReducao);
  Reset(arq);
  Readln(arq,linha);
  if Copy(linha,1,3) <> '60M' then
  begin
    if MessageDlg('O arquivo c:\Retorno.txt não se trata de um arquivo '+
        'de Redução Z.' + #13#10 +
        'O sitema tentará importar a redução z novamente ao clicar em SIM.',
        mtConfirmation,[mbYes,mbNo],0) = MrYes then
    begin
      CloseFile(arq);
      if not DeleteFile(wArquivo) then
      begin
        MessageDlg('O sitema não pôde excluir o arquivo c:\Retorno.txt.' +
          #13#10 + 'Por favor, exclua-o manualmente e clique em OK.', mtError,
          [mbOk],0);
      end;
      BtArquivoMagneticoClick(Self);
      Exit;
    end
    else
    begin
      MessageDlg('A redução Z foi emitida mas não foi importada para o sistema.'
        + #13#10 +
        'Por favor informe a Cemapa sobre este problema.', mtError,
        [mbOk],0);
      wContReducao := 0;
      Exit;
    end;
  end
  else
  begin
    //No caso de ser uma importação deve pegar a data da movimentação da redução Z
    wAuxData := copy(linha,10,2)+'/'+copy(linha,8,2)+'/'+copy(linha,4,4);
  end;

  wContReducao := 0;
  CloseFile(arq);

  if (pRegistros = 3) or (pImportacao) then     //gera registros 60M e 60A
  begin
    if not pImportacao then
    begin
      SetLength(wDados, 1279);
      iRetorno := Bematech_FI_DadosUltimaReducaoMFD(wDados);
      Analisa_iRetorno;
      if (iRetorno <> 1) or not(Retorno_Impressora) then
        Exit;
      AssignFile(arq, 'c:\DadosRZAnterior.txt');
      Rewrite(arq);
      Write(arq, wDados);
      
      CloseFile(arq);
      wCooRz := copy(wDados, 14, 6);
      wDia := copy(wDados, 1273,2);
      wMes := copy(wDados, 1275, 2);
      wAno := '20' + copy(wDados, 1277, 2);
      wAuxData := copy(wDados, 1273, 2) + '/' + wMes + '/' + wAno;
      wNumSerie := NumSerie;
      if wNumSerie = '' then
        Exit;

      try
        //Salva redução no repositório de arquivos retorno
        AssignFile(arq,wArquivo);
        AssignFile(wArquivoRepositorio, wRepositorio+'\'+
          wAno+wMes+wDia+'REDUCAO.txt');
        Reset(arq);
        while not Eof(arq) do
        begin
          Readln(arq,linha);
          wDadosArqRep := wDadosArqRep + linha;
        end;
        Rewrite(wArquivoRepositorio);
        Write(wArquivoRepositorio,wDadosArqRep);
        CloseFile(wArquivoRepositorio);
        if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
        begin
          AssignFile(wArquivoBackupPaf,
          pathArquivosPAFECF+'021002'+copy(wNumSerie,7,Length(wNumSerie))+
            wDia+wMes+wAno+'.txt');
          Rewrite(wArquivoBackupPaf);
          Write(wArquivoBackupPaf,wDadosArqRep);
          CloseFile(wArquivoBackupPaf);
        end;
        CloseFile(arq);

        //Salva dados de redução no repositório de arquivos retorno
        AssignFile(arq, wRepositorio+'\'+
          wAno+wMes+wDia+'DADOS.txt');
        Rewrite(arq);
        Write(arq,wDados);
        CloseFile(arq);

        //Persistem arquivo retorno no banco de dados do jeito que foi gerado
        wDataReducaoPersistencia := wDia+'/'+wMes+'/'+wAno;
        if wDataReducaoPersistencia = '00/00/2000' then
          wDataReducaoPersistencia := '01/01/1900'; // uma data qualquer que não seja a atual
        PersisteReducaoRepositorio(wNumSerie,wDadosArqRep,wDados,
          StrToDate(wDataReducaoPersistencia),wSeq);

        //Exclui arquivo do repositório
        DeleteFile(wRepositorio+'\'+wAno+wMes+wDia+'REDUCAO.txt');
        DeleteFile(wRepositorio+'\'+wAno+wMes+wDia+'DADOS.txt');
      Except
        //Deixa o arquivo no repositório
      end;
    end;
    if pImportacao then
    begin
      AssignFile(arq, Dados);
      Reset(arq);
      Readln(arq, wDados);
      CloseFile(arq);
      wCooRz := copy(wDados, 14, 6);
      wDia := copy(wDados, 1273,2);
      wMes := copy(wDados, 1275, 2);
      wAno := '20' + copy(wDados, 1277, 2);
      wDataAuxEmissao := copy(wDados, 1273, 2) + '/' + wMes + '/' + wAno;
      wNumSerie := NumSerie;
      if wNumSerie = '' then
        Abort;
      if wDataAuxEmissao <> '//20' then
        wDataEmissao := StrToDate(wDataAuxEmissao)
      else
        wDataEmissao := DMOracle.DataServ;
    end;
    wQtdeReg := StrToInt(DMOracle.FastSelect('COUNT(*)', 'TB_REGISTRO_TIPO60_MESTRE', 'DT_EMISSAO = '
      + QuotedStr(wDataReducaoPersistencia) + ' AND DESC_SERIE = ' + QuotedStr(wNumSerie) +
      ' AND NUM_SEQUENCIAL = ' + IntToStr(wSeq)));
    if wQtdeReg = 0 then           //verifica se o registro ja não foi importado.
    begin
      if wPafEcf then
      begin
        if not getArquivoSintegra(wArquivo, wMes, wAno,pRegistros) then //gera o arquivo com os registros informados nos parametros
          Abort;
        wModelo := Trim(DMOracle.FastSelect('DESC_MODELO', 'TB_ECF', 'NUM_SERIE = ' + QuotedStr(wNumSerie)));
        if (wModelo = 'MP-4000 TH FI') or (wModelo = 'MP-7000 TH FI') then
        begin
          if not getIndDescontoIssqn(wIndDescontoIssqn) then
            Exit;
        end
        else
          wIndDescontoIssqn := '';
      end;
      if (not pImportacao) and (not getDataHoraReducao(wDataEmissao))  then
      begin
        MessageDlg('A Redução Z não foi importada para o sistema. ' +
          'Não foi possível obter a data da Redução Z' + #13#10 +
          'Por favor comunique a Cemapa sobre este erro.', mtError, [mbOk],0);
        Exit;
      end;
      if not getNumeroSubstituicoes(wNumSubst) then
      begin
        MessageDlg('A Redução Z não foi importada para o sistema. ' +
          'Não foi possível obter o número de substituições' + #13#10 +
          'Por favor comunique a Cemapa sobre este erro.', mtError, [mbOk],0);
        Exit;
      end;

      AssignFile (arq, wArquivo);
      Reset(arq);
      try
        DMOracle.DBCemapa.StartTransaction;
        while not Eof(arq) do
        begin
          ReadLn (arq, linha);
          wDataMovimento := Copy(linha, 10, 2) + '/' + Copy(linha, 8, 2) + '/' + Copy(linha, 4, 4); //Extrai a data do movimento. Caso não for o Registro 60M pode pegar valores errados, mas só é utilizado quando é o 60M.
          if (copy(linha, 3, 1) = 'M') and (wAuxData = wDataMovimento) then
          Begin
            with DMImpressoraFiscal do
            begin
              QReg60M.Close;
              QReg60M.Open;
              QReg60A.Close;
              QReg60A.Open;
              QReg60M.Insert;
              QReg60MDT_EMISSAO.Value := StrToDate(wDataMovimento); //Para esclarecimento, o campo DT_EMISSAO se refere á data de movimento da respectiva redução z
              QReg60MDESC_SERIE.Value := Trim(Copy(linha, 12, 20));
              QReg60MNUM_SEQUENCIAL.Value := StrToInt(Copy(linha, 32, 3));
              QReg60MDESC_MODELO.Value := Copy(linha, 35, 2);
              QReg60MNUM_COO_INI.Value := StrToInt(Trim(Copy(linha, 37, 6)));
              QReg60MNUM_COO_FIN.Value := StrToInt(Trim(Copy(linha, 43, 6)));
              QReg60MNUM_CONTADOR_REDUCAOZ.Value := StrToInt(Trim(Copy(linha, 49, 6)));
              QReg60MNUM_REINICIO_OPRERACAO.Value := StrToInt(Trim(Copy(linha, 55, 3)));
              QReg60MVAL_VENDA_BRUTA.Value := StrToFloat(Trim(Copy(linha, 58, 16))) / 100;
              QReg60MVAL_TOTAL_GERAL.value := StrToFloat(Trim(Copy(linha, 74, 16))) / 100;
              QReg60MDT_HORA_EMISSAO_RZ.Value := wDataEmissao;
              QReg60MNUM_USUARIO.Value := StrToInt(wNumSubst);
              QReg60MNUM_COO_RZ.Value := StrToInt(wCooRz);
              QReg60MIND_DESCONTO_ISSQN.Value := wIndDescontoIssqn;
              QReg60M.Post;

              //Insere os valores tributados
              for wCount := 0 to 15 do
              begin
                wAuxValor := StrToFloat(Copy(wDados, 335 + 14 * wCount, 14))/100;
                if (wAuxValor >= 0.01) then
                begin
                  wAuxAliq := bib.AjustaStrContrario(IntToStr(wCount + 1), 2, '0');
                  if wCount + 1 in wAliquotasIss then
                    wAuxAliq := wAuxAliq + 'S'
                  else
                    wAuxAliq := wAuxAliq + 'T';
                  wAuxAliq := wAuxAliq + copy(wDados, 1208 + 4 * wCount, 4);
                  QReg60A.Insert;
                  QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                  QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                  QReg60ADESC_SERIE.Value := wNumSerie;
                  QReg60AIND_SITUACAO_TRIBUTARIA.Value := wAuxAliq;
                  QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := wAuxValor;
                  QReg60A.Post;
                end;
              end;
              //insere os valores isentos de ICMS.
              if Copy(wDados, 560, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                //QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'I1';
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'I';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 560, 14))/100;
                QReg60A.Post;
              end;
              //insere os valores de não insidência de ICMS.
              if Copy(wDados, 575, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                //QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'N1';
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'N';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 575, 14))/100;
                QReg60A.Post;
              end;
              //insere os valores de Subst.Trib de ICMS.
              if Copy(wDados, 590, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                //QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'F1';
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'F';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 590, 14))/100;
                QReg60A.Post;
              end;
              //insere os valores de isenção de ISSQN.
              if Copy(wDados, 605, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                //QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'IS1';
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'ISS';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 605, 14))/100;
                QReg60A.Post;
              end;

              //insere os valores de não insidencia de ISSQN
              {if Copy(wDados, 620, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'NS1';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 620, 14))/100;
                QReg60A.Post;
              end;}

              //insere os valores de Substituição Tributária - ISSQN
              {if Copy(wDados, 635, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'FS1';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 635, 14))/100;
                QReg60A.Post;
              end;}

              //insere os valores de desconto de ICMS
              if Copy(wDados, 650, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                //QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'DT';
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'DESC';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 650, 14))/100;
                QReg60A.Post;
              end;

              //insere os valores de desconto de ISSQN
              {if Copy(wDados, 665, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'DS';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 665, 14))/100;
                QReg60A.Post;
              end;}

              //insere os valores de acrescimo de ICMS
              {if Copy(wDados, 680, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'AT';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 680, 14))/100;
                QReg60A.Post;
              end;}

              //insere os valores de acrescimo de ISSQN
              {if Copy(wDados, 695, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'AS';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 695, 14))/100;
                QReg60A.Post;
              end;
              }
              //insere os valores de cancelamento de ICMS
              if Copy(wDados, 710, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                //QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'Can-T';
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'CANC';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 710, 14))/100;
                QReg60A.Post;
              end;

              //insere os valores de cancelamento de ISSQN
              {if Copy(wDados, 725, 14) <> '00000000000000' then
              begin
                QReg60A.Insert;
                QReg60ACOD_REGISTRO_MESTRE.Value := QReg60MCOD_REGISTRO_MESTRE.Value;
                QReg60ADT_EMISSAO.Value := StrToDate(wDataMovimento);
                QReg60ADESC_SERIE.Value := wNumSerie;
                QReg60AIND_SITUACAO_TRIBUTARIA.Value := 'Can-S';
                QReg60AVLR_ACUMULADO_TOTAL_PARCIAL.Value := StrToFloat(Copy(wDados, 725, 14))/100;
                QReg60A.Post;
              end;}

              DMOracle.DBCemapa.Commit;
              CloseFile(arq);
              Break;
            end;
          end;
        end;
      except
        on e : Exception do
        begin
          MessageDlg('Erro na importação com a seguinte mensagem: ' + #13+#10
            + e.Message, mtError, [mbOK], 0);
          DMOracle.DBCemapa.Rollback;
        end;
      end;
    end;
  end
  else if pRegistros = 16 then
  begin
    if not getDataHoraImpressora(wData, wHora) then
      Exit;
    wMes := copy(wData, 3, 2);
    wAno := copy(wData, 5, 2);
    if wMes = '01' then     //para gerar do mes anterior.
    begin
      wMes := '12';
      wAno := IntToStr(StrToInt(wAno)-1);
    end
    else
      wMes := bib.AjustaStrContrario(IntToStr(StrToInt(wMes)-1), 2, '0');

    if not getArquivoSintegra(wArquivo, wMes, wAno, pRegistros) then //gera o arquivo com os registros informados nos parametros
      Exit;

    AssignFile (arq, wArquivo);
    Reset(arq);
    ReadLn(arq, linha);
    DMImpressoraFiscal.QReg60R.Close;
    DMImpressoraFiscal.QReg60R.Open;
    while not Eof(arq) do
    begin
      ReadLn (arq, linha);
      with DMImpressoraFiscal do
      begin
        if (copy(linha, 3, 1) = 'R') then
        begin
         { wQtdeReg := StrToInt(DMOracle.FastSelect('COUNT(*)', 'TB_REGISTRO_TIPO60_RESUMO', 'NUM_MES = '
            + QuotedStr(Copy(linha, 4, 2)) + ' AND NUM_ANO = ' + QuotedStr(Copy(linha, 6, 4))));
          if wQtdeReg > 0 then
            Continue; } //Verificar como funciona quando tem mais de um ECF.
          QReg60R.Insert;
          QReg60RNUM_MES.Value := StrToInt(Copy(linha, 4, 2));
          QReg60RNUM_ANO.Value := StrToInt(Copy(linha, 6, 4));
          QReg60RCOD_PRODUTO.Value := Copy(linha, 10, 14);
          QReg60RQT_QUANTIDADE.Value := StrToFloat(Copy(linha, 24, 10) + '.' + Copy(linha, 34, 3));
          QReg60RVAL_PRODUTO.Value := StrToFloat(Copy(linha, 37, 14) + '.' + Copy(linha, 51, 2));
          QReg60RVAL_BASE_ICMS.Value := StrToFloat(Copy(linha, 53, 14) + '.' + Copy(linha, 67, 2));
          QReg60RIND_SITUACAO_TRIBUTARIA.Value := Copy(linha, 69, 4);
          QReg60RPERC_ALIQUOTA.Value := 0;
          QReg60R.Post;
        end;
      end;
    end;
    CloseFile(arq);
  end;
End;

// Esta procedure deve ser chamada na inicialização do vendas. Marlon - 11/2013
procedure TFImpressoraFiscal.ChecaReducaoZAutomatica;
var arq: TextFile;
  linha, wArquivoReducao,wDadosReducaoAnt: String;
  wDia,wMes,wAno,wAuxData,wNumCaixa: String;
  wData: TDateTime;
begin
  //Checa se o arquivo Retorno.txt existe
  //Se existir é computador com impressora fiscal
  if FileExists('c:\Retorno.txt') then
  begin
    //Carrega os dados da Redução
    AssignFile(arq,'c:\Retorno.txt');
    Reset(arq);
    while not Eof(arq) do
    begin
      Readln(arq,linha);
      wArquivoReducao := wArquivoReducao + linha;
    end;
    CloseFile(arq);

    //Tenta utilizar o arquivo DadosRZAnterior em disco, se não achar
    //Gera um arquivo novo
    if FileExists('c:\DadosRZAnterior.txt') then
    begin
      AssignFile(arq, 'c:\DadosRZAnterior.txt');
      Reset(arq);
      Read(arq,wDadosReducaoAnt);
      CloseFile(arq);
      try
        if StrToInt(Trim(Copy(wDadosReducaoAnt,9,4))) <>
          StrToInt(Trim(Copy(wArquivoReducao,49,6))) then
        begin
          wDadosReducaoAnt := ''; //para gerar um arquivo novo logo abaixo
        end;
        Except
          Abort; //Se o arquivo c:\Retorno.txt não for o da redução
        end;
    end;

    //Importa os dados da última redução da impressora fiscal
    //e salva em disco
    if wDadosReducaoAnt = '' then
    begin
      SetLength(wDadosReducaoAnt, 1279);
      iRetorno := Bematech_FI_DadosUltimaReducaoMFD(wDadosReducaoAnt);
      Analisa_iRetorno;
      if (iRetorno <> 1) or not(Retorno_Impressora) then
        Abort;
      AssignFile(arq, 'c:\DadosRZAnterior.txt');
      Rewrite(arq);
      Writeln(arq, wDadosReducaoAnt);
      CloseFile(arq);
    end;

    //Verifica se a última redução foi feita automática ou manualmente pelo
    //sistema
    if Trim(Copy(wDadosReducaoAnt,1,2)) = '01' then //Automática
    begin
      //Verifica se o arquivo Retorno.txt é da última redução Z emitida
      if StrToInt(Trim(Copy(wDadosReducaoAnt,9,4))) =
        StrToInt(Trim(Copy(wArquivoReducao,49,6))) then
      begin
        wDia := copy(wDadosReducaoAnt, 1273,2);
        wMes := copy(wDadosReducaoAnt, 1275, 2);
        wAno := '20' + copy(wDadosReducaoAnt, 1277, 2);
        wAuxData := wDia + '/' + wMes + '/' + wAno;
        wNumCaixa := Copy(wArquivoReducao, 32, 3);
        try
          wData := StrToDate(wAuxData);
        Except
          MessageDlg('A importação da redução Z não foi efetuada.' + #13#10 +
            'A data retornada pela impressora fiscal não é válida '+ #13#10 +
            wAuxData ,mtInformation, [mbOk],0);
          Abort;
        end;
        PersisteReducaoRepositorio(NumSerie,wArquivoReducao,wDadosReducaoAnt,
          wData,StrToInt(wNumCaixa));
      end
      else
      begin
        MessageDlg('A importação da redução Z não foi efetuada.' + #13#10 +
          'O arquivo Retorno.txt encontrado não é o arquivo da última '+
          'redução Z efetuada',mtInformation, [mbOk],0);
      end;
    end;
  end;
end;

procedure TFImpressoraFiscal.BtResumoMensalClick(Sender: TObject);
var
  wDia, wMesW, wAnoW: Word;
  wArquivo, wMes, wAno, wRazaoSocial, wEndereco, wNumero, wComplemento, wBairro, wCidade, wCep,
  wTelefone, wFax, wContato: String;
  ret: integer;
begin
  iRetorno := Bematech_FI_VerificaImpressoraLigada;
  if iRetorno = 1 then
  Begin
    DecodeDate(Date, wAnoW, wMesW, wDia);
    if wMesW > 1 then
    begin
      wMes := FloatToStr(wMesW - 1);
      wAno := IntToStr(wAnoW);
    end
    else
    begin
      wMes := '12';
      wAno := FloatToStr(wAnoW - 1);
    end;
    InputQuery('Geração do Resumo Mensal (60R)', 'Mês', wMes);
    InputQuery('Geração do Resumo Mensal (60R)', 'Ano', wAno);
    if Length(wAno) <> 4 then
      Raise Exception.Create('Ano inválido');
    wMes := FormatFloat('00', StrToInt(wMes));
    with DMFilial do
    begin
      QFilial.Close;
      QFilial.SetVariable('PK', DMUsuario.CodFilialUsuario);
      QFilial.Open;
      if DMParamSistema.CodEmpresa = 'SAVI' then
        wArquivo := InputBox('Arquivo', 'Salvar em: ', PathBematech()+'RETORNO.TXT')
      else
        wArquivo := InputBox('Arquivo', 'Salvar em: ', 'C:\RETORNO.TXT');
      wRazaoSocial := Copy(QFilialDESC_FILIAL.Value,1,35);
      wEndereco := Copy(QFilialDESC_ENDERECO.Value,1,34);
      wNumero := Copy(QFilialNUM_ENDERECO.Text,1,5);
      wComplemento := Copy(QFilialDESC_COMPLEMENTO_ENDERECO.Value,1,22);
      wBairro := Copy(QFilialDESC_BAIRRO.Value,1,15);
      wCidade := Copy(QFilialDESC_CIDADE.Value,1,30);
      wCep := Copy(Bib.LimpaString(QFilialDESC_CEP.Value,'-'),1,8);
      wTelefone := Copy(Bib.LimpaString(QFilialDESC_TELEFONE.Value,'-,. ()'),1,12);
      wFax := Copy(Bib.LimpaString(QFilialDESC_FAX.Value,'-,. ()'),1,10);
      wContato := Copy(QFilialDESC_NOME_CONTATO.Value,1,18);
      ret := Bematech_FI_RelatorioSintegraMFD(16,
//          wArquivo,
//          wMes,
//          wAno,
//          wRazaoSocial,
//          wEndereco,
//          wNumero,
//          wComplemento,
//          wBairro,
//          wCidade,
//          wCep,
//          wTelefone,
//          wFax,
//          wContato);
          pChar(wArquivo),
          pChar(wMes),
          pChar(wAno),
          pChar(wRazaoSocial),
          pChar(wEndereco),
          pChar(wNumero),
          pChar(wComplemento),
          pChar(wBairro),
          pChar(wCidade),
          pChar(wCep),
          pChar(wTelefone),
          pChar(wFax),
          pChar(wContato));
//      ShowMessage('Retorno da funcao: ' + IntToStr(ret));
      case ret of
      0: ShowMessage('Retorno da função: Erro de Comunicação');
      1: ShowMessage('Retorno da função: Ok');
      -1: ShowMessage('Retorno da função: Erro de execução da função.');
      -2: ShowMessage('Retorno da função: Parâmetro inválido');
      -4: ShowMessage('Retorno da função: Arquivo ini não encontrado ou parâmetro inválido para o nome da porta');
      -5: ShowMessage('Retorno da função: Erro ao abrir a porta de comunicação');
      -27: ShowMessage('Retorno da função: Status da impressora diferente de 6,0,0,0 (Ack, St1, St2 e St3)');
      end;
    end;
    if ret = 1 then
    begin
      Sleep(2000);
      if (MessageDlg('Ler arquivo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        if DMParamSistema.CodEmpresa = 'SAVI' then
          LeArquivoTexto(PathBematech()+'RETORNO.TXT', 16)
        else
          LeArquivoTexto('C:\RETORNO.TXT', 16);
        MessageDlg('Importação concluída com êxito.', mtInformation, [mbOK], 0);
      end;
    end;
  End
  else
  begin
    //MessageDlg('Impressora desligada ou com problema de comunicação.'+#13+#10+'Erro: ' + IntToStr(iRetorno), mtWarning, [mbOK], 0);
    Analisa_iRetorno;
  end;
end;

function TFImpressoraFiscal.PathBematech(): String;
var arqIni: TextFile;
  linha: String;
begin
  AssignFile (arqIni, ExtractFilePath(Application.ExeName) + 'BemaFI32.ini');
  {$I-}
  Reset(arqIni);
  {$I+}
  while(not eof(arqIni)) do
  begin
    ReadLn(arqIni, linha);
    if AnsiContainsStr(linha, 'Path=') then
    begin
      CloseFile(arqIni);
      result := copy(linha, pos('=', linha)+1, Length(linha));
      break;
    end;
  end;
end;

procedure TFImpressoraFiscal.FormCreate(Sender: TObject);
  var wHabilita, wDataEcf, wHoraEcf, wNumeroCupom: string;
  wCodNotaCab: Integer;
  wLiberado: Boolean;
  x,y: Array of String;
begin 
  BtResumoMensal.Visible := true;
  
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
  begin
    if not VerificaPAFECFLiberado then
      Abort;
    if not RunningUnderDelphi then
    begin
      PageControl1.Pages[0].TabVisible := false;
      PageControl1.TabIndex :=1;
    end;
    SetLength(wNumeroCupom, 7);
    wHabilita := '1';
    Bematech_FI_HabilitaDesabilitaRetornoEstendidoMFD(pchar(wHabilita));
    if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
    Application.ProcessMessages;

    wCodNotaCab := ultimoCupomAberto;
    if wCodNotaCab <> 0 then
    begin
      iRetorno := Bematech_FI_VerificaEstadoImpressoraMFD(iACK, iST1, iST2, iST3);
      //se tem redução pendente ou se está bloqueado por RZ quer dizer que o cupom já não está aberto, e foi cancelado portanto deve ser cancelado no sistema
      if (iRetorno = 1) and ((iST3 = 66) or (iST3 = 63)) then
      begin
        with DMImpressoraFiscal do
        begin
          QCupomFiscalCab.Close;
          QCupomFiscalCab.SetVariable('PK', wCodNotaCab);
          QCupomFiscalCab.Open;
          QCupomFiscalCab.Edit;
          QCupomFiscalCabIND_SITUACAO.Value := '3'; //cancela
          QCupomFiscalCab.Post;
          wCodNotaCab := 0;
        end;
      end
    end;

    wLiberado := VerificaPAFECFLiberado;
    if wLiberado then
    begin
      if not wListaMD5Gerada then
      begin
        geraRelMd5Executaveis;
        wListaMD5Gerada := true;
      end;
      FAguarde.Close;
      if wCodNotaCab <> 0 then
      begin
        Bematech_FI_ContadorCupomFiscalMFD(wNumeroCupom);
        with DMImpressoraFiscal do
        begin
          QCupomFiscalCab.Close;
          QCupomFiscalCab.SetVariable('PK', wCodNotaCab);
          QCupomFiscalCab.Open;
        end;
        //se o cupom digitado for o que está na impressora ele deve ser cancelado.
        if StrToInt(Trim(wNumeroCupom)) = DMImpressoraFiscal.QCupomFiscalCabNUM_NOTA.Value then
        begin
          with DMImpressoraFiscal,DMOracle do
          begin
            if (Trim(DMOracle.FastSelect('COUNT(*)','TB_TEF_CAB','COD_NOTA_CAB = '+
                DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Text)) = '0') then
            begin
              if CancelaCupom then
              begin
                with DMImpressoraFiscal do
                begin
                  QCupomFiscalCab.Edit;
                  QCupomFiscalCabIND_SITUACAO.Value := '3'; //cancela
                  QCupomFiscalCab.Post;
                end;
                MessageDlg('O cupom fiscal que estava aberto no ECF foi cancelado.', mtError, [mbOK], 0);
              end;
            end;
          end;
        end
        else
        begin
          with DMImpressoraFiscal do
          begin
            QCupomFiscalCab.Edit;
            QCupomFiscalCabIND_SITUACAO.Value := '3'; //cancela
            QCupomFiscalCab.Post;
          end;
        end;
      end
    end
    else
      FAguarde.Close;
  end
  else
  begin
    PageControl1.Pages[0].TabVisible := true;
    PageControl1.Pages[1].TabVisible := false;
    PageControl1.Pages[2].TabVisible := false;
  end;
end;

function TFImpressoraFiscal.AbreCF(pCadastro: Integer; var pData:TDateTime;
  var pNumeroCupom: Integer; var pNumCOO: Integer; var pNumSerieEcf:string;
  FClienteSemCad: TForm = Nil): Boolean;
var
  wCPF, wNome, wEndereco, wData, wHora, wNumeroCupom, wNumCOO: String;
  wBuscador: TBuscador;
  i: integer;
begin
  SetLength(wNumeroCupom, 7);
  SetLength(wNumCOO, 7);
  if FClienteSemCad = Nil then
  begin
    wBuscador := TBuscador.Create;
    wBuscador.Limpa;
    wBuscador.Adiciona('NUM_CGC_CPF', 'TB_CADASTRO','COD_CADASTRO = ' + IntToStr(pCadastro));
    wBuscador.Adiciona('NOME', 'TB_CADASTRO','COD_CADASTRO = ' + IntToStr(pCadastro));
    wBuscador.Adiciona('DESC_ENDERECO', 'TB_CADASTRO','COD_CADASTRO = '+ IntToStr(pCadastro));
    wBuscador.buscar;
    wCPF := copy(wBuscador.proximo,1,29);
    wNome := copy(wBuscador.proximo,1,30);
    wEndereco := copy(wBuscador.proximo,1,79);
    wBuscador.fecha;
  end
  else
  begin
    wCPF := TFcupomfiscalParam(FClienteSemCad).leCGCCPF.Text;
    wNome := TFcupomfiscalParam(FClienteSemCad).leNome.Text;
    if Trim(TFcupomfiscalParam(FClienteSemCad).leNumero.Text) <> '' then
    wEndereco := TFcupomfiscalParam(FClienteSemCad).leEndereco.Text+', '+
      Trim(TFcupomfiscalParam(FClienteSemCad).leNumero.Text)
    else
      wEndereco := TFcupomfiscalParam(FClienteSemCad).leEndereco.Text+
      ' S/N';
  end;
  iRetorno := Bematech_FI_AbreCupomMFD(pchar(wCPF), pchar(wNome), pchar(wEndereco));
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
  if Result then
  begin
    getDataHoraImpressora(wData, wHora);
    pData := StrToDateTime(copy(wData, 1, 2) + '/' + copy(wData, 3, 2) + '/20' + copy(wData, 5, 2)
      + ' ' + copy(wHora, 1, 2) + ':' + copy(wHora, 3, 2) + ':' + copy(wHora, 5, 2));
    if Bematech_FI_NumeroCupom(wNumCOO) = 1 then
      pNumCOO := StrToInt(Trim(wNumCOO))
    else
      pNumCOO := -1;
    if Bematech_FI_ContadorCupomFiscalMFD(wNumeroCupom) = 1 then
      pNumeroCupom := StrToInt(Trim(wNumeroCupom))
    else
      pNumeroCupom := -1;
    pNumSerieEcf := NumSerie;
  end;
end;

function TFImpressoraFiscal.VendeItem(var pNumItem: Integer): Boolean;
var
  wCodigo, wDescricao, wAliquota, wValor, wQtde, wAcresc, wDesc, wIndice, wUnidade, wTributacao, wNumItem: String;
  wGT: String;
  wBuscador: TBuscador;
begin
  SetLength(wNumItem, 5);
  with DMImpressoraFiscal do
  begin
    wBuscador := TBuscador.Create;
    wBuscador.Limpa;
    wBuscador.Adiciona('COD_TRIB_IMP_FISCAL', 'TB_TRIBUTACAO',
      'COD_TRIBUTACAO = ' + FloatToStr(QCupomFiscalItemCOD_TRIBUTACAO.Value));
    wBuscador.Adiciona('NUM_INDICE_TRIB_ECF', 'TB_TRIBUTACAO',
      'COD_TRIBUTACAO = ' + FloatToStr(QCupomFiscalItemCOD_TRIBUTACAO.Value));
    wBuscador.Buscar;

    wCodigo := QCupomFiscalItemDESC_COD_BARRA.AsString;
    wDescricao := QCupomFiscalItemdesc_produto.AsString;
    wValor := FormatFloat('#0.000', QCupomFiscalItemVAL_UNITARIO.Value);
    wQtde :=  FormatFloat('#0.000', QCupomFiscalItemQT_QUANTIDADE.value);
    wAcresc := '0';
    wDesc := '0';

    wTributacao := wBuscador.Proximo;
    if (Trim(wTributacao) = 'T') or (Trim(wTributacao) = 'S')   then
    begin
      wAliquota := wBuscador.Proximo;
      if trim(wAliquota) = '' then
        raise Exception.Create('Indice da tributação não informado.' + #13 + #10
          +'Confira a tributação utilizada e configure-a corretamente.');
    end
    else if Trim(wTributacao) = 'F' then
      wAliquota:= 'FF'
    else if Trim(wTributacao) = 'N' then
      wAliquota:= 'NN'
    else
      wAliquota:= 'II';

    wIndice := '0';
    wUnidade := DMOracle.FastSelect('DESC_UNIDADE','TB_PRODUTO',
      'COD_PRODUTO = '+QCupomFiscalItemCOD_PRODUTO.Text);

    wBuscador.Fecha;

    //Essas informações são para o PAF-ECF e vão sobrescrever as
    //anteriores
    if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    begin
      //se não encontrar nada retorna I de Isento
      wAliquota := DMOracle.FastSelect('NUM_INDICE_TRIB_ECF',
        'TB_TRIBUTACAO',
        'COD_TRIBUTACAO = ' + QCupomFiscalItemCOD_TRIBUTACAO.Text);
      if wAliquota  = '' then
      begin

        wAliquota := DMOracle.FastSelect('COD_TRIB_IMP_FISCAL','TB_TRIBUTACAO',
          'COD_TRIBUTACAO = '+ QCupomFiscalItemCOD_TRIBUTACAO.Text) + '1';
      end;
    end;

    iRetorno := Bematech_FI_VendeItemDepartamento( pchar( wCodigo ),
                                              pchar( wDescricao ),
                                              pchar( wAliquota ),
                                              pchar( wValor ),
                                              pchar( wQtde ),
                                              pchar( wAcresc ),
                                              pchar( wDesc ),
                                              pchar( wIndice ),
                                              pchar( wUnidade ) );
    Analisa_iRetorno();
    if iRetorno = 1 then
      result := Retorno_Impressora
    else
      result := false;
    if result then
    begin
      getGT(wGT);
      atualizaGT(wGT);
      if Bematech_FI_UltimoItemVendido(wNumItem) = 1 then
        pNumItem := StrToInt(wNumItem)
      else
        pNumItem := -1;
    end;
  end;
end;

function TFImpressoraFiscal.Analisa_iST1: TStrings;
var
  wMsg: TStrings;
begin
  wMsg := TStringList.Create;
  wMsg.Clear;
  If iSt1 >= 128 Then
  begin                                                // bit 7
    iSt1 := iSt1 - 128;
    wMsg.Add('Fim de Papel');
  End;
  If iSt1 >= 64 Then                                                // bit 6
    iSt1 := iSt1 - 64;
  If (iSt1 >= 32) Then
  begin                                                // bit 5
    iSt1 := iSt1 - 32;
    wMsg.Add('Erro no Relógio');
  End;
  If iSt1 >= 16 Then
  begin                                                // bit 4
    iSt1 := iSt1 - 16;
    wMsg.Add('Impressora em Erro');
  End;
  If iSt1 >= 8 Then                                                // bit 3
  begin
    iSt1 := iSt1 - 8;
    wMsg.Add('Comando não iniciado com ESC');
  End;
  If iSt1 >= 4 Then
  begin                                                // bit 2
    iSt1 := iSt1 - 4;
    wMsg.Add('Comando Inexistente');
  End;
  If iSt1 >= 2 Then
  begin                                                // bit 1
    iSt1 := iSt1 - 2;
    wMsg.Add('Cupom Aberto');
  End;
  If iSt1 >= 1 Then                                                // bit 0
  begin
    wMsg.Add('Número de Parâmetro(s) Inválido(s)');
  End;
  result := wMsg;
end;

function TFImpressoraFiscal.Analisa_iST2: TStrings;
var
  wMsg: TStrings;
begin
  wMsg := TStringList.Create;
  wMsg.Clear;
  If iSt2 >= 128 Then
  begin                                                // bit 7
    iSt2 := iSt2 - 128;
    wMsg.Add('Tipo de Parâmetro de Comando Inválido');
  End;
  If iSt2 >= 64 Then
  begin                                               // bit 6
    iSt2 := iSt2 - 64;
    wMsg.Add('Memória Fiscal Lotada');
  end;
  If (iSt2 >= 32) Then
  begin                                                // bit 5
    iSt2 := iSt2 - 32;
    wMsg.Add('Erro na Memória RAM');
  End;
  If iSt2 >= 16 Then
  begin                                                // bit 4
    iSt2 := iSt2 - 16;
    wMsg.Add('Alíquota Não Programada');
  End;
  If iSt2 >= 8 Then                                                // bit 3
  begin
    iSt2 := iSt2 - 8;
    wMsg.Add('Capacidade de Alíquotas Lotada');
  End;
  If iSt2 >= 4 Then
  begin                                                // bit 2
    iSt2 := iSt2 - 4;
    wMsg.Add('Cancelamento Não Permitido');
  End;
  If iSt2 >= 2 Then
  begin                                                // bit 1
    iSt2 := iSt2 - 2;
    wMsg.Add('CNPJ/IE do Proprietário Não Programado');
  End;
  If iSt2 >= 1 Then                                                // bit 0
  begin
    wMsg.Add('Comando Não Executado');
  End;
  result := wMsg;
end;

function TFImpressoraFiscal.Analisa_iST3: String;
begin
  case iST3 of
    1: result := 'COMANDO INVÁLIDO';
    2: result := 'ERRO DESCONHECIDO';
    3: result := 'NÚMERO DE PARÂMETRO INVÁLIDO';
    4: result := 'TIPO DE PARÂMETRO INVÁLIDO';
    5: result := 'TODAS ALÍQUOTAS JÁ PROGRAMADAS';
    6: result := 'TOTALIZADOR NÃO FISCAL JÁ PROGRAMADO';
    7: result := 'CUPOM FISCAL ABERTO';
    8: result := 'CUPOM FISCAL FECHADO';
    9: result := 'ECF OCUPADO';
    10: result := 'IMPRESSORA EM ERRO';
    11: result := 'IMPRESSORA SEM PAPEL';
    12: result := 'IMPRESSORA COM CABEÇA LEVANTADA';
    13: result := 'IMPRESSORA OFF LINE';
    14: result := 'ALÍQUOTA NÃO PROGRAMADA';
    15: result := 'TERMINADOR DE STRING FALTANDO';
    16: result := 'ACRÉSCIMO OU DESCONTO MAIOR QUE O TOTAL DO CUPOM FISCAL';
    17: result := 'CUPOM FISCAL SEM ITEM VENDIDO';
    18: result := 'COMANDO NÃO EFETIVADO';
    19: result := 'SEM ESPAÇO PARA NOVAS FORMAS DE PAGAMENTO';
    20: result := 'FORMA DE PAGAMENTO NÃO PROGRAMADA';
    21: result := 'ÍNDICE MAIOR QUE NÚMERO DE FORMA DE PAGAMENTO';
    22: result := 'FORMAS DE PAGAMENTO ENCERRADAS';
    23: result := 'CUPOM NÃO TOTALIZADO';
    24: result := 'COMANDO MAIOR QUE 7Fh (127d)';
    25: result := 'CUPOM FISCAL ABERTO E SEM ÍTEM';
    26: result := 'CANCELAMENTO NÃO IMEDIATAMENTE APÓS';
    27: result := 'CANCELAMENTO JÁ EFETUADO';
    28: result := 'COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO OU JÁ EMITIDO';
    29: result := 'MEIO DE PAGAMENTO NÃO PERMITE TEF';
    30: result := 'SEM COMPROVANTE NÃO FISCAL ABERTO';
    31: result := 'COMPROVANTE DE CRÉDITO OU DÉBITO JÁ ABERTO';
    32: result := 'REIMPRESSÃO NÃO PERMITIDA';
    33: result := 'COMPROVANTE NÃO FISCAL JÁ ABERTO';
    34: result := 'TOTALIZADOR NÃO FISCAL NÃO PROGRAMADO';
    35: result := 'CUPOM NÃO FISCAL SEM ÍTEM VENDIDO';
    36: result := 'ACRÉSCIMO E DESCONTO MAIOR QUE TOTAL CNF';
    37: result := 'MEIO DE PAGAMENTO NÃO INDICADO';
    38: result := 'MEIO DE PAGAMENTO DIFERENTE DO TOTAL DO RECEBIMENTO';
    39: result := 'NÃO PERMITIDO MAIS DE UMA SANGRIA OU SUPRIMENTO';
    40: result := 'RELATÓRIO GERENCIAL JÁ PROGRAMADO';
    41: result := 'RELATÓRIO GERENCIAL NÃO PROGRAMADO';
    42: result := 'RELATÓRIO GERENCIAL NÃO PERMITIDO';
    43: result := 'MFD NÃO INICIALIZADA';
    44: result := 'MFD AUSENTE';
    45: result := 'MFD SEM NÚMERO DE SÉRIE';
    46: result := 'MFD JÁ INICIALIZADA';
    47: result := 'MFD LOTADA';
    48: result := 'CUPOM NÃO FISCAL ABERTO';
    49: result := 'MEMÓRIA FISCAL DESCONECTADA';
    50: result := 'MEMÓRIA FISCAL SEM NÚMERO DE SÉRIE DA MFD';
    51: result := 'MEMÓRIA FISCAL LOTADA';
    52: result := 'DATA INICIAL INVÁLIDA';
    53: result := 'DATA FINAL INVÁLIDA';
    54: result := 'CONTADOR DE REDUÇÃO Z INICIAL INVÁLIDO';
    55: result := 'CONTADOR DE REDUÇÃO Z FINAL INVÁLIDO';
    56: result := 'ERRO DE ALOCAÇÃO';
    57: result := 'DADOS DO RTC INCORRETOS';
    58: result := 'DATA ANTERIOR AO ÚLTIMO DOCUMENTO EMITIDO';
    59: result := 'FORA DE INTERVENÇÃO TÉCNICA';
    60: result := 'EM INTERVENÇÃO TÉCNICA';
    61: result := 'ERRO NA MEMÓRIA DE TRABALHO';
    62: result := 'JÁ HOUVE MOVIMENTO NO DIA';
    63: result := 'BLOQUEIO POR RZ';
    64: result := 'FORMA DE PAGAMENTO ABERTA';
    65: result := 'AGUARDANDO PRIMEIRO PROPRIETÁRIO';
    66: result := 'AGUARDANDO RZ';
    67: result := 'ECF OU LOJA IGUAL A ZERO';
    68: result := 'CUPOM ADICIONAL NÃO PERMITIDO';
    69: result := 'DESCONTO MAIOR QUE TOTAL VENDIDO EM ICMS';
    70: result := 'RECEBIMENTO NÃO FISCAL NULO NÃO PERMITIDO';
    71: result := 'ACRÉSCIMO OU DESCONTO MAIOR QUE TOTAL NÃO FISCAL';
    72: result := 'MEMÓRIA FISCAL LOTADA PARA NOVO CARTUCHO';
    73: result := 'ERRO DE GRAVAÇÃO NA MF';
    74: result := 'ERRO DE GRAVAÇÃO NA MFD';
    75: result := 'DADOS DO RTC ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
    76: result := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR LEITURAS DA MFD';
    77: result := 'MEMÓRIA FISCAL SEM ESPAÇO PARA GRAVAR VERSAO DO SB';
    78: result := 'DESCRIÇÃO IGUAL A DEFAULT NÃO PERMITIDO';
    79: result := 'EXTRAPOLADO NÚMERO DE REPETIÇÕES PERMITIDAS';
    80: result := 'SEGUNDA VIA DO COMPROVANTE DE CRÉDITO OU DÉBITO NÃO PERMITIDO';
    81: result := 'PARCELAMENTO FORA DA SEQUÊNCIA';
    82: result := 'COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
    83: result := 'TEXTO COM SEQUÊNCIA DE ESC INVÁLIDA';
    84: result := 'TEXTO COM SEQUÊNCIA DE ESC INCOMPLETA';
    85: result := 'VENDA COM VALOR NULO';
    86: result := 'ESTORNO DE VALOR NULO';
    87: result := 'FORMA DE PAGAMENTO DIFERENTE DO TOTAL DA SANGRIA';
    88: result := 'REDUÇÃO NÃO PERMITIDA EM INTERVENÇÃO TÉCNICA';
    89: result := 'AGUARDANDO RZ PARA ENTRADA EM INTERVENÇÃO TÉCNICA';
    90: result := 'FORMA DE PAGAMENTO COM VALOR NULO NÃO PERMITIDO';
    91: result := 'ACRÉSCIMO E DESCONTO MAIOR QUE VALOR DO ÍTEM';
    92: result := 'AUTENTICAÇÃO NÃO PERMITIDA';
    93: result := 'TIMEOUT NA VALIDAÇÃO';
    94: result := 'COMANDO NÃO EXECUTADO EM IMPRESSORA BILHETE DE PASSAGEM';
    95: result := 'COMANDO NÃO EXECUTADO EM IMPRESSORA DE CUPOM FISCAL';
    96: result := 'CUPOM NÃO FISCAL FECHADO';
    97: result := 'PARÂMETRO NÃO ASCII EM CAMPO ASCII';
    98: result := 'PARÂMETRO NÃO ASCII NUMÉRICO EM CAMPO ASCII NUMÉRICO';
    99: result := 'TIPO DE TRANSPORTE INVÁLIDO';
    100: result := 'DATA E HORA INVÁLIDA';
    101: result := 'SEM RELATÓRIO GERENCIAL OU COMPROVANTE DE CRÉDITO OU DÉBITO ABERTO';
    102: result := 'NÚMERO DO TOTALIZADOR NÃO FISCAL INVÁLIDO';
    103: result := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
    104: result := 'ACRÉSCIMO OU DESCONTO EM SANGRIA OU SUPRIMENTO NÃO PERMITIDO';
    105: result := 'NÚMERO DO RELATÓRIO GERENCIAL INVÁLIDO';
    106: result := 'FORMA DE PAGAMENTO ORIGEM NÃO PROGRAMADA';
    107: result := 'FORMA DE PAGAMENTO DESTINO NÃO PROGRAMADA';
    108: result := 'ESTORNO MAIOR QUE FORMA PAGAMENTO';
    109: result := 'CARACTER NUMÉRICO NA CODIFICAÇÃO GT NÃO PERMITIDO';
    110: result := 'ERRO NA INICIALIZAÇÃO DA MF';
    111: result := 'NOME DO TOTALIZADOR EM BRANCO NÃO PERMITIDO';
    112: result := 'DATA E HORA ANTERIORES AO ÚLTIMO DOC ARMAZENADO';
    113: result := 'PARÂMETRO DE ACRÉSCIMO OU DESCONTO INVÁLIDO';
    114: result := 'ÍTEM ANTERIOR AOS TREZENTOS ÚLTIMOS';
    115: result := 'ÍTEM NÃO EXISTE OU JÁ CANCELADO';
    116: result := 'CÓDIGO COM ESPAÇOS NÃO PERMITIDO';
    117: result := 'DESCRICAO SEM CARACTER ALFABÉTICO NÃO PERMITIDO';
    118: result := 'ACRÉSCIMO MAIOR QUE VALOR DO ÍTEM';
    119: result := 'DESCONTO MAIOR QUE VALOR DO ÍTEM';
    120: result := 'DESCONTO EM ISS NÃO PERMITIDO';
    121: result := 'ACRÉSCIMO EM ÍTEM JÁ EFETUADO';
    122: result := 'DESCONTO EM ÍTEM JÁ EFETUADO';
    123: result := 'ERRO NA MEMÓRIA FISCAL CHAMAR CREDENCIADO';
    124: result := 'AGUARDANDO GRAVAÇÃO NA MEMÓRIA FISCAL';
    125: result := 'CARACTER REPETIDO NA CODIFICAÇÃO DO GT';
    126: result := 'VERSÃO JÁ GRAVADA NA MEMÓRIA FISCAL';
    127: result := 'ESTOURO DE CAPACIDADE NO CHEQUE';
    128: result := 'TIMEOUT NA LEITURA DO CHEQUE';
    129: result := 'MÊS INVÁLIDO';
    130: result := 'COORDENADA INVÁLIDA';
    131: result := 'SOBREPOSIÇÃO DE TEXTO';
    132: result := 'SOBREPOSIÇÃO DE TEXTO NO VALOR';
    133: result := 'SOBREPOSIÇÃO DE TEXTO NO EXTENSO';
    134: result := 'SOBREPOSIÇÃO DE TEXTO NO FAVORECIDO';
    135: result := 'SOBREPOSIÇÃO DE TEXTO NA LOCALIDADE';
    136: result := 'SOBREPOSIÇÃO DE TEXTO NO OPCIONAL';
    137: result := 'SOBREPOSIÇÃO DE TEXTO NO DIA';
    138: result := 'SOBREPOSIÇÃO DE TEXTO NO MÊS';
    139: result := 'SOBREPOSIÇÃO DE TEXTO NO ANO';
    140: result := 'USANDO MFD DE OUTRO ECF';
    141: result := 'PRIMEIRO DADO DIFERENTE DE ESC OU 1C';
    142: result := 'NÃO PERMITIDO ALTERAR SEM INTERVENÇÃO TÉCNICA';
    143: result := 'DADOS DA ÚLTIMA RZ CORROMPIDOS';
    144: result := 'COMANDO NÃO PERMITIDO NO MODO INICIALIZAÇÃO';
    145: result := 'AGUARDANDO ACERTO DE RELÓGIO';
    146: result := 'MFD JÁ INICIALIZADA PARA OUTRA MF';
    147: result := 'AGUARDANDO ACERTO DO RELÓGIO OU DESBLOQUEIO PELO TECLADO';
    148: result := 'VALOR FORMA DE PAGAMENTO MAIOR QUE MÁXIMO PERMITIDO';
    149: result := 'RAZÃO SOCIAL EM BRANCO';
    150: result := 'NOME DE FANTASIA EM BRANCO';
    151: result := 'ENDEREÇO EM BRANCO';
    152: result := 'ESTORNO DE CDC NÃO PERMITIDO';
    153: result := 'DADOS DO PROPRIETÁRIO IGUAIS AO ATUAL';
    154: result := 'ESTORNO DE FORMA DE PAGAMENTO NÃO PERMITIDO';
    155: result := 'DESCRIÇÃO FORMA DE PAGAMENTO IGUAL JÁ PROGRAMADA';
    156: result := 'ACERTO DE HORÁRIO DE VERÃO SÓ IMEDIATAMENTE APÓS RZ';
    157: result := 'IT NÃO PERMITIDA MF RESERVADA PARA RZ';
    158: result := 'SENHA CNPJ INVÁLIDA';
    159: result := 'TIMEOUT NA INICIALIZAÇÃO DA NOVA MF';
    160: result := 'NÃO ENCONTRADO DADOS NA MFD';
    161: result := 'SANGRIA OU SUPRIMENTO DEVEM SER ÚNICOS NO CNF';
    162: result := 'ÍNDICE DA FORMA DE PAGAMENTO NULO NÃO PERMITIDO';
    163: result := 'UF DESTINO INVÁLIDA';
    164: result := 'TIPO DE TRANSPORTE INCOMPATÍVEL COM UF DESTINO';
    165: result := 'DESCRIÇÃO DO PRIMEIRO ÍTEM DO BILHETE DE PASSAGEM DIFERENTE DE "TARIFA"';
    166: result := 'AGUARDANDO IMPRESSÃO DE CHEQUE OU AUTENTICAÇÃO';
    167: result := 'NÃO PERMITIDO PROGRAMAÇAO CNPJ IE COM ESPAÇOS EM BRANCO';
    168: result := 'NÃO PERMITIDO PROGRAMAÇÃO UF COM ESPAÇOS EM BRANCO';
    169: result := 'NÚMERO DE IMPRESSÕES DA FITA DETALHE NESTA INTERVENÇÃO TÉCNICA ESGOTADO';
    170: result := 'CF JÁ SUBTOTALIZADO';
    171: result := 'CUPOM NÃO SUBTOTALIZADO';
    172: result := 'ACRÉSCIMO EM SUBTOTAL JÁ EFETUADO';
    173: result := 'DESCONTO EM SUBTOTAL JÁ EFETUADO';
    174: result := 'ACRÉSCIMO NULO NÃO PERMITIDO';
    175: result := 'DESCONTO NULO NÃO PERMITIDO';
    176: result := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM SUBTOTAL NÃO PERMITIDO';
    177: result := 'DATA INVÁLIDA';
    178: result := 'VALOR DO CHEQUE NULO NÃO PERMITIDO';
    179: result := 'VALOR DO CHEQUE INVÁLIDO';
    180: result := 'CHEQUE SEM LOCALIDADE NÃO PERMITIDO';
    181: result := 'CANCELAMENTO ACRÉSCIMO EM ÍTEM NÃO PERMITIDO';
    182: result := 'CANCELAMENTO DESCONTO EM ÍTEM NÃO PERMITIDO';
    183: result := 'NÚMERO MÁXIMO DE ÍTENS ATINGIDO';
    184: result := 'NÚMERO DE ÍTEM NULO NÃO PERMITIDO';
    185: result := 'MAIS QUE DUAS ALÍQUOTAS DIFERENTES NO BILHETE DE PASSAGEM NÃO PERMITIDO';
    186: result := 'ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
    187: result := 'CANCELAMENTO DE ACRÉSCIMO OU DESCONTO EM ITEM NÃO PERMITIDO';
    188: result := 'CLICHE JÁ IMPRESSO';
    189: result := 'TEXTO OPCIONAL DO CHEQUE EXCEDEU O MÁXIMO PERMITIDO';
    190: result := 'IMPRESSÃO AUTOMÁTICA NO VERSO NÃO PERMITIDO NESTE EQUIPAMENTO';
    191: result := 'TIMEOUT NA INSERÇÃO DO CHEQUE';
    192: result := 'OVERFLOW NA CAPACIDADE DE TEXTO DO COMPROVANTE DE CRÉDITO OU DÉBITO';
    193: result := 'PROGRAMAÇÃO DE ESPAÇOS ENTRE CUPONS MENOR QUE O MÍNIMO PERMITIDO';
    194: result := 'EQUIPAMENTO NÃO POSSUI LEITOR DE CHEQUE';
    195: result := 'PROGRAMAÇÃO DE ALÍQUOTA COM VALOR NULO NÃO PERMITIDO';
    196: result := 'PARÂMETRO BAUD RATE INVÁLIDO';
    197: result := 'CONFIGURAÇÃO PERMITIDA SOMENTE PELA PORTA DOS FISCO';
    198: result := 'VALOR TOTAL DO ITEM EXCEDE 11 DÍGITOS';
    199: result := 'PROGRAMAÇÃO DA MOEDA COM ESPAÇOS EM BRACO NÃO PERMITIDO';
    200: result := 'CASAS DECIMAIS DEVEM SER PROGRAMADAS COM 2 OU 3';
    201: result := 'NÃO PERMITE CADASTRAR USUÁRIOS DIFERENTES NA MESMA MFD';
    202: result := 'IDENTIFICAÇÃO DO CONSUMIDOR NÃO PERMITIDA PARA SANGRIA OU SUPRIMENTO';
    203: result := 'CASAS DECIMAIS EM QUANTIDADE MAIOR DO QUE A PERMITIDA';
    204: result := 'CASAS DECIMAIS DO UNITÁRIO MAIOR DO QUE O PERMITIDA';
    205: result := 'POSIÇÃO RESERVADA PARA ICMS';
    206: result := 'POSIÇÃO RESERVADA PARA ISS';
    207: result := 'TODAS AS ALÍQUOTAS COM A MESMA VINCULAÇÃO NÃO PERMITIDO';
    208: result := 'DATA DE EMBARQUE ANTERIOR A DATA DE EMISSÃO';
    209: result := 'ALÍQUOTA DE ISS NÃO PERMITIDA SEM INSCRIÇÃO MUNICIPAL';
    210: result := 'RETORNO PACOTE CLICHE FORA DA SEQUÊNCIA';
    211: result := 'ESPAÇO PARA ARMAZENAMENTO DO CLICHE ESGOTADO';
    212: result := 'CLICHE GRÁFICO NÃO DISPONÍVEL PARA CONFIRMAÇÃO';
    213: result := 'CRC DO CLICHE GRÁFICO DIFERENTE DO INFORMADO';
    214: result := 'INTERVALO INVÁLIDO';
    215: result := 'USUÁRIO JÁ PROGRAMADO';
    217: result := 'DETECTADA ABERTURA DO EQUIPAMENTO';
    218: result := 'CANCELAMENTO DE ACRÉSCIMO/DESCONTO NÃO PERMITIDO';

  end;
end;

function TFImpressoraFiscal.verificaCupomAberto: boolean;
begin
  iretorno := Bematech_FI_VerificaEstadoImpressora(iACK, iST1, iST2);
  Analisa_iRetorno;
  if iRetorno = 1 then
  begin
    if iST1 > 0 then
    begin
      if iST1 >= 128 then
        iST1 := iST1 - 128;
      if iST1 >= 64 then
        iST1 := iST1 - 64;
      if iST1 >= 32 then
        iST1 := iST1 - 32;
      if iST1 >= 16 then
        iST1 := iST1 - 16;
      if iST1 >= 8 then
        iST1 := iST1 - 8;
      if iST1 >= 4 then
        iST1 := iST1 - 4;
      result := iST1 >= 2;
    end
    else
      result := false;
  end
  else
    result := false;
end;

function TFImpressoraFiscal.CancelaCupom: Boolean;
begin
  iRetorno := Bematech_FI_CancelaCupom;
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;

end;

function TFImpressoraFiscal.NumSerie: String;
var
  wNumero: String;
  i: Integer;
begin
  for i := 1 to 21 do
    wNumero := wNumero + ' ';

  iRetorno := Bematech_FI_NumeroSerieMFD(wNumero);
  Analisa_iRetorno(true); //se der erro abortar
  //Retorno_Impressora;

  result := trim(wNumero);
end;

procedure TFImpressoraFiscal.CadastraImpressora;
var
  wMarca,wModelo,wTipo,wMFAdicional: String;
  wDataUsuario,wDataSWBasico: TDateTime;
  wNumCaixa,wFirmware,wNumeroSerie,wCodFilial: String;
  wCNPJ: String;
  iConta: integer;
begin
  if NumSerie = 'EMULADOR' then
    Exit;
  for iConta := 1 to 21 do wCNPJ := wCNPJ + ' ';
  iRetorno := Bematech_FI_CNPJMFD( wCNPJ );
  Analisa_iRetorno;
  if (iRetorno <> 1) or not (Retorno_Impressora) then
    Abort;
  wCodFilial := DMOracle.FastSelect('COD_FILIAL','TB_FILIAL',
    'LIMPA_CNPJ(NUM_CGC) LIKE LIMPA_CNPJ(' +
    quotedStr(Trim(wCNPJ)) +')');

  wNumeroSerie := NumSerie;
  if (wNumeroSerie = '') or (wCodFilial = '') then
  begin
    MessageDlg('Não foi possível cadastrar os dados do ECF no banco de dados',
      mtWarning, [mbOk],0);
    Abort;
  end;

  //Para cadastrar nova impressora para teste
  //wNumeroSerie := 'BE051275610000155692';

  with DMImpressoraFiscal do
  begin
    if not getNumCaixa(wNumCaixa) then
        Abort;
    QECF.Close;
    QECF.SetVariable('PK', wNumeroSerie);
    QECF.SetVariable('SEQ',wNumCaixa);
    QECF.Open;
    if QECF.RecordCount = 0 then           //se o ECF ainda não está cadastrado, é feito o cadatro dele.
    begin
      if not getMarcaModeloTipo(wMarca, wModelo, wTipo) then
        Abort;
      wDataUsuario := 0;
      wDataSWBasico := 0;
      if not getDataUsuarioSWBasicoMFAdicional(wDataUsuario, wDataSWBasico, wMFAdicional) then
        Abort;
      if not getVersaoFirmware(wFirmware) then
        Abort;
      PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_ECF');
      QECF.Insert;
      QECFNUM_SERIE.Value := wNumeroSerie;
      QECFDESC_MARCA.Value := wMarca;
      QECFDESC_MODELO.Value := wModelo;
      QECFDESC_TIPO.Value := wTipo;
      QECFNUM_VERSAO_SB.Value := wFirmware;
      QECFDT_HORA_INSTALACAO_SB.Value := wDataSWBasico;
      QECFNUM_SEQ_ECF.Value := StrToInt(wNumCaixa);
      QECFIND_MF_ADICIONAL.Value := wMFAdicional;
      QECFCOD_FILIAL.Value := StrToInt(wCodFilial);
      QECF.Post;
      QChecaMD5ECF.Close;
      QChecaMD5ECF.SetVariable('NUM_SERIE',wNumeroSerie);
      QChecaMD5ECF.Open;
      bib.GeraMD5Query(QChecaMD5ECF,'TB_ECF');
//      bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//        true);
    end;
  end;
end;

procedure TFImpressoraFiscal.btLXClick(Sender: TObject);
var
  wQtdeRegistros: String;
  wData, wHora: String;
begin
  if not VerificaPAFECFLiberado then
    Exit;
  if FAguarde = Nil then
    FAguarde := TFAguarde.Create(Application);
  FAguarde.Show;
  try
    Application.ProcessMessages;
    iRetorno := Bematech_FI_LeituraX();
    Analisa_iRetorno;
    if (iRetorno <> 1) or not (Retorno_Impressora) then
      Abort;

    CadastraImpressora;
    AtualizaEstoqueDiario;
    FAguarde.Close;
    Application.ProcessMessages;
  Except
    FAguarde.Close;
  end;
end;

procedure TFImpressoraFiscal.btLMFCClick(Sender: TObject);
begin
  LeituraMemoriaFiscal;
end;

procedure TFImpressoraFiscal.LeituraMemoriaFiscal;
var
  wParamInicial, wParamFinal, wArqDestino, wOrigem, wUsuario, wParametros, wTipoDownload, wInicialFinal: String;
  wNumeroSerie: string;
  wTipo, wArquivoUnico, iConta: Integer;
  tipo: String;
begin
  if FImpressoraFiscalParam = nil then
    FImpressoraFiscalParam := TFImpressoraFiscalParam.Create(Application);
  FImpressoraFiscalParam.PGRelatorio.Pages[0].TabVisible := true; 
  //FImpressoraFiscalParam.rg1TipoSaida.Buttons[2].Visible := (tipo = 'C'); //apenas se for completa deve aparecer a opção de gerar o arquivo no formato ato copete/icms 17/04
  FImpressoraFiscalParam.rg1TipoSaida.ItemIndex := 0;
  if FImpressoraFiscalParam.ShowModal = mrOK then
  begin
    if FImpressoraFiscalParam.rg1Tipo.ItemIndex = 0 then
    begin
      tipo := 'C';

    end
    else
    begin
      tipo := 'S';

    end;
    if FImpressoraFiscalParam.rg1TipoParam.ItemIndex = 0 then            //por data
    begin
      if trim(FImpressoraFiscalParam.Fm1Datas.MeDtInicial.Text) = '' then
        raise Exception.Create('Informe a data inicial!');
      if trim(FImpressoraFiscalParam.Fm1Datas.MeDtFinal.Text) = '' then
        raise Exception.Create('Informe a data Final!');
      wParamInicial := FImpressoraFiscalParam.Fm1Datas.MeDtInicial.Text;
      wParamFinal := FImpressoraFiscalParam.Fm1Datas.MeDtFinal.Text;
    end
    else
    begin
      if trim(FImpressoraFiscalParam.meReducaoInicial.Text) = '' then
        raise Exception.Create('Informe a RZ inicial!');
      if trim(FImpressoraFiscalParam.meReducaoFinal.Text) = '' then
        raise Exception.Create('Informe a RZ Final!');
      wParamInicial := FImpressoraFiscalParam.MeReducaoInicial.Text;
      wParamFinal := FImpressoraFiscalParam.MeReducaoFinal.Text;
    end;

    if FImpressoraFiscalParam.rg1TipoSaida.ItemIndex = 0 then
    begin
      if not FaltaPapel then
      begin
        if FImpressoraFiscalParam.rg1TipoParam.ItemIndex = 0 then
           iRetorno := Bematech_FI_LeituraMemoriaFiscalDataMFD( pchar( wParamInicial ), pchar( wParamFinal ), pchar( tipo ) )
        else
          iRetorno := Bematech_FI_LeituraMemoriaFiscalReducaoMFD( pchar( wParamInicial ), pchar( wParamFinal ), pchar( tipo ) );
        Analisa_iRetorno;
        Retorno_Impressora;
        AtualizaEstoqueDiario;
      end
      else
      begin
        MessageDlg('Erro ao imprimir relatório',mtError,[mbOk],0);
        Abort;
      end;
    end
    else if FImpressoraFiscalParam.rg1TipoSaida.ItemIndex = 1 then
    begin
      if (VerificaPAFECFLiberado(false)) or ((not VerificaPAFECFLiberado(false)) and FaltaPapel) then
      begin
      if FAguarde = Nil then
        FAguarde := TFAguarde.Create(Application);
      FAguarde.Show();
      Application.ProcessMessages;
      if FImpressoraFiscalParam.rg1TipoParam.ItemIndex = 0 then
        iretorno := Bematech_FI_LeituraMemoriaFiscalSerialDataPAFECF(pchar(wParamInicial), pchar(wParamFinal), pchar(tipo),
          pchar(CHAVE_PUBLICA), pchar(CHAVE_PRIVADA))
      else
        iretorno := Bematech_FI_LeituraMemoriaFiscalSerialReducaoPAFECF(pchar(wParamInicial), pchar(wParamFinal), pchar(tipo),
          pchar(CHAVE_PUBLICA), pchar(CHAVE_PRIVADA));
      FAguarde.Close;
      if iRetorno = 1 then
      begin
        wArqDestino := ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\LMF' + tipo +'_ESPELHO.txt';
        if CopyFile(PAnsiChar(PathBematech +'Retorno.txt'), PAnsiChar(wArqDestino), false) then
          MessageDlg('O arquivo no formato espelho foi gerado em : ' + wArqDestino, mtInformation, [mbOK], 0)
        else
          MessageDlg('Erro ao gerar o arquivo em: ' + wArqDestino, mtError, [mbOK], 0);
      end;
      Analisa_iRetorno;
      Retorno_Impressora;
      end;
    end
    else if FImpressoraFiscalParam.rg1TipoSaida.ItemIndex = 2 then
    begin
      if tipo <> 'C' then
        raise Exception.Create('Função disponível apenas para LMFC!');
      wOrigem := '';
      wUsuario := '01';
      wParametros := 'D';
      wTipo := 0;
      wArquivoUnico := 1;
      iretorno := Bematech_FI_ArquivoMFD(pchar(wOrigem), pchar(wParamInicial), pchar(wParamFinal), pchar(wParametros),
        pchar(wUsuario), wTipo, pchar(CHAVE_PUBLICA), pchar(CHAVE_PRIVADA), wArquivoUnico);
      if iRetorno = 1 then
      begin
        for iConta := 1 to 21 do
          wNumeroSerie := wNumeroSerie + ' ';
        iRetorno := Bematech_FI_NumeroSerieMFD(wNumeroSerie);
        if (iRetorno <> 1) then
        begin
          Analisa_iRetorno;
          Retorno_Impressora;
        end
        else
        begin
          wOrigem := procurarArquivoGerado('MF' + copy(wNumeroSerie,1,20) + '*.TXT');
          wArqDestino := ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\' + copy(wOrigem, length(wOrigem) - 41, 42);
          if CopyFile(PAnsiChar(wOrigem), PAnsiChar(wArqDestino), false) then
            MessageDlg('O arquivo no formato ATO COPETE/ICMS 1704 foi gerado em : ' + wArqDestino, mtInformation, [mbOK], 0)
          else
            MessageDlg('Erro ao gerar o arquivo em: ' + wArqDestino, mtError, [mbOK], 0);
        end;
      end
      else
      begin
        Analisa_iRetorno;
        Retorno_Impressora;
      end;
    end;
  end;
end;

procedure TFImpressoraFiscal.btLMFSClick(Sender: TObject);
begin
  LeituraMemoriaFiscal;
end;

Function TFImpressoraFiscal.procurarArquivoGerado(pesquisa: string): String;
var
 f: TSearchRec;
 r: integer;
 wDiretorio, wArquivo: String;
 wDataHoraArquivo, wDataHoraAux: TDateTime;
 wDataAux: TSystemTime;
begin
  wDataHoraArquivo := 0;
  wDiretorio := PathBematech;
  if wDiretorio[length(wDiretorio)]<>'\' then
    wDiretorio := wDiretorio +'\';

  if not DirectoryExists(wDiretorio) then
  begin
    MessageDlg('Diretório não existe, entre em contato com o suporte!', mtError, [mbOK], 0);
    exit;
  end;
  r := FindFirst(wDiretorio+pesquisa,faArchive,f);
  while (r=0) do
  begin
    r := FindNext(f);
    FileTimeToSystemTime(f.FindData.ftCreationTime, wDataAux);
    wDataHoraAux := SystemTimeToDateTime(wDataAux);
    if (wDataHoraAux > wDataHoraArquivo) then
    begin
      wArquivo := wDiretorio + f.Name;
      wDataHoraArquivo := wDataHoraAux;
    end;
  end;
  result := wArquivo;
end;

procedure TFImpressoraFiscal.btEspelhoClick(Sender: TObject);
var
  wDestino, wUsuario, wDadoInicial, wDadoFinal, wTipoParametro: String;
  cArquivoOrigem: String;
  cArquivoDestino: String;
  cFormatoDados: String;
  cTipoLeitura: String;
  wAuxEAD: String;
  arq: TextFile;
  wParamInicial,wParamFinal,wNomeArquivo: String;
begin
  //if FImpressoraFiscalParam = nil then
//    FImpressoraFiscalParam := TFImpressoraFiscalParam.Create(Application);
//  FImpressoraFiscalParam.PGRelatorio.Pages[1].TabVisible := true;
//  if FImpressoraFiscalParam.ShowModal = mrOK then
//  begin
    if ((not VerificaPAFECFLiberado(false)) and (not FaltaPapel)) then
    begin
      MessageDlg('Não foi possível gerar o arquivo',mtError,[mbOk],0);
      Abort;
    end;
    wNomeArquivo :=
      'MF'+Copy(NumSerie,15,6)+'_'+FormatDateTime('yyyymmdd_hhmmss',now);
    wDestino := ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\'+
      wNomeArquivo;
    wUsuario := '1';
    //if FImpressoraFiscalParam.rg2TipoParamentro.ItemIndex = 0 then
//    begin
      //if trim(FImpressoraFiscalParam.Fm2Datas.MeDtInicial.Text) = '' then
//        raise exception.Create('Informe a data inicial!');
//      if trim(FImpressoraFiscalParam.Fm2Datas.MeDtFinal.Text) = '' then
//        raise exception.Create('Informe a data final!');
      //wDadoInicial := trim(FImpressoraFiscalParam.Fm2Datas.MeDtInicial.Text);
//      wDadoFinal := trim(FImpressoraFiscalParam.Fm2Datas.MeDtFinal.Text);
      wParamInicial := FormatDateTime('DDMMYY',StrToDate('01/01/1900'));
      wParamFinal := FormatDateTime('DDMMYY',DMOracle.DataServ);
      wTipoParametro := 'D';
   // end
//    else
//    begin
      //if trim(FImpressoraFiscalParam.meCOOInicial.Text) = '' then
//        raise exception.Create('Informe o COO inicial!');
//      if trim(FImpressoraFiscalParam.meCOOFinal.Text) = '' then
//        raise exception.Create('Informe o COO final!');
      //wDadoInicial := trim(FImpressoraFiscalParam.meCOOInicial.Text);
//      wDadoFinal := trim(FImpressoraFiscalParam.meCOOFinal.Text);
//      wParamInicial := wDadoInicial;
//      wParamFinal := wDadoFinal;
//      wTipoParametro := 'C';
    //end;
    if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
    FAguarde.Show;
    Application.ProcessMessages;

    iRetorno := Bematech_FI_DownloadMF(pchar(wDestino+'.MF'));
    Analisa_iRetorno;
    cArquivoOrigem  := wDestino+'.MF';
    cArquivoDestino := wDestino+'.TXT';
    cFormatoDados   := '0';
    cTipoLeitura    := 'C';

    iRetorno := Bematech_FI_FormatoDadosMF(
      pchar( cArquivoOrigem ),
      pchar( cArquivoDestino ),
      pchar( cFormatoDados ),
      pchar( cTipoLeitura ),
      pchar( wTipoParametro ),
      wParamInicial,
      wParamFinal);
    Analisa_iRetorno;

    wAuxEAD := '';
    setlength(wAuxEAD, 256);
    iRetorno := generateEAD(cArquivoDestino,
      CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
    if iRetorno = 0 then
      MessageDlg('Erro na assinatura do arquivo: ' + cArquivoDestino, mtError, [mbOK], 0);
    AssignFile(arq,cArquivoDestino);
    Reset(arq);
    Rewrite(arq);
    Write(arq,'EAD'+wAuxEAD);
    CloseFile(arq);

    FAguarde.Close;
    if (iRetorno = 1) and ((not Retorno_Impressora(false) and
      FaltaPapel) or Retorno_Impressora(false)) then
      MessageDlg('Arquivo gravado com sucesso em: ' + wDestino+'.MF' + #13#10+
        'Arquivo gravado com sucesso em: ' + wDestino+'.TXT',
         mtInformation, [mbOK], 0)
    else
      Analisa_iRetorno;
  //end;
end;

procedure TFImpressoraFiscal.btArqMFDClick(Sender: TObject);
var
  wOrigem, wUsuario, wDadoInicial, wDadoFinal, wTipoParametro, wNumeroSerie, wArqDestino, wArqOrigem: String;
  wTipo, wArquivoUnico: Integer;
  cFormatoDados: String;
  cTipoLeitura: String;
  wAuxEAD,wNomeArquivo: String;
  cTipoFormato, cTipoDownload: String;
  arq: TextFile;
begin
    if ((not VerificaPAFECFLiberado(false)) and (not FaltaPapel)) then
    begin
      MessageDlg('Não foi possível gerar o arquivo',mtError,[mbOk],0);
      Abort;
    end;
    wNomeArquivo :=
      'MFD'+Copy(NumSerie,15,6)+'_'+FormatDateTime('yyyymmdd_hhmmss',now);
    wOrigem := '';
    wArquivoUnico := 1;
    wUsuario := '1';
      wTipoParametro := 'D';
      wTipo := 1;
    if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
    FAguarde.Show;
    Application.ProcessMessages;
    wArqOrigem := ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\'
      + wNomeArquivo+'.MFD';
    wArqDestino := ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\'
      + wNomeArquivo+'.TXT';


    wDadoInicial := FormatDateTime('DD/MM/YY', StrToDate('01/01/1900'));
    wDadoFinal := FormatDateTime('DD/MM/YY', DmOracle.DataServ);

    iRetorno := Bematech_FI_DownloadMFD(pchar(wArqOrigem),
                                              pchar(IntToStr(wTipo)),
                                              pchar(wDadoInicial),
                                              pchar(wDadoFinal),
                                              pchar(wUsuario));
    Analisa_iRetorno;
    //Retorno_Impressora;


    cFormatoDados   := '0';
    cTipoLeitura    := 'C';
    cTipoFormato := '0';
    cTipoDownload := '0';
    iRetorno := Bematech_FI_FormatoDadosMFD(
      pchar( wArqOrigem ),
      pchar( wArqDestino ),
      pChar(cTipoFormato),
      pChar(cTipoDownload),
      pChar(wDadoInicial),
      pChar(wDadoFinal),
      pChar(wUsuario));
    Analisa_iRetorno;

    wAuxEAD := '';
    setlength(wAuxEAD, 256);
    iRetorno := generateEAD(wArqDestino,
      CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
    if iRetorno = 0 then
      MessageDlg('Erro na assinatura do arquivo: ' + wArqDestino, mtError, [mbOK], 0);
    AssignFile(arq,wArqDestino);
    Reset(arq);
    Rewrite(arq);
    Write(arq,'EAD'+wAuxEAD);
    CloseFile(arq);
    FAguarde.Close;
    if (iRetorno = 1) and ((not Retorno_Impressora(false) and
      FaltaPapel) or Retorno_Impressora(false)) then
      MessageDlg('Arquivo gravado com sucesso em: ' +wArqOrigem +#13#10+
        'Arquivo gravado com sucesso em: '+wArqDestino,
         mtInformation, [mbOK], 0);
  //end;
end;

procedure TFImpressoraFiscal.BitBtn2Click(Sender: TObject);
var
  ArqProdutos: TextFile;
  wLinha, wCaminhoArq, wAuxEAD, wUnidade,wHashMD5: String;
begin
  //with DMImpressoraFiscal do
//  begin
//    FAguarde.Show;
//    Application.ProcessMessages;
//    QRIdentificEmpresa.close;
//    QRIdentificEmpresa.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
//    QRIdentificEmpresa.Open;
//    QRTabProd.close;
//    QRTabProd.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
//    QRTabProd.Open;
//    wCaminhoArq := pathArquivosPAFECF + 'tabProd_'+ FormatDateTime('ddmmyyhhnnss', now) + '.txt';
//    AssignFile(ArqProdutos, wCaminhoArq);
//    Rewrite(ArqProdutos);
//
//    wLinha := 'P1' + bib.AjustaStrContrario(QRIdentificEmpresaNUM_CGC.AsString, 14, '0')
//      + bib.AjustaStr(QRIdentificEmpresaDESC_INSCRICAO.AsString, 14)
//        + bib.AjustaStr(QRIdentificEmpresaDESC_INSCRICAO_MUNICIPAL.AsString, 14)
//          + bib.AjustaStr(QRIdentificEmpresaDESC_FILIAL.AsString, 50);
//    Writeln(ArqProdutos, wLinha);
//    wLinha := '';
//    QRTabProd.First;
//    while not QRTabProd.Eof do
//    begin
//      //Valida produto
//      wHashMD5 := DMOracle.FastSelect('DESC_COD_BARRA||DESC_PRODUTO||COD_TRIBUTACAO||VAL_VAREJO',
//        'TB_PRODUTO','COD_PRODUTO = ' + QRTabProdCOD_PRODUTO.AsString);
//      wHashMD5 := bib.GetHashStringMD5(wHashMD5);
//      if wHashMD5 = QRTabProdDESC_HASH_MD5.Value then
//        wUnidade := bib.AjustaStr(QRTabProdDESC_UNIDADE.AsString, 6)
//      else
//        wUnidade := '??????';
//      //Valida tributação
//      if wUnidade <>  '??????' then
//      begin
//        wHashMD5 := bib.GetHashStringMD5(QRTabProdCOD_TRIB_IMP_FISCAL.Value+
//          bib.ift(QRTabProdPERC_ALIQUOTA.Text = '0','',QRTabProdPERC_ALIQUOTA.Text) +
//          QRTabProdDESC_SITUACAO_TRIB.Value +
//          QRTabProdDESC_CSOSN.Value);
//        if wHashMD5 <> QRTabProdDESC_HASH_MD5_TRIB.Value then
//        begin
//          wUnidade := '??????';
//        end;
//      end;
//      wLinha := 'P2' + bib.AjustaStrContrario(QRTabProdNUM_CGC.AsString, 14, '0')
//        + bib.AjustaStr(QRTabProdCOD_PRODUTO.AsString, 14)
//          + bib.AjustaStr(QRTabProdDESC_PRODUTO.AsString, 50)
//            + wUnidade
//              + QRTabProdIND_ARREDONDAMENTO_TRUNCAMENTO.AsString
//                + QRTabProdIND_PROD_PROPRIA_TERCEIRO.AsString
//                  + bib.AjustaStr(QRTabProdCOD_TRIB_IMP_FISCAL.AsString, 1)
//                    + bib.AjustaStrContrario(FloatToStr(QRTabProdALIQUOTA.Value * 100), 4, '0')
//                      + bib.AjustaStrContrario(FloatToStr(QRTabProdVAL_VAREJO.Value * 100), 12, '0');
//      Writeln(ArqProdutos, wLinha);
//      QRTabProd.Next;
//    end;
//    wLinha := 'P9' + bib.AjustaStrContrario(QRIdentificEmpresaNUM_CGC.AsString, 14, '0')
//      + bib.AjustaStr(QRIdentificEmpresaDESC_INSCRICAO.AsString, 14)
//        + bib.AjustaStrContrario(IntToStr(QRTabProd.RecordCount), 6, '0');
//    Writeln(ArqProdutos, wLinha);
//    CloseFile(ArqProdutos);
//    setlength(wAuxEAD, 256);
//    iRetorno := generateEAD(wCaminhoArq, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
//    FAguarde.Close;
//    if iRetorno = 0 then
//      MessageDlg('Erro na assinatura do arquivo!', mtError, [mbOK], 0)
//    else
//      MessageDlg('Arquivo gerado com sucesso em: ' + wCaminhoArq, mtInformation, [mbOK], 0);
//  end;
end;

function TFImpressoraFiscal.pathArquivosPAFECF: String;
begin
  result := ExtractFilePath(Application.ExeName)+'ARQUIVOS_ECF\';
end;

procedure TFImpressoraFiscal.BitBtn3Click(Sender: TObject);
var
  wCaminhoArq, wLinha, wAuxEAD, wParametroAdicional, wDataFormatada: string;
  ArqEstoque: TextFile;
  wHashMD5,wHashMD5Produto,wHashMD5Quantidade: String;
  wModeloECF,wUnidade: String;
begin
  //if FImpressoraFiscalParam = nil then
//    FImpressoraFiscalParam := TFImpressoraFiscalParam.Create(Application);
//  FImpressoraFiscalParam.PGRelatorio.Pages[2].TabVisible := true;
//  if FImpressoraFiscalParam.ShowModal = mrOk then
//  begin
//    with DMImpressoraFiscal do
//    begin
//      FAguarde.Show;
//      Application.ProcessMessages;
//
//      QRIdentificEmpresaE1.close;
//      QRIdentificEmpresaE1.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
//      QRIdentificEmpresaE1.SetVariable('DT_ESTOQUE', FormatDateTime('ddmmyy', dmoracle.DataServ));
//      QRIdentificEmpresaE1.Open;
//      QREstoqueE2.close;
//      QREstoqueE2.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
//      QREstoqueE2.SetVariable('DT_ESTOQUE', FormatDateTime('ddmmyy', dmoracle.DataServ));
//      if FImpressoraFiscalParam.rg3Tipo.ItemIndex = 0 then
//        QREstoqueE2.SetVariable('CODIGO_DESCRICAO', '1=1') //quando é total seta o paramentro como True(1=1)
//      else
//      begin
//        if FImpressoraFiscalParam.rg3TipoParametro.ItemIndex = 0 then
//        begin
//          wParametroAdicional := 'EDI.COD_PRODUTO IN(';
//          with DMImpressoraFiscal do
//          begin
//            cdsParametrosEstoque.First;
//            while not cdsParametrosEstoque.Eof do
//            begin
//              wParametroAdicional := wParametroAdicional + cdsParametrosEstoquecod_produto.AsString;
//              cdsParametrosEstoque.Next;
//              if cdsParametrosEstoque.eof then
//                wParametroAdicional := wParametroAdicional + ')'
//              else
//                wParametroAdicional := wParametroAdicional + ', '
//            end;
//          end;
//        end
//        else
//        begin
//          wParametroAdicional := 'UPPER(TRIM(P.DESC_PRODUTO)) IN(';
//          with DMImpressoraFiscal do
//          begin
//            cdsParametrosEstoque.First;
//            while not cdsParametrosEstoque.Eof do
//            begin
//              wParametroAdicional := wParametroAdicional + 'TRIM(' + QuotedStr(UpperCase(cdsParametrosEstoquedesc_produto.AsString)) + ')';
//              cdsParametrosEstoque.Next;
//              if cdsParametrosEstoque.eof then
//                wParametroAdicional := wParametroAdicional + ')'
//              else
//                wParametroAdicional := wParametroAdicional + ', ';
//                if DMOracle.FastSelect('COUNT(*)','TB_PRODUTO',
//                  'UPPER(TRIM(DESC_PRODUTO)) LIKE ' +
//                  quotedStr(
//                  UpperCase(
//                    Trim(cdsParametrosEstoquedesc_produto.AsString))
//                  )
//                  ) = '0' then
//                begin
//                  FAguarde.Close;
//                  MessageDlg('Produto não existe.' + #13#10 +
//                    UpperCase(cdsParametrosEstoquedesc_produto.AsString), mtError,
//                    [mbOk],0);
//                  Abort;
//                end;
//            end;
//          end;
//        end;
//        QREstoqueE2.SetVariable('CODIGO_DESCRICAO', wParametroAdicional);
//
//      end;
//      QREstoqueE2.Open;
//      wCaminhoArq := pathArquivosPAFECF + 'Estoque_'+ FormatDateTime('ddmmyyhhnnss', now) + '.txt';
//      AssignFile(ArqEstoque, wCaminhoArq);
//      Rewrite(ArqEstoque);
//
//      //wDataFormatada := '20' + copy(QRIdentificEmpresaE1DT_ESTOQUE.Value, 5, 2)
////        + copy(QRIdentificEmpresaE1DT_ESTOQUE.Value, 3, 2) + copy(QRIdentificEmpresaE1DT_ESTOQUE.Value, 1, 2);
//      with DMImpressoraFiscal do
//      begin
//        wHashMD5 := bib.GetHashStringMD5(QRIdentificEmpresaE1COD_FILIAL.Text +
//          QRIdentificEmpresaE1DT_ESTOQUE.Text + QRIdentificEmpresaE1HORA_ESTOQUE.Text
//              +QRIdentificEmpresaE1NUM_FABRICACAO_ECF.Text+QRIdentificEmpresaE1DESC_TIPO_ECF.Text
//                +QRIdentificEmpresaE1DESC_MARCA_ECF.Text+QRIdentificEmpresaE1DESC_MODELO_ECF.Text
//                  +QRIdentificEmpresaE1IND_MF_ADICIONAL.Text);
//
//        if wHashMD5 = QRIdentificEmpresaE1DESC_HASH_MD5.Text then
//          wModeloECF := bib.AjustaStr(QRIdentificEmpresaE1DESC_MODELO_ECF.Value,20)
//        else
//          wModeloECF := '????????????????????';
//        wLinha := 'E1' + bib.AjustaStrContrario(QRIdentificEmpresaE1NUM_CGC.AsString, 14, '0')
//          + bib.AjustaStr(QRIdentificEmpresaE1DESC_INSCRICAO.AsString, 14)
//            + bib.AjustaStr(QRIdentificEmpresaE1DESC_INSCRICAO_MUNICIPAL.AsString, 14)
//              + bib.AjustaStr(QRIdentificEmpresaE1DESC_FILIAL.AsString, 50)
//                + bib.AjustaStr(QRIdentificEmpresaE1NUM_FABRICACAO_ECF.AsString, 20)
//                  + bib.AjustaStr(QRIdentificEmpresaE1IND_MF_ADICIONAL.AsString, 1)
//                    + bib.AjustaStr(QRIdentificEmpresaE1DESC_TIPO_ECF.AsString, 7)
//                      + bib.AjustaStr(QRIdentificEmpresaE1DESC_MARCA_ECF.AsString, 20)
//                        + wModeloECF
//                          + '20' + Copy(QRIdentificEmpresaE1DT_ESTOQUE.AsString,5,2)+
//                            Copy(QRIdentificEmpresaE1DT_ESTOQUE.AsString,3,2)+
//                            Copy(QRIdentificEmpresaE1DT_ESTOQUE.AsString,1,2)
//
//                            + QRIdentificEmpresaE1HORA_ESTOQUE.AsString;
//      end;
//      Writeln(ArqEstoque, wLinha);
//      wLinha := '';
//      QREstoqueE2.First;
//      while not QREstoqueE2.Eof do
//      begin
//        wHashMD5Produto := DMOracle.FastSelect('DESC_COD_BARRA||DESC_PRODUTO'+
//          '||COD_TRIBUTACAO||VAL_VAREJO','TB_PRODUTO','COD_PRODUTO = '+
//          QREstoqueE2COD_PRODUTO.AsString);
//        wHashMD5Produto := bib.GetHashStringMD5(wHashMD5Produto);
//        if wHashMD5Produto = DMOracle.FastSelect('DESC_HASH_MD5','TB_PRODUTO',
//          'COD_PRODUTO = '+QREstoqueE2COD_PRODUTO.AsString) then
//          wUnidade := bib.AjustaStr(QREstoqueE2DESC_UNIDADE.AsString, 6)
//        else
//          wUnidade := '??????';
//        wHashMD5Quantidade := bib.GetHashStringMD5(
//          FloatToStr(QREstoqueE2QT_QUANTIDADE.Value));
//        if wHashMD5Quantidade <> QREstoqueE2DESC_HASH_MD5.Value then
//          wUnidade := '??????';
//        wLinha := 'E2' + bib.AjustaStrContrario(QREstoqueE2NUM_CGC.AsString, 14, '0')
//          + bib.AjustaStr(QREstoqueE2COD_PRODUTO.AsString, 14)
//            + bib.AjustaStr(QREstoqueE2DESC_PRODUTO.AsString, 50)
//              + wUnidade
//                + QREstoqueE2MENSURACAO.AsString
//                  + bib.AjustaStrContrario(IntToStr(Trunc(QREstoqueE2QT_QUANTIDADE.value * 1000)), 9, '0');
//        Writeln(ArqEstoque, wLinha);
//        QREstoqueE2.Next;
//      end;
//      wLinha := 'E9' + bib.AjustaStrContrario(QRIdentificEmpresaE1NUM_CGC.AsString, 14, '0')
//        + bib.AjustaStr(QRIdentificEmpresaE1DESC_INSCRICAO.AsString, 14)
//          + bib.AjustaStrContrario(IntToStr(QREstoqueE2.RecordCount), 6, '0');
//      Writeln(ArqEstoque, wLinha);
//      CloseFile(ArqEstoque);
//      setlength(wAuxEAD, 256);
//      iRetorno := generateEAD(wCaminhoArq, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
//      FAguarde.Close;
//      if iRetorno = 0 then
//        MessageDlg('Erro na assinatura do arquivo!', mtError, [mbOK], 0)
//      else
//        MessageDlg('Arquivo gerado com sucesso em: ' + wCaminhoArq, mtInformation, [mbOK], 0);
//    end;
//  end;
end;

function TFImpressoraFiscal.getMarcaModeloTipo(var pMarca, pModelo,
  pTipo: String): Boolean;
begin
  SetLength(pMarca, 16);
  SetLength(pModelo, 21);
  SetLength(pTipo, 8);
  iRetorno := Bematech_FI_MarcaModeloTipoImpressoraMFD(pMarca, pModelo, pTipo);
  pMarca := trim(pMarca);
  pModelo := trim(pModelo);
  pTipo := trim(pTipo);
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;


function TFImpressoraFiscal.getDataHoraImpressora(var pData,
  pHora: String): Boolean;
begin
  SetLength(pData, 7);
  SetLength(pHora, 7);
  iRetorno := Bematech_FI_DataHoraImpressora(pData, pHora);
  pData := trim(pData);
  pHora := trim(pHora);
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora(false)
  else
    result := false;
end;

procedure TFImpressoraFiscal.BitBtn4Click(Sender: TObject);
begin
//  if FImpressoraFiscalParam = Nil then
//    FImpressoraFiscalParam := TFImpressoraFiscalParam.Create(Application);
//  with DMImpressoraFiscal do
//  begin
//    QECFCons.Close;
//    QECFCons.Open;
//  end;
//  FImpressoraFiscalParam.PGRelatorio.Pages[3].TabVisible := true;
//  if FImpressoraFiscalParam.ShowModal = MrOk then
//    GeraArqMovEstoque(FImpressoraFiscalParam.DBLCImpressora4.Text,
//      StrToDate(FImpressoraFiscalParam.FM4Datas.meDtInicial.Text),
//      StrToDate(FImpressoraFiscalParam.FM4Datas.meDtFinal.Text));

end;

function TFImpressoraFiscal.getNumCaixa(var pNumCaixa: String): Boolean;
begin
  SetLength(pNumCaixa, 5);
  iRetorno := Bematech_FI_NumeroCaixa(pNumCaixa);
  pNumCaixa := trim(pNumCaixa);
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.getCnpjIE(var pCnpj, pIE: String): Boolean;
begin
  SetLength(pCnpj, 19);
  SetLength(pIE, 16);
  iRetorno := Bematech_FI_CGC_IE(pCnpj, pIE);
  pCnpj := bib.TiraMascara(trim(pCnpj));
  pIE := bib.TiraMascara(trim(pIE));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.getVersaoFirmware(
  var pVersao: String): Boolean;
begin
  SetLength(pVersao, 7);
  iRetorno := Bematech_FI_VersaoFirmwareMFD(pVersao);
  pVersao := trim(pVersao);
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.getDataUsuarioSWBasicoMFAdicional(
  var pDataUsuario: TDateTime;
  var pDataSWBasico: TDateTime;
  var MFAdicional: String): Boolean;
var
  //wMF: Char;
  wDtUsuario, wDtSWBasico: String;
begin
  SetLength(wDtUsuario, 21);
  SetLength(wDtSWBasico, 21);
  SetLength(MFAdicional, 1);
  MFAdicional := ' ';
  iRetorno := Bematech_FI_DataHoraGravacaoUsuarioSWBasicoMFAdicional(wDtUsuario, wDtSWBasico, MFAdicional[1]);
  wDtUsuario := trim(wDtUsuario);
  wDtSWBasico := trim(wDtSWBasico);
  StrToDateTime(wDtUsuario);
  StrToDateTime(wDtSWBasico);
  pDataSWBasico := StrToDateTime(wDtSWBasico);
  pDataUsuario := StrToDateTime(wDtUsuario);
  //MFAdicional[1] := wMF;
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

procedure TFImpressoraFiscal.GeraArqMovEstoque(pNumSerie: String;
  pDtInicial, pDtFinal: TDate);
var
  wCaminhoArq, wLinha, wAuxEAD: String;
  wCnpj, wIE, wIMunicipal, wDescEmpresa, wDescSistema, wVersaoSistema, wMD5: String;
  wDataIniFormat, wDataFimFormat: String;
  ArqMovEcf, ArqConfig: TextFile;
  wArquivoData, wArquivoCodigo, wArquivoNumSerie,wHashMD5,wModelo: String;
begin
  if FAguarde = Nil then
    FAguarde := TFAguarde.Create(Application);
  FAguarde.Show;
  try
    AssignFile(ArqConfig, pathArquivosPAFECF + 'ConfigEmpresa.txt');
    Reset(ArqConfig);
    Readln(ArqConfig);
    Readln(ArqConfig, wCnpj);
    Readln(ArqConfig, wIE);
    Readln(ArqConfig, wIMunicipal);
    Readln(ArqConfig, wDescEmpresa);
    Readln(ArqConfig, wDescSistema);
    Readln(ArqConfig, wVersaoSistema);
    Readln(ArqConfig, wMD5);
    CloseFile(ArqConfig);
    wCnpj := bib.LimpaNumero(bib.Decode(wCnpj));
    wIE := bib.Decode(wIE);
    wIMunicipal := bib.Decode(wIMunicipal);
    wDescEmpresa := bib.Decode(wDescEmpresa);
    wDescSistema := bib.Decode(wDescSistema);
    wVersaoSistema := bib.Decode(wVersaoSistema);
    AssignFile(ArqConfig, pathArquivosPAFECF + 'config.txt');
    Reset(ArqConfig);
    while not Eof(ArqConfig) do
    begin
      Readln(ArqConfig, wMD5);
      if wMD5 = '[MD5]' then
      begin
        Readln(ArqConfig, wMD5);
        break;
      end;
    end;
    wMD5 := bib.Decode(wMD5);
    wDataIniFormat := FormatDateTime('YYYYMMDD', pDtInicial);
    wDataFimFormat := FormatDateTime('YYYYMMDD', pDtFinal);
    wArquivoData := FormatDateTime('DDMMYYYY', pDtInicial);
    wArquivoNumSerie := Copy(pNumSerie,6,14);
    wArquivoCodigo := '030901'; //MP-2100 TH FI
    wCaminhoArq := pathArquivosPAFECF + wArquivoCodigo+wArquivoNumSerie+
      wArquivoData+'.txt';
    AssignFile(ArqMovEcf, wCaminhoArq);
    Rewrite(ArqMovEcf);
    with DMImpressoraFiscal do
    begin
      QR01.Close;
      QR01.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
      QR01.SetVariable('NUM_SERIE', pNumSerie);
      QR01.Open;
      wHashMD5 := bib.GetHashStringMD5(QR01NUM_SERIE.Value);
      if wHashMD5 = QR01DESC_HASH_MD5.Value then
      begin
        wModelo := bib.AjustaStr(QR01DESC_MODELO.Value, 20);
        wDescEmpresa := bib.AjustaStr(wDescEmpresa, 40);
      end
      else
      begin
        wModelo := '????????????????????';
        wDescEmpresa := '????????????????????????????????????????';
      end;
      if wModelo <> '????????????????????' then
      begin
        if QR01DESC_HASH_MD5_FILIAL.Value <> bib.GetHashStringMD5(QR01NUM_CGC.Value) then
        begin
          wModelo := '????????????????????';
          wDescEmpresa := '????????????????????????????????????????';
        end;
      end;
      wLinha := 'R01' + bib.AjustaStr(QR01NUM_SERIE.Value, 20) + bib.AjustaStr(QR01IND_MF_ADICIONAL.Value, 1)
        + bib.AjustaStr(QR01DESC_TIPO.Value, 7) + bib.AjustaStr(QR01DESC_MARCA.Value, 20)
          + wModelo + bib.AjustaStr(QR01NUM_VERSAO_SB.Value, 10)                         
            + bib.AjustaStr(QR01DT_INSTALACAO_SB.Value, 8) + bib.AjustaStr(QR01HORA_INSTALACAO_SB.Value, 6)
              + bib.AjustaStrContrario(QR01NUM_SEQ_ECF.AsString, 3, '0')
                + bib.AjustaStrContrario(bib.TiraMascara(QR01NUM_CGC.Value), 14, '0')
                  + bib.AjustaStr(bib.TiraMascara(QR01DESC_INSCRICAO.Value), 14)
                    + bib.AjustaStrContrario(wCnpj, 14, '0') + bib.AjustaStrContrario(wIE, 14, '0')
                      + bib.AjustaStrContrario(wIMunicipal, 14, '0') +  wDescEmpresa
                        +  bib.AjustaStr(wDescSistema, 40) + bib.AjustaStr(wVersaoSistema, 10) +  bib.AjustaStr(wMD5, 32)
                          +  bib.AjustaStr(wDataIniFormat, 8) +  bib.AjustaStr(wDataFimFormat, 8) + '0113';
      Writeln(ArqMovEcf, wLinha);

      QR02.Close;
      QR02.SetVariable('DT_INICIAL', pDtInicial);
      QR02.SetVariable('DT_FINAL', pDtFinal);
      if Trim(pNumSerie) <> '' then
        QR02.SetVariable('NUM_SERIE', pNumSerie)
      else
        QR02.SetVariable('NUM_SERIE', null);
      QR02.Open;
      wHashMD5 := bib.GetHashStringMD5(
        QR02NUM_SERIE.Value+
        QR02NUM_CONTADOR_REDUCAOZ.AsString+
        QR02NUM_COO_RZ.AsString+
        QR02NUM_REINICIO_OPRERACAO.AsString+
        QR02NUM_COO_INI.AsString+
        QR02NUM_COO_FIN.AsString+
        QR02DT_EMISSAO_SEM_MASCARA.Text+
        QR02DT_HORA_EMISSAO_RZ.Text+
        QR02VAL_VENDA_BRUTA.Text);  

      if wHashMD5 = QR02DESC_HASH_MD5.Value then
        wModelo := bib.AjustaStr(QR02DESC_MODELO.Value, 20)
      else
        wModelo := '????????????????????';
      while not QR02.Eof do
      begin
        wLinha := 'R02' + bib.AjustaStr(QR02NUM_SERIE.Value, 20) + bib.AjustaStr(QR02IND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR02NUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR02NUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStrContrario(QR02NUM_COO_RZ.AsString, 6, '0') + bib.AjustaStrContrario(QR02NUM_REINICIO_OPRERACAO.AsString, 6, '0')
                + bib.AjustaStr(QR02DT_MOVIMENTO.Value, 8) + bib.AjustaStr(QR02DT_EMISSAO.Value, 8)
                  + bib.AjustaStr(QR02HORA_EMISSAO.Value, 6) + bib.AjustaStrContrario(IntToStr(trunc(QR02VAL_VENDA_BRUTA.value * 100)), 14, '0')
                    + bib.AjustaStr(QR02IND_DESCONTO_ISSQN.Value, 1);
        Writeln(ArqMovEcf, wLinha);
        QR02.Next;
      end;
      QR03.Close;
      QR03.SetVariable('DT_INICIAL', pDtInicial);
      QR03.SetVariable('DT_FINAL', pDtFinal);
      if Trim(pNumSerie) <> '' then
        QR03.SetVariable('NUM_SERIE', pNumSerie)
      else
        QR03.SetVariable('NUM_SERIE', null);
      QR03.Open;
      while not QR03.Eof do
      begin
        if QR03COD_REGISTRO_ANALITICO.Value > 0 then
        begin
          QR03DESC_HASH_MD5.Value := DMOracle.FastSelect('DESC_HASH_MD5',
            'TB_REGISTRO_TIPO60_ANALITICO','COD_REGISTRO_ANALITICO = ' +
            QR03COD_REGISTRO_ANALITICO.Text);
        end;
        QR03.Next;
      end;
      QR03.First;
      wHashMD5 := bib.GetHashStringMD5(QR03NUM_SERIE.Value+
        QR03IND_SITUACAO_TRIBUTARIA.Value+
        QR03VLR_ACUMULADO_TOTAL_PARCIAL.Text+
        QR03NUM_CONTADOR_REDUCAOZ.Text);       

      if wHashMD5 = QR03DESC_HASH_MD5.Value then
        wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
      else
        wModelo := '????????????????????';

      while not QR03.Eof do
      begin
        wLinha := 'R03' + bib.AjustaStr(QR03NUM_SERIE.Value, 20) + bib.AjustaStr(QR03IND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr(QR03IND_SITUACAO_TRIBUTARIA.AsString, 7)
                + bib.AjustaStrContrario(IntToStr(trunc(QR03VLR_ACUMULADO_TOTAL_PARCIAL.Value * 100)), 13, '0');
        Writeln(ArqMovEcf, wLinha);
        QR03.Next;
      end;
      QR04.Close;
      QR04.SetVariable('DT_INICIAL', pDtInicial);
      QR04.SetVariable('DT_FINAL', pDtFinal);
      QR04.SetVariable('NUM_SERIE', pNumSerie);
      QR04.Open;
      while not QR04.Eof do
      begin
        wHashMD5 := bib.GetHashStringMD5(
          QR04NUM_SERIE.Value+
          QR04NUM_NOTA.Text+
          QR04NUM_COO.Text+
          FormatFloat('#0.00',QR04DESCONTO_SUBTOTAL.Value)+
          FormatFloat('#0.00',QR04ACRESCIMO_SUBTOTAL.Value)+
          QR04IND_SITUACAO.Value
        );
        if wHashMD5 = QR04DESC_HASH_MD5.Value then
          wModelo := bib.AjustaStr(QR04DESC_MODELO.Value, 20)
        else
          wModelo := '????????????????????';

        wLinha := 'R04' + bib.AjustaStr(QR04NUM_SERIE.Value, 20) + bib.AjustaStr(QR04IND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR04NUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR04NUM_NOTA.AsString, 6, '0')
              + bib.AjustaStrContrario(QR04NUM_COO.AsString, 6, '0')
                + bib.AjustaStr(QR04DT_INICIO.Text, 8)
                  //+ bib.ift(QR04IND_CUPOM_TOTALIZADO.Value = 'S',
                      +bib.AjustaStrContrario(IntToStr(trunc(QR04SUBTOTAL.Value * 100)), 14, '0')//,
                  //    '              ')
                    + bib.AjustaStrContrario(IntToStr(trunc(QR04DESCONTO_SUBTOTAL.Value * 100)), 13, '0')
                      + bib.AjustaStr(QR04TP_DESCONTO.Value, 1)
                        + bib.AjustaStrContrario(IntToStr(trunc(QR04ACRESCIMO_SUBTOTAL.Value * 100)), 13, '0')
                          + bib.AjustaStr(QR04TP_ACRESCIMO.Value,1)
                            //+ bib.ift(QR04IND_CUPOM_TOTALIZADO.Value = 'S',
                                +bib.AjustaStrContrario(IntToStr(trunc(QR04TOTAL_LIQ.Value * 100)), 14, '0')//,
                            //   '              ')
                              + bib.AjustaStr(QR04IND_CANCELADO.Value, 1)
                                + bib.AjustaStrContrario(IntToStr(trunc(QR04CANCELAMENTO_ACRESCIMO.Value * 100)), 13, '0')
                                  + bib.AjustaStr(QR04ORDEM_DESCONTO_ACRESCIMO.Value, 1)
                                    + bib.AjustaStr(QR04NOME.Value, 40)
                                      + bib.AjustaStr(QR04NUM_CGC_CPF.Value, 14);
        Writeln(ArqMovEcf, wLinha);
        QR04.Next;
      end;
      QR05.Close;
      QR05.SetVariable('DT_INICIAL', pDtInicial);
      QR05.SetVariable('DT_FINAL', pDtFinal);
      QR05.SetVariable('NUM_SERIE', pNumSerie);
      QR05.Open;
      while not QR05.Eof do
      begin
        wHashMD5 := bib.GetHashStringMD5(
          QR05NUM_SERIE.Value+
          QR05NUM_COO.Text+
          QR05NUM_NOTA.Text+
          QR05COD_PRODUTO.Text+
          FloatToStr(QR05QT_QUANTIDADE.Value)+
          FloatToStr(QR05VAL_UNITARIO.Value)+
          FloatToStr(QR05DESCONTO_UNITARIO.Value)+
          FloatToStr(QR05ACRESCIMO.Value)+
          QR05COD_TRIB_IMP_FISCAL.Value+
          QR05IND_SITUACAO.Value
        );
        if wHashMD5 = QR05DESC_HASH_MD5.Value then
          wModelo := bib.AjustaStr(QR05DESC_MODELO.Value, 20)
        else
          wModelo := '????????????????????';
        wLinha := 'R05' + bib.AjustaStr(QR05NUM_SERIE.Value, 20) + bib.AjustaStr(QR05IND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR05NUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR05NUM_COO.AsString, 6, '0')
              + bib.AjustaStrContrario(QR05NUM_NOTA.AsString, 6, '0')
                + bib.AjustaStrContrario(QR05NUM_ITEM_CF.AsString, 3, '0')
                  + bib.AjustaStrContrario(QR05COD_PRODUTO.AsString, 14, '0')
                    + bib.AjustaStr(QR05DESC_PRODUTO.Value, 100)
                      + bib.AjustaStrContrario(IntToStr(trunc(QR05QT_QUANTIDADE.Value * 100)), 7, '0')
                        + bib.AjustaStr(QR05DESC_UNIDADE.Value, 3)
                          + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_UNITARIO.Value * 100)), 8, '0')
                            + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_DESCONTO.Value * 100)), 8, '0')

                                + bib.AjustaStrContrario(IntToStr(trunc(QR05ACRESCIMO.Value * 100)), 8, '0')
                                  + bib.AjustaStrContrario(IntToStr(trunc(QR05TOTAL_LIQ.Value * 100)), 14, '0')
                                    + bib.AjustaStr(QR05TOTALIZADOR_PARCIAL.Value, 7)
                                      + bib.AjustaStr(QR05IND_CANC_ITEM_CF.Value, 1)
                                        + bib.AjustaStrContrario(IntToStr(trunc(QR05QT_CANCELADO.Value)), 7, '0')
                                          + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_CANCELADO.Value * 100)), 13, '0')
                                            + bib.AjustaStrContrario(IntToStr(trunc(QR05CANCELAMENTO_ACRESCIMO.Value * 100)), 13, '0')
                                              + bib.AjustaStr(QR05IND_ARREDONDAMENTO_TRUNCAMENTO.Value, 1)
                                                + bib.AjustaStr(QR05IND_PROD_PROPRIA_TERCEIRO.Value, 1)
                                                  + bib.AjustaStr(QR05IND_CASAS_DEC_QT.AsString, 1)
                                                    + bib.AjustaStr(QR05IND_CASAS_DEC_UNIT.AsString, 1);
        Writeln(ArqMovEcf, wLinha);
        QR05.Next;
      end;

      QR06.Close;
      QR06.SetVariable('DT_INICIAL', pDtInicial);
      QR06.SetVariable('DT_FINAL', pDtFinal);
      QR06.SetVariable('NUM_SERIE', pNumSerie);
      QR06.Open;
      while not QR06.Eof do
      begin
        wHashMD5 := bib.GetHashStringMD5(
          QR06NUM_SERIE.Value+
          QR06NUM_COO.Text+
          QR06NUM_GNF.Text+
          QR06NUM_CDC.Text+
          QR06DESC_DENOMINACAO.Value+
          QR06DT_HR_FINAL_EMISSAO.Text
        );
        if wHashMD5 = QR06DESC_HASH_MD5.Value then
          wModelo := bib.AjustaStr(QR06DESC_MODELO.Value, 20)
        else
          wModelo := '????????????????????';

        wLinha := 'R06' + bib.AjustaStr(QR06NUM_SERIE.Value, 20) + bib.AjustaStr(QR06IND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR06NUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR06NUM_COO.AsString, 6, '0')
              + bib.AjustaStrContrario(QR06NUM_COO.AsString, 6, '0')
                + bib.AjustaStrContrario(QR06NUM_GRG.AsString, 6, '0')
                  + bib.AjustaStrContrario(QR06NUM_CDC.AsString, 4, '0')
                    + bib.AjustaStr(QR06DESC_DENOMINACAO.Value, 2)
                      + bib.AjustaStr(QR06DT_FINAL_EMISSAO.Text, 8)
                        + bib.AjustaStr(QR06HR_FINAL_EMISSAO.Text, 6);
        Writeln(ArqMovEcf, wLinha);
        QR06.Next;
      end;

      QR07.Close;
      QR07.SetVariable('DT_INICIAL', pDtInicial);
      QR07.SetVariable('DT_FINAL', pDtFinal);
      QR07.SetVariable('NUM_SERIE', pNumSerie);
      QR07.Open;
      while not QR07.Eof do
      begin
        wHashMD5 := bib.GetHashStringMD5(
          QR07NUM_SERIE.Value+
          QR07CCF.Text+
          QR07NUM_COO.Text+
          FormatFloat('#0.00',QR07DESCONTO_SUBTOTAL.Value)+
          FormatFloat('#0.00',QR07ACRESCIMO_SUBTOTAL.Value)+
          QR07IND_SITUACAO.Value
        );
        if wHashMD5 = QR07DESC_HASH_MD5.Value then
          wModelo := bib.AjustaStr(QR04DESC_MODELO.Value, 20)
        else
          wModelo := '????????????????????';
        wLinha := 'R07' + bib.AjustaStr(QR07NUM_SERIE.Value, 20) + bib.AjustaStr(QR07IND_MF_ADICIONAL.Value, 1)
            + wModelo + bib.AjustaStrContrario(QR07NUM_USUARIO.AsString, 2, '0')
              + bib.AjustaStrContrario(QR07NUM_COO.AsString, 6, '0')
                + bib.AjustaStrContrario(QR07CCF.AsString,6, '0')
                  + bib.AjustaStrContrario(QR07NUM_GNF.AsString, 6, '0')
                    + bib.AjustaStr(QR07DESC_PAGAMENTO.AsString, 15)
                      + bib.AjustaStrContrario(IntToStr(trunc(QR07VAL_PAGAMENTO.Value * 100)), 13, '0')
                        + bib.AjustaStr(QR07IND_ESTORNO.Value, 1)
                          + bib.AjustaStrContrario(IntToStr(trunc(QR07VAL_ESTORNO.Value * 100)), 13, '0');
          Writeln(ArqMovEcf, wLinha);
          QR07.Next;
      end;
    end;

    CloseFile(ArqMovEcf);
    setlength(wAuxEAD, 256);
    iRetorno := generateEAD(wCaminhoArq, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
    FAguarde.Close;
    MessageDlg('O arquivo foi gerado em : ' +
      wCaminhoArq, mtInformation, [mbOK], 0)

  Except
    on e:Exception do
    begin
      FAguarde.Close;
      CloseFile(ArqMovEcf);
      MessageDlg('Erro na geração do arquivo: ' +
        e.Message,mtError,[mbOk],0);
    end;
  end;
end;

procedure TFImpressoraFiscal.btRZClick(Sender: TObject);
var wDataReducao: TDateTime;
begin
  if MessageDlg('A Redução Z impossibilitará a emissão'+#13
    +'de Cupons Fiscais!'+#13+#13+'Deseja continuar?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes then
  begin
    CadastraAliquota;

    iRetorno := Bematech_FI_ReducaoZ('', '');
    Analisa_iRetorno;
    if (iRetorno <> 1) or not(Retorno_Impressora) then
      Abort;
    if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
    FAguarde.Show;
    Application.ProcessMessages;
    Sleep(5000);
    FAguarde.Close;
    LeArquivoTexto(PathBematech + 'retorno.txt', 3);
    //Fazer chamada para Movimento por ECF passando os parametros necessarios
    GeraArquivoRZAutomatico;
    VerificaPAFECFLiberado;
  end;
end;


procedure TFImpressoraFiscal.BtIdentificacaoClick(Sender: TObject);
var
  wArquivo, wMes, wAno, wBranco, wDados: String;
  cRazaoSocial: String; cEndereco: String; cNumero: String; cComplemento: String; cBairro: String; cCidade: String; cCep: String; cTelefone: String; cFax: String; cContato: String;
  wrelatorios, iConta, iFlag: integer;
  wAliquotas: TAliquotasSet;
  arquivo: TextFile;

  wNumLaudo,wTexto,wTextoArqAux,wLinha,
    wMD5ListaArq,wTextoImpressao: String;
  wDadosEmpresa: TStringList;
  i:Integer;
  wImpressoras: Boolean;
begin


{         SetLength(wDados, 1279);
            iRetorno := Bematech_FI_DadosUltimaReducaoMFD(wDados);
            Analisa_iRetorno;
            if not ((iRetorno = 1) and Retorno_Impressora) then
              Exit;
  AssignFile(arquivo, 'c:\veio.txt');
  Rewrite(arquivo);
  Writeln(arquivo, trim(wDados));     }

 { iRetorno := Bematech_FI_NomeiaRelatoriosPAFECF;
  ShowMessage(IntToStr(iRetorno));     }
 // getArquivoSintegra('c:\sintegra.txt', InputBox('informe o valor', 'Mês', '2'), InputBox('informe o valor', 'Ano', '2013'), StrToInt(InputBox('informe o valor', 'Digite o indice de quais arquivos deseja', '19')));
 //iRetorno := Bematech_FI_RelatorioSintegraMFD()
  //wAliquotas := getIndiceAliquotasIss;



//  wArquivo := '1800';
//  iRetorno := Bematech_FI_ProgramaAliquota(pchar(wArquivo), 0);
//  Analisa_iRetorno;
//  if (iRetorno <> 1) or not(Retorno_Impressora) then
//    Abort;
//  wArquivo := '0700';
//  iRetorno := Bematech_FI_ProgramaAliquota(pchar(wArquivo), 0);
//  Analisa_iRetorno;
//  if (iRetorno <> 1) or not(Retorno_Impressora) then
//    Abort;
//
//  SetLength(wArquivo, 80);
//  iRetorno := Bematech_FI_RetornoAliquotas(wArquivo);
//  Analisa_iRetorno;
//  if (iRetorno <> 1) or not(Retorno_Impressora) then
//    Abort;
//  ShowMessage(wArquivo);


    {
  wArquivo := '1200';
  iRetorno := Bematech_FI_ProgramaAliquota(pchar(wArquivo), 1);
  Analisa_iRetorno;
  if (iRetorno <> 1) or not(Retorno_Impressora) then
    Abort;
  wArquivo := '1200';
  iRetorno := Bematech_FI_ProgramaAliquota(pchar(wArquivo), 0);
  Analisa_iRetorno;
  if (iRetorno <> 1) or not(Retorno_Impressora) then
    Abort;   }


  //Número do laudo de análise funcional deve ser extraido do arquivo
  //Por enquanto vai ser pego do banco de dados
  with DMOracle do
  begin
    wNumLaudo :=
      FastSelect('DESC_LAUDO_ANALISE_FUNCIONAL','TB_PARAM_SISTEMA');
    wTexto := bib.FormataTexto(wNumLaudo,48);

    //Busca dados do arquivo de configuração do PAF
    AssignFile(arquivo,pathArquivosPAFECF+'\'+'ConfigEmpresa.txt');
    Reset(arquivo);
    wDadosEmpresa := TStringList.Create;
    while not Eof(arquivo) do
    begin
      Readln(arquivo, wLinha);
      if Pos('[PAF]',wLinha) > 0 then
        Continue;
      if Pos('[/PAF]',wLinha) > 0 then
        Continue;
      wDadosEmpresa.Add(bib.Decode(wLinha));
    end;
    if wDadosEmpresa.Count <=5 then
    begin
      MessageDlg('Arquivo '+pathArquivosPAFECF+'\'+'ConfigEmpresa.txt'+
        ' incompleto.',mtError,[mbOk],0);
      Abort;
    end;
    wTexto := wTexto +
      bib.FormataTexto('IDENTIFICAÇÃO DA EMPRESA DESENVOLVEDORA',48);
    wTexto := wTexto +
      bib.FormataTexto(wDadosEmpresa[2],48);
    wTexto := wTexto +
      bib.FormataTexto('CEMAPA ASSESS. E DESENV. DE SISTEMAS SC LTDA',48);
    wTexto := wTexto +
      bib.FormataTexto('AV. JOAO XXIII, 2150 - CENTRO - MEDIANEIRA-PR',48);
    wTexto := wTexto +
      bib.FormataTexto('45 3264-3773',48);
    wTexto := wTexto +
      bib.FormataTexto('CONTATO: CESAR ANGONESE',48);
    wTexto := wTexto +
      bib.FormataTexto('IDENTIFICAÇÃO DO PAF-ECF',48);
    wTexto := wTexto +
      bib.FormataTexto(wDadosEmpresa[4],48);
    CloseFile(arquivo);

    AssignFile(arquivo, pathArquivosPAFECF+'\'+
      'ListaArquivos.txt');
    Reset(arquivo);
    wTextoArqAux := '';

    //Busca os arquivos que compõem o PAF-ECF no arquivo
    while not Eof(arquivo) do
    begin
      Readln(arquivo,wLinha);
      if Pos('PjVenda',wLinha) > 0 then
      begin
        wTexto := wTexto +
          bib.FormataTexto('PjVenda.exe',48);
        wTexto := bib.FormataTexto(Copy(wLinha,53,32),48);
      end
      else
        if Pos('N3',wLinha) > 0 then
        begin
          wTextoArqAux := wTextoArqAux +
            bib.FormataTexto(Trim(copy(wLinha,3,53)),48);
        end
        else
          if Pos('EAD',wLinha) > 0 then
            wMD5ListaArq := bib.FormataTexto(Trim(wLInha),48);

    end;
    wTexto := wTexto + wTextoArqAux;
    wTexto := wTexto + bib.FormataTexto('ListaArquivos.txt',48);
    CloseFile(arquivo);
    i:=1;
    while i <= Length(wMD5ListaArq) do
    begin
      wTexto := wTexto + Trim(Copy(wMD5ListaArq,i,48));
      i := i+48;
    end;
    //bib.FormataTexto(wDadosEmpresa[6],48);

    //Busca os ECF autorizados no arquivo
    AssignFile(arquivo,pathArquivosPAFECF+'\'+'Config.txt');
    Reset(arquivo);
    wImpressoras := false;
    while not Eof(arquivo) do
    begin
      Readln(arquivo,wLinha);
      if Pos(wLinha,'[/ECF]') > 0 then
        wImpressoras := false;
      if wImpressoras then
      begin
        wTexto := wTexto+bib.FormataTexto(Trim(bib.Decode(wLinha)),48);
      end;
      if Pos(wLinha,'[ECF]') > 0 then
        wImpressoras := true;

    end;
    //Imprime mensagem
    i:=1;
    while(i < Length(wTexto)) do
    begin
      if Length(wTexto) <= 600 then
      begin
        wTextoImpressao := wTexto;
        i := Length(wTexto);
      end
      else
      begin
        wTextoImpressao := Copy(wTexto,i,600);
        if i=1 then
          i:= Length(wTextoImpressao)+1
        else
          i := i+Length(wTextoImpressao);
      end;
      iRetorno := Bematech_FI_RelatorioGerencial(pchar(wTextoImpressao));
      Analisa_iRetorno();
      Retorno_Impressora();
    end;

    //Fecha comprovante
    iRetorno := Bematech_FI_FechaRelatorioGerencial();
    Analisa_iRetorno();
    Retorno_Impressora();
  end;

end;

function TFImpressoraFiscal.getArquivoSintegra(pCaminhoArquivo, pMes, pAno: String;
  pTiposRegistro: Integer): Boolean;
var
  cArquivo, cRazaoSocial, cEndereco, cNumero, cComplemento: String;
  cBairro, cCidade, cCEP, cTelefone, cFax, cContato: String;
begin
  //informações genéricas, pois elas não serão utilizadas de fato pelo sistema.
  cRazaoSocial := 'razão'; cEndereco := 'endereço';
  cNumero := '1'; cComplemento := 'n/a'; cBairro := 'bairro'; cCidade := 'cidade';
  cCEP := '85884000'; cTelefone := '2'; cFax := '3'; cContato := 'contato';
 // iRetorno := Bematech_FI_RegistrosTipo60;
  iRetorno := Bematech_FI_RelatorioSintegraMFD(pTiposRegistro, pchar(pCaminhoArquivo),
    pchar(pMes), pchar(pAno), pchar(cRazaoSocial), pchar(cEndereco), pchar(cNumero),
      pchar(cComplemento), pchar(cBairro), pchar(cCidade), pchar(cCEP), pchar(cTelefone),
        pchar(cFax), pchar(cContato));
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.getNumeroSubstituicoes(
  var pNumeroSubstituicoes: String): Boolean;
begin
  SetLength(pNumeroSubstituicoes, 5);
  iRetorno := Bematech_FI_NumeroSubstituicoesProprietario(pNumeroSubstituicoes);
  pNumeroSubstituicoes := Trim(pNumeroSubstituicoes);
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.getDataHoraReducao(var wDataEmissao: TDateTime): Boolean;
var
  wData, wHora: String;
begin
  SetLength(wData, 7);
  SetLength(wHora, 7);
  iRetorno := Bematech_FI_DataHoraReducao(wData, wHora);
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
  if Result then
  begin
    wData := copy(wData, 1, 2) + '/' + copy(wData, 3, 2) + '/20' + copy(wData, 5, 2);
    wHora := copy(wHora, 1, 2) + ':' + copy(wHora, 3, 2) + ':' + copy(wHora, 5, 2);
    wDataEmissao := StrToDateTime(wData + ' ' + wHora);
  end;
end;

function TFImpressoraFiscal.getIndDescontoIssqn(
  var pIndicador: String): Boolean;
var
  wIndicadorAux: Integer;
begin
  iRetorno := Bematech_FI_FlagsFiscais3MFD(wIndicadorAux);
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
  if not Result then
  begin
    if wIndicadorAux > 7 then
    begin
      if wIndicadorAux >= 128 then
        wIndicadorAux := wIndicadorAux - 128;
      if wIndicadorAux >= 64 then
        wIndicadorAux := wIndicadorAux - 64;
      if wIndicadorAux >= 32 then
        wIndicadorAux := wIndicadorAux - 32;
      if wIndicadorAux >= 16 then
        wIndicadorAux := wIndicadorAux - 16;
      if wIndicadorAux >= 8 then
        pIndicador := 'S'
      else
        pIndicador := 'N';
    end
    else
      pIndicador := 'N';
  end;
end;

function TFImpressoraFiscal.getIndiceAliquotasIss: TAliquotasSet;
var
  wIndices, wAux: String;
  i: Integer;
begin
  Result := [];
  SetLength(wIndices, 49);
  iRetorno := Bematech_FI_VerificaIndiceAliquotasIss(wIndices);
  Analisa_iRetorno;
  wAux := '';
  for i:=1 to length(wIndices) - 1 do
  begin
    if wIndices[i] = #0 then
    begin
      if wAux <> '' then
        Result := Result + [strtoint(wAux)];
      Break;
    end;
    if wIndices[i] = ',' then
    begin
      Result := Result + [strtoint(wAux)];
      wAux := '';
    end
    else
    begin
      wAux := wAux + wIndices[i];
    end;
  end;
end;

procedure TFImpressoraFiscal.btIdentificaPAFClick(Sender: TObject);
var
  wNumeroLaudo, wMsg, wTexto: String;
  wMD5ListaArq,wLinha: String;
  arquivo: TextFile;
  wImpressoras: Boolean;
  wListaArq, wNumeroSerie: TStringList;

  i: integer;
  cIndice,cDescricao: String;
begin
  if not VerificaPAFECFLiberado then
    Exit;
  cIndice := '02';
  cDescricao := 'Ident do PAF-ECF'; 

  wNumeroLaudo := DMOracle.FastSelect('DESC_LAUDO_ANALISE_FUNCIONAL',
      'TB_PARAM_SISTEMA');
  //Buscando executáveis que compõem os PAF-ECF
  wListaArq := TStringList.Create;
  AssignFile(arquivo, pathArquivosPAFECF+'\'+
    'ListaArquivos.txt');
  Reset(arquivo);
  while not Eof(arquivo) do
  begin
    Readln(arquivo,wLinha);

    if Pos('N3',wLinha) > 0 then
    begin
        wListaArq.Add(Trim(copy(wLinha,3,50)));
        wListaArq.Add(Trim(copy(wLinha,53,32)));
    end;
  end;
  CloseFile(arquivo);

  //Busca os ECF autorizados no arquivo
  AssignFile(arquivo,pathArquivosPAFECF+'\'+'Config.txt');
  Reset(arquivo);
  wImpressoras := false;
  wNumeroSerie := TStringList.Create;
  while not Eof(arquivo) do
  begin
    Readln(arquivo,wLinha);
    if Pos(wLinha,'[/ECF]') > 0 then
      wImpressoras := false;
    if wImpressoras then
    begin
        wNumeroSerie.Add(Trim(bib.Decode(wLinha)));
    end;
    if Pos(wLinha,'[ECF]') > 0 then
      wImpressoras := true;        
  end;
  CloseFile(arquivo);
  wMD5ListaArq := getMD5ArqConfig;
  wMD5ListaArq := bib.Decode(wMD5ListaArq);
  wMsg := bib.FormataTexto('Identificação da Empresa Desenvolvedora:',48);
  wMsg := wMsg + bib.FormataTexto('', 48);
  wMsg := wMsg + bib.FormataTexto('Nº do Laudo.......: ' + wNumeroLaudo, 48);
  wMsg := wMsg + bib.FormataTexto('CNPJ..............: 81.504.763/0001-71', 48);
  wMsg := wMsg + bib.FormataTexto('Razão Social......: CEMAPA ASSESSORIA E ',48);
  wMsg := wMsg + bib.FormataTexto('DESENVOLVIMENTO DE SISTEMAS SC LTDA - ME', 48);
  wMsg := wMsg + bib.FormataTexto('Endereço..........: AV. JOAO XXIII, 2150, CENTRO', 48);
  wMsg := wMsg + bib.FormataTexto('                    MEDIANEIRA-PR', 48);
  wMsg := wMsg + bib.FormataTexto('Telefone..........: (45) 3264-3773', 48);
  wMsg := wMsg + bib.FormataTexto('Contato...........: CESAR ANGONESE', 48);
  
  wMsg := wMsg + bib.FormataTexto('', 48);
  wMsg := wMsg + bib.FormataTexto('Identificação do PAF-ECF:', 48);
  wMsg := wMsg + bib.FormataTexto('', 48);

  wMsg := wMsg + bib.FormataTexto('Nome Comercial.........: SIAA', 48);
  wMsg := wMsg + bib.FormataTexto('Versão do PAF-ECF......: 1.0', 48);
  wMsg := wMsg + bib.FormataTexto('Principal Arq. Exec. ..: PJPAFECF.exe', 48);
    wMsg := wMsg + bib.FormataTexto('MD5. ..: '+ wListaArq[1] , 48);
  if wListaArq.Count > 0 then
  begin
    wMsg := wMsg + bib.FormataTexto('Relação de Arquivos....: '+ wListaArq[0], 48);
    for i := 1 to wListaArq.Count - 1 do
      wMsg := wMsg + bib.FormataTexto(wListaArq[i],48);
  end
  else
    wMsg := wMsg + bib.FormataTexto('Relação de Arquivos....: ', 48);


  wMsg := wMsg + bib.FormataTexto('Lista Autenticada......: ListaArquivos.txt', 48);
  wMsg := wMsg + bib.FormataTexto(wMD5ListaArq,48);
  wMsg := wMsg + bib.FormataTexto('Versão ER PAF-ECF......: 02.01', 48);
  if wNumeroSerie.Count > 0 then
  begin
    wMsg := wMsg + bib.FormataTexto('ECFs Autorizados.......: '+ wNumeroSerie[0], 48);
    for i := 1 to wNumeroSerie.Count - 1 do
      wMsg := wMsg + bib.FormataTexto(wNumeroSerie[i],48);
  end
  else
    wMsg := wMsg + bib.FormataTexto('ECFs Autorizados.......: ', 48);

  ImprimeRelatorioGerencialMFD(wMsg, cDescricao, cIndice);
  AtualizaEstoqueDiario;
  InsereDemaisDocumentos('RG');
end;



function TFImpressoraFiscal.CancelaItem(pNumItem: Integer): Boolean;
begin
  iRetorno := Bematech_FI_CancelaItemGenerico(FormatFloat('000', pNumItem));
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.AdicionaDescontoItem: Boolean;
var wItem, wIndDesconto, wIndTipo, wValor: String;
begin
  with DMImpressoraFiscal do
  begin
    wItem := FormatFloat('000', QCupomFiscalItemNUM_ITEM_CF.Value);
    wValor := FormatFloat('#0.00', QCupomFiscalItemval_desconto_total_item.Value);
    wIndDesconto := 'D';
    wIndTipo := '$';
  end;
  iRetorno := Bematech_FI_AcrescimoDescontoItemMFD(pchar(wItem), pchar(wIndDesconto),
    pchar(wIndTipo), pchar(wValor));
  Analisa_iRetorno();
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
  begin
    result := false;
    Retorno_Impressora;
  end;
end;

function TFImpressoraFiscal.CancelaDescontoItem: Boolean;
var
  wIndDesconto, wNumItem: String;
begin
  wIndDesconto := 'D';
  wNumItem := FormatFloat('000', DmImpressoraFiscal.QCupomFiscalItemNUM_ITEM_CF.Value);
  iRetorno := Bematech_FI_CancelaAcrescimoDescontoItemMFD(pchar(wIndDesconto), pchar(wNumItem));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.SubTotal(var pSubTotal: Real): Boolean;
var
  wValor: String;
begin
  SetLength(wValor, 15);
  iRetorno := Bematech_FI_SubTotal(wValor);
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
  if result then
  begin
    pSubTotal := StrToFloat(wValor) / 100;
  end;
end;

function TFImpressoraFiscal.AdicionaDespesasSubtotal: Boolean;
var
  wValor, wTipo, wFlag: String;
begin
  wFlag := 'A'; //Indicando que será feito acrescimo
  wTipo := '$'; //Indicando que o acrescimo será por valor.
  wValor := FormatFloat('#0.00', DMImpressoraFiscal.QCupomFiscalCabVAL_DESPESAS.Value);
  iRetorno := Bematech_FI_AcrescimoDescontoSubtotalMFD(pchar(wFlag), pchar(wTipo), pchar(wValor));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.AdicionaDescontoSubtotal: Boolean;
var
  wValor, wTipo, wFlag: String;
begin
  wFlag := 'D'; //Indicando que será feito desconto
  wTipo := '$'; //Indicando que o desconto será por valor.
  wValor := FormatFloat('#0.00', DMImpressoraFiscal.QCupomFiscalCabVAL_DESCONTO.Value);
  iRetorno := Bematech_FI_AcrescimoDescontoSubtotalMFD(pchar(wFlag), pchar(wTipo), pchar(wValor));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.CancelaDespesasSubtotal: Boolean;
var
  wFlag: String;
begin
  wFlag := 'A'; //Indicando que será cancelado o acrescimo
  iRetorno := Bematech_FI_CancelaAcrescimoDescontoSubtotalMFD(pchar(wFlag));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.CancelaDescontoSubtotal: Boolean;
var
  wFlag: String;
begin
  wFlag := 'D'; //Indicando que será cancelado o desconto
  iRetorno := Bematech_FI_CancelaAcrescimoDescontoSubtotalMFD(pchar(wFlag));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.SubTotalizaCupom: Boolean;
begin
  iRetorno := Bematech_FI_SubTotalizaCupomMFD;
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.TotalizaCupom: Boolean;
begin
  iRetorno := Bematech_FI_TotalizaCupomMFD;
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.EfetuaFormaPagamento(pFormaPgto: String;
  pValorPgto: Real): Boolean;
var
  wValor: String;
  wAuxValorPago: Real;
begin
  wAuxValorPago := pValorPgto * 100;
  wValor := IntToStr(trunc(wAuxValorPago));
  iRetorno := Bematech_FI_EfetuaFormaPagamento(pchar(pFormaPgto), pchar(wValor));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.ValorPago(var pValorPago: Real): Boolean;
var
  wAuxValPago: String;
begin
  SetLength(wAuxValPago, 14);
  iRetorno := Bematech_FI_ValorPagoUltimoCupom(wAuxValPago);
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
  if Result then
    pValorPago := StrToFloat(wAuxValPago) / 100;
end;

function TFImpressoraFiscal.TerminaFechamentoCupom(pMensagem: String): Boolean;
var
  wMensagem: String;
begin
  wMensagem := 'MD-5:' + bib.Decode(getMD5ArqConfig) + #13 + #10 + pMensagem
    + #13 + #10 + 'CUPOM EMITIDO EM TREINAMENTO OU DESENVOLVIMENTO DO PAF-ECF';
  iRetorno := Bematech_FI_TerminaFechamentoCupom(pchar(wMensagem));
  Analisa_iRetorno;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;
end;

function TFImpressoraFiscal.IniciaFechamento: Boolean;
var
  wValDesconto, wValDespesa: Real;
  wGT: String;
begin
  wValDesconto := DMImpressoraFiscal.QCupomFiscalCabVAL_DESCONTO.Value;
  wValDespesa := DMImpressoraFiscal.QCupomFiscalCabVAL_DESPESAS.Value;
  result := SubTotalizaCupom;          //sempre é atribuido o retorno à variavel Result e verificado antes do proximo passo para quando der algum erro não continuar os próximos passos.
  if result then
    if (wValDesconto > 0) then
      result := AdicionaDescontoSubtotal;
  if result then
    if (wValDespesa > 0) then
      result := AdicionaDespesasSubtotal;
  if result then
    Result := TotalizaCupom;
  getGT(wGT);
  atualizaGT(wGT);
end;

procedure TFImpressoraFiscal.geraRelMd5Executaveis;
var
  ArqN, arqConfigOld, arqConfigNovo: TextFile;
  wCaminhoArq, wLinha, wMD5, wAuxEAD, wCaminho: String;
  wListaArquivos: TStringList;
  i: Integer;
  wNumLaudo: String;
begin
  wMD5 := '                                 ';
  wListaArquivos := TStringList.Create;
  wListaArquivos.Clear;
  wListaArquivos.Add('PJPAFECF.exe');
  wListaArquivos.Add('PJCONTASRECEBER.exe');
  wListaArquivos.Add('BEMAFI32.dll');
  wListaArquivos.Add('CLISITEF32.dll');
  wListaArquivos.Add('CLISITEF32I.dll');
  wListaArquivos.Add('SIGN_BEMA.dll');
  wListaArquivos.Add('BEMAMFD2.dll');
  wListaArquivos.Add('BEMAMFD.dll');

  wCaminhoArq := pathArquivosPAFECF + 'ListaArquivos.txt';
  AssignFile(ArqN, wCaminhoArq);
  Rewrite(ArqN);
  wLinha := 'N1' + '81504763000171' + 'ISENTO        ' + '981           '
    + 'CEMAPA INFORMATICA ASSESSORIA E DESENVOLVIMENTO DE';
  Writeln(ArqN, wLinha);
  wNumLaudo := DMOracle.FastSelect('DESC_LAUDO_ANALISE_FUNCIONAL','TB_PARAM_SISTEMA');
  if wNumLaudo = '' then
    MessageDlg('Número do laudo de análise funcional não cadastrado ' +
    'nos parâmetros do sistema',mtWarning,[mbok],0);
  wLinha := 'N2' + wNumLaudo + 'SIAA                                              ' + '1.0       ';
  Writeln(ArqN, wLinha);
  for i:=0 to wListaArquivos.Count-1 do
  begin
    wMD5 := '';
    wCaminho := ExtractFilePath(Application.ExeName) + wListaArquivos.Strings[i];
    if FileExists(wCaminho) then
      wMD5 := MD5(wCaminho)
    else
      MessageDlg('O arquivo ' + wCaminho + ' não existe! Impossível gerar MD5!', mtError, [mbOK], 0);
    wLinha := 'N3' + Bib.AjustaStr(wListaArquivos.Strings[i], 50) + wMD5;
    Writeln(ArqN, wLinha);
  end;
  wLinha := 'N9' + '81504763000171' + 'ISENTO        ' + Bib.AjustaStrContrario(IntToStr(wListaArquivos.Count), 6, '0');
  writeln(ArqN,wLinha);
  CloseFile(ArqN);
  setlength(wAuxEAD, 256);
  iRetorno := generateEAD(wCaminhoArq, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
  if iRetorno = 0 then
    MessageDlg('Erro na assinatura do arquivo!', mtError, [mbOK], 0);
  wMD5 := MD5(wCaminhoArq);

  //Rotina para substituir o md5 gravado anteriormente. Como não é possivel alterar, o arquivo é criado novamente com base no antigo, trocando o MD5
  CopyFile(PAnsiChar(pathArquivosPAFECF +'config.txt'), PAnsiChar(pathArquivosPAFECF +'config_old.txt'), false);
  AssignFile(arqConfigNovo, pathArquivosPAFECF +'config.txt');
  Rewrite(arqConfigNovo);
  AssignFile(arqConfigOld, pathArquivosPAFECF +'config_old.txt');
  Reset(arqConfigOld);
  while not Eof(arqConfigOld) do
  begin
    Readln(arqConfigOld, wLinha);
    if Trim(wLinha) <> '[/GT]' then
      Writeln(arqConfigNovo, wLinha)
    else
    begin
      Writeln(arqConfigNovo, '[/GT]');
      Writeln(arqConfigNovo, '[MD5]');
      Writeln(arqConfigNovo, bib.encode(wMD5));
      Writeln(arqConfigNovo, '[/MD5]');
      Break;
    end;
  end;
  CloseFile(arqConfigOld);
  CloseFile(arqConfigNovo);
  DMOracle.ExecutaSql('UPDATE TB_PARAM_SISTEMA SET DESC_MD5_ARQ_CONFIG = '+
    quotedStr(wMD5),true);
  MessageDlg('Lista de arquivos do PAF-ECF gerado em: '+ wCaminhoArq,
    mtInformation,[mbOk],0);
end;

function TFImpressoraFiscal.VerificaPAFECFLiberado(pMostraMsg: Boolean = true): Boolean;
var
  wDataMovReducao, wDataImpressora, wHora: String;
  wVerificaNumSerie: Boolean;
begin
 { SetLength(wDataMovReducao, 7);

  iRetorno := Bematech_FI_VerificaImpressoraLigada;
  Analisa_iRetorno;
  result := iRetorno = 1;
  if not Result then
    Exit;

  iRetorno := Bematech_FI_DataMovimentoUltimaReducaoMFD(wDataMovReducao);
  result := iRetorno = 1;
  Analisa_iRetorno;
  if not Result then
    Exit;

  result := getDataHoraImpressora(wDataImpressora,wHora);
  if not Result then
    Exit;

  if trim(wDataMovReducao) = trim(wDataImpressora) then
  begin
    Result := false;
    MessageDlg('Bloqueado por redução Z', mtError, [mbOK], 0);
    Exit;
  end;     }
  Result := True;
  iretorno := Bematech_FI_VerificaEstadoImpressoraMFD(iACK, iST1, iST2, iST3);
  pPafEcfLiberado := (iRetorno = 1);
  Analisa_iRetorno;

  if iST3 in [1, 2, 3, 4, 9, 10, 11, 13, 43, 44, 45, 46, 47, 49, 50, 51, 54, 55, 56,
    57, 58, 60, 61, 63, 66, 67, 72, 73, 74, 75, 76, 77, 79, 89, 93, 95, 110, 123,
    124, 125, 126, 140, 145, 146, 147, 149, 150, 151, 159, 160, 217] then         //relação de retorno ST3 que impedem a impressora de emitir documentos fiscais
  begin
    Result := False;
    pPafEcfLiberado := false;
    MessageDlg(Analisa_iST3, mtError, [mbOK], 0);
  end;

  if not Result then
  begin
    HabilitaBotoes(pPafEcfLiberado);
    Exit;
  end;
  if pPafEcfLiberado then
  begin
  //Verifica existencia do arquivo de configurações do PAF-ECF
    wVerificaNumSerie := VerificaNumSerie_GT;
    pPafEcfLiberado := wVerificaNumSerie and pArqConfigValidado;
  //Result := wVerificaNumSerie;
  end;
  HabilitaBotoes(pPafEcfLiberado);
  Result := pPafEcfLiberado;
  if pMostraMsg then
    Retorno_Impressora;
end;

procedure TFImpressoraFiscal.HabilitaBotoes(pHabilita: Boolean);
begin
  btLX.Enabled := pHabilita;
  btLMFS.Enabled := pHabilita;
  btEspelho.Enabled := pHabilita;
  btArqMFD.Enabled := pHabilita;
  btIdentificaPAF.Enabled := pHabilita;
  BitBtn5.Enabled := pHabilita;
  btSangria.Enabled := pHabilita;
  btSuprimento.Enabled := pHabilita;
  BtIndiceAliquota.Enabled := pHabilita;

  //Em caso de falta de papel, os seguintes botões devem permancer habilitados
  btLMFS.Enabled := pHabilita or FaltaPapel;
  btArqMFD.Enabled := pHabilita or FaltaPapel;
  BtIndiceAliquota.Enabled := pHabilita or FaltaPapel;
  btEspelho.Enabled := pHabilita or FaltaPapel;

  //Redução Z deve ser desabilitado se faltar papel
  btRz.Enabled := not FaltaPapel;
end;

function TFImpressoraFiscal.FaltaPapel: Boolean;
begin
  iRetorno := Bematech_FI_RetornoImpressoraMFD(iACK, iST1, iST2, iST3);
  Result := (iST1 = 192);
end;

function TFImpressoraFiscal.VerificaNumSerie_GT: Boolean;
  function arquivoIntegro: boolean;
  var
    arqConfig: TextFile;
    wLinha: String;
    wEcfIni, wEcfFim, wGTIni, wGTFim: Boolean;
  begin
    wEcfIni := False;
    wEcfFim := False;
    wGTIni := False;
    wGTFim := False;
    result := FileExists(ExtractFilePath(Application.ExeName) + 'ARQUIVOS_ECF\config.txt');
    if not Result then
      Exit;
    AssignFile(arqConfig, ExtractFilePath(Application.ExeName) + 'ARQUIVOS_ECF\config.txt');
    Reset(arqConfig);
    while not Eof(arqConfig) do
    begin
      Readln(arqConfig, wLinha);
      if trim(wLinha) = '[ECF]' then
        wEcfIni := True;
      if (trim(wLinha) = '[/ECF]') and wEcfIni then
        wEcfFim := True;
      if (trim(wLinha) = '[GT]') and wEcfFim then
        wGTIni := True;
      if (trim(wLinha) = '[/GT]') and wGTIni then
        wGTFim := True;
    end;
    CloseFile(arqConfig);
    pArqConfigValidado := wEcfIni and wEcfFim and wGTIni and wGTFim;
    Result := pArqConfigValidado;
  end;
var arqConfig, arq60M: TextFile;
  wLinha, wNumSerie, wGT, wReinicioOpECF, wCRZ, wVendaBruta, wMes, wAno, wAuxData, wArquivo, wDados: String;
  wContReinicioOp:Integer;
begin
  wNumSerie := NumSerie;
  Result := wNumSerie <> '';
  if not result then
    Exit;
  DMImpressoraFiscal.QRUltimaRZ.Close;
  DMImpressoraFiscal.QRUltimaRZ.SetVariable('NUM_SERIE', wNumSerie);
  DMImpressoraFiscal.QRUltimaRZ.Open;
  SetLength(wGT, 19);
  iRetorno := Bematech_FI_GrandeTotal(wGT);
  Analisa_iRetorno;
  result := (iRetorno = 1) and Retorno_Impressora(false);
  if not result then
    Exit;

  if arquivoIntegro then
  begin
    AssignFile(arqConfig, ExtractFilePath(Application.ExeName) + 'ARQUIVOS_ECF\config.txt');
    Reset(arqConfig);
    while not Eof(arqConfig) do
    begin
      Readln(arqConfig, wLinha);
      if trim(wLinha) = '[ECF]' then
      begin
        Readln(arqConfig, wLinha);
        Result := False;
        while trim(wLinha) <> '[/ECF]' do
        begin
          if bib.Decode(Trim(wLinha)) = wNumSerie then
            Result := True;
          Readln(arqConfig, wLinha);
        end;
        if not Result then
        begin
          MessageDlg('ECF não cadastrado no arquivo auxiliar.' + #13 + #10
            +'Entre em contato com a Cemapa!', mtError, [mbOK], 0);
          CloseFile(arqConfig);
          Exit;
        end;
        Readln(arqConfig, wLinha);
      end;

      if trim(wLinha) = '[GT]' then
      begin
        Readln(arqConfig, wLinha);
        if bib.Decode(Trim(wLinha)) <> Trim(wGT) then
        begin
          if DMImpressoraFiscal.QRUltimaRZ.RecordCount > 0 then
          begin
            wContReinicioOp := DMImpressoraFiscal.QRUltimaRZNUM_REINICIO_OPRERACAO.Value;
            SetLength(wDados, 1279);
            iRetorno := Bematech_FI_DadosUltimaReducaoMFD(wDados);
            Analisa_iRetorno;
            Result := (iRetorno = 1) and Retorno_Impressora;
            if not Result then
              Exit;
            wReinicioOpECF := copy(wdados, 4, 4);
          end;
          if StrToInt('0'+wReinicioOpECF) > wContReinicioOp then  //se tiver ocorrido o reinicio de operação, atualiza o GT.
          begin
            CloseFile(arqConfig); //o arquivo deve ser fechado antes de chamar a função atualizaGT
            atualizaGT(wGT);
            Result := True;
          end
          else
          begin
            CloseFile(arqConfig);       
            if not RecuperaArquivoAuxiliar then //Caso não precise recuperar o arquivo auxiliar basta comentar o if
            begin
              Result := false;
              MessageDlg('Grande Total não confere!', mtError, [mbOK], 0);
            end;
          end;
        end
        else
        begin
          Result := True;
          CloseFile(arqConfig);
        end;
        Break;
      end;
    end;
  end
  else
  begin
    MessageDlg('Arquivo de configuração inválido ou não encontrado.', mtError,
      [mbOk],0);
    Result := false;
    //wArquivo := PathBematech + '60M.txt';
//    SetLength(wDados, 1279);
//    iRetorno := Bematech_FI_DadosUltimaReducaoMFD(wDados);
//    Analisa_iRetorno;
//    Result := (iRetorno = 1) and Retorno_Impressora;
//    if not Result then
//      exit;
//
//    wReinicioOpECF := copy(wdados, 4, 4);
//    wCRZ := copy(wdados, 9, 4);
//    if (wCRZ = '0000') then
//    begin
//      MessageDlg('Erro ao ler informações no arquivo de configurações.' +#13 +#10
//        +'Não foi possível recriar-lo pois ainda não foram emitidas reduções Z pelo ECF.', mtError, [mbOK], 0);
//      Result := False;
//      exit;
//    end;
//    wMes := copy(wDados, 1275, 2);
//    wAno := '20' + copy(wDados, 1277, 2);
//    wAuxData := wAno + wMes + copy(wDados, 1273, 2);
//
//
//    if not getArquivoSintegra(wArquivo, wMes, wAno, 1) then //gera o arquivo com registros 60M do mes da ultima redução
//    begin
//      Result := False;
//      exit;
//    end;
//    AssignFile(arq60M, wArquivo);
//    Reset(arq60M);
//    wVendaBruta := '';
//    while not Eof(arq60M) do
//    begin
//      Readln(arq60M,wLinha);
//      if Copy(wLinha, 1, 11) = '60M' + wAuxData then
//      begin
//        wVendaBruta := Trim(Copy(wLinha, 58, 16));
//        Break;
//      end;
//    end;
//    with DMImpressoraFiscal do
//    begin
//      if (QRUltimaRZNUM_CONTADOR_REDUCAOZ.Value = StrToInt(wCRZ)) and
//        (QRUltimaRZNUM_REINICIO_OPRERACAO.Value = StrToInt(wReinicioOpECF)) and
//        (Trunc(QRUltimaRZVAL_VENDA_BRUTA.Value*100) = StrToInt(wVendaBruta)) then
//      begin
//        AssignFile(arqConfig, ExtractFilePath(Application.ExeName) + 'ARQUIVOS_ECF\config.txt');
//        Rewrite(arqConfig);
//        Writeln(arqConfig, '[ECF]');
//        Writeln(arqConfig, wNumSerie);
//        Writeln(arqConfig, '[/ECF]');
//        Writeln(arqConfig, '[GT]');
//        Writeln(arqConfig, wGT);
//        Writeln(arqConfig, '[/GT]');
//        CloseFile(arqConfig);
//        Result := True;
//        MessageDlg('Arquivo de configuração do PAF-ECF recuperado com sucesso!', mtInformation, [mbOK], 0);
//        Exit;
//      end
//      else
//      begin
//        MessageDlg('Problemas ao tentar recuperar arquivo de configuração do PAF-ECF.'
//        +#13 +#10 +'Os dados não conferem.', mtError, [mbOK], 0);
//        Result := False;
//        Exit;
//      end;
//    end;
  end;
end;

procedure TFImpressoraFiscal.atualizaGT(pGrandeTotal: String);
var
  arqConfigNovo, arqConfigOld: TextFile;
  wLinha: String;
  wArqCriado: Boolean;
begin
  CopyFile(PAnsiChar(pathArquivosPAFECF +'config.txt'), PAnsiChar(pathArquivosPAFECF +'config_old.txt'), false);

  AssignFile(arqConfigNovo, pathArquivosPAFECF +'config.txt');
  //AssignFile(arqConfigNovo, 'C:\Geraexe\ARQUIVOS_ECF\config.txt');
  wArqCriado := false;
  try
    Rewrite(arqConfigNovo);
  Except
    MessageDlg('Arquivo de configuração sendo utilizando por outro processo.',
      mtError,[mbok],0);
    Abort;
  end;
  AssignFile(arqConfigOld, pathArquivosPAFECF +'config_old.txt');
  Reset(arqConfigOld);
  while not Eof(arqConfigOld) do
  begin
    Readln(arqConfigOld, wLinha);
    if Trim(wLinha) <> '[GT]' then
    begin
      Writeln(arqConfigNovo, wLinha);
    end
    else
    begin
      Writeln(arqConfigNovo, '[GT]');
      Readln(arqConfigOld, wLinha); //apenas para continuar o arquivo
      Writeln(arqConfigNovo, bib.encode(pGrandeTotal));
      Readln(arqConfigOld, wLinha); //apenas para continuar o arquivo
      Writeln(arqConfigNovo, '[/GT]');
    end;
  end;
  CloseFile(arqConfigOld);
  CloseFile(arqConfigNovo);
end;

function TFImpressoraFiscal.getGT(var pGT:String): Boolean;
var
  wGT: String;
begin
  SetLength(wGT, 19);
  iRetorno := Bematech_FI_GrandeTotal(wGT);
  Analisa_iRetorno;
  pGT := wGT;
  if iRetorno = 1 then
    result := Retorno_Impressora
  else
    result := false;

end;

function TFImpressoraFiscal.getMD5ArqConfig: String;
var
  arqConfig: TextFile;
  wLinha: String;
begin
  if not pArqConfigValidado then
  begin
    MessageDlg('Arquivo de configuração inválido ou não encontrado.',
      mtError, [mbOk], 0);
    Abort;
  end;
  AssignFile(arqConfig, pathArquivosPAFECF +'config.txt');
  Reset(arqConfig);
  while not Eof(arqConfig) do
  begin
    Readln(arqConfig, wLinha);
    if Trim(wLinha) = '[MD5]' then
    begin
      Readln(arqConfig, wLinha);
      Break;
    end;
  end;
  if (Trim(wLinha) <> '') and (Trim(wLinha) <> '[/MD5]') then
    Result := wLinha
  else
    Result := '';
  CloseFile(arqConfig);
end;

function TFImpressoraFiscal.sangria(pValor: Real): Boolean;
var
  wValor: String;
  wValorAux: Integer;
begin
  wValorAux := Trunc(pValor * 100);
  wValor := IntToStr(wValorAux);
  iRetorno := Bematech_FI_Sangria(pchar(wValor));
  Analisa_iRetorno;
  Result := (iretorno = 1) and Retorno_Impressora;
end;

function TFImpressoraFiscal.suprimento(pValor: Real): Boolean;
var
  wValor, wFormaPagamento: String;
  wValorAux: Integer;
begin
  wFormaPagamento := 'Dinheiro';
  wValorAux := Trunc(pValor * 100);
  wValor := IntToStr(wValorAux);
  iRetorno := Bematech_FI_Suprimento(pchar(wValor), pchar(wFormaPagamento));
  Analisa_iRetorno;
  Result := (iretorno = 1) and Retorno_Impressora;
end;

procedure TFImpressoraFiscal.InsereDemaisDocumentos(pDenominacao: string;
  pCodNotaCab: Integer=0; pValor: Double=0);
var
  ex: TExecutador;
  wSql, wMfAdicional, wModelo: string;
  wNumUsuario: Integer;
  x,y: Array of String;
  wNumCOO,wNumeroOperacoes,wNumRel,sComp, sDataHora: string;
  wHashMD5,wCodigoDemaisDocs: String;
  wCDC: String;
begin
  {SetLength(x,3);
  SetLength(y,3);
  x[0] := 'SELECT IND_MF_ADICIONAL FROM TB_ECF WHERE NUM_SERIE = '+ pNumSerieECF;
  x[1] := 'SELECT DESC_MODELO FROM TB_ECF WHERE NUM_SERIE = '+ pNumSerieECF;
  x[2] := 'SELECT NUM_USUARIO FROM TB_ECF WHERE NUM_SERIE = '+ pNumSerieECF;}
  setLength(wNumCOO,7);
  setLength(wNumeroOperacoes,7);
  setLength(wNumRel,7);
  setLength(sComp,7);
  setLength(sDataHora,13);

  iRetorno := Bematech_FI_NumeroCupom(wNumCOO);
  Analisa_iRetorno;
  if not((iretorno = 1) and (Retorno_Impressora)) then
    wNumCOO := '-1';
  iRetorno := Bematech_FI_NumeroOperacoesNaoFiscais(wNumeroOperacoes);
  Analisa_iRetorno;
  if not((iretorno = 1) and (Retorno_Impressora)) then
    wNumeroOperacoes := '-1';
  iRetorno := Bematech_FI_ContadorRelatoriosGerenciaisMFD(wNumRel);
  Analisa_iRetorno;
  if not((iretorno = 1) and (Retorno_Impressora)) then
    wNumRel := '-1';
  if pDenominacao = 'CC' then
  begin
    iRetorno := Bematech_FI_ContadorComprovantesCreditoMFD(sComp);
    Analisa_iRetorno;
  end
  else
    sComp := '';
  if not((iretorno = 1) and (Retorno_Impressora)) then
    sComp := '-1';
  iRetorno := Bematech_FI_DataHoraUltimoDocumentoMFD(sDataHora);
  Analisa_iRetorno;
  if not((iretorno = 1) and (Retorno_Impressora)) then
    sDataHora := '-1';
  try
    sComp := copy(sComp,1,4)
  Except
    sComp := '';
  end;

  //PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ,'TB_DEMAIS_DOCUMENTOS_ECF');

  try
    StrToInt(Trim(sComp));
  Except
    sComp := '';
  end;

  with DMOracle do
  begin
    wCodigoDemaisDocs :=
    FastSelect('SQ_DEMAIS_DOCUMENTOS_ECF.NEXTVAL','DUAL');
    //BuscaNomes(x,y);
    wSql := 'INSERT INTO TB_DEMAIS_DOCUMENTOS_ECF VALUES(';
    wSql := wSql + wCodigoDemaisDocs+',';
    wSql := wSql + quotedStr(Trim(NumSerie)) + ',';
    wSql := wSql + Trim(wNumCOO)+ ',';
    wSql := wSql + Trim(wNumeroOperacoes) + ',';
    wSql := wSql + Trim(wNumRel) + ',';
    if wCDC <> '' then
      wSql := wSql + Trim(sComp) + ','
    else
      wSql := wSql +'null,';
    wSql := wSql + QuotedStr(Trim(pDenominacao)) + ',';
    wSql := wSql + 'TO_DATE('+QuotedStr(Trim(DateTimeToStr(RetornaDataHora(sDataHora)))) +
      ','+QuotedStr('DD/MM/YYYY HH24:MI:SS') + '),null'+',';
    wSql := wSql + IfThen(pCodNotaCab>0,intToStr(pCodNotaCab),'null')+',';
    wSql := wSql + IfThen(pValor>0,bib.TrocaVirgulaPorPonto(FloatToStr(pValor))
      ,'null')+')';
    ex := TExecutador.Create;
    ex.Adiciona(wSql);
    try
      ex.Executar(true,true);
    Except
      MessageDlg('Não foi possível armazenar as informações referentes a este' +
        ' documento no banco de dados' + #10#13 +
        ' Por favor guarde o recibo impresso com cuidado e comunique este erro'+
        ' à Cemapa', mtError, [mbOk], 0);
    end;
    //ex.Adiciona();
    with DMImpressoraFiscal do
    begin
      QChecaMD5DemaisDoc.Close;
      QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
        StrToInt(wCodigoDemaisDocs));
      QChecaMD5DemaisDoc.Open;
      bib.GeraMD5Query(QChecaMD5DemaisDoc,'TB_DEMAIS_DOCUMENTOS_ECF');
//      bib.AtualizaExclusaoInclusaoMD5(StrToDate(copy(sDataHora,1,2)+'/'+
//        copy(sDataHora,3,2)+'/'+copy(sDataHora,5,2)),
//        StrToDate(copy(sDataHora,1,2)+'/'+
//        copy(sDataHora,3,2)+'/'+copy(sDataHora,5,2)),True);
    end;
  end;
  with DMOracle do
  begin
    ExecutaSql('DELETE FROM TB_PAF_INCLUSAO_EXCLUSAO WHERE COD_PAF_INCLUSAO_EXCLUSAO LIKE ' +
      QuotedStr(wCodigoDemaisDocs+'TB_DEMAIS_DOCUMENTOS_ECF'),true);
  end;
end;

function TFImpressoraFiscal.RetornaDataHora(pData: string): TDateTime;
var wData, wHora: string;
begin
  wData := copy(pData, 1,6);
  wData := bib.LimpaNumero(Trim(wData));
  wHora := copy(pData, 7,Length(pData));
  wHora := bib.LimpaNumero(Trim(wHora));
  Insert('/', wData,3);
  Insert('/', wData,6);
  Insert('20', wData,7);
  Insert(':', wHora,3);
  Insert(':', wHora,6);
  result := StrToDateTime(wData + ' ' + wHora);
end;

procedure TFImpressoraFiscal.btSangriaClick(Sender: TObject);
var wNumCOO: string;
 wNumeroOperacoes, wNumRel: string;
begin
  if not VerificaPAFECFLiberado then
    Exit;
  setLength(wNumCOO,7);
  setLength(wNumeroOperacoes,7);
  setLength(wNumRel,7);
  if FTefInputBox = nil then
    FTefInputBox := TFTefInputBox.Create(Application);
  FTefInputBox.configura('Informe o valor', 'Informe o valor da sangria.', true, false, 3, 14, 'VALOR', 0);
  if FTefInputBox.ShowModal = mrOk then
  begin
    if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
    FAguarde.Show;
    Application.ProcessMessages;
    try                         
      sangria(StrToFloat(FTefInputBox.edValor.Text));
      InsereDemaisDocumentos('CN');
    finally
      FAguarde.Close;
    end;
  end;
end;

procedure TFImpressoraFiscal.btSuprimentoClick(Sender: TObject);
begin
  if not VerificaPAFECFLiberado then
    Exit;
  if FTefInputBox = nil then
    FTefInputBox := TFTefInputBox.Create(Application);
  FTefInputBox.configura('Informe o valor', 'Informe o valor do suprimento.', true, false, 3, 14, 'VALOR', 0);
  if FTefInputBox.ShowModal = mrOk then
  begin
    if FAguarde = Nil then
      FAguarde := TFAguarde.Create(Application);
    FAguarde.Show;
    Application.ProcessMessages;
    try
      suprimento(StrToFloat(FTefInputBox.edValor.Text));
      InsereDemaisDocumentos('CN');
    Finally
      FAguarde.Close;
    end;
  end;
end;

function TFImpressoraFiscal.ultimoCupomAberto: Integer;
var
  wAuxCodNota, wAuxSituacao: String;
begin
  wAuxCodNota := DMOracle.FastSelect('MAX(COD_NOTA_CAB)', 'TB_NOTA_CAB',
      'NUM_SERIE_ECF = ' + QuotedStr(NumSerie));
  if wAuxCodNota = '' then
    wAuxCodNota := '0';
  wAuxSituacao := DMOracle.FastSelect('IND_SITUACAO', 'TB_NOTA_CAB',
    'COD_NOTA_CAB = ' + wAuxCodNota);

  if Trim(wAuxSituacao) = '1' then
    Result := StrToInt(wAuxCodNota)
  else
    Result := 0;
end;

{function TFImpressoraFiscal.verificaCupomCancelado2Horas: Boolean;
var
  wDataMovReducao: String;
  wDtImpressora, wDtCupom: TDateTime;
begin
  SetLength(wDataMovReducao, 7);
  iRetorno := Bematech_FI_DataMovimentoUltimaReducaoMFD(wDataMovReducao);
  result := iRetorno = 1;
  Analisa_iRetorno;

  getDataHoraImpressora(wDataEcf, wHoraEcf);

  wDtImpressora := StrToDate(copy(wDataEcf, 0, 2) + '/' + copy(wDataEcf, 2, 2) + '/20' + copy(wDataEcf, 4, 2)
    + copy(wDataEcf, 0, 2) + ':' + copy(wDataEcf, 2, 2) + ':' + copy(wDataEcf, 4, 2));

  wDtCupom := DMImpressoraFiscal.QCupomFiscalCabDT_MOVIMENTO.Value;       parei aqui

        {ShowMessage('Data do cupom:' + FormatDateTime('ddmmyy', DMImpressoraFiscal.QCupomFiscalCabDT_MOVIMENTO.Value)
          + ' Data impressora: ' + wDataEcf);
        ShowMessage('Hora do cupom:' + FormatDateTime('hhmmss', DMImpressoraFiscal.QCupomFiscalCabDT_MOVIMENTO.Value)
          + ' Hora impressora: ' + wHoraEcf);
  ;
end;   }

function TFImpressoraFiscal.cupomAberto: Boolean;
begin
  iRetorno := Bematech_FI_VerificaEstadoImpressoraMFD(iACK, iST1, iST2, iST3);

  if iRetorno = 0 then //erro de comunicação
    Result := false
  else
    Result := (iST3 <> 66) and (iST3 <> 63);
end;

procedure TFImpressoraFiscal.ImprimeComprovanteNaoFiscalVinculado(pVinculado: boolean=true);
  var wFormaPagto, wTextoImpressao, wValor, wNumeroCupom: String;
  wDesc_Produto, wCliente, wVendedor, wTexto: string;
  i,cont: Integer;
begin
  with DMNotaSaida, DMOracle do
  begin
    wValor :=  '';
    wNumeroCupom := '';
    wCliente := '';
    wTexto := '';
    if not pVinculado then
    begin
      wValor :=  QSomaItemNotasval_total_nota.Text;
      wNumeroCupom := QNotaSaidaNUM_COO.Text;
    end;

    //Retirado da procedure EmiteCF_Yanco
    //se mudar lá tem que mudar aqui também
    If QNotaSaidaInd_Condicao_Pagto.Value = '1' Then
     Begin
       If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BRASIL' Then
          wFormaPagto := 'DINHEIRO'
       Else
          wFormaPagto := 'A VISTA'
     End
    Else
      If QNotaSaidaInd_Condicao_Pagto.Value  = '4' Then
      begin
        wFormaPagto := 'CARTAO';
        //configuração para o desenvolvimento do T.E.F.
        if DMOracle.FastSelect('NVL(DESC_IP_TEF,0)','TB_FILIAL',
          'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) <> '0' then
          wFormaPagto := 'T.E.F.'
      end
      Else
        wFormaPagto := 'A PRAZO';

    wTextoImpressao := Bib.FormataTexto('Documento: ' + QNotaSaidaNUM_NOTA.Text, 48);
    wVendedor :=
      FastSelect('NOME','TB_VENDEDOR','COD_VENDEDOR = ' +
        QNotaSaidaCOD_VENDEDOR.Text);
    wTextoImpressao := wTextoImpressao + Bib.FormataTexto('Vendedor: ' + wVendedor, 48);
    wTextoImpressao := wTextoImpressao + Bib.FormataTexto('Entrada: ' + QNotaSaidaVAL_AVISTA.Text, 48);
    wTextoImpressao := wTextoImpressao + Bib.FormataTextoEsq('QTDE', 9);
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('PREÇO', 9);
    wTextoImpressao := wTextoImpressao + bib.FormataTexto(' DESCRIÇÃO', 21);
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('VALOR(R$)', 9);
    wTextoImpressao := wTextoImpressao + '------------------------------------------------';//48

    QItemNF.First;
    while not QItemNF.Eof do
    begin

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
         wDesc_Produto:=Copy(QItemNFDesc_Complemento.Value,1,25)
      Else
         wDesc_Produto:=QItemNFDesc_Complemento.Value;
      if Trim(wDesc_Produto) = '' then
         if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
            wDesc_Produto:=Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True),1,25)
         Else
            wDesc_Produto:=DMOracle.BuscaNome('SELECT DESC_PRODUTO || ' + QuoteDSTR('  ') +  '|| DESC_UNIDADE ||' + QuoteDSTR('  ') + '|| NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True);
      if Trim(wDesc_Produto) = '' then
         wDesc_Produto:= 'PRODUTO NÃO ENCONTRADO???';

      wTextoImpressao := wTextoImpressao +
        bib.FormataTextoEsq(FormatFloat('#0.00', QItemNFQT_QUANTIDADE.Value), 9);
      wTextoImpressao := wTextoImpressao +
        bib.FormataTextoEsq(FormatFloat('#0.00', QItemNFVAL_UNITARIO.Value), 9);
      wTextoImpressao := wTextoImpressao +
        bib.FormataTexto(' '+copy(wDesc_Produto,1,20), 21);
      wTextoImpressao := wTextoImpressao +
        bib.FormataTextoEsq(FormatFloat('#0.00', QItemNFVAL_TOTAL.Value), 9);
      QItemNF.Next;
    end;

    //Parcelas C.R.
    QContaReceber.Close;
    QContaReceber.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Text);
    QContaReceber.Open;
    if QContaReceber.RecordCount > 0 then
    begin
      wTextoImpressao := wTextoImpressao + bib.FormataTexto('Parcelas',48);
      wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Parc',10);
      wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Vencimento',16);
      wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Valor',22);

      while not QContaReceber.Eof do
      begin
        wTextoImpressao := wTextoImpressao +
          bib.FormataTextoEsq(QContaReceberNUM_PARCELA.Text,10);
        wTextoImpressao := wTextoImpressao +
          bib.FormataTextoEsq(QContaReceberDT_VENCIMENTO.Text,16);
        wTextoImpressao := wTextoImpressao +
          bib.FormataTextoEsq(
            FormatFloat('#0.00',QContaReceberVAL_TITULO.Value),22);
        QContaReceber.Next;
      end;
    end;
    wTextoImpressao := wTextoImpressao + bib.FormataTexto('Desconto: '+
      FormatFloat('#0.00',QSomaItemNotaSVAL_DESCONTO.Value),48);
    wTextoImpressao := wTextoImpressao + bib.FormataTexto('Total: '+
      FormatFloat('#0.00',QSomaItemNotasval_total_nota.Value),48);
    wCliente :=
      FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' +
        QNotaSaidaCOD_CADASTRO.Text);
    wTextoImpressao := wTextoImpressao + bib.FormataTexto('Reconheço e pagarei a importância acima.',48);
    wTextoImpressao := wTextoImpressao + '                                                ';//48
    wTextoImpressao := wTextoImpressao + '                                                ';//48
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Ass:________________________________',48);
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq(copy(QNotaSaidaCOD_CADASTRO.Text + ' ' +
      wCliente,1,48),48);
  end;
  //Abre comprovante
  iRetorno := Bematech_FI_AbreComprovanteNaoFiscalVinculado( pchar( wFormaPagto ),
    pchar(wValor), pchar(wNumeroCupom));
  Analisa_iRetorno();
  Retorno_Impressora();

  //Imprime mensagem
  {i:=1;
  while(i < Length(wTextoImpressao)) do
  begin
    if Length(wTextoImpressao) <= 618 then
    begin
      wTexto := wTextoImpressao;
      i := Length(wTextoImpressao);
    end
    else
    begin
      wTexto := Copy(wTextoImpressao,i,618);
      if i=1 then
        i:= Length(wTexto)+1
      else
        i := i+Length(wTexto);
    end;
    iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pchar(wTexto));
    Analisa_iRetorno();
    Retorno_Impressora();
    wTexto := '';
  end;}
  cont := 0;
  for i:=1 to Length(wTextoImpressao) do
  begin
    Inc(cont);
    if cont >= 600 then
    begin
      iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pchar(wTexto));
      Analisa_iRetorno();
      Retorno_Impressora();
      cont := 0;
      wTexto := '';
    end;
    wTexto := wTexto + wTextoImpressao[i];
    if i = Length(wTextoImpressao) then
    begin
      iRetorno := Bematech_FI_UsaComprovanteNaoFiscalVinculado(pchar(wTexto));
      Analisa_iRetorno();
      Retorno_Impressora();
    end;
  end;
  //Fecha comprovante
  iRetorno := Bematech_FI_FechaComprovanteNaoFiscalVinculado();
  Analisa_iRetorno();
  Retorno_Impressora();
end;

procedure TFImpressoraFiscal.ImprimeRelatorioGerencial;
  var wFormaPagto, wTextoImpressao, wValor, wNumeroCupom: String;
  wDesc_Produto, wCliente, wVendedor, wTexto: string;
  i: Integer;
begin
  with DMNotaSaida, DMOracle do
  begin
    wValor :=  '';
    wNumeroCupom := '';
    wCliente := '';
    wTexto := '';

    //Retirado da procedure EmiteCF_Yanco
    //se mudar lá tem que mudar aqui também
    If QNotaSaidaInd_Condicao_Pagto.Value = '1' Then
     Begin
       If DMParamSistema.QParamSistemaCod_Empresa.Value = 'BRASIL' Then
          wFormaPagto := 'DINHEIRO'
       Else
          wFormaPagto := 'A VISTA'
     End
    Else
      If QNotaSaidaInd_Condicao_Pagto.Value  = '4' Then
      begin
        wFormaPagto := 'CARTAO';
        //configuração para o desenvolvimento do T.E.F.
        if DMOracle.FastSelect('NVL(DESC_IP_TEF,0)','TB_FILIAL',
          'COD_FILIAL = ' + QNotaSaidaCOD_FILIAL.Text) <> '0' then
          wFormaPagto := 'T.E.F.'
      end
      Else
        wFormaPagto := 'A PRAZO';

    wTextoImpressao := Bib.FormataTexto('Documento: ' + QNotaSaidaNUM_NOTA.Text, 48);
    wVendedor :=
      FastSelect('NOME','TB_VENDEDOR','COD_VENDEDOR = ' +
        QNotaSaidaCOD_VENDEDOR.Text);
    wTextoImpressao := wTextoImpressao + Bib.FormataTexto('Vendedor: ' + wVendedor, 48);
    wTextoImpressao := wTextoImpressao + Bib.FormataTexto('Entrada: ' + QNotaSaidaVAL_AVISTA.Text, 48);
    wTextoImpressao := wTextoImpressao + Bib.FormataTextoEsq('QTDE', 9);
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('PREÇO', 9);
    wTextoImpressao := wTextoImpressao + bib.FormataTexto(' DESCRIÇÃO', 21);
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('VALOR(R$)', 9);
    wTextoImpressao := wTextoImpressao + '------------------------------------------------';//48

    QItemNF.First;
    while not QItemNF.Eof do
    begin
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
         wDesc_Produto:=Copy(QItemNFDesc_Complemento.Value,1,25)
      Else
         wDesc_Produto:=QItemNFDesc_Complemento.Value;
      if Trim(wDesc_Produto) = '' then
         if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CASATINTAS' Then
            wDesc_Produto:=Copy(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True),1,25)
         Else
            wDesc_Produto:=DMOracle.BuscaNome('SELECT DESC_PRODUTO || ' + QuoteDSTR('  ') +  '|| DESC_UNIDADE ||' + QuoteDSTR('  ') + '|| NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value),True);
      if Trim(wDesc_Produto) = '' then
         wDesc_Produto:= 'PRODUTO NÃO ENCONTRADO???';
      wTextoImpressao := wTextoImpressao +
        bib.FormataTextoEsq(FormatFloat('#0.00', QItemNFQT_QUANTIDADE.Value), 9);
      wTextoImpressao := wTextoImpressao +
        bib.FormataTextoEsq(FormatFloat('#0.00', QItemNFVAL_UNITARIO.Value), 9);
      wTextoImpressao := wTextoImpressao +
        bib.FormataTexto(' '+copy(wDesc_Produto,1,20), 21);
      wTextoImpressao := wTextoImpressao +
        bib.FormataTextoEsq(FormatFloat('#0.00', QItemNFVAL_TOTAL.Value), 9);
      QItemNF.Next;
    end;

    //Parcelas C.R.
    QContaReceber.Close;
    QContaReceber.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Text);
    QContaReceber.Open;
    if QContaReceber.RecordCount > 0 then
    begin
      wTextoImpressao := wTextoImpressao + bib.FormataTexto('Parcelas',48);
      wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Parc',10);
      wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Vencimento',16);
      wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Valor',22);

      while not QContaReceber.Eof do
      begin
        wTextoImpressao := wTextoImpressao +
          bib.FormataTextoEsq(QContaReceberNUM_PARCELA.Text,10);
        wTextoImpressao := wTextoImpressao +
          bib.FormataTextoEsq(QContaReceberDT_VENCIMENTO.Text,16);
        wTextoImpressao := wTextoImpressao +
          bib.FormataTextoEsq(
            FormatFloat('#0.00',QContaReceberVAL_TITULO.Value),22);
        QContaReceber.Next;
      end;
    end;
    wTextoImpressao := wTextoImpressao + bib.FormataTexto('Desconto: '+
      FormatFloat('#0.00',QSomaItemNotaSVAL_DESCONTO.Value),48);
    wTextoImpressao := wTextoImpressao + bib.FormataTexto('Total: '+
      FormatFloat('#0.00',QSomaItemNotasval_total_nota.Value),48);
    wCliente :=
      FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' +
        QNotaSaidaCOD_CADASTRO.Text); 
    wTextoImpressao := wTextoImpressao + bib.FormataTexto('Reconheço e pagarei a importância acima.',48);
    wTextoImpressao := wTextoImpressao + '                                                ';//48
    wTextoImpressao := wTextoImpressao + '                                                ';//48
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq('Ass:________________________________',48);
    wTextoImpressao := wTextoImpressao + bib.FormataTextoEsq(copy(QNotaSaidaCOD_CADASTRO.Text + ' ' +
      wCliente,1,48),48);
  end;

  //Imprime mensagem
  i:=1;
  while(i < Length(wTextoImpressao)) do
  begin
    if Length(wTextoImpressao) <= 600 then
    begin
      wTexto := wTextoImpressao;
      i := Length(wTextoImpressao);
    end
    else
    begin
      wTexto := Copy(wTextoImpressao,i,600);
      if i=1 then
        i:= Length(wTexto)+1
      else
        i := i+Length(wTexto);
    end;
    iRetorno := Bematech_FI_RelatorioGerencial(pchar(wTexto));
    Analisa_iRetorno();
    Retorno_Impressora();
  end;

  //Fecha comprovante
  iRetorno := Bematech_FI_FechaRelatorioGerencial();
  Analisa_iRetorno();
  Retorno_Impressora();
end;

function TFImpressoraFiscal.NumeroUltimoCupom: String;
var iConta: Integer;
  NumeroCupom: String;
begin
  for iConta := 1 to 7 do NumeroCupom := NumeroCupom + ' ';
  iRetorno := Bematech_FI_NumeroCupom( NumeroCupom );
  Analisa_iRetorno();
  Retorno_Impressora();
  result := NumeroCupom;
end;

procedure TFImpressoraFiscal.VoltaConfirmacao;
  var
  wAux: string;
begin
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
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ') or
    (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO')then
  begin
    if FSenha = nil then
      FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
    begin
      if UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
        raise Exception.Create('Usuário sem permissão!');
    end
    else
      Abort;
  end;
  if not DMUsuario.ContabilPrivilegiado then
    if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Text <> '' then
      if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value then
        raise Exception.Create('Não é Permitido Voltar Confirmação - Fechamento Contabil');
  try
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
end;

procedure TFImpressoraFiscal.CancelaNota;
  var
  iRetornoAux: Integer;
  cCPF, cNomeCliente, cEnderecoCliente, cTexto, wDescPrazoVencimento: String;
  TemTEF: Boolean;
begin
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
    raise Exception.Create('Não é possivel cancelar uma Nota confirmada!');
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' then
    raise Exception.Create('Esta Nota Fiscal já está cancelada!');
  if DMNotaSaida.QNotaSaidaNUM_NOTA.Value = 0 then
    raise Exception.Create('Não é possível cancelar uma nota que não foi confirmada.' +
      #13 + #10 + 'Para se desfazer dessa nota basta excluir.');
  if DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA', 'COD_NOTA_CAB = ' + FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)) <> '' then
    raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
  if FNotaSaida_Cancela = nil then
    FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);
  If DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull Then
     FNotaSaida_Cancela.CBEmail.Checked := False
  Else
     FNotaSaida_Cancela.CBEmail.Checked := True;
  if FNotaSaida_Cancela.ShowModal = MrOk then
  begin
    if (DMOperacao.QOperacaoInd_Cupom_Fiscal.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
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
              if UpperCase(Trim(wDescPrazoVencimento)) = 'CARTAO' then
                TemTEF := True;
            end;
          end
          else
            //Normal
            if DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '4' then
              TemTEF := True;

          if TemTEF then
          begin
            if FTef = nil then
              FTef := TFTef.Create(Application);
            if FImpressoraFiscal.StatusTEF <> 0 then
            begin
              FTEF.ValorTransacao := 0;
              FTEF.Modalidade := 200;
              FTEF.btIniciaTef.Visible := true;
              FTEF.Comprovantes := TStringList.Create;
              FTEF.lbMensagem.Caption := '';
              //FTEF.PrimeiraInicializacao := True;
              FTEF.ShowModal;
            end;
          end;
        end;
        //fim da rotina do tef
//**************************************************************************
      end;
    end;
  end;
end;

procedure TFImpressoraFiscal.CancelaCupomCompleto;
begin
  VoltaConfirmacao;
  CancelaNota;  
end;


procedure TFImpressoraFiscal.BtVendasNoPeriodoClick(Sender: TObject);
var
  cArquivo,cMes,cAno,cRazaoSocial,cEndereco,cNumero,cComplemento,
  cBairro,cCidade,cCEP,cTelefone,cFax,cContato,wAuxEAD: String;
  wAnoW,wMesW,wDia: word;
  ret: Integer;
  wDtIni, wDtFin: TDate;
  cArquivoTXT,cDataInicial,cDataFinal,cPerfil,cCFOP,
  cCODOBSFiscal,cAliqPIS,cAliqCOFINS,cEmpresa,cCodMunicipio: string;
  wErro: Boolean;
begin

  //if not RelatorioVendasNoPeriodoLiberado then
//  begin
//    MessageDlg('Este relatório só pode ser gerado no período entre a última Redução Z' +
//      ' e o primeiro cupom emitido do dia posterior.' , mtError, [mbOk],0);
//    Abort;
//  end;
//  if FAguarde = Nil then
//    FAguarde := TFAguarde.Create(Application);
//  try
//    //Arquivo Sintegra
//    DecodeDate(Date, wAnoW, wMesW, wDia);
//    if wMesW > 1 then
//    begin
//      cMes := FloatToStr(wMesW - 1);
//      cAno := IntToStr(wAnoW);
//    end
//    else
//    begin
//      cMes := '12';
//      cAno := FloatToStr(wAnoW - 1);
//    end;
//    if not InputQuery('Vendas no período', 'Mês', cMes) then
//      Abort;
//    if not InputQuery('Vendas no período', 'Ano', cAno) then
//      Abort;
//
//    FAguarde.Show;
//    if Length(cAno) <> 4 then
//      Raise Exception.Create('Ano inválido');
//    cMes := FormatFloat('00', StrToInt(cMes));
//    with DMFilial, DMParamSistema do
//    begin
//      QFilial.Close;
//      QFilial.SetVariable('PK', DMUsuario.CodFilialUsuario);
//      QFilial.Open;
//      cArquivo := pathArquivosPAFECF + //verificar se pode gravar neste diretório ou deve ser no diretório corrente da app
//        QParamSistemaDESC_LAUDO_ANALISE_FUNCIONAL.Value +
//        FormatDateTime('DDMMYYYY',DMOracle.DataServ) +
//        FormatDateTime('hhmmss',DMOracle.DataHoraServ) + '.txt';
//      cRazaoSocial := Copy(QFilialDESC_FILIAL.Value,1,35);
//      cEndereco := Copy(QFilialDESC_ENDERECO.Value,1,34);
//      cNumero := Copy(QFilialNUM_ENDERECO.Text,1,5);
//      cComplemento := Copy(QFilialDESC_COMPLEMENTO_ENDERECO.Value,1,22);
//      cBairro := Copy(QFilialDESC_BAIRRO.Value,1,15);
//      cCidade := Copy(QFilialDESC_CIDADE.Value,1,30);
//      cCep := Copy(Bib.LimpaString(QFilialDESC_CEP.Value,'-'),1,8);
//      cTelefone := Copy(Bib.LimpaString(QFilialDESC_TELEFONE.Value,'-,. ()'),1,12);
//      cFax := Copy(Bib.LimpaString(QFilialDESC_FAX.Value,'-,. ()'),1,10);
//      cContato := Copy(QFilialDESC_NOME_CONTATO.Value,1,18);
//
//      ret := Bematech_FI_RelatorioSintegraMFD(63,
//          pChar(cArquivo),
//          pChar(cMes),
//          pChar(cAno),
//          pChar(cRazaoSocial),
//          pChar(cEndereco),
//          pChar(cNumero),
//          pChar(cComplemento),
//          pChar(cBairro),
//          pChar(cCidade),
//          pChar(cCep),
//          pChar(cTelefone),
//          pChar(cFax),
//          pChar(cContato));
//      case ret of
//      0:   ShowMessage('Retorno da função: Erro de Comunicação');
//      //1: ShowMessage('Retorno da função: Ok');
//      -1:  ShowMessage('Retorno da função: Erro de execução da função.');
//      -2:  ShowMessage('Retorno da função: Parâmetro inválido');
//      -4:  ShowMessage('Retorno da função: Arquivo ini não encontrado ou parâmetro inválido para o nome da porta');
//      -5:  ShowMessage('Retorno da função: Erro ao abrir a porta de comunicação');
//      -27: ShowMessage('Retorno da função: Status da impressora diferente de 6,0,0,0 (Ack, St1, St2 e St3)');
//      end;
//      if ret = 1 then
//      begin
//        setlength(wAuxEAD, 256);
//        iRetorno := generateEAD(cArquivo, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
//        FAguarde.Close;
//        if iRetorno = 0 then
//          MessageDlg('Erro na assinatura do arquivo: ' + cArquivo, mtError, [mbOK], 0);
//      end
//      else
//        wErro := true;
//
//      //Arquivo SPED
//      bib.PriUltDataVar(wDtIni, wDtFin,true,DMOracle.DataServ);
//
//      cArquivoTXT   := pathArquivosPAFECF + //verificar se pode gravar neste diretório ou deve ser no diretório corrente da app
//        QParamSistemaDESC_LAUDO_ANALISE_FUNCIONAL.Value +
//        FormatDateTime('DDMMYYYY',DMOracle.DataServ) +
//        FormatDateTime('hhmmss',DMOracle.DataHoraServ)+ '.txt';
//      cDataInicial  := DateToStr(wDtIni);
//      cDataFinal    := DateToStr(wDtFin);
//      if Trim(QFilialIND_PERFIL_SPED.Value) <> '' then
//        cPerfil       := QFilialIND_PERFIL_SPED.Value
//      else
//        MessageDlg('Perfil do SPED não informado no cadastro da fiilal', mtError,
//          [mbOk],0);
//      cCFOP         := DMOracle.FastSelect('NUM_NATUREZA_EST_NOVO','TB_OPERACAO',
//                    'IND_CUPOM_FISCAL = '+quotedStr('S') +
//                    ' AND NUM_NATUREZA_EST_NOVO IS NOT NULL AND ROWNUM = 1');
//      cCODOBSFiscal := ' ';
//      cAliqPIS      := '00,00';
//      cAliqCOFINS   := '00,00';
//      cEmpresa      := Copy(QFilialDESC_FILIAL.Value,1,80);
//      cCodMunicipio := DMOracle.FastSelect('COD_UF_IBGE','TB_ESTADO',
//                    'COD_ESTADO = ' + quotedStr(QFilialCOD_ESTADO.Text));
//      cCodMunicipio := cCodMunicipio + DMOracle.FastSelect('COD_CIDADE_IBGE','TB_CIDADE',
//                    'COD_CIDADE = ' + QFilialCOD_CIDADE.Text);
//
//      if Trim(cCFOP) = '' then
//      begin
//        MessageDlg('Não existe nenhuma operação cadastrada para emitir cupom fiscal.',
//          mtError, [mbOk],0);
//        Abort;
//      end;
//      if Trim(cCodMunicipio) = '' then
//      begin
//        MessageDlg('Cidade da filial não possui código IBGE cadastrado.',
//          mtError, [mbOk],0);
//        Abort;
//      end;
//      ret := Bematech_FI_GeraRegistrosSpedCompleto('',
//        pchar( cArquivoTXT ), pchar( cDataInicial ), pchar( cDataFinal ),
//        pchar( cPerfil ), pchar( cCFOP ),pchar(cCODOBSFiscal), pchar( cAliqPIS ),
//        pchar( cAliqCOFINS ), pchar( cEmpresa ), pchar( cCodMunicipio ) );
//      case ret of
//      0:   ShowMessage('Retorno da função: Erro de Comunicação');
//      //1: ShowMessage('Retorno da função: Ok');
//      3:   ShowMessage('Não foi possível criar arquivo TXT');
//      4:   ShowMessage('Data informada inválida');
//      -1:  ShowMessage('Erro de execução da função');
//      -2:  ShowMessage('Parâmetro inválido na função');
//      -4:  ShowMessage('O arquivo de inicialização BemaFI32.ini não foi encontrado no diretório de sistema do Windows');
//      -5:  ShowMessage('Erro ao abrir a porta de comunicação');
//      -27: ShowMessage('Status da impressora diferente de 6,0,0 (ACK, ST1 e ST2)');
//      end;
//      if ret = 1 then
//      begin
//        wAuxEAD := '';
//        setlength(wAuxEAD, 256);
//        iRetorno := generateEAD(cArquivoTXT, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
//        FAguarde.Close;
//        if iRetorno = 0 then
//          MessageDlg('Erro na assinatura do arquivo: ' + cArquivo, mtError, [mbOK], 0);
//      end
//      else
//        wErro := true;
//      if not wErro then
//        MessageDlg('Registros gerados com sucesso no diretório ' + pathArquivosPAFECF,
//          mtError, [mbOk], 0);
//    end;
//    FAguarde.Close;
//  Except
//    on e:Exception do
//    begin
//      MessageDlg('Erro: ' + e.Message, mtError,[mbOk],0);
//      FAguarde.Close;
//    end;
//  end;

end;

procedure TFImpressoraFiscal.BitBtn5Click(Sender: TObject);
var
  wFraseInicio: String;
  wMsg :String;
  wTexto: String;
  i: integer;
  cIndice,cDescricao: String;
begin
  if not VerificaPAFECFLiberado then
    Exit;
  cIndice := '03';
  cDescricao := 'Param de Config';  
  wFraseInicio := bib.FormataTexto('Todas as parametrizações relacionadas neste',48);
    wFraseInicio := wFraseInicio + bib.FormataTexto('relatório são de configuração inacessível',48);
    wFraseInicio := wFraseInicio + bib.FormataTexto('ao usuário do PAF-ECF. A ativação ou não',48);
    wFraseInicio := wFraseInicio + bib.FormataTexto('destes parâmetros é determinada pela',48);
    wFraseInicio := wFraseInicio + bib.FormataTexto('unidade federada e somente pode ser feita',48);
    wFraseInicio := wFraseInicio + bib.FormataTexto('pela intervenção da empresa desenvolvedora',48);
    wFraseInicio := wFraseInicio + bib.FormataTexto('do PAF-ECF.',48);

  wMsg := bib.FormataTexto('Perfis Atendidos',48);
  wMsg := wMsg + bib.FormataTexto('ND', 48);
  wMsg := wMsg + bib.FormataTexto('Perfil Configurado:', 48);
  wMsg := wMsg + bib.FormataTexto('ND', 48);
  wMsg := wMsg + bib.FormataTexto('', 48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IV', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 2', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:', 48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Realizar registro de pré-venda.',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IV',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 3', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: DAV impresso em equipamento não',48);
  wMsg := wMsg + bib.FormataTexto(' fiscal.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IV', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 5', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Lançamento de mesa/conta de cliente',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: VI', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 2', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Possibilidade de impressão de DAV.',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 2', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: PAF-ECF com MINAS LEGAL',48);
  wMsg := wMsg + bib.FormataTexto(' (p/ Estado de Minas Gerais).', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 2a', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: PAF-ECF com CUPOM MANIA',48);
  wMsg := wMsg + bib.FormataTexto(' (p/ Estado de Rio de Janeiro).', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 2b', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);  
  wMsg := wMsg + bib.FormataTexto('-Descrição: PAF para estabelecimentos situados',48);
  wMsg := wMsg + bib.FormataTexto(' no Distrito Federal, incluído no programa de', 48);
  wMsg := wMsg + bib.FormataTexto(' concessão de créditos.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: IX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 2c', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: PAF-ECF com PARAÍBA LEGAL',48);
  wMsg := wMsg + bib.FormataTexto(' (p/ Estado da Paraíba);', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: X', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48); 
  wMsg := wMsg + bib.FormataTexto('-Descrição: PAF para estabelecimentos situados',48);
  wMsg := wMsg + bib.FormataTexto(' no Distrito Federal, quando imprimir no Cupom', 48);
  wMsg := wMsg + bib.FormataTexto(' Fiscal o CPF ou CNPJ do adquirente.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: XVI', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 4', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:    a1', 48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Troco cartão para Supermercado,',48);
  wMsg := wMsg + bib.FormataTexto(' minimercado e mercado no estado de SC.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: XX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 1', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:    a)', 48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Tela para consulta de preço contendo',48);
  wMsg := wMsg + bib.FormataTexto(' totalização dos valores da lista de itens.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: XX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 1', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:    b)', 48);     
  wMsg := wMsg + bib.FormataTexto('-Descrição: Tela para consulta de preço com',48);
  wMsg := wMsg + bib.FormataTexto(' possibilidade de transformar as informações', 48);
  wMsg := wMsg + bib.FormataTexto(' digitadas em registro de pré-venda.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);
  
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: XX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 1', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:    c)', 48);     
  wMsg := wMsg + bib.FormataTexto('-Descrição: Tela para consulta de preço com',48);
  wMsg := wMsg + bib.FormataTexto(' possibilidade de utilizar as informações', 48);
  wMsg := wMsg + bib.FormataTexto(' digitadas para impressão de DAV.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: XXIV', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 7', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:    b)', 48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Recomposição do GT caso tenha',48);
  wMsg := wMsg + bib.FormataTexto(' ocorrido incremento do CRO.', 48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: SIM', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: XXV', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item: 1',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea: b',48);
  wMsg := wMsg + bib.FormataTexto('-Descrição: Cancelar automaticamente',48);
  wMsg := wMsg + bib.FormataTexto('o Cupom Fiscal em emissão no ECF',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: SIM', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito específico para postos de',48);
  wMsg := wMsg + bib.FormataTexto('combustíveis:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO II', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para bares, restaurantes e similares:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO III', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para farmácia de manipulação:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO IV', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para oficina de conserto, hotéis',48);
  wMsg := wMsg + bib.FormataTexto('e similares:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO V', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para transporte de passageiros:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO VI', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para Posto de pedágio:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO VII', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para estacionamento, Motéis',48);
  wMsg := wMsg + bib.FormataTexto('e similares:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO VIII', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wMsg + bib.FormataTexto('Requisito para Prest. Serv. Cinemas,',48);
  wMsg := wMsg + bib.FormataTexto('espetáculos e similares:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Requisito: BLOCO IX', 48);
  wMsg := wMsg + bib.FormataTexto('-Identificação do Item:',48);
  wMsg := wMsg + bib.FormataTexto('-Identificação da alínea:',48);
  wMsg := wMsg + bib.FormataTexto('-Parâmetro de configuração: NÃO', 48);
  wMsg := wMsg + bib.FormataTexto('',48);

  wMsg := wFraseInicio + bib.FormataTexto('',48) + wMsg;
  ImprimeRelatorioGerencialMFD(wMsg, cDescricao, cIndice);
  AtualizaEstoqueDiario;
  InsereDemaisDocumentos('RG');
end;

function TFImpressoraFiscal.RelatorioVendasNoPeriodoLiberado: Boolean;
var wDados, wTotalizadorReducao: string;
  wGrandeTotal: string;
  iConta: integer;
begin
  if verificaImpressoraLigada then
  begin
    SetLength(wDados, 1279);
    iRetorno := Bematech_FI_DadosUltimaReducaoMFD(wDados);
    Analisa_iRetorno;
    if (iRetorno <> 1) or not(Retorno_Impressora) then
      Result := false;
    wTotalizadorReducao := copy(wDados, 316,18);
    for iConta := 1 to 19 do wGrandeTotal := wGrandeTotal + ' ';
    iRetorno := Bematech_FI_GrandeTotal(wGrandeTotal);
    Analisa_iRetorno;
    if (iRetorno <> 1) or not(Retorno_Impressora) then
      Result := false;
    Result := (Trim(wTotalizadorReducao) = Trim(wGrandeTotal));
  end
  else
    Result := true; //Se impressora estiver desligada libera a geração do relatório
end;

procedure TFImpressoraFiscal.openClick(Sender: TObject);
var wTexto,wTextoImpressao,wLinha,wLinhaSomaDia: String;
  i: Integer;
  wValorDia,wValorTotal,wValorTotalDinheiro,
    wValorTotalCheque,wValorTotalCredito,
    wValorTotalDebito,wValorTotalPrazo: Double;
  wDtAnterior: TDate;
  wPagamento: String;
begin
  //with DMImpressoraFiscal do
//  begin
//    if FImpressoraFiscalParam = Nil then
//      FImpressoraFiscalParam := TFImpressoraFiscalParam.Create(Application);
//    FImpressoraFiscalParam.PGRelatorio.Pages[4].TabVisible := true;
//
//    if FImpressoraFiscalParam.ShowModal = MrOk then
//    begin
//      QRMeiosPagto.Close;
//      QRMeiosPagto.SetVariable('DT_INI', Trim(FImpressoraFiscalParam.FM5Datas.
//        MeDtInicial.Text));
//      QRMeiosPagto.SetVariable('DT_FIN', Trim(FImpressoraFiscalParam.FM5Datas.
//        MeDtFinal.Text));
//      QRMeiosPagto.Open;
//      if QRMeiosPagto.RecordCount > 0 then
//      begin
//        wTexto := bib.FormataTexto('PERÍODO SOLICITADO DE ' +
//          Trim(FImpressoraFiscalParam.FM5Datas.
//        MeDtInicial.Text) + ' ATÉ '+
//        Trim(FImpressoraFiscalParam.FM5Datas.
//        MeDtFinal.Text),48);
//
//        wLinha := '';
//        wValorDia := 0;
//        wValorTotal := 0;
//        wDtAnterior := QRMeiosPagtoDT_RECEBIMENTO.Value;
//        wLinhaSomaDia := '';
//        while not QRMeiosPagto.Eof do
//        begin
//
//          //Totaliza o dia menos do último registro
//          if (QRMeiosPagtoDT_RECEBIMENTO.Value <> wDtAnterior) and
//            (QRMeiosPagto.RecNo <> QRMeiosPagto.RecordCount) then
//          begin
//            wLinhaSomaDia := 'SOMA DO DIA ' + DateToStr(wDtAnterior) +
//              ' = ' + FormatFloat('#0.00',wValorDia);
//            wValorDia := 0;
//          end;
//
//            //Para abreviar as descrições
//            if QRMeiosPagtoDESC_PAGAMENTO.Text = 'CARTAO CREDITO' then
//              wPagamento := 'C.CREDITO'
//            else
//              if QRMeiosPagtoDESC_PAGAMENTO.Text = 'CARTAO DEBITO' then
//                wPagamento := 'C.DEBITO'
//              else
//                if QRMeiosPagtoDESC_PAGAMENTO.Text = 'DINHEIRO' then
//                  wPagamento := 'DINHEIRO'
//                else
//                  if QRMeiosPagtoDESC_PAGAMENTO.Text = 'CHEQUE' then
//                    wPagamento := 'CHEQUE'
//                  else
//                    if QRMeiosPagtoDESC_PAGAMENTO.Text = 'A PRAZO' then
//                      wPagamento := 'PRAZO';
//
//          wLinha := QRMeiosPagtoDT_RECEBIMENTO.Text+'-'+
//            wPagamento+'-'+
//            QRMeiosPagtoDESC_SERIE_MODELO.Value+'-'+
//            FormatFloat('#,##0.00',QRMeiosPagtoVAL_TOTAL.Value);
//          wValorDia := wValorDia + QRMeiosPagtoVAL_TOTAL.Value;
//          wValorTotal := wValorTotal + wValorDia;
//
//          //Totaliza o dia do último registro
//          if(QRMeiosPagto.RecNo = QRMeiosPagto.RecordCount) then
//          begin
//            wLinhaSomaDia := 'SOMA DO DIA ' + DateToStr(wDtAnterior) +
//              ' = ' + FormatFloat('#0.00',wValorDia);
//            wValorDia := 0;
//          end;
//
//          if (wLinhaSomaDia <> '') and
//            (QRMeiosPagto.RecNo <> QRMeiosPagto.RecordCount)then
//          begin
//            wTexto := wTexto +
//              bib.FormataTexto(wLinhaSomaDia,48);
//            wLinhaSomaDia := '';
//          end;
//          wTexto := wTexto +
//            bib.FormataTexto(wLinha,48);
//          if (wLinhaSomaDia <> '') and
//            (QRMeiosPagto.RecNo = QRMeiosPagto.RecordCount)then
//          begin
//            wTexto := wTexto +
//              bib.FormataTexto(wLinhaSomaDia,48);
//            wLinhaSomaDia := '';
//          end;
//
//          //Contabiliza os totalizadores
//          if QRMeiosPagtoDESC_PAGAMENTO.Text = 'DINHEIRO' then
//            wValorTotalDinheiro :=
//            wValorTotalDinheiro + QRMeiosPagtoVAL_TOTAL.Value
//          else
//            if QRMeiosPagtoDESC_PAGAMENTO.Text = 'CHEQUE' then
//              wValorTotalCheque :=
//              wValorTotalCheque + QRMeiosPagtoVAL_TOTAL.Value
//            else
//              if QRMeiosPagtoDESC_PAGAMENTO.Text = 'CARTAO CREDITO' then
//                wValorTotalCredito :=
//                wValorTotalCredito + QRMeiosPagtoVAL_TOTAL.Value
//              else
//                if QRMeiosPagtoDESC_PAGAMENTO.Text = 'CARTAO DEBITO' then
//                  wValorTotalDebito :=
//                  wValorTotalDebito + QRMeiosPagtoVAL_TOTAL.Value
//                else
//                  if QRMeiosPagtoDESC_PAGAMENTO.Text = 'A PRAZO' then
//                    wValorTotalPrazo :=
//                    wValorTotalPrazo + QRMeiosPagtoVAL_TOTAL.Value;
//          wDtAnterior := QRMeiosPagtoDT_RECEBIMENTO.Value;
//          QRMeiosPagto.Next;
//        end;
//        //Adiciona os totalizadores
//        wTexto := wTexto+bib.FormataTexto('TOTAL DO PERÍODO SOLICITADO:',48);
//        wTexto := wTexto+
//          bib.FormataTexto('DINHEIRO - ' + FormatFloat('#0.00',wValorTotalDinheiro),48);
//        wTexto := wTexto+
//          bib.FormataTexto('CHEQUE - ' + FormatFloat('#0.00',wValorTotalCheque),48);
//        wTexto := wTexto+
//          bib.FormataTexto('CARTAO DEBITO - ' + FormatFloat('#0.00',wValorTotalDebito),48);
//        wTexto := wTexto+
//          bib.FormataTexto('CARTAO CREDITO - ' + FormatFloat('#0.00',wValorTotalCredito),48);
//        wTexto := wTexto+
//          bib.FormataTexto('PRAZO - ' + FormatFloat('#0.00',wValorTotalPrazo),48);
//        wTexto := wTexto+
//          bib.FormataTexto('SOMA TOTAL - ' + FormatFloat('#0.00',wValorTotalCredito
//            +wValorTotalDinheiro+wValorTotalCheque+wValorTotalDebito+
//            wValorTotalPrazo),48);
//
//        //Imprime mensagem
//        i:=1;
//        while(i < Length(wTexto)) do
//        begin
//          if Length(wTexto) <= 600 then
//          begin
//            wTextoImpressao := wTexto;
//            i := Length(wTexto);
//          end
//          else
//          begin
//            wTextoImpressao := Copy(wTexto,i,600);
//            if i=1 then
//              i:= Length(wTextoImpressao)+1
//            else
//              i := i+Length(wTextoImpressao);
//          end;
//          iRetorno := Bematech_FI_RelatorioGerencial(pchar(wTextoImpressao));
//          Analisa_iRetorno();
//          Retorno_Impressora();
//        end;
//
//        //Fecha comprovante
//        iRetorno := Bematech_FI_FechaRelatorioGerencial();
//        Analisa_iRetorno();
//        Retorno_Impressora();
//        AtualizaEstoqueDiario;
//      end
//      else
//        MessageDlg('Nenhum registro encontrado',mtInformation,[mbOk],0);
//    end;
//  end;
end;

procedure TFImpressoraFiscal.btIndiceTecClick(Sender: TObject);
begin
  //MessageDlg('Este PAF-ECF não executa funções de baixa de estoque' + #13#10 +
//    'com base em índices técnicos de produção, não podendo' + #13#10 +
//    'ser utilizando por estabelecimento que necessite deste recurso.',
//    mtWarning,[mbOk],0);
end;

procedure TFImpressoraFiscal.BtIndiceAliquotaClick(Sender: TObject);
var iConta: integer;
  sTot: String;
  arq: TextFile;
begin
  if (iRetorno = 1) and ((not Retorno_Impressora(false) and
      FaltaPapel) or Retorno_Impressora(false)) then
  begin
    if FAliquotasImpressora = Nil then
      FAliquotasImpressora := TFAliquotasImpressora.Create(Application);
    FAliquotasImpressora.ShowModal;
  end;
end;

//Esta procedure serve como exemplo para persistir campos CLOB.
//Campos CLOB são utilizados para strings gigantes.
procedure TFImpressoraFiscal.PersisteReducaoRepositorio(pNumSerie,pArquivo,pDados: String;
  pDtReducao: TDate; pNumSeq: Integer);
  var wLobArquivo,wLobDados: TLobLocator;
begin
  with DMImpressoraFiscal do
  begin
    try
      QReducaoRepositorio.Close;
      QReducaoRepositorio.SetVariable('NUM_SERIE',pNumSerie);
      QReducaoRepositorio.SetVariable('DT_REDUCAO',pDtReducao);
      wLobArquivo := TLobLocator.CreateTemporary(QReducaoRepositorio.Session,
        otCLOB,false);
      wLobArquivo.AsString := pArquivo;
      QReducaoRepositorio.SetComplexVariable('DESC_ARQUIVO',wLobArquivo);

      wLobDados := TLOBLocator.CreateTemporary(QReducaoRepositorio.Session,
        otCLOB,false);
      wLobDados.AsString := pDados;
      QReducaoRepositorio.SetComplexVariable('DESC_DADOS_REDUCAO',wLobDados);

      QReducaoRepositorio.SetVariable('NUM_SEQ_IMPRESSORA',pNumSeq);
      QReducaoRepositorio.ExecSQL;
      QReducaoRepositorio.Session.Commit;
    Except
      on E: Exception do
      begin
        //Da erro quando tenta importar uma redução que já foi importada
        //Só mostra mensagem se for outro tipo de erro
        if Pos('SISTEMA.PK_REPOSITORIO_REDUCAO_Z',e.Message) = 0 then
          MessageDlg('Erro: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

Procedure TFImpressoraFiscal.AtualizaEstoqueDiario;
var wData,wHora,wQtdeRegistros,wCodigo: String;
begin
  //Atualiza o estoque diário para o relatório Estoque do menu fiscal
  //Somente se for o primeiro cupom do dia
  with DMImpressoraFiscal do
  begin
    if getDataHoraImpressora(wData, wHora) then
    begin
      CadastraImpressora;
      self.getDataHoraImpressora(wData, wHora);
      wQtdeRegistros := DMOracle.FastSelect('count(*)', 'tb_estoque_diario_cab', 'DT_ESTOQUE = '
        + QuotedStr(wData) + ' AND COD_FILIAL = ' + IntToStr(DMUsuario.CodFilialUsuario));

      //Verifica se ja foi salvo o estoque do dia. Caso contrario salva. OBS: A inserção dos itens é feita pela trigger trg_salva_estoque_diario.
      if StrToInt(wQtdeRegistros) = 0 then
      begin
        wCodigo := DMOracle.FastSelect('SQESTOQUE_DIARIO_CAB.NEXTVAL','DUAL');
        DMOracle.ExecutaSql('INSERT INTO TB_ESTOQUE_DIARIO_CAB VALUES('+wCodigo+', '
          + IntToStr(DMUsuario.CodFilialUsuario) + ', ' + QuotedStr(wData) + ', ' + QuotedStr(wHora)
            + ', ' + QuotedStr(QECFNUM_SERIE.Value) + ', ' + QuotedStr(QECFDESC_TIPO.Value) + ', '
              + QuotedStr(QECFDESC_MARCA.Value) + ', ' + QuotedStr(QECFDESC_MODELO.Value)
                + ', ' + QuotedStr(QECFIND_MF_ADICIONAL.Value) + ',null)');

//        QChecaMD5EstoqueDiarioCab.Close;
//        QChecaMD5EstoqueDiarioCab.SetVariable('COD_ESTOQUE_DIARIO_CAB',
//          wCodigo);
//        QChecaMD5EstoqueDiarioCab.Open;
//        bib.GeraMD5Query(QChecaMD5EstoqueDiarioCab,'TB_ESTOQUE_DIARIO_CAB');
//        QBuscaEstoqueDiarioItem.Close;
//        QBuscaEstoqueDiarioItem.SetVariable('COD_ESTOQUE_DIARIO_CAB',wCodigo);
//        QBuscaEstoqueDiarioItem.Open;
//        while not QBuscaEstoqueDiarioItem.Eof do
//        begin
//          QChecaMD5EstoqueDiarioItem.Close;
//          QChecaMD5EstoqueDiarioItem.SetVariable('COD_ESTOQUE_DIARIO_ITEM',
//            QBuscaEstoqueDiarioItemCOD_ESTOQUE_DIARIO_ITEM.Value);
//          QChecaMD5EstoqueDiarioItem.Open;
//          bib.GeraMD5Query(QChecaMD5EstoqueDiarioItem, 'TB_ESTOQUE_DIARIO_ITEM');
//          bib.AtualizaExclusaoInclusaoMD5(DMOracle.DataServ,DMOracle.DataServ,
//            true);
//          QBuscaEstoqueDiarioItem.Next;
//        end;
      end;
    end;
  end;
end;

function TFImpressoraFiscal.VerificaReducaoPendente: Boolean;
var
  DataMovimento, DataReducao: String;
  iConta: Integer;
begin
  //Data do movimento
  for iConta := 1 to 7 do DataMovimento := DataMovimento + ' ';
  iRetorno := Bematech_FI_DataMovimento( DataMovimento );
  Analisa_iRetorno;
  //Data da última redução
  for iConta := 1 to 7 do DataReducao := DataReducao + ' ';
  iRetorno   := Bematech_FI_DataMovimentoUltimaReducaoMFD( DataReducao );
  Analisa_iRetorno;

  DataMovimento := Trim(DataMovimento);
  DataReducao := Trim(DataReducao);
  DataMovimento := Copy(DataMovimento,1,2)+'/'+Copy(DataMovimento,3,2)+'/20'+
    Copy(DataMovimento,5,2);
  DataReducao := Copy(DataReducao,1,2)+'/'+Copy(DataReducao,3,2)+'/20'+
    Copy(DataReducao,5,2);

  if DataReducao = '00/00/2000' then
    result := false
  else
    if (DataMovimento = '00/00/2000') and (DataReducao <> '00/00/2000') then
      result := false
    else
      if StrToDate(DataMovimento) < StrToDate(DataReducao) then
        result := false
      else
        if DataMovimento = DataReducao then
          result := false
        else
          result := true;
end;

function TFImpressoraFiscal.RecuperaArquivoAuxiliar: Boolean;
var x,y: Array of String;
  arq: TextFile;
  linha, wValorBruto,wCRZ,wCRO,wGT: String;
  cTipo: String;
begin
  if NumSerie = 'EMULADOR' then
  begin
    Result := true;
    Exit;
  end;
  //Recompõe o Grande Total do arquivo auxiliar se o CRZ, CRO e Valor Bruto
  // da redução anterior forem iguais aos que estão em B.D.
  //Conforme req. XXIV - 8 - a. da especificação de requisitos.
  Result := false;
  SetLength(x,3);
  SetLength(y,3);
  x[0] := 'SELECT M.NUM_CONTADOR_REDUCAOZ FROM TB_REGISTRO_TIPO60_MESTRE M '+
    'WHERE M.DT_EMISSAO = (SELECT MAX(DT_EMISSAO) FROM '+
    'TB_REGISTRO_TIPO60_MESTRE WHERE DESC_SERIE = M.DESC_SERIE) '+
    'AND M.DESC_SERIE = '+ QuotedStr(NumSerie);
  x[1] := 'SELECT M.NUM_REINICIO_OPRERACAO FROM TB_REGISTRO_TIPO60_MESTRE M '+
    'WHERE M.DT_EMISSAO = (SELECT MAX(DT_EMISSAO) FROM '+
    'TB_REGISTRO_TIPO60_MESTRE WHERE DESC_SERIE = M.DESC_SERIE) '+
    'AND M.DESC_SERIE = '+ QuotedStr(NumSerie);
  x[2] := 'SELECT M.VAL_VENDA_BRUTA FROM TB_REGISTRO_TIPO60_MESTRE M '+
    'WHERE M.DT_EMISSAO = (SELECT MAX(DT_EMISSAO) FROM '+
    'TB_REGISTRO_TIPO60_MESTRE WHERE DESC_SERIE = M.DESC_SERIE) '+
    'AND M.DESC_SERIE = '+ QuotedStr(NumSerie);
  DMOracle.BuscaNomes(x,y);
  cTipo := 'C';

  //Verificar se existe redução pendente
  //if VerificaReducaoPendente then
//  begin
//    MessageDlg('Impressora bloqueada por RZ e dados do arquivo auxiliar não conferem com dados da impressora.'+#13#10+
//    'Por favor, comande uma redução Z e reincie o sistema',mtError,[mbOk],0);
//    Result := false;
//    Exit;
//  end;
  //Se cair aqui com uma redução pendente o sistema fica travado
  iRetorno := Bematech_FI_LeituraMemoriaFiscalSerialReducaoPAFECF(
  bib.AjustaStrContrario(y[0],4,'0'),
  bib.AjustaStrContrario(y[0],4,'0'),
  pchar(cTipo),pchar(CHAVE_PUBLICA),pchar(CHAVE_PRIVADA));
  try
    AssignFile (arq, PathBematech()+'Retorno.txt');
  Except
    Result := false;
    abort;
  end;
  Reset(arq);
  wValorBruto := '';
  while not Eof(arq) do
  begin
    Readln(arq,linha);
    if AnsiContainsStr(linha,'Venda Bruta ( R$)') then
    begin
      wValorBruto := Trim(copy(linha,18,Length(linha)));
      break;
    end;
  end;
  Reset(arq);
  while not Eof(arq) do
  begin
    Readln(arq,linha);
    if AnsiContainsStr(linha,'Contador de Reduções Z:') then
    begin
      wCRZ := Trim(copy(linha,24,Length(linha)));
      break;
    end;
  end;
  Reset(arq);
  while not Eof(arq) do
  begin
    Readln(arq,linha);
    if AnsiContainsStr(linha,'Contador de Reinício de Operação:') then
    begin
      wCRO := Trim(copy(linha,34,Length(linha)));
      break;
    end;
  end;
  if (wValorBruto <> '') and (wCRZ <> '') and (wCRO <> '') then
  begin
    if (y[0] = IntToStr(StrToInt(wCrz))) and
      (y[1] = IntToStr(StrToInt(wCRO))) and
      (y[2] = FloatToStr(StrToFloat(wValorBruto))) then
    if getGT(wGT) then
    begin
      atualizaGT(wGT);
      Result := true;
    end;
  end;
  CloseFile(arq);
end;

procedure TFImpressoraFiscal.BtRegistrosClick(Sender: TObject);
var
  wCaminhoArq, wLinha, wAuxEAD, wParametroAdicional, wDataFormatada: string;
  ArqRegistros,ArqConfig: TextFile;
  wHashMD5,wHashMD5Produto,wHashMD5Quantidade: String;
  wModeloECF,wUnidade,wDataIni,wDataFin: String;
  wCnpj,wIE,wIMunicipal,wDescEmpresa,wDescSistema,wVersaoSistema,wMD5,wDataIniFormat,
      wDataFimFormat,wArquivoData,wArquivoNumSerie,wArquivoCodigo, wModelo,
      wMeioPagamento,wRS,wRec: String;
  wPagamentoAlterado: Boolean;
  wDataReducao,wDataRef: TDateTime;
  AuxArq: TStringList;
  wItemValido,wDemaisDocAlterado,wFilialValida: Boolean;
  i,wDias: Variant;
  wIn,wNn,wFn,wISn,wNSn,wFSn,wDT,wDS,wAT,wAS,wCanT,wCanS,wOPNF,wOPNFAux: Double;
  wCont: Integer;
begin
  if Sender = Nil then
  begin
    if getDataHoraReducao(wDataReducao) then
      wDataIni := FormatDateTime('dd/mm/yyyy',wDataReducao);
      wDataFin := FormatDateTime('dd/mm/yyyy',wDataReducao);
  end
  else
  begin
    if FImpressoraFiscalParam = nil then
      FImpressoraFiscalParam := TFImpressoraFiscalParam.Create(Application);
    FImpressoraFiscalParam.PGRelatorio.Pages[2].TabVisible := true;
    if FImpressoraFiscalParam.ShowModal = mrOk then
    begin
      wDataIni := Trim(FImpressoraFiscalParam.fm3Datas.MeDtInicial.Text);
      wDataFin := Trim(FImpressoraFiscalParam.fm3Datas.MeDtFinal.Text);
    end;
  end;
  if (wDataIni = '') or (wDataFin = '') then
  begin
    Abort;
  end
  else
  begin
    i:= StrToDate(wDataFin)-StrToDate(wDataIni);
    wDataRef := StrToDate(wDataIni);
    while i >= 0 do
    begin
//      if DMOracle.FastSelect('COUNT(*)','TB_HASH_MD5_TABELAS','DT_REGISTRO = '+
//        QuotedStr(DateToStr(wDataRef))) = '0' then
//      begin
//        PafEcfHashTabelas.Instancia.Atualiza(wDataRef);
//        bib.AtualizaExclusaoInclusaoMD5(wDataRef,wDataRef,True);
//      end;
      wDataRef := wDataRef + 1;
      Dec(i);
    end;
    with DMImpressoraFiscal do
    begin
      if FAguarde = Nil then
        FAguarde := TFAguarde.Create(Application);
      FAguarde.Show;
      Application.ProcessMessages;
      //Estoque
      QRIdentificEmpresaE1.close;
      QRIdentificEmpresaE1.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
      QRIdentificEmpresaE1.SetVariable('DT_ESTOQUE', FormatDateTime('ddmmyy', StrToDate(wDataFin)));
      QRIdentificEmpresaE1.Open;
      //QREstoqueE2.close;
//      QREstoqueE2.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
//      QREstoqueE2.SetVariable('DT_ESTOQUE', FormatDateTime('ddmmyy', StrToDate(wDataFin)));
//      if FImpressoraFiscalParam.rg3Tipo.ItemIndex = 0 then
//        QREstoqueE2.SetVariable('CODIGO_DESCRICAO', '1=1') //quando é total seta o paramentro como True(1=1)
//      else
//      begin
//        if FImpressoraFiscalParam.rg3TipoParametro.ItemIndex = 0 then
//        begin
//          wParametroAdicional := 'EDI.COD_PRODUTO IN(';
//          with DMImpressoraFiscal do
//          begin
//            cdsParametrosEstoque.First;
//            while not cdsParametrosEstoque.Eof do
//            begin
//              wParametroAdicional := wParametroAdicional + cdsParametrosEstoquecod_produto.AsString;
//              cdsParametrosEstoque.Next;
//              if cdsParametrosEstoque.eof then
//                wParametroAdicional := wParametroAdicional + ')'
//              else
//                wParametroAdicional := wParametroAdicional + ', '
//            end;
//          end;
//        end
//        else
//        begin
//          wParametroAdicional := 'UPPER(TRIM(P.DESC_PRODUTO)) IN(';
//          with DMImpressoraFiscal do
//          begin
//            cdsParametrosEstoque.First;
//            while not cdsParametrosEstoque.Eof do
//            begin
//              wParametroAdicional := wParametroAdicional + 'TRIM(' + QuotedStr(UpperCase(cdsParametrosEstoquedesc_produto.AsString)) + ')';
//              cdsParametrosEstoque.Next;
//              if cdsParametrosEstoque.eof then
//                wParametroAdicional := wParametroAdicional + ')'
//              else
//                wParametroAdicional := wParametroAdicional + ', ';
//                if DMOracle.FastSelect('COUNT(*)','TB_PRODUTO',
//                  'UPPER(TRIM(DESC_PRODUTO)) LIKE ' +
//                  quotedStr(
//                  UpperCase(
//                    Trim(cdsParametrosEstoquedesc_produto.AsString))
//                  )
//                  ) = '0' then
//                begin
//                  FAguarde.Close;
//                  MessageDlg('Produto não existe.' + #13#10 +
//                    UpperCase(cdsParametrosEstoquedesc_produto.AsString), mtError,
//                    [mbOk],0);
//                  Abort;
//                end;
//            end;
//          end;
//        end;
//        QREstoqueE2.SetVariable('CODIGO_DESCRICAO', wParametroAdicional);
//
//      end;
//      QREstoqueE2.Open;

      //Identificação do Estabelecimento U1
      QRU1.Close;
      QRU1.SetVariable('COD_FILIAL',DMUsuario.CodFilialUsuario);
      QRU1.Open;

      //Meios de Pagamento
      QRMeiosPagto.Close;
      QRMeiosPagto.SetVariable('DT_INI',StrToDate(wDataIni));
      QRMeiosPagto.SetVariable('DT_FIN',StrToDate(wDataFin));
      QRMeiosPagto.Open;

      //Mercadorias e Serviços
      QRTabProd.Close;
      QRTabProd.SetVariable('FILIAL',DMUsuario.CodFilialUsuario);
      QRTabProd.Open;

      //ECF que emitiu atualização de estoque
      QRE3.Close;
      QRE3.SetVariable('DT_INI',wDataIni);
      QRE3.SetVariable('DT_FIN',wDataFin);
      QRE3.Open;

      //Referente ao arquivo
//      wDataIniFormat := FormatDateTime('YYYYMMDD', wDataReducao);
//      wDataFimFormat := FormatDateTime('YYYYMMDD', wDataReducao);

//      wDataIniFormat := DateTimeToStr(wDataRef);
//      wDataFimFormat := DateTimeToStr(wDataRef);
      wArquivoData := FormatDateTime('YYYYMMDDHHMMSS',DMOracle.DataHoraServ);
      wArquivoNumSerie := Copy(DMOracle.FastSelect('NUM_SERIE','TB_ECF','ROWNUM = 1 ORDER BY NUM_SEQ_ECF'),6,14);
      wArquivoCodigo := '030901'; //MP-2100 TH FI
      wCaminhoArq := pathArquivosPAFECF + wArquivoCodigo+wArquivoNumSerie+
      wArquivoData+'.txt';

      AssignFile(ArqRegistros, wCaminhoArq);
      Rewrite(ArqRegistros);
      wLinha := '';

      //Identificacao do estabelecimento
      wLinha := 'U1'+ bib.AjustaStrContrario(QRU1NUM_CGC.AsString, 14, '0')
        + bib.AjustaStr(QRU1DESC_INSCRICAO.AsString,14)
          + bib.AjustaStr(QRU1DESC_INSCRICAO_MUNICIPAL.AsString, 14)
            + bib.AjustaStr(QRU1DESC_FILIAL.AsString, 50);
      Writeln(ArqRegistros, wLinha);

      //Meios de pagamento
//      wLinha := '';
//      QRMeiosPagto.First;
//      while not QRMeiosPagto.Eof do
//      begin
//        QBuscaPagamentos.Close;
//        QBuscaPagamentos.SetVariable('DT_PAGAMENTO', QRMeiosPagtoDT_RECEBIMENTO.Value);
//        QBuscaPagamentos.SetVariable('DESC_PAGAMENTO',QRMeiosPagtoDESC_PAGAMENTO.Value);
//        QBuscaPagamentos.Open;
//        wPagamentoAlterado := false;
//        while not QBuscaPagamentos.Eof do
//        begin
//          QChecaMD5Pagamento.Close;
//          QChecaMD5Pagamento.SetVariable('COD_PAGAMENTO',
//            QBuscaPagamentosCOD_PAGAMENTO.Value);
//          QChecaMD5Pagamento.Open;
//          if not bib.ChecaMD5Query(QChecaMD5Pagamento) then
//          begin
//            wPagamentoAlterado := true;
//            break;
//          end;
//          QBuscaPagamentos.Next;
//        end;
//        if not wPagamentoAlterado then
//          wMeioPagamento := bib.AjustaStr(QRMeiosPagtoDESC_PAGAMENTO.AsString,25)
//        else
//        begin
//          wMeioPagamento := StringReplace(bib.AjustaStr(QRMeiosPagtoDESC_PAGAMENTO.AsString,25),
//            ' ','?',[rfReplaceAll]);
//        end;
//        wLinha := 'A2' + bib.AjustaStr(
//          Copy(QRMeiosPagtoDT_RECEBIMENTO.AsString,7,4)
//            +Copy(QRMeiosPagtoDT_RECEBIMENTO.AsString,4,2)
//              +Copy(QRMeiosPagtoDT_RECEBIMENTO.AsString,1,2),8)
//                + wMeioPagamento
//                  + bib.AjustaStr(QRMeiosPagtoCOD_SERIE_MODELO.AsString,1)
//                    + bib.AjustaStrContrario(IntToStr(Trunc(QRMeiosPagtoVAL_TOTAL.value * 1000)),12,'0');
//        Writeln(ArqRegistros, wLinha);
//        QRMeiosPagto.Next;
//      end;

      //Relação de mercadorias
      wLinha := '';
      QRTabProd.First;
      while not QRTabProd.Eof do
      begin
        QChecaMD5Produto.Close;
        QChecaMD5Produto.SetVariable('COD_PRODUTO',QRTabProdCOD_PRODUTO.Value);
        QChecaMD5Produto.Open;
        QChecaMD5Tributacao.Close;
        QChecaMD5Tributacao.SetVariable('COD_TRIBUTACAO',
          QRTabProdCOD_TRIBUTACAO.Value);
        QChecaMD5Tributacao.Open;
        if (bib.ChecaMD5Query(QChecaMD5Produto)) and
          (bib.ChecaMD5Query(QChecaMD5Tributacao)) then
          wUnidade := bib.AjustaStr(QRTabProdDESC_UNIDADE.AsString,6)
        else
        begin
          wUnidade := bib.AjustaStr(QRTabProdDESC_UNIDADE.AsString,6,'?');
        end;
        wLinha := 'P2'+ bib.AjustaStrContrario(QRTabProdNUM_CGC.AsString, 14, '0')
          + bib.AjustaStr(QRTabProdDESC_COD_BARRA.AsString,14)
            + bib.AjustaStr(QRTabProdDESC_PRODUTO.AsString,50)
              + wUnidade
                + bib.AjustaStr(QRTabProdIND_ARREDONDAMENTO_TRUNCAMENTO.AsString,1)
                  + bib.AjustaStr(QRTabProdIND_PROD_PROPRIA_TERCEIRO.AsString,1)
                    + bib.AjustaStr(QRTabProdCOD_TRIB_IMP_FISCAL.AsString,1)
                     + bib.AjustaStrContrario(IntToStr(Trunc(QRTabProdALIQUOTA.value * 1000)),4,'0')
                      + bib.AjustaStrContrario(IntToStr(Trunc(QRTabProdVAL_VAREJO.value * 100)),12,'0');
        Writeln(ArqRegistros,wLinha);
        QRTabProd.Next;
      end;

//      wLinha := '';
     // wHashMD5 := bib.GetHashStringMD5(QRIdentificEmpresaE1COD_FILIAL.Text +
//        QRIdentificEmpresaE1DT_ESTOQUE.Text + QRIdentificEmpresaE1HORA_ESTOQUE.Text
//            +QRIdentificEmpresaE1NUM_FABRICACAO_ECF.Text+QRIdentificEmpresaE1DESC_TIPO_ECF.Text
//              +QRIdentificEmpresaE1DESC_MARCA_ECF.Text+QRIdentificEmpresaE1DESC_MODELO_ECF.Text
//                +QRIdentificEmpresaE1IND_MF_ADICIONAL.Text);

//      if wHashMD5 = QRIdentificEmpresaE1DESC_HASH_MD5.Text then
//        wModeloECF := bib.AjustaStr(QRIdentificEmpresaE1DESC_MODELO_ECF.Value,20)
//      else
//        wModeloECF := '????????????????????';
//      wLinha := 'E1' + bib.AjustaStrContrario(QRIdentificEmpresaE1NUM_CGC.AsString, 14, '0')
//        + bib.AjustaStr(QRIdentificEmpresaE1DESC_INSCRICAO.AsString, 14)
//          + bib.AjustaStr(QRIdentificEmpresaE1DESC_INSCRICAO_MUNICIPAL.AsString, 14)
//            + bib.AjustaStr(QRIdentificEmpresaE1DESC_FILIAL.AsString, 50)
//              + bib.AjustaStr(QRIdentificEmpresaE1NUM_FABRICACAO_ECF.AsString, 20)
//                + bib.AjustaStr(QRIdentificEmpresaE1IND_MF_ADICIONAL.AsString, 1)
//                  + bib.AjustaStr(QRIdentificEmpresaE1DESC_TIPO_ECF.AsString, 7)
//                    + bib.AjustaStr(QRIdentificEmpresaE1DESC_MARCA_ECF.AsString, 20)
//                      + wModeloECF
//                        + '20' + Copy(QRIdentificEmpresaE1DT_ESTOQUE.AsString,5,2)+
//                          Copy(QRIdentificEmpresaE1DT_ESTOQUE.AsString,3,2)+
//                          Copy(QRIdentificEmpresaE1DT_ESTOQUE.AsString,1,2)
//
//                          + QRIdentificEmpresaE1HORA_ESTOQUE.AsString;
//
//      Writeln(ArqRegistros, wLinha);

// ESTOQUE NÃO PRECISA SER IMPLEMENTADO CONFORME ART. 5 ITEM V. (Pág. 2)
      //Estoque

      //wLinha := '';
//      QREstoqueE2.First;
//      while not QREstoqueE2.Eof do
//      begin
//        QChecaMD5Produto.Close;
//        QChecaMD5Produto.SetVariable('COD_PRODUTO',QREstoqueE2COD_PRODUTO.Value);
//        QChecaMD5Produto.Open;
//
//        QChecaMD5Tributacao.Close;
//        QChecaMD5Tributacao.SetVariable('COD_TRIBUTACAO',
//          QREstoqueE2COD_TRIBUTACAO.Value);
//        QChecaMD5Tributacao.Open;
//
//        QChecaMD5EstoqueDiarioCab.Close;
//        QChecaMD5EstoqueDiarioCab.SetVariable('COD_ESTOQUE_DIARIO_CAB',
//          QREstoqueE2COD_ESTOQUE_DIARIO_CAB.Value);
//        QChecaMD5EstoqueDiarioCab.Open;
//
//        QChecaMD5EstoqueDiarioItem.Close;
//        QChecaMD5EstoqueDiarioItem.SetVariable('COD_ESTOQUE_DIARIO_ITEM',
//          QREstoqueE2COD_ESTOQUE_DIARIO_ITEM.Value);
//        QChecaMD5EstoqueDiarioItem.Open;
//
//        QChecaMD5Filial.Close;
//        QChecaMD5Filial.SetVariable('COD_FILIAL',QREstoqueE2COD_FILIAL.Value);
//        QChecaMD5Filial.Open;
//
//
//        if (bib.ChecaMD5Query(QChecaMD5Produto) and
//          bib.ChecaMD5Query(QChecaMD5Tributacao) and
//          bib.ChecaMD5Query(QChecaMD5EstoqueDiarioCab) and
//          bib.ChecaMD5Query(QChecaMD5EstoqueDiarioItem) and
//          bib.ChecaMD5Query(QChecaMD5Filial))then
//          wUnidade := bib.AjustaStr(QREstoqueE2DESC_UNIDADE.AsString, 6)
//        else
//          wUnidade := '??????';
//
//        wLinha := 'E2' + bib.AjustaStrContrario(QREstoqueE2NUM_CGC.AsString, 14, '0')
//          + bib.AjustaStr(QREstoqueE2COD_PRODUTO.AsString, 14)
//            + bib.AjustaStr(QREstoqueE2DESC_PRODUTO.AsString, 50)
//              + wUnidade
//                + QREstoqueE2MENSURACAO.AsString
//                  + bib.AjustaStrContrario(IntToStr(Trunc(QREstoqueE2QT_QUANTIDADE.value * 1000)), 9, '0');
//        Writeln(ArqRegistros, wLinha);
//        QREstoqueE2.Next;
//      end;

      //wLinha := 'E9' + bib.AjustaStrContrario(QRIdentificEmpresaE1NUM_CGC.AsString, 14, '0')
//        + bib.AjustaStr(QRIdentificEmpresaE1DESC_INSCRICAO.AsString, 14)
//          + bib.AjustaStrContrario(IntToStr(QREstoqueE2.RecordCount), 6, '0');
//      Writeln(ArqRegistros, wLinha);

      wLinha := '';
      //while not QRE3.Eof do
//      begin
//        QChecaMD5ECF.Close;
//        QChecaMD5ECF.SetVariable('NUM_SERIE',QRE3NUM_SERIE.Value);
//        QChecaMD5ECF.Open;
//        QChecaMD5EstoqueDiarioCab.Close;
//        QChecaMD5EstoqueDiarioCab.SetVariable('COD_ESTOQUE_DIARIO_CAB',
//          QRE3COD_ESTOQUE_DIARIO_CAB.Value);
//        QChecaMD5EstoqueDiarioCab.Open;
//        if (bib.ChecaMD5Query(QChecaMD5ECF)) and
//          (bib.ChecaMD5Query(QChecaMD5EstoqueDiarioCab)) then
//          wModelo := bib.AjustaStr(QRE3DESC_MODELO.AsString,20)
//        else
//        begin
//          wModelo := StringReplace(bib.AjustaStr(QRE3DESC_MODELO.AsString,20),' ',
//            '?',[rfReplaceAll]);
//        end;
//        wLinha := 'E3'+bib.AjustaStr(QRE3NUM_SERIE.AsString,20)
//          + bib.AjustaStr(QRE3IND_MF_ADICIONAL.AsString,1)
//            + bib.AjustaStr(QRE3DESC_TIPO.AsString,7)
//              + bib.AjustaStr(QRE3DESC_MARCA.AsString,20)
//                + wModelo
//                  + bib.AjustaStr(QRE3DT_ESTOQUE.AsString,8)
//                    + bib.AjustaStr(QRE3HORA_ESTOQUE.AsString,6);
//        Writeln(ArqRegistros, wLinha);
//        QRE3.Next;
//      end;


      //----------------------------------------------------------
      AssignFile(ArqConfig, pathArquivosPAFECF + 'ConfigEmpresa.txt');
      Reset(ArqConfig);
      Readln(ArqConfig);
      Readln(ArqConfig, wCnpj);
      Readln(ArqConfig, wIE);
      Readln(ArqConfig, wIMunicipal);
      Readln(ArqConfig, wDescEmpresa);
      Readln(ArqConfig, wDescSistema);
      Readln(ArqConfig, wVersaoSistema);
      Readln(ArqConfig, wMD5);
      CloseFile(ArqConfig);
      wCnpj := bib.LimpaNumero(bib.Decode(wCnpj));
      wIE := bib.Decode(wIE);
      wIMunicipal := bib.Decode(wIMunicipal);
      wDescEmpresa := bib.Decode(wDescEmpresa);
      wDescSistema := bib.Decode(wDescSistema);
      wVersaoSistema := bib.Decode(wVersaoSistema);
//      AssignFile(ArqConfig, pathArquivosPAFECF + 'config.txt');
//      Reset(ArqConfig);
//      while not Eof(ArqConfig) do
//      begin
//        Readln(ArqConfig, wMD5);
//        if wMD5 = '[MD5]' then
//        begin
//          Readln(ArqConfig, wMD5);
//          break;
//        end;
//      end;
//      wMD5 := bib.Decode(wMD5);
      wMD5 := MD5(pathArquivosPAFECF+'\'+'ListaArquivos.txt');
//      CloseFile(ArqConfig);
      wDataIniFormat := FormatDateTime('YYYYMMDD', StrToDate(wDataIni));
      wDataFimFormat := FormatDateTime('YYYYMMDD', StrToDate(wDataFin));
      wArquivoData := FormatDateTime('DDMMYYYY', StrToDate(wDataIni));
      //wArquivoNumSerie := Copy(pNumSerie,6,14);
      wArquivoCodigo := '030901'; //MP-2100 TH FI

      with DMImpressoraFiscal do
      begin
        QR01.Close;
        QR01.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
        QR01.SetVariable('NUM_SERIE', null);
        QR01.Open;
        while not QR01.Eof do
        begin

          QChecaMD5ECF.Close;
          QChecaMD5ECF.SetVariable('NUM_SERIE', QR01NUM_SERIE.Value);
          QChecaMD5ECF.Open;

          //Checar todas as filiais
          QFilialIteracao.Close;
          QFilialIteracao.Open;
          wFilialValida := true;
          while not QFilialIteracao.Eof do
          begin
            QChecaMD5Filial.Close;
            QChecaMD5Filial.SetVariable('COD_FILIAL',QFilialIteracaoCOD_FILIAL.Value);
            QChecaMD5Filial.Open;
            wFilialValida := bib.ChecaMD5Query(QChecaMD5Filial);
            if not wFilialValida then
              Break;
            QFilialIteracao.Next;
          end;

          if (bib.ChecaMD5Query(QChecaMD5ECF)) and
            (wFilialValida) then
            wModelo := bib.AjustaStr(QR01DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR01DESC_MODELO.Value, 20),
              ' ', '?', [rfReplaceAll]);
          end;

          wLinha := 'R01' + bib.AjustaStr(QR01NUM_SERIE.Value, 20) + bib.AjustaStr(QR01IND_MF_ADICIONAL.Value, 1)
            + bib.AjustaStr(QR01DESC_TIPO.Value, 7) + bib.AjustaStr(QR01DESC_MARCA.Value, 20)
              + wModelo + bib.AjustaStr(QR01NUM_VERSAO_SB.Value, 10)
                + bib.AjustaStr(QR01DT_INSTALACAO_SB.Value, 8) + bib.AjustaStr(QR01HORA_INSTALACAO_SB.Value, 6)
                  + bib.AjustaStrContrario(QR01NUM_SEQ_ECF.AsString, 3, '0')
                    + bib.AjustaStrContrario(bib.TiraMascara(QR01NUM_CGC.Value), 14, '0')
                      + bib.AjustaStr(bib.TiraMascara(QR01DESC_INSCRICAO.Value), 14,' ')
                        + bib.AjustaStrContrario(wCnpj, 14, '0') + bib.AjustaStr(IfThen(wIE = 'ISENTO','',wIE), 14,'0')
                          + bib.AjustaStrContrario(wIMunicipal, 14, '0') + bib.AjustaStr(wDescEmpresa,40)
                            +  bib.AjustaStr(wDescSistema, 40) + bib.AjustaStr(wVersaoSistema, 10) +  bib.AjustaStr(wMD5, 32)
                              +  bib.AjustaStr(wDataIniFormat, 8) +  bib.AjustaStr(wDataFimFormat, 8) + '0201';
          Writeln(ArqRegistros, wLinha);
          QR01.Next;
        end;

        QR02.Close;
        QR02.SetVariable('DT_INICIAL', StrToDate(wDataIni));
        QR02.SetVariable('DT_FINAL', StrToDate(wDataFin));
        QR02.SetVariable('NUM_SERIE', null);
        QR02.Open;

        while not QR02.Eof do
        begin
          QChecaMD5Reg60M.Close;
          QChecaMD5Reg60M.SetVariable('COD_REGISTRO_MESTRE',QR02COD_REGISTRO_MESTRE.Value);
          QChecaMD5Reg60M.Open;

          if bib.ChecaMD5Query(QChecaMD5Reg60M) then
            wModelo := bib.AjustaStr(QR02DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR02DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
          end;
          wLinha := 'R02' + bib.AjustaStr(QR02NUM_SERIE.Value, 20) + bib.AjustaStr(QR02IND_MF_ADICIONAL.Value, 1)
            + wModelo + bib.AjustaStrContrario(QR02NUM_USUARIO.AsString, 2, '0')
              + bib.AjustaStrContrario(QR02NUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                + bib.AjustaStrContrario(QR02NUM_COO_RZ.AsString, 6, '0') + bib.AjustaStrContrario(QR02NUM_REINICIO_OPRERACAO.AsString, 6, '0')
                  + bib.AjustaStr(QR02DT_MOVIMENTO.Value, 8) + bib.AjustaStr(QR02DT_EMISSAO.Value, 8)
                    + bib.AjustaStr(QR02HORA_EMISSAO.Value, 6) + bib.AjustaStrContrario(IntToStr(trunc(QR02VAL_VENDA_BRUTA.value * 100)), 14, '0')
                      + bib.AjustaStr(QR02IND_DESCONTO_ISSQN.Value, 1);
          Writeln(ArqRegistros, wLinha);
          QR02.Next;
        end;
        wDemaisDocAlterado := false;
        if QR02.RecordCount > 0 then
        begin
          wDias := StrToDate(wDataFin) - StrToDate(wDataIni);
          for wCont := 0 to Integer(wDias) do
          begin
            QR03.Close;
            QR03.SetVariable('DT_INICIAL', StrToDate(wDataIni)+wCont);
            QR03.SetVariable('DT_FINAL', StrToDate(wDataIni)+wCont);
            QR03.SetVariable('NUM_SERIE', null);
            QR03.Open;

            QChecaMD5Reg60A.Close;
            QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                  -1);
                QChecaMD5Reg60A.Open;
            while not QR03.Eof do
            begin
              if QR03COD_REGISTRO_ANALITICO.Value > 0 then
              begin
                QChecaMD5Reg60A.Close;
                QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                  QR03COD_REGISTRO_ANALITICO.Value);
                QChecaMD5Reg60A.Open;
                QR03DESC_HASH_MD5.Value := DMOracle.FastSelect('DESC_HASH_MD5',
                  'TB_REGISTRO_TIPO60_ANALITICO','COD_REGISTRO_ANALITICO = '+
                  QR03COD_REGISTRO_ANALITICO.Text);
              end;
              QChecaMD5Reg60M.Close;
              QChecaMD5Reg60M.SetVariable('COD_REGISTRO_MESTRE',
                QR03COD_REGISTRO_MESTRE.Value);
              QChecaMD5Reg60M.Open;
              if (bib.ChecaMD5Query(QChecaMD5Reg60A)) and
                (bib.ChecaMD5Query(QChecaMD5Reg60M)) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
              end;
              wLinha := 'R03' + bib.AjustaStr(QR03NUM_SERIE.Value, 20) + bib.AjustaStr(QR03IND_MF_ADICIONAL.Value, 1)
                + wModelo + bib.AjustaStrContrario(QR03NUM_USUARIO.AsString, 2, '0')
                  + bib.AjustaStrContrario(QR03NUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                    + bib.AjustaStr(QR03IND_SITUACAO_TRIBUTARIA.AsString, 7)
                      + bib.AjustaStrContrario(IntToStr(trunc(QR03VLR_ACUMULADO_TOTAL_PARCIAL.Value * 100)), 13, '0');
              Writeln(ArqRegistros, wLinha);

              if not wDemaisDocAlterado then
              begin
                QDemaisDocMD5Helper.Close;
                QDemaisDocMD5Helper.SetVariable('NUM_SERIE',null);
                QDemaisDocMD5Helper.SetVariable('DT_INI',QR03DT_EMISSAO.Value);
                QDemaisDocMD5Helper.SetVariable('DT_FIN',QR03DT_EMISSAO.Value);
                QDemaisDocMD5Helper.Open;
                while not QDemaisDocMD5Helper.Eof do
                begin
                  QChecaMD5DemaisDoc.Close;
                  QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
                        QDemaisDocMD5HelperCOD_DEMAIS_DOCUMENTOS_ECF.Value);
                  QChecaMD5DemaisDoc.Open;
                  wDemaisDocAlterado := not (bib.ChecaMD5Query(QChecaMD5DemaisDoc));
                  if wDemaisDocAlterado then
                    break;
                  QDemaisDocMD5Helper.Next;
                end;
              end;

              //Precisa limpar a query para o próximo laço
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    -1);
              QChecaMD5Reg60A.Open;
              QR03.Next;
            end;

            QR03Nova.Close;
            QR03Nova.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03Nova.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03Nova.SetVariable('NUM_SERIE', null);
            QR03Nova.Open;

            while not QR03Nova.Eof do
            begin
              //Pega os totalizadores
              wIn := wIn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,561,13));
              wNn := wNn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,576,13));
              wFn := wFn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,591,13));
              wISn := wISn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,606,13));
              wNSn := wNSn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,621,13));
              wFSn := wFSn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,636,13));
              wDT := wDT + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,651,13));
              wDS := wDS + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,666,13));
              wAT := wAT + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,681,13));
              wAS := wAS + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,696,13));
              wCanT := wCanT + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,711,13));
              wCanS := wCanS + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,726,13));
              wOPNFAux := StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1134,13))+
                StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1149,13))+
                StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1164,13))+
                StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1179,13))+
                StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1194,13));
                wRec := DMOracle.FastSelect('NVL(SUM(NVL(VAL_MOVIMENTO,0)),0)',
                  'TB_DEMAIS_DOCUMENTOS_ECF','NUM_SERIE_ECF = '+
                  QuotedStr(QR03NovaNUM_SERIE.Value)+' AND TO_CHAR(DT_HR_FINAL_EMISSAO,'+ quotedStr('DD/MM/YYYY') +') = '+
                  QuotedStr(QR03NovaDT_REDUCAO.Text)+' AND DESC_DENOMINACAO = ' + quotedStr('CN'));
                wOPNF := wOPNF + wOPNFAux/100 + StrToFloat(wRec);
              QR03Nova.Next;
            end;

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','F');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('F1',7)
                    + bib.AjustaStrContrario(FloatToStr(wFn), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','I');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('I1',7)
                    + bib.AjustaStrContrario(FloatToStr(wIn), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','N');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('N1',7)
                    + bib.AjustaStrContrario(FloatToStr(wNn), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','FS');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('FS1',7)
                    + bib.AjustaStrContrario(FloatToStr(wFSn), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','ISS');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('IS1',7)
                    + bib.AjustaStrContrario(FloatToStr(wISn), 13, '0');

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','NSS');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            Writeln(ArqRegistros, wLinha);
            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('NS1',7)
                    + bib.AjustaStrContrario(FloatToStr(wNSn), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar o MD5
            if wDemaisDocAlterado then
              wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll])
            else
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('OPNF',7)
                    + bib.AjustaStrContrario(bib.LimpaString(FloatToStr(wOPNF*100),','), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','DESC');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('DT',7)
                    + bib.AjustaStrContrario(FloatToStr(wDT), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','DS');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('DS',7)
                    + bib.AjustaStrContrario(FloatToStr(wDS), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','AT');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('AT',7)
                    + bib.AjustaStrContrario(FloatToStr(wAT), 13, '0');

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','AS');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            Writeln(ArqRegistros, wLinha);
            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('AS',7)
                    + bib.AjustaStrContrario(FloatToStr(wAS), 13, '0');
            Writeln(ArqRegistros, wLinha);

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','CANC');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value,20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('Can-T',7)
                    + bib.AjustaStrContrario(FloatToStr(wCanT), 13, '0');

            //para checar os MD5
            QR03MD5Helper.Close;
            QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
            QR03MD5Helper.SetVariable(':ST','CAN-S');
            QR03MD5Helper.Open;
            if QR03MD5Helper.RecordCount = 0 then
              wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
            while not QR03MD5Helper.Eof do
            begin
              QChecaMD5Reg60A.Close;
              QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                    QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
              QChecaMD5Reg60A.Open;
              if bib.ChecaMD5Query(QChecaMD5Reg60A) then
                wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
              else
              begin
                wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
                  ' ','?',[rfReplaceAll]);
                break;
              end;
              QR03MD5Helper.Next;
            end;
            //-----------------

            Writeln(ArqRegistros, wLinha);
            wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                  + bib.AjustaStr('Can-S',7)
                    + bib.AjustaStrContrario(FloatToStr(wCanS), 13, '0');
            Writeln(ArqRegistros, wLinha);
          end;
        end;

        QR04.Close;
        QR04.SetVariable('DT_INICIAL', StrToDate(wDataIni));
        QR04.SetVariable('DT_FINAL', StrToDate(wDataFin));
        QR04.SetVariable('NUM_SERIE', null);
        QR04.Open;

        wItemValido := true;
        while not QR04.Eof do
        begin
          QChecaMD5NotaCab.Close;
          QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QR04COD_NOTA_CAB.Value);
          QChecaMD5NotaCab.Open;
          QNotaItemIteracao.Close;
          QNotaItemIteracao.SetVariable('COD_NOTA_CAB',QR04COD_NOTA_CAB.Value);
          QNotaItemIteracao.Open;
          while not QNotaItemIteracao.Eof do
          begin
            QChecaMD5NotaItem.Close;
            QChecaMD5NotaItem.
              SetVariable('COD_NOTA_ITEM',QNotaItemIteracaoCOD_NOTA_ITEM.Value);
            QChecaMD5NotaItem.Open;
            QChecaMD5Produto.Close;
            QChecaMD5Produto.
              SetVariable('COD_PRODUTO',QNotaItemIteracaoCOD_PRODUTO.Value);
            QChecaMD5Produto.Open;
            QChecaMD5Tributacao.Close;
            QChecaMD5Tributacao.
              SetVariable('COD_TRIBUTACAO',QNotaItemIteracaoCOD_TRIBUTACAO.Value);
            QChecaMD5Tributacao.Open;
            wItemValido := (bib.ChecaMD5Query(QChecaMD5NotaItem)) and
              (bib.ChecaMD5Query(QChecaMD5Produto)) and
              (bib.ChecaMD5Query(QChecaMD5Tributacao));
            if not wItemValido then
              Break;
            QNotaItemIteracao.Next;
          end;
          if (bib.ChecaMD5Query(QChecaMD5NotaCab)) and (wItemValido) then
            wModelo := bib.AjustaStr(QR04DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR04DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
          end;

          wLinha := 'R04' + bib.AjustaStr(QR04NUM_SERIE.Value, 20) + bib.AjustaStr(QR04IND_MF_ADICIONAL.Value, 1)
            + wModelo + bib.AjustaStrContrario(QR04NUM_USUARIO.AsString, 2, '0')
              + bib.AjustaStrContrario(QR04NUM_NOTA.AsString, 6, '0')
                + bib.AjustaStrContrario(QR04NUM_COO.AsString, 6, '0')
                  + bib.AjustaStr(QR04DT_INICIO.Text, 8)
                    //+ bib.ift(QR04IND_CUPOM_TOTALIZADO.Value = 'S',
                        + IfThen(QR04SUBTOTAL.Value=-1,bib.AjustaStrContrario('',14,'0'),
                            bib.AjustaStrContrario(IntToStr(trunc(QR04SUBTOTAL.Value * 100)), 14, '0'))//,
                    //    '              ')
                      + bib.AjustaStrContrario(IntToStr(trunc(QR04DESCONTO_SUBTOTAL.Value * 100)), 13, '0')
                        + bib.AjustaStr(QR04TP_DESCONTO.Value, 1)
                          + bib.AjustaStrContrario(IntToStr(trunc(QR04ACRESCIMO_SUBTOTAL.Value * 100)), 13, '0')
                            + bib.AjustaStr(QR04TP_ACRESCIMO.Value,1)
                              //+ bib.ift(QR04IND_CUPOM_TOTALIZADO.Value = 'S',
                                  + IfThen(QR04TOTAL_LIQ.Value=-1,bib.AjustaStrContrario('',14,'0'),
                                    bib.AjustaStrContrario(IntToStr(trunc(QR04TOTAL_LIQ.Value * 100)), 14, '0'))//,
                              //   '              ')
                                + bib.AjustaStr(QR04IND_CANCELADO.Value, 1)
                                  + bib.AjustaStrContrario(IntToStr(trunc(QR04CANCELAMENTO_ACRESCIMO.Value * 100)), 13, '0')
                                    + bib.AjustaStr(QR04ORDEM_DESCONTO_ACRESCIMO.Value, 1)
                                      + bib.AjustaStr(QR04NOME.Value, 40)
                                        + bib.AjustaStr(QR04NUM_CGC_CPF.Value, 14);
          Writeln(ArqRegistros, wLinha);
          QR04.Next;
        end;
        QR05.Close;
        QR05.SetVariable('DT_INICIAL', StrToDate(wDataIni));
        QR05.SetVariable('DT_FINAL', StrToDate(wDataFin));
        QR05.SetVariable('NUM_SERIE', null);
        QR05.Open;
        while not QR05.Eof do
        begin
          QChecaMD5NotaItem.Close;
          QChecaMD5NotaItem.SetVariable('COD_NOTA_ITEM',QR05COD_NOTA_ITEM.Value);
          QChecaMD5NotaItem.Open;

          QChecaMD5NotaCab.Close;
          QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QR05COD_NOTA_CAB.Value);
          QChecaMD5NotaCab.Open;

          QChecaMD5Produto.Close;
          QChecaMD5Produto.SetVariable('COD_PRODUTO',QR05COD_PRODUTO.Value);
          QChecaMD5Produto.Open;

          QChecaMD5Tributacao.Close;
          QChecaMD5Tributacao.SetVariable('COD_TRIBUTACAO',QR05COD_TRIBUTACAO.Value);
          QChecaMD5Tributacao.Open;

          if (Bib.ChecaMD5Query(QChecaMD5NotaItem)) and
            (bib.ChecaMD5Query(QChecaMD5NotaCab)) and
            (bib.ChecaMD5Query(QChecaMD5Produto)) and
            (bib.ChecaMD5Query(QChecaMD5Tributacao)) then
            wModelo := bib.AjustaStr(QR05DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR05DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
          end;
          wLinha := 'R05' + bib.AjustaStr(QR05NUM_SERIE.Value, 20) + bib.AjustaStr(QR05IND_MF_ADICIONAL.Value, 1)
            + wModelo + bib.AjustaStrContrario(QR05NUM_USUARIO.AsString, 2, '0')
              + bib.AjustaStrContrario(QR05NUM_COO.AsString, 6, '0')
                + bib.AjustaStrContrario(QR05NUM_NOTA.AsString, 6, '0')
                  + bib.AjustaStrContrario(QR05NUM_ITEM_CF.AsString, 3, '0')
                    + bib.AjustaStrContrario(QR05DESC_COD_BARRA.AsString, 14, '0')
                      + bib.AjustaStr(QR05DESC_PRODUTO.Value, 100)
                        + bib.AjustaStrContrario(IntToStr(trunc(QR05QT_QUANTIDADE.Value * 100)), 7, '0')
                          + bib.AjustaStr(QR05DESC_UNIDADE.Value, 3)
                            + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_UNITARIO.Value * 100)), 8, '0')
                              + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_DESCONTO.Value * 100)), 8, '0')
                                  + bib.AjustaStrContrario(IntToStr(trunc(QR05ACRESCIMO.Value * 100)), 8, '0')
                                    + bib.AjustaStrContrario(IntToStr(trunc(QR05TOTAL_LIQ.Value * 100)), 14, '0')
                                      + bib.AjustaStr(QR05TOTALIZADOR_PARCIAL.Value, 7)
                                        + bib.AjustaStr(QR05IND_CANC_ITEM_CF.Value, 1)
                                          + bib.AjustaStrContrario(IntToStr(trunc(QR05QT_CANCELADO.Value)), 7, '0')
                                            + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_CANCELADO.Value * 100)), 13, '0')
                                              + bib.AjustaStrContrario(IntToStr(trunc(QR05CANCELAMENTO_ACRESCIMO.Value * 100)), 13, '0')
                                                + bib.AjustaStr(QR05IND_ARREDONDAMENTO_TRUNCAMENTO.Value, 1)
                                                  + bib.AjustaStr(QR05IND_PROD_PROPRIA_TERCEIRO.Value, 1)
                                                    + bib.AjustaStr(QR05IND_CASAS_DEC_QT.AsString, 1)
                                                      + bib.AjustaStr(QR05IND_CASAS_DEC_UNIT.AsString, 1);
          Writeln(ArqRegistros, wLinha);
          QR05.Next;
        end;

        QR06.Close;
        QR06.SetVariable('DT_INICIAL', StrToDate(wDataIni));
        QR06.SetVariable('DT_FINAL', StrToDate(wDataFin));
        QR06.SetVariable('NUM_SERIE', null);
        QR06.Open;
        while not QR06.Eof do
        begin

          QChecaMD5DemaisDoc.Close;
          QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
            QR06COD_DEMAIS_DOCUMENTOS_ECF.Value);
          QChecaMD5DemaisDoc.Open;

          if bib.ChecaMD5Query(QChecaMD5DemaisDoc) then
            wModelo := bib.AjustaStr(QR06DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR06DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
          end;

          wLinha := 'R06' + bib.AjustaStr(QR06NUM_SERIE.Value, 20) + bib.AjustaStr(QR06IND_MF_ADICIONAL.Value, 1)
            + wModelo + bib.AjustaStrContrario(QR06NUM_USUARIO.AsString, 2, '0')
              + bib.AjustaStrContrario(QR06NUM_COO.AsString, 6, '0')
                + bib.AjustaStrContrario(QR06NUM_GNF.AsString, 6, '0')
                  + bib.AjustaStrContrario(QR06NUM_GRG.AsString, 6, '0')
                    + bib.AjustaStrContrario(QR06NUM_CDC.AsString, 4, '0')
                      + bib.AjustaStr(QR06DESC_DENOMINACAO.Value, 2)
                        + bib.AjustaStr(QR06DT_FINAL_EMISSAO.Text, 8)
                          + bib.AjustaStr(QR06HR_FINAL_EMISSAO.Text, 6);
          Writeln(ArqRegistros, wLinha);
          QR06.Next;
        end;

        QR07.Close;
        QR07.SetVariable('DT_INICIAL', StrToDate(wDataIni));
        QR07.SetVariable('DT_FINAL', StrToDate(wDataFin));
        QR07.SetVariable('NUM_SERIE', null);
        QR07.Open;
        while not QR07.Eof do
        begin
          QChecaMD5ECF.Close;
          QChecaMD5ECF.SetVariable('NUM_SERIE',QR07NUM_SERIE.Value);
          QChecaMD5ECF.Open;

          QChecaMD5NotaCab.Close;
          QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QR07COD_NOTA_CAB.Value);
          QChecaMD5NotaCab.Open;

          QChecaMD5Pagamento.Close;
          QChecaMD5Pagamento.SetVariable('COD_PAGAMENTO',QR07COD_PAGAMENTO.Value);
          QChecaMD5Pagamento.Open;

          QDemaisDocIteracao.Close;
          QDemaisDocIteracao.SetVariable('COD_NOTA_CAB', QR07COD_NOTA_CAB.Value);
          QDemaisDocIteracao.Open;
          wItemValido := true;
          while not QDemaisDocIteracao.Eof do
          begin
            QChecaMD5DemaisDoc.Close;
            QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
              QDemaisDocIteracaoCOD_DEMAIS_DOCUMENTOS_ECF.Value);
            QChecaMD5DemaisDoc.Open;

            wItemValido := bib.ChecaMD5Query(QChecaMD5DemaisDoc);
            if not wItemValido then
              break;
            QDemaisDocIteracao.Next;
          end;

          if (bib.ChecaMD5Query(QChecaMD5ECF)) and (bib.ChecaMD5Query(QChecaMD5NotaCab))
            and (bib.ChecaMD5Query(QChecaMD5Pagamento)) and (wItemValido) then
            wModelo := bib.AjustaStr(QR07DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR07DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
          end;
          wLinha := 'R07' + bib.AjustaStr(QR07NUM_SERIE.Value, 20) + bib.AjustaStr(QR07IND_MF_ADICIONAL.Value, 1)
              + wModelo + bib.AjustaStrContrario(QR07NUM_USUARIO.AsString, 2, '0')
                + bib.AjustaStrContrario(QR07NUM_COO.AsString, 6, '0')
                  + bib.AjustaStrContrario(QR07CCF.AsString,6, '0')
                    + bib.AjustaStrContrario(QR07NUM_GNF.AsString, 6, '0')
                      + bib.AjustaStr(QR07DESC_PAGAMENTO.AsString, 15)
                        + bib.AjustaStrContrario(IntToStr(trunc(QR07VAL_PAGAMENTO.Value * 100)), 13, '0')
                          + bib.AjustaStr(QR07IND_ESTORNO.Value, 1)
                            + bib.AjustaStrContrario(IntToStr(trunc(QR07VAL_ESTORNO.Value * 100)), 13, '0');
            Writeln(ArqRegistros, wLinha);
            QR07.Next;
        end;
      end;

      //----------------------------------------------------------

      //Se houve alteração no registro deve ser mostrado no registro U1
      if VerificaInclusaoExclusao(wDataIni,wDataFin) then
      begin
        Reset(ArqRegistros);
        Readln(ArqRegistros,wLinha);
        wRS := copy(wLinha,45,50);
        //adicionar os ? e dar um replace da linha no arquivol
        wRS := StringReplace(wRS,' ','?',[rfReplaceAll]);
        wLinha := StringReplace(wLinha,copy(wLinha,45,50),wRS,[rfReplaceAll]);
        CloseFile(ArqRegistros);
        AuxArq := TStringList.Create;
        AuxArq.LoadFromFile(wCaminhoArq);
        AuxArq.Strings[0] := wLinha;
        AuxArq.SaveToFile(wCaminhoArq);
        AuxArq.Free;
      end
      else
        CloseFile(ArqRegistros);

      setlength(wAuxEAD, 256);
      iRetorno := generateEAD(wCaminhoArq, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
      FAguarde.Close;
      if iRetorno = 0 then
        MessageDlg('Erro na assinatura do arquivo!', mtError, [mbOK], 0)
      else
        MessageDlg('Arquivo gerado com sucesso em: ' + wCaminhoArq, mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TFImpressoraFiscal.GeraArquivoRZAutomatico;
var
  wCaminhoArq, wLinha, wAuxEAD, wParametroAdicional, wDataFormatada: string;
  ArqRegistros,ArqConfig: TextFile;
  wHashMD5,wHashMD5Produto,wHashMD5Quantidade: String;
  wModeloECF,wUnidade,wDataIni,wDataFin: String;
  wCnpj,wIE,wIMunicipal,wDescEmpresa,wDescSistema,wVersaoSistema,wMD5,wDataIniFormat,
      wDataFimFormat,wArquivoData,wArquivoNumSerie,wArquivoCodigo, wModelo,
      wMeioPagamento,wRS,wRec: String;
  wPagamentoAlterado: Boolean;
  wDataReducao,wDataRef: TDateTime;
  AuxArq: TStringList;
  wItemValido,wDemaisDocAlterado,wFilialValida: Boolean;
  i,wDias: Variant;
  wIn,wNn,wFn,wISn,wNSn,wFSn,wDT,wDS,wAT,wAS,wCanT,wCanS,wOPNF,wOPNFAux: Double;
  wCont: Integer;
  wData,wHora: String;
begin
  with DMImpressoraFiscal do
  begin

    if not getDataHoraImpressora(wData,wHora) then
      Exit;

    wDataReducao := StrToDate(
    DMOracle.FastSelect('DT_EMISSAO','TB_REGISTRO_TIPO60_MESTRE',
      'TO_CHAR(DT_HORA_EMISSAO_RZ,'+QuotedStr('DD/MM/YYYY')+') = '+
      QuotedStr(wData)+' ORDER BY DT_EMISSAO DESC'));

    //Referente ao arquivo
    wDataIniFormat := FormatDateTime('YYYYMMDD', wDataReducao);
    wDataFimFormat := FormatDateTime('YYYYMMDD', wDataReducao);
    wArquivoData := FormatDateTime('DDMMYYYY', wDataReducao);
    wArquivoNumSerie := Copy(DMOracle.FastSelect('NUM_SERIE','TB_ECF','ROWNUM = 1 ORDER BY NUM_SEQ_ECF'),7,14);
    wArquivoCodigo := '030901'; //MP-2100 TH FI
    wCaminhoArq := pathArquivosPAFECF + wArquivoCodigo+wArquivoNumSerie+
    wArquivoData+'.txt';
    wDataIni := DateToStr(wDataReducao);
    wDataFin := DateToStr(wDataReducao);

    AssignFile(ArqRegistros, wCaminhoArq);
    Rewrite(ArqRegistros);
    wLinha := '';


    //----------------------------------------------------------
    AssignFile(ArqConfig, pathArquivosPAFECF + 'ConfigEmpresa.txt');
    Reset(ArqConfig);
    Readln(ArqConfig);
    Readln(ArqConfig, wCnpj);
    Readln(ArqConfig, wIE);
    Readln(ArqConfig, wIMunicipal);
    Readln(ArqConfig, wDescEmpresa);
    Readln(ArqConfig, wDescSistema);
    Readln(ArqConfig, wVersaoSistema);
    Readln(ArqConfig, wMD5);
    CloseFile(ArqConfig);
    wCnpj := bib.LimpaNumero(bib.Decode(wCnpj));
    wIE := bib.Decode(wIE);
    wIMunicipal := bib.Decode(wIMunicipal);
    wDescEmpresa := bib.Decode(wDescEmpresa);
    wDescSistema := bib.Decode(wDescSistema);
    wVersaoSistema := bib.Decode(wVersaoSistema);
    AssignFile(ArqConfig, pathArquivosPAFECF + 'config.txt');
    Reset(ArqConfig);
    while not Eof(ArqConfig) do
    begin
      Readln(ArqConfig, wMD5);
      if wMD5 = '[MD5]' then
      begin
        Readln(ArqConfig, wMD5);
        break;
      end;
    end;
    wMD5 := bib.Decode(wMD5);
    CloseFile(ArqConfig);
    wDataIniFormat := FormatDateTime('YYYYMMDD', StrToDate(wDataIni));
    wDataFimFormat := FormatDateTime('YYYYMMDD', StrToDate(wDataFin));
    wArquivoData := FormatDateTime('DDMMYYYY', StrToDate(wDataIni));
    //wArquivoNumSerie := Copy(pNumSerie,6,14);
    wArquivoCodigo := '030901'; //MP-2100 TH FI

    QR01.Close;
    QR01.SetVariable('FILIAL', DMUsuario.CodFilialUsuario);
    QR01.SetVariable('NUM_SERIE', null);
    QR01.Open;
    while not QR01.Eof do
    begin

      QChecaMD5ECF.Close;
      QChecaMD5ECF.SetVariable('NUM_SERIE', QR01NUM_SERIE.Value);
      QChecaMD5ECF.Open;

      //Checar todas as filiais
      QFilialIteracao.Close;
      QFilialIteracao.Open;
      wFilialValida := true;
      while not QFilialIteracao.Eof do
      begin
        QChecaMD5Filial.Close;
        QChecaMD5Filial.SetVariable('COD_FILIAL',QFilialIteracaoCOD_FILIAL.Value);
        QChecaMD5Filial.Open;
        wFilialValida := bib.ChecaMD5Query(QChecaMD5Filial);
        if not wFilialValida then
          Break;
        QFilialIteracao.Next;
      end;

      if (bib.ChecaMD5Query(QChecaMD5ECF)) and
        (wFilialValida) then
        wModelo := bib.AjustaStr(QR01DESC_MODELO.Value, 20)
      else
      begin
        wModelo := StringReplace(bib.AjustaStr(QR01DESC_MODELO.Value, 20),
          ' ', '?', [rfReplaceAll]);
      end;

      wLinha := 'R01' + bib.AjustaStr(QR01NUM_SERIE.Value, 20) + bib.AjustaStr(QR01IND_MF_ADICIONAL.Value, 1)
        + bib.AjustaStr(QR01DESC_TIPO.Value, 7) + bib.AjustaStr(QR01DESC_MARCA.Value, 20)
          + wModelo + bib.AjustaStr(QR01NUM_VERSAO_SB.Value, 10)
            + bib.AjustaStr(QR01DT_INSTALACAO_SB.Value, 8) + bib.AjustaStr(QR01HORA_INSTALACAO_SB.Value, 6)
              + bib.AjustaStrContrario(QR01NUM_SEQ_ECF.AsString, 3, '0')
                + bib.AjustaStrContrario(bib.TiraMascara(QR01NUM_CGC.Value), 14, '0')
                  + bib.AjustaStr(bib.TiraMascara(QR01DESC_INSCRICAO.Value), 14,' ')
                    + bib.AjustaStrContrario(wCnpj, 14, '0') + bib.AjustaStr(IfThen(wIE = 'ISENTO','',wIE), 14,'0')
                      + bib.AjustaStrContrario(wIMunicipal, 14, '0') + bib.AjustaStr(wDescEmpresa,40)
                        +  bib.AjustaStr(wDescSistema, 40) + bib.AjustaStr(wVersaoSistema, 10) +  bib.AjustaStr(wMD5, 32)
                          +  bib.AjustaStr(wDataIniFormat, 8) +  bib.AjustaStr(wDataFimFormat, 8) + '0201';
      Writeln(ArqRegistros, wLinha);
      QR01.Next;
    end;

    QR02.Close;
    QR02.SetVariable('DT_INICIAL', StrToDate(wDataIni));
    QR02.SetVariable('DT_FINAL', StrToDate(wDataFin));
    QR02.SetVariable('NUM_SERIE', null);
    QR02.Open;

    while not QR02.Eof do
    begin
      QChecaMD5Reg60M.Close;
      QChecaMD5Reg60M.SetVariable('COD_REGISTRO_MESTRE',QR02COD_REGISTRO_MESTRE.Value);
      QChecaMD5Reg60M.Open;

      if bib.ChecaMD5Query(QChecaMD5Reg60M) then
        wModelo := bib.AjustaStr(QR02DESC_MODELO.Value, 20)
      else
      begin
        wModelo := StringReplace(bib.AjustaStr(QR02DESC_MODELO.Value, 20),
          ' ','?',[rfReplaceAll]);
      end;
      wLinha := 'R02' + bib.AjustaStr(QR02NUM_SERIE.Value, 20) + bib.AjustaStr(QR02IND_MF_ADICIONAL.Value, 1)
        + wModelo + bib.AjustaStrContrario(QR02NUM_USUARIO.AsString, 2, '0')
          + bib.AjustaStrContrario(QR02NUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
            + bib.AjustaStrContrario(QR02NUM_COO_RZ.AsString, 6, '0') + bib.AjustaStrContrario(QR02NUM_REINICIO_OPRERACAO.AsString, 6, '0')
              + bib.AjustaStr(QR02DT_MOVIMENTO.Value, 8) + bib.AjustaStr(QR02DT_EMISSAO.Value, 8)
                + bib.AjustaStr(QR02HORA_EMISSAO.Value, 6) + bib.AjustaStrContrario(IntToStr(trunc(QR02VAL_VENDA_BRUTA.value * 100)), 14, '0')
                  + bib.AjustaStr(QR02IND_DESCONTO_ISSQN.Value, 1);
      Writeln(ArqRegistros, wLinha);
      QR02.Next;
    end;
    wDemaisDocAlterado := false;
    if QR02.RecordCount > 0 then
    begin
      wDias := StrToDate(wDataFin) - StrToDate(wDataIni);
      for wCont := 0 to Integer(wDias) do
      begin
        QR03.Close;
        QR03.SetVariable('DT_INICIAL', StrToDate(wDataIni)+wCont);
        QR03.SetVariable('DT_FINAL', StrToDate(wDataIni)+wCont);
        QR03.SetVariable('NUM_SERIE', null);
        QR03.Open;

        QChecaMD5Reg60A.Close;
        QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
              -1);
            QChecaMD5Reg60A.Open;
        while not QR03.Eof do
        begin
          if QR03COD_REGISTRO_ANALITICO.Value > 0 then
          begin
            QChecaMD5Reg60A.Close;
            QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
              QR03COD_REGISTRO_ANALITICO.Value);
            QChecaMD5Reg60A.Open;
            QR03DESC_HASH_MD5.Value := DMOracle.FastSelect('DESC_HASH_MD5',
              'TB_REGISTRO_TIPO60_ANALITICO','COD_REGISTRO_ANALITICO = '+
              QR03COD_REGISTRO_ANALITICO.Text);
          end;
          QChecaMD5Reg60M.Close;
          QChecaMD5Reg60M.SetVariable('COD_REGISTRO_MESTRE',
            QR03COD_REGISTRO_MESTRE.Value);
          QChecaMD5Reg60M.Open;
          if (bib.ChecaMD5Query(QChecaMD5Reg60A)) and
            (bib.ChecaMD5Query(QChecaMD5Reg60M)) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
          end;
          wLinha := 'R03' + bib.AjustaStr(QR03NUM_SERIE.Value, 20) + bib.AjustaStr(QR03IND_MF_ADICIONAL.Value, 1)
            + wModelo + bib.AjustaStrContrario(QR03NUM_USUARIO.AsString, 2, '0')
              + bib.AjustaStrContrario(QR03NUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
                + bib.AjustaStr(QR03IND_SITUACAO_TRIBUTARIA.AsString, 7)
                  + bib.AjustaStrContrario(IntToStr(trunc(QR03VLR_ACUMULADO_TOTAL_PARCIAL.Value * 100)), 13, '0');
          Writeln(ArqRegistros, wLinha);

          if not wDemaisDocAlterado then
          begin
            QDemaisDocMD5Helper.Close;
            QDemaisDocMD5Helper.SetVariable('NUM_SERIE',null);
            QDemaisDocMD5Helper.SetVariable('DT_INI',QR03DT_EMISSAO.Value);
            QDemaisDocMD5Helper.SetVariable('DT_FIN',QR03DT_EMISSAO.Value);
            QDemaisDocMD5Helper.Open;
            while not QDemaisDocMD5Helper.Eof do
            begin
              QChecaMD5DemaisDoc.Close;
              QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
                    QDemaisDocMD5HelperCOD_DEMAIS_DOCUMENTOS_ECF.Value);
              QChecaMD5DemaisDoc.Open;
              wDemaisDocAlterado := not (bib.ChecaMD5Query(QChecaMD5DemaisDoc));
              if wDemaisDocAlterado then
                break;
              QDemaisDocMD5Helper.Next;
            end;
          end;

          //Precisa limpar a query para o próximo laço
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                -1);
          QChecaMD5Reg60A.Open;
          QR03.Next;
        end;

        QR03Nova.Close;
        QR03Nova.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03Nova.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03Nova.SetVariable('NUM_SERIE', null);
        QR03Nova.Open;

        while not QR03Nova.Eof do
        begin
          //Pega os totalizadores
          wIn := wIn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,561,13));
          wNn := wNn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,576,13));
          wFn := wFn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,591,13));
          wISn := wISn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,606,13));
          wNSn := wNSn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,621,13));
          wFSn := wFSn + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,636,13));
          wDT := wDT + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,651,13));
          wDS := wDS + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,666,13));
          wAT := wAT + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,681,13));
          wAS := wAS + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,696,13));
          wCanT := wCanT + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,711,13));
          wCanS := wCanS + StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,726,13));
          wOPNFAux := StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1134,13))+
            StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1149,13))+
            StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1164,13))+
            StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1179,13))+
            StrToFloat(Copy(QR03NovaDESC_DADOS_REDUCAO.Value,1194,13));
            wRec := DMOracle.FastSelect('NVL(SUM(NVL(VAL_MOVIMENTO,0)),0)',
              'TB_DEMAIS_DOCUMENTOS_ECF','NUM_SERIE_ECF = '+
              QuotedStr(QR03NovaNUM_SERIE.Value)+' AND TO_CHAR(DT_HR_FINAL_EMISSAO,'+ quotedStr('DD/MM/YYYY') +') = '+
              QuotedStr(QR03NovaDT_REDUCAO.Text)+' AND DESC_DENOMINACAO = ' + quotedStr('CN'));
            wOPNF := wOPNF + wOPNFAux/100 + StrToFloat(wRec);
          QR03Nova.Next;
        end;

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','F');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('F1',7)
                + bib.AjustaStrContrario(FloatToStr(wFn), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','I');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('I1',7)
                + bib.AjustaStrContrario(FloatToStr(wIn), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','N');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('N1',7)
                + bib.AjustaStrContrario(FloatToStr(wNn), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','FS');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('FS1',7)
                + bib.AjustaStrContrario(FloatToStr(wFSn), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','ISS');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('IS1',7)
                + bib.AjustaStrContrario(FloatToStr(wISn), 13, '0');

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','NSS');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        Writeln(ArqRegistros, wLinha);
        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('NS1',7)
                + bib.AjustaStrContrario(FloatToStr(wNSn), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar o MD5
        if wDemaisDocAlterado then
          wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll])
        else
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('OPNF',7)
                + bib.AjustaStrContrario(bib.LimpaString(FloatToStr(wOPNF*100),','), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','DESC');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('DT',7)
                + bib.AjustaStrContrario(FloatToStr(wDT), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','DS');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('DS',7)
                + bib.AjustaStrContrario(FloatToStr(wDS), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','AT');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('AT',7)
                + bib.AjustaStrContrario(FloatToStr(wAT), 13, '0');

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','AS');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        Writeln(ArqRegistros, wLinha);
        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('AS',7)
                + bib.AjustaStrContrario(FloatToStr(wAS), 13, '0');
        Writeln(ArqRegistros, wLinha);

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','CANC');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value,20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('Can-T',7)
                + bib.AjustaStrContrario(FloatToStr(wCanT), 13, '0');

        //para checar os MD5
        QR03MD5Helper.Close;
        QR03MD5Helper.SetVariable(':DT_INI',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':DT_FIN',StrToDate(wDataIni)+wCont);
        QR03MD5Helper.SetVariable(':ST','CAN-S');
        QR03MD5Helper.Open;
        if QR03MD5Helper.RecordCount = 0 then
          wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20);
        while not QR03MD5Helper.Eof do
        begin
          QChecaMD5Reg60A.Close;
          QChecaMD5Reg60A.SetVariable('COD_REGISTRO_ANALITICO',
                QR03MD5HelperCOD_REGISTRO_ANALITICO.Value);
          QChecaMD5Reg60A.Open;
          if bib.ChecaMD5Query(QChecaMD5Reg60A) then
            wModelo := bib.AjustaStr(QR03DESC_MODELO.Value, 20)
          else
          begin
            wModelo := StringReplace(bib.AjustaStr(QR03DESC_MODELO.Value, 20),
              ' ','?',[rfReplaceAll]);
            break;
          end;
          QR03MD5Helper.Next;
        end;
        //-----------------

        Writeln(ArqRegistros, wLinha);
        wLinha := 'R03' + bib.AjustaStr(QR03NovaNUM_SERIE.Value, 20) + bib.AjustaStr(QR03NovaIND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR03NovaNUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR03NovaNUM_CONTADOR_REDUCAOZ.AsString, 6, '0')
              + bib.AjustaStr('Can-S',7)
                + bib.AjustaStrContrario(FloatToStr(wCanS), 13, '0');
        Writeln(ArqRegistros, wLinha);
      end;
    end;

    QR04.Close;
    QR04.SetVariable('DT_INICIAL', StrToDate(wDataIni));
    QR04.SetVariable('DT_FINAL', StrToDate(wDataFin));
    QR04.SetVariable('NUM_SERIE', null);
    QR04.Open;

    wItemValido := true;
    while not QR04.Eof do
    begin
      QChecaMD5NotaCab.Close;
      QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QR04COD_NOTA_CAB.Value);
      QChecaMD5NotaCab.Open;
      QNotaItemIteracao.Close;
      QNotaItemIteracao.SetVariable('COD_NOTA_CAB',QR04COD_NOTA_CAB.Value);
      QNotaItemIteracao.Open;
      while not QNotaItemIteracao.Eof do
      begin
        QChecaMD5NotaItem.Close;
        QChecaMD5NotaItem.
          SetVariable('COD_NOTA_ITEM',QNotaItemIteracaoCOD_NOTA_ITEM.Value);
        QChecaMD5NotaItem.Open;
        QChecaMD5Produto.Close;
        QChecaMD5Produto.
          SetVariable('COD_PRODUTO',QNotaItemIteracaoCOD_PRODUTO.Value);
        QChecaMD5Produto.Open;
        QChecaMD5Tributacao.Close;
        QChecaMD5Tributacao.
          SetVariable('COD_TRIBUTACAO',QNotaItemIteracaoCOD_TRIBUTACAO.Value);
        QChecaMD5Tributacao.Open;
        wItemValido := (bib.ChecaMD5Query(QChecaMD5NotaItem)) and
          (bib.ChecaMD5Query(QChecaMD5Produto)) and
          (bib.ChecaMD5Query(QChecaMD5Tributacao));
        if not wItemValido then
          Break;
        QNotaItemIteracao.Next;
      end;
      if (bib.ChecaMD5Query(QChecaMD5NotaCab)) and (wItemValido) then
        wModelo := bib.AjustaStr(QR04DESC_MODELO.Value, 20)
      else
      begin
        wModelo := StringReplace(bib.AjustaStr(QR04DESC_MODELO.Value, 20),
          ' ','?',[rfReplaceAll]);
      end;

      wLinha := 'R04' + bib.AjustaStr(QR04NUM_SERIE.Value, 20) + bib.AjustaStr(QR04IND_MF_ADICIONAL.Value, 1)
        + wModelo + bib.AjustaStrContrario(QR04NUM_USUARIO.AsString, 2, '0')
          + bib.AjustaStrContrario(QR04NUM_NOTA.AsString, 6, '0')
            + bib.AjustaStrContrario(QR04NUM_COO.AsString, 6, '0')
              + bib.AjustaStr(QR04DT_INICIO.Text, 8)
                //+ bib.ift(QR04IND_CUPOM_TOTALIZADO.Value = 'S',
                    + IfThen(QR04SUBTOTAL.Value=-1,bib.AjustaStrContrario('',14,'0'),
                        bib.AjustaStrContrario(IntToStr(trunc(QR04SUBTOTAL.Value * 100)), 14, '0'))//,
                //    '              ')
                  + bib.AjustaStrContrario(IntToStr(trunc(QR04DESCONTO_SUBTOTAL.Value * 100)), 13, '0')
                    + bib.AjustaStr(QR04TP_DESCONTO.Value, 1)
                      + bib.AjustaStrContrario(IntToStr(trunc(QR04ACRESCIMO_SUBTOTAL.Value * 100)), 13, '0')
                        + bib.AjustaStr(QR04TP_ACRESCIMO.Value,1)
                          //+ bib.ift(QR04IND_CUPOM_TOTALIZADO.Value = 'S',
                              + IfThen(QR04TOTAL_LIQ.Value=-1,bib.AjustaStrContrario('',14,'0'),
                                bib.AjustaStrContrario(IntToStr(trunc(QR04TOTAL_LIQ.Value * 100)), 14, '0'))//,
                          //   '              ')
                            + bib.AjustaStr(QR04IND_CANCELADO.Value, 1)
                              + bib.AjustaStrContrario(IntToStr(trunc(QR04CANCELAMENTO_ACRESCIMO.Value * 100)), 13, '0')
                                + bib.AjustaStr(QR04ORDEM_DESCONTO_ACRESCIMO.Value, 1)
                                  + bib.AjustaStr(QR04NOME.Value, 40)
                                    + bib.AjustaStr(QR04NUM_CGC_CPF.Value, 14);
      Writeln(ArqRegistros, wLinha);
      QR04.Next;
    end;
    QR05.Close;
    QR05.SetVariable('DT_INICIAL', StrToDate(wDataIni));
    QR05.SetVariable('DT_FINAL', StrToDate(wDataFin));
    QR05.SetVariable('NUM_SERIE', null);
    QR05.Open;
    while not QR05.Eof do
    begin
      QChecaMD5NotaItem.Close;
      QChecaMD5NotaItem.SetVariable('COD_NOTA_ITEM',QR05COD_NOTA_ITEM.Value);
      QChecaMD5NotaItem.Open;

      QChecaMD5NotaCab.Close;
      QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QR05COD_NOTA_CAB.Value);
      QChecaMD5NotaCab.Open;

      QChecaMD5Produto.Close;
      QChecaMD5Produto.SetVariable('COD_PRODUTO',QR05COD_PRODUTO.Value);
      QChecaMD5Produto.Open;

      QChecaMD5Tributacao.Close;
      QChecaMD5Tributacao.SetVariable('COD_TRIBUTACAO',QR05COD_TRIBUTACAO.Value);
      QChecaMD5Tributacao.Open;

      if (Bib.ChecaMD5Query(QChecaMD5NotaItem)) and
        (bib.ChecaMD5Query(QChecaMD5NotaCab)) and
        (bib.ChecaMD5Query(QChecaMD5Produto)) and
        (bib.ChecaMD5Query(QChecaMD5Tributacao)) then
        wModelo := bib.AjustaStr(QR05DESC_MODELO.Value, 20)
      else
      begin
        wModelo := StringReplace(bib.AjustaStr(QR05DESC_MODELO.Value, 20),
          ' ','?',[rfReplaceAll]);
      end;
      wLinha := 'R05' + bib.AjustaStr(QR05NUM_SERIE.Value, 20) + bib.AjustaStr(QR05IND_MF_ADICIONAL.Value, 1)
        + wModelo + bib.AjustaStrContrario(QR05NUM_USUARIO.AsString, 2, '0')
          + bib.AjustaStrContrario(QR05NUM_COO.AsString, 6, '0')
            + bib.AjustaStrContrario(QR05NUM_NOTA.AsString, 6, '0')
              + bib.AjustaStrContrario(QR05NUM_ITEM_CF.AsString, 3, '0')
                + bib.AjustaStrContrario(QR05DESC_COD_BARRA.AsString, 14, '0')
                  + bib.AjustaStr(QR05DESC_PRODUTO.Value, 100)
                    + bib.AjustaStrContrario(IntToStr(trunc(QR05QT_QUANTIDADE.Value * 100)), 7, '0')
                      + bib.AjustaStr(QR05DESC_UNIDADE.Value, 3)
                        + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_UNITARIO.Value * 100)), 8, '0')
                          + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_DESCONTO.Value * 100)), 8, '0')
                              + bib.AjustaStrContrario(IntToStr(trunc(QR05ACRESCIMO.Value * 100)), 8, '0')
                                + bib.AjustaStrContrario(IntToStr(trunc(QR05TOTAL_LIQ.Value * 100)), 14, '0')
                                  + bib.AjustaStr(QR05TOTALIZADOR_PARCIAL.Value, 7)
                                    + bib.AjustaStr(QR05IND_CANC_ITEM_CF.Value, 1)
                                      + bib.AjustaStrContrario(IntToStr(trunc(QR05QT_CANCELADO.Value)), 7, '0')
                                        + bib.AjustaStrContrario(IntToStr(trunc(QR05VAL_CANCELADO.Value * 100)), 13, '0')
                                          + bib.AjustaStrContrario(IntToStr(trunc(QR05CANCELAMENTO_ACRESCIMO.Value * 100)), 13, '0')
                                            + bib.AjustaStr(QR05IND_ARREDONDAMENTO_TRUNCAMENTO.Value, 1)
                                              + bib.AjustaStr(QR05IND_PROD_PROPRIA_TERCEIRO.Value, 1)
                                                + bib.AjustaStr(QR05IND_CASAS_DEC_QT.AsString, 1)
                                                  + bib.AjustaStr(QR05IND_CASAS_DEC_UNIT.AsString, 1);
      Writeln(ArqRegistros, wLinha);
      QR05.Next;
    end;

    QR06.Close;
    QR06.SetVariable('DT_INICIAL', StrToDate(wDataIni));
    QR06.SetVariable('DT_FINAL', StrToDate(wDataFin));
    QR06.SetVariable('NUM_SERIE', null);
    QR06.Open;
    while not QR06.Eof do
    begin

      QChecaMD5DemaisDoc.Close;
      QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
        QR06COD_DEMAIS_DOCUMENTOS_ECF.Value);
      QChecaMD5DemaisDoc.Open;

      if bib.ChecaMD5Query(QChecaMD5DemaisDoc) then
        wModelo := bib.AjustaStr(QR06DESC_MODELO.Value, 20)
      else
      begin
        wModelo := StringReplace(bib.AjustaStr(QR06DESC_MODELO.Value, 20),
          ' ','?',[rfReplaceAll]);
      end;

      wLinha := 'R06' + bib.AjustaStr(QR06NUM_SERIE.Value, 20) + bib.AjustaStr(QR06IND_MF_ADICIONAL.Value, 1)
        + wModelo + bib.AjustaStrContrario(QR06NUM_USUARIO.AsString, 2, '0')
          + bib.AjustaStrContrario(QR06NUM_COO.AsString, 6, '0')
            + bib.AjustaStrContrario(QR06NUM_GNF.AsString, 6, '0')
              + bib.AjustaStrContrario(QR06NUM_GRG.AsString, 6, '0')
                + bib.AjustaStrContrario(QR06NUM_CDC.AsString, 4, '0')
                  + bib.AjustaStr(QR06DESC_DENOMINACAO.Value, 2)
                    + bib.AjustaStr(QR06DT_FINAL_EMISSAO.Text, 8)
                      + bib.AjustaStr(QR06HR_FINAL_EMISSAO.Text, 6);
      Writeln(ArqRegistros, wLinha);
      QR06.Next;
    end;

    QR07.Close;
    QR07.SetVariable('DT_INICIAL', StrToDate(wDataIni));
    QR07.SetVariable('DT_FINAL', StrToDate(wDataFin));
    QR07.SetVariable('NUM_SERIE', null);
    QR07.Open;
    while not QR07.Eof do
    begin
      QChecaMD5ECF.Close;
      QChecaMD5ECF.SetVariable('NUM_SERIE',QR07NUM_SERIE.Value);
      QChecaMD5ECF.Open;

      QChecaMD5NotaCab.Close;
      QChecaMD5NotaCab.SetVariable('COD_NOTA_CAB',QR07COD_NOTA_CAB.Value);
      QChecaMD5NotaCab.Open;

      QChecaMD5Pagamento.Close;
      QChecaMD5Pagamento.SetVariable('COD_PAGAMENTO',QR07COD_PAGAMENTO.Value);
      QChecaMD5Pagamento.Open;

      QDemaisDocIteracao.Close;
      QDemaisDocIteracao.SetVariable('COD_NOTA_CAB', QR07COD_NOTA_CAB.Value);
      QDemaisDocIteracao.Open;
      wItemValido := true;
      while not QDemaisDocIteracao.Eof do
      begin
        QChecaMD5DemaisDoc.Close;
        QChecaMD5DemaisDoc.SetVariable('COD_DEMAIS_DOCUMENTOS_ECF',
          QDemaisDocIteracaoCOD_DEMAIS_DOCUMENTOS_ECF.Value);
        QChecaMD5DemaisDoc.Open;

        wItemValido := bib.ChecaMD5Query(QChecaMD5DemaisDoc);
        if not wItemValido then
          break;
        QDemaisDocIteracao.Next;
      end;

      if (bib.ChecaMD5Query(QChecaMD5ECF)) and (bib.ChecaMD5Query(QChecaMD5NotaCab))
        and (bib.ChecaMD5Query(QChecaMD5Pagamento)) and (wItemValido) then
        wModelo := bib.AjustaStr(QR07DESC_MODELO.Value, 20)
      else
      begin
        wModelo := StringReplace(bib.AjustaStr(QR07DESC_MODELO.Value, 20),
          ' ','?',[rfReplaceAll]);
      end;
      wLinha := 'R07' + bib.AjustaStr(QR07NUM_SERIE.Value, 20) + bib.AjustaStr(QR07IND_MF_ADICIONAL.Value, 1)
          + wModelo + bib.AjustaStrContrario(QR07NUM_USUARIO.AsString, 2, '0')
            + bib.AjustaStrContrario(QR07NUM_COO.AsString, 6, '0')
              + bib.AjustaStrContrario(QR07CCF.AsString,6, '0')
                + bib.AjustaStrContrario(QR07NUM_GNF.AsString, 6, '0')
                  + bib.AjustaStr(QR07DESC_PAGAMENTO.AsString, 15)
                    + bib.AjustaStrContrario(IntToStr(trunc(QR07VAL_PAGAMENTO.Value * 100)), 13, '0')
                      + bib.AjustaStr(QR07IND_ESTORNO.Value, 1)
                        + bib.AjustaStrContrario(IntToStr(trunc(QR07VAL_ESTORNO.Value * 100)), 13, '0');
        Writeln(ArqRegistros, wLinha);
        QR07.Next;
    end;
    CloseFile(ArqRegistros);
    setlength(wAuxEAD, 256);
    iRetorno := generateEAD(wCaminhoArq, CHAVE_PUBLICA, CHAVE_PRIVADA, wAuxEAD ,1);
    FAguarde.Close;
    if iRetorno = 0 then
      MessageDlg('Erro na assinatura do arquivo!', mtError, [mbOK], 0)
    else
      MessageDlg('Arquivo gerado com sucesso em: ' + wCaminhoArq, mtInformation, [mbOK], 0);
  end;
end;

function TFImpressoraFiscal.VerificaInclusaoExclusao(pDataIni,pDataFin: String): Boolean;
var wCont: String;
wDataIni, wDataFin: TDate;
i: Integer;
wDataRef: String;
begin

  Result := true;
  wDataIni := StrToDate(pDataIni);
  wDataFin := StrToDate(pDataFin);
  i:=0;

  while (wDataIni + i) <= (wDataFin) do
  begin
    with DMOracle do
    begin
      wDataRef := DateToStr(wDataIni+i);
      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_PRODUTO'));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_ECF'));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_FILIAL'));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_TRIBUTACAO'));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_DEMAIS_DOCUMENTOS_ECF')+ ' AND DT_REGISTRO = '+
        QuotedStr(wDataRef));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_PAGAMENTO')); 
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_REGISTRO_TIPO60_MESTRE')+ ' AND DT_REGISTRO = '+
        QuotedStr(wDataRef));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_REGISTRO_TIPO60_ANALITICO')+ ' AND DT_REGISTRO = '+
        QuotedStr(wDataRef));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_NOTA_CAB')+ ' AND DT_REGISTRO = '+
        QuotedStr(wDataRef));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;

      wCont := FastSelect('COUNT(*)','TB_PAF_INCLUSAO_EXCLUSAO','DESC_TABELA = '+
        QuotedStr('TB_NOTA_ITEM')+ ' AND TO_CHAR(DT_REGISTRO,' + QuotedStr('DD/MM/YYYY') + ') = '+
        QuotedStr(wDataRef));
      Result := (StrToInt(wCont) > 0);
      if Result then
        Exit;
      Inc(i);
    end;
  end;
end;

procedure TFImpressoraFiscal.ImprimeRelatorioGerencialMFD(Texto: String; Descricao: String = ''; Indice: String = '');
var
  i: Integer;
  wTextoAux: String;
begin
  if Indice <> '' then
  begin
    iRetorno := Bematech_FI_NomeiaRelatorioGerencialMFD( pchar( Indice ),
                                                    pchar( Descricao ) );
    Analisa_iRetorno;
  end;

  iRetorno := Bematech_FI_AbreRelatorioGerencialMFD(Indice);
  Analisa_iRetorno;
  //Imprime mensagem
  i:=1;
  while(i < Length(Texto)) do
  begin
    if Length(Texto) <= 600 then
    begin
      wTextoAux := Texto;
      i := Length(Texto);
    end
    else
    begin
      wTextoAux := Copy(Texto,i,576);
      if i=1 then
        i:= Length(wTextoAux)+1
      else
        i := i+Length(wTextoAux);
    end;
    //iRetorno := Bematech_FI_RelatorioGerencial(pchar(wTexto));
    iRetorno := Bematech_FI_UsaRelatorioGerencialMFD(pchar(wTextoAux));
    Analisa_iRetorno;
    Retorno_Impressora();
  end;

  //Fecha comprovante
  iRetorno := Bematech_FI_FechaRelatorioGerencial();
  Analisa_iRetorno;
  Retorno_Impressora();
end;

procedure TFImpressoraFiscal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  IF Key = Vk_Escape then Close; 
end;

procedure TFImpressoraFiscal.AdicionaPagamento(pFormaPgto: String;
  pValorPagamento: Double; pCodNota: Integer);
var wCodPagamentoEstorno,wRecNo: Integer;
begin
  with DMImpressoraFiscal do
  begin
    //Se for estorno deve marcar o pagamento que foi estornado com S
    if pFormaPgto = 'ESTORNO' then
    begin
      //Fecha e abre a query para impedir erros de concorrencia
      wRecNo := QPagamento.RecNo;
      QPagamento.Close;
      QPagamento.SetVariable('COD_NOTA_CAB',pCodNota);
      QPagamento.Open;
      QPagamento.RecNo := wRecNo;
      wCodPagamentoEstorno := QPagamentoCOD_PAGAMENTO.Value;
      QPagamento.Edit;
      if pValorPagamento < QPagamentoVAL_PAGAMENTO.Value then
        QPagamentoIND_ESTORNO.Value := 'P'
      else
        QPagamentoIND_ESTORNO.Value := 'S';
      QPagamento.Post;
    end;
    QPagamento.Append;
    QPagamentoDESC_PAGAMENTO.Value := pFormaPgto;
    QPagamentoVAL_PAGAMENTO.Value := pValorPagamento;
    QPagamentoVal_Valor.Value := pValorPagamento;
    QPagamentoCOD_NOTA_CAB.Value := pCodNota;
    QPagamento.Post;
    //Se for um estorno deve guardar o código do pagamento que foi estornado
    if pFormaPgto = 'ESTORNO' then
    begin
      //Fecha e abre a query para impedir erros de concorrencia
      wRecNo := QPagamento.RecNo;
      QPagamento.Close;
      QPagamento.SetVariable('COD_NOTA_CAB',pCodNota);
      QPagamento.Open;
      QPagamento.RecNo := wRecNo;
      QPagamento.Edit;
      QPagamentoCOD_PAGAMENTO_ESTORNADO.Value :=
        wCodPagamentoEstorno;
      QPagamento.Post;
    end;
  end;
end;

procedure TFImpressoraFiscal.CadastraAliquota;
var
  iConta : Integer;
  sAliquotas : String;
  sAliquota : String;
  sISS : String;
  sICMS : String;
  iIndice : Integer;
  iIndiceISS : Integer;
  iIndiceVerifica : Integer;
  wListaAliquota: TStringList;
  wNumSerie: String;
begin
  for iConta := 1 to 80 do sAliquotas := sAliquotas + ' ';
  iRetorno := Bematech_FI_RetornoAliquotas(sAliquotas);  //Comando que recebe as alíquotas
  Analisa_iRetorno();
  Retorno_Impressora();

  for iConta := 1 to 49 do sISS := sISS + ' ';
  iRetorno := Bematech_FI_VerificaIndiceAliquotasIss(sISS); //Comando que recebe os índices
  Analisa_iRetorno();
  Retorno_Impressora();

  iIndice:=1;
  iIndiceVerifica := 1;

  wNumSerie := NumSerie;

  DMOracle.ExecutaSql('DELETE FROM TB_ALIQUOTA_ECF');
  
  for iConta := 1 to 16 do  //Laço para salvar cada alíquota no seu determino campo
  begin
    sAliquota := copy(sAliquotas,iIndice,4); //Copiando para variável a alíquota de String
    iIndice := iIndice + 5; //Somando a quantidade de bytes para a copia da próxima alíquota

    if trim(sISS) = '' then //Verificando se há alíquotas de ISS
    begin
      if sAliquota <> '0000' then  // validando se a alíquota é zerada
      begin
        //MeICMS.Text := MeICMS.Text + FormataAliquota(sAliquota);
        try
          DMOracle.ExecutaSql('INSERT INTO TB_ALIQUOTA_ECF VALUES('+
            QuotedStr(bib.AjustaStrContrario(IntToStr(iConta),2,'0'))+','+
            QuotedStr('T')+','+
            QuotedStr(sAliquota)+','+
            QuotedStr(wNumSerie)+
            ')');
        Except
          //Não faz nada
        end;
      end;
    end
    else
    begin
      iIndiceISS := StrToInt(Copy(sISS,iIndiceVerifica,2));
      if iIndiceISS = iConta then // Verificando se o índice é o mesmo da lista de alíquotas
      begin
        if sAliquota <> '0000' then
        begin
          try
          DMOracle.ExecutaSql('INSERT INTO TB_ALIQUOTA_ECF VALUES('+
            QuotedStr(bib.AjustaStrContrario(IntToStr(iConta),2,'0'))+','+
            QuotedStr('S')+','+
            QuotedStr(sAliquota)+','+
            QuotedStr(wNumSerie)+
            ')');
          Except
            //Não faz nada
          end;
          iIndiceVerifica := iIndiceVerifica + 3;
        end;
      end
      else
      begin
        if sAliquota <> '0000' then
        begin
          try
          DMOracle.ExecutaSql('INSERT INTO TB_ALIQUOTA_ECF VALUES('+
            QuotedStr(bib.AjustaStrContrario(IntToStr(iConta),2,'0'))+','+
            QuotedStr('T')+','+
            QuotedStr(sAliquota)+','+
            QuotedStr(wNumSerie)+
            ')');
          Except
            //Não faz nada
          end;
        end;
      end;
    end;
  end;
end;

procedure TFImpressoraFiscal.RegistroTipo60D(pFilial: Integer; pMes,pAno: String);
var
  cArquivo,
  cMes,
  cAno,
  cRazaoSocial,
  cEndereco,
  cNumero,
  cComplemento,
  cBairro,
  cCidade,
  cCEP,
  cTelefone,
  cFax,
  cContato: string;
  arq: TextFile;
  linha: string;
begin
  with DMFilial, DMImpressoraFiscal do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',pFilial);
    QFilial.Open;
    QReg60D.Open;
    if QFilial.RecordCount > 0 then
    begin
      cArquivo := PathBematech+'TIPO60D.txt';
      cMes := FormatMaskText('CC',pMes);
      cAno := FormatMaskText('CCCC',pAno);
      cRazaoSocial := copy(QFilialDESC_FILIAL.Text,0,35);
      cEndereco := copy(QFilialDESC_ENDERECO.Text,0,34);
      cNumero := copy(QFilialNUM_ENDERECO.Text,0,5);
      cComplemento := copy(QFilialDESC_COMPLEMENTO_ENDERECO.Value,0,22);
      cBairro := copy(QFilialDESC_BAIRRO.Text,0,15);
      cCidade := copy(QFilialDESC_CIDADE.Text,0,30);
      cCEP := copy(bib.LimpaNumero(QFilialDESC_CEP.Value,false),0,8);
      cTelefone := copy(bib.LimpaNumero(QFilialDESC_TELEFONE.Value),0,12);
      cFax := copy(bib.LimpaNumero(QFilialDESC_FAX.Value),0,10);
      cContato := copy(QFilialDESC_NOME_CONTATO.Value,0,18);

      iRetorno := Bematech_FI_RelatorioSintegraMFD( 7, ( cArquivo ), pchar( cMes ),
        pchar( cAno ), pchar( cRazaoSocial ), pchar( cEndereco ), pchar( cNumero ),
        pchar( cComplemento ), pchar( cBairro ), pchar( cCidade ), pchar( cCEP ),
        pchar( cTelefone ), pchar( cFax ), pchar( cContato ) );

      Analisa_iRetorno();
      Retorno_Impressora();

      AssignFile (arq, cArquivo);
      Reset(arq);
      DMOracle.DBCemapa.StartTransaction;
      try
        while not Eof(arq) do
        begin
          Readln(arq,linha);
          if (copy(linha, 3, 1) = 'D') then
          begin
            QReg60D.Insert;
            QReg60DCOD_REGISTRO_DIARIO.Text := DMOracle.FastSelect('SQREGISTRO_DIARIO.NEXTVAL','DUAL');
            QReg60DDESC_SUBTIPO.Value := Trim(copy(linha,3,1));
            QReg60DDT_EMISSAO.Text := Trim(copy(linha,10,2) + '/' + copy(linha,8,2) + '/' + copy(linha,4,4));
            QReg60DNUM_SERIE.Value := Trim(copy(linha,12,20));
            QReg60DDESC_COD_BARRA.Value := Trim(copy(linha,32,14));
            QReg60DQT_QUANTIDADE.Text := Trim(copy(linha,46,10)+','+copy(linha,56,3));
            QReg60DVAL_TOTAL.Text := Trim(copy(linha,59,14) + ','+copy(linha,73,2));
            QReg60DVAL_BASE_ICMS.Text := Trim(copy(linha,75,14) + ','+copy(linha,89,2));
            QReg60DDESC_ST.Text := Trim(copy(linha,91,4));
            QReg60DVAL_ICMS.Text := Trim(copy(linha,95,11) + ','+copy(linha,106,2));
            QReg60D.Post;
          end;
        end;
        DMOracle.DBCemapa.Commit;
      Except
        MessageDlg('Não foi possível armazenar as informações no banco de dados.' + #13#10+
          'Por favor cadastre os dados manualmente pela aba ' + QuotedStr('Cadastro Manual'),
          mtError, [mbOk],0);
        DMOracle.DBCemapa.Rollback;
        QReg60D.Cancel;
      end;
      DeleteFile(cArquivo);
    end;
  end;
end;

end.

