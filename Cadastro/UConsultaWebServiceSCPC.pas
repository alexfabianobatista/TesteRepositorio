// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : C:\Users\Usuario\Desktop\consultaWebService.xml
// Encoding : UTF-8
// Version  : 1.0
// (20/07/2012 10:26:09 - 1.33.2.5)
// ************************************************************************ //

unit UConsultaWebServiceSCPC;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:produtos        - "http://webservice.consulta.spcjava.spcbrasil.org/"
  // !:filtro          - "http://webservice.consulta.spcjava.spcbrasil.org/"
  // !:resultado       - "http://webservice.consulta.spcjava.spcbrasil.org/"
  // !:codigo-produto  - "http://webservice.consulta.spcjava.spcbrasil.org/"
  // !:produto         - "http://webservice.consulta.spcjava.spcbrasil.org/"

  TResultado = class(TRemotable)
  private
    pprotocolo: string;
    poperador: string;
    pdata: string;
    prestricao: string;
    pbase_inoperante: string;
    pconsumidor: string;
    pgrafia_pj: string;
    pendereco_cep_consultado: string;
    ptelefone_consultado: string;
    ptelefone_vinculado_consumidor: string;
    ptelefone_vinculado_assinante_consultado: string;
    pultimo_telefone_informado: string;
    pparticipacao_empresa: string;
    psocio: string;
    padministrador: string;
    palerta_doumento: string;
    pspc: string;
    pcheque_lojista: string;
    pccf: string;
    pcontra_ordem: string;
    pcontra_ordem_documento_diferente: string;
    pcontra_ordem_agencia_diferente: string;
    pacao: string;
    pprotesto: string;
    pcontumacia: string;
    pcredito_concedido: string;
    pbanco_agencia_conta_documento_diferente: string;
    pdados_agencia_bancaria: string;
    pconsulta_realizada: string;
    pinformacao_poder_judiciario: string;
    priskscoring: string;
    pcheque_sem_fundo_achei: string;
    pcheque_sem_fundo_achei_ccf: string;
    pcontumacia_srs: string;
    pparticipacao_falencia: string;
    prestricao_financeira: string;
    ppendencia_financeira: string;
    pcheque_sem_fundo_varejo: string;
    pcontra_ordem_srs: string;
    pcontra_ordem_documento_diferente_srs: string;
    pcheque_outras_ocorrencias_srs: string;
    pcheque_consulta_online_srs: string;
    pconsulta_realizada_cheque: string;
    preferenciais_negocios: string;
    phistorico_pagamento: string;
    prelacionamento_mais_antigo_com_fornecedores: string;
    pregistro_consulta: string;
    pultimas_consultas: string;
    pcapital_social: string;
    pantecessora: string;
    patividade_empresa: string;
    pfilial: string;
    pinformacoes_adicionais: string;
    pincorporacao_fusao_cisao: string;
    pprincipais_produtos: string;
    pmensagem_complementar: string;
  public
  published
    property protocolo: string read pprotocolo write pprotocolo;
    property operador: string read poperador write poperador;
    property data: string read pdata write pdata;
    property restricao: string read prestricao write prestricao;
    property base_inoperante: string read pbase_inoperante write pbase_inoperante;
    property consumidor: string read pconsumidor write pconsumidor;
    property grafia_pj: string read pgrafia_pj write pgrafia_pj;
    property endereco_cep_consultado: string read pendereco_cep_consultado write pendereco_cep_consultado;
    property telefone_consultado: string read ptelefone_consultado write ptelefone_consultado;
    property telefone_vinculado_consumidor: string read ptelefone_vinculado_consumidor write ptelefone_vinculado_consumidor;
    property telefone_vinculado_assinante_consultado: string read ptelefone_vinculado_assinante_consultado write ptelefone_vinculado_assinante_consultado;
    property ultimo_telefone_informado: string read pultimo_telefone_informado write pultimo_telefone_informado;
    property participacao_empresa: string read pparticipacao_empresa write pparticipacao_empresa;
    property socio: string read psocio write psocio;
    property administrador: string read padministrador write padministrador;
    property alerta_doumento: string read palerta_doumento write palerta_doumento;
    property spc: string read pspc write pspc;
    property cheque_lojista: string read pcheque_lojista write pcheque_lojista;
    property ccf: string read pccf write pccf;
    property contra_ordem: string read pcontra_ordem write pcontra_ordem;
    property contra_ordem_documento_diferente: string read pcontra_ordem_documento_diferente write pcontra_ordem_documento_diferente;
    property contra_ordem_agencia_diferente: string read pcontra_ordem_agencia_diferente write pcontra_ordem_agencia_diferente;
    property acao: string read pacao write pacao;
    property protesto: string read pprotesto write pprotesto;
    property contumacia: string read pcontumacia write pcontumacia;
    property credito_concedido: string read pcredito_concedido write pcredito_concedido;
    property banco_agencia_conta_documento_diferente: string read pbanco_agencia_conta_documento_diferente write pbanco_agencia_conta_documento_diferente;
    property dados_agencia_bancaria: string read pdados_agencia_bancaria write pdados_agencia_bancaria;
    property consulta_realizada: string read pconsulta_realizada write pconsulta_realizada;
    property informacao_poder_judiciario: string read pinformacao_poder_judiciario write pinformacao_poder_judiciario;
    property riskscoring: string read priskscoring write priskscoring;
    property cheque_sem_fundo_achei: string read pcheque_sem_fundo_achei write pcheque_sem_fundo_achei;
    property cheque_sem_fundo_achei_ccf: string read pcheque_sem_fundo_achei_ccf write pcheque_sem_fundo_achei_ccf;
    property contumacia_srs: string read pcontumacia_srs write pcontumacia_srs;
    property participacao_falencia: string read pparticipacao_falencia write pparticipacao_falencia;
    property restricao_financeira: string read prestricao_financeira write prestricao_financeira;
    property pendencia_financeira: string read ppendencia_financeira write ppendencia_financeira;
    property cheque_sem_fundo_varejo: string read pcheque_sem_fundo_varejo write pcheque_sem_fundo_varejo;
    property contra_ordem_srs: string read pcontra_ordem_srs write pcontra_ordem_srs;
    property contra_ordem_documento_diferente_srs: string read pcontra_ordem_documento_diferente_srs write pcontra_ordem_documento_diferente_srs;
    property cheque_outras_ocorrencias_srs: string read pcheque_outras_ocorrencias_srs write pcheque_outras_ocorrencias_srs;
    property cheque_consulta_online_srs: string read pcheque_consulta_online_srs write pcheque_consulta_online_srs;
    property consulta_realizada_cheque: string read pconsulta_realizada_cheque write pconsulta_realizada_cheque;
    property referenciais_negocios: string read preferenciais_negocios write preferenciais_negocios;
    property historico_pagamento: string read phistorico_pagamento write phistorico_pagamento;
    property relacionamento_mais_antigo_com_fornecedores: string read prelacionamento_mais_antigo_com_fornecedores write prelacionamento_mais_antigo_com_fornecedores;
    property registro_consulta: string read pregistro_consulta write pregistro_consulta;
    property ultimas_consultas: string read pultimas_consultas write pultimas_consultas;
    property capital_social: string read pcapital_social write pcapital_social;
    property antecessora: string read pantecessora write pantecessora;
    property atividade_empresa: string read patividade_empresa write patividade_empresa;
    property filial: string read pfilial write pfilial;
    property informacoes_adicionais: string read pinformacoes_adicionais write pinformacoes_adicionais;
    property incorporacao_fusao_cisao: string read pincorporacao_fusao_cisao write pincorporacao_fusao_cisao;
    property principais_produtos: string read pprincipais_produtos write pprincipais_produtos;
    property mensagem_complementar: string read pmensagem_complementar write pmensagem_complementar;
  end;


  filtro = class(TRemotable)
  private
    pCodigo_produto: String;
    pTipo_consumidor: String;
    pDocumento_consumidor: String;
    pCep_consumidor: String;
    pTelefone_consultar: String;
    pUtiliza_CMC7: String;
    pBanco_cheque_inicial: String;
    pAgencia_cheque_inicial: String;
    pConta_corrente_cheque_inicial: String;
    pDigito_conta_corrente_cheque_inicial: String;
    pNumero_cheque_inicial: String;
    pDigito_cheque_inicial: String;
    pCmc71_cheque_inicial: String;
    pCmc72_cheque_inicial: String;
    pCmc73_cheque_inicial: String;
    pQuantidade_cheque: String;
    pCheque_detalhado: String;
    pCodigo_insumo_opcional: String;
    pCep_origem: String;
    pCodigo_estacao_consultante: String;
  public
  published
    property Codigo_produto: String read pCodigo_produto write pCodigo_produto;
    property Tipo_consumidor: String read pTipo_consumidor write pTipo_consumidor;
    property Documento_consumidor: String read pDocumento_consumidor write pDocumento_consumidor;
    property Cep_consumidor: String read pCep_consumidor write pCep_consumidor;
    property Telefone_consultar: String read pTelefone_consultar write pTelefone_consultar;
    property Utiliza_CMC7: String read pUtiliza_CMC7 write pUtiliza_CMC7;
    property Banco_cheque_inicial: String read pBanco_cheque_inicial write pBanco_cheque_inicial;
    property Agencia_cheque_inicial: String read pAgencia_cheque_inicial write pAgencia_cheque_inicial;
    property Conta_corrente_cheque_inicial: String read pConta_corrente_cheque_inicial write pConta_corrente_cheque_inicial;
    property Digito_conta_corrente_cheque_inicial: String read pDigito_conta_corrente_cheque_inicial write pDigito_conta_corrente_cheque_inicial;
    property Numero_cheque_inicial: String read pNumero_cheque_inicial write pNumero_cheque_inicial;
    property Digito_cheque_inicial: String read pDigito_cheque_inicial write pDigito_cheque_inicial;
    property Cmc71_cheque_inicial: String read pCmc71_cheque_inicial write pCmc71_cheque_inicial;
    property Cmc72_cheque_inicial: String read pCmc72_cheque_inicial write pCmc72_cheque_inicial;
    property Cmc73_cheque_inicial: String read pCmc73_cheque_inicial write pCmc73_cheque_inicial;
    property Quantidade_cheque: String read pQuantidade_cheque write pQuantidade_cheque;
    property Cheque_detalhado: String read pCheque_detalhado write pCheque_detalhado;
    property Codigo_insumo_opcional: String read pCodigo_insumo_opcional write pCodigo_insumo_opcional;
    property Cep_origem: String read pCep_origem write pCep_origem;
    property Codigo_estacao_consultante: String read pCodigo_estacao_consultante write pCodigo_estacao_consultante;
  end;

  TProduto = class(TRemotable)
  private
    pCodigo: String;
    pNome: String;
    pParametro: String;
    pInsumo_opcional: String;
    pInsumo_retorno: String;
  public
  published
    property codigo: String read pCodigo write pCodigo;
    property nome: String read pNome write pNome;
    property parametro: String read pParametro write pParametro;
    property insumo_opcional: String read pInsumo_opcional write pInsumo_opcional;
    property insumo_retorno: String read pInsumo_retorno write pInsumo_retorno;
  end;

  produtos = Array of TProduto;

  codigo_produto = class(TRemotable)
  private
    pCodigo: Integer;
  public
  published
    property codigo: Integer read pCodigo write pCodigo;
  end;
  
  // ************************************************************************ //
  // Namespace : http://webservice.consulta.spcjava.spcbrasil.org/
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : document
  // binding   : consultaWebServicePortBinding
  // service   : consultaWebService
  // port      : consultaWebServicePort
  // URL       : https://treina.spc.org.br:443/spcjava/remoting/ws/consulta/consultaWebService
  // ************************************************************************ //
  consultaWebService = interface(IInvokable)
  ['{0C3F443E-0BD7-97D5-4298-925922114CEA}']
    function  listarProdutos: produtos; stdcall;
    function  consultar(const filtro: filtro): TResultado; stdcall;
    function  detalharProduto(const codigo_produto: codigo_produto): TProduto; stdcall;
  end;

function GetconsultaWebService(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): consultaWebService;


implementation

function GetconsultaWebService(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): consultaWebService;
const
  defWSDL = 'C:\Users\Usuario\Desktop\consultaWebService.xml';
  defURL  = 'https://treina.spc.org.br:443/spcjava/remoting/ws/consulta/consultaWebService';
  defSvc  = 'consultaWebService';
  defPrt  = 'consultaWebServicePort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as consultaWebService);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  InvRegistry.RegisterInterface(TypeInfo(consultaWebService), 'http://webservice.consulta.spcjava.spcbrasil.org/', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(consultaWebService), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(consultaWebService), ioDocument);
  InvRegistry.RegisterInvokeOptions(TypeInfo(consultaWebService), ioLiteral);
  //InvRegistry.RegisterExternalParamName(TypeInfo(consultaWebService), 'detalharProduto', 'codigo_produto', 'codigo-produto');

end.