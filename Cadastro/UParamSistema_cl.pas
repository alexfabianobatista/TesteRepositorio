unit UParamSistema_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMParamSistema = class(TDataModule)
    DSParamSistema: TDataSource;
    DSComissaoPrazo: TDataSource;
    QParamSistema: TOracleDataSet1;
    QComissaoPrazo: TOracleDataSet1;
    QParamSistemaIND_PRECO: TStringField;
    QParamSistemaCOD_EMPRESA: TStringField;
    QParamSistemaCOD_MOEDA: TIntegerField;
    QParamSistemaCOD_FILIAL: TIntegerField;
    QParamSistemaIND_PRECO2: TStringField;
    QParamSistemaIND_CUSTO: TStringField;
    QParamSistemaCOD_MOEDA_CUSTO: TIntegerField;
    QParamSistemaIND_TIPO_COMISSAO: TStringField;
    QParamSistemaIND_ACEITE_CP: TStringField;
    QParamSistemaIND_ACEITE_CR: TStringField;
    QParamSistemaNUM_GRAUS_CONTABIL: TIntegerField;
    QParamSistemaIND_TIPO_PLANO_CONTA: TStringField;
    QParamSistemaCOD_PRODUTO_ARDIDOS: TIntegerField;
    QParamSistemaCOD_PRODUTO_IMPUREZA: TIntegerField;
    QParamSistemaCOD_PRODUTO_QUEBRADOS: TIntegerField;
    QParamSistemaCOD_PRODUTO_TRIGUILHO: TIntegerField;
    QParamSistemaCOD_OPERACAO_ROMANEIO: TIntegerField;
    QParamSistemaCOD_OPERACAO_CONSUMO: TIntegerField;
    QParamSistemaCOD_SERIE_AGRICOLA: TStringField;
    QParamSistemaPERC_DESCONTO_VISTA: TFloatField;
    QParamSistemaPERC_ACRESCIMO_MES: TFloatField;
    QParamSistemaCOD_SERIE_NOTA: TStringField;
    QParamSistemaCOD_SERIE_PEDIDO: TStringField;
    QParamSistemaCOD_CADASTRO_FUNRURAL: TIntegerField;
    QParamSistemaCOD_FINALIDADE_CP_FUNRURAL: TIntegerField;
    QParamSistemaCOD_HISTORICO_OS: TIntegerField;
    QParamSistemaCOD_HISTORICO_CONTABIL_ZERA_EX: TIntegerField;
    QParamSistemaCOD_OPERACAO_CONT_ANT: TIntegerField;
    QParamSistemaSERIE_CONTRATO_ANT: TStringField;
    QParamSistemaCOD_HISTORICO_CONT_CAPITAL: TIntegerField;
    QParamSistemaCOD_HISTORICO_CONT_JURO: TIntegerField;
    QParamSistemaIND_CONTABILIZA: TStringField;
    QParamSistemaCOD_OPERACAO_CONT_GP: TIntegerField;
    QParamSistemaSERIE_CONTRATO_GP: TStringField;
    QParamSistemaDESC_LPT_NOTA: TStringField;
    QParamSistemaDESC_LPT_PEDIDO: TStringField;
    QParamSistemaIND_BAIXA_CP_BANCOS_CX: TStringField;
    QParamSistemaIND_ROTA: TStringField;
    QParamSistemaIND_TIPO_INTEGRACAO: TStringField;
    QParamSistemaDT_FECHAMENTO_SISTEMA: TDateTimeField;
    QComissaoPrazoNUM_DIAS: TIntegerField;
    QComissaoPrazoPERC_COMISSAO: TFloatField;
    QParamSistemaDESC_EMPRESA: TStringField;
    QParamSistemaDT_FECHAMENTO_CONTABIL: TDateTimeField;
    QParamSistemaCOD_MENSAGEM: TIntegerField;
    QParamSistemaDT_ANO_SAFRA: TStringField;
    QParamSistemaPERC_SEST_SENAT: TFloatField;
    QParamSistemaPERC_BASE_ICMS_DEVIDO: TFloatField;
    QParamSistemaPERC_ALIQ_ICMS_DEVIDO: TFloatField;
    QParamSistemaPERC_BASE_ICMS_PRESUMIDO: TFloatField;
    QParamSistemaPERC_ALIQ_ICMS_PRESUMIDO: TFloatField;
    QParamSistemaPERC_BASE_INSS_FRETE: TFloatField;
    QParamSistemaPERC_BASE_INSS_SERVICO: TFloatField;
    QParamSistemaPERC_ALIQ_INSS_SERVICO: TFloatField;
    QParamSistemaPERC_ALIQ_INSS_FRETE: TFloatField;
    QParamSistemaCOD_CONTABIL_FRETE_CRED: TStringField;
    QParamSistemaCOD_CONTABIL_FRETE_DEB: TStringField;
    QParamSistemaCOD_CONTABIL_IRF_CRED: TStringField;
    QParamSistemaCOD_CONTABIL_IRF_DEB: TStringField;
    QParamSistemaCOD_CONTABIL_SEST_CRED: TStringField;
    QParamSistemaCOD_CONTABIL_SEST_DEB: TStringField;
    QParamSistemaCOD_HISTORICO_CONTABIL_RPA: TIntegerField;
    QParamSistemaPERC_CONSUMO: TFloatField;
    QParamSistemaPERC_CONSUMO_MES: TFloatField;
    QParamSistemaIND_LEITURA_CHEQUE: TStringField;
    QParamSistemaDT_FECHAMENTO_FINANCEIRO: TDateTimeField;
    QParamSistemaCOD_CONTABIL_PEDAGIO_CRED: TStringField;
    QParamSistemaCOD_CONTABIL_PEDAGIO_DEB: TStringField;
    QParamSistemaCOD_HIST_CONTABIL_PEDAGIO: TIntegerField;
    QParamSistemaIND_BLOQUEIO_FIXACAO: TStringField;
    QParamSistemaNUM_DIAS_BLOQUEIO: TIntegerField;
    QParamSistemaDESC_SENHA_OFICINA: TStringField;
    QParamSistemaPERC_ALIQ_INSS_FRETE_FRE: TFloatField;
    QParamSistemaPERC_ALIQ_INSS_SERV_FRE: TFloatField;
    QParamSistemaVAL_INSS_MAXIMO_MES: TFloatField;
    QParamSistemaCOD_CONTABIL_INSS_CLIENTE_DEB: TStringField;
    QParamSistemaCOD_CONTABIL_INSS_CLIENTE_CRED: TStringField;
    QParamSistemaCOD_HIST_CONTABIL_ESTADIA: TIntegerField;
    QParamSistemaPERC_PIS: TFloatField;
    QParamSistemaPERC_COFINS: TFloatField;
    QParamSistemaIND_CONTROLE_VERSAO: TStringField;
    QParamSistemaHORA_LIMITE_FECHAMENTO: TStringField;
    QParamSistemaCOD_ENTIDADE_CONTABIL: TStringField;
    QParamSistemaIND_CADASTRO_OBRIGATORIO: TStringField;
    QParamSistemaIND_MAIUSCULO_CADASTRO: TStringField;
    QParamSistemaIND_MAIUSCULO_CONSULTA: TStringField;
    QParamSistemaIND_MAIUSCULO_PARAMETRO: TStringField;
    QParamSistemaIND_CAIXA_ZERADO: TStringField;
    QParamSistemaVAL_HORA_OFICINA: TFloatField;
    QParamSistemaVAL_HORA_CAMPO: TFloatField;
    QParamSistemaPERC_DESC_MAX_PECA: TFloatField;
    QParamSistemaPERC_DESC_MAX_SERVICO: TFloatField;
    QParamSistemaPERC_SERVICO_TERCEIRO: TFloatField;
    QParamSistemaIND_RG_CPF_NF: TStringField;
    QParamSistemaDESC_ASSUNTO_EMAIL: TStringField;
    QParamSistemaDESC_CORPO_EMAIL: TMemoField;
    QParamSistemaDESC_CORPO_EMAIL_CANC: TMemoField;
    QParamSistemaDESC_ASSUNTO_EMAIL_CANC: TStringField;
    QParamSistemaIND_BLOQUEIO_CGC: TStringField;
    QParamSistemaIND_CADASTRO_RUIM_VERMELHO: TStringField;
    QParamSistemaIND_CONTROLE_VEICULO: TStringField;
    QParamSistemaIND_OS_NOTA_SEPARADA: TStringField;
    QParamSistemaIND_COD_PRODUTO_NFE: TStringField;
    QParamSistemaCOD_OPERACAO_OS_SERVICO: TIntegerField;
    QParamSistemaCOD_SERIE_OS_SERVICO: TStringField;
    QParamSistemaIND_AMBIENTE_NFE: TIntegerField;
    QParamSistemaIND_TIPO_NOTA: TStringField;
    QParamSistemaNUM_VERSAO: TIntegerField;
    QParamSistemaIND_COD_CADASTRO_NFE: TStringField;
    QParamSistemaIND_DATA_RELATORIO_BANCOS: TStringField;
    QParamSistemaNUM_MAXIMO_ITENS_NOTA: TIntegerField;
    QParamSistemaIND_CONFIRMA_EMISSAO: TStringField;
    QParamSistemaIND_VENDA_SIMPLES: TStringField;
    QParamSistemaIND_FORMULARIO_DUPLICATA: TStringField;
    QParamSistemaIND_FORMULARIO_PROMISSORIA: TStringField;
    QParamSistemaCOD_CONTABIL_INVENTARIO: TStringField;
    QParamSistemaCOD_PRODUTO_SERVICO: TIntegerField;
    QParamSistemaCOD_HISTORICO_BORDERO_DEBITO: TIntegerField;
    QParamSistemaCOD_HISTORICO_BORDERO_TIT: TIntegerField;
    QParamSistemaCOD_HISTORICO_BORDERO_JUROS: TIntegerField;
    QParamSistemaIND_PIS_COFINS_CUSTO: TStringField;
    QParamSistemaNUM_DIAS_RENOVA_CADASTRO: TIntegerField;
    QParamSistemaIND_VALIDA_CAMPOS_NFE: TStringField;
    QParamSistemaIND_CALCULO_ICMS: TStringField;
    QCstpis: TOracleDataSet1;
    QCstpisCOD_CST_PIS: TStringField;
    QCstpisDESC_CST_PIS: TStringField;
    QCstpisDESC_COMPLETA: TStringField;
    DSCstPis: TDataSource;
    QCstCofins: TOracleDataSet1;
    QCstCofinsCOD_CST_COFINS: TStringField;
    QCstCofinsDESC_CST_COFINS: TStringField;
    QCstCofinsDESC_COMPLETA: TStringField;
    DSCstCofins: TDataSource;
    QParamSistemaCOD_CST_PIS_FRETE: TStringField;
    QParamSistemaCOD_CST_COFINS_FRETE: TStringField;
    QParamSistemaCOD_SERIE_MODELO_NOTA: TStringField;
    QParamSistemaCOD_SERIE_MODELO_PEDIDO: TStringField;
    QSerieModeloNotaCons: TOracleDataSet1;
    QSerieModeloNotaConsORDEM: TFloatField;
    QSerieModeloNotaConsCOD_SERIE_MODELO: TStringField;
    QSerieModeloNotaConsDESC_SERIE_MODELO: TStringField;
    QSerieModeloNotaConsDESC_COMPLETA: TStringField;
    DSSerieModeloNotaCons: TDataSource;
    QSerieModeloPedidoCons: TOracleDataSet1;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DSSerieModeloPedidoCons: TDataSource;
    QParamSistemaCOD_SERIE_MODELO_OS_SERVICO: TStringField;
    QParamSistemaIND_SENHA_LIMITE: TStringField;
    QParamSistemaCOD_MENSAGEM_SMS_OS: TIntegerField;
    QParamSistemaIND_TIPO_FIXACAO: TStringField;
    QParamSistemaNUM_DIAS_ULT_COMPRAS: TIntegerField;
    QParamSistemaIND_IMPRESSAO_PROMISSORIA: TStringField;
    QParamSistemaIND_POSTO_COMBUSTIVEL: TStringField;
    QParamSistemaIND_PAF_ECF: TStringField;
    QParamSistemaDESC_ASSUNTO_EMAIL_CTE: TStringField;
    QParamSistemaDESC_CORPO_EMAIL_CTE: TMemoField;
    QParamSistemaDESC_CORPO_EMAIL_CANC_CTE: TMemoField;
    QParamSistemaDESC_ASSUNTO_EMAIL_CANC_CTE: TStringField;
    QParamSistemaIND_DESCONTO_MAXIMO: TStringField;
    QParamSistemaIND_CTE_EMAIL_DEST: TIntegerField;
    QParamSistemaIND_CTE_EMAIL_REM: TIntegerField;
    QParamSistemaIND_CTE_EMAIL_EXP: TIntegerField;
    QParamSistemaIND_CTE_EMAIL_REC: TIntegerField;
    QParamSistemaNUM_DIAS_ULT_VENDAS: TIntegerField;
    QParamSistemaDESC_LAUDO_ANALISE_FUNCIONAL: TStringField;
    QParamSistemaDESC_ASSUNTO_EMAIL_MDFE: TStringField;
    QParamSistemaDESC_CORPO_EMAIL_MDFE: TMemoField;
    QParamSistemaDESC_CORPO_EMAIL_CANC_MDFE: TMemoField;
    QParamSistemaDESC_ASSUNTO_EMAIL_CANC_MDFE: TStringField;
    QParamSistemaIND_COD_BARRA_XML: TStringField;
    QParamSistemaIND_BLOQUEADO: TStringField;
    QParamSistemaDESC_ASS_EMAIL_PED_ATRASADOS: TStringField;
    QParamSistemaDESC_MSG_EMAIL_PED_ATRASADOS: TMemoField;
    QParamSistemaHORA_EMAIL_PEDIDOS_ATRASADOS: TStringField;
    QParamSistemaNUM_DIAS_PEDIDO_SEM_EMBARQUE: TIntegerField;
    QParamSistemaDESC_EMAIL_PED_SEM_EMBARQUE: TStringField;
    QParamSistemaDESC_SENHA_PED_SEM_EMBARQUE: TStringField;
    QParamSistemaPORTA_SMTP_PED_SEM_EMBARQUE: TIntegerField;
    QParamSistemaDESC_SMTP_PED_SEM_EMBARQUE: TStringField;
    QParamSistemaIND_SSL_PED_SEM_EMBARQUE: TStringField;
    QParamSistemaDESC_MD5_ARQ_CONFIG: TStringField;
    QParamSistemaIND_CLIENTE_TITULO_ATRASADO: TStringField;
    QParamSistemaIND_MOSTRA_ESTOQUE_ZERADO: TStringField;
    QParamSistemaIND_EXCLUI_TITULO_REP: TStringField;
    QParamSistemaDESC_LAYOUT_CAIXA: TStringField;
    QContaPatriLiqCons: TOracleDataSet1;
    QContaPatriLiqConsCOD_PLANO_CONTA: TIntegerField;
    QContaPatriLiqConsDESC_PLANO_CONTA: TStringField;
    QContaPatriLiqConsNUM_PLANO_CONTA: TStringField;
    QParamSistemaCOD_CONTA_PATRI_LIQ_SINTETICO: TIntegerField;
    QContaPatriLiqConsDESC_COMPLETA: TStringField;
    QContaPatriLiqConsCOD_REDUZIDO: TIntegerField;
    QParamSistemaDESC_IMPRESSORA_RECIBO_CR: TStringField;
    QParamSistemaIND_CALCULO_ICMS_DIFERENCIAL: TStringField;
    QParamSistemaIND_SINCRONISMO_PEDIDO_WEB: TStringField;
    QParamSistemaIND_GERENCIA_LOTE_ESTOQUE: TStringField;
    QParamSistemaDESC_LAYOUT_SICOOB: TStringField;
    QParamSistemaIND_SICOOB_BANCOOB: TStringField;
    QParamSistemaIND_SICOOB_BRADESCO: TStringField;
    QParamSistemaIND_SICOOB_BB: TStringField;
    QParamSistemaIND_BLOQUEIO_TABELA_PRECO: TStringField;
    QParamSistemaIND_CONSULTA_PRODUTO_XML_NCM: TStringField;
    QParamSistemaIND_CONSULTA_PRODUTO_XML_BARRA: TStringField;
    QParamSistemaIND_CONSULTA_PRODUTO_XML_FABRI: TStringField;
    QParamSistemaIND_OBS_BOLETO: TStringField;
    QParamSistemaIND_NOTA_AUTOMATICA_WEB: TStringField;
    QParamSistemaIND_TIPO_CONSULTA_SPC: TIntegerField;
    QParamSistemaIND_OBRIGA_CONSUMIDOR_FINAL: TStringField;
    QParamSistemaIND_CADASTRO_OBRIGATORIO_RG: TStringField;
    QParamSistemaDESC_CHAVE_ACESSO_SMS: TStringField;
    QParamSistemaIND_SENHA_VOLTA_CONFIRMACAO: TStringField;
    QParamSistemaIND_CONTROLE_ESTOQUE_OS: TStringField;
    QParamSistemaDESC_SENHA_SCPC: TStringField;
    QParamSistemaDESC_CODIGO_SCPC: TStringField;
    QParamSistemaVAL_TAXA_CARTAO: TFloatField;
    QParamSistemaVAL_TAXA_CARTAO_JUROS: TFloatField;
    QParamSistemaIND_ATUALIZA_NCM_PELO_XML: TStringField;
    QParamSistemaCOD_HISTORICO_CARTAO_CREDITO: TIntegerField;
    QParamSistemaCOD_HISTORICO_CARTAO_DEBITO: TIntegerField;
    QParamSistemaCOD_HISTORICO_CAIXA_VALE: TIntegerField;
    QParamSistemaIND_SICOOB_BANCOOB_CNAB240: TStringField;
    QParamSistemaIND_SENHA_EXCLUSAO_NOTA: TStringField;
    QParamSistemaIND_GRAVA_XML_NOTAS: TStringField;
    QParamSistemaIND_CADPRO_OBRIGATORIO_NOTA: TStringField;
    QParamSistemaDESC_HOST_SERVER_API: TStringField;
    QParamSistemaIND_SENHA_ALTERA_VENDEDOR: TStringField;
    QParamSistemaIND_CTE_EMAIL_FILIAL: TIntegerField;
    QParamSistemaIND_GUIA_PAGAMENTO: TStringField;
    QParamSistemaIND_NUM_NOTA_INCLUSAO: TStringField;
    QParamSistemaPERC_SENAT: TFloatField;
    QParamSistemaIND_TIPO_SINCRONIZACAO_MAX: TIntegerField;
    QParamSistemaIND_CONTROLE_CARTAO: TStringField;
    QParamSistemaNUM_DENSIDADE_ETIQUETA: TIntegerField;
    QParamSistemaIND_CAMERA_PESAGEM_BALANCA: TStringField;
    QParamSistemaIND_COR_SITUACAO_OS: TStringField;
    QParamSistemaDESC_IP_CAM1: TStringField;
    QParamSistemaDESC_IP_CAM2: TStringField;
    QParamSistemaCOD_USUARIO: TIntegerField;
    QParamSistemaIND_CONTROLA_PERCA_PRODUCAO: TStringField;
    QParamSistemaIND_AMBIENTE_CSRT: TIntegerField;
    QParamSistemaDESC_CSRT: TStringField;
    QParamSistemaDESC_IDENTIFICADOR_CSRT: TStringField;
    QParamSistemaIND_AMBIENTE_API_BOLETO: TStringField;
    QParamSistemaIND_AMBIENTE_API_PIX: TStringField;
    QParamSistemaIND_IMPRIME_DESCONTO_OS: TStringField;
    QParamSistemaIND_GERA_PARCELA_DEVOL: TStringField;
    QParamSistemaIND_BAIXA_PARCELA: TStringField;
    QParamSistemaIND_CONTROLA_ORDEM_CHEGADA: TStringField;
    QParamSistemaDESC_USUARIO_DVR: TStringField;
    QParamSistemaDESC_SENHA_DVR: TStringField;
    QParamSistemaDESC_IP_DVR: TStringField;
    QParamSistemaNUM_CANAL_DVR01: TIntegerField;
    QParamSistemaNUM_CANAL_DVR02: TIntegerField;
    procedure QParamSistemaBeforeInsert(DataSet: TDataSet);
    procedure QParamSistemaAfterOpen(DataSet: TDataSet);
    procedure QComissaoPrazoAfterPost(DataSet: TDataSet);
    procedure QParamSistemaPERC_DESCONTO_VISTAChange(Sender: TField);
    procedure QParamSistemaPERC_ACRESCIMO_MESChange(Sender: TField);
    procedure QParamSistemaBeforePost(DataSet: TDataSet);
  private
    FCodEmpresa: String;
    FIndCalculoICMS: String;
  public
    property CodEmpresa: String read FCodEmpresa write FCodEmpresa;
    property IndCalculoICMS: String read FIndCalculoICMS write FIndCalculoICMS;
  end;

var
  DMParamSistema: TDMParamSistema;

implementation

uses UOracle_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMParamSistema.QParamSistemaBeforeInsert(DataSet: TDataSet);
begin
  If QParamSistema.RecordCount >= 1 then
    Raise Exception.Create('Registro de parâmetros já existente!');
end;

procedure TDMParamSistema.QParamSistemaAfterOpen(DataSet: TDataSet);
begin
  CodEmpresa := QParamSistemaCOD_EMPRESA.Value;
  FIndCalculoICMS := QParamSistemaIND_CALCULO_ICMS.Value;
  QCstpis.Open;
  QCstCofins.Open;
  QSerieModeloNotaCons.Open;
  QSerieModeloPedidoCons.Open;
end;

procedure TDMParamSistema.QComissaoPrazoAfterPost(DataSet: TDataSet);
begin
  QComissaoPrazo.DisableControls;
  QComissaoPrazo.Close;
  QComissaoPrazo.Open;
  QComissaoPrazo.EnableControls;
end;

procedure TDMParamSistema.QParamSistemaPERC_DESCONTO_VISTAChange(
  Sender: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
    if DMUsuario.pTipoFuncionario <> 'DIRETOR' then
      Raise Exception.Create('Usuário precisa ser diretor para efetuar esta operação');
end;

procedure TDMParamSistema.QParamSistemaPERC_ACRESCIMO_MESChange(
  Sender: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ABATE' then
    if DMUsuario.pTipoFuncionario <> 'DIRETOR' then
      Raise Exception.Create('Usuário precisa ser diretor para efetuar esta operação');
end;

procedure TDMParamSistema.QParamSistemaBeforePost(DataSet: TDataSet);
begin
  QParamSistemaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

end.
