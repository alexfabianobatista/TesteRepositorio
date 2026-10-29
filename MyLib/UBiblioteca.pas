
unit UBiblioteca;

interface

uses
  SysUtils, Mask, Controls, StdCtrls, Classes, DBCtrls, IniFiles, Variants,
  DBPanel, ComCtrls, Graphics, OraTeste, DBClient, SvcMgr, SHDocVw,
  IdHashMessageDigest, idHash, DB, Oracle, Dialogs, Forms, Printers, WinSpool,
    ActiveX,
  IdHTTP, uLkJSON, USocketPing, JPeg, Math;

type
  TConsisteInscricaoEstadual = function(const Insc, UF: string): Integer;
    stdcall;
  TControls = array of TControl;
  TStringArray = array of string;

  TVariantKeys = class
  private
  protected
  public
    keys: array of Variant;
  end;

  TVariantMap = class
  private
    FKeys: array of Variant;
    FValues: array of Variant;
  public
    constructor Create;
    function addValue(Key, Value: Variant): Integer;
    function join(): string;
    function contem(Key: Variant): Boolean;
    function getValue(Key: Variant): Variant;
    procedure setValue(Key, Value: Variant);
    procedure Clear;
    function getKeys: TVariantKeys;
    function equals(map: TVariantMap): Boolean;
    function count: integer;
  end;

  TObjectMap = class
  private
    FKeys: array of Variant;
    FValues: array of TObject;
  public
    constructor Create;
    function addValue(Key: Variant; Value: TObject): Integer;
    function getValue(Key: Variant): TObject;
    procedure Clear;
    function getKeys: TVariantKeys;
  end;

  (*
   * Classe para ser usada para quebrar mensagens para imprimir
   * nas observacoes da nota.
   *)
  TMensagem = class
  private
    FMensagem: string;
    FTamMaximo: Integer;
    FIndex: Integer;
    FCortaPalavra: Boolean;
    procedure SetMensagem(const Value: string);
  protected
  public
    constructor Create(Mensagem: string; TamMaximo: Integer);
    function First: string;
    function Next: string;
    function HasNext: boolean;
    property Mensagem: string read FMensagem write SetMensagem;
    property CortaPalavra: Boolean read FCortaPalavra write FCortaPalavra default
      True;
  end;

  (* Autor: Diego Selzlein
   * Interface usada para nao utilizar DMOracle ou DMUsuario com o fim de
   * verificar os mapeamentos das portas, apenas usa a interface que é
   * implementada por um deles.
  *)
  IPortaUsuarioListener = interface
    function VerificaMapeamento(Porta: string): Boolean;
  end;

  TPafEcfHashTabelas = class
  private
    wHashProdutos: Variant;
    wHashECF: Variant;
    wHashFilial: Variant;
    wHashTipo60M: Variant;
    wHashTipo60A: Variant;
    wHashNotaCab: Variant;
    wHashNotaItem: Variant;
    wHashTributacao: Variant;
    wHashDemaisDoc: Variant;
    wHashPagamento: Variant;
  protected
  public
    property pHashProdutos: Variant read wHashProdutos write wHashProdutos;
    property pHashECF: Variant read wHashECF write wHashECF;
    property pHashFilial: Variant read wHashFilial write wHashFilial;
    property pHashTipo60M: Variant read wHashTipo60M write wHashTipo60M;
    property pHashTipo60A: Variant read wHashTipo60A write wHashTipo60A;
    property pHashNotaCab: Variant read wHashNotaCab write wHashNotaCab;
    property pHashNotaItem: Variant read wHashNotaItem write wHashNotaItem;
    property pHashTributacao: Variant read wHashTributacao write
      wHashTributacao;
    property pHashDemaisDoc: Variant read wHashDemaisDoc write wHashDemaisDoc;
    property pHashPagamento: Variant read wHashPagamento write wHashPagamento;
    constructor Create;
    procedure Atualiza(pDataRef: TDate; pTabela: string = 'TODAS');
    function Instancia: TPafEcfHashTabelas;
  end;
  TValidacaoCEP = class
  private
    FIdHTTP1: TIdHTTP;
    Fjs: TlkJSONobject;
  public
    property IdHTTP1: TIdHTTP read FIdHTTP1 write FIdHTTP1;
    property js: TlkJSONobject read Fjs write Fjs;
  end;

  TBib = class
  private
    function BuscaControle(Cont: TControl; ParentName: string): Integer;
  protected
  public
    procedure charCaseComps(c: array of TControl; cc: TEditCharCase; ParentName:
      string);
    function componentsAsArray(c: TControl): TControls;
    function ift(Expression: Boolean; TrueCase,
      FalseCase: Variant): Variant;
    function Justifica(wTexto: string; wTamanho: Integer): string;
    function PegaTempDir: string;
    function Encode(wString: string): string;
    function Decode(wString: string): string;
    function ValidaCPF(wCPF: string): Boolean;
    function ValidaCGC(wCGC: string): Boolean;
    function ComparaNumero(wNum1, wNum2: Real; wDecimal: Byte): Boolean;
    function NumToTexto(wNum: Real; wDec, wTamanho: Byte): string;
    function NumToTextoArredondamento(Value: Extended; Decimals: Integer):
      Extended;
    function ArredondamentoTemper(Value: Extended; Decimals: Integer): Extended;
    function NomeMes(wMes: Byte): string;
    function extenso(valor: real; tipo: string): string;
    function LimpaString(wString, wRetirar: string): string;
    procedure QuebraString(wString: string; wTamanho: Integer; var wStr1, wStr2:
      string; wPreencher: string);
    function RemoveQuebraLinha(sString: string): string;
    function FormataTexto(wString: string; wTamanho: integer; fillChar: char =
      ' '): string;
    function FormataTextoEsq(wString: string; wTamanho: integer): string;
      overload;
    function FormataTextoEsq(wString: string; wTamanho: integer; fillChar:
      Char): string; overload;
    function DigitoVerificador(Numero: string): string;
    function DigitoVerificadorHSBC(Numero: string): string;
    function DigitoVerificadorHSBC1(Numero: string): string;
    function StrZero(S: string; n: Byte): string;
    function StrZeroDecimal(Num: Real; Zeros, Deci: integer): string;
    function Right(S: string; n: Byte): string;
    function ValidaIEstadual(wInscricao, wEstado: string): boolean;
    function TrocaVirgulaPorPonto(wNum: string): string;
    function DiaAno(data: TDateTime): Word;
    function DifData(dtChegada, dtSaida: TDateTime): Integer;
    function HorasEntre(dtInicio, dtFim: TDateTime): Real;
    procedure DifHora(hrChegada, minChegada, hrSaida, minSaida: Integer; var
      totHr, totMin: Integer);
    procedure HorasDecorridas(dtChegada, dtSaida: TDateTime; hrChegada,
      minChegada, hrSaida, minSaida: integer; var totHor, totMin: Integer);
    function LimpaNumero(wNumero: string; mantemVirgula: Boolean = False):
      string;
    function TiraMascara(text: string): string;
    function ValidaPis(PIS: string): boolean;
    function ProcuraStr(OQue: string; Onde: string): Integer;
    function RemoveNumEndereco(wEndereco, wNumero: string): string;
    function RemoveEspacoDuplo(Str: string): string;
    function NumEndereco(wEndereco: string): string;
    function Modulo11(Numero: string): string;
    function StrZero2(Num: Real; Zeros, Deci: Integer): string;
    function Alltrim(const Search: string): string;
    function ArrayContem(PArray: array of Variant; PValor: Variant): Boolean;
    function ComparaIntegerArray(wNum: Integer; wArray: array of Integer):
      Boolean;
    procedure PriUltData(DtaIni, DtaFin: TMaskEdit; FimMes: Boolean = false;
      DataCalculo: TDate = 0);
    function AjustaStr(str: string; tam: Integer; caractere: string = ' '):
      string;
    function AjustaStrContrario(str: string; tam: Integer; caractere: string =
      ' '): string;
    procedure PriUltDataVar(var DtaIni: TDate; var DtaFin: TDate; FimMes: Boolean
      = false; DataCalculo: TDate = 0);
    procedure inverteControles(controle1, controle2: TControl;
      posicao: Boolean = True; tamanho: Boolean = False; anchors: Boolean =
        False;
      visibilidade: Boolean = False);
    function leArquivoConf(chave: string): string;
    procedure escreveArquivoConf(chave: string; valor: string);
    function Chars(wChar: string; wCont: Integer): string;
    function diaSemanaProximo(data: TDate; diaDestino: Integer): TDate;
    function diaSemanaAnterior(data: TDate; diaDestino: Integer): TDate;
    function DataPorExtenso(data: TDate): string;
    procedure addControleCharCase(Controle: TControl; ParentName: string);
    function isInteger(Str: string): Boolean;
    function MapearPorta(Porta, Caminho: string; Usuario: string = ''; Senha:
      string = ''): Boolean;
    function CancelaMapeamentoPorta(Porta: string): Boolean;
    function SubstituiStr(Str: string; Antigo, Novo: string): string;
    function GetWindowsVersion: string;
    function DatasParaLabel(DataI, DataF: TDate): string; overload;
    function DatasParaLabel(DataI, DataF: string): string; overload;
    function PageIndexFromTabIndex(pc: TPageControl; TabIndex: Integer):
      Integer;
    function InverteString(const Str: string): string;
    function HexToTColor(sColor: string): TColor;
    function Arredondar(Valor: Extended; Dec: Integer): Extended;
    function RoundTo2(const AValue: Double; const ADigit: TRoundToRange):
      Double;
    procedure LimpaParams(DataS: TClientDataSet);
    procedure OrdenaQuery(Query: TOracleDataSet1; Field: string; Close: boolean
      = false; Open: boolean = false);
    function executaQueryString(sql: string): TOracleDataSet1;
    function executaQuery(var queryBase: TOracleDataSet1; abrir: Boolean =
      False): TOracleDataSet1;
    procedure fechaQuery(var query: TOracleDataSet1);
    function pegaValor(var query: TOracleDataSet1; campo: string): Variant;
    function eNulo(var query: TOracleDataSet1; campo: string): Boolean;
    function geraStringFiliais(filiais: TStrings; separador: string = ', '):
      string;
    procedure GravaLogEventosWindows(pNomeModulo, pMensagem, pTipo: string);
    function Colocaaspanastring(pCaracteres: string): string;
    function CalculaHorasProducao(DiaInicial, DiaFinal: TDateTime): Real;
    function GetDataCancelamentoNfe(ChaveAcesso: string): TDateTime;
    function FormataCNPJ(Numero: string): string;
    function FormataCPF(Numero: string): string;
    function FormataCNPJ_CPF(Numero: string): string;
    procedure setModelo(pQuery: TOracleDataSet1; var pLabel: TLabel);
    function verificaSerieModelo(filial: Integer; serie: string): string;
    function RemoveAcentos(Texto: string): string;
    function EnviaSMS(pCod_cadastro: integer; pMensagem: string;
      pCelularDestino: string = ''): string;
    function EnviaSMSApiWeb(pCod_cadastro: integer; pMensagem: string;
      pCelularDestino: string = ''): string;
    function analisaEnvioSMS(pResposta: string): string;
    function QuebraStringDelimitador(source: string; delimitador: char):
      TStringList; //quebra uma string quando encontra o delimitador, mantendo o delimitador no final do item da TStringList de retorno.
    function CountSubExt(str, subStr: string): Integer;
    function GetHashStringMD5(pString: string): string;
    function ChecaMD5Query(pQuery: TOracleDataSet1): Boolean;
    function GeraMD5Query(pQuery: TOracleDataSet1;
      pTabela: string; pCommit: Boolean = true; pPersiste: Boolean = true):
        string;
    function GeraMapaDeMD5(pDtReferencia: TDate): TVariantMap;
    procedure AtualizaExclusaoInclusaoMD5(pDtInicial, pDtFinal: TDate;
      pCommit: Boolean = true);
    function ComparaExclusaoInclusaoMD5(pDtInicial, pDtFinal: TDate): Boolean;
    function MessageDlgCustomizado(const Msg: string; DlgType: TMsgDlgType;
      //MessaseDlg que pode ter os captions dos botões alterados
      Buttons: TMsgDlgButtons; Captions: array of string): Integer;
    function ImprimeImpressoraGenerica(Impressora, Conteudo: string; Font: string
      = 'Arial Narrow'; Size: Integer = 9): Boolean;
      //Imprime o conteúdo da string na impressora passada por parâmetro
    function SelecionaImpressora(FormOrigem: TForm): string;
      //Retorna o nome da impressora selecionada no print dialog
    function PegaImpressoraPorNomeRede(Nome: string): string;
      //Retorna o nome da impressora selecionada no print dialog
    function PegaNomeComputador: string;
    procedure setVariableOuNull(Query: TOracleDataSet1; Variavel: string; Valor:
      Variant);
    procedure QueryToLog(pQuery: TOracleDataSet1);
      //Salva a sql da query em arquivo para verificação
    procedure Log(linha: string);
    procedure LimparBufferTeclado();
    procedure Split(const Delimiter: Char; Input: string; var Strings:
      TStringList);
    function RetiraCaracteres(_Separador: TSysCharSet; const Str: string):
      string; //Tirar caracteres ou sequencias destes de strings - Cleber 15/05/2019
    function Split2(const Separator, S: string; Limit: Integer = 0):
      TStringArray; //Faz o famoso split de uma string por um delimitador
    function OcorrenciasDeCaracter(const S: string; const C: char): integer;
    function Capitalizar(Texto: string): string;
    function TitleCase(Text2: string): string;
    procedure WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
    function ValidaCEP(cep: string; var endereco, bairro, complemento, uf,
      cidade: TObject; lbl: TLabel): Integer; overload;
    function ValidaCEP(cep: string; cidade: integer; var mensagem: string):
      Boolean; overload;
    function ValidaCEP(cep: string): Integer; overload;
    function TemConexaoInternet: Boolean;
    function Tirapontos(texto: string): string;
    procedure GetImageByUrl(URL: string; APicture: TPicture);
    function Nvl(pValue, IfNull: Variant): Variant;
    function LimpaCaracteresReinf(pTexto: string): string;
    function LimpaCaracteresInvalidos(pTexto: string): string;
    function SomenteNumero(Key: Char; Texto: string; isDecimal: Boolean =
      False): Char;
    function IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: string): string; overload;
    function IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Integer): Integer; overload;
    function IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Double): Double; overload;
    function IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Boolean): Boolean; overload;
    function IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Variant): Variant; overload;
  end;

  TImp = class
  private
    fLinhaCorrente: Integer;
    fArqImpressora: TextFile;
    fTextoLinha: string;
    fCharPorCM: Real;
    fQtdLinhaPagina: Integer;
    fStatus: string;
    fCondensado: boolean;
    FPortaUsuarioListener: IPortaUsuarioListener;
    property pArqImpressora: TextFile read fArqImpressora write fArqImpressora;
    property pQtdLinhaPagina: Integer read fQtdLinhaPagina write
      fQtdLinhaPagina;
    property pLinhaCorrente: Integer read fLinhaCorrente write fLinhaCorrente;
  public
    procedure SaltaPaginaEtiquetas;
    procedure SaltaPaginaEtiquetas2;
    procedure SaltaPaginaEtiquetasChaiana;
    procedure AbreImpressora; overload;
    procedure AbreImpressora(Porta: string); overload;
    procedure AbreImpressora_Lpt2;
    procedure AbreImpressora_Lpt3;
    procedure AbreImpressora_Com2;
    procedure FechaImpressora;
    procedure ConfiguraImpressora(wCondensado, wOitavos: string; wQtdeLinhas:
      Byte);
    procedure WriteXY(wX, wY: Real; wCampo: string);
    procedure SaltaPagina;
    procedure ConfiguraCondensado(wCondensado: string);
    procedure ConfiguraNegrito(wNegrito: string);
    property pCharPorCM: Real read fCharPorCM write fCharPorCM;
    property pStatus: string read fStatus write fStatus;
    property pTextoLinha: string read fTextoLinha write fTextoLinha;
    property PortaUsuarioListener: IPortaUsuarioListener read
      FPortaUsuarioListener write FPortaUsuarioListener;
  end;

const
  wBranco: string =
    '                                                                                                                                                                           ';

  //CONSTANTES PARA SEREM USADAS NA VERIFICAÇÃO DO SO DA MÁQUINA
  SO_WIN_95: string = 'Windows 95';
  SO_WIN_98: string = 'Windows 98';
  SO_WIN_98_SE: string = 'Windows 98 SE';
  SO_WIN_ME: string = 'Windows Millenium';
  SO_UNKNOWN: string = 'Unknown Version';
  SO_WIN_NT: string = 'Windows NT';
  SO_WIN_2000: string = 'Windows 2000';
  SO_WIN_XP: string = 'Windows XP';
  SO_UNKNOWN_PLATFORM: string = 'Unknown Platform';

  IMP_CONF_NEGRITO_ON: string = 'NEGRITO_ON';
  IMP_CONF_NEGRITO_OFF: string = 'NEGRITO_OFF';

  //CONSTANTES PARA TIRAR DADOS DA STRING - Cleber 15/05/2019
  TiraNumero = [#48..#57];
  TiraLetras = [#32..#47, #58..#255];

var
  Bib: TBib;
  Imp: TImp;
  FControlesCharCase: array of TControl;
    // Para armazenar os controles que não terão a propriedade CharCase bloqueada
  FControlesCharCaseM: TVariantMap;
  PafEcfHashTabelas: TPafEcfHashTabelas;
  ValidacaoCEP: TValidacaoCEP;

implementation

uses
  WinTypes, WinProcs, Messages, StrUtils,
  ExtCtrls, Gauges, Windows, UOracle_cl, xmldom, XMLIntf, msxmldom,
  XMLDoc, UParamSistema_cl, UUsuario_cl, DateUtils, CemapaUtils_TLB;
    //UImpressoraFiscal_cl;

procedure TBib.GravaLogEventosWindows(pNomeModulo, pMensagem, pTipo: string);
begin
  (*
   * pNomeModulo = Nome do módulo para identificação no log de eventos do windows
   * pMensagem = Mensagem de exibição do erro
   * pTipo = Tipo da mensagem {informacao, erro ou aviso}
   *)
  with TEventLogger.create(pNomeModulo) do
  begin
    try
      if pTipo = 'informacao' then
        LogMessage(pMensagem, EVENTLOG_INFORMATION_TYPE, 0, 1)
      else if pTipo = 'erro' then
        LogMessage(pMensagem, EVENTLOG_ERROR_TYPE, 0, 2)
      else if pTipo = 'aviso' then
        LogMessage(pMensagem, EVENTLOG_WARNING_TYPE, 0, 3)
      else
        MessageDlg('pTipo deve ser informacao, erro ou aviso', mtError,
          [mbOk], 0);
      //LogMessage('Audit Success Message!', EVENTLOG_AUDIT_SUCCESS, 0, 4);
      //LogMessage('Audit Failure Message!', EVENTLOG_AUDIT_FAILURE, 0, 5);
    finally
      free;
    end;
  end;
end;

function TBib.GetHashStringMD5(pString: string): string;
var
  idmd5: TIdHashMessageDigest5;
  hash: T4x4LongWordRecord;
begin
  if pString = '' then
    Result := ''
  else
  begin
    idmd5 := TIdHashMessageDigest5.Create;
    try
      result := idmd5.AsHex(idmd5.HashValue(pString));
    finally
      idmd5.Free;
    end;
  end;
end;

// if ternário

function TBib.PegaTempDir: string;
var
  DiretorioTemp: PChar;
  TempBuffer: Dword;
begin
  TempBuffer := 255;
  GetMem(DiretorioTemp, 255);
  try
    GetTempPath(tempbuffer, diretoriotemp);
    result := DiretorioTemp;
  finally
    FreeMem(diretoriotemp);
  end;
end;

function TBib.ift(Expression: Boolean; TrueCase, FalseCase: Variant): Variant;
begin
  if Expression then
    Result := TrueCase
  else
    Result := FalseCase;
end;

// *********** EXTENSO ***************************

function TBib.extenso(valor: real; tipo: string): string;
var
  Centavos, Centena, Milhar, Milhao, Texto, msg: string;
  wRetorno, wNumMilhao, wNumMilhar, wNumCentena, wNumCentavo, wAux: string;
const
  Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco',
    'Seis', 'Sete', 'Oito', 'Nove');
  Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze',
    'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
  Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta',
    'Cinquenta', 'Sessenta', 'Setenta',
    'Oitenta', 'Noventa');
  Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos',
    'Quatrocentos', 'Quinhentos', 'Seiscentos',
    'Setecentos', 'Oitocentos', 'Novecentos');

  function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: string): string;
  begin
    if Expressao then
      Result := CasoVerdadeiro
    else
      Result := CasoFalso;
  end;

  function MiniExtenso(trio: string): string;
  var
    Unidade, Dezena, Centena: string;
  begin
    Unidade := '';
    Dezena := '';
    Centena := '';
    if (trio[2] = '1') and (trio[3] <> '0') then
    begin
      Unidade := Dez[strtoint(trio[3])];
      Dezena := '';
    end
    else
    begin
      if trio[2] <> '0' then
        Dezena := Dezenas[strtoint(trio[2])];
      if trio[3] <> '0' then
        Unidade := Unidades[strtoint(trio[3])];
    end;
    if (trio[1] = '1') and (Unidade = '') and (Dezena = '') then
      Centena := 'cem'
    else if trio[1] <> '0' then
      Centena := Centenas[strtoint(trio[1])]
    else
      Centena := '';
    Result := Centena + ifs((Centena <> '') and ((Dezena <> '') or (Unidade <>
      '')), ' e ', '')
      + Dezena + ifs((Dezena <> '') and (Unidade <> ''), ' e ', '') + Unidade;
  end;

begin
  if (valor > 999999999.99) or (valor < 0) then
  begin
    msg := 'O valor está fora do intervalo permitido.';
    msg := msg +
      'O número deve ser maior ou igual a zero e menor que 999.999.999,99.';
    msg := msg + ' Se não for corrigido o número não será escrito por extenso.';
    showmessage(msg);
    Result := '';
    exit;
  end;
  if valor = 0 then
  begin
    Result := '';
    Exit;
  end;
  Texto := formatfloat('000000000.00', valor);
  wNumMilhao := Copy(Texto, 1, 3);
  wNumMilhar := Copy(Texto, 4, 3);
  wNumCentena := Copy(Texto, 7, 3);
  wNumCentavo := Copy(Texto, 11, 2);
  Milhao := MiniExtenso(wNumMilhao);
  Milhar := MiniExtenso(wNumMilhar);
  Centena := MiniExtenso(wNumCentena);
  Centavos := MiniExtenso('0' + wNumCentavo);
  wRetorno := '.';
  if StrToFloat(wNumCentavo) > 0 then
  begin
    if StrToFloat(wNumCentavo) = 1 then
      if tipo = 'METROS' then
        wRetorno := Centavos
      else
        wRetorno := Centavos + ' Centavo' + wRetorno
    else if tipo = 'METROS' then
      wRetorno := Centavos
    else
      wRetorno := Centavos + ' Centavos' + wRetorno;
  end;

  if (StrToFloat(wNumCentena) > 0) or (StrToFloat(wNumMilhar) > 0)
    or (StrToFloat(wNumMilhao) > 0) then
  begin
    if StrToFloat(wNumCentena) = 1 then
    begin
      if Tipo = 'KG' then
        wAux := Centena + ' Quilo'
      else if Tipo = 'SACA' then
        wAux := Centena + ' Saca'
      else if Tipo = 'DOLAR' then
        wAux := Centena + ' Dolar'
      else if Tipo = 'PERC' then
        wAux := Centena + ' Percento'
      else if Tipo = 'NADA' then
        wAux := Centena + ''
      else if Tipo = 'METROS' then
        if StrToFloat(wNumCentavo) > 0 then
          wAux := Centena + ' vírgula '
        else
          wAux := Centena
      else
        wAux := Centena + ' Real';
    end
    else
    begin
      if Tipo = 'KG' then
        wAux := Centena + ' Quilos'
      else if Tipo = 'SACA' then
        wAux := Centena + ' Sacas'
      else if Tipo = 'DOLAR' then
        wAux := Centena + ' Dolares'
      else if Tipo = 'PERC' then
        wAux := Centena + ' Percento'
      else if Tipo = 'NADA' then
        wAux := Centena + ''
      else if Tipo = 'METROS' then
        if StrToFloat(wNumCentavo) > 0 then
          wAux := Centena + ' vírgula '
        else
          wAux := Centena
      else
        wAux := Centena + ' Reais'
    end;
    if StrToFloat(wNumCentavo) > 0 then
      if Tipo <> 'METROS' then
        wAux := wAux + ' e ';
    if (Tipo <> 'METROS') or (StrToFloat(wNumCentavo) > 0) then
      // serve para nao colocar um ponto no meio do extenso
      wRetorno := wAux + wRetorno
    else
      wRetorno := wAux;
  end;

  if StrToFloat(wNumMilhar) > 0 then
  begin
    if (StrToFloat(wNumCentena) > 0)
      or (StrToFloat(wNumCentavo) > 0) then
      wRetorno := Milhar + ' Mil, ' + wRetorno
    else
      wRetorno := Milhar + ' Mil ' + wRetorno;
  end;

  if StrToFloat(wNumMilhao) > 0 then
  begin
    if StrToFloat(wNumMilhao) > 1 then
      wAux := ' Milhões'
    else
      wAux := ' Milhão';

    if (StrToFloat(wNumMilhar) > 0)
      or (StrToFloat(wNumCentena) > 0)
      or (StrToFloat(wNumCentavo) > 0) then
      wRetorno := Milhao + wAux + ', ' + wRetorno
    else
      wRetorno := Milhao + wAux + wRetorno;
  end;
  if Tipo = 'METROS' then
    wRetorno := wRetorno + ' metros quadrados';
  Result := wRetorno;
end;

// *********** LIMPA STRING ***************************

function TBib.LimpaString(wString, wRetirar: string): string;
var
  wCont, wCont2: Integer;
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

//function TBib.ArredondamentoTemper(Value: Extended; Decimals: Integer): Extended;
//var
//  Factor, Fraction: Extended;
//begin
//  Factor := IntPower(10, Decimals);
//  Value := StrToFloat(FloatToStr(Value * Factor));
//  Result := Int(Value);
//  Fraction := Frac(Value);
//  if Fraction >= 0.6 then
//    Result := Result + 1
//  else if Fraction <= -0.6 then
//    Result := Result - 1;
//  Result := Result / Factor;
//end;

function TBib.ArredondamentoTemper(Value: Extended; Decimals: Integer):
  Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(1, Decimals);
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction > 0.5 then
    Result := Result + 1
  else if ((Fraction <= 0.5) and (Fraction <> 0)) then
    Result := Result + 0.5;
  Result := Result / 10;
end;

// *** Quebrar uma string em duas sem cortar palavras ****

procedure TBib.QuebraString(wString: string; wTamanho: Integer; var wStr1,
  wStr2: string; wPreencher: string);
var
  wCont: Integer;
  wOk: Boolean;
begin
  if wTamanho > Length(wString) then
    wCont := Length(wString)
  else
  begin
    wOk := False;
    wCont := wTamanho;
    while (wCont > 0) and (wOk = False) do
    begin
      if wString[wCont] = ' ' then
        wOk := True
      else
        Dec(wCont);
    end;
  end;
  wStr1 := Copy(wString, 1, wCont);
  wStr2 := Copy(wString, wCont + 1, Length(wString));

  if wPreencher <> '' then
  begin
    if wStr2 = '' then
    begin
      while Length(wStr1) < wTamanho do
        wStr1 := wStr1 + wPreencher;
    end
    else
      wStr1 := Justifica(wStr1, wTamanho);
    while Length(wStr2) < wTamanho do
      wStr2 := wStr2 + wPreencher;
  end;
end;

function TBib.QuebraStringDelimitador(source: string; delimitador: char):
  TStringList;
var
  i: integer;
  wAux: string;
  resultado: TStringList;
begin
  resultado := TStringList.Create;
  wAux := '';
  for i := 0 to length(source) do
  begin
    if (source[i] <> #0) then
      wAux := wAux + source[i];
    if source[i] = delimitador then
    begin
      resultado.add(wAux);
      wAux := '';
    end;
  end;
  if source[length(source)] <> delimitador then
    resultado.add(wAux);
  result := resultado;
end;

function TBib.RemoveQuebraLinha(sString: string): string;
var
  i: Integer;
  s: string;
begin
  //  #13#10
  for i := 1 to Length(sString) do
  begin
    if (Copy(sString, i, 1) = chr(13)) or (Copy(sString, i, 1) = chr(10)) then
      s := s + ' '
    else
      s := s + Copy(sString, i, 1);
  end;
  Result := s;
end;

function TBib.Justifica(wTexto: string; wTamanho: Integer): string;
var
  wCont: Integer;
  wAux: string;
begin
  wAux := Trim(wTexto);
  while Length(wAux) < wTamanho do
  begin
    wCont := Length(wAux);
    while (wCont > 0) and (Length(wAux) < wTamanho) do
    begin
      if wAux[wCont] = ' ' then
        wAux := Copy(wAux, 1, wCont) + ' ' + Copy(wAux, wCont + 1, Length(wAux)
          - wCont + 1);
      Dec(wCont);
    end;
  end;
  Result := wAux;
end;

function TBib.ValidaCPF(wCPF: string): Boolean;
var
  d1, d4, xx, nCount, resto, digito1, digito2: Integer;
  Check: string;
begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to length(wCPF) - 2 do
  begin
    if Pos(copy(wCPF, nCount, 1), '/-. ') = 0 then
    begin
      d1 := d1 + (11 - xx) * StrToInt(Copy(wCPF, nCount, 1));
      d4 := d4 + (12 - xx) * StrToInt(Copy(wCPF, nCount, 1));
      xx := xx + 1;
    end;
  end;
  resto := (d1 mod 11);
  if resto < 2 then
    digito1 := 0
  else
    digito1 := 11 - resto;

  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
    digito2 := 0
  else
    digito2 := 11 - resto;

  Check := IntToStr(digito1) + IntToStr(digito2);
  result := not (Check <> Copy(wCPF, Length(wCPF) - 1, 2));
end;

function TBib.ValidaCGC(wCGC: string): Boolean;
var
  d1, d4, xx, nCount, fator, resto, digito1, digito2: integer;
  Check: string;
begin
  d1 := 0;
  d4 := 0;
  xx := 1;
  for nCount := 1 to Length(wCGC) - 2 do
  begin
    if Pos(copy(wCGC, nCount, 1), '/-. ') = 0 then
    begin
      if xx < 5 then
        fator := 6 - xx
      else
        fator := 14 - xx;

      d1 := d1 + StrToInt(copy(wCGC, nCount, 1)) * fator;
      if xx < 6 then
        fator := 7 - xx
      else
        fator := 15 - xx;

      d4 := d4 + StrToInt(copy(wCGC, nCount, 1)) * fator;
      xx := xx + 1;
    end;
  end;

  resto := (d1 mod 11);

  if resto < 2 then
    digito1 := 0
  else
    digito1 := 11 - resto;

  d4 := d4 + 2 * digito1;
  resto := (d4 mod 11);
  if resto < 2 then
    digito2 := 0
  else
    digito2 := 11 - resto;
  Check := IntToStr(Digito1) + IntToStr(digito2);
  result := not (Check <> copy(wCGC, Length(wCGC) - 1, 2));
end;

function TBib.ComparaNumero(wNum1, wNum2: Real; wDecimal: Byte): Boolean;
var
  wQtde: Integer;
  wAux1, wAux2: Real;
const
  wZeros: string = '00000000000';
begin
  wQtde := StrToInt('1' + Copy(wZeros, 1, wDecimal));
  wAux1 := Round(wNum1 * wQtde);
  wAux2 := Round(wNum2 * wQtde);
  Result := wAux1 = wAux2;
  // ** Retorna True se os dois numeros são iguais
end;

function TBib.Encode(wString: string): string;
var
  wAcrescimo, wCont: Integer;
  wRet, wRet2, wAuxS: string;
begin
  // Criptografia ;;

  wRet := wString;
  if Length(wString) < 10 then
    wAcrescimo := 20 - Length(wString) * 2
  else if Length(wString) > 20 then
    wAcrescimo := 5
  else
    wAcrescimo := 6;
  for wCont := 1 to Length(wString) do
  begin
    wRet2 := wRet2 + Chr(Ord(wRet[wCont]) + wAcrescimo);
    wAuxS := FormatFloat('000', Ord(wRet2[wCont]));
    wAcrescimo := StrToInt(Copy(wAuxS, 3, 1)) + StrToInt(Copy(wAuxS, 2, 1));
  end;
  Result := wRet2;
end;

function TBib.Decode(wString: string): string;
var
  wAcrescimo, wCont: Integer;
  wRet, wRet2, wAuxS: string;
begin
  // Criptografia ;;
  wRet := wString;
  if Length(wString) < 10 then
    wAcrescimo := 20 - Length(wString) * 2
  else if Length(wString) > 20 then
    wAcrescimo := 5
  else
    wAcrescimo := 6;
  for wCont := 1 to Length(wString) do
  begin
    wRet2 := wRet2 + Chr(Ord(wRet[wCont]) - wAcrescimo);
    wAuxS := FormatFloat('000', Ord(wRet[wCont]));
    wAcrescimo := StrToInt(Copy(wAuxS, 3, 1)) + StrToInt(Copy(wAuxS, 2, 1));
  end;
  Result := wRet2;
end;

function TBib.NumToTexto(wNum: Real; wDec, wTamanho: Byte): string;
var
  wFormato, wAux: string;
begin
  wFormato := '###,###,##0';
  if wDec > 0 then
    wFormato := wFormato + '.' + Copy('0000000', 1, wDec);
  wAux := FormatFloat(wFormato, wNum);
  Result := Copy(wBranco, 1, wTamanho - Length(wAux)) + wAux;
end;

function TBib.NomeMes(wMes: Byte): string;
begin
  case wMes of
    1: Result := 'Janeiro';
    2: Result := 'Fevereiro';
    3: Result := 'Março';
    4: Result := 'Abril';
    5: Result := 'Maio';
    6: Result := 'Junho';
    7: Result := 'Julho';
    8: Result := 'Agosto';
    9: Result := 'Setembro';
    10: Result := 'Outubro';
    11: Result := 'Novembro';
    12: Result := 'Dezembro';
  else
    raise Exception.Create('Número de Mês Inválido');
  end;
end;

function TBib.NumToTextoArredondamento(Value: Extended; Decimals: Integer):
  Extended;
var
  Factor, Fraction: Extended;
begin
  Factor := IntPower(10, Decimals);
  Value := StrToFloat(FloatToStr(Value * Factor));
  Result := Int(Value);
  Fraction := Frac(Value);
  if Fraction >= 0.6 then
    Result := Result + 1
  else if Fraction <= -0.6 then
    Result := Result - 1;
  Result := Result / Factor;
end;

function TBib.RemoveAcentos(Texto: string): string;
var
  i: integer;
begin
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
      'ã': Texto[i] := 'a';
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
    end;

  Result := Texto;

end;

function TBib.EnviaSMS(pCod_cadastro: integer; pMensagem: string;
  pCelularDestino: string = ''): string;

var
  celular_destino, usuario_logado: string;
  chave, URL: string;
  retorno: string;
begin
  if pCelularDestino <> '' then
    celular_destino := pCelularDestino
  else
    celular_destino := trim(DMOracle.FastSelect('DESC_CELULAR', 'TB_CADASTRO',
      'COD_CADASTRO = '
      + inttostr(pCod_cadastro)));

  if (length(celular_destino) <> 11) then
    raise Exception.Create('O celular informado no cadastro é invalido');

  chave := DMParamSistema.QParamSistemaDESC_CHAVE_ACESSO_SMS.Value;
  if (trim(chave) = '') then
    raise Exception.Create('Envio de SMS não configurado');

  usuario_logado := DMOracle.FastSelect('NOME', 'TB_USUARIO', 'COD_USUARIO = '
    + inttostr(DMUsuario.CodUsuarioCorrente));

  pMensagem := copy(bib.RemoveAcentos(pMensagem), 1, 140);
  pMensagem := bib.SubstituiStr(pMensagem, chr(13) + chr(10), ' ');
  pMensagem := trim(bib.RemoveEspacoDuplo(pMensagem));
  pMensagem := bib.SubstituiStr(pMensagem, ' ', '+');

  usuario_logado := bib.RemoveAcentos(usuario_logado);
  usuario_logado := trim(bib.RemoveEspacoDuplo(usuario_logado));
  usuario_logado := bib.SubstituiStr(usuario_logado, ' ', '+');

  URL := 'http://www.agendasms.net.br/api/enviarSMS.php?';
  URL := URL + 'chavedeacesso=' + chave;
  URL := URL + '&remetente=' + usuario_logado;
  URL := URL + '&destino=' + celular_destino;
  URL := URL + '&mensagem=' + pMensagem;
  result := URL;
end;

function TBib.EnviaSMSApiWeb(pCod_cadastro: integer; pMensagem: string;
  pCelularDestino: string = ''): string;
var
  SMS: ISMS;
  strErro: string;
begin
  try
    SMS := CoSMS.Create;
  except
    WinExec('regasm CemapaUtils.dll /tlb:CemapaUtils.tlb', SW_HIDE);
    Screen.Cursor := crHourGlass;
    Sleep(3000);
    Screen.Cursor := crDefault;
    SMS := CoSMS.Create;
  end;
  try
    if pCelularDestino = '' then
      pCelularDestino := trim(DMOracle.FastSelect('DESC_CELULAR', 'TB_CADASTRO',
        'COD_CADASTRO = '
        + inttostr(pCod_cadastro)));

    if (length(pCelularDestino) <> 11) then
      raise Exception.Create('O celular informado no cadastro é invalido');

    if (trim(DMParamSistema.QParamSistemaDESC_CHAVE_ACESSO_SMS.Value) = '') then
      raise Exception.Create('Envio de SMS não configurado');

    pMensagem := copy(bib.RemoveAcentos(pMensagem), 1, 140);
    pMensagem := bib.SubstituiStr(pMensagem, chr(13) + chr(10), ' ');
    if SMS.Enviar(pCelularDestino, pMensagem,
      DMParamSistema.QParamSistemaDESC_CHAVE_ACESSO_SMS.Value) then
      result := 'Mensagem Enviada Com Sucesso'
    else
    begin
      strErro := SMS.LeErro;
      result := 'Erro ao Enviar SMS' + chr(13) + chr(10) + strErro;
    end;
  except
    result := 'Erro desconhecido';
  end;
end;

function TBib.analisaEnvioSMS(pResposta: string): string;
begin
  case AnsiIndexStr(UpperCase(pResposta), ['OK', 'ERRO0', 'ERRO1', 'ERRO2',
    'ERRO3', 'ERRO4', 'ERRO5', 'ERRO_M', 'ERRO_C', 'ERROSERVEROFF', 'ERRO',
    'ERROCREDITO']) of
    0: result := pResposta + ' - Mensagem enviada com sucesso.';
    1: result := pResposta + ' - Chave de acesso inválida.';
    2: result := pResposta + ' - Usuário não encontrado com essa chave.';
    3: result := pResposta + ' - Remetente inválido.';
    4: result := pResposta + ' - Número de destino está em branco.';
    5: result := pResposta + ' - Número de destino não é numérico.';
    6: result := pResposta + ' - Número de destino excede 11 caracteres.';
    7: result := pResposta + ' - Mensagem inválida está em branco.';
    8: result := pResposta + ' - Menssagem ultrapassou 140 caracteres.';
    9: result := pResposta +
      ' - No momento o servidor de envio de mensagens pode estar fora do ar. Entre em contato com o suporte e informe o problema.';
    10: result := pResposta +
      ' - Erro ao enviar a mensagem. Entre em contato com o suporte.';
    11: result := pResposta + ' - Seu saldo em créditos é insuficiente.';
  else
    result := pResposta;
  end;
end;

{ TImp }

procedure TImp.AbreImpressora;
//var
//  wCodErro: Byte;
begin
  AbreImpressora('LPT1');
  //  if pStatus <> 'ABERTA' then
  //  try
  //    AssignFile(pArqImpressora, '\LPT1');
  //    FileMode := 2; // 0 - Read Only; 1-Write Only; 2-Read and Write
  //{$I-}
  //    Reset(pArqImpressora);
  //
  //    wCodErro := IOResult;
  //    if (wCodErro <> 0) and (wCodErro <> 2) then
  //      Abort
  //    else
  //      Rewrite(pArqImpressora);
  //    {
  //        If IOResult <> 0 Then
  //          Abort
  //        Else
  //          Rewrite(pArqImpressora );
  //    }
  //    if IOResult <> 0 then
  //      Abort;
  //    pTextoLinha := '';
  //    pLinhaCorrente := 0; // Linha da Impressora
  //{$I+}
  //    pStatus := 'ABERTA';
  //  except
  //    CloseFile(pArqImpressora);
  //{$I+}
  //    raise Exception.Create('Não foi possível abrir impressora!');
  //  end;
end;

(* Autor: Diego Aguir Selzlein
 * Procedure que abre a impressora para uma porta específica, recebida
 * por parâmetro. Outra diferença é que ela irá chamar a interface
 * IPortaListener solicitando verificação de mapeamento da porta segundo
 * o cadastro do usuário.
*)

procedure TImp.AbreImpressora(Porta: string);
var
  wCodErro: Byte;
begin
  //Verifica mapeamento por usuario
  if FPortaUsuarioListener <> nil then
    if not FPortaUsuarioListener.VerificaMapeamento(Porta) then
      if
        (MessageDlg('Não foi possível conectar a impressora. Continuar mesmo assim?', mtConfirmation, [mbYes, mbNo], 0) in [mrNo, mrNone]) then
        Abort;

  //Abre a Impressora para porta especifica
  if pStatus <> 'ABERTA' then
    try
      AssignFile(pArqImpressora, '\' + Porta);
      FileMode := 2; // 0 - Read Only; 1-Write Only; 2-Read and Write
{$I-}
      Reset(pArqImpressora);

      wCodErro := IOResult;
      if (wCodErro <> 0) and (wCodErro <> 2) then
        Abort
      else
        Rewrite(pArqImpressora);
      if IOResult <> 0 then
        Abort;
      pTextoLinha := '';
      pLinhaCorrente := 0; // Linha da Impressora
{$I+}
      pStatus := 'ABERTA';
    except
      on E: Exception do
      begin
        if e.Message = 'Operation aborted' then
          raise Exception.Create('Não foi possível abrir impressora!')
        else
          CloseFile(pArqImpressora);
      end;
{$I+}
    end;
end;

procedure TImp.AbreImpressora_Lpt2;
//var
//  wCodErro: Byte;
begin
  AbreImpressora('LPT2');
  //  if pStatus <> 'ABERTA' then
  //  try
  //    AssignFile(pArqImpressora, '\LPT2');
  //    FileMode := 2; // 0 - Read Only; 1-Write Only; 2-Read and Write
  //{$I-}
  //    Reset(pArqImpressora);
  //    wCodErro := IOResult;
  //    if (wCodErro <> 0) and (wCodErro <> 2) then
  //      Abort
  //    else
  //      Rewrite(pArqImpressora);
  //    {    If IOResult <> 0 Then
  //          Abort
  //        Else
  //          Rewrite(pArqImpressora );
  //    }
  //    if IOResult <> 0 then
  //      Abort;
  //    pTextoLinha := '';
  //    pLinhaCorrente := 0; // Linha da Impressora
  //{$I+}
  //    pStatus := 'ABERTA';
  //  except
  //    CloseFile(pArqImpressora);
  //{$I+}
  //    raise Exception.Create('Não foi possível abrir impressora!');
  //  end;
end;

procedure TImp.AbreImpressora_Lpt3;
begin
  AbreImpressora('LPT3');
end;

procedure TImp.AbreImpressora_Com2;
var
  wCodErro: Byte;
begin
  if pStatus <> 'ABERTA' then
    try
      AssignFile(pArqImpressora, '\COM2');
      FileMode := 2; // 0 - Read Only; 1-Write Only; 2-Read and Write
{$I-}
      Reset(pArqImpressora);
      wCodErro := IOResult;
      if (wCodErro <> 0) and (wCodErro <> 2) then
        Abort
      else
        Rewrite(pArqImpressora);
      {
          If IOResult <> 0 Then
            Abort
          Else
            Rewrite(pArqImpressora );
      }
      if IOResult <> 0 then
        Abort;
      pTextoLinha := '';
      pLinhaCorrente := 0; // Linha da Impressora
{$I+}
      pStatus := 'ABERTA';
    except
      //    CloseFile(pArqImpressora);
      //    {$I+}
      //    Raise Exception.Create('Não foi possível abrir impressora!');
      AssignFile(pArqImpressora, '\LPT3');
      FileMode := 2; // 0 - Read Only; 1-Write Only; 2-Read and Write
{$I-}
      Reset(pArqImpressora);
      if IOResult <> 0 then
        Abort
      else
        Rewrite(pArqImpressora);
      if IOResult <> 0 then
        Abort;
      pTextoLinha := '';
      pLinhaCorrente := 0; // Linha da Impressora
{$I+}
      pStatus := 'ABERTA';
    end;
end;

procedure TImp.ConfiguraImpressora(wCondensado, wOitavos: string;
  wQtdeLinhas: Byte);
begin
  if wCondensado = 'CONDENSADO_ON' then
  begin
    pCharPorCM := 137 / 20; // Quantidade de Caracteres por Centimetro
    Write(pArqImpressora, Chr(15)); // Condensado
    fCondensado := true;
  end
  else if wCondensado = 'CONDENSADO_OFF' then
  begin
    pCharPorCM := 80 / 20; // Quantidade de Caracteres por Centimetro
    Write(pArqImpressora, Chr(18)); // NORMAL
    fCondensado := false;
  end
  else
    raise Exception.Create('Parametro Condensado inválido.');
  if wOitavos = 'OITAVOS' then
    Write(pArqImpressora, Chr(27) + '0') // OITAVOS
  else if wOitavos = 'SEXTOS' then
    Write(pArqImpressora, Chr(27) + '2') // SEXTOS
  else
    raise Exception.Create('Parametro oitavos inválido!');
  Write(pArqImpressora, Chr(27) + Chr(67) + Chr(wQtdeLinhas));
    // Linhas por Pagina
  pQtdLinhaPagina := wQtdeLinhas;
end;

procedure TImp.ConfiguraCondensado(wCondensado: string);
begin
  if wCondensado = 'CONDENSADO_ON' then
  begin
    Write(pArqImpressora, Chr(15)); // Condensado
    fCondensado := true;
  end
  else if wCondensado = 'CONDENSADO_OFF' then
  begin
    Write(pArqImpressora, Chr(18)); // NORMAL
    fCondensado := false;
  end
  else
    raise Exception.Create('Parametro Condensado inválido.');
end;

procedure TImp.ConfiguraNegrito(wNegrito: string);
begin
  if wNegrito = IMP_CONF_NEGRITO_ON then
  begin
    Write(pArqImpressora, Chr(27) + chr(71)) // negrito
  end
  else if wNegrito = IMP_CONF_NEGRITO_OFF then
  begin
    Write(pArqImpressora, Chr(27) + chr(72)) // NORMAL
  end
  else
    raise Exception.Create('Parametro negrito inválido.');
end;

procedure TImp.FechaImpressora;
begin
  if pTextoLinha <> '' then
    WriteXY(0, pLinhaCorrente + 1, ''); // Grava UltimaLinha
  CloseFile(pArqImpressora);
  pStatus := 'FECHADA';
  pLinhaCorrente := 0;
end;

procedure TImp.SaltaPagina;
begin
  if pTextoLinha <> '' then
    WriteXY(0, pLinhaCorrente + 1, ''); // Grava UltimaLinha
  Write(pArqImpressora, Char(12)); // Eject ( Salto de Pagina )
  pLinhaCorrente := 0;
end;

procedure TImp.SaltaPaginaEtiquetas;
begin
  if pTextoLinha <> '' then
    WriteXY(0, pLinhaCorrente + 1, ''); // Grava UltimaLinha
  //Write(pArqImpressora,Char(27)+Char(12) ); // Eject ( Salto de Pagina )
  //WriteLn(pArqImpressora,'');
  pLinhaCorrente := 0;
end;

procedure TImp.SaltaPaginaEtiquetasChaiana;
begin
  if pTextoLinha <> '' then
    WriteXY(0, pLinhaCorrente + 2, ''); // Grava UltimaLinha
  //Write(pArqImpressora,Char(27)+Char(12) ); // Eject ( Salto de Pagina )
  //WriteLn(pArqImpressora,'');
  pLinhaCorrente := 0;
end;

procedure TImp.SaltaPaginaEtiquetas2;
begin
  if pTextoLinha <> '' then
    WriteXY(0, pLinhaCorrente + 1, ''); // Grava UltimaLinha
  //Write(pArqImpressora,Char(27)+Char(12) ); // Eject ( Salto de Pagina )
  WriteLn(pArqImpressora, '');
  WriteLn(pArqImpressora, '');
  WriteLn(pArqImpressora, '');
  pLinhaCorrente := 0;

end;

procedure TImp.WriteXY(wX, wY: Real; wCampo: string);
var
  wPosicao: Integer;
  // ** Esta Constante poderia ser colocada na Tabela de Parametros
begin
  // ** Imprime um Campo em uma coordenada
  //If pQtdLinhaPagina < wY Then
  //  Raise Exception.Create('Quantidade de linhas por página menor que a linha a ser Impressa!');
  if (wY < pLinhaCorrente) then
    raise
      Exception.Create('Linha Inválida! Não é possível retroceder o papel!');
  if (wY > pLinhaCorrente) then
  begin
    Write(pArqImpressora, pTextoLinha);
    pTextoLinha := '';
    while pLinhaCorrente < wY do
    begin
      WriteLn(pArqImpressora, '');
      pLinhaCorrente := pLinhaCorrente + 1;
    end;
  end;
  // Acumula o Campo para ser impresso na proxima chamada
  wPosicao := Round(wX * pCharPorCM);
  pTextoLinha := pTextoLinha + Copy(wBranco, 1, wPosicao - Length(pTextoLinha))
    + wCampo;
end;

function TBib.FormataTexto(wString: string; wTamanho: integer; fillChar: char =
  ' '): string;
var
  Texto: string;
begin
  if length(wString) > wTamanho then
    Result := Copy(wString, 1, wTamanho)
  else
  begin
    Texto := wString;
    while length(Texto) < wTamanho do
    begin
      Texto := Texto + fillChar;
    end;
    Result := Texto;
  end;
end;

function TBib.FormataTextoEsq(wString: string; wTamanho: integer): string;
var
  Texto, Txt: string;
  i: integer;
begin
  Texto := Trim(wString);
  Txt := '';
  if Length(Texto) < wTamanho then
  begin
    for i := 1 to wTamanho - Length(Texto) do
      Txt := Txt + ' ';
    Result := Txt + Texto;
  end
  else if Length(Texto) >= wTamanho then
    Result := Copy(Texto, 1, wTamanho);
end;

function TBib.FormataTextoEsq(wString: string; wTamanho: integer; fillChar:
  Char): string;
var
  Texto, Txt: string;
  i: integer;
begin
  Texto := Trim(wString);
  Txt := '';
  if Length(Texto) < wTamanho then
  begin
    for i := 1 to wTamanho - Length(Texto) do
      Txt := Txt + fillChar;
    Result := Txt + Texto;
  end
  else if Length(Texto) >= wTamanho then
    Result := Copy(Texto, 1, wTamanho);
end;

function TBib.DigitoVerificador(Numero: string): string;
var
  wString: string;
  wNrAux, wSoma, wSeq, i: integer;
begin
  wString := Numero;
  if length(wString) <> 11 then
    raise Exception.Create('Erro no número a ser verificado')
  else
  begin
    wSeq := 4;
    wSoma := 0;
    for i := 1 to 11 do
    begin
      wNrAux := StrToInt(wString[i]);
      wNrAux := wNrAux * wSeq;
      wSoma := wSoma + wNrAux;
      Dec(wSeq);
      if wSeq = 1 then
        wSeq := 9;
    end;
    wNrAux := wSoma mod 11;
    wNrAux := 11 - wNrAux;
    if wNrAux = 10 then
      Result := 'X'
    else if wNrAux = 11 then
      Result := '0'
    else
      Result := IntToStr(wNrAux);
  end;
end;

function TBib.DigitoVerificadorHSBC(Numero: string): string;
var
  wNossoNumero: string;
  wNossoNumeroFinal: Integer;
begin
  wNossoNumero := Numero; // Pega parametro.
  wNossoNumeroFinal := StrToInt(Copy(wNossoNumero, 1, 1)) * 5;
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 2, 1)) *
    4);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 3, 1)) *
    3);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 4, 1)) *
    2);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 5, 1)) *
    7);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 6, 1)) *
    6);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 7, 1)) *
    5);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 8, 1)) *
    4);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 9, 1)) *
    3);
  wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(wNossoNumero, 10, 1))
    * 2);
  wNossoNumeroFinal := wNossoNumeroFinal mod 11;
  if (wNossoNumeroFinal = 0) or (wNossoNumeroFinal = 1) then
    Result := '0'
  else
    Result := IntToStr(11 - wNossoNumeroFinal);
end;

function TBib.DigitoVerificadorHSBC1(Numero: string): string;
var
  wNossoNumeroFinal, wcontrole, wCont: Integer;
begin
  {***************ATENÇÃO****************

     Essa função não é para calcular o DAC

  ***************************************}

  wControle := 9;
  wCont := Length(Numero);
  wNossoNumeroFinal := 0;
  while wCont > 0 do
  begin
    wNossoNumeroFinal := wNossoNumeroFinal + (StrToInt(Copy(Numero, wCont, 1)) *
      wControle);
    wControle := wControle - 1;
    if wControle = 1 then
      //era 0 alterado para 1 pois a multiplicação é feita de 9 a 2 - Alessandro. 06/11/2012
      wControle := 9;
    wCont := wCont - 1;
  end;
  wNossoNumeroFinal := wNossoNumeroFinal mod 11;
  //segundo o layout tecnico versao de setembro de 2009, se o resto da divisão for 10 usa-se 0(zero), caso contrario usa-se o resto da divisão. Modo antigo comentado logo abaixo. - Alessandro I. W. em 06/11/12
  if (wNossoNumeroFinal = 10) then
    wNossoNumeroFinal := 0;
  result := IntToStr(wNossoNumeroFinal);
  {if (wNossoNumeroFinal = 0) or (wNossoNumeroFinal = 1) then
    Result := '0'
  else
    Result := IntToStr(11 - wNossoNumeroFinal);}
end;

function TBib.StrZero(S: string; n: Byte): string;
var
  Zeros: string;
  f: Integer;
begin
  Zeros := '';
  for f := 1 to N do
    Zeros := Zeros + '0';
  S := Copy(Zeros, 1, n - Length(S)) + S;
  Result := S;
end;

{ Função converte espacos em branco/ponto/virgula em zeros }

function TBib.StrZeroDecimal(Num: Real; Zeros, Deci: integer): string;
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

function TBib.Right(S: string; n: Byte): string;
begin
  Result := Copy(S, Length(S) - n + 1, n);
end;

function TBib.ValidaIEstadual(wInscricao, wEstado: string): boolean;
var
  IRet: Integer;
  LibHandle: THandle;
  ConsisteInscricaoEstadual: TConsisteInscricaoEstadual;
begin
  wInscricao := LimpaString(wInscricao, '.');
  wInscricao := LimpaString(wInscricao, '-');

  try
    LibHandle := LoadLibrary(PChar(Trim('DllInscE32.Dll')));
    if LibHandle <= HINSTANCE_ERROR then
      raise Exception.Create('Dll não carregada');

    @ConsisteInscricaoEstadual := GetProcAddress(LibHandle,
      'ConsisteInscricaoEstadual');
    if @ConsisteInscricaoEstadual = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    IRet := ConsisteInscricaoEstadual(wInscricao, wEstado);
    if IRet = 0 then
      Result := True
    else
      Result := False;
    FreeLibrary(LibHandle);
  except
    raise
      exception.Create('Erro ao tentar abrir biblioteca para validar Inscr. Estadual');
  end;
end;

function TBib.TrocaVirgulaPorPonto(wNum: string): string;
var
  wCont: Integer;
  wRet: string;
begin
  wRet := '';
  for wCont := 1 to Length(wNum) do
  begin
    if Copy(wNum, wCont, 1) = ',' then
      wRet := wRet + '.'
    else
      wRet := wRet + Copy(wNum, wCont, 1);
  end;
  Result := wRet;
end;

//retorna o número de dias decorrido desde 1 de janeiro

function TBib.DiaAno(data: TDateTime): Word;
var
  dia, mes, ano, aux: Word;
begin
  aux := 0;
  DecodeDate(data, ano, mes, dia);
  case mes of
    1: aux := dia;
    2: aux := 31 + dia;
    3: aux := 59 + dia;
    4: aux := 90 + dia;
    5: aux := 120 + dia;
    6: aux := 151 + dia;
    7: aux := 181 + dia;
    8: aux := 212 + dia;
    9: aux := 243 + dia;
    10: aux := 273 + dia;
    11: aux := 304 + dia;
    12: aux := 334 + dia;
  end;
  if (ano mod 4 = 0) and (mes > 2) then //ano bissexto e mes maior que fevereiro
    aux := aux + 1;
  Result := aux;
end;

//calcula a diferença de dias entre duas datas

function TBib.DifData(dtChegada, dtSaida: TDateTime): Integer;
var
  diaAnoC, diaAnoS, diaC, diaS, mesC, mesS, anoC, anoS: Word;
begin
  diaAnoC := DiaAno(dtChegada);
  diaAnoS := DiaAno(dtSaida);
  decodeDate(dtChegada, anoC, mesC, diaC);
  decodeDate(dtSaida, anoS, mesS, diaS);
  while anoC < anoS do
  begin
    if anoC mod 4 = 0 then
      diaAnoS := diaAnoS + 366
    else
      diaAnoS := diaAnoS + 365;
    anoC := anoC + 1;
  end;
  Result := DiaAnoS - DiaAnoC;
end;

//calcula a diferanca de entre duas horas
//observacao - hora deve ser informada de 0 a 23

procedure TBib.DifHora(hrChegada, minChegada, hrSaida, minSaida: Integer; var
  totHr, totMin: Integer);
begin
  if minSaida < minChegada then
  begin
    totMin := (60 + minSaida) - minChegada;
    hrSaida := hrSaida - 1;
  end
  else
    totMin := minSaida - minChegada;
  if hrSaida < hrChegada then
    totHr := (24 + hrSaida) - hrChegada
  else
    totHr := hrSaida - hrChegada;
end;

function TBib.HorasEntre(dtInicio, dtFim: TDateTime): Real;
  procedure incrementa(var wReal: Real; wValor: Real; wPeso: Real = 1);
  begin
    wReal := wReal + (wValor * wPeso);
  end;
var
  wHoras: Real;
begin
  wHoras := 0;
  incrementa(wHoras, DifData(dtInicio, dtFim), 24);
  incrementa(wHoras, StrToInt(FormatDateTime('h', dtFim)) -
    StrToInt(FormatDateTime('h', dtInicio)));
  incrementa(wHoras, StrToInt(FormatDateTime('n', dtFim)) -
    StrToInt(FormatDateTime('n', dtInicio)), 1 / 60);
  incrementa(wHoras, StrToInt(FormatDateTime('s', dtFim)) -
    StrToInt(FormatDateTime('s', dtInicio)), 1 / (60 * 60));
  Result := wHoras;
end;

//calcula o total de horas decorridos entre data e hora chegada até data e hora saída
//observacao - hora deve ser informada de 0 a 23

procedure TBib.HorasDecorridas(dtChegada, dtSaida: TDateTime; hrChegada,
  minChegada, hrSaida, minSaida: integer; var totHor, totMin: Integer);
begin
  DifHora(hrChegada, minChegada, hrSaida, minSaida, totHor, totMin);
    //busca a diferenca de hora
  if dtChegada <> dtSaida then //dia chegada e saida diferentes
  begin
    if (hrSaida < hrChegada) or ((hrSaida = hrChegada) and (minSaida <
      minChegada)) then
      dtSaida := dtSaida - 1;
        //se a hora de saida for menor que a de chegada no calcula da hora foi emprestado um dia
    totHor := totHor + DifData(dtChegada, dtSaida) * 24;
      //calcula as horas dos dias decorridos
  end
  else if (hrSaida < hrChegada) or (dtSaida < dtChegada) then
    //caso chegada aconteceu depois da saída gera excecao
    raise
      Exception.Create('Verifique Data e Hora de Chegada e Saída - Chegada deve acontecer antes da Saída');

end;

function TBib.LimpaNumero(wNumero: string; mantemVirgula: Boolean = False):
  string;
var
  i: integer;
begin
  result := '';
  wNumero := trim(wNumero);
  for i := 1 to Length(wNumero) do
    if ((wNumero[i] in ['0'..'9']) or ((mantemVirgula) and (wNumero[i] = ',')))
      then
      result := result + wNumero[i];
end;

function TBib.TiraMascara(text: string): string;
var
  aux: string;
  i: integer;
begin
  Aux := '';
  for i := 1 to Length(text) do
  begin
    if (copy(text, i, 1) <> '.') and (copy(text, i, 1) <> '-') and (copy(text,
      i, 1) <> '/') and (copy(text, i, 1) <> '\') then
    begin
      Aux := Aux + copy(text, i, 1);
    end;
  end;
  Result := Aux;
end;

function TBib.ValidaPis(PIS: string): boolean;
{Testa se o número do pis é válido ou não}
var
  i, wsoma, Wm11, Wdv, wdigito: Integer;
begin
  if Trim(PIS) <> '' then
  begin
    wdv := strtoint(copy(PIS, 11, 1));
    wsoma := 0;
    wm11 := 2;
    for i := 1 to 10 do
    begin
      wsoma := wsoma + (wm11 * strtoint(copy(PIS, 11 - I, 1)));
      if wm11 < 9 then
      begin
        wm11 := wm11 + 1
      end
      else
      begin
        wm11 := 2;
      end;
    end;
    wdigito := 11 - (wsoma mod 11);
    if wdigito > 9 then
    begin
      wdigito := 0;
    end;
    if wdv = wdigito then
    begin
      Result := true;
    end
    else
    begin
      Result := false;
    end;
  end;
end;

function TBib.ProcuraStr(OQue: string; Onde: string): Integer;
//  Procura uma string dentro de outra, da direita para esquerda
//  Retorna o index onde foi encontrada ou -1 caso não seja encontrada
var
  Pos: Integer;
  Tam1: Integer;
  Tam2: Integer;
  Achou: Boolean;
begin
  Tam1 := Length(OQue);
  Tam2 := Length(Onde);
  Pos := Tam2 - Tam1;
  Achou := False;
  while (Pos >= 0) and not Achou do
  begin
    if Copy(Onde, Pos + 1, Tam1) = OQue then
    begin
      Achou := True
    end
    else
    begin
      Pos := Pos - 1;
    end;
  end;
  Result := Pos;
end;

function TBib.RemoveNumEndereco(wEndereco, wNumero: string): string;
var
  wEnderecoNovo: string;
  i, j: Integer;
  wAux: string;
begin
  wEnderecoNovo := '';
  if wEndereco = '' then
  begin
    Result := '';
    Exit;
  end;
  i := ProcuraStr(wNumero, wEndereco);
  if i < 0 then
    wEnderecoNovo := wEndereco
  else
  begin
    wEnderecoNovo := Copy(wEndereco, 1, i) + Copy(wEndereco, i + Length(wNumero)
      + 1, Length(wEndereco));
    if i = Length(wEnderecoNovo) then
    begin
      wEnderecoNovo := Trim(wEnderecoNovo);
      i := Length(wEnderecoNovo);
      try
        while ((wEnderecoNovo[i] = ',')
          or (wEnderecoNovo[i] = '-')
          or (wEnderecoNovo[i] = '.')) do
        begin
          wEnderecoNovo := Copy(wEnderecoNovo, 1, i - 1);
          wEnderecoNovo := Trim(wEnderecoNovo);
          i := Length(wEnderecoNovo);
        end;
      except
      end;
    end
    else
    begin
      wAux := Copy(wEnderecoNovo, 1, i);
      j := i;
      wAux := Trim(wAux);
      j := Length(wAux);
      while ((wAux[j] = ',') or (wAux[j] = '-')) do
      begin
        wAux := Copy(wAux, 1, j - 1);
        wAux := Trim(wAux);
        j := Length(wAux);
      end;
      if (wEnderecoNovo[i + 1] = ' ')
        or (wEnderecoNovo[i + 1] = ',')
        or (wEnderecoNovo[i + 1] = '.') then
      begin
        if (wEnderecoNovo[i + 2] = ',') or (wEnderecoNovo[i + 2] = '.') then
          wEnderecoNovo := wAux + Copy(wEnderecoNovo, i + 2,
            Length(wEnderecoNovo))
        else
          wEnderecoNovo := wAux + Copy(wEnderecoNovo, i + 1,
            Length(wEnderecoNovo));
      end
      else
        wEnderecoNovo := wAux + ' ' + Copy(wEnderecoNovo, i + 1,
          Length(wEnderecoNovo));
    end;
  end;

  Result := wEnderecoNovo;
end;

function TBib.NumEndereco(wEndereco: string): string;
var
  wNum: string;
  i: Integer;
begin
  i := Length(wEndereco);

  wNum := '';
  if i > 0 then
    if wEndereco[i] in ['0'..'9'] then
      while i > 0 do
      begin
        if wNum = '' then
        begin
          if (wEndereco[i] in ['0'..'9']) then
            wNum := wEndereco[i];
        end
        else
        begin
          if (wEndereco[i] in ['0'..'9']) then
            wNum := wEndereco[i] + wNum
          else
            Break;
        end;
        Dec(i);
      end;
  if wNum = '' then
    wNum := 'SN';
  result := wNum;
end;

function TBib.Modulo11(Numero: string): string;
var
  i, j, k: Integer;
  Soma: Integer;
  Digito: Integer;
begin
  Result := '';
  try
    Soma := 0;
    k := 2;
    for i := Length(Numero) downto 1 do
    begin
      Soma := Soma + (StrToInt(Numero[i]) * k);
      inc(k);
      if k > 9 then
        k := 2;
    end;
    Digito := 11 - Soma mod 11;
    if Digito >= 10 then
      Digito := 0;
    Result := Result + Chr(Digito + Ord('0'));
  except
    Result := 'X';
  end;
end;

// StrZero (Preenche com zeros à esquerda)

function TBib.StrZero2(Num: Real; Zeros, Deci: Integer): string;
var
  tam, z: integer;
  res, zer: string;
begin
  str(Num: Zeros: Deci, res);
  res := Alltrim(res);
  tam := length(res);
  zer := '';
  for z := 1 to (Zeros - tam) do
    zer := zer + '0';
  result := zer + res
end;

function TBib.Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
  BlackSpace = [#33..#126];
var
  Index: byte;
begin
  Index := 1;
  while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
    Index := Index + 1;
  end;
  Result := Copy(Search, Index, 255);
  Index := Length(Result);
  while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
    Index := Index - 1;
  end;
  Result := Copy(Result, 1, Index);
end;

function TBib.ArrayContem(PArray: array of Variant; PValor: Variant): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Length(PArray) - 1 do
    if PValor = PArray[i] then
    begin
      Result := True;
      Break;
    end;
end;

function TBib.ComparaIntegerArray(wNum: Integer; wArray: array of Integer):
  Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Length(wArray) - 1 do
    if wNum = wArray[i] then
    begin
      Result := True;
      Break;
    end;
end;

{
 Função para atribuir datas a campos MaskEdit,
 passar True para FimMes atribui ultimo dia do mes para o segundo MaskEdit, caso contrario atribui data atual
 DataCalculo é a data usada para calcular o dia inicial e o final. Se for 0, usa o atual
}

procedure TBib.PriUltData(DtaIni, DtaFin: TMaskEdit; FimMes: Boolean = false;
  DataCalculo: TDate = 0);
var
  Dia, Dia1, Mes, Ano: word;
begin
  if (DataCalculo > 0) then
  begin
    decodedate(DataCalculo + 30, Ano, Mes, Dia1);
    decodedate(DataCalculo, Ano, Mes, Dia);
  end
  else
  begin
    decodedate(date + 30, Ano, Mes, Dia1);
    decodedate(date, Ano, Mes, Dia);
  end;

  DtaIni.Text := '01/' + formatfloat('00', Mes) + '/' + formatfloat('0000',
    Ano);

  if Dia = Dia1 then
    DtaFin.Text := '30/' + formatfloat('00', Mes) + '/' + formatfloat('0000',
      Ano)
  else
    DtaFin.Text := '31/' + formatfloat('00', Mes) + '/' + formatfloat('0000',
      Ano);

  if Mes = 2 then
  begin
    if (Ano mod 4 = 0) and ((Ano mod 100 <> 0) or (Ano mod 400 = 0)) then
      DtaFin.Text := '29/' + formatfloat('00', Mes) + '/' + formatfloat('0000',
        Ano)
    else
      DtaFin.Text := '28/' + formatfloat('00', Mes) + '/' + formatfloat('0000',
        Ano);
  end;

  if not FimMes then
    DtaFin.Text := FormatDateTime('dd/MM/yyyy', date);
end;

procedure TBib.PriUltDataVar(var DtaIni: TDate; var DtaFin: TDate; FimMes:
  Boolean = false; DataCalculo: TDate = 0);
var
  Dia, Dia1, Mes, Ano: word;
begin
  if (DataCalculo > 0) then
  begin
    decodedate(DataCalculo + 30, Ano, Mes, Dia1);
    decodedate(DataCalculo, Ano, Mes, Dia);
  end
  else
  begin
    decodedate(date + 30, Ano, Mes, Dia1);
    decodedate(date, Ano, Mes, Dia);
  end;

  DtaIni := StrToDate('01/' + formatfloat('00', Mes) + '/' + formatfloat('0000',
    Ano));

  if Mes = 2 then
  begin
    if (Ano mod 4 = 0) and ((Ano mod 100 <> 0) or (Ano mod 400 = 0)) then
      DtaFin := StrToDate('29/' + formatfloat('00', Mes) + '/' +
        formatfloat('0000', Ano))
    else
      DtaFin := StrToDate('28/' + formatfloat('00', Mes) + '/' +
        formatfloat('0000', Ano));
  end
  else
  begin
    if Dia = Dia1 then
      DtaFin := StrToDate('30/' + formatfloat('00', Mes) + '/' +
        formatfloat('0000', Ano))
    else
      DtaFin := StrToDate('31/' + formatfloat('00', Mes) + '/' +
        formatfloat('0000', Ano));
  end;

  if not FimMes then
    DtaFin := StrToDate(FormatDateTime('dd/MM/yyyy', date));
end;

function TBib.AjustaStr(str: string; tam: Integer; caractere: string = ' '):
  string;
begin
  while Length(str) < tam do
    str := str + caractere;
  if Length(str) > tam then
    str := Copy(str, 1, tam);
  Result := str;
end;

function TBib.AjustaStrContrario(str: string; tam: Integer; caractere: string =
  ' '): string;
begin
  while Length(str) < tam do
    str := caractere + str;
  if Length(str) > tam then
    str := Copy(str, 1, tam);
  Result := str;
end;

// funcao q retorna os componentes filhos de um componente em um Array

function TBib.componentsAsArray(c: TControl): TControls;
var
  i: Integer;
  cs: TControls;
begin
  SetLength(cs, c.ComponentCount);
  for i := 0 to c.ComponentCount - 1 do
    if (c.Components[i] is TControl) then
      cs[i] := TControl(c.Components[i]);
  Result := cs;
end;

// Procedure para alterar o charCase dos componentes

procedure TBib.charCaseComps(c: array of TControl; cc: TEditCharCase;
  ParentName: string);
var
  count, i: Integer;
begin
  for count := 0 to Length(c) - 1 do
  begin
    if c[count] = nil then
      Continue;
    if BuscaControle(c[count], ParentName) > 0 then
      Continue
    else if (c[count] is TMaskEdit) then
      TMaskEdit(c[count]).CharCase := cc
    else if (c[count] is TEdit) then
      TEdit(c[count]).CharCase := cc
    else if (c[count] is TDBEdit) then
      TDBEdit(c[count]).CharCase := cc
    else if (c[count] is TDBPanel) then
      TDBPanel(c[count]).CharCase := cc
    else if (c[count].ComponentCount > 0) then
      charCaseComps(componentsAsArray(c[count]), cc, ParentName);
  end;
end;

procedure TBib.inverteControles(controle1, controle2: TControl;
  posicao: Boolean = True; tamanho: Boolean = False; anchors: Boolean = False;
  visibilidade: Boolean = False);
var
  wAux: Integer;
  wAnc: TAnchors;
  wVis: Boolean;
begin
  if not (posicao or tamanho) then
    Exit;

  if posicao then
  begin
    wAux := controle1.Left;
    controle1.Left := controle2.Left;
    controle2.Left := wAux;

    wAux := controle1.Top;
    controle1.Top := controle2.Top;
    controle2.Top := wAux;
  end;

  if tamanho then
  begin
    wAux := controle1.Width;
    controle1.Width := controle2.Width;
    controle2.Width := wAux;

    wAux := controle1.Height;
    controle1.Height := controle2.Height;
    controle2.Height := wAux;
  end;

  if anchors then
  begin
    wAnc := controle1.Anchors;
    controle1.Anchors := controle2.Anchors;
    controle2.Anchors := wAnc;
  end;

  if visibilidade then
  begin
    wVis := controle1.Visible;
    controle1.Visible := controle2.Visible;
    controle2.Visible := wVis;
  end;
end;

function TBib.leArquivoConf(chave: string): string;
var
  arquivo: TIniFile;
begin
  arquivo := TIniFile.Create('.\conf.ini');
  result := arquivo.ReadString('cemapa', chave, '');
  arquivo.Destroy;
end;

procedure TBib.escreveArquivoConf(chave: string; valor: string);
var
  arquivo: TIniFile;
begin
  arquivo := TIniFile.Create('.\conf.ini');
  arquivo.WriteString('cemapa', chave, valor);
  arquivo.Destroy;
end;

function TBib.Chars(wChar: string; wCont: Integer): string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to wCont - 1 do
    Result := Result + wChar;
end;

function TBib.diaSemanaProximo(data: TDate; diaDestino: Integer): TDate;
var
  i, dia, dif: Integer;
  dataDest: TDate;
begin
  dia := DayOfWeek(data);
  if DayOfWeek(data) = diaDestino then
    Result := data
  else
  begin
    if dia < diaDestino then
      dif := diaDestino - dia
    else
      dif := diaDestino - dia + 7;

    dataDest := data + dif;

    Result := dataDest;
  end;
end;

function TBib.diaSemanaAnterior(data: TDate; diaDestino: Integer): TDate;
var
  i, dia, dif: Integer;
  dataDest: TDate;
begin
  dia := DayOfWeek(data);
  if DayOfWeek(data) = diaDestino then
    Result := data
  else
  begin
    if dia > diaDestino then
      dif := dia - diaDestino
    else
      dif := dia - diaDestino + 7;

    dataDest := data - dif;

    Result := dataDest;
  end;
end;

function TBib.DataPorExtenso(data: TDate): string;
const
  Semana: array[1..7] of string = ('Domingo', 'Segunda-Feira', 'Terça-Feira',
    'Quarta-Feira', 'Quinta-Feira', 'Sexta-Feira', 'Sábado');
var
  DiaSem: Word;
begin
  DiaSem := DayOfWeek(Data);
  Result := Semana[DiaSem];
end;
{
-----------------------------------------------------------------------
A função DayOfWeek retorna um número inteiro que indica o dia da semana,
sendo que o valor pode variar de 1 a 7, sendo que o valor 1 corresponde
ao domingo. Para escrever o dia da semana por extenso, a função posiciona
o vetor semana no  valor indicado pela variável DiaSem.
-----------------------------------------------------------------------
}

{ TVariantKeys }

{ TVariantMap }

function TVariantMap.addValue(Key, Value: Variant): Integer;
var
  i: Integer;
begin
  i := Length(FKeys);
  SetLength(FKeys, i + 1);
  SetLength(FValues, i + 1);
  FKeys[i] := Key;
  FValues[i] := Value;
  Result := i;
end;

procedure TVariantMap.Clear;
begin
  SetLength(Self.FKeys, 0);
  SetLength(Self.FValues, 0);
end;

constructor TVariantMap.Create;
begin
  inherited;
  Clear;
end;

function TVariantMap.getValue(Key: Variant): Variant;
var
  i: Integer;
begin
  Result := null;
  for i := 0 to Length(FKeys) - 1 do
    if FKeys[i] = Key then
    begin
      Result := FValues[i];
      Break;
    end;
end;

function TVariantMap.join(): string;
var
  i: Integer;
  w: string;
begin
  w := '';
  for i := 0 to Length(FKeys) - 1 do
    w := w + FValues[i];
  Result := w;
end;

procedure TVariantMap.setValue(Key, Value: Variant);
var
  i: Integer;
begin

  for i := 0 to Length(FKeys) - 1 do
    if FKeys[i] = Key then
    begin
      FValues[i] := Value;
      Break;
    end;
end;

function TVariantMap.getKeys: TVariantKeys;
var
  chaves: TVariantKeys;
  i: Integer;
begin
  chaves := TVariantKeys.Create;
  for i := 0 to length(FKeys) - 1 do
  begin
    SetLength(chaves.keys, length(chaves.keys) + 1);
    chaves.keys[Length(chaves.keys) - 1] := FKeys[i];
  end;

  Result := chaves;
end;

function TVariantMap.equals(map: TVariantMap): Boolean;
var
  i, j: Integer;
  chavesSelf, chavesOther: TVariantKeys;
  wAchou: Boolean;
begin
  chavesSelf := Self.getKeys;
  chavesOther := map.getKeys;

  if (Length(chavesSelf.keys) <> Length(chavesOther.keys)) then
  begin
    Result := False;
    Exit;
  end;

  for i := 0 to Length(chavesSelf.keys) - 1 do
  begin
    wAchou := False;
    for j := 0 to Length(chavesOther.keys) - 1 do
      if chavesSelf.keys[i] = chavesOther.keys[j] then
      begin
        wAchou := True;
        Break;
      end;

    if (not wAchou) then
    begin
      Result := False;
      Exit;
    end;

    if (Self.getValue(chavesSelf.keys[i]) <> map.getValue(chavesOther.keys[j]))
      then
    begin
      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

constructor TPafEcfHashTabelas.Create;
begin
end;

function TPafEcfHashTabelas.Instancia: TPafEcfHashTabelas;
begin
  if PafEcfHashTabelas = nil then
    PafEcfHashTabelas := TPafEcfHashTabelas.Create;
  Result := PafEcfHashTabelas;
end;

procedure TPafEcfHashTabelas.Atualiza(pDataRef: TDate; pTabela: string =
  'TODAS');
var
  wMD5: TVariantMap;
  wData, wHora: string;
  wDataRef: TDate;
begin
  //Tenta buscar a data da impressora, se não conseguir utiliza a data passada por parâmetro
  {with DMImpressoraFiscal do
  begin
    if GetDataHoraImpressora(wData,wHora) then
    begin
      try
        wDataRef := StrToDate(wData);
      Except
        wDataRef := pDataRef;
      end;
    end
    else
      wDataRef := pDataRef;
  end; }
  wMD5 := bib.GeraMapaDeMD5(wDataRef);
  if (pTabela = 'TB_PRODUTO') or (pTabela = 'TODAS') then
    pHashProdutos := wMD5.GetValue('TB_PRODUTO');
  if (pTabela = 'TB_FILIAL') or (pTabela = 'TODAS') then
    pHashFilial := wMD5.GetValue('TB_FILIAL');
  if (pTabela = 'TB_ECF') or (pTabela = 'TODAS') then
    pHashECF := wMD5.GetValue('TB_ECF');
  if (pTabela = 'TB_REGISTRO_TIPO60_MESTRE') or (pTabela = 'TODAS') then
    pHashTipo60M := wMD5.GetValue('TB_REGISTRO_TIPO60_MESTRE');
  if (pTabela = 'TB_REGISTRO_TIPO60_ANALITICO') or (pTabela = 'TODAS') then
    pHashTipo60A := wMD5.GetValue('TB_REGISTRO_TIPO60_ANALITICO');
  if (pTabela = 'TB_NOTA_CAB') or (pTabela = 'TODAS') then
    pHashNotaCab := wMD5.GetValue('TB_NOTA_CAB');
  if (pTabela = 'TB_NOTA_ITEM') or (pTabela = 'TODAS') then
    pHashNotaItem := wMD5.GetValue('TB_NOTA_ITEM');
  if (pTabela = 'TB_TRIBUTACAO') or (pTabela = 'TODAS') then
    pHashTributacao := wMD5.GetValue('TB_TRIBUTACAO');
  if (pTabela = 'TB_DEMAIS_DOCUMENTOS_ECF') or (pTabela = 'TODAS') then
    pHashDemaisDoc := wMD5.GetValue('TB_DEMAIS_DOCUMENTOS_ECF');
  if (pTabela = 'TB_PAGAMENTO') or (pTabela = 'TODAS') then
    pHashPagamento := wMD5.GetValue('TB_PAGAMENTO');
end;

(**
 * Adiciona um controle cujo CharCase nao poderá ser fixado em maiúsculas.
 * Todos os componentes adicionados serão deixados com o CharCase conforme
 * configurado em tela.
 *)

procedure TBib.addControleCharCase(Controle: TControl; ParentName: string);
var
  i: Integer;
begin
  if FControlesCharCaseM = nil then
    FControlesCharCaseM := TVariantMap.Create;
  if (Controle <> nil) and (ParentName <> '') then
    if BuscaControle(Controle, ParentName) = 0 then
      FControlesCharCaseM.addValue(Controle.Name + '-' + ParentName, 1);
end;

function TBib.BuscaControle(Cont: TControl; ParentName: string): Integer;
var
  v: Variant;
begin
  Result := 0;
  if FControlesCharCaseM <> nil then
  begin
    v := FControlesCharCaseM.getValue(Cont.Name + '-' + ParentName);
    if v <> null then
      Result := v;
    //Result := IfThen(v = null, 0, v);
  end;
  //  Result := -1;
  //  for i := 0 to Length(FControlesCharCase) - 1 do
  //    if (FControlesCharCase[i] <> nil) then
  //      if (FControlesCharCase[i].Name = Cont.Name) and
  //        //(FControlesCharCase[i].Parent <> nil) and
  //        (FControlesCharCase[i].Parent.Name = Cont.Parent.Name) then
  //      begin
  //        Result := i;
  //        Break;
  //      end;
end;

function TBib.RemoveEspacoDuplo(Str: string): string;
var
  i: Integer;
  UltChar: string;
begin
  Result := '';
  UltChar := '';
  for i := 1 to Length(Str) do
    if (Str[i] <> ' ') or (UltChar <> ' ') then
    begin
      Result := Result + Str[i];
      UltChar := Str[i];
    end;
end;

function TBib.isInteger(Str: string): Boolean;
var
  i: Integer;
  UltChar: string;
begin
  try
    StrToInt(Str);
  except
    Result := False;
    Exit;
  end;
  Result := True;
end;

(* Autor: Diego Aguir Selzlein
 * Função que mapeia uma porta para um caminho, ambos recebidos via parâmetro,
 * e retorna um Boolean dizendo se o mapeamento foi realizado com sucesso.
*)

function TBib.MapearPorta(Porta, Caminho: string; Usuario: string = ''; Senha:
  string = ''): Boolean;
var
  wPorta, wCaminho: string;
  wUsuario: PChar;
  NRW: TNetResource;
  i, ret: Integer;
begin
  Result := False;
  wPorta := Trim(Porta);
  wCaminho := Trim(Caminho);
  i := Length(wCaminho);
  if wCaminho[i] = '\' then
    wCaminho := Copy(wCaminho, 1, i - 1);
  if (wPorta <> '') and (wCaminho <> '') then
  begin
    with NRW do
    begin
      dwType := RESOURCETYPE_DISK;
      lpLocalName := PChar(wPorta);
      lpRemoteName := PChar(wCaminho);
      lpProvider := '';
    end;
    if Usuario = '' then
      wUsuario := nil
    else
      wUsuario := PChar(Usuario);
    //Se retornar 0, não houve erros no mapeamento.
    ret := WNetAddConnection2(NRW, PChar(Senha), wUsuario,
      CONNECT_UPDATE_PROFILE);
    Result := ret = NO_ERROR;
  end;
end;

(* Autor: Diego Aguir Selzlein
 * Função que cancela o mapeamento de uma porta, recebida via parâmetro,
 * e retorna um Boolean dizendo se o cancelamento foi efetuado com sucesso.
*)

function TBib.CancelaMapeamentoPorta(Porta: string): Boolean;
var
  wPorta: string;
begin
  Result := False;
  wPorta := Trim(Porta);
  if (wPorta <> '') then
    Result := WNetCancelConnection2(PChar(Porta), CONNECT_UPDATE_PROFILE, True)
      = 0;
end;

function TBib.SubstituiStr(Str: string; Antigo, Novo: string): string;
begin
  Result := StringReplace(Str, Antigo, Novo, [rfReplaceAll]);
end;

function TBib.GetWindowsVersion: string;
//
// Retorna a versão do Windows instalado na maquina
//
var
  // windows api structure
  VersionInfo: TOSVersionInfo;
begin
  Result := '';
  // get size of the structure
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  // populate the struct using api call
  GetVersionEx(VersionInfo);
  // platformid gets the core platform
  // major and minor versions also included.
  with VersionInfo do
  begin
    case dwPlatformid of
      1:
        begin
          case dwMinorVersion of
            0: result := SO_WIN_95;
            10:
              begin
                if (szCSDVersion[1] = 'A') then
                  Result := SO_WIN_98_SE
                else
                  Result := SO_WIN_98;
              end;
            90: result := SO_WIN_ME;
          else
            result := SO_UNKNOWN;
          end;
        end;

      2:
        begin
          case dwMajorVersion of
            3: result := SO_WIN_NT + ' ' + IntToStr(dwMajorVersion) + '.' +
              IntToStr(dwMinorVersion);
            4: result := SO_WIN_NT + ' ' + IntToStr(dwMajorVersion) + '.' +
              IntToStr(dwMinorVersion);
            5:
              begin
                case dwMinorVersion of
                  0: result := SO_WIN_2000;
                  1: result := SO_WIN_XP;
                end;
              end;
          else
            result := SO_UNKNOWN;
          end;
        end;
    else
      result := SO_UNKNOWN_PLATFORM;
    end;
  end;
end;

{ TMensagem }

(*
 * Criando uma instancia de TMensagem.
 * Mensagem: Mensagem que será quebrada em partes do tamanho definido
 *   por TamMaximo.
 * TamMaximo: Tamanho maximo que deverá conter cada linha da mensagem.
 *)

constructor TMensagem.Create(Mensagem: string; TamMaximo: Integer);
begin
  Self.Mensagem := Mensagem;
  FTamMaximo := TamMaximo;
  First;
end;

(*
 * Seta a posicao atual da mensagem para 1, que é o inicio da mensagem
 * e retorna a primeira linha.
 *)

function TMensagem.First: string;
begin
  FIndex := 1;
  Result := Copy(FMensagem, FIndex, FTamMaximo);
end;

(*
 * Retorna true se ainda existe alguma mensagem que não foi retornada no
 * método Next. Se já foi percorrida toda a mensagem original, retorna
 * False.
 *)

function TMensagem.HasNext: boolean;
begin
  Result := (FIndex <= Length(FMensagem));
end;

(*
 * Retorna a próxima linha da mensagem, com o tamanho definido no construtor
 * do TMensagem e seta a posicao atual da mensagem para o fim da mensagem
 * que está sendo retornada.
 *)

function TMensagem.Next: string;
var
  i: Integer;
begin
  Result := '';
  if HasNext then
  begin
    Result := Copy(FMensagem, FIndex, FTamMaximo);
    if (not FCortaPalavra) and (Trim(Copy(FMensagem, FIndex + Length(Result), 1))
      <> '') then
    begin
      i := PosEx(' ', Bib.InverteString(Result));
      if i > 0 then
        Result := Copy(Result, 1, Length(Result) + 1 - i);
    end;
    Inc(FIndex, Length(Result));
    Result := Trim(Result);
  end;
end;

(*
 * Setter para a property Mensagem.
 *)

procedure TMensagem.SetMensagem(const Value: string);
begin
  FMensagem := Trim(Value);
  First;
end;

function TBib.DatasParaLabel(DataI, DataF: TDate): string;
begin
  Result := DatasParaLabel(FormatDateTime('dd/MM/yyyy', DataI),
    FormatDateTime('dd/MM/yyyy', DataF));
end;

function TBib.DatasParaLabel(DataI, DataF: string): string;
begin
  Result := '';
  if Length(DataI) = 10 then
    Result := 'desde ' + DataI;
  if Length(DataF) = 10 then
    Result := Trim(Result + ' até ' + DataF);
end;

function TBib.PageIndexFromTabIndex(pc: TPageControl; TabIndex: Integer):
  Integer;
var
  I, iVisibleTabs: Integer;
begin
  // Tabs doesn't contain hidden TabSheets so the index
  // needs to be adjusted to account for any hidden pages.

  // Result := TabIndex;   // to follow the original idea, uncomment this line and comment the next one
  Result := -1;
  iVisibleTabs := 0;
  for I := 0 to pc.PageCount - 1 do
  begin
    if pc.Pages[I].TabVisible then
    begin
      Inc(iVisibleTabs);
      // if we've found a (TabIndex+1)th visible page, then that's it
      if iVisibleTabs > TabIndex then
      begin
        Result := I;
        Break;
      end;
    end;
  end;
end;

function TBib.HexToTColor(sColor: string): TColor;
begin
  Result := RGB(StrToInt('$' + Copy(sColor, 1, 2)),
    StrToInt('$' + Copy(sColor, 3, 2)),
    StrToInt('$' + Copy(sColor, 5, 2)));
end;

function TBib.Arredondar(Valor: Extended; Dec: Integer): Extended;
var
  Valor1,
    Numero1,
    Numero2,
    Numero3: Extended;
begin
  Valor1 := Exp(Ln(10) * (Dec + 1));
  Numero1 := Int(Valor * Valor1);
  Numero2 := (Numero1 / 10);
  Numero3 := Round(Numero2);
  Result := (Numero3 / (Exp(Ln(10) * Dec)));
end;

function TBib.RoundTo2(const AValue: Double; const ADigit: TRoundToRange):
  Double;
var
  LFactor: Double;
begin
  LFactor := IntPower(10, ADigit);
  Result := Round((AValue / LFactor) + 0.05) * LFactor;
end;

function TBib.InverteString(const Str: string): string;
var
  i, len: Integer;
begin
  len := Length(Str);
  SetLength(Result, len);
  for i := len downto 1 do
    Result[len - i + 1] := Str[i];
end;

function TVariantMap.contem(Key: Variant): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Length(FKeys) - 1 do
    if FKeys[i] = Key then
    begin
      Result := True;
      Break;
    end;
end;

function TVariantMap.count: integer;
begin
  result := length(FKeys);
end;

{ TObjectMap }

function TObjectMap.addValue(Key: Variant; Value: TObject): Integer;
var
  i: Integer;
begin
  i := Length(FKeys);
  SetLength(FKeys, i + 1);
  SetLength(FValues, i + 1);
  FKeys[i] := Key;
  FValues[i] := Value;
  Result := i;
end;

procedure TObjectMap.Clear;
begin
  SetLength(Self.FKeys, 0);
  SetLength(Self.FValues, 0);
end;

constructor TObjectMap.Create;
begin
  inherited;
  Clear;
end;

function TObjectMap.getKeys: TVariantKeys;
var
  chaves: TVariantKeys;
  i: Integer;
begin
  chaves := TVariantKeys.Create;
  for i := 0 to length(FKeys) - 1 do
  begin
    SetLength(chaves.keys, length(chaves.keys) + 1);
    chaves.keys[Length(chaves.keys) - 1] := FKeys[i];
  end;

  Result := chaves;
end;

function TObjectMap.getValue(Key: Variant): TObject;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Length(FKeys) - 1 do
    if FKeys[i] = Key then
    begin
      Result := FValues[i];
      Break;
    end;
end;

// Esquema para instanciar a mesma query várias vezes ao mesmo tempo (INÍCIO)

function TBib.executaQueryString(sql: string): TOracleDataSet1;
var
  query: TOracleDataSet1;
begin
  query := TOracleDataSet1.Create(nil);
  query.Session := DMOracle.DBCemapa;
  query.Close;
  query.SQL.Text := sql;
  query.open;

  Result := query;
end;

function TBib.executaQuery(var queryBase: TOracleDataSet1; abrir: Boolean =
  False): TOracleDataSet1;
var
  query: TOracleDataSet1;
begin
  query := TOracleDataSet1.Create(nil);
  query.Session := DMOracle.DBCemapa;
  query.Variables := queryBase.Variables;
  query.Close;
  query.SQL := queryBase.SQL;
  if abrir then
    query.open;

  Result := query;
end;

procedure TBib.fechaQuery(var query: TOracleDataSet1);
begin
  query.Close;
  query.Free;
end;

function TBib.pegaValor(var query: TOracleDataSet1; campo: string): Variant;
begin
  if query.FieldByName(campo).IsNull then
    Result := ''
  else
    Result := query.FieldByName(campo).Value;
end;

function TBib.eNulo(var query: TOracleDataSet1; campo: string): Boolean;
begin
  Result := query.FieldByName(campo).IsNull;
end;

// Esquema para instanciar a mesma query várias vezes ao mesmo tempo (FIM)

procedure TBib.LimpaParams(DataS: TClientDataSet);
var
  i: Integer;
begin
  for i := 0 to DataS.Params.Count - 1 do
    DataS.Params.Items[i].Value := null;
end;

procedure TBib.OrdenaQuery(Query: TOracleDataSet1; Field: string; Close: boolean
  = false; Open: boolean = false);
var
  wSQL, wSQLnova: string;
begin
  wSQL := UpperCase(query.SQL.Text);
  if Pos('ORDER BY', wSQL) > 0 then
  begin
    wSQLnova := Copy(wSQL, 1, Pos('ORDER BY', wSQL) + 7);
    wSQLnova := wSQLNova + ' ' + field;
    if close then
      query.Close;
    query.SQL.Clear;
    query.SQL.Add(wSQLNova);
    if open then
      query.Open;
  end;
end;

function TBib.geraStringFiliais(filiais: TStrings; separador: string = ', '):
  string;
var
  i: Integer;
  str: string;
begin
  if filiais.Count = 0 then
  begin
    Result := '';
    Exit;
  end;

  str := '';
  for i := 0 to filiais.Count - 1 do
  begin
    try
      StrToInt(filiais[i]);
      str := str + filiais[i];
    except
      str := str + '0';
    end;
    if i < filiais.Count - 1 then
      str := str + separador;
  end;
  str := '(' + str + ')';

  Result := str;
end;

function TBib.Colocaaspanastring(pCaracteres: string): string;
var
  i: Integer;
begin
  Result := Chr(39);
  for i := 1 to Length(pCaracteres) do
  begin
    if pCaracteres[i] = ',' then
      Result := Result + Chr(39) + pCaracteres[i] + Chr(39)
    else
      Result := Result + pCaracteres[i];
  end;
  Result := Result + Chr(39);
end;

function TBib.CalculaHorasProducao(DiaInicial, DiaFinal: TDateTime): Real;
var
  wTotal, wHorasTrabalhadas: Real;
  wDiaI, wDiaF, wFimManhaI, wFimManhaF: tDatetime;
  DiaSem: string;
  wdia1, wdia2: string;
begin
  wTotal := 0;
  wFimManhaI := StrToDateTime(FormatDateTime('dd/MM/yyyy', DiaInicial) +
    ' 12:00:00');
  wFimManhaF := StrToDatetime(FormatDateTime('dd/MM/yyyy', DiaFinal) +
    '12:00:00');

  //calcula o tempo total decorrido entre inicio e fim do processo
  wTotal := bib.HorasEntre(DiaInicial, DiaFinal);

  wdia1 := DateTimetoStr(Diainicial);
  wdia2 := datetimetostr(DiaFinal);

  wDiaI := Trunc(DiaInicial);
  wDiaF := Trunc(DiaFinal);
  if wDiaI = wDiaF then
  begin
    if ((DiaInicial <= wFimManhaI) and (DiaFinal > wFimManhaI)) then
      wTotal := wTotal - 1.5;
  end
  else
  begin
    while wDiaI <= DiaFinal do
    begin
      DiaSem := Bib.DataPorExtenso(wDiaI);
      if ((DiaSem = 'Sábado') or (DiaSem = 'Domingo')) then
        //desconta os fins de semana do tempo
        wTotal := wTotal - 24
      else if wDiaI = Trunc(DiaInicial) then
      begin
        if DiaInicial <= wFimManhaI then
          wTotal := wTotal - 7.5
        else
          wTotal := wTotal - 6;
      end
      else if wDiaI = Trunc(DiaFinal) then
      begin
        if DiaFinal <= wFimManhaF then
          wTotal := wTotal - 7.5
        else
          wTotal := wTotal - 9;
      end
      else
        wTotal := wTotal - 15;
      wDiaI := wDiaI + 1;
    end;
  end;
  result := wTotal;

end;

function TBib.GetDataCancelamentoNfe(ChaveAcesso: string): TDateTime;
var
  buscador: TBuscador;
  wSql, wXmlAux, wData, wDataAux: string;
  wXml: TStrings;
  xmlDoc: IXMLDocument;
  s: TStringStream;
  data: TdateTime;
  formatsettings: TFormatSettings;
begin
  wData := '';
  wXmlAux := '';
  if (copy(ChaveAcesso, 1, 3) = 'NFe') then
    ChaveAcesso := copy(ChaveAcesso, 4, Length(ChaveAcesso));

  wSql :=
    'SELECT DBMS_LOB.SUBSTR(DESC_XML_RETORNO_CANCELAMENTO, 4000, 1) FROM TB_NF_ELETRONICA ';
  wSql := wSql + 'WHERE DESC_CHAVE_ACESSO = ' + quotedStr(ChaveAcesso);
  buscador := TBuscador.Create;
  xmlDoc := TXMLDocument.Create(nil);
  wXml := TStrings.Create;
  buscador.Limpa;
  buscador.Adiciona(wSql);
  buscador.Buscar;
  wXmlAux := buscador.Proximo;
  if Trim(wXmlAux) <> '' then
  begin
    s := TStringStream.Create(Trim(wXmlAux));
    s.Position := 0;
    xmlDoc.XML.LoadFromStream(s);
    xmlDoc.Active := true;

    wData := xmlDoc.DocumentElement.ChildNodes.Nodes['infCanc'].ChildNodes.
      Nodes['dhRecbto'].Text;
    wDataAux := copy(wData, 9, 2) + '/' + copy(wData, 6, 2) + '/' +
      copy(wData, 1, 4);
    wDataAux := wDataAux + ' ';
    wDataAux := wDataAux + copy(wData, 12, 2) + ':' + copy(wData, 15, 2) +
      ':' + copy(wData, 18, 2);
    data := StrToDateTime(wDataAux);
    result := data;
  end
  else
    raise Exception.Create('Nenhuma nota encontrada com a Chave de Acesso' +
      ChaveAcesso);

  result := Date;
end;

function TBib.FormataCNPJ(Numero: string): string;
var
  tmp, resultado: string;
  indx, indx1: integer;
begin
  if Length(Numero) < 12 then
  begin
    result := '';
    exit;
  end;

  for indx := 1 to Length(Numero) do
  begin
    if Numero[indx] in ['0'..'9'] then
      resultado := resultado + Numero[indx];
  end;
  if Length(Resultado) < 14 then
    resultado := StringOfChar('0', 14 - Length(Resultado)) + resultado;
  tmp := Copy(resultado, 1, 2) + '.';
  tmp := tmp + Copy(resultado, 3, 3) + '.';
  tmp := tmp + Copy(resultado, 6, 3) + '/';
  tmp := tmp + Copy(resultado, 9, 4) + '-' + Copy(resultado, 13, 2);
  Result := tmp;
end;

function TBib.FormataCPF(Numero: string): string;
var
  tmp, resultado: string;
  indx, indx1: integer;
begin
  if Length(Numero) < 10 then
  begin
    result := '';
    exit;
  end;

  for indx := 1 to Length(Numero) do
  begin
    if Numero[indx] in ['0'..'9'] then
      resultado := resultado + Numero[indx];
  end;
  if Length(Resultado) < 11 then
    resultado := StringOfChar('0', 11 - Length(Resultado)) + resultado;
  tmp := Copy(resultado, 1, 3) + '.';
  tmp := tmp + Copy(resultado, 4, 3) + '.';
  tmp := tmp + Copy(resultado, 7, 3) + '-';
  tmp := tmp + Copy(resultado, 10, 2);
  Result := tmp;
end;

function TBib.FormataCNPJ_CPF(Numero: string): string;
var
  indx, tamanho: integer;
  resultado: string;
begin
  for indx := 1 to Length(Numero) do
  begin
    if Numero[indx] in ['0'..'9'] then
      resultado := resultado + Numero[indx];
  end;

  if (Length(resultado) > 11) then
    resultado := FormataCNPJ(resultado)
  else
    resultado := FormataCPF(resultado);
  result := resultado;
end;

procedure TBib.setModelo(pQuery: TOracleDataSet1; var pLabel: TLabel);
var
  modelo: string;
begin
  modelo := '';
  // Busca Descrição do modelo da serie
  with DMOracle do
  begin
    if (not pQuery.FieldByName('COD_SERIE_MODELO').IsNull) then
    begin
      modelo := Trim(BuscaNome('SELECT DESC_SERIE_MODELO FROM TB_SERIE_MODELO',
        'COD_SERIE_MODELO = ' +
          quotedStr(pQuery.FieldByName('COD_SERIE_MODELO').Value)));
      if modelo <> '' then
      begin
        pLabel.Caption := 'Modelo:';
        pLabel.Caption := pLabel.Caption + ' ' + modelo;
      end
      else
        pLabel.Caption := 'Modelo Inexistente';
    end;
  end;
end;

function TBib.verificaSerieModelo(filial: Integer; serie: string): string;
var
  qtde: string;
begin
  qtde := DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_SERIE', 'COD_FILIAL = ' +
    IntToStr(filial) +
    ' AND COD_SERIE = ' + QuotedStr(serie));
  if StrToInt(qtde) > 1 then
    result := ''
  else
    result := DmOracle.BuscaNome('SELECT COD_SERIE_MODELO FROM TB_SERIE',
      'COD_FILIAL = ' + IntToStr(filial) +
      ' AND COD_SERIE = ' + QuotedStr(serie));
end;

function TBib.CountSubExt(str, subStr: string): Integer;
var
  i, posicao: integer;
begin
  result := 0;
  posicao := PosEx(SubStr, str, 0);
  while posicao > 0 do
  begin
    result := result + 1;
    posicao := PosEx(SubStr, str, posicao + length(subStr));
  end;
end;

function TBib.ChecaMD5Query(pQuery: TOracleDataSet1): Boolean;
var
  wMD5, wValor: string;
  i: Integer;
  wPK: string;
  wPKValor: Variant;
begin
  //Esta função checa se o valor do MD5 no B.D. bate com o valor MD5 calculado
  //A query deve necessariamente ter apenas 1 registro, pois a checagem
  //é feita linha por linha.

  wPK := pQuery.FieldList[0].FieldName;
  wPKValor := pQuery.FieldList[0].Value;
  pQuery.Fields.Clear;
  pQuery.Close;
  pQuery.SetVariable(wPK, wPKValor);
  PQuery.Open;
  pQuery.FieldList.Create(pQuery);
  pQuery.FieldList.Update;

  if pQuery.RecordCount > 1 then
  begin
    MessageDlg('Não foi possível checar o código MD5. Query possui mais de 1 registro.',
      mtError, [mbok], 0);
    Abort;
  end;
  if pQuery.RecordCount = 1 then
  begin
    if pQuery.FieldByName('DESC_HASH_MD5').IsNull then
      wMD5 := ''
    else
      wMD5 := pQuery.FieldByName('DESC_HASH_MD5').Value;
    wValor := '';
    for i := 0 to pQuery.FieldCount - 1 do
    begin
      if (pQuery.Fields[i].FieldName = 'DESC_HASH_MD5') or
        pQuery.Fields[i].IsNull then
        continue
      else
      begin
        wValor := wValor + Trim(pQuery.Fields[i].AsString);
      end;
    end;
    result := (wMD5 = bib.GetHashStringMD5(wValor));
  end
  else
    result := false;
  if pQuery.RecordCount = 0 then
    result := true;
end;

function TBib.GeraMD5Query(pQuery: TOracleDataSet1;
  pTabela: string; pCommit: Boolean = true; pPersiste: Boolean = true): string;
var
  i: Integer;
  wTag: Boolean;
  wValor, wMD5, wChave, wValorChave: string;
  wPK: string;
  wPKValor: Variant;
begin
  //Procedure que gera o código MD5 do registro inserido.
  //Deve ser chamada logo após a inserção do registro na tabela.
  //Gera o hash md5 de acordo com os dados inseridos e faz update para persistir na tabela.
  wTag := false;
  wValor := '';
  wPK := pQuery.FieldList[0].FieldName;
  wPKValor := pQuery.FieldList[0].Value;
  pQuery.Fields.Clear;
  pQuery.Close;
  pQuery.SetVariable(wPK, wPKValor);
  PQuery.Open;
  pQuery.FieldList.Create(pQuery);
  pQuery.FieldList.Update;

  if pQuery.RecordCount > 1 then
  begin
    MessageDlg('Não foi possível gerar o código MD5. Query possui mais de 1 registro.',
      mtError, [mbok], 0);
    Abort;
  end;
  for i := 0 to pQuery.FieldCount - 1 do
  begin
    if (pQuery.Fields[i].FieldName = 'DESC_HASH_MD5') or
      (pQuery.Fields[i].IsNull) then
      continue;
    if pQuery.Fields[i].FieldName = wPK then
    begin
      wTag := true;
      wChave := pQuery.Fields[i].FieldName;
      if pQuery.Fields[i].DataType <> ftString then
        wValorChave := pQuery.Fields[i].AsString
      else
        wValorChave := QuotedStr(pQuery.Fields[i].AsString);
    end;
    wValor := wValor + Trim(pQuery.Fields[i].AsString);
  end;
  if not wTag then
  begin
    MessageDlg('Não foi possível gerar o código MD5. Chave primária não informada para Query.',
      mtError, [mbok], 0);
    Abort;
  end;
  wMD5 := bib.GetHashStringMD5(wValor);
  if pPersiste then
    DMOracle.ExecutaSql('UPDATE ' + pTabela +
      ' SET DESC_HASH_MD5 =' + QuotedStr(wMD5) + ' WHERE ' +
      wChave + ' = ' + wValorChave, pCommit);
  Result := wMD5;
end;

function TBib.GeraMapaDeMD5(pDtReferencia: TDate): TVariantMap;
var
  QProduto, QEstoqueDiario, QECF, QFilial, QRegTipo60M, QRegTipo60A,
    QNotaCab, QNotaItem, QCadastro, QTributacao, QDemaisDoc,
    QPagamento, QEstoqueDiarioItem: TOracleDataSet1;

  QProdutoLinha, QECFLinha, QFilialLinha, QRegTipo60MLinha, QRegTipo60ALinha,
    QNotaCabLinha, QNotaItemLinha, QCadastroLinha, QTributacaoLinha,
      QDemaisDocLinha,
    QPagamentoLinha: TOracleDataSet1;

  wVarList: TStringList;
  wHash, wTeste: string;
  wRetorno: TVariantMap;
begin
  //inicializa as querys
  QProduto := TOracleDataSet1.Create(Application);
  QProduto.Session := DMOracle.DBCemapa;
  QProdutoLinha := TOracleDataSet1.Create(Application);
  QProdutoLinha.Session := DMOracle.DBCemapa;
  QEstoqueDiario := TOracleDataSet1.Create(Application);
  QEstoqueDiario.Session := DMOracle.DBCemapa;
  QEstoqueDiarioItem := TOracleDataSet1.Create(Application);
  QEstoqueDiarioItem.Session := DMOracle.DBCemapa;
  QECF := TOracleDataSet1.Create(Application);
  QECF.Session := DMOracle.DBCemapa;
  QECFLinha := TOracleDataSet1.Create(Application);
  QECFLinha.Session := DMOracle.DBCemapa;
  QFilial := TOracleDataSet1.Create(Application);
  QFilial.Session := DMOracle.DBCemapa;
  QFilialLinha := TOracleDataSet1.Create(Application);
  QFilialLinha.Session := DMOracle.DBCemapa;
  QRegTipo60M := TOracleDataSet1.Create(Application);
  QRegTipo60M.Session := DMOracle.DBCemapa;
  QRegTipo60MLinha := TOracleDataSet1.Create(Application);
  QRegTipo60MLinha.Session := DMOracle.DBCemapa;
  QRegTipo60A := TOracleDataSet1.Create(Application);
  QRegTipo60A.Session := DMOracle.DBCemapa;
  QRegTipo60ALinha := TOracleDataSet1.Create(Application);
  QRegTipo60ALinha.Session := DMOracle.DBCemapa;
  QNotaCab := TOracleDataSet1.Create(Application);
  QNotaCab.Session := DMOracle.DBCemapa;
  QNotaCabLinha := TOracleDataSet1.Create(Application);
  QNotaCabLinha.Session := DMOracle.DBCemapa;
  QNotaItem := TOracleDataSet1.Create(Application);
  QNotaItem.Session := DMOracle.DBCemapa;
  QNotaItemLinha := TOracleDataSet1.Create(Application);
  QNotaItemLinha.Session := DMOracle.DBCemapa;
  QTributacao := TOracleDataSet1.Create(Application);
  QTributacao.Session := DMOracle.DBCemapa;
  QTributacaoLinha := TOracleDataSet1.Create(Application);
  QTributacaoLinha.Session := DMOracle.DBCemapa;
  QDemaisDoc := TOracleDataSet1.Create(Application);
  QDemaisDoc.Session := DMOracle.DBCemapa;
  QDemaisDocLinha := TOracleDataSet1.Create(Application);
  QDemaisDocLinha.Session := DMOracle.DBCemapa;
  QPagamento := TOracleDataSet1.Create(Application);
  QPagamento.Session := DMOracle.DBCemapa;
  QPagamentoLinha := TOracleDataSet1.Create(Application);
  QPagamentoLinha.Session := DMOracle.DBCemapa;
  wVarList := TStringList.Create;
  wRetorno := TVariantMap.Create;

  //SQLs

  QEstoqueDiario.SQL.Add('SELECT COD_ESTOQUE_DIARIO_CAB, ');
  QEstoqueDiario.SQL.Add('DESC_HASH_MD5 FROM TB_ESTOQUE_DIARIO_CAB ');
  QEstoqueDiario.SQL.Add('WHERE TO_DATE(DT_ESTOQUE,' + QuotedStr('DDMMYY') +
    ') = TO_DATE(:DT_REFERENCIA,' + QuotedStr('DDMMYY') + ')');
  QEstoqueDiario.DeclareAndSet(':DT_REFERENCIA', otString,
    FormatDateTime('DDMMYY', pDtReferencia));
  QEstoqueDiario.ExecSQL;
  QEstoqueDiario.Open;
  QEstoqueDiario.FieldList.Create(QEstoqueDiario);
  QEstoqueDiario.FieldList.Update;
  if QEstoqueDiario.RecordCount > 0 then
  begin
    while not QEstoqueDiario.Eof do
    begin
      wVarList.Add(QEstoqueDiario.Fields[0].Text);
      QEstoqueDiario.Next;
    end;
    wVarList.Delimiter := ',';
    QEstoqueDiarioItem.SQL.Add('SELECT DESC_HASH_MD5 FROM TB_ESTOQUE_DIARIO_ITEM ');
    QEstoqueDiarioItem.SQL.Add('WHERE COD_ESTOQUE_DIARIO_CAB IN (:COD_ESTOQUE_DIARIO)');
    QEstoqueDiarioItem.DeclareAndSet(':COD_ESTOQUE_DIARIO', otInteger,
      wVarList.DelimitedText);
    QEstoqueDiarioItem.ExecSQL;
    QEstoqueDiarioItem.Open;
    QEstoqueDiarioItem.FieldList.Create(QEstoqueDiarioItem);
    QEstoqueDiarioItem.FieldList.Update;
  end
  else
  begin
    QEstoqueDiarioItem.SQL.Add('SELECT DESC_HASH_MD5 FROM TB_ESTOQUE_DIARIO_ITEM ');
    QEstoqueDiarioItem.SQL.Add('WHERE 1=2'); //não deve trazer resultado
    QEstoqueDiarioItem.ExecSQL;
    QEstoqueDiarioItem.Open;
    QEstoqueDiarioItem.FieldList.Create(QEstoqueDiarioItem);
    QEstoqueDiarioItem.FieldList.Update;
  end;
  wVarList.Clear;
  QRegTipo60M.SQL.Add('SELECT COD_REGISTRO_MESTRE,DESC_HASH_MD5 FROM TB_REGISTRO_TIPO60_MESTRE ');
  QRegTipo60M.SQL.Add('WHERE DT_EMISSAO = :DT_REFERENCIA');
  QRegTipo60M.DeclareAndSet(':DT_REFERENCIA', otDate, pDtReferencia);
  QRegTipo60M.ExecSQL;
  QRegTipo60M.Open;
  QRegTipo60M.FieldList.Create(QRegTipo60M);
  QRegTipo60M.FieldList.Update;
  QRegTipo60A.SQL.Add('SELECT COD_REGISTRO_ANALITICO,DESC_HASH_MD5 FROM TB_REGISTRO_TIPO60_ANALITICO ');
  QRegTipo60A.SQL.Add('WHERE DT_EMISSAO = :DT_REFERENCIA');
  QRegTipo60A.DeclareAndSet(':DT_REFERENCIA', otDate, pDtReferencia);
  QRegTipo60A.ExecSQL;
  QRegTipo60A.Open;
  QRegTipo60A.FieldList.Create(QRegTipo60A);
  QRegTipo60A.FieldList.Update;

  QNotaCab.SQL.Add('SELECT COD_NOTA_CAB, DESC_HASH_MD5 FROM TB_NOTA_CAB ');
  QNotaCab.SQL.Add('WHERE TO_DATE(DT_EMISSAO,' + QuotedStr('DD/MM/YYYY') + ')' +
    '= TO_DATE(:DT_REFERENCIA,' + QuotedStr('DD/MM/YYYY') + ')');
  QNotaCab.DeclareAndSet(':DT_REFERENCIA', otDate, pDtReferencia);
  QNotaCab.ExecSQL;
  QNotaCab.Open;
  QNotaCab.FieldList.Create(QNotaCab);
  QNotaCab.FieldList.Update;
  if QNotaCab.RecordCount > 0 then
  begin
    while not QNotaCab.Eof do
    begin
      wVarList.Add(QuotedStr(QNotaCab.Fields[0].Text));
      QNotaCab.Next;
    end;
    wVarList.Delimiter := ',';
    QNotaItem.SQL.Add('SELECT COD_NOTA_ITEM,DESC_HASH_MD5 FROM TB_NOTA_ITEM ');
    QNotaItem.SQL.Add('WHERE TO_CHAR(COD_NOTA_CAB) IN (' +
      wVarList.DelimitedText + ')');
    QNotaItem.ExecSQL;
    QNotaItem.Open;
    QNotaItem.FieldList.Create(QNotaItem);
    QNotaItem.FieldList.Update;
    QPagamento.SQL.Add('SELECT COD_PAGAMENTO,DESC_HASH_MD5 FROM TB_PAGAMENTO ');
    QPagamento.SQL.Add('WHERE TO_CHAR(COD_NOTA_CAB) IN (' +
      wVarList.DelimitedText + ')');
    QPagamento.ExecSQL;
    QPagamento.Open;
    QPagamento.FieldList.Create(QPagamento);
    QPagamento.FieldList.Update;
  end
  else
  begin
    //sqls não devem trazer resultados
    QNotaItem.SQL.Add('SELECT COD_NOTA_ITEM,DESC_HASH_MD5 FROM TB_NOTA_ITEM ');
    QNotaItem.SQL.Add('WHERE 1=2');
    QNotaItem.ExecSQL;
    QNotaItem.Open;
    QNotaItem.FieldList.Create(QNotaItem);
    QNotaItem.FieldList.Update;
    QPagamento.SQL.Add('SELECT COD_PAGAMENTO,DESC_HASH_MD5 FROM TB_PAGAMENTO ');
    QPagamento.SQL.Add('WHERE 1=2');
    QPagamento.ExecSQL;
    QPagamento.Open;
    QPagamento.FieldList.Create(QPagamento);
    QPagamento.FieldList.Update;
  end;
  wVarList.Clear;
  QDemaisDoc.SQL.Add('SELECT COD_DEMAIS_DOCUMENTOS_ECF,DESC_HASH_MD5 FROM TB_DEMAIS_DOCUMENTOS_ECF ');
  QDemaisDoc.SQL.Add('WHERE TO_CHAR(DT_HR_FINAL_EMISSAO,' +
    QuotedStr('DD/MM/YYYY') +
    ') = TO_CHAR(:DT_REFERENCIA,' + QuotedStr('DD/MM/YYYY') + ')');
  QDemaisDoc.DeclareAndSet(':DT_REFERENCIA', otDate, pDtReferencia);
  QDemaisDoc.ExecSQL;
  QDemaisDoc.Open;
  QDemaisDoc.FieldList.Create(QDemaisDoc);
  QDemaisDoc.FieldList.Update;

  //SQLs sem filtro por data

  QProduto.SQL.Add('SELECT COD_PRODUTO, DESC_HASH_MD5 FROM TB_PRODUTO');
  QProduto.ExecSQL;
  QProduto.Open;
  QProduto.FieldList.Create(QProduto);
  QProduto.FieldList.Update;

  QECF.SQL.Add('SELECT NUM_SERIE,DESC_HASH_MD5 FROM TB_ECF');
  QECF.ExecSQL;
  QECF.Open;
  QECF.FieldList.Create(QECF);
  QECF.FieldList.Update;
  QFilial.SQL.Add('SELECT COD_FILIAL,DESC_HASH_MD5 FROM TB_FILIAL');
  QFilial.ExecSQL;
  QFilial.Open;
  QFilial.FieldList.Create(QFilial);
  QFilial.FieldList.Update;
  QTributacao.SQL.Add('SELECT COD_TRIBUTACAO,DESC_HASH_MD5 FROM TB_TRIBUTACAO');
  QTributacao.ExecSQL;
  QTributacao.Open;
  QTributacao.FieldList.Create(QFilial);
  QTributacao.FieldList.Update;

  //Gera o código Hash
  wHash := '';
  if QProduto.RecordCount > 0 then
  begin
    while not QProduto.Eof do
    begin
      QProdutoLinha.Close;
      QProdutoLinha.Sql.Clear;
      QProdutoLinha.Sql.Add('SELECT * FROM TB_PRODUTO WHERE ');
      QProdutoLinha.Sql.Add('COD_PRODUTO = :COD_PRODUTO');
      QProdutoLinha.DeclareAndSet(':COD_PRODUTO', otInteger,
        QProduto.FieldByName('COD_PRODUTO').Value);
      QProdutoLinha.Open;
      wHash := wHash +
        GeraMD5Query(QProdutoLinha, 'TB_PRODUTO', false, false);
      QProduto.Next;
    end;
    wRetorno.addValue('TB_PRODUTO', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if false then //não fazer
  begin
    if QEstoqueDiario.RecordCount > 0 then
    begin
      QEstoqueDiario.First;
      while not QEstoqueDiario.Eof do
      begin
        if Trim(QEstoqueDiario.Fields[1].Text) = '' then
          QEstoqueDiario.Fields[1].Text := 'AAA';
        wHash := wHash +
          QEstoqueDiario.Fields[1].Text;
        QEstoqueDiario.Next;
      end;
      wRetorno.addValue('TB_ESTOQUE_DIARIO_CAB', GetHashStringMD5(wHash));
    end;
    wHash := '';
    if QEstoqueDiarioItem.RecordCount > 0 then
    begin
      while not QEstoqueDiarioItem.Eof do
      begin
        if Trim(QEstoqueDiarioItem.Fields[0].Text) = '' then
          QEstoqueDiarioItem.Fields[0].Text := 'AAA';
        wHash := wHash +
          QEstoqueDiarioItem.Fields[0].Text;
        QEstoqueDiarioItem.Next;
      end;
      wRetorno.addValue('TB_ESTOQUE_DIARIO_ITEM', GetHashStringMD5(wHash));
    end;
  end;
  wHash := '';
  if QECF.RecordCount > 0 then
  begin
    while not QECF.Eof do
    begin
      QECFLinha.Close;
      QECFLinha.Sql.Clear;
      QECFLinha.Sql.Add('SELECT * FROM TB_ECF WHERE ');
      QECFLinha.Sql.Add('NUM_SERIE = :NUM_SERIE');
      QECFLinha.DeclareAndSet(':NUM_SERIE', otString,
        QECF.FieldByName('NUM_SERIE').Value);
      QECFLinha.Open;
      wHash := wHash +
        GeraMD5Query(QECFLinha, 'NUM_SERIE', false, false);
      QECF.Next;
    end;
    wRetorno.addValue('TB_ECF', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QFilial.RecordCount > 0 then
  begin
    while not QFilial.Eof do
    begin
      QFilialLinha.Close;
      QFilialLinha.Sql.Clear;
      QFilialLinha.Sql.Add('SELECT * FROM TB_FILIAL WHERE ');
      QFilialLinha.Sql.Add('COD_FILIAL = :COD_FILIAL');
      QFilialLinha.DeclareAndSet(':COD_FILIAL', otInteger,
        QFilial.FieldByName('COD_FILIAL').Value);
      QFilialLinha.Open;
      wHash := wHash +
        GeraMD5Query(QFilialLinha, 'COD_FILIAL', false, false);
      QFilial.Next;
    end;
    wRetorno.addValue('TB_FILIAL', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QRegTipo60M.RecordCount > 0 then
  begin
    while not QRegTipo60M.Eof do
    begin
      QRegTipo60MLinha.Close;
      QRegTipo60MLinha.Sql.Clear;
      QRegTipo60MLinha.Sql.Add('SELECT * FROM TB_REGISTRO_TIPO60_MESTRE WHERE ');
      QRegTipo60MLinha.Sql.Add('COD_REGISTRO_MESTRE = :COD_REGISTRO_MESTRE');
      QRegTipo60MLinha.DeclareAndSet(':COD_REGISTRO_MESTRE', otInteger,
        QRegTipo60M.FieldByName('COD_REGISTRO_MESTRE').Value);
      QRegTipo60MLinha.Open;
      wHash := wHash +
        GeraMD5Query(QRegTipo60MLinha, 'TB_REGISTRO_TIPO60_MESTRE', false,
          false);
      QRegTipo60M.Next;
    end;
    wRetorno.addValue('TB_REGISTRO_TIPO60_MESTRE', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QRegTipo60A.RecordCount > 0 then
  begin
    while not QRegTipo60A.Eof do
    begin
      QRegTipo60ALinha.Close;
      QRegTipo60ALinha.Sql.Clear;
      QRegTipo60ALinha.Sql.Add('SELECT * FROM TB_REGISTRO_TIPO60_ANALITICO WHERE ');
      QRegTipo60ALinha.Sql.Add('COD_REGISTRO_ANALITICO = :COD_REGISTRO_ANALITICO');
      QRegTipo60ALinha.DeclareAndSet(':COD_REGISTRO_ANALITICO', otInteger,
        QRegTipo60A.FieldByName('COD_REGISTRO_ANALITICO').Value);
      QRegTipo60ALinha.Open;
      wHash := wHash +
        GeraMD5Query(QRegTipo60ALinha, 'TB_REGISTRO_TIPO60_ANALITICO', false,
          false);
      QRegTipo60A.Next;
    end;
    wRetorno.addValue('TB_REGISTRO_TIPO60_ANALITICO', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QNotaCab.RecordCount > 0 then
  begin
    QNotaCab.First;
    while not QNotaCab.Eof do
    begin
      QNotaCabLinha.Close;
      QNotaCabLinha.Sql.Clear;
      QNotaCabLinha.Sql.Add('SELECT * FROM TB_NOTA_CAB WHERE ');
      QNotaCabLinha.Sql.Add('COD_NOTA_CAB = :COD_NOTA_CAB');
      QNotaCabLinha.DeclareAndSet(':COD_NOTA_CAB', otInteger,
        QNotaCab.FieldByName('COD_NOTA_CAB').Value);
      QNotaCabLinha.Open;
      wHash := wHash +
        GeraMD5Query(QNotaCabLinha, 'TB_NOTA_CAB', false, false);
      QNotaCab.Next;
    end;
    wRetorno.addValue('TB_NOTA_CAB', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QNotaItem.RecordCount > 0 then
  begin
    while not QNotaItem.Eof do
    begin
      QNotaItemLinha.Close;
      QNotaItemLinha.Sql.Clear;
      QNotaItemLinha.Sql.Add('SELECT * FROM TB_NOTA_ITEM WHERE ');
      QNotaItemLinha.Sql.Add('COD_NOTA_ITEM = :COD_NOTA_ITEM');
      QNotaItemLinha.DeclareAndSet(':COD_NOTA_ITEM', otInteger,
        QNotaItem.FieldByName('COD_NOTA_ITEM').Value);
      QNotaItemLinha.Open;
      wHash := wHash +
        GeraMD5Query(QNotaItemLinha, 'TB_NOTA_ITEM', false, false);
      QNotaItem.Next;
    end;
    wRetorno.addValue('TB_NOTA_ITEM', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QTributacao.RecordCount > 0 then
  begin
    while not QTributacao.Eof do
    begin
      QTributacaoLinha.Close;
      QTributacaoLinha.Sql.Clear;
      QTributacaoLinha.Sql.Add('SELECT * FROM TB_TRIBUTACAO WHERE ');
      QTributacaoLinha.Sql.Add('COD_TRIBUTACAO = :COD_TRIBUTACAO');
      QTributacaoLinha.DeclareAndSet(':COD_TRIBUTACAO', otInteger,
        QTributacao.FieldByName('COD_TRIBUTACAO').Value);
      QTributacaoLinha.Open;
      wHash := wHash +
        GeraMD5Query(QTributacaoLinha, 'TB_NOTA_ITEM', false, false);
      QTributacao.Next;
    end;
    wRetorno.addValue('TB_TRIBUTACAO', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QDemaisDoc.RecordCount > 0 then
  begin
    while not QDemaisDoc.Eof do
    begin
      QDemaisDocLinha.Close;
      QDemaisDocLinha.Sql.Clear;
      QDemaisDocLinha.Sql.Add('SELECT * FROM TB_DEMAIS_DOCUMENTOS_ECF WHERE ');
      QDemaisDocLinha.Sql.Add('COD_DEMAIS_DOCUMENTOS_ECF = :COD_DEMAIS_DOCUMENTOS_ECF');
      QDemaisDocLinha.DeclareAndSet(':COD_DEMAIS_DOCUMENTOS_ECF', otInteger,
        QDemaisDoc.FieldByName('COD_DEMAIS_DOCUMENTOS_ECF').Value);
      QDemaisDocLinha.Open;
      wHash := wHash +
        GeraMD5Query(QDemaisDocLinha, 'TB_DEMAIS_DOCUMENTOS_ECF', false, false);
      QDemaisDoc.Next;
    end;
    wRetorno.addValue('TB_DEMAIS_DOCUMENTOS_ECF', GetHashStringMD5(wHash));
  end;
  wHash := '';
  if QPagamento.RecordCount > 0 then
  begin
    while not QPagamento.Eof do
    begin
      QPagamentoLinha.Close;
      QPagamentoLinha.Sql.Clear;
      QPagamentoLinha.Sql.Add('SELECT * FROM TB_PAGAMENTO WHERE ');
      QPagamentoLinha.Sql.Add('COD_PAGAMENTO = :COD_PAGAMENTO');
      QPagamentoLinha.DeclareAndSet(':COD_PAGAMENTO', otInteger,
        QPagamento.FieldByName('COD_PAGAMENTO').Value);
      QPagamentoLinha.Open;
      wHash := wHash +
        GeraMD5Query(QPagamentoLinha, 'TB_PAGAMENTO', false, false);
      QPagamento.Next;
    end;
    wRetorno.addValue('TB_PAGAMENTO', GetHashStringMD5(wHash));
  end;
  wHash := '';

  //teste  - apagar depois
  //if QProduto.RecordCount = 0 then
//  wTeste := 'produto/';
//  if QEstoqueDiario.RecordCount = 0 then
//    wTeste := wTeste + ' estoque diário/';
//  if QEstoqueDiarioItem.RecordCount = 0 then
//    wTeste := wTeste + ' estoque diário item/';
//  if QECF.RecordCount = 0 then
//    wTeste := wTeste + ' ecf/';
//  if qfilial.RecordCount = 0 then
//    wTeste := wTeste + ' filial/';
//  if QRegTipo60M.RecordCount = 0 then
//    wTeste := wTeste + ' tipo 60 M/';
//  if QRegTipo60A.RecordCount = 0 then
//    wTeste := wTeste + ' tipo 60 A/';
//  if QNotaCab.RecordCount = 0 then
//    wTeste := wTeste + ' nota cab/';
//  if QNotaItem.recordcount = 0 then
//    wTeste := wTeste + ' nota item/';
//  if QTributacao.RecordCount = 0 then
//    wTeste := wTeste + ' tributacao/';
//  if QDemaisDoc.RecordCount = 0 then
//    wTeste := wTeste + ' demais doc/';
//  if QPagamento.RecordCount = 0 then
//    wTeste := wTeste + ' pagamento';
//  ShowMessage('as seguintes querys não retornaram registros ' +
//    wTeste);

  QProduto.Free;
  QProduto := nil;
  QEstoqueDiario.Free;
  QEstoqueDiario := nil;
  QEstoqueDiarioItem.Free;
  QEstoqueDiarioItem := nil;
  QECF.Free;
  QECF := nil;
  QFilial.Free;
  QFilial := nil;
  QRegTipo60M.Free;
  QRegTipo60M := nil;
  QRegTipo60A.Free;
  QRegTipo60A := nil;
  QNotaCab.Free;
  QNotaCab := nil;
  QNotaItem.Free;
  QNotaItem := nil;
  QTributacao.Free;
  QTributacao := nil;
  QDemaisDoc.Free;
  QDemaisDoc := nil;
  QPagamento.Free;
  QPagamento := nil;

  QProdutoLinha.Free;
  QProdutoLinha := nil;
  QECFLinha.Free;
  QECFLinha := nil;
  QFilialLinha.Free;
  QFilialLinha := nil;
  QRegTipo60MLinha.Free;
  QRegTipo60MLinha := nil;
  QRegTipo60ALinha.Free;
  QRegTipo60ALinha := nil;
  QNotaCabLinha.Free;
  QNotaCabLinha := nil;
  QNotaItemLinha.Free;
  QNotaItemLinha := nil;
  QTributacaoLinha.Free;
  QTributacaoLinha := nil;
  QDemaisDocLinha.Free;
  QDemaisDocLinha := nil;
  QPagamentoLinha.Free;
  QPagamentoLinha := nil;

  Result := wRetorno;
end;

procedure TBib.setVariableOuNull(Query: TOracleDataSet1; Variavel: string;
  Valor: Variant);
var
  basicType: Integer;
begin
  {
    Types:
      256 : String,
      0 : Vazia,
      3 : Integer,
      7 : Date,
  }
  case VarType(Valor) of
    256:
      begin
        if VarToStr(Valor) = '' then
          Query.SetVariable(Variavel, Null)
        else
          Query.SetVariable(Variavel, VarToStr(Valor));
      end;
    0: Query.SetVariable(Variavel, Null);
    3: Query.SetVariable(Variavel, Valor);
    7: Query.SetVariable(Variavel, VarToDateTime(Valor));
  else
    Query.SetVariable(Variavel, Null);
  end;
end;

procedure TBib.AtualizaExclusaoInclusaoMD5(pDtInicial, pDtFinal: TDate;
  pCommit: Boolean = true);
  procedure InsertOrUpdate(pTabela: string; pData: TDate; pHashMD5: Variant;
    pCommit: Boolean);
  begin
    if (pHashMD5 = '') or (pHashMD5 = Null) then
      Exit;
    with DMOracle do
    begin
      if (FastSelect('COUNT(*)', 'TB_HASH_MD5_TABELAS',
        'DT_REGISTRO = ' + quotedStr(DateToStr(pData)) + ' AND DESC_TABELA = ' +
        quotedStr(pTabela))) = '0' then
      begin
        //Insert
        ExecutaSql('INSERT INTO TB_HASH_MD5_TABELAS VALUES(SQ_HASH_MD5_TABELAS.NEXTVAL,'
          +
          quotedStr(DateToStr(pData)) + ',' + quotedStr(pHashMD5) + ',' +
            quotedStr(pTabela) + ')',
          pCommit);
      end
      else
      begin
        //Update
        ExecutaSql('UPDATE TB_HASH_MD5_TABELAS SET DESC_HASH_MD5 = ' +
          quotedStr(pHashMD5) + ' WHERE DESC_TABELA = ' +
          quotedStr(pTabela) + ' AND DT_REGISTRO = ' +
          quotedStr(DateToStr(pData)), pCommit);
      end;
    end;
  end;
  procedure Delete(pTabela: string; pData: TDate; pCommit: Boolean);
  begin
    with DMOracle do
    begin
      ExecutaSql('DELETE FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr(pTabela) + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(pData)), pCommit);
    end;
  end;
var
  wHashCollectionAtual: TVariantMap;
  i: Variant;
  wDataRef: TDate;
begin
  i := pDtFinal - pDtInicial;
  wDataRef := pDtInicial;
  while i >= 0 do
  begin
    if DMOracle.FastSelect('IND_PAF_ECF', 'TB_PARAM_SISTEMA') <> 'S' then
      Exit;

    wHashCollectionAtual := GeraMapaDeMD5(wDataRef);

    //ATUAZLIAÇÃO DOS HASHS NA TB_HASH_MD5_TABELAS

    try
      try
        if PafEcfHashTabelas.wHashProdutos =
          DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
          'DESC_TABELA = ' + QuotedStr('TB_PRODUTO') + ' AND DT_REGISTRO = (' +
          'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
          QuotedStr('TB_PRODUTO') + ')') then
          InsertOrUpdate('TB_PRODUTO', wDataRef,
            wHashCollectionAtual.getValue('TB_PRODUTO'), pCommit);
      finally
        if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
          'DESC_TABELA = ' + QuotedStr('TB_PRODUTO') + ' AND DT_REGISTRO = (' +
          'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
          QuotedStr('TB_PRODUTO') + ')') = '0') or
          (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
          'DESC_TABELA = ' + QuotedStr('TB_PRODUTO') + ' AND DT_REGISTRO = (' +
          'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
          QuotedStr('TB_PRODUTO') + ')') = '0') then
          InsertOrUpdate('TB_PRODUTO', wDataRef,
            wHashCollectionAtual.getValue('TB_PRODUTO'), pCommit);
      end;
    except
    end;

    if false then //não é pra entrar
    begin
      if wHashCollectionAtual.getValue('TB_ESTOQUE_DIARIO_CAB') <> null then
        InsertOrUpdate('TB_ESTOQUE_DIARIO_CAB', wDataRef,
          wHashCollectionAtual.getValue('TB_ESTOQUE_DIARIO_CAB'), pCommit)
      else
        Delete('TB_ESTOQUE_DIARIO_CAB', wDataRef, pCommit);
      if wHashCollectionAtual.getValue('TB_ESTOQUE_DIARIO_ITEM') <> null then
        InsertOrUpdate('TB_ESTOQUE_DIARIO_ITEM', wDataRef,
          wHashCollectionAtual.getValue('TB_ESTOQUE_DIARIO_ITEM'), pCommit)
      else
        Delete('TB_ESTOQUE_DIARIO_ITEM', wDataRef, pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashECF =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_ECF') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_ECF') + ')') then
        InsertOrUpdate('TB_ECF', wDataRef,
          wHashCollectionAtual.getValue('TB_ECF'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_ECF') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_ECF') + ')') = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_ECF') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_ECF') + ')') = '') then
        InsertOrUpdate('TB_ECF', wDataRef,
          wHashCollectionAtual.getValue('TB_ECF'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashFilial =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_FILIAL') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_FILIAL') + ')') then
        InsertOrUpdate('TB_FILIAL', wDataRef,
          wHashCollectionAtual.getValue('TB_FILIAL'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_FILIAL') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_FILIAL') + ')') = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_FILIAL') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_FILIAL') + ')') = '') then
        InsertOrUpdate('TB_FILIAL', wDataRef,
          wHashCollectionAtual.getValue('TB_FILIAL'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashFilial =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_REGISTRO_TIPO60_MESTRE') +
          ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_MESTRE') + ')') then
        InsertOrUpdate('TB_REGISTRO_TIPO60_MESTRE', wDataRef,
          wHashCollectionAtual.getValue('TB_REGISTRO_TIPO60_MESTRE'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_REGISTRO_TIPO60_MESTRE') +
          ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_MESTRE') + ')') = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_REGISTRO_TIPO60_MESTRE') +
          ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_MESTRE') + ')') = '') then
        InsertOrUpdate('TB_REGISTRO_TIPO60_MESTRE', wDataRef,
          wHashCollectionAtual.getValue('TB_REGISTRO_TIPO60_MESTRE'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashFilial =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') +
          ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') + ')') then
        InsertOrUpdate('TB_REGISTRO_TIPO60_ANALITICO', wDataRef,
          wHashCollectionAtual.getValue('TB_REGISTRO_TIPO60_ANALITICO'),
            pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') +
          ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') + ')') = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') +
          ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') + ')') = '') then
        InsertOrUpdate('TB_REGISTRO_TIPO60_ANALITICO', wDataRef,
          wHashCollectionAtual.getValue('TB_REGISTRO_TIPO60_ANALITICO'),
            pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashNotaCab =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_NOTA_CAB') + ' AND DT_REGISTRO = ' +
          QuotedStr(DateToStr(wDataRef))) then
        InsertOrUpdate('TB_NOTA_CAB', wDataRef,
          wHashCollectionAtual.getValue('TB_NOTA_CAB'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_NOTA_CAB') + ' AND DT_REGISTRO = ' +
          QuotedStr(DateToStr(wDataRef))) = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_NOTA_CAB') + ' AND DT_REGISTRO = ' +
          QuotedStr(DateToStr(wDataRef))) = '') then
        InsertOrUpdate('TB_NOTA_CAB', wDataRef,
          wHashCollectionAtual.getValue('TB_NOTA_CAB'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashNotaItem =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_NOTA_ITEM') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) then
        InsertOrUpdate('TB_NOTA_ITEM', wDataRef,
          wHashCollectionAtual.getValue('TB_NOTA_ITEM'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_NOTA_ITEM') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_NOTA_ITEM') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) = '') then
        InsertOrUpdate('TB_NOTA_ITEM', wDataRef,
          wHashCollectionAtual.getValue('TB_NOTA_ITEM'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashTributacao =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_TRIBUTACAO') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_TRIBUTACAO') + ')') then
        InsertOrUpdate('TB_TRIBUTACAO', wDataRef,
          wHashCollectionAtual.getValue('TB_TRIBUTACAO'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_TRIBUTACAO') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_TRIBUTACAO') + ')') = '0') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_TRIBUTACAO') + ' AND DT_REGISTRO = (' +
        'SELECT MAX(DT_REGISTRO) FROM TB_HASH_MD5_TABELAS WHERE DESC_TABELA = ' +
        QuotedStr('TB_TRIBUTACAO') + ')') = '') then
        InsertOrUpdate('TB_TRIBUTACAO', wDataRef,
          wHashCollectionAtual.getValue('TB_TRIBUTACAO'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashDemaisDoc =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_DEMAIS_DOCUMENTOS_ECF') +
          ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) then
        InsertOrUpdate('TB_DEMAIS_DOCUMENTOS_ECF', wDataRef,
          wHashCollectionAtual.getValue('TB_DEMAIS_DOCUMENTOS_ECF'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_DEMAIS_DOCUMENTOS_ECF') +
          ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) = '') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_DEMAIS_DOCUMENTOS_ECF') +
          ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) = '0') then
        InsertOrUpdate('TB_DEMAIS_DOCUMENTOS_ECF', wDataRef,
          wHashCollectionAtual.getValue('TB_DEMAIS_DOCUMENTOS_ECF'), pCommit);
    end;

    try
      if PafEcfHashTabelas.wHashPagamento =
        DMOracle.FastSelect('DESC_HASH_MD5', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_PAGAMENTO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) then
        InsertOrUpdate('TB_PAGAMENTO', wDataRef,
          wHashCollectionAtual.getValue('TB_PAGAMENTO'), pCommit);
    finally
      if (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_PAGAMENTO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) = '') or
        (DMOracle.FastSelect('NVL(DESC_HASH_MD5,0)', 'TB_HASH_MD5_TABELAS',
        'DESC_TABELA = ' + QuotedStr('TB_PAGAMENTO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef))) = '0') then
        InsertOrUpdate('TB_PAGAMENTO', wDataRef,
          wHashCollectionAtual.getValue('TB_PAGAMENTO'), pCommit);
    end;
    PafEcfHashTabelas.Instancia.Atualiza(DMOracle.DataServ);
    wDataRef := wDataRef + 1;
    Dec(i);
  end;

end;

function TBib.ComparaExclusaoInclusaoMD5(pDtInicial, pDtFinal: TDate): Boolean;
var
  wHashCollection, wHashCollectionBD: TVariantMap;
  i: Variant;
  wDataRef: TDate;
  wTeste: Variant;
  wHash: string;
begin
  wHashCollectionBD := TVariantMap.Create;
  wHashCollection := TVariantMap.Create; //Instancia para poder dar um Clear
  i := pDtFinal - pDtInicial;
  wDataRef := pDtInicial;
  with DMOracle do
  begin
    while i >= 0 do
    begin
      wHashCollectionBD.Clear;
      wHashCollection.Clear;
      wHashCollection := GeraMapaDeMD5(wDataRef);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_PRODUTO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_PRODUTO', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_ESTOQUE_DIARIO_CAB') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_ESTOQUE_DIARIO_CAB', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_ESTOQUE_DIARIO_ITEM') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_ESTOQUE_DIARIO_ITEM', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_ECF') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_ECF', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_FILIAL') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_FILIAL', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_MESTRE') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_REGISTRO_TIPO60_MESTRE', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_REGISTRO_TIPO60_ANALITICO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_REGISTRO_TIPO60_ANALITICO', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_NOTA_CAB') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_NOTA_CAB', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_NOTA_ITEM') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_NOTA_ITEM', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_TRIBUTACAO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_TRIBUTACAO', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_DEMAIS_DOCUMENTOS_ECF') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_DEMAIS_DOCUMENTOS_ECF', wHash);
      wHash := FastSelect('DESC_HASH_MD5',
        'TB_HASH_MD5_TABELAS', 'DESC_TABELA = ' +
        QuotedStr('TB_PAGAMENTO') + ' AND DT_REGISTRO = ' +
        QuotedStr(DateToStr(wDataRef)));
      if wHash <> '' then
        wHashCollectionBD.addValue('TB_PAGAMENTO', wHash);
      wDataRef := wDataRef + 1;
      Dec(i);
      Result := ((wHashCollection.getValue('TB_PRODUTO') =
        wHashCollectionBD.getValue('TB_PRODUTO')) and
        (wHashCollection.getValue('TB_ESTOQUE_DIARIO_CAB') =
          wHashCollectionBD.getValue('TB_ESTOQUE_DIARIO_CAB')) and
        (wHashCollection.getValue('TB_ESTOQUE_DIARIO_ITEM') =
          wHashCollectionBD.getValue('TB_ESTOQUE_DIARIO_ITEM')) and
        (wHashCollection.getValue('TB_ECF') =
          wHashCollectionBD.getValue('TB_ECF')) and
        (wHashCollection.getValue('TB_FILIAL') =
          wHashCollectionBD.getValue('TB_FILIAL')) and
        (wHashCollection.getValue('TB_REGISTRO_TIPO60_MESTRE') =
          wHashCollectionBD.getValue('TB_REGISTRO_TIPO60_MESTRE')) and
        (wHashCollection.getValue('TB_REGISTRO_TIPO60_ANALITICO') =
          wHashCollectionBD.getValue('TB_REGISTRO_TIPO60_ANALITICO')) and
        (wHashCollection.getValue('TB_NOTA_CAB') =
          wHashCollectionBD.getValue('TB_NOTA_CAB')) and
        (wHashCollection.getValue('TB_NOTA_ITEM') =
          wHashCollectionBD.getValue('TB_NOTA_ITEM')) and
        (wHashCollection.getValue('TB_TRIBUTACAO') =
          wHashCollectionBD.getValue('TB_TRIBUTACAO')) and
        (wHashCollection.getValue('TB_DEMAIS_DOCUMENTOS_ECF') =
          wHashCollectionBD.getValue('TB_DEMAIS_DOCUMENTOS_ECF')) and
        (wHashCollection.getValue('TB_PAGAMENTO') =
          wHashCollectionBD.getValue('TB_PAGAMENTO')));
      if not Result then
        Break;
    end;
  end;
  //  wTeste := ('Produto '+ wHashCollection.getValue('TB_PRODUTO') +' - '+ wHashCollectionBD.getValue('TB_PRODUTO')+#13#10+
  //    'EstoqueDiarioCab '+ wHashCollection.getValue('TB_ESTOQUE_DIARIO_CAB') +' - '+ wHashCollectionBD.getValue('TB_ESTOQUE_DIARIO_CAB')+#13#10+
  //    'EstoqueDiarioItem '+ wHashCollection.getValue('TB_ESTOQUE_DIARIO_ITEM') +' - '+ wHashCollectionBD.getValue('TB_ESTOQUE_DIARIO_ITEM')+#13#10+
  //    'ECF '+ wHashCollection.getValue('TB_ECF') +' - '+ wHashCollectionBD.getValue('TB_ECF')+#13#10+
  //    'Filial '+ wHashCollection.getValue('TB_FILIAL') +' - '+ wHashCollectionBD.getValue('TB_FILIAL')+#13#10+
  //    'Registro 60 M '+ wHashCollection.getValue('TB_REGISTRO_TIPO60_MESTRE') +' - '+ wHashCollectionBD.getValue('TB_REGISTRO_TIPO60_MESTRE')+#13#10+
  //    'Registro 60 A '+ wHashCollection.getValue('TB_REGISTRO_TIPO60_ANALITICO') +' - '+ wHashCollectionBD.getValue('TB_REGISTRO_TIPO60_ANALITICO')+#13#10+
  //    'Nota Cab '+ wHashCollection.getValue('TB_NOTA_CAB') +' - '+ wHashCollectionBD.getValue('TB_NOTA_CAB')+#13#10+
  //    'Nota Item '+ wHashCollection.getValue('TB_NOTA_ITEM') +' - '+ wHashCollectionBD.getValue('TB_NOTA_ITEM')+#13#10+
  //    'Tributacao '+ wHashCollection.getValue('TB_TRIBUTACAO') +' - '+ wHashCollectionBD.getValue('TB_TRIBUTACAO')+#13#10+
  //    'Demais Documentos '+ wHashCollection.getValue('TB_DEMAIS_DOCUMENTOS_ECF') +' - '+ wHashCollectionBD.getValue('TB_DEMAIS_DOCUMENTOS_ECF')+#13#10+
  //    'Pagamento '+ wHashCollection.getValue('TB_PAGAMENTO') +' - '+ wHashCollectionBD.getValue('TB_PAGAMENTO'));
  //  showMessage(wTeste);
