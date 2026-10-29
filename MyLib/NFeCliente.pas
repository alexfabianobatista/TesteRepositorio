unit NFeCliente;

interface

uses
  ConexaoRPC, NFeRPCRetorno;

type
  TTipoFuncao = (//NF-e
                 fuEnviaLote, fuInut, fuStatus, fuConsultaProtocolo,
                 fuConsultaCadastro, fuCancelaNota, fuSalvaDanfePdf,
                 fuImprimeDanfe, fuEnviaEmail,fuEnviaEmailCCe, fuCartaCorrecao,
                 fuManifestacaoDestinatario, fuExportaNFes, fuConsultaLote,
                 fuImprimeCCe, fuSalvaCCePdf, fuPrevisualizaDanfe, fuBaixarXMLNFe,
                 fuConsultaNFes,
                 //NFS-e
                 fuEnviaLoteRps, fuConsultaSituacaoLoteRps, fuConsultaNFSeRps,
                 fuConsultaNFSe, fuConsultaLoteRps, fuCancelaNFSe,
                 //CT-e
                 fuEnviaLoteCTe, fuInutCTe, fuStatusCTe, fuConsultaProtocoloCTe,
                 fuConsultaCadastroCTe, fuCancelaCTe, fuSalvaDactePdf,
                 fuImprimeDacte, fuEnviaEmailCTe, fuRegistraEventoCTe,
                 fuExportaCTes, fuConsultaLoteCTe,fuEnviaEmailCCeCTe,
                 fuImprimeCCeCTe, fuSalvaCCeCTePdf, fuPrevisualizaDacte,
                 //MDF-e
                 fuEnviaLoteMDFe, fuStatusMDFe, fuConsultaProtocoloMDFe,
                 fuSalvaDamdfePdf, fuImprimeDamdfe, fuRegistraEventoMDFe,
                 fuEnviaEmailMDFe, fuExportaMDFes, fuConsultaLoteMDFe,
                 fuConsultaMDFesNaoEncerrados, fuPrevisualizaDamdfe);

  TTipoEvento = (evChamada, evRetorno);

  TNFeClienteEvento = class(TObject)
  protected
    FEvento: TTipoEvento;
    FFuncao: TTipoFuncao;
    FParams: TParamsArray;
    FServidor: String;
    FValor: Integer;
  public
    constructor Create(Funcao: TTipoFuncao; Evento: TTipoEvento; Servidor: String; Params: TParamsArray; Valor: Integer);
    property Evento: TTipoEvento read FEvento write FEvento;
    property Funcao: TTipoFuncao read FFuncao write FFuncao;
    property Params: TParamsArray read FParams write FParams;
    property Servidor: String read FServidor write FServidor;
    property Valor: Integer read FValor write FValor;
  end;

  INFeClienteListener = interface
    procedure EventoOcorrido(Evento: TNFeClienteEvento);
  end;

  TNFeCliente = class(TObject)
  private
    FConexao: TConexaoRPC;
    FServidor: String;
    constructor Create(Servidor: String); overload;
  protected
    function Chama(Funcao: String; TipoFuncao: TTipoFuncao;
        Pars: TRPCParams; DescricaoAcao: String = ''): TNFeRPCRetorno;
    class procedure NotificaListeners(Evento: TNFeClienteEvento);
  public
    constructor Create; overload;
    class function GetNFeCliente(Servidor: String): TNFeCliente;
    //Rotinas para NF-e
    function SalvaDanfePdf(Chave: String; NFe: Boolean): TNFeRPCRetorno;
    function PrevisualizaDanfe(Chave: String; NFe: Boolean): TNFeRPCRetorno;
    function PrevisualizaDacte(Chave: String): TNFeRPCRetorno;
    function PrevisualizaDamdfe(Chave: String): TNFeRPCRetorno;
    function ExportaNFes(Filial, Cadastro: Integer; DataInicial, DataFinal: TDateTime; Saida, Entrada, Xml, Pdf, NFe: Boolean): TNFeRPCRetorno;
    function SalvaCCePdf(IdEvento: String): TNFeRPCRetorno;
    function ImprimeDanfe(Chave, Impressora: String; Copias: Integer; NFe: Boolean): TNFeRPCRetorno;
    function ImprimeCCe(IdEvento: String; Impressora: String): TNFeRPCRetorno;
    function EnviaEmail(Chave, Email, Assunto, Corpo: String; XML, PDF, NFe: Boolean): TNFeRPCRetorno;
    function EnviaEmailCCe(IdEvento: String; Email, Assunto, Corpo: String; XML, PDF: Boolean): TNFeRPCRetorno;
    function CancelaNota(IdLote, CodUFIBGE, Ambiente, NumNota: Integer; Chave: String): TNFeRPCRetorno;
    function ConsultaChave(Filial, CodUFIBGE, Ambiente: Integer; Chave: String): TNFeRPCRetorno; overload;
    function ConsultaCadastro(Filial: Integer; UFCadastro: String; ParamConsulta: String): TNFeRPCRetorno; overload;
    function ConsultaLote(IdLote: Longint; CodUFIBGE: Integer): TNFeRPCRetorno;
    function ConsultaStatus(Filial, CodUFIBGE, Ambiente: Integer; TpEmissao: Integer; Modelo: Integer): TNFeRPCRetorno;
    function EnviaLote(IdLote: Longint; CodUFIbge: Integer;
        Consultar: Boolean): TNFeRPCRetorno;
    function InutilizaNumeracao(Filial, CodUFIBGE, Serie, Ambiente, NumIni, NumFim: Integer;
        Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer): TNFeRPCRetorno;
    function CartaCorrecao(IdEvento: String; COrgao,Ambiente: Integer;ChaveAcesso:String): TNFeRPCRetorno;
    function ManifestacaoDestinatario(IdLote: Longint; COrgao,Ambiente: Integer; NumNota:Integer): TNFeRPCRetorno;
    function BaixarXMLNFe(Filial, Ambiente: Integer; Chave: String): TNFeRPCRetorno;
    function ConsultaNFes(Filial: Integer): TNFeRPCRetorno;

    //Rotinas para NFS-e
    function EnviaLoteRps(IdLote: Longint; CodIbgeCidade: Integer; Consultar: Boolean): TNFeRPCRetorno;
    function ConsultaSitLote(Filial, CodIbgeCidade: Integer; Protocolo: String): TNFeRPCRetorno;
    function ConsultaNFSeRps(Filial, CodIbgeCidade, NumeroRps: Integer; ChaveAcesso: String; SerieRps,
        TipoRps: String): TNFeRPCRetorno;
    function ConsultaLoteRps(IdLote, CodIbgeCidade: Integer; Protocolo: String): TNFeRPCRetorno;
    function ConsultaNFSe(Filial, CodIbgeCidade: Integer; ChaveAcesso,NumeroNFSe: String; DataInicial,
        DataFinal: TDateTime; CnpjTomador, InscTomador, RazaoSocialIntServico, CnpjIntServico,
        InscIntServico: String): TNFeRPCRetorno;
    function CancelaNFSe(Filial, CodIbgeCidade: Integer; NumeroNFSe, ChaveAcesso: String; CodCancelamento: String): TNFeRPCRetorno;

    //Rotinas para CT-e
    function SalvaDactePdf(Chave: String): TNFeRPCRetorno;
    function ExportaCTes(Filial, Remetente, Destinatario: Integer; DataInicial, DataFinal: TDateTime; Xml, Pdf, Cancelado: Boolean): TNFeRPCRetorno;
    function SalvaCCeCTePdf(IdEvento: String): TNFeRPCRetorno;
    function ImprimeDacte(Chave, Impressora: String; Copias: Integer): TNFeRPCRetorno;
    function ImprimeCCeCTe(IdEvento: String; Impressora: String): TNFeRPCRetorno;
    function EnviaEmailCTe(Chave, Email, Assunto, Corpo: String; XML, PDF: Boolean): TNFeRPCRetorno;
    function EnviaEmailCCeCTe(IdEvento: String; Email, Assunto, Corpo: String; XML, PDF: Boolean): TNFeRPCRetorno;
    function CancelaCTe(Filial, CodUFIBGE, Ambiente, NumCTe: Integer; Chave, Protocolo, Justificativa: String): TNFeRPCRetorno;
    function ConsultaChaveCTe(Filial, CodUFIBGE, Ambiente: Integer; Chave: String): TNFeRPCRetorno; overload;
    function ConsultaCadastroCTe(Filial, CodUFIBGE: Integer; UFCadastro: String; TipoParamConsulta: Integer;
                              ParamConsulta: String; Ambiente: Integer): TNFeRPCRetorno; overload;
    function ConsultaLoteCTe(IdLote: Longint; CodUFIBGE: Integer): TNFeRPCRetorno;
    function ConsultaStatusCTe(Filial, CodUFIBGE, Ambiente: Integer; TpEmissao: Integer): TNFeRPCRetorno;
    function EnviaLoteCTe(IdLote: Longint; CodUFIbge: Integer;
        Consultar: Boolean): TNFeRPCRetorno;
    function InutilizaNumeracaoCTe(Filial, CodUFIBGE, Serie, Ambiente, NumIni, NumFim: Integer;
        Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer): TNFeRPCRetorno;
    function RegistraEventoCTe(CodUFIBGE, Ambiente, CTe: Integer; IdEvento: String): TNFeRPCRetorno;


    //Rotinas para MDF-e
    function SalvaDamdfePdf(Chave: String): TNFeRPCRetorno;
    function ExportaMDFes(Filial: Integer; DataInicial, DataFinal: TDateTime; Xml, Pdf: Boolean): TNFeRPCRetorno;
    function ImprimeDamdfe(Chave, Impressora: String; Copias, MDFe: Integer): TNFeRPCRetorno;
    function ConsultaChaveMDFe(Filial, CodUFIBGE, Ambiente, MDFe: Integer; Chave: String): TNFeRPCRetorno; overload;
    function ConsultaLoteMDFe(IdLote: Longint; CodUFIBGE: Integer): TNFeRPCRetorno;
    function ConsultaStatusMDFe(Filial, CodUFIBGE, Ambiente: Integer; TpEmissao: Integer): TNFeRPCRetorno;
    function ConsultaMDFesNaoEncerrados(Filial, CodUFIBGE, Ambiente: Integer; Versao: String): TNFeRPCRetorno;
    function EnviaLoteMDFe(IdLote: Longint; CodUFIbge: Integer;
        Consultar: Boolean): TNFeRPCRetorno;
    function EnviaEmailMDFe(Chave, Email, Assunto, Corpo: String; XML, PDF: Boolean; MDFe: Integer): TNFeRPCRetorno;
    function RegistraEventoMDFe(CodUFIBGE, Ambiente, MDFe: Integer; IdEvento: String): TNFeRPCRetorno;

    //Rotinas auxiliares
    class procedure AddListener(Listener: INFeClienteListener);
    class procedure RemoveListener(Listener: INFeClienteListener);
    property Servidor: String read FServidor;
  end;

var
  NFeClientes: array of TNFeCliente;
  FListeners: array of INFeClienteListener;

const
  NFE_ERRO: Integer = -1;
  NFSE_ERRO: Integer = -2;

  NFE_FUNC_CANCELA_NOTA: String = 'CancelarNFe';
  NFE_FUNC_CONSULTA_CHAVE: String = 'ConsultarProtocolo';
  NFE_FUNC_CONSULTA_CADASTRO: String = 'ConsultarCadastro';
  NFE_FUNC_CONSULTA_LOTE: String = 'ConsultarLote';
  NFE_FUNC_IMPRESSAO_DANFE: String = 'ImprimirDanfe';
  NFE_FUNC_ENVIA_LOTE: String = 'EnviarLote';
  NFE_FUNC_ENVIA_EMAIL: String = 'EnviarEmail';
  NFE_FUNC_INUT: String = 'InutilizarNumeracao';
  NFE_FUNC_STATUS: String = 'ConsultarStatus';
  NFE_FUNC_SALVA_DANFE_PDF = 'SalvarDanfePdf';
  NFE_FUNC_PRE_VISUALIZA_DANFE = 'PrevisualizarDanfe';
  NFE_FUNC_BAIXAR_XML = 'BaixarXMLNFe';
  NFE_FUNC_EXPORTA_NFES = 'ExportarNFes';
  NFE_FUNC_CARTA_CORRECAO = 'CartaCorrecao';
  NFE_FUNC_MANIFESTACAO_DESTINATARIO = 'ManifestacaoDestinatario';
  NFE_FUNC_ENVIA_EMAIL_CCE = 'EnviarEmailCCe';
  NFE_FUNC_SALVA_CCE_PDF = 'SalvarCCePdf';
  NFE_FUNC_IMPRESSAO_CCE = 'ImprimirCCe';
  NFE_FUNC_CONSULTAR_NFES = 'ConsultarNFes';

  CTE_FUNC_CANCELA: String = 'CancelarCTe';
  CTE_FUNC_CONSULTA_CHAVE: String = 'ConsultarProtocoloCTe';
  CTE_FUNC_CONSULTA_CADASTRO: String = 'ConsultaCadastroCTe';
  CTE_FUNC_CONSULTA_LOTE: String = 'ConsultarLoteCTe';
  CTE_FUNC_IMPRESSAO_DACTE: String = 'ImprimirDacte';
  CTE_FUNC_ENVIA_LOTE: String = 'EnviarLoteCTe';
  CTE_FUNC_ENVIA_EMAIL: String = 'EnviarEmailCTe';
  CTE_FUNC_INUT: String = 'InutilizarNumeracaoCTe';
  CTE_FUNC_STATUS: String = 'ConsultarStatusCTe';
  CTE_FUNC_SALVA_DACTE_PDF = 'SalvarDactePdf';
  NFE_FUNC_PRE_VISUALIZA_DACTE = 'PrevisualizarDacte';
  CTE_FUNC_EXPORTA_CTES = 'ExportarCTes';
  CTE_FUNC_ENVIA_EMAIL_CCE = 'EnviarEmailCCeCTe';
  CTE_FUNC_SALVA_CCE_PDF = 'SalvarCCePdfCTe';
  CTE_FUNC_IMPRESSAO_CCE = 'ImprimirCCeCTe';
  CTE_FUNC_REGISTRA_EVENTO = 'RegistrarEventoCTe';

  MDFE_FUNC_CONSULTA_CHAVE: String = 'ConsultarProtocoloMDFe';
  MDFE_FUNC_CONSULTA_LOTE: String = 'ConsultarLoteMDFe';
  MDFE_FUNC_IMPRESSAO_DAMDFE: String = 'ImprimirDamdfe';
  MDFE_FUNC_ENVIA_LOTE: String = 'EnviarLoteMDFe';
  MDFE_FUNC_ENVIA_EMAIL: String = 'EnviarEmailMDFe';
  MDFE_FUNC_MDFENAOENC: String = 'ConsultarMDFesNaoEncerrados';
  MDFE_FUNC_STATUS: String = 'ConsultarStatusMDFe';
  MDFE_FUNC_SALVA_DAMDFE_PDF = 'SalvarDamdfePdf';
  NFE_FUNC_PRE_VISUALIZA_DAMDFE = 'PrevisualizarDamdfe';
  MDFE_FUNC_EXPORTA_MDFES = 'ExportarMDFes';
  MDFE_FUNC_REGISTRA_EVENTO = 'RegistrarEventoMDFe';

  NFSE_FUNC_CANCELA_NOTA: String = 'CancelarNFSe';
  NFSE_FUNC_CONSULTA_LOTE: String = 'ConsultarLoteRps';
  NFSE_FUNC_CONSULTA_SITUACAO_LOTE: String = 'ConsultarSituacaoLote';
  NFSE_FUNC_IMPRESSAO_DANFE: String = 'ImprimirDanfe';
  NFSE_FUNC_ENVIA_LOTE: String = 'EnviarLoteRps';
  NFSE_FUNC_ENVIA_EMAIL: String = 'EnviarEmail';
  NFSE_FUNC_CONSULTA_NOTA_RPS: String = 'ConsultarNFSeRps';
  NFSE_FUNC_CONSULTA_NOTA: String = 'ConsultarNFSe';
  NFSE_FUNC_SALVA_DANFE_PDF = 'SalvarDanfePdf';

  NFE_SERVER_PORT: Integer = 2011;
  NFE_SERVER_ENDPOINT: String = '/cemapa.nfe';

implementation

uses
  SysUtils, StrUtils;

{ TNFeCliente }

function TNFeCliente.Chama(Funcao: String;
  TipoFuncao: TTipoFuncao; Pars: TRPCParams; DescricaoAcao: String = ''): TNFeRPCRetorno;
var
  Res: TConexaoRPCResultado;
begin
  Res := TConexaoRPCResultado.Create;
  NotificaListeners(TNFeClienteEvento.Create(TipoFuncao, evChamada, Servidor, Pars.ToArray, 0));
  if FConexao.ChamaFuncao(Funcao, Pars, Res) then
  begin
    Result := TNFeRPCRetorno.Create(Res.Resultado.AsString);
    NotificaListeners(TNFeClienteEvento.Create(TipoFuncao, evRetorno, Servidor, Pars.ToArray, Result.Status));
  end
  else
  begin
    Result := TNFeRPCRetorno.Create;
    Result.Status := NFE_ERRO;
    Result.Motivo := 'Erro em ' + IfThen(DescricaoAcao = '', Funcao, QuotedStr(
        DescricaoAcao)) + #13 + #10 + FConexao.MsgErro;
    if PosEx(UpperCase('socket error'), UpperCase(FConexao.MsgErro)) > 0 then
      Result.Descricao := 'Verifique se o servidor (' + FConexao.Host + ':' +
          IntToStr(FConexao.Port) + ') está OK';
  end;
end;

class procedure TNFeCliente.AddListener(Listener: INFeClienteListener);
var
  i: Integer;
begin
  i := Length(FListeners);
  SetLength(FListeners, i + 1);
  FListeners[i] := Listener;
end;


function TNFeCliente.CancelaNota(IdLote, CodUFIBGE, Ambiente, NumNota: Integer;
  Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_CANCELA_NOTA, fuCancelaNota, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIBGE).Add(Ambiente), 'Cancelamento da nota ' + IntToStr(NumNota));
end;
function TNFeCliente.ConsultaChave(Filial, CodUFIBGE, Ambiente: Integer;
  Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_CONSULTA_CHAVE, fuConsultaProtocolo, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(Chave), 'Consulta da nota ' + Chave);
end;

function TNFeCliente.ConsultaCadastro(Filial: Integer;
  UFCadastro: String; ParamConsulta: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_CONSULTA_CADASTRO, fuConsultaCadastro, (TRPCParams.Create).
            Add(Filial).Add(UFCadastro).Add(ParamConsulta), 'Consulta ao Cadastro de Contribuites');
end;

function TNFeCliente.ConsultaLote(IdLote: Longint; CodUFIBGE: Integer): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_CONSULTA_LOTE, fuConsultaLote, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIBGE), 'Consulta do lote ' + IntToStr(IdLote));
end;

function TNFeCliente.ConsultaStatus(Filial, CodUFIBGE, Ambiente: Integer; TpEmissao: Integer; Modelo: Integer): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_STATUS, fuStatus, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(TpEmissao).Add(Modelo),
      'Consulta do status no estado ' + IntToStr(CodUFIBGE));
end;

function TNFeCliente.EnviaEmail(Chave, Email, Assunto, Corpo: String; XML,
  PDF, NFe: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_ENVIA_EMAIL, fuEnviaEmail, (TRPCParams.Create).
      Add(Chave).Add(Email).Add(Assunto).Add(Corpo).Add(XML).Add(PDF).Add(NFe),
      'Envio de e-mail para <' + Email + '>');
end;

function TNFeCliente.EnviaEmailCCe(IdEvento: String; Email, Assunto,
  Corpo: String; XML, PDF: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_ENVIA_EMAIL_CCE, fuEnviaEmailCCe, (TRPCParams.Create).
      Add(IdEvento).Add(Email).Add(Assunto).Add(Corpo).Add(XML).Add(PDF),
      'Envio de e-mail para <' + Email + '>');
end;

function TNFeCliente.EnviaLote(IdLote: Longint; CodUFIbge: Integer;
    Consultar: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_ENVIA_LOTE, fuEnviaLote, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIbge).Add(Consultar), 'Envio do lote ' + FloatToStr(IdLote));
end;

function TNFeCliente.SalvaDanfePdf(Chave: String; NFe: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_SALVA_DANFE_PDF, fuSalvaDanfePdf, (TRPCParams.Create).
      Add(Chave).Add(NFe), 'Salvando a Danfe da NF-e ' + Chave + ' em PDF');
end;

function TNFeCliente.PrevisualizaDanfe(Chave: String; NFe: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_PRE_VISUALIZA_DANFE, fuPrevisualizaDanfe, (TRPCParams.Create).
      Add(Chave).Add(NFe), 'Gerando a pré-visualização da DANFe ' + Chave);
end;

function TNFeCliente.ExportaNFes(Filial, Cadastro: Integer; DataInicial,
  DataFinal: TDateTime; Saida, Entrada, Xml, Pdf, NFe: Boolean): TNFeRPCRetorno;
begin
  Result := Chama( NFE_FUNC_EXPORTA_NFES, fuExportaNFes,(TRPCParams.Create).
      Add(Filial).Add(Cadastro).Add(DataInicial).Add(DataFinal).Add(Saida).Add(Entrada).Add(Xml).Add(Pdf).Add(NFe),
      'Exportando Notas por Período');
end;

function TNFeCliente.SalvaCCePdf(IdEvento: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_SALVA_CCE_PDF, fuSalvaCCePdf, (TRPCParams.Create).
      Add(IdEvento), 'Salvando a CC-e em PDF');
end;

function TNFeCliente.ImprimeDanfe(Chave, Impressora: String;
  Copias: Integer; NFe: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_IMPRESSAO_DANFE, fuImprimeDanfe, (TRPCParams.Create).
      Add(Copias).Add(Chave).Add(Impressora).Add(NFe), 'Impressão da DANFE ' + Chave);
end;

function TNFeCliente.ImprimeCCe(IdEvento: String;
  Impressora: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_IMPRESSAO_CCE, fuImprimeCCe, (TRPCParams.Create).Add(IdEvento).Add(Impressora),
                  'Impressão da CC-e ');
end;

function TNFeCliente.InutilizaNumeracao(Filial, CodUFIBGE, Serie, Ambiente,
  NumIni, NumFim: Integer; Justificativa: String; TpEmissao, Modelo, CodUsuario: Integer): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_INUT, fuInut, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Serie).Add(Ambiente).
      Add(NumIni).Add(NumFim).Add(Justificativa).Add(TpEmissao).Add(Modelo).Add(CodUsuario),
      'Inutilização da numeração ' + IntToStr(NumIni) + ' - ' + IntToStr(NumFim));
end;

function TNFeCliente.CartaCorrecao(IdEvento: String; COrgao,
  Ambiente: Integer; ChaveAcesso:String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_CARTA_CORRECAO,fuCartaCorrecao, (TRPCParams.Create).
      Add(IdEvento).Add(COrgao).Add(Ambiente),'CC-e da nota '+ChaveAcesso);
end;

function TNFeCliente.ManifestacaoDestinatario(IdLote, COrgao, Ambiente,
  NumNota: Integer): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_MANIFESTACAO_DESTINATARIO,fuManifestacaoDestinatario, (TRPCParams.Create).
      Add(IdLote).Add(COrgao).Add(Ambiente),'Manifestação do Destinatário da nota '+IntToStr(NumNota));
end;

function TNFeCliente.BaixarXMLNFe(Filial, Ambiente: Integer; Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_BAIXAR_XML,fuBaixarXMLNFe, (TRPCParams.Create).
      Add(Filial).Add(Ambiente).Add(Chave),'Download do XML da Nota '+Chave);
end;

function TNFeCliente.CancelaCTe(Filial, CodUFIBGE, Ambiente,
  NumCTe: Integer; Chave, Protocolo, Justificativa: String): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_CANCELA, fuCancelaCTe, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(Chave).Add(Protocolo).Add(Justificativa), 'Cancelamento do CT-e ' + IntToStr(NumCTe));
end;

function TNFeCliente.ConsultaChaveCTe(Filial, CodUFIBGE, Ambiente: Integer;
  Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_CONSULTA_CHAVE, fuConsultaProtocoloCTe, (TRPCParams.Create).
     Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(Chave), 'Consulta do CT-e ' + Chave);
end;

function TNFeCliente.ConsultaCadastroCTe(Filial, CodUFIBGE: Integer;
  UFCadastro: String; TipoParamConsulta: Integer; ParamConsulta: String;
  Ambiente: Integer): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_CONSULTA_CADASTRO, fuConsultaCadastroCTe, (TRPCParams.Create).
            Add(Filial).Add(CodUFIBGE).Add(UFCadastro).Add(TipoParamConsulta).Add(ParamConsulta).
            Add(Ambiente), 'Consulta ao Cadastro de Contribuites');
end;

function TNFeCliente.ConsultaLoteCTe(IdLote,
  CodUFIBGE: Integer): TNFeRPCRetorno;
begin
    Result := Chama(CTE_FUNC_CONSULTA_LOTE, fuConsultaLoteCTe, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIBGE), 'Consulta do lote ' + IntToStr(IdLote));
end;

function TNFeCliente.ConsultaStatusCTe(Filial, CodUFIBGE, Ambiente,
  TpEmissao: Integer): TNFeRPCRetorno;
begin
    Result := Chama(CTE_FUNC_STATUS, fuStatusCTe, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(TpEmissao),
      'Consulta do status no estado ' + IntToStr(CodUFIBGE));
end;

function TNFeCliente.EnviaEmailCCeCTe(IdEvento: String; Email, Assunto,
  Corpo: String; XML, PDF: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_ENVIA_EMAIL_CCE, fuEnviaEmailCCeCTe, (TRPCParams.Create).
      Add(IdEvento).Add(Email).Add(Assunto).Add(Corpo).Add(XML).Add(PDF),
      'Envio de e-mail para <' + Email + '>');
end;

function TNFeCliente.EnviaEmailCTe(Chave, Email, Assunto, Corpo: String;
  XML, PDF: Boolean): TNFeRPCRetorno;
begin
    Result := Chama(CTE_FUNC_ENVIA_EMAIL, fuEnviaEmailCTe, (TRPCParams.Create).
      Add(Chave).Add(Email).Add(Assunto).Add(Corpo).Add(XML).Add(PDF),
      'Envio de e-mail para <' + Email + '>');
end;

function TNFeCliente.EnviaLoteCTe(IdLote, CodUFIbge: Integer;
  Consultar: Boolean): TNFeRPCRetorno;
begin
    Result := Chama(CTE_FUNC_ENVIA_LOTE, fuEnviaLoteCTe, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIbge).Add(Consultar), 'Envio do lote ' + FloatToStr(IdLote));
end;

function TNFeCliente.ExportaCTes(Filial, Remetente, Destinatario: Integer; DataInicial,
  DataFinal: TDateTime; Xml, Pdf, Cancelado: Boolean): TNFeRPCRetorno;
begin
  Result := Chama( CTE_FUNC_EXPORTA_CTES, fuExportaCTes,(TRPCParams.Create).
      Add(Filial).Add(Remetente).Add(Destinatario).Add(DataInicial).Add(DataFinal).Add(Xml).Add(Pdf).Add(Cancelado),
      'Exportando CT-es por Período');
end;

function TNFeCliente.ImprimeCCeCTe(IdEvento: String;
  Impressora: String): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_IMPRESSAO_CCE, fuImprimeCCeCTe, (TRPCParams.Create).Add(IdEvento).Add(Impressora),
                  'Impressão da CC-e ');
end;

function TNFeCliente.ImprimeDacte(Chave, Impressora: String;
  Copias: Integer): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_IMPRESSAO_DACTE, fuImprimeDacte, (TRPCParams.Create).
      Add(Copias).Add(Chave).Add(Impressora), 'Impressão do Dacte ' + Chave);
end;

function TNFeCliente.InutilizaNumeracaoCTe(Filial, CodUFIBGE, Serie,
  Ambiente, NumIni, NumFim: Integer; Justificativa: String;
  TpEmissao, Modelo, CodUsuario: Integer): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_INUT, fuInutCTe, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Serie).Add(Ambiente).
      Add(NumIni).Add(NumFim).Add(Justificativa).Add(TpEmissao).Add(Modelo).Add(CodUsuario),
      'Inutilização da numeração ' + IntToStr(NumIni) + ' - ' + IntToStr(NumFim));
end;

function TNFeCliente.SalvaCCeCTePdf(IdEvento: String): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_SALVA_CCE_PDF, fuSalvaCCeCTePdf, (TRPCParams.Create).
      Add(IdEvento), 'Salvando a CC-e em PDF');
end;

function TNFeCliente.SalvaDactePdf(Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_SALVA_DACTE_PDF, fuSalvaDactePdf, (TRPCParams.Create).
      Add(Chave), 'Salvando o Dacte do CT-e ' + Chave + ' em PDF');
end;

function TNFeCliente.RegistraEventoCTe(CodUFIBGE, Ambiente, CTe: Integer;
  IdEvento: String): TNFeRPCRetorno;
begin
  Result := Chama(CTE_FUNC_REGISTRA_EVENTO, fuRegistraEventoCTe, (TRPCParams.Create)
      .Add(CodUFIBGE).Add(Ambiente).Add(IdEvento), 'Registrando evento para o CT-e nº'+
  IntToStr(CTe));
end;

function TNFeCliente.ConsultaChaveMDFe(Filial, CodUFIBGE,
  Ambiente, MDFe: Integer; Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_CONSULTA_CHAVE, fuConsultaProtocoloMDFe, (TRPCParams.Create).
      Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(Chave), 'Consultando o MDF-e nº ' +
      IntToStr(MDFe));
end;

function TNFeCliente.ConsultaLoteMDFe(IdLote,
  CodUFIBGE: Integer): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_CONSULTA_LOTE, fuConsultaLoteMDFe, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIBGE), 'Consultando o Lote nº ' + IntToStr(IdLote));
end;
function TNFeCliente.ConsultaMDFesNaoEncerrados(Filial, CodUFIBGE,
  Ambiente: Integer; Versao: String): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_MDFENAOENC, fuConsultaMDFesNaoEncerrados, (TRPCParams.Create)
      .Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(Versao),
      'Consultando MDF-es não encerrados');
end;

function TNFeCliente.ConsultaStatusMDFe(Filial, CodUFIBGE, Ambiente,
  TpEmissao: Integer): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_STATUS, fuStatusMDFe, (TRPCParams.Create)
      .Add(Filial).Add(CodUFIBGE).Add(Ambiente).Add(TpEmissao),
      'Consultando o status do serviço');
end;

function TNFeCliente.EnviaEmailMDFe(Chave, Email, Assunto, Corpo: String;
  XML, PDF: Boolean; MDFe: Integer): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_ENVIA_EMAIL, fuEnviaEmailMDFe, (TRPCParams.Create)
      .Add(Chave).Add(Email).Add(Assunto).Add(Corpo).Add(XML).Add(PDF),
      'Enviando email do MDF-e n º' + IntToStr(MDFe));
end;

function TNFeCliente.EnviaLoteMDFe(IdLote, CodUFIbge: Integer;
  Consultar: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_ENVIA_LOTE, fuEnviaLoteCTe, (TRPCParams.Create).
      Add(IdLote).Add(CodUFIbge).Add(Consultar), 'Envio do lote ' + FloatToStr(IdLote));
end;

function TNFeCliente.ExportaMDFes(Filial: Integer; DataInicial,
  DataFinal: TDateTime; Xml, Pdf: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_EXPORTA_MDFES, fuExportaMDFes, (TRPCParams.Create)
      .Add(Filial).Add(DataInicial).Add(DataFinal).Add(Xml).Add(Pdf),
      'Exportando MDF-es por período.');
end;

function TNFeCliente.ImprimeDamdfe(Chave, Impressora: String;
  Copias, MDFe: Integer): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_IMPRESSAO_DAMDFE, fuImprimeDamdfe, (TRPCParams.Create)
      .Add(Copias).Add(Chave).Add(Impressora), 'Imprimindo Damdfe nº ' +
  IntToStr(MDFe));
end;

function TNFeCliente.RegistraEventoMDFe(CodUFIBGE, Ambiente, MDFe: Integer;
  IdEvento: String): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_REGISTRA_EVENTO, fuRegistraEventoMDFe, (TRPCParams.Create)
      .Add(CodUFIBGE).Add(Ambiente).Add(IdEvento), 'Registrando evento para o MDF-e nº'+
  IntToStr(MDFe));
end;