end;

//MessaseDlg customizado que pode ter os captions dos botões alterados

function TBib.MessageDlgCustomizado(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; Captions: array of string): Integer;
var
  aMsgDlg: TForm;
  i: Integer;
  dlgButton: TButton;
  CaptionIndex: Integer;
begin
  { Create the Dialog }
  { Dialog erzeugen }
  aMsgDlg := CreateMessageDialog(Msg, DlgType, Buttons);
  captionIndex := 0;
  { Loop through Objects in Dialog }
  { Über alle Objekte auf dem Dialog iterieren}
  for i := 0 to aMsgDlg.ComponentCount - 1 do
  begin
    { If the object is of type TButton, then }
    { Wenn es ein Button ist, dann...}
    if (aMsgDlg.Components[i] is TButton) then
    begin
      dlgButton := TButton(aMsgDlg.Components[i]);
      if CaptionIndex > High(Captions) then
        Break;
      { Give a new caption from our Captions array}
      { Schreibe Beschriftung entsprechend Captions array}
      dlgButton.Caption := Captions[CaptionIndex];
      Inc(CaptionIndex);
    end;
  end;
  Result := aMsgDlg.ShowModal;
end;

//Imprime o conteúdo da string em qualquer impressora passada por parâmetro

function TBib.ImprimeImpressoraGenerica(Impressora, Conteudo: string; Font:
  string = 'Arial Narrow'; Size: Integer = 9): Boolean;
var
  nInd: integer;
  wRect: TRect;
  PrinterInfo: PPrinterInfo2;
  PrnHandle: THandle;
  PrnInfo2: PPRINTERINFO2;
  PrnInfoSize: DWord;
begin
  Result := True;
  try
    Printer.Canvas.Font.Name := Font;
    Printer.Canvas.Font.Size := Size;
    Printer.Orientation := poPortrait;
    Printer.Title := 'Seu Relatório';
    if pos('\\', Impressora) > 0 then
    begin
      OpenPrinter(PAnsiChar(Impressora), PrnHandle, 0);
      GetPrinter(PrnHandle, 2, nil, 0, @PrnInfoSize);
      PrnInfo2 := AllocMem(PrnInfoSize);
      GetPrinter(PrnHandle, 2, PrnInfo2, PrnInfoSize, @PrnInfoSize);
      if PrnInfo2^.pServerName = nil then
        nInd := Printer.Printers.IndexOf(PrnInfo2^.pPrinterName)
      else
        nInd := Printer.Printers.IndexOf(PrnInfo2^.pServerName + '\' +
          StringReplace(PrnInfo2^.pPrinterName, PrnInfo2^.pServerName + '\', '',
          [rfReplaceAll]));
    end
    else
      nInd := Printer.Printers.IndexOf(Impressora);
    if nInd >= 0 then
      Printer.PrinterIndex := nInd;

    Printer.BeginDoc;
    wRect.Top := 0;
    wRect.Left := 0;
    DrawText(Printer.Canvas.Handle, pChar(Conteudo), -1, wRect,
      DT_WORD_ELLIPSIS);
    Printer.EndDoc;
  except
    Result := False
  end;