function TNFeCliente.SalvaDamdfePdf(Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(MDFE_FUNC_SALVA_DAMDFE_PDF, fuSalvaDamdfePdf, (TRPCParams.Create)
      .Add(Chave), 'Exportando Damdfe para o formato PDF');
end;

function TNFeCliente.EnviaLoteRps(IdLote, CodIbgeCidade: Integer;
  Consultar: Boolean): TNFeRPCRetorno;
begin
  Result := Chama(NFSE_FUNC_ENVIA_LOTE, fuEnviaLoteRps, (TRPCParams.Create).
      Add(IdLote).Add(CodIbgeCidade).Add(Consultar), 'Envio do lote de Rps nº ' + FloatToStr(IdLote));
end;

function TNFeCliente.ConsultaNFSeRps(Filial, CodIbgeCidade, NumeroRps: Integer;
  ChaveAcesso: String; SerieRps, TipoRps: String): TNFeRPCRetorno;
begin
  Result := Chama(NFSE_FUNC_CONSULTA_NOTA_RPS, fuConsultaNFSeRps, (TRPCParams.Create).
      Add(Filial).Add(CodIbgeCidade).Add(NumeroRps).Add(ChaveAcesso).Add(SerieRps).Add(TipoRps),
      'Consulta de NFS-e pelo Rps nº ' + IntToStr(NumeroRps));
end;

function TNFeCliente.ConsultaSitLote(Filial, CodIbgeCidade: Integer; Protocolo: String): TNFeRPCRetorno;
begin
  Result := Chama(NFSE_FUNC_CONSULTA_SITUACAO_LOTE, fuConsultaSituacaoLoteRps, (TRPCParams.Create).
      Add(Filial).Add(CodIbgeCidade).Add(Protocolo), 'Consulta da Situação do Lote Rps - Protocolo nº ' + Protocolo);
end;

function TNFeCliente.ConsultaLoteRps(IdLote,
  CodIbgeCidade: Integer; Protocolo: String): TNFeRPCRetorno;
begin
  Result := Chama(NFSE_FUNC_CONSULTA_LOTE, fuConsultaLoteRps, (TRPCParams.Create).
      Add(IdLote).Add(CodIbgeCidade).Add(Protocolo), 'Consulta de Lote Rps - Protocolo nº ' + Protocolo);
end;

function TNFeCliente.ConsultaNFSe(Filial,
  CodIbgeCidade: Integer; ChaveAcesso, NumeroNFSe: String; DataInicial, DataFinal: TDateTime; CnpjTomador,
  InscTomador, RazaoSocialIntServico, CnpjIntServico,
  InscIntServico: String): TNFeRPCRetorno;
begin
  Result := Chama(NFSE_FUNC_CONSULTA_NOTA, fuConsultaNFSe, (TRPCParams.Create).
      Add(Filial).Add(CodIbgeCidade).Add(ChaveAcesso).Add(NumeroNFSe).Add(DataInicial).
      Add(DataFinal).Add(CnpjTomador).Add(InscTomador).Add(RazaoSocialIntServico).
      Add(CnpjIntServico).Add(InscIntServico), 'Consulta da NFS-e nº ' + ChaveAcesso);
end;

function TNFeCliente.CancelaNFSe(Filial,
  CodIbgeCidade: Integer; NumeroNFSe, ChaveAcesso: String; CodCancelamento: String): TNFeRPCRetorno;
begin
  Result := Chama(NFSE_FUNC_CANCELA_NOTA, fuCancelaNFSe, (TRPCParams.Create).
      Add(Filial).Add(CodIbgeCidade).Add(NumeroNFSe).Add(ChaveAcesso).Add(CodCancelamento),
      'Cancelamento da NFS-e nº ' + NumeroNFSe);
end;

constructor TNFeCliente.Create(Servidor: String);
begin
  FConexao := TConexaoRPC.Create(Servidor, NFE_SERVER_PORT, NFE_SERVER_ENDPOINT);
  FServidor := Servidor;
end;

constructor TNFeCliente.Create;
begin
  Raise Exception.Create('Você não pode instanciar um cliente NF-e desta maneira. Use o GetNFeCliente.');
end;

class function TNFeCliente.GetNFeCliente(Servidor: String): TNFeCliente;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Length(NFeClientes) - 1 do
    if (NFeClientes[i] <> nil) and (NFeClientes[i].Servidor = Servidor) then
    begin
      Result := NFeClientes[i];
      Break;
    end;
  if (Result = nil) then
  begin
    Result := TNFeCliente.Create(Servidor);
    i := Length(NFeClientes);
    SetLength(NFeClientes, i + 1);
    NFeClientes[i] := Result;
  end;
end;

class procedure TNFeCliente.NotificaListeners(Evento: TNFeClienteEvento);
var
  i: Integer;
begin
  for i := 0 to Length(FListeners) - 1 do
    if (FListeners[i] <> nil) then
      FListeners[i].EventoOcorrido(Evento);
end;

class procedure TNFeCliente.RemoveListener(Listener: INFeClienteListener);
var
  i: Integer;
begin
  for i := 0 to Length(FListeners) - 1 do
    if FListeners[i] = Listener then
      FListeners[i] := nil;
end;



function TNFeCliente.PrevisualizaDacte(Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_PRE_VISUALIZA_DACTE, fuPrevisualizaDacte, (TRPCParams.Create).
      Add(Chave), 'Gerando a pré-visualização do DACTe ' + Chave);
end;

function TNFeCliente.PrevisualizaDamdfe(Chave: String): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_PRE_VISUALIZA_DAMDFE, fuPrevisualizaDamdfe, (TRPCParams.Create).
      Add(Chave), 'Gerando a pré-visualização do DAMDFe ' + Chave);
end;

function TNFeCliente.ConsultaNFes(Filial: integer): TNFeRPCRetorno;
begin
  Result := Chama(NFE_FUNC_CONSULTAR_NFES,fuConsultaNFes, (TRPCParams.Create).
      Add(Filial),'Consulta de NF-es emitidas para a filial '+ IntToStr(Filial));
end;

{ TNFeClienteEvento }

constructor TNFeClienteEvento.Create(Funcao: TTipoFuncao;
  Evento: TTipoEvento; Servidor: String; Params: TParamsArray; Valor: Integer);
begin
  FFuncao := Funcao;
  FEvento := Evento;
  FServidor := Servidor;
  FParams := Params;
  FValor := Valor;
end;

end.