end;

//Retorna o nome da impressora selecionada no print dialog

function TBib.SelecionaImpressora(FormOrigem: TForm): string;
var
  PrinterInfo: PPrinterInfo2;
  PrnHandle: THandle;
  PrnInfo2: PPRINTERINFO2;
  PrnInfoSize: DWord;
  PDImpressora: TPrintDialog;
  pDevice: pChar;
  pDriver: pChar;
  pPort: pChar;
  hDMode: THandle;
begin
  inherited;
  PDImpressora := nil;
  PDImpressora := TPrintDialog.Create(FormOrigem);
  try
    if PDImpressora.Execute then
    begin
      GetMem(pDevice, cchDeviceName);
      GetMem(pDriver, MAX_PATH);
      GetMem(pPort, MAX_PATH);
      Printer.GetPrinter(pDevice, pDriver, pPort, hDMode);
      GetProfileString('Devices', pDevice, '', pPort, 200);
      if Pos('\\', pDevice) > 0 then
      begin
        OpenPrinter(pDevice, PrnHandle, nil);
        GetPrinter(PrnHandle, 2, nil, 0, @PrnInfoSize);
        PrnInfo2 := AllocMem(PrnInfoSize);
        if GetPrinter(PrnHandle, 2, PrnInfo2, PrnInfoSize, @PrnInfoSize) then
        begin
          Result := StrPas(PrnInfo2^.pServerName);
          Result := Result + '\';
          Result := Result + StrPas(PrnInfo2^.pShareName);
        end
        else
          Application.MessageBox('Erro ao conectar Impressora!', 'Erro', MB_Ok +
            mb_IconInformation);
        ClosePrinter(PrnHandle);
        FreeMem(PrnInfo2, PrnInfoSize);
      end
      else
        Result := StrPas(pDevice);
    end;
  except
    raise Exception.Create('Erro ao selecionar impressora.');
  end;

end;

function TBib.PegaImpressoraPorNomeRede(Nome: string): string;
var
  PrinterInfo: PPrinterInfo2;
  PrnHandle: THandle;
  PrnInfo2: PPRINTERINFO2;
  PrnInfoSize: DWord;
begin
  OpenPrinter(pAnsiChar(Nome), PrnHandle, nil);
  GetPrinter(PrnHandle, 2, nil, 0, @PrnInfoSize);
  PrnInfo2 := AllocMem(PrnInfoSize);
  if GetPrinter(PrnHandle, 2, PrnInfo2, PrnInfoSize, @PrnInfoSize) then
    Result := string(PrnInfo2^.pPrinterName)
  else
    Result := '';
  ClosePrinter(PrnHandle);
  FreeMem(PrnInfo2, PrnInfoSize);
end;

function TBib.PegaNomeComputador: string;
var
  Computer: PChar;
  CSize: DWORD;
begin
  Computer := #0;
  CSize := MAX_COMPUTERNAME_LENGTH + 1;
  try
    GetMem(Computer, CSize);
    if Windows.GetComputerName(Computer, CSize) then
      result := Computer;
  finally
    FreeMem(Computer);
  end;
end;

procedure TBib.QueryToLog(pQuery: TOracleDataSet1);
var
  i: Integer;
  r: string;
  sql: string;
  arquivo: TextFile;
begin
  // Procedure que salva o comando SQL da query em arquivo
  // Utilizado para verificar o comando SQL
  sql := pQuery.SQL.Text;
  if pQuery.Variables.Count > 0 then
    for i := 0 to pQuery.Variables.Count - 1 do
    begin
      case pQuery.GetVariable(i).DataType of
        otString, otDate: r := QuotedStr(pQuery.GetVariable(i).AsString);
      else
        r := pQuery.GetVariable(i).AsString;
      end;

      sql := (StringReplace(sql, ':' + pQuery.GetVariable(i).Name, r,
        [rfReplaceAll]));
    end
  else
    sql := pQuery.SQL.Text;

  AssignFile(arquivo, 'QueryToLog.txt');
  Rewrite(arquivo);
  Writeln(arquivo, sql);
  CloseFile(arquivo);
end;

procedure TBib.LimparBufferTeclado;
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, 0, WM_KEYFIRST, WM_KEYLAST, PM_REMOVE or PM_NOYIELD) do
    ;
end;

procedure TBib.Split(const Delimiter: Char; Input: string;
  var Strings: TStringList);
begin
  Assert(Assigned(Strings));
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := '"' + StringReplace(Input, Delimiter, '"' + Delimiter
    + '"', [rfReplaceAll]) + '"';
end;

function TBib.Split2(const Separator, S: string; Limit: Integer = 0):
  TStringArray;
var
  SepLen: Integer;
  F, P: PChar;
  ALen, Index: Integer;
begin
  SetLength(Result, 0);
  if (S = '') or (Limit < 0) then
    Exit;
  if Separator = '' then
  begin
    SetLength(Result, 1);
    Result[0] := S;
    Exit;
  end;
  SepLen := Length(Separator);
  ALen := Limit;
  SetLength(Result, ALen);

  Index := 0;
  P := PChar(S);
  while P^ <> #0 do
  begin
    F := P;
    P := AnsiStrPos(P, PChar(Separator));
    if (P = nil) or ((Limit > 0) and (Index = Limit - 1)) then
      P := StrEnd(F);
    if Index >= ALen then
    begin
      Inc(ALen, 5);
      SetLength(Result, ALen);
    end;
    SetString(Result[Index], F, P - F);
    Inc(Index);
    if P^ <> #0 then
      Inc(P, SepLen);
  end;
  if Index < ALen then
    SetLength(Result, Index);
end;

procedure TBib.Log(linha: string);
var
  arquivo: TextFile;
begin
  AssignFile(arquivo, 'Log.txt');
  if FileExists('Log.txt') then
    Append(arquivo)
  else
    Rewrite(arquivo);
  Writeln(arquivo, linha);
  CloseFile(arquivo);
end;

{Para usar a função, utilizar as constantes: TiraNumero e TiraLetras  ex: RetiraCaracteres(TiraNumero, edit.text);
  ou RetiraCaracteres(TiraLetras, edit.text); Cleber - 15/05/2019}

function TBib.RetiraCaracteres(_Separador: TSysCharSet; const Str: string):
  string;
var
  lista: TStringList;
begin
  lista := TSTringList.Create;

  try
    ExtractStrings(_Separador, [], pchar(str), lista);
    lista.QuoteChar := #0;
    result := StringReplace(lista.DelimitedText, lista.Delimiter, EmptyStr,
      [rfReplaceAll]);
    result := LimpaString(result, '"');
    result := LimpaString(result, char(39));
  finally
    lista.Free;
  end;

end;

function TBib.OcorrenciasDeCaracter(const S: string; const C: char): integer;
var
  i: Integer;
begin
  result := 0;
  for i := 1 to Length(S) do
    if S[i] = C then
      inc(result);
end;

function TBib.Capitalizar(Texto: string): string;
var
  OldStart: Integer;
begin
  if Texto <> '' then
  begin
    Texto := UpperCase(Copy(Texto, 1, 1)) + LowerCase(Copy(Texto, 2,
      Length(Texto)));
    Result := Texto;
  end;
end;

function TBib.TitleCase(Text2: string): string;
var
  i: integer;
  t: string;
begin
  for i := 1 to length(Text2) do
  begin
    if (not (Text2[i - 1] in ['A'..'Z', 'a'..'z'])) then
      Text2[i] := UpCase(Text2[i])
    else
    begin
      t := LowerCase(Text2[i]);
      Text2[i] := t[1];
    end;
  end;
  Result := Text2;
end;

procedure TBib.WBLoadHTML(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  //Essa procedure carrega um texto dentro de um componente Webbrowser.
  //Adicionado por Gian 29/04/2020

  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
    Application.ProcessMessages;

  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek(0, 0);
        (WebBrowser.Document as
          IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;

function TBib.ValidaCEP(cep: string; var endereco, bairro, complemento, uf,
  cidade: TObject; lbl: TLabel): Integer;
  procedure populaLabel(res: integer; mensagem: string = '');
  begin
    if res = 0 then
    begin
      lbl.Visible := true;
      lbl.Font.Color := clGreen;
      lbl.Caption := 'CEP válido';
    end
    else
    begin
      lbl.Visible := true;
      lbl.Font.Color := clRed;
      lbl.Caption := Ift(mensagem = '', 'CEP inválido', mensagem);
    end;
  end;
var
  ibge, wSql: string;
begin
  result := ValidaCEP(cep);
  populaLabel(result, Ift(result = 2, 'Sem conexão com a Internet', Ift(result =
    100, 'Serviço de validação fora do ar', '')));

  if result = 0 then
  begin
    try
      with ValidacaoCEP do
      begin
        try
          if (TStringField(endereco).Value = '') and (js.getString('logradouro')
            <> '') then
            TStringField(endereco).Value := js.getString('logradouro');
        except
          if js.getString('logradouro') <> '' then
            string(endereco) := js.getString('logradouro');
        end;

        try
          if js.getString('bairro') <> '' then
            TStringField(bairro).Value := js.getString('bairro');
        except
          if js.getString('bairro') <> '' then
            string(bairro) := js.getString('bairro');
        end;
        try
          if (TStringField(complemento).Value = '') and
            (js.getString('complemento') <> '') then
            TStringField(complemento).Value := js.getString('complemento');
        except
          if js.getString('complemento') <> '' then
            string(complemento) := js.getString('complemento');
        end;
        try
          TStringField(uf).Value := js.getString('uf');
        except
          string(uf) := js.getString('uf');
        end;
        ibge := js.getString('ibge');
        // Recupera o código da cidade
        wSql := 'SELECT COD_CIDADE FROM TB_CIDADE WHERE COD_CIDADE_IBGE = ' +
          copy(ibge, 3, 5)
          + ' AND COD_ESTADO = ' + QuotedStr(js.getString('uf'));
        with DMOracle do
        begin
          QExecSql.SQL.Clear;
          QExecSql.SQL.Add(wSql);
          QExecSQL.Close;
          QExecSQL.Open;
          try
            TIntegerField(cidade).Value := QExecSQL.Fields[0].AsInteger;
          except
            integer(cidade) := QExecSQL.Fields[0].AsInteger;
          end;
          QExecSQL.Close();
        end;
      end;
    except
    end;
  end;
end;

function TBib.TemConexaoInternet: Boolean;
begin
  result := USocketPing.Ping(1000, 'www.google.com', 80) = 0;
end;

function TBib.ValidaCEP(cep: string; cidade: integer; var mensagem: string):
  Boolean;
var
  ibgeCEP, ibgeCidade: string;
  res: integer;
begin
  res := ValidaCEP(cep);
  if (res = 0) or (res = 2) or (res = 100) then
    result := True
  else
    result := False;
  if res = 0 then
  begin
    ibgeCEP := ValidacaoCEP.js.getString('ibge');
    ibgeCidade := DMOracle.FastSelect('COD_CIDADE_IBGE', 'TB_CIDADE',
      'COD_CIDADE = 0' + IntToStr(cidade));
    if Copy(ibgeCEP, 3, 5) <> ibgeCidade then
    begin
      result := False;
      mensagem := 'O CEP informado não pertence à cidade informada.';
    end;
  end;
end;

function TBib.ValidaCEP(cep: string): Integer;
var
  s: string;
begin
  try
    if ValidacaoCEP = nil then
      ValidacaoCEP := TValidacaoCEP.Create;
    if Length(LimpaNumero(cep)) <> 8 then
      result := 3
    else
    begin
      with ValidacaoCEP do
      begin
        js := TlkJSONobject.Create;
        IdHTTP1 := TIdHTTP.Create(nil);
        IdHTTP1.Request.CustomHeaders.Clear;
        IdHTTP1.Response.ContentType := 'application/json';
        IdHTTP1.Request.UserAgent :=
          'User-Agent:Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.96 Safari/537.36';
        IdHTTP1.HandleRedirects := true;
        if TemConexaoInternet then
        begin
          s := IdHTTP1.Get('http://viacep.com.br/ws/' + LimpaNumero(cep) +
            '/json/');

          js := TlkJSON.ParseText(s) as TlkJSONobject;
          result := Ift(js.getBoolean('erro'), 1, 0);
        end
        else
          result := 2;
      end;
    end;
  except
    result := 100;
  end;
end;

function TBib.Tirapontos(texto: string): string;
begin
  while pos('-', Texto) <> 0 do
    delete(Texto, pos('-', Texto), 1);
  while pos('.', Texto) <> 0 do
    delete(Texto, pos('.', Texto), 1);
  while pos('/', Texto) <> 0 do
    delete(Texto, pos('/', Texto), 1);
  while pos(',', Texto) <> 0 do
    delete(Texto, pos(',', Texto), 1);

  result := Texto;
end;

procedure TBib.GetImageByUrl(URL: string; APicture: TPicture);
var
  Jpeg: TJPEGImage;
  Strm: TMemoryStream;
  vIdHTTP: TIdHTTP;
begin
  Screen.Cursor := crHourGlass;
  Jpeg := TJPEGImage.Create;
  Strm := TMemoryStream.Create;
  vIdHTTP := TIdHTTP.Create(nil);
  try
    vIdHTTP.Get(URL, Strm);
    if (Strm.Size > 0) then
    begin
      Strm.Position := 0;
      Jpeg.LoadFromStream(Strm);
      APicture.Assign(Jpeg);
    end;
  finally
    Strm.Free;
    Jpeg.Free;
    vIdHTTP.Free;
    Screen.Cursor := crDefault;
  end;
end;

function TBib.Nvl(pValue, IfNull: Variant): Variant;
begin
  if (pValue = Null) or (pValue = '') then
    Result := IfNull
  else
    Result := pValue;
end;

function TBib.LimpaCaracteresReinf(pTexto: string): string;
var
  vTexto: string;
  i: Integer;
begin

  vTexto := pTexto;

  //conforme obrigação do layout do Reinf
  vTexto := StringReplace(vTexto, '&', '&amp;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '>', '&gt;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '<', '&lt;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '"', '&quot;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '“', '&quot;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '”', '&quot;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '''', '&#39', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '`', '&#39', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '´', '&#39', [rfreplaceall]);

  Result := vTexto;

end;

function TBib.SomenteNumero(Key: Char; Texto: string; isDecimal: Boolean =
  False): Char;
begin
  if not isDecimal then
  begin
    { Chr(8) = Back Space }
    if not (Key in ['0'..'9', Chr(8)]) then
      Key := #0
  end
  else
  begin
    if Key = #46 then
      Key := DecimalSeparator;
    if not (Key in ['0'..'9', Chr(8), DecimalSeparator]) then
      Key := #0
    else if (Key = DecimalSeparator) and (Pos(Key, Texto) > 0) then
      Key := #0;

  end;
  Result := Key;
end;

function TBib.IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: string): string;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

function TBib.IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Integer): Integer;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

function TBib.IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Double): Double;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

function TBib.IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Boolean): Boolean;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

function TBib.IIF(ACondicao: Boolean; const AVerdadeiro, AFalso: Variant): Variant;
begin
  if ACondicao then
    Result := AVerdadeiro
  else
    Result := AFalso;
end;

function TBib.LimpaCaracteresInvalidos(pTexto: string): string;
var
  vTexto: string;
  i: Integer;
begin

  vTexto := pTexto;

  //conforme obrigação do layout do Reinf
  vTexto := StringReplace(vTexto, '&', '&amp;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '>', '&gt;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '<', '&lt;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '"', '&quot;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '“', '&quot;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '”', '&quot;', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '''', '&#39', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '`', '&#39', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '´', '&#39', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'á', 'a', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'é', 'e', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'í', 'i', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ó', 'o', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ú', 'u', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'à', 'a', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'è', 'e', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ì', 'i', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ò', 'o', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ù', 'u', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'â', 'a', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ê', 'e', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'î', 'i', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ô', 'o', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'û', 'u', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ä', 'a', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ë', 'e', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ï', 'i', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ö', 'o', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ü', 'u', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'õ', 'o', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ñ', 'n', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ç', 'c', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ã', 'a', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Á', 'A', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'É', 'E', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Í', 'I', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ó', 'O', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ú', 'U', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'À', 'A', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'È', 'E', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ì', 'I', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ò', 'O', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ù', 'U', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Â', 'A', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ê', 'E', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Î', 'I', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ô', 'O', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Û', 'U', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ä', 'A', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ë', 'E', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ï', 'I', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ö', 'O', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ü', 'U', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ã', 'A', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Õ', 'O', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ñ', 'N', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'Ç', 'C', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '&', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '*', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '_', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '-', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '@', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '#', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '$', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '|', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, '°', ' ', [rfreplaceall]);
  vTexto := StringReplace(vTexto, 'ª', ' ', [rfreplaceall]);  
  vTexto := StringReplace(vTexto, '\', '-', [rfreplaceall]); 
  vTexto := StringReplace(vTexto, '/', '-', [rfreplaceall]); 


  Result := vTexto;

end;

end.
