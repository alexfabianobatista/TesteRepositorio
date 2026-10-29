unit UOrdemServico_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, DBClient, Provider;

type
  TDMOrdemServico = class(TDataModule)
    QRContratoMensal: TOracleDataSet1;
    QRContratoMensalNOME: TStringField;
    QRContratoMensalIND_SITUACAO: TStringField;
    QRContratoMensalVAL_MENSALIDADE: TFloatField;
    QRContratoMensalCOD_CONTRATO_MENSAL: TIntegerField;
    QRContratoMensalNUM_DIA_VENCTO: TIntegerField;
    QContratoMensal_Rec: TOracleDataSet1;
    QContratoMensal_RecCOD_CONTRATO_MENSAL: TIntegerField;
    QContratoMensal_RecCOD_FILIAL: TIntegerField;
    QContratoMensal_RecCOD_CADASTRO: TIntegerField;
    QContratoMensal_RecNUM_DIA_VENCTO: TIntegerField;
    QContratoMensal_RecDT_VENDA: TDateTimeField;
    QContratoMensal_RecDT_INICIO_COBRANCA: TDateTimeField;
    QContratoMensal_RecVAL_CONTRATO: TFloatField;
    QContratoMensal_RecVAL_MENSALIDADE: TFloatField;
    QContratoMensal_RecDESC_OBSERVACAO: TStringField;
    QContratoMensal_RecIND_SITUACAO: TStringField;
    QContratoMensalCons: TOracleDataSet1;
    QContratoMensalConsCOD_FILIAL: TIntegerField;
    QContratoMensalConsCOD_CADASTRO: TIntegerField;
    QContratoMensalConsCOD_CONTRATO_MENSAL: TIntegerField;
    QContratoMensalConsNUM_DIA_VENCTO: TIntegerField;
    QContratoMensalConsVAL_MENSALIDADE: TFloatField;
    QContratoMensalConsIND_SITUACAO: TStringField;
    QRMedia: TOracleDataSet1;
    QRMediaNOME: TStringField;
    QRMediaCOD_CADASTRO: TIntegerField;
    QRMediaCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRMediaDT_ENTRADA: TDateTimeField;
    QRMediaDT_SAIDA: TDateTimeField;
    QRMediaQT_DIA: TFloatField;
    QRAnalitico: TOracleDataSet1;
    QRSintetico: TOracleDataSet1;
    QContratoMensal: TOracleDataSet1;
    QContratoMensalCOD_CONTRATO_MENSAL: TIntegerField;
    QContratoMensalCOD_FILIAL: TIntegerField;
    QContratoMensalCOD_CADASTRO: TIntegerField;
    QContratoMensalNUM_DIA_VENCTO: TIntegerField;
    QContratoMensalDT_VENDA: TDateTimeField;
    QContratoMensalDT_INICIO_COBRANCA: TDateTimeField;
    QContratoMensalVAL_CONTRATO: TFloatField;
    QContratoMensalVAL_MENSALIDADE: TFloatField;
    QContratoMensalDESC_OBSERVACAO: TStringField;
    QContratoMensalIND_SITUACAO: TStringField;
    QContratoMensalnome_filial: TStringField;
    QContratoMensalnome_cadastro: TStringField;
    QREntrada: TOracleDataSet1;
    QOrdemServico: TOracleDataSet1;
    QOrdemServicoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoCOD_CADASTRO: TIntegerField;
    QOrdemServicoDT_ENTRADA: TDateTimeField;
    QOrdemServicoVL_DESCONTO: TFloatField;
    QOrdemServicoDT_SAIDA: TDateTimeField;
    QOrdemServicoCOD_FILIAL: TIntegerField;
    QOrdemServicoCOD_TECNICO: TIntegerField;
    QOrdemServicototal: TFloatField;
    QOrdemServicoIt: TOracleDataSet1;
    QOrdemServicoItCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoItCOD_ORDEM_SERVICO_ITEM: TIntegerField;
    QOrdemServicoItQT_PRODUTO: TFloatField;
    QOrdemServicoItVL_UNITARIO: TFloatField;
    QOrdemServicoItVAL_DESCONTO: TFloatField;
    QOrdemServicoItnome_produto: TStringField;
    QOrdemServicoItvl_total: TFloatField;
    QOrdemServicoItvl_total_bruto: TFloatField;
    QOrdemServicoCons: TOracleDataSet1;
    QOrdemServicoConsCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoConsDESC_EQUIPAMENTO: TStringField;
    QOrdemServicoConsDT_ENTRADA: TDateTimeField;
    QOrdemServicoConsNOME: TStringField;
    QRAberto: TOracleDataSet1;
    QRAbertoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRAbertoCOD_CADASTRO: TIntegerField;
    QRAbertoNOME_CLIENTE: TStringField;
    QRAbertoCOD_VENDEDOR: TIntegerField;
    QRAbertoNOME_VENDEDOR: TStringField;
    QRAbertoVL_DESCONTO: TFloatField;
    QRAbertoDESC_EQUIPAMENTO: TStringField;
    QRAbertoDT_ENTRADA: TDateTimeField;
    QRSaida_Receber: TOracleDataSet1;
    QREntradaCOD_CADASTRO: TIntegerField;
    QREntradaDESC_ENDERECO: TStringField;
    QREntradaDESC_CIDADE: TStringField;
    QREntradaDESC_TELEFONE: TStringField;
    QREntradaNOME_VENDEDOR: TStringField;
    QREntradaDESC_FILIAL: TStringField;
    QREntradaCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QREntradaVL_DESCONTO: TFloatField;
    QREntradaDESC_EQUIPAMENTO: TStringField;
    QREntradaDT_ENTRADA: TDateTimeField;
    QREntradaDT_SAIDA: TDateTimeField;
    QRSaida_ReceberNUM_PARCELA: TIntegerField;
    QRSaida_ReceberDT_VENCIMENTO: TDateTimeField;
    QRSaida_ReceberVAL_TITULO: TFloatField;
    QContratoMensalConsNOME: TStringField;
    QOrdemServicoCOD_USUARIO: TIntegerField;
    QREntradaDESC_FILIAL_DADOS: TStringField;
    QREntradaNOME_CLIENTE: TStringField;
    QOrdemServicoCOD_CAIXA: TIntegerField;
    QOrdemServicoCOD_NOTA_CAB: TIntegerField;
    QOrdemServicoItproduto_obs: TStringField;
    QContratoMensalDT_ULTIMO_REAJUSTE: TDateTimeField;
    QOrdemServicoDT_PREVISAO_ENTREGA: TDateTimeField;
    QOrdemServicoHR_PREVISAO_ENTREGA: TDateTimeField;
    QRContratoMensalNUM_CGC_CPF: TStringField;
    QRContratoMensalDESC_ENDERECO: TStringField;
    QRContratoMensalDESC_CIDADE: TStringField;
    QRContratoMensalCOD_ESTADO: TStringField;
    QRContratoMensalDESC_CEP: TStringField;
    QRContratoMensalDESC_BAIRRO: TStringField;
    QContratoFornecedor: TOracleDataSet1;
    QContratoFornecedorCons: TOracleDataSet1;
    QContratoFornecedorConsCOD_FILIAL: TIntegerField;
    QContratoFornecedorConsCOD_CONTRATO_FORNECEDOR: TIntegerField;
    QContratoFornecedorConsNUM_DIA_VENCTO: TIntegerField;
    QContratoFornecedorConsVAL_MENSALIDADE: TFloatField;
    QContratoFornecedorConsIND_SITUACAO: TStringField;
    QContratoFornecedorConsNOME: TStringField;
    QRContratoFornecedor: TOracleDataSet1;
    QRContratoFornecedorNOME: TStringField;
    QRContratoFornecedorNUM_CGC_CPF: TStringField;
    QRContratoFornecedorDESC_ENDERECO: TStringField;
    QRContratoFornecedorDESC_CIDADE: TStringField;
    QRContratoFornecedorCOD_ESTADO: TStringField;
    QRContratoFornecedorDESC_BAIRRO: TStringField;
    QRContratoFornecedorDESC_CEP: TStringField;
    QRContratoFornecedorIND_SITUACAO: TStringField;
    QRContratoFornecedorVAL_MENSALIDADE: TFloatField;
    QRContratoFornecedorCOD_CONTRATO_FORNECEDOR: TIntegerField;
    QRContratoFornecedorNUM_DIA_VENCTO: TIntegerField;
    QContratoMensalDESC_REFERENTE: TStringField;
    QContratoMensalNUM_PRAZO: TIntegerField;
    QContratoMensalDESC_LOCALIZACAO: TStringField;
    QRContratoFornecedorCOD_FILIAL: TIntegerField;
    QRContratoFornecedorDESC_FILIAL: TStringField;
    QRContratoFornecedorCOD_CADASTRO: TIntegerField;
    QRContratoFornecedorDT_VENDA: TDateTimeField;
    QRContratoFornecedorVAL_CONTRATO: TFloatField;
    QRContratoFornecedorIND_SITUACAO_1: TStringField;
    QContratoFornecedor_CP: TOracleDataSet1;
    QContratoFornecedor_CPCOD_CONTRATO_FORNECEDOR: TIntegerField;
    QContratoFornecedor_CPCOD_FILIAL: TIntegerField;
    QContratoFornecedor_CPCOD_CADASTRO: TIntegerField;
    QContratoFornecedor_CPNUM_DIA_VENCTO: TIntegerField;
    QContratoFornecedor_CPDT_VENDA: TDateTimeField;
    QContratoFornecedor_CPDT_INICIO_COBRANCA: TDateTimeField;
    QContratoFornecedor_CPVAL_CONTRATO: TFloatField;
    QContratoFornecedor_CPVAL_MENSALIDADE: TFloatField;
    QContratoFornecedor_CPDESC_OBSERVACAO: TStringField;
    QContratoFornecedor_CPIND_SITUACAO: TStringField;
    QContratoMensalMES_ULTIMO_REAJUSTE: TIntegerField;
    QContratoMensalReajuste: TOracleDataSet1;
    QContratoMensalReajusteCOD_REAJUSTE_CONTRATO_MENSAL: TIntegerField;
    QContratoMensalReajusteCOD_FILIAL: TIntegerField;
    QContratoMensalReajusteCOD_CADASTRO: TIntegerField;
    QContratoMensalReajusteMES_REAJUSTE: TIntegerField;
    QContratoMensalReajusteDT_REAJUSTE: TDateTimeField;
    QContratoMensalReajusteINDICE_REAJUSTE: TFloatField;
    QContratoFornecedorReajuste: TOracleDataSet1;
    QContratoFornecedorReajusteCOD_REAJ_CONTRATO_FORNECEDOR: TIntegerField;
    QContratoFornecedorReajusteCOD_FILIAL: TIntegerField;
    QContratoFornecedorReajusteCOD_CADASTRO: TIntegerField;
    QContratoFornecedorReajusteMES_REAJUSTE: TIntegerField;
    QContratoFornecedorReajusteDT_REAJUSTE: TDateTimeField;
    QContratoFornecedorReajusteINDICE_REAJUSTE: TFloatField;
    QContratoFornecedorReajusteCOD_CONTRATO_FORNECEDOR: TIntegerField;
    QContratoMensalReajusteCOD_CONTRATO_MENSAL: TIntegerField;
    QConsultaFornecedorReaj: TOracleDataSet1;
    QConsultaFornecedorReajCOD_CONTRATO_FORNECEDOR: TIntegerField;
    QConsultaMensalReaj: TOracleDataSet1;
    QConsultaMensalReajCOD_CONTRATO_MENSAL: TIntegerField;
    QContratoMensalNUM_CONTRATO_MENSAL: TIntegerField;
    QContratoFornecedorCOD_CONTRATO_FORNECEDOR: TIntegerField;
    QContratoFornecedorCOD_FILIAL: TIntegerField;
    QContratoFornecedorCOD_CADASTRO: TIntegerField;
    QContratoFornecedorNUM_DIA_VENCTO: TIntegerField;
    QContratoFornecedorDT_VENDA: TDateTimeField;
    QContratoFornecedorDT_INICIO_COBRANCA: TDateTimeField;
    QContratoFornecedorVAL_CONTRATO: TFloatField;
    QContratoFornecedorVAL_MENSALIDADE: TFloatField;
    QContratoFornecedorDESC_OBSERVACAO: TStringField;
    QContratoFornecedorIND_SITUACAO: TStringField;
    QContratoFornecedorDESC_REFERENTE: TStringField;
    QContratoFornecedorDESC_LOCALIZACAO: TStringField;
    QContratoFornecedorMES_ULTIMO_REAJUSTE: TIntegerField;
    QContratoFornecedorDT_ULTIMO_REAJUSTE: TDateTimeField;
    QContratoFornecedorNUM_CONTRATO_FORNECEDOR: TIntegerField;
    QContratoFornecedorIND_TIPO_CONTRATO: TStringField;
    QOrdemServicoCOD_VEICULO: TIntegerField;
    QOrdemServicoCOD_OPERACAO: TIntegerField;
    QContratoMensalCOD_TIPO_CONTRATO: TIntegerField;
    QContratoMensalDESC_CONTRATO_INTERNET: TStringField;
    QContratoMensal_RecDESC_CONTRATO_INTERNET: TStringField;
    QContratoMensal_RecDESC_FORMA_PAGTO: TStringField;
    QContratoMensal_RecCOD_TIPO_CONTRATO: TIntegerField;
    QContratoMensalDESC_TIPO_DOCUMENTO: TStringField;
    QContratoMensal_RecDESC_TIPO_DOCUMENTO: TStringField;
    QREntradaNOME: TStringField;
    QREntradaDESC_CELULAR: TStringField;
    QRSinteticoNOME: TStringField;
    QRSinteticoCOD_CADASTRO: TIntegerField;
    QRSinteticoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRSinteticoQT_PRODUTO: TFloatField;
    QRSinteticoVAL_DESCONTO: TFloatField;
    QRSinteticoVAL_TOTAL: TFloatField;
    QRAnaliticoNOME: TStringField;
    QRAnaliticoCOD_CADASTRO: TIntegerField;
    QRAnaliticoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRAnaliticoDESC_PRODUTO: TStringField;
    QRAnaliticoQT_PRODUTO: TFloatField;
    QRAnaliticoVAL_DESCONTO: TFloatField;
    QRAnaliticoVAL_TOTAL: TFloatField;
    QOrdemServiconum_ordem_servico: TIntegerField;
    QOrdemServicoItCOD_CFOP: TIntegerField;
    QOrdemServicoItCOD_LOTE_TIPO: TIntegerField;
    QOrdemServicoItCOD_TRIBUTACAO: TIntegerField;
    QOrdemServicoDESC_CADASTRO: TStringField;
    QOrdemServicoNota: TOracleDataSet1;
    QOrdemServicoNotaCOD_NOTA_CAB: TIntegerField;
    QOrdemServicoNotaNUM_NOTA: TIntegerField;
    QOrdemServicoNotaCOD_SERIE: TStringField;
    QOrdemServicoNotaCOD_FILIAL: TIntegerField;
    QOrdemServicoNotaIND_SITUACAO: TStringField;
    QOrdemServicoDESC_SOLICITACAO: TStringField;
    QREntradaDESC_SOLICITACAO: TStringField;
    QRAbertoDESC_SOLICITACAO: TStringField;
    QREntradaNUM_PLACA: TStringField;
    QOrdemServicoNotaIND_EMITE: TStringField;
    QContratoMensalConsDT_ULTIMO_REAJUSTE: TDateTimeField;
    QOrdemServicoNotaCOD_SERIE_MODELO: TStringField;
    QContratoMensalIND_EMITE_NOTA: TStringField;
    QContratoMensal_RecIND_EMITE_NOTA: TStringField;
    QRSaida: TOracleDataSet1;
    QRSaidaDESC_ENDERECO: TStringField;
    QRSaidaDESC_BAIRRO: TStringField;
    QRSaidaDESC_CIDADE_FILIAL: TStringField;
    QRSaidaCOD_CADASTRO: TIntegerField;
    QRSaidaNOME: TStringField;
    QRSaidaCOD_CIDADE: TIntegerField;
    QRSaidaDESC_CIDADE: TStringField;
    QRSaidaCOD_ESTADO: TStringField;
    QRSaidaNUM_CGC_CPF: TStringField;
    QRSaidaNUM_INSCRICAO: TStringField;
    QRSaidaNUM_PLACA: TStringField;
    QRSaidaQT_HORAS: TStringField;
    QRSaidaNUM_MOTOR: TStringField;
    QRSaidaNUM_ANO: TIntegerField;
    QRSaidaNUM_SERIE: TStringField;
    QRSaidaDESC_MONOBLOCO: TStringField;
    QRSaidaNUM_CAIXA_CAMBIO: TStringField;
    QRSaidaNUM_EIXO_DIANTEIRO: TStringField;
    QRSaidaDESC_MODELO: TStringField;
    QRSaidaDESC_ENDERECO_FILIAL: TStringField;
    QOrdemServicoItDesc_un: TStringField;
    QRSaida_receber_geral: TOracleDataSet1;
    QRSaida_receber_geralNUM_PARCELA: TIntegerField;
    QRSaida_receber_geralDT_VENCIMENTO: TDateTimeField;
    QRSaida_receber_geralVAL_TITULO: TFloatField;
    QRSaidaNOME_TECNICO: TStringField;
    QRSaidaMENSAGEM: TStringField;
    QOrdemServicoCOD_MENSAGEM: TIntegerField;
    QRSaidaDESC_SOLICITACAO: TStringField;
    QRSaidaDESC_FILIAL: TStringField;
    QRSaidaFONE_FILIAL: TStringField;
    QRSaidaDESC_CEP_FILIAL: TStringField;
    QRSaidaDT_ENTRADA: TDateTimeField;
    QRSaidaDT_SAIDA: TDateTimeField;
    QRSaidaCOD_CAIXA: TIntegerField;
    QRSaidaCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRSaidaItens: TOracleDataSet1;
    QRSaidaItensDESC_PRODUTO: TStringField;
    QRSaidaItensDESC_UNIDADE: TStringField;
    QRSaidaItensNUM_FABRICANTE: TStringField;
    QRSaidaItensQT_PRODUTO: TFloatField;
    QRSaidaItensVL_UNITARIO: TFloatField;
    QRSaidaItensVAL_DESCONTO: TFloatField;
    QRSaidaItensVAL_TOTAL_BRUTO: TFloatField;
    QRSaidaItensVAL_TOTAL: TFloatField;
    QRSinteticoDT_SAIDA: TDateTimeField;
    QRAnaliticoDT_SAIDA: TDateTimeField;
    QOrdemServicoConsDESC_COMPLEMENTO: TStringField;
    QOrdemServicoItPERC_DESCONTO: TFloatField;
    QOrdemServicoConsNOME_VENDEDOR: TStringField;
    QOrdemServicoItVAL_ISS: TFloatField;
    QOrdemServicoConsIND_VENDA: TStringField;
    QREntradaDESC_FONE_FILIAL: TStringField;
    QREntradaNUM_CGC_CPF: TStringField;
    QOrdemServicoDESC_SENHA_EQUIPAMENTO: TStringField;
    QREntradaDESC_SENHA_EQUIPAMENTO: TStringField;
    QOrdemServicoCheckList: TOracleDataSet1;
    QOrdemServicoDESC_OBS: TMemoField;
    QOrdemServicoCheckListCOD_ORDEM_SERVICO_CHECK_LIST: TIntegerField;
    QOrdemServicoCheckListCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QOrdemServicoCheckListIND_WINDOWS_ORIGINAL: TStringField;
    QOrdemServicoCheckListIND_OFFICE_ORIGINAL: TStringField;
    QOrdemServicoCheckListIND_SENHA_WINDOWS: TStringField;
    QOrdemServicoCheckListDESC_SENHA_WINDOWS: TStringField;
    QOrdemServicoCheckListIND_EMAIL: TStringField;
    QOrdemServicoCheckListDESC_SENHA_EMAIL: TStringField;
    QOrdemServicoCheckListIND_CERTIFICADO: TStringField;
    QOrdemServicoCheckListIND_GARANTIA: TStringField;
    QOrdemServicoCheckListIND_DESLOCAMENTO: TStringField;
    QOrdemServicoCheckListIND_SISTEMA_TERCEIROS: TStringField;
    QOrdemServicoCheckListIND_CONFERIR_CADASTRO_USUARIO: TStringField;
    QOrdemServicoCheckListIND_GABINETE_SEM_TAMPA: TStringField;
    QOrdemServicoCheckListIND_COLAR_ETIQUETAS: TStringField;
    QOrdemServicoCheckListIND_ATIVACAO_WINDOWS: TStringField;
    QOrdemServicoCheckListIND_ATIVACAO_OFFICE: TStringField;
    QOrdemServicoCheckListIND_ATIVACAO_ANTIVIRUS: TStringField;
    QOrdemServicoCheckListIND_CONFIGURACAO_EMAIL: TStringField;
    QOrdemServicoCheckListIND_NAVEGADORES_ATUALIZADOS: TStringField;
    QOrdemServicoCheckListIND_TESTAR_SOM: TStringField;
    QOrdemServicoCheckListIND_TESTAR_WEBCAM: TStringField;
    QOrdemServicoCheckListIND_RETIRAR_ETIQUETAS: TStringField;
    QOrdemServicoCheckListIND_INFORMACOES_SISTEMA: TStringField;
    QOrdemServicoCheckListIND_VOLTAR_IP: TStringField;
    QOrdemServicoCheckListIND_DRIVERS_INSTALADOS: TStringField;
    QOrdemServicoCheckListIND_INSTALAR_CERTIFICADOS: TStringField;
    QOrdemServicoCheckListIND_INSTALAR_APP_USUARIO: TStringField;
    QOrdemServicoCheckListIND_ALTERAR_CENTRAL_ACOES: TStringField;
    QOrdemServicoCheckListIND_DESABILITAR_WINDOWS_UPDATE: TStringField;
    QOrdemServicoCheckListIND_LIMPEZA_EQUIPAMENTO: TStringField;
    QOrdemServicoCheckListIND_ALTERAR_MSCONFIG_TEMP: TStringField;
    QOrdemServicoCheckListIND_CONFIGURAR_TECLADO: TStringField;
    QOrdemServicoCheckListIND_LUBRIFICACAO_COOLER: TStringField;
    QOrdemServicoCheckListIND_BACKUP_RESTAURADO: TStringField;
    QOrdemServicoCheckListIND_NOME_COMPUTADOR: TStringField;
    QOrdemServicoCheckListIND_BATERIA_NO_BREAK: TStringField;
    QOrdemServicoCheckListIND_SAIDA_ENERGIA_NO_BREAK: TStringField;
    QOrdemServicoCheckListIND_LIMPEZA_NO_BREAK: TStringField;
    QOrdemServicoCheckListIND_SAIDA_VGA_HDMI_MONITOR: TStringField;
    QOrdemServicoCheckListIND_LIGA_DESLIGA_MONITOR: TStringField;
    QOrdemServicoCheckListIND_LIMPEZA_MONITOR: TStringField;
    QOrdemServicoCheckListIND_COMUNICACAO_IMPRESSORA: TStringField;
    QOrdemServicoCheckListIND_FAZ_COPIA_IMPRESSORA: TStringField;
    QOrdemServicoCheckListIND_TESTE_CARTUCHO_IMPRESSORA: TStringField;
    QOrdemServicoCheckListIND_LIMPEZA_IMPRESSORA: TStringField;
    QOrdemServicoCheckListIND_TESTAR_WIRELESS_LAN: TStringField;
    QOrdemServicoQT_HORAS: TStringField;
    QEmiteOrcamentoDOS: TOracleDataSet;
    QEmiteOrcamentoDOSNOME: TStringField;
    QEmiteOrcamentoDOSCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QEmiteOrcamentoDOSDT_ENTRADA: TDateTimeField;
    QEmiteOrcamentoDOSQT_PRODUTO: TFloatField;
    QEmiteOrcamentoDOSVL_UNITARIO: TFloatField;
    QEmiteOrcamentoDOSDESC_PRODUTO: TStringField;
    QEmiteOrcamentoDOSCOD_VEICULO: TIntegerField;
    QEmiteOrcamentoDOSNUM_PLACA: TStringField;
    QrOrcamentoOS: TOracleDataSet;
    QrOrcamentoOSCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QrOrcamentoOSDT_ENTRADA: TDateTimeField;
    QrOrcamentoOSCOD_CADASTRO: TIntegerField;
    QrOrcamentoOSQT_PRODUTO: TFloatField;
    QrOrcamentoOSVL_UNITARIO: TFloatField;
    QrOrcamentoOSVAL_DESCONTO: TFloatField;
    QrOrcamentoOSDESC_PRODUTO: TStringField;
    QrOrcamentoOSVAL_TOTAL: TFloatField;
    QrOrcamentoOSNOME: TStringField;
    QrOrcamentoOSNUM_PLACA: TStringField;
    QRSinteticoDESC_OBS: TStringField;
    QRAnaliticoDESC_OBS: TStringField;
    QrOrcamentoOSENDERECO: TStringField;
    QrOrcamentoOSCIDADE: TStringField;
    QrOrcamentoOSDESC_TELEFONE: TStringField;
    QSomaItemOS: TOracleDataSet1;
    QSomaItemOSsval_total_os: TFloatField;
    QSomaItemOSCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QSomaItemOSSVAL_TOTAL: TFloatField;
    QSomaItemOSSVAL_DESCONTO: TFloatField;
    QSomaItemOSSVAL_TOTAL_SERVICOS: TFloatField;
    QSomaItemOSSQT_TOTAL: TFloatField;
    QSomaItemOSSVAL_ISS: TFloatField;
    DSSomaItemOS: TDataSource;
    QContratoMensalDESC_FORMA_PAGTO: TStringField;
    QOrdemServicoConsNUM_PLACA: TStringField;
    QRAnaliticoVL_UNITARIO: TFloatField;
    QRAnaliticoNUM_PLACA: TStringField;
    QRAnaliticoNUM_FABRICANTE: TStringField;
    QContratoMensalIND_ENVIA_BANCO: TStringField;
    QContratoMensal_RecIND_ENVIA_BANCO: TStringField;
    QREntradaDESC_BAIRRO: TStringField;
    QOrdemServicoIND_COM_CHIP: TStringField;
    QRContratoMensalCOD_CADASTRO: TIntegerField;
    QOrdemServicoItVAL_ACRESCIMO: TFloatField;
    QSomaItemOSSVAL_ACRESCIMO: TFloatField;
    QOrdemServicoDT_ENTRADA_MANUTENCAO: TDateTimeField;
    QOrdemServicoDT_SAIDA_MANUTENCAO: TDateTimeField;
    QOrdemServicoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QOrdemServicoItvl_item_acrescimo: TFloatField;
    QrOrcamentoOSVAL_ACRESCIMO: TFloatField;
    QrOrcamentoOSvl_unitario_acrescimo: TFloatField;
    QrOrcamentoOSvl_total_acrescimo: TFloatField;
    QContratoMensal_RecMES_ULTIMO_REAJUSTE: TIntegerField;
    QRAbertoDT_SAIDA: TDateTimeField;
    QControlaAlteracao: TOracleDataSet1;
    QControlaAlteracaoIND_COMPUTADOR_EDITANDO: TStringField;
    QOrdemServicoDESC_EQUIPAMENTO: TStringField;
    QROrdemServicoRetifoz: TOracleDataSet1;
    QROrdemServicoRetifozCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QROrdemServicoRetifozDT_ENTRADA: TDateTimeField;
    QROrdemServicoRetifozDT_PREVISAO_ENTREGA: TDateTimeField;
    QROrdemServicoRetifozCOD_CADASTRO: TIntegerField;
    QROrdemServicoRetifozCOD_TECNICO: TIntegerField;
    QROrdemServicoRetifozCOD_VEICULO: TIntegerField;
    QROrdemServicoRetifozDESC_SOLICITACAO: TStringField;
    QROrdemServicoRetifozNOME: TStringField;
    QROrdemServicoRetifozDESC_ENDERECO: TStringField;
    QROrdemServicoRetifozDESC_BAIRRO: TStringField;
    QROrdemServicoRetifozDESC_TELEFONE: TStringField;
    QROrdemServicoRetifozNUM_CGC_CPF: TStringField;
    QROrdemServicoRetifozCOD_CIDADE: TIntegerField;
    QROrdemServicoRetifozDESC_CEP: TStringField;
    QROrdemServicoRetifozNUM_PLACA: TStringField;
    QROrdemServicoRetifozNOME_VENDEDOR: TStringField;
    QROrdemServicoRetifozDESC_CIDADE: TStringField;
    QROrdemServicoRetifozCOD_ESTADO: TStringField;
    QROrdemServicoRetifozDESC_FILIAL: TStringField;
    QROrdemServicoRetifozNUM_CGC: TStringField;
    QROrdemServicoRetifozDESC_INSCRICAO: TStringField;
    QROrdemServicoRetifozDESC_ENDERECO_FILIAL: TStringField;
    QROrdemServicoRetifozDESC_BAIRRO_FILIAL: TStringField;
    QROrdemServicoRetifozCOD_CIDADE_FILIAL: TIntegerField;
    QROrdemServicoRetifozDESC_TELEFONE_FILIAL: TStringField;
    QROrdemServicoRetifozDESC_E_MAIL: TStringField;
    QROrdemServicoRetifozDESC_CIDADE_FILIAL: TStringField;
    QROrdemServicoRetifozCOD_ESTADO_FILIAL: TStringField;
    QROrdemServicoRetifozCOD_ORDEM_SERVICO_ITEM: TIntegerField;
    QROrdemServicoRetifozCOD_PRODUTO: TIntegerField;
    QROrdemServicoRetifozDESC_PRODUTO: TStringField;
    QROrdemServicoRetifozIND_TIPO_PRODUTO: TStringField;
    QROrdemServicoRetifozNUM_FABRICANTE: TStringField;
    QROrdemServicoRetifozQT_PRODUTO: TFloatField;
    QROrdemServicoRetifozVL_UNITARIO: TFloatField;
    QROrdemServicoRetifozPERC_DESCONTO: TFloatField;
    QROrdemServicoRetifozendereco_bairro_cidade_estado: TStringField;
    QROrdemServicoRetifozcodigo_nome_cadastro: TStringField;
    QROrdemServicoRetifozendereco_bairro: TStringField;
    QROrdemServicoRetifozCOD_MARCA: TIntegerField;
    QROrdemServicoRetifozDESC_MARCA: TStringField;
    QRFichaInspecao: TOracleDataSet1;
    QEquipamentoFicha: TOracleDataSet1;
    QEquipamentoFichaCons: TOracleDataSet1;
    QEquipamentoFichaConsCOD_EQUIPAMENTO_FICHA: TIntegerField;
    QEquipamentoFichaConsDESC_EQUIPAMENTO_FICHA: TStringField;
    QEquipamentoFichaConsDESC_TIPO_EQUIPAMENTO_FICHA: TStringField;
    QTipoEquipamentoCons: TOracleDataSet1;
    StringField2: TStringField;
    QFichaInspecao: TOracleDataSet1;
    QFichaInspecaoCOD_FICHA_INSPECAO_VEICULAR: TIntegerField;
    QFichaInspecaoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QFichaInspecaoCOD_EQUIPAMENTO_FICHA: TIntegerField;
    QFichaInspecaoQT_QUANTIDADE: TIntegerField;
    QEquipamentoFichaCOD_EQUIPAMENTO_FICHA: TIntegerField;
    QEquipamentoFichaDESC_EQUIPAMENTO_FICHA: TStringField;
    QEquipamentoFichaDESC_TIPO_EQUIPAMENTO_FICHA: TStringField;
    QFichaInspecaoLista: TOracleDataSet;
    CDSFichaInspecao: TClientDataSet;
    CDSFichaInspecaoCOD_EQUIPAMENTO_FICHA: TIntegerField;
    CDSFichaInspecaoQTDE: TIntegerField;
    DSFichaInspecao: TDataSource;
    CDSFichaInspecaoDESC_EQUIPAMENTO_FICHA: TStringField;
    CDSFichaInspecaoDESC_TIPO_EQUIPAMENTO_FICHA: TStringField;
    QFichaInspecaoListaCOD_FICHA_INSPECAO_VEICULAR: TIntegerField;
    QFichaInspecaoListaCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QFichaInspecaoListaCOD_EQUIPAMENTO_FICHA: TIntegerField;
    QFichaInspecaoListaQT_QUANTIDADE: TIntegerField;
    QRFichaInspecaoDT_ENTRADA: TDateTimeField;
    QRFichaInspecaoDT_PREVISAO_ENTREGA: TDateTimeField;
    QRFichaInspecaoCOD_CADASTRO: TIntegerField;
    QRFichaInspecaoNOME: TStringField;
    QRFichaInspecaoTELEFONE: TStringField;
    QRFichaInspecaoCOD_MODELO: TIntegerField;
    QRFichaInspecaoKM_ATUAL: TFloatField;
    QRFichaInspecaoNUM_ANO: TIntegerField;
    QRFichaInspecaoDESC_CARACTERISTICA: TStringField;
    QRFichaInspecaoNUM_MOTOR: TStringField;
    QRFichaInspecaoNUM_PLACA: TStringField;
    QRFichaInspecaoNUM_RENAVAM: TStringField;
    QRFichaInspecaoNUM_CHASSI: TStringField;
    QRFichaInspecaoCOD_MARCA: TIntegerField;
    QRFichaInspecaoDESC_MARCA: TStringField;
    QRFichaInspecaoDESC_MOTOR: TStringField;
    QRFichaInspecaoDESC_MODELO: TStringField;
    QRFichaInspecaoCOD_FABRICANTE: TIntegerField;
    QRFichaInspecaoDESC_FABRICANTE: TStringField;
    QRFichaInspecaoQT_QUANTIDADE: TIntegerField;
    QRFichaInspecaoDESC_EQUIPAMENTO_FICHA: TStringField;
    QRFichaInspecaoDESC_TIPO_EQUIPAMENTO_FICHA: TStringField;
    QrOrcamentoOSIND_TIPO_PRODUTO: TStringField;
    QrOrcamentoOSNUM_FABRICANTE: TStringField;
    QrOrcamentoOSVL_TOTAL_SERVICO: TFloatField;
    QrOrcamentoOSVL_DESCONTO_SERVICO: TFloatField;
    QrOrcamentoOSDESC_UNIDADE: TStringField;
    QrOrcamentoOSTIPO_PRODUTO: TStringField;
    QrOrcamentoOSDESC_FONE: TStringField;
    QrOrcamentoOSNOME_VENDEDOR: TStringField;
    QOrdemServicoKM_CHEGADA: TFloatField;
    QrOrcamentoOSKM_CHEGADA: TFloatField;
    QRFichaInspecaoKM_CHEGADA: TFloatField;
    QRFichaInspecaoNOME_VENDEDOR: TStringField;
    QrOrcamentoOSDESC_CADASTRO: TStringField;
    QROrdemServicoRetifozKM_CHEGADA: TFloatField;
    QROrdemServicoRetifozDESC_MODELO: TStringField;
    QROrdemServicoRetifozDESC_EQUIPAMENTO: TStringField;
    QRFichaInspecaoCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QRFichaInspecaoDESC_OBS: TMemoField;
    QRFichaInspecaoDESC_EQUIPAMENTO: TStringField;
    QRFichaInspecaoDESC_SOLICITACAO: TStringField;
    QOrdemServicoNUM_CILINDROS: TStringField;
    QOrdemServicoDESC_COMBUSTIVEL: TStringField;
    QRFichaInspecaoNUM_CILINDROS: TStringField;
    QRFichaInspecaoDESC_COMBUSTIVEL: TStringField;
    QROrdemServicoRetifozDESC_UNIDADE: TStringField;
    QROrdemServicoRetifozVAL_DESCONTO: TFloatField;
    QROrdemServicoRetifozDESC_COMBUSTIVEL: TStringField;
    QROrdemServicoRetifozNUM_CILINDROS: TStringField;
    QSomaItemOSSVAL_TOTAL_DESC_SERVICOS: TFloatField;
    QROrdemServicoRetifozNUM_CHASSI: TStringField;
    QROrdemServicoRetifozNUM_MOTOR: TStringField;
    QROrdemServicoRetifozNUM_ANO: TIntegerField;
    QContratoMensalCOD_CADASTRO_PARCEIRO: TIntegerField;
    QContratoMensalnome_parceiro: TStringField;
    QrOrcamentoOSDESC_FILIAL: TStringField;
    QrOrcamentoOSNUM_CGC_CPF: TStringField;
    QrOrcamentoOSDESC_E_MAIL: TStringField;
    QrOrcamentoOSEMAIL_FILIAL: TStringField;
    QOrdemServicoCOD_CIDADE_PRESTACAO: TIntegerField;
    QrOrcamentoOSDESC_MENSAGEM: TStringField;
    QOrdemServicoCOD_VENDEDOR: TIntegerField;
    QrOrcamentoOSNOME_TECNICO: TStringField;
    QOrdemServicoCOD_SUPERVISOR_OS: TIntegerField;
    QREntradaNOME_USUARIO: TStringField;
    QOrdemServicoConsNOME_TECNICO: TStringField;
    QOrdemServicoNotaDESC_CHAVE_ACESSO: TStringField;
    QREntradaDESC_OBS: TMemoField;
    QOrdemServicoIND_SITUACAO_OS: TStringField;
    QRAbertoIND_SITUACAO_OS: TStringField;
    QOrdemServicoDESC_OBS_CAB: TMemoField;
    QrOrcamentoOSDESC_OBS_CAB: TMemoField;
    QrOrcamentoOSDESC_COMPLEMENTO1: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTO2: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTO3: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTO4: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTO5: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTO6: TStringField;
    QrOrcamentoOSDESC_EQUIPAMENTO: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTOM1: TStringField;
    QREntradaNUM_CHASSI: TStringField;
    QREntradaDESC_COR: TStringField;
    QREntradaDESC_MODELO: TStringField;
    QREntradaDESC_SERVICO_SOLICITADO: TStringField;
    QREntradaQT_PRODUTO: TFloatField;
    QREntradaVL_UNITARIO: TFloatField;
    QREntradaVAL_DESCONTO: TFloatField;
    QREntradaVAL_ACRESCIMO: TFloatField;
    QREntradaDESC_COMPLEMENTO: TStringField;
    QREntradaDESC_PRODUTO: TStringField;
    QREntradaVAL_TOTAL: TFloatField;
    QREntradaCOD_TECNICO: TIntegerField;
    QREntradaNOME_TECNICO: TStringField;
    QREntradaIND_TIPO_PRODUTO: TStringField;
    QREntradaNUM_FABRICANTE: TStringField;
    QREntradaDESC_SERVICO_COMPLETO: TMemoField;
    QrOrcamentoOSVL_TOTAL_PECA: TFloatField;
    QrOrcamentoOSVL_DESCONTO_PECA: TFloatField;
    QREntradaNOME_PRODUTO: TStringField;
    QrOrcamentoOSDESC_SOLICITACAO: TStringField;
    QrOrcamentoOSDESC_OS_COMP: TMemoField;
    QrOrcamentoOSDESC_COR: TStringField;
    QrOrcamentoOSNUM_CHASSI: TStringField;
    QrOrcamentoOSDESC_MODELO: TStringField;
    QREntradaVL_TOTAL_SERVICO: TFloatField;
    QREntradaVL_DESCONTO_SERVICO: TFloatField;
    QREntradaVL_TOTAL_PECA: TFloatField;
    QREntradaVL_DESCONTO_PECA: TFloatField;
    QREntradaTIPO_PRODUTO: TStringField;
    QREntradaEND_FILIAL: TStringField;
    QREntradaCIDADE_FILIAL: TStringField;
    QREntradaDESC_VEICULO: TStringField;
    QREntradavl_total_acrescimo: TFloatField;
    QREntradavl_unitario_acrescimo: TFloatField;
    QOrdemServicoConsIND_SITUACAO_OS: TStringField;
    QOrdemServicoCheckListIND_MATRICULA_IMOVEL: TStringField;
    QOrdemServicoCheckListIND_CCIR: TStringField;
    QOrdemServicoCheckListIND_ITR: TStringField;
    QOrdemServicoCheckListIND_CAR: TStringField;
    QOrdemServicoCheckListIND_MAPA: TStringField;
    QOrdemServicoCheckListIND_MEMORIAL_DESCRITIVO: TStringField;
    QOrdemServicoCheckListIND_COPIA_RG_PROPRIETARIO: TStringField;
    QOrdemServicoCheckListIND_COPIA_CPF_PROPRIETARIO: TStringField;
    QOrdemServicoCheckListIND_CERT_CASAMENTO: TStringField;
    QOrdemServicoCheckListIND_COMP_ENDERECO: TStringField;
    QOrdemServicoCheckListIND_CONTRATO_COMPRA_VENDA: TStringField;
    QOrdemServicoItCOD_LOTE: TIntegerField;
    QOrdemServicoItCOD_TABELA_PRECO_CAB: TIntegerField;
    QrOrcamentoOSIND_MATRICULA_IMOVEL: TStringField;
    QrOrcamentoOSIND_CCIR: TStringField;
    QrOrcamentoOSIND_ITR: TStringField;
    QrOrcamentoOSIND_CAR: TStringField;
    QrOrcamentoOSIND_MAPA: TStringField;
    QrOrcamentoOSIND_MEMORIAL_DESCRITIVO: TStringField;
    QrOrcamentoOSIND_COPIA_CPF_PROPRIETARIO: TStringField;
    QrOrcamentoOSIND_COPIA_RG_PROPRIETARIO: TStringField;
    QrOrcamentoOSIND_CERT_CASAMENTO: TStringField;
    QrOrcamentoOSIND_COMP_ENDERECO: TStringField;
    QrOrcamentoOSIND_CONTRATO_COMPRA_VENDA: TStringField;
    QRMediaDT_ENTRADA_MANUTENCAO: TDateTimeField;
    QRMediaDT_SAIDA_MANUTENCAO: TDateTimeField;
    QREntradaCOD_SUPERVISOR: TIntegerField;
    QREntradaNOME_SUPERVISOR: TStringField;
    QOrdemServicoCOD_TECNICO2: TIntegerField;
    QREntradaCOD_TECNICO2: TIntegerField;
    QREntradaNOME_TECNICO2: TStringField;
    QOrdemServicoCOD_TECNICO3: TIntegerField;
    QREntradaCOD_TECNICO3: TIntegerField;
    QREntradaNOME_TECNICO3: TStringField;
    QOrdemServicoItCOD_PRODUTO: TFloatField;
    QREntradaCOD_VENDEDOR: TIntegerField;
    QRAnaliticoCOD_PRODUTO: TFloatField;
    QrOrcamentoOSCOD_PRODUTO: TFloatField;
    QRSaidaItensCOD_PRODUTO: TFloatField;
    QREntradaCOD_PRODUTO: TFloatField;
    QREntradaVAL_ISS: TFloatField;
    QrOrcamentoOSVAL_ISS: TFloatField;
    QREntradaCPNJ_FILIAL: TStringField;
    QREntradaKM_CHEGADA: TFloatField;
    QREntradaDESC_E_MAIL: TStringField;
    QRAnaliticoCOD_OPERACAO: TIntegerField;
    QOrdemServicoConsKM_CHEGADA: TFloatField;
    QOrdemServicoItDESC_COMPLEMENTO: TStringField;
    QrOrcamentoOSDESC_COMPLEMENTO: TStringField;
    QOrdemServicoItCOD_USUARIO: TIntegerField;
    QRSinteticoDT_ENTRADA: TDateTimeField;
    QRAnaliticoDT_ENTRADA: TDateTimeField;
    QREntradaCOMPLEMENTO_ENDERECO: TStringField;
    QOrdemServicoConsDESC_OBS_CAB: TStringField;
    QContratoMensalCOD_EMPRESA: TStringField;
    QOrdemServicoConsDESC_FANTASIA: TStringField;
    QOrdemServicoConsNOME_FANTASIA: TStringField;
    QREntradaDESC_FANTASIA: TStringField;
    QREntradaNOME_FANTASIA: TStringField;
    QOrdemServicoNUM_ALT_CABECOTE_E: TFloatField;
    QOrdemServicoNUM_ALT_CABECOTE_S: TFloatField;
    QrOrcamentoOsSemDesc: TOracleDataSet;
    QrOrcamentoOsSemDescCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QrOrcamentoOsSemDescDT_ENTRADA: TDateTimeField;
    QrOrcamentoOsSemDescCOD_CADASTRO: TIntegerField;
    QrOrcamentoOsSemDescKM_CHEGADA: TFloatField;
    QrOrcamentoOsSemDescDESC_CADASTRO: TStringField;
    QrOrcamentoOsSemDescDESC_EQUIPAMENTO: TStringField;
    QrOrcamentoOsSemDescDESC_SOLICITACAO: TStringField;
    QrOrcamentoOsSemDescDESC_OS_COMP: TMemoField;
    QrOrcamentoOsSemDescCOD_PRODUTO: TFloatField;
    QrOrcamentoOsSemDescQT_PRODUTO: TFloatField;
    QrOrcamentoOsSemDescVL_UNITARIO: TFloatField;
    QrOrcamentoOsSemDescVAL_ACRESCIMO: TFloatField;
    QrOrcamentoOsSemDescVAL_ISS: TFloatField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO: TStringField;
    QrOrcamentoOsSemDescDESC_PRODUTO: TStringField;
    QrOrcamentoOsSemDescIND_TIPO_PRODUTO: TStringField;
    QrOrcamentoOsSemDescDESC_UNIDADE: TStringField;
    QrOrcamentoOsSemDescVL_TOTAL_SERVICO: TFloatField;
    QrOrcamentoOsSemDescVL_TOTAL_PECA: TFloatField;
    QrOrcamentoOsSemDescTIPO_PRODUTO: TStringField;
    QrOrcamentoOsSemDescNUM_FABRICANTE: TStringField;
    QrOrcamentoOsSemDescVAL_TOTAL: TFloatField;
    QrOrcamentoOsSemDescNOME: TStringField;
    QrOrcamentoOsSemDescNUM_CGC_CPF: TStringField;
    QrOrcamentoOsSemDescDESC_E_MAIL: TStringField;
    QrOrcamentoOsSemDescNOME_VENDEDOR: TStringField;
    QrOrcamentoOsSemDescNOME_TECNICO: TStringField;
    QrOrcamentoOsSemDescDESC_FONE: TStringField;
    QrOrcamentoOsSemDescDESC_FILIAL: TStringField;
    QrOrcamentoOsSemDescENDERECO: TStringField;
    QrOrcamentoOsSemDescCIDADE: TStringField;
    QrOrcamentoOsSemDescDESC_TELEFONE: TStringField;
    QrOrcamentoOsSemDescEMAIL_FILIAL: TStringField;
    QrOrcamentoOsSemDescDESC_MENSAGEM: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTOM1: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO1: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO2: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO3: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO4: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO5: TStringField;
    QrOrcamentoOsSemDescDESC_COMPLEMENTO6: TStringField;
    QrOrcamentoOsSemDescDESC_OBS_CAB: TMemoField;
    QrOrcamentoOsSemDescNUM_PLACA: TStringField;
    QrOrcamentoOsSemDescDESC_COR: TStringField;
    QrOrcamentoOsSemDescNUM_CHASSI: TStringField;
    QrOrcamentoOsSemDescDESC_MODELO: TStringField;
    QrOrcamentoOsSemDescIND_MATRICULA_IMOVEL: TStringField;
    QrOrcamentoOsSemDescIND_CCIR: TStringField;
    QrOrcamentoOsSemDescIND_ITR: TStringField;
    QrOrcamentoOsSemDescIND_CAR: TStringField;
    QrOrcamentoOsSemDescIND_MAPA: TStringField;
    QrOrcamentoOsSemDescIND_MEMORIAL_DESCRITIVO: TStringField;
    QrOrcamentoOsSemDescIND_COPIA_CPF_PROPRIETARIO: TStringField;
    QrOrcamentoOsSemDescIND_COPIA_RG_PROPRIETARIO: TStringField;
    QrOrcamentoOsSemDescIND_CERT_CASAMENTO: TStringField;
    QrOrcamentoOsSemDescIND_COMP_ENDERECO: TStringField;
    QrOrcamentoOsSemDescIND_CONTRATO_COMPRA_VENDA: TStringField;
    QrOrcamentoOsSemDescvl_unitario_acrescimo: TFloatField;
    QrOrcamentoOsSemDescvl_total_acrescimo: TFloatField;
    QrOrcamentoOsSemDescVAL_DESCONTO: TFloatField;
    QrOrcamentoOsSemDescDESC_CARACTERISTICA: TStringField;
    QrOrcamentoOsSemDescNUM_ALT_CABECOTE_E: TFloatField;
    QrOrcamentoOsSemDescNUM_ALT_CABECOTE_S: TFloatField;
    QrOrcamentoOSNUM_ALT_CABECOTE_E: TFloatField;
    QrOrcamentoOSNUM_ALT_CABECOTE_S: TFloatField;
    QrOrcamentoOSDESC_CARACTERISTICA: TStringField;
    QrOrcamentoOSDESC_EMPRESA: TStringField;
    procedure QOrdemServicoCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoAfterInsert(DataSet: TDataSet);
    procedure QOrdemServicoItCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoItBeforeInsert(DataSet: TDataSet);
    procedure QOrdemServicoItBeforeEdit(DataSet: TDataSet);
    procedure QOrdemServicoItBeforeDelete(DataSet: TDataSet);
    procedure QOrdemServicoBeforeInsert(DataSet: TDataSet);
    procedure QOrdemServicoBeforeEdit(DataSet: TDataSet);
    procedure QOrdemServicoAfterCancel(DataSet: TDataSet);
    procedure QOrdemServicoAfterPost(DataSet: TDataSet);
    procedure QOrdemServicoBeforeCancel(DataSet: TDataSet);
    procedure QOrdemServicoItAfterInsert(DataSet: TDataSet);
    procedure QOrdemServicoItAfterPost(DataSet: TDataSet);
    procedure QOrdemServicoBeforeDelete(DataSet: TDataSet);
    procedure QOrdemServicoBeforePost(DataSet: TDataSet);
    procedure QOrdemServicoItBeforePost(DataSet: TDataSet);
    procedure QOrdemServicoItCOD_PRODUTOValidate(Sender: TField);
    procedure QContratoMensalAfterInsert(DataSet: TDataSet);
    procedure QContratoMensalCalcFields(DataSet: TDataSet);
    procedure QContratoMensalConsCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoCOD_CADASTROChange(Sender: TField);
    procedure QOrdemServicoItCOD_PRODUTOChange(Sender: TField);
    procedure QOrdemServicoItQT_PRODUTOChange(Sender: TField);
    procedure QOrdemServicoItCOD_LOTE_TIPOChange(Sender: TField);
    procedure QOrdemServicoItVAL_DESCONTOValidate(Sender: TField);
    procedure QOrdemServicoCheckListAfterInsert(DataSet: TDataSet);
    procedure QSomaItemOSCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoItAfterDelete(DataSet: TDataSet);
    procedure QOrdemServicoAfterOpen(DataSet: TDataSet);
    procedure QContratoMensalAfterPost(DataSet: TDataSet);
    procedure QrOrcamentoOSCalcFields(DataSet: TDataSet);
    procedure QOrdemServicoBeforeOpen(DataSet: TDataSet);
    procedure QROrdemServicoRetifozCalcFields(DataSet: TDataSet);
    procedure DSPAtualizaEquipamentoGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure QFichaInspecaoAfterPost(DataSet: TDataSet);
    procedure AbreFichaInspecaoRetifoz;
    procedure QREntradaCalcFields(DataSet: TDataSet);
    procedure QContratoFornecedorBeforePost(DataSet: TDataSet);
    procedure QContratoMensalBeforePost(DataSet: TDataSet);
    procedure QrOrcamentoOsSemDescCalcFields(DataSet: TDataSet);
  private
    totalServico :Double;
    totalPeca :Double;
    valDescServTela, valDescServItens: Double;
    valDescProdTela, valDescProdItens: Double;
    wExclui_Pelo_Botao : Boolean;
    wAcrescimo : Real;
    fCodListaPreco: integer;
    fUtilizaListaPrecoTodosItens: boolean;
    fUtilizaListaPreco1Item: boolean;
    procedure VerificaEstoque(filial: Integer; produto, qtde: Real; descProd: String = ''; codLote: String = '');
    procedure UtilizaListaPrecoTodosItens;
    function LiberaAlteracao(pOperacao: string = 'ALTERAR'): boolean;
    { Private declarations }
  public
    { Public declarations }
    property pTotalServico :Double read totalServico write totalServico;
    property pTotalPeca :Double read totalPeca write totalPeca;
    property pExclui_Pelo_Botao :Boolean read wExclui_Pelo_Botao write wExclui_Pelo_Botao Default False;
    property pCodListaPreco: integer read fCodListaPreco write fCodListaPreco;
    property pUtilizaListaPrecoTodosItens: boolean read fUtilizaListaPrecoTodosItens write fUtilizaListaPrecoTodosItens;
    property pUtilizaListaPreco1Item: boolean read fUtilizaListaPreco1Item write fUtilizaListaPreco1Item;
    procedure PrecoTabela;
  end;

var
  DMOrdemServico: TDMOrdemServico;

implementation

uses UOracle_cl, UUsuario_cl,  UContasPagar_cl,
  UParamSistema_cl, UContasReceberCons, UProduto_cl,
  UEstoque_cl, UBiblioteca, UCadastro_cl, UOperacao_cl, Math, Variants,
  UTabelaPreco_cl;

{$R *.DFM}

procedure TDMOrdemServico.QOrdemServicoCalcFields(DataSet: TDataSet);
Var wAux, wValISS : String;
begin
//  QOrdemServiconome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
//                                    'COD_FILIAL = '+FloatTostr(QOrdemServicoCod_Filial.Value));
//  QOrdemServiconome_cliente.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
//                                      'COD_CADASTRO = '+FloatTostr(QOrdemServicoCod_Cadastro.Value));
//  QOrdemServiconome_tecnico.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
//                                      'COD_VENDEDOR = '+FloatTostr(QOrdemServicoCod_Tecnico.Value));
  wAux := DMoracle.BuscaNome('SELECT SUM(VL_UNITARIO*QT_PRODUTO) AS S FROM TB_ORDEM_SERVICO_ITEM',
                             'COD_ORDEM_SERVICO_CAB = '+FloatToStr(QOrdemServicoCod_Ordem_Servico_Cab.Value) );
  wValISS := DMoracle.BuscaNome('SELECT SUM(VAL_ISS) AS S FROM TB_ORDEM_SERVICO_ITEM',
                             'COD_ORDEM_SERVICO_CAB = '+FloatToStr(QOrdemServicoCod_Ordem_Servico_Cab.Value) );
  If Trim(wAux) <> '' Then
  begin
    if DMOracle.FastSelect('IND_ISS_RETIDO', 'TB_CADASTRO', 'COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text) = '1' then
      QOrdemServicototal.Value := StrToFloat(wAux)-QOrdemServicoVl_Desconto.Value - StrToFloat(wValISS)
    else
      QOrdemServicototal.Value := StrToFloat(wAux)-QOrdemServicoVl_Desconto.Value;
  end
  Else
    QOrdemServicoTotal.Value := 0;

  if QOrdemServicoCOD_NOTA_CAB.Value > 0 then
    QOrdemServiconum_ordem_servico.Value := StrToInt('0' + DMOracle.BuscaNome(
        'SELECT NUM_NOTA FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + QOrdemServicoCOD_NOTA_CAB.Text));
end;

procedure TDMOrdemServico.QOrdemServicoAfterInsert(DataSet: TDataSet);
begin
  QOrdemServicoCOD_PRAZO_VENCIMENTO.Clear;
  QOrdemServicoDT_ENTRADA_MANUTENCAO.Clear;
  QOrdemServicoDT_SAIDA_MANUTENCAO.Clear;
  QOrdemServicoDt_Entrada.Value := DMOracle.DataServ;
  QOrdemServicoCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QOrdemServicoCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QOrdemServicoCOD_OPERACAO.Value := DMUsuario.CodOperacaoPadrao;
  if DMUsuario.CodVendedorPadrao > 0 then
    DMOrdemServico.QOrdemServicoCOD_TECNICO.Value := DMUsuario.CodVendedorPadrao;
  //--A pedido do Aurelio, mensagem padrão 2 na ordem servico. Vanessa 27/01/2013
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TRENTO') then
    DMOrdemServico.QOrdemServicoCOD_MENSAGEM.Value := 2;
  //--
  if DMParamSistema.CodEmpresa = 'GEOPRO' then
  begin
    QOrdemServicoDESC_EQUIPAMENTO.Value := 'IMÓVEL:';   //Alterado a mensagem, solicitação Vagner GeoPro - Jeferson/Junior
    QOrdemServicoDESC_OBS_CAB.Value := 'ESTÃO EXCLUSOS DO PRESENTE ORÇAMENTO: Coleta de assinaturas dos confrontantes, custos e taxas extras com despesas ' +
    'cartorárias, prefeituras e outros órgãos públicos, dos imóveis e/ou dos confrontantes (se necessário), averbações em registro de imóveis.' +  chr(13) + chr(10) +
    'OBSERVAÇÃO: Todos os serviços extraordinários não contratados que forem necessários ou solicitados pelo contratante ' +
    'serão cobrados à parte, com preços previamente convencionados. ';
  end;
  QOrdemServicoCheckList.Insert;

  DMOrdemServico.pCodListaPreco := 0;
end;

procedure TDMOrdemServico.QOrdemServicoItCalcFields(DataSet: TDataSet);
begin
   QOrdemServicoitnome_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                      'COD_PRODUTO = '+FloatTostr(QOrdemServicoItCod_Produto.Value));
  QOrdemServicoItDesc_un.Value := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO',
                                      'COD_PRODUTO = '+FloatTostr(QOrdemServicoItCod_Produto.Value));
  QOrdemServicoItvl_Total.Value := (QOrdemServicoItVl_unitario.Value * QOrdemServicoItQT_PRODUTO.Value )-
    (QOrdemServicoItVAL_DESCONTO.Value * QOrdemServicoItQT_PRODUTO.Value) + (QOrdemServicoItVAL_ACRESCIMO.Value);

  QOrdemServicoItvl_Total_bruto.Value := QOrdemServicoItVl_unitario.Value * QOrdemServicoItQt_Produto.Value;

  if QOrdemServicoItQt_Produto.Value > 0 then //estava dando erro quando passava pela primeira vez. Gian/Junior 08/09/2017
    QOrdemServicoItvl_item_acrescimo.Value := (((QOrdemServicoItVl_unitario.Value * QOrdemServicoItQt_Produto.Value)+ QOrdemServicoItVAL_ACRESCIMO.Value)/QOrdemServicoItQt_Produto.Value);

  if trim(QOrdemServicoItDESC_COMPLEMENTO.Value) <> '' then
    QOrdemServicoItproduto_obs.Value := QOrdemServicoitnome_produto.Value + ' - ' + trim(QOrdemServicoItDESC_COMPLEMENTO.Value)
  else
    QOrdemServicoItproduto_obs.Value := QOrdemServicoitnome_produto.Value;
end;

procedure TDMOrdemServico.QOrdemServicoItBeforeInsert(DataSet: TDataSet);
begin
  If QOrdemServico.State = dsInsert Then
  Begin
    QOrdemServico.Post;
    QOrdemServico.Edit;
  End;
  If QOrdemServico.State <> dsEdit Then
    Raise Exception.Create('Ordem de Serviço não está no modo de alteração!');
end;

procedure TDMOrdemServico.QOrdemServicoItBeforeEdit(DataSet: TDataSet);
begin
  If Not (QOrdemServico.State in [dsEdit,dsInsert]) Then
    Raise Exception.Create('Ordem de Serviço não está no modo de alteração!');
{Adicionado para gravar o usuário que esta editando a O.S. Informação necessária na tb_log. Alex 25/09/2023. }
  QOrdemServicoItCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;  
end;

procedure TDMOrdemServico.QOrdemServicoItBeforeDelete(DataSet: TDataSet);
begin
  If Not(pExclui_Pelo_Botao) Then  // este parametro é para indicar que esta excluindo a nota completa - botao excluir - Cesar 23/03/2015
    If Not (QOrdemServico.State in [dsEdit,dsInsert]) Then
       Raise Exception.Create('Ordem de Serviço não está no modo de alteração!');
end;

procedure TDMOrdemServico.QOrdemServicoBeforeInsert(DataSet: TDataSet);
begin
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;

  //CRIADO PRA PRÉ INSERIR OS ITENS NO GRID PARA INSERÇÃO DOS EQUIPAMENTOS PARA RETIFOZ - CLEBER 06/10/2020
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    QEquipamentoFicha.First;
    CDSFichaInspecao.Close;
    CDSFichaInspecao.CreateDataSet;

    while not QEquipamentoFicha.Eof do
    begin
      CDSFichaInspecao.Append;
      CDSFichaInspecaoCOD_EQUIPAMENTO_FICHA.Value := QEquipamentoFichaCOD_EQUIPAMENTO_FICHA.Value;
      CDSFichaInspecaoQTDE.Value := 0;
      CDSFichaInspecao.Post;
      QEquipamentoFicha.Next;
    end;
    CDSFichaInspecao.First;
  end;

  pUtilizaListaPrecoTodosItens := false; // Inicializa propriedade com um valor
  pUtilizaListaPreco1Item := false; // Inicializa propriedade com um valor
{Adicionado para gravar o usuário que esta editando a O.S. Informação necessária na tb_log. Alex 25/09/2023. }
  QOrdemServicoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOrdemServico.QOrdemServicoBeforeEdit(DataSet: TDataSet);
begin
  if not LiberaAlteracao then
    abort;
  If (Trim(QOrdemServicoDt_Saida.Text)  <> '') and (DMParamSistema.CodEmpresa <> 'ANDROID') and
      (DMParamSistema.CodEmpresa <> 'GEOPRO') Then //Solicitado por Thalia, precisa apenas alterar observações (equipamentos de garantia).
    Raise Exception.Create('Ordem de Serviço já fechada');
  If Not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;

  if not (QOrdemServicoCheckList.State in [dsEdit]) then
  begin
    QOrdemServicoCheckList.Close;
    QOrdemServicoCheckList.Open;
    QOrdemServicoCheckList.Edit;
  end;

  //Adicionado para retifoz ter sempre as quantidades de equipamentos existentes nas fichas de inspeção
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
    AbreFichaInspecaoRetifoz;
{Adicionado para gravar o usuário que esta editando a O.S. Informação necessária na tb_log. Alex 25/09/2023. }
  QOrdemServicoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOrdemServico.QOrdemServicoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QOrdemServico.Close;
  QOrdemServico.Open;
  QOrdemServicoCheckList.Close;
  QOrdemServicoCheckList.Open;
end;

procedure TDMOrdemServico.QOrdemServicoAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  if QOrdemServicoCheckList.State in [dsInsert,dsEdit] then
    QOrdemServicoCheckList.Post;

  wCodigo := QOrdemServicoCod_Ordem_Servico_Cab.Value;
  QOrdemServico.Close;
  QOrdemServico.SetVariable('PK',wCodigo);
  QOrdemServico.Open;
  QOrdemServicoCheckList.Close;
  QOrdemServicoCheckList.Open;
  DMOracle.DBCemapa.Commit;
end;

procedure TDMOrdemServico.QOrdemServicoBeforeCancel(DataSet: TDataSet);
begin
  if not LiberaAlteracao('CANCELAR') then
    abort;     
  If QOrdemServicoIt.State in [dsInsert,dsEdit] then
    QOrdemServicoIt.Cancel;  
end;

procedure TDMOrdemServico.QOrdemServicoItAfterInsert(DataSet: TDataSet);
var wCodTabelaPreco: integer;
  wValidadeTabelaPreco: string;
begin
   wCodTabelaPreco := 0;

//  QOrdemServicoItCod_Ordem_Servico_item.Value := DMOracle.Sequencia('ORDEM_SERVICO_ITEM');
  QOrdemServicoItCod_Ordem_Servico_Cab.Value := QOrdemServicoCod_Ordem_Servico_Cab.Value;
  QOrdemServicoItQT_PRODUTO.Value := 1;
 // if DMParamSistema.QParamSistemaCOD_EMPRESA.Text <> 'MEDIPECAS' then
   // QOrdemServicoItCOD_LOTE_TIPO.Value := 1

    QOrdemServicoItVAL_DESCONTO.Value :=0;
    QOrdemServicoItPERC_DESCONTO.Value :=0;

    if pCodListaPreco > 0 then
    QOrdemServicoItCOD_TABELA_PRECO_CAB.Value := pCodListaPreco;         //criar cod_tabela_preco

    if pUtilizaListaPreco1Item then
      begin
        QOrdemServicoItCOD_TABELA_PRECO_CAB.Clear;
        pUtilizaListaPreco1Item := false;
    end;
end;

procedure TDMOrdemServico.QOrdemServicoItAfterPost(DataSet: TDataSet);
var
  wCodigo: integer;
begin     
  wCodigo := QOrdemServicoItCOD_ORDEM_SERVICO_ITEM.Value;
  QOrdemServicoIt.Close;
  QOrdemServicoIt.Open;
  QOrdemServicoIt.Locate('COD_ORDEM_SERVICO_ITEM', wCodigo, []);
  QSomaItemOS.Close;
  QSomaItemOS.Open;
  // QOrdemServicoCalcFields(QOrdemServico);
  UtilizaListaPrecoTodosItens;
end;

procedure TDMOrdemServico.QOrdemServicoBeforeDelete(DataSet: TDataSet);
begin
  if not LiberaAlteracao('EXCLUIR') then
    abort;
  If QOrdemServicoDt_Saida.Value > 0 Then
    Raise Exception.Create('Ordem de Serviço já fechada');
  if QOrdemServicoCheckList.RecordCount > 0 then
    QOrdemServicoCheckList.Delete;

  QFichaInspecao.Close;
  QFichaInspecao.SetVariable('cod_ordem_servico_cab', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
  QFichaInspecao.Open;
  QFichaInspecao.First;
  while not (QFichaInspecao.Eof) do
  begin
    QFichaInspecao.Delete;
  end;
end;

procedure TDMOrdemServico.QOrdemServicoBeforePost(DataSet: TDataSet);
Var
  wDesconto: Real;
  wPercJuro : String;
begin
  DMOracle.ValidaFilial(QOrdemServicoCOD_FILIAL.Text);
  if not LiberaAlteracao('SALVAR') then
    abort;
  wDesconto := 0;

  QSomaItemOS.Close;
  QSomaItemOS.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
  QSomaItemOS.Open;

  QOrdemServicoVl_Desconto.Value := QSomaItemOSSVAL_DESCONTO.Value;
  if QOrdemServicoCheckList.State in [dsInsert,dsEdit] then
    QOrdemServicoCheckList.Post;

  //solicitado por Marcos - Gian 31/08/2017
  //Adiciona valor de acréscimo, dependendo do Juros no prazo de vencimento


  if DMOrdemServico.QOrdemServicoCOD_PRAZO_VENCIMENTO.IsNull then
    wAcrescimo := 0
  else
  begin
    wPercJuro := DMOracle.FastSelect('PERC_JUROS','TB_PRAZO_VENCIMENTO','COD_PRAZO_VENCIMENTO = ' + DMOrdemServico.QOrdemServicoCOD_PRAZO_VENCIMENTO.Text);
    if wPercJuro = '' then
      wAcrescimo := 0
    else
      wAcrescimo := StrToFloat(wPercJuro);
  end;

  with DMOrdemServico do
  begin
    {QOrdemServicoIt.Close;
    QOrdemServicoIt.SetVariable('COD_ORDEM_SERVICO_CAB',QOrdemServicoCOD_ORDEM_SERVICO_CAB.Text);
    QOrdemServicoIt.Open;
    while not QOrdemServicoIt.Eof do
    begin
      QOrdemServicoIt.Edit;
      QOrdemServicoItVAL_ACRESCIMO.Value := ((QOrdemServicoItVL_UNITARIO.Value*QOrdemServicoItQT_PRODUTO.Value)*wAcrescimo)/100;
      QOrdemServicoIt.Post;
      QOrdemServicoIt.Next;
    end;
     }
    //INCLUSÃO DA FICHA DE INSPEÇÃO NA ORDEM DE SERVIÇO
    if (DMParamSistema.CodEmpresa = 'RETIFOZ') then
    begin
      if (QOrdemServico.State in [dsEdit,dsInsert]) and not (QOrdemServicoIt.State in [dsEdit]) then
      begin

        CDSFichaInspecao.DisableControls;
        CDSFichaInspecao.First;
        while not CDSFichaInspecao.Eof do
        begin
          QFichaInspecaoLista.Close;
          QFichaInspecaoLista.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
          QFichaInspecaoLista.SetVariable('COD_EQUIPAMENTO_FICHA', CDSFichaInspecaoCOD_EQUIPAMENTO_FICHA.Value);
          QFichaInspecaoLista.Open;
          QFichaInspecao.Close;
          QFichaInspecao.Open;

          if QFichaInspecaoLista.RecordCount > 0 then
          begin
            while not QFichaInspecaoLista.Eof do
            begin
              if CDSFichaInspecaoCOD_EQUIPAMENTO_FICHA.Value = QFichaInspecaoListaCOD_EQUIPAMENTO_FICHA.Value then
              begin
                  QFichaInspecaoLista.Edit;
                  QFichaInspecaoListaQT_QUANTIDADE.Value := CDSFichaInspecaoQTDE.Value;
                  QFichaInspecaoLista.Post;
              end;
              QFichaInspecaoLista.Next;
            end;
          end
          else
          begin
            if CDSFichaInspecaoQTDE.Value > 0 then
            begin
              QFichaInspecao.Append;
              QFichaInspecaoCOD_ORDEM_SERVICO_CAB.Value := QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value;
              QFichaInspecaoCOD_EQUIPAMENTO_FICHA.Value := CDSFichaInspecaoCOD_EQUIPAMENTO_FICHA.Value;
              QFichaInspecaoQT_QUANTIDADE.Value := CDSFichaInspecaoQTDE.Value;
              QFichaInspecao.Post;
            end;
          end;

          CDSFichaInspecao.Next;
        end;
        CDSFichaInspecao.First;
        CDSFichaInspecao.EnableControls;
      end;
      DMOracle.ExecutaSql('DELETE FROM TB_FICHA_INSPECAO_VEICULAR WHERE QT_QUANTIDADE = 0');
    end;
//Adicionado para a Pateli preencher automaticamente um ponto na descrição do equipamento e para o serviço.
//Solicitado pela Kelly da M1 Pateli. - Alex 23/03/2022
  if (DMParamSistema.CodEmpresa = 'PATELI') or (DMParamSistema.CodEmpresa = 'NFCE-IVO') then
  begin
    if (QOrdemServicoDESC_EQUIPAMENTO.Value = '') then
      QOrdemServicoDESC_EQUIPAMENTO.Value := '.';
    if (QOrdemServicoDESC_SOLICITACAO.value = '') then
      QOrdemServicoDESC_SOLICITACAO.Value := '.';
  end;
  if (DMParamSistema.CodEmpresa = 'RENATOAUTO') and (QOrdemServicoDESC_EQUIPAMENTO.Value = '') then
      QOrdemServicoDESC_EQUIPAMENTO.Value := '.';
{Adicionado para gravar o usuário que esta editando a O.S. Informação necessária na tb_log. Alex 25/09/2023. }
  QOrdemServicoCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  end;
end;

procedure TDMOrdemServico.QOrdemServicoItBeforePost(DataSet: TDataSet);
var
  wtotal : Real;
  wPercISS, wBaseISS, wTipoServico, wEmite, wIndNotaSeparada: string;
begin
 { if QSomaItemOS.Eof then
  begin
    QSomaItemOS.Close;
    QSomaItemOS.Open;
  end;}

  //ACRÉSCIMO MOVÍDO PARA CÁ PARA TESTAR EFICIÊNCIA
  QOrdemServicoItVAL_ACRESCIMO.Value := ((QOrdemServicoItVL_UNITARIO.Value*QOrdemServicoItQT_PRODUTO.Value)*wAcrescimo)/100;

  If QOrdemServicoItQt_Produto.Value = 0 Then
     Raise Exception.Create('Quantidade inválida!');

  If (QOrdemServicoItVl_Unitario.Value = 0) and ( (DMParamSistema.CodEmpresa <> 'CENTERFRIO') and (DMParamSistema.CodEmpresa <> 'NFCE-IVO') ) Then
     Raise Exception.Create('Valor Unitário Inválido!');
  If QOrdemServicoItCOD_LOTE_TIPO.Value = 0 then
    QOrdemServicoItCOD_LOTE_TIPO.Value := 1;
  wTipoServico := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QOrdemServicoItCOD_PRODUTO.Value), True);
  wEmite := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO', 'COD_OPERACAO = ' + QOrdemServicoCOD_OPERACAO.Text, True);
  wIndNotaSeparada := DMOracle.BuscaNome('SELECT IND_OS_NOTA_SEPARADA FROM TB_PARAM_SISTEMA','1=1',True);
  if (wTipoServico = 'SERVIÇO')  And ((wEmite = 'F') or (wIndNotaSeparada = 'S')) then
  begin
    wPercISS := DMOracle.BuscaNome('SELECT PERC_ISS FROM TB_FILIAL','COD_FILIAL = ' + QOrdemServicoCOD_FILIAL.Text, True);
    wBaseISS := DMOracle.BuscaNome('SELECT PERC_BC_NFSE FROM TB_FILIAL','COD_FILIAL = ' + QOrdemServicoCOD_FILIAL.Text, True);
    if (wBaseISS <> '') and (wPercISS <> '') then
       QOrdemServicoItVAL_ISS.Value := QOrdemServicoItvl_total.Value * StrToFloat(wPercISS) / StrToFloat(wBaseISS)
    else
    begin
      wPercISS := DMOracle.BuscaNome('SELECT PERC_ISS FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QOrdemServicoItCOD_PRODUTO.Value), True);
      if Trim(wPercISS) <> '' then
        if DMOracle.BuscaNome('SELECT IND_REGIME_ESPECIAL FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QOrdemServicoCOD_CADASTRO.Value)) <> 'SIM' then
           QOrdemServicoItVAL_ISS.Value := QOrdemServicoItvl_total.Value * StrToFloat(wPercISS) / 100;
    end;
  end
  else
    QOrdemServicoItVAL_ISS.Value := 0;
    pCodListaPreco := QOrdemServicoItCOD_TABELA_PRECO_CAB.Value;
{Adicionado para gravar o usuário que esta editando a O.S. Informação necessária na tb_log. Alex 25/09/2023. }
  QOrdemServicoItCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMOrdemServico.QOrdemServicoItCOD_PRODUTOValidate(
  Sender: TField);
Var wVl_Unitario : String;
begin
  wVl_Unitario := DMOracle.BuscaNOme('SELECT VAL_VAREJO FROM TB_PRODUTO',
                       'COD_PRODUTO = '+FloatToStr(QOrdemServicoItCod_Produto.Value));
    If Trim(wVl_Unitario) <> '' Then
    QOrdemServicoItVl_Unitario.Value := StrToFloat(wVl_Unitario)
  Else
    QOrdemServicoItVl_Unitario.Value := 0;
  PrecoTabela;
end;

procedure TDMOrdemServico.QContratoMensalAfterInsert(DataSet: TDataSet);
begin
  QContratoMensalCod_Contrato_Mensal.Value := DMOracle.Sequencia('CONTRATO_MENSAL');
  QContratoMensalInd_Situacao.Value:='ATIVO';
  QContratoMensalCod_Filial.Value:=1;
  QContratoMensalDt_Venda.Value:=Date;
 // PrecoTabela;
end;

procedure TDMOrdemServico.QContratoMensalCalcFields(DataSet: TDataSet);
begin
  QContratoMensalnome_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                    'COD_FILIAL = '+FloatTostr(QContratoMensalCod_Filial.Value));
  QContratoMensalnome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                      'COD_CADASTRO = '+FloatTostr(QContratoMensalCod_Cadastro.Value));
  QContratoMensalnome_parceiro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                      'COD_CADASTRO = '+FloatTostr(QContratoMensalCod_Cadastro_Parceiro.Value));
end;

procedure TDMOrdemServico.QContratoMensalConsCalcFields(DataSet: TDataSet);
begin
//  QContratoMensalConsnome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
//                                      'COD_CADASTRO = '+FloatTostr(QContratoMensalConsCod_Cadastro.Value));

end;

procedure TDMOrdemServico.QOrdemServicoCOD_CADASTROChange(Sender: TField);
var
  wAux: String;
begin
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INNET') and
      (QOrdemServicoCOD_CADASTRO.Text <> '') Then
  Begin
    wAux := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_RECEBER_CAB ',
          ' IND_SITUACAO<>' + Chr(39) + 'BAIXA TOTAL' + Chr(39) +
          ' AND COD_CADASTRO = ' + Trim(QOrdemServicoCOD_CADASTRO.Text));
    If (wAux <> '') Then
       If MessageDlg('Cliente possui títulos no valor de R$ ' + FormatFloat('#,##0.00', StrToFloat(wAux)) + '.'
          + chr(13) + chr(10) + 'Deseja verificar?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
       Begin
         If FContasReceberCons = Nil Then
             FContasReceberCons := TFContasReceberCons.Create(Application);
         FContasReceberCons.MecodCliente.Text := QOrdemServicoCOD_CADASTRO.Text;
         FContasReceberCons.BtProcurarClick(Self);
         FContasReceberCons.ShowModal;
       End;
  End;
end;

procedure TDMOrdemServico.VerificaEstoque(filial: Integer; produto: real; qtde: Real; descProd: String = ''; codLote: String = '');
var
  wAux: String;
begin
  if (filial > 0) and (produto > 0) and (qtde > 0) then
  begin
    wAux := DMOracle.FastSelect('QT_QUANTIDADE', 'TB_ESTOQUE', 'COD_PRODUTO = ' +
        FloatToStr(produto) + ' AND COD_FILIAL = ' + IntToStr(filial) +
        Bib.ift(codLote = '', '', ' AND COD_LOTE_TIPO = ' + codLote));
    if(wAux = '') then
      wAux := '0';
    if StrToFloat(wAux) < qtde then
      MessageDlg('Atenção!'+#13+#10+'Produto ' + descProd + ' não possui estoque suficiente.', mtWarning, [mbOK], 0);
  end;
end;

procedure TDMOrdemServico.QOrdemServicoItCOD_PRODUTOChange(Sender: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
  begin
    if (DMProduto.QProdutoConsCOD_PRODUTO.Value = QOrdemServicoItCOD_PRODUTO.Value) then
      QOrdemServicoItCOD_LOTE_TIPO.Value := DMEstoque.QEstoqueConsCOD_LOTE_TIPO.Value;
    VerificaEstoque(QOrdemServicoCOD_FILIAL.Value,
        QOrdemServicoItCOD_PRODUTO.Value,
        QOrdemServicoItQT_PRODUTO.Value,
        QOrdemServicoItnome_produto.Value,
        QOrdemServicoItCOD_LOTE_TIPO.Text);
  end;
end;

procedure TDMOrdemServico.QOrdemServicoItQT_PRODUTOChange(Sender: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
    VerificaEstoque(QOrdemServicoCOD_FILIAL.Value,
        QOrdemServicoItCOD_PRODUTO.Value,
        QOrdemServicoItQT_PRODUTO.Value,
        QOrdemServicoItnome_produto.Value,
        QOrdemServicoItCOD_LOTE_TIPO.Text);
end;

procedure TDMOrdemServico.QOrdemServicoItCOD_LOTE_TIPOChange(
  Sender: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MEDIPECAS' then
  begin
    if QOrdemServicoItCOD_LOTE_TIPO.Value = 1 then
      QOrdemServicoItCOD_TRIBUTACAO.Value := 4
    else if QOrdemServicoItCOD_LOTE_TIPO.Value = 2 then
      QOrdemServicoItCOD_TRIBUTACAO.Value := 1;
  end;
end;

procedure TDMOrdemServico.QOrdemServicoItVAL_DESCONTOValidate(
  Sender: TField);
var
wMaxDesconto,wDesconto,wValDesconto : Real;
begin
   //copiei e modifiquei o código abaixo. Prevalecer o percentual de desconto do cadastro e não do param sistema. Vanessa 14/11/2014
  //if ((QOrdemServicoItVAL_DESCONTO.Value <> 0) and
//     (StrToFloat(DMOracle.FastSelect('PERC_DESCONTO_MAXIMO','TB_USUARIO', 'COD_USUARIO ='+IntToStr(DMUsuario.CodUsuarioCorrente))) <> 0)) then
//  Begin
//    wMaxDesconto := StrToFloat(DMOracle.FastSelect('PERC_DESCONTO_MAXIMO','TB_USUARIO',
//                                        'COD_USUARIO ='+IntToStr(DMUsuario.CodUsuarioCorrente)));
//    wDesconto := ((QOrdemServicoItVAL_DESCONTO.Value * 100) / QOrdemServicoItVL_UNITARIO.Value);
//    if wDesconto > wMaxDesconto then
//    Begin
//      QOrdemServicoItVAL_DESCONTO.Value := 0;
//      wValDesconto := wMaxDesconto * QOrdemServicoItVL_UNITARIO.Value / 100;
//      Raise Exception.Create('Desconto Máximo Permitido para o Usuário é de '+FloatToStr(wMaxDesconto)+
//                             '% ou R$'+FormatFloat('0.00#,##',wValDesconto)+' por unidade!');
//    end;
//  end;

    if ((QOrdemServicoItVAL_DESCONTO.Value <> 0) and
        (StrToFloat(DMOracle.FastSelect('PERC_DESCONTO_MAXIMO','TB_USUARIO', 'COD_USUARIO ='+IntToStr(DMUsuario.CodUsuarioCorrente))) <> 0)) then
    Begin
      if dmcadastro.QCadastroPERC_DESCONTO2.Value = 0 then //se perc desconto cadastro cliente for zero, pegar dos parametros do sistema
        wMaxDesconto := StrToFloat(DMOracle.FastSelect('PERC_DESCONTO_MAXIMO','TB_USUARIO', 'COD_USUARIO ='+IntToStr(DMUsuario.CodUsuarioCorrente)))
      else //senão pegar percentual de desconto do cadastro cliente
        wMaxDesconto := dmcadastro.QCadastroPERC_DESCONTO2.Value;

      wDesconto := ((QOrdemServicoItVAL_DESCONTO.Value * 100) / QOrdemServicoItVL_UNITARIO.Value);

      if wDesconto > wMaxDesconto then
      Begin
        QOrdemServicoItPERC_DESCONTO.Value := 0;
        QOrdemServicoItVAL_DESCONTO.Value := 0;

        wValDesconto := wMaxDesconto * QOrdemServicoItVL_UNITARIO.Value / 100;

        Raise Exception.Create('Desconto Máximo Permitido para o Usuário é de '+FloatToStr(wMaxDesconto)+
                               '% ou R$ '+FormatFloat('0.00#,##',wValDesconto)+' por unidade!');
      end;
    end;
end;

procedure TDMOrdemServico.QOrdemServicoCheckListAfterInsert(
  DataSet: TDataSet);
begin
  QOrdemServicoCheckListCOD_ORDEM_SERVICO_CAB.Value := QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value;
end;

procedure TDMOrdemServico.QSomaItemOSCalcFields(DataSet: TDataSet);
begin
  if (QSomaItemOSSVAL_DESCONTO.Value <> 0 ) then
    QSomaItemOSsval_total_os.Value := QSomaItemOSSVAL_TOTAL.Value - QSomaItemOSSVAL_DESCONTO.Value
  else
    QSomaItemOSsval_total_os.Value := QSomaItemOSSVAL_TOTAL.Value;
  if DMOracle.FastSelect('IND_ISS_RETIDO', 'TB_CADASTRO', 'COD_CADASTRO = ' + QOrdemServicoCOD_CADASTRO.Text) = '1' then
    QSomaItemOSsval_total_os.Value := QSomaItemOSsval_total_os.Value - QSomaItemOSSVAL_ISS.Value;
end;

procedure TDMOrdemServico.QOrdemServicoItAfterDelete(DataSet: TDataSet);
begin
  QSomaItemOS.Close;
  QSomaItemOS.Open;
end;

procedure TDMOrdemServico.QOrdemServicoAfterOpen(DataSet: TDataSet);
begin
  QSomaItemOS.Close;
  QSomaItemOS.Open;
  AbreFichaInspecaoRetifoz;
end;

procedure TDMOrdemServico.QContratoMensalAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QContratoMensalCod_Contrato_Mensal.Value;
  QContratoMensal.Close;
  QContratoMensal.SetVariable('PK',wCodigo);
  QContratoMensal.Open;
end;

procedure TDMOrdemServico.QrOrcamentoOSCalcFields(DataSet: TDataSet);
begin
  with DMOrdemServico do
  begin
    QrOrcamentoOSvl_unitario_acrescimo.Value := (((QrOrcamentoOSVl_unitario.Value * QrOrcamentoOSQt_Produto.Value)+ QrOrcamentoOSVAL_ACRESCIMO.Value)/QrOrcamentoOSQt_Produto.Value);
    QrOrcamentoOSvl_total_acrescimo.Value := ((QrOrcamentoOSVl_unitario.Value * QrOrcamentoOSQt_Produto.Value) - (QrOrcamentoOSVAL_DESCONTO.Value*QrOrcamentoOSQt_Produto.Value)
                                                + QrOrcamentoOSVAL_ACRESCIMO.Value);
  end;
end;

procedure TDMOrdemServico.QOrdemServicoBeforeOpen(DataSet: TDataSet);
begin
  if DMParamSistema.CodEmpresa = 'REGINATO' then //NÃO PEDIR DESC_SOLICITACAO Junior 17/11/2017
    QOrdemServicoDESC_SOLICITACAO.Required := False;

  //Inicia o conjunto de dados para inserir a ficha de inspeção RETIFOZ - Cleber 05/10/2020
  {if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin }
    CDSFichaInspecao.Close;
    CDSFichaInspecao.CreateDataSet;
  //end;

end;

function TDMOrdemServico.LiberaAlteracao(pOperacao: string = 'ALTERAR'): boolean;
begin
  result := false;
  QControlaAlteracao.Close;
  QControlaAlteracao.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
  QControlaAlteracao.Open;

  // Está em inserção
  if QControlaAlteracao.Eof then
    result := true;

  while not QControlaAlteracao.Eof do
  begin
    if pOperacao = 'ALTERAR' then
    begin
      if (QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value = 'NENHUM')
        or (UpperCase(bib.PegaNomeComputador) = UpperCase(QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value)) then
      begin
        QControlaAlteracao.Edit;
        QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value
          := bib.PegaNomeComputador;
        QControlaAlteracao.Post;
        //Adicionado o comando para atualizar os registros no dataset antes de iniciar a edição
        //Sem ele, dispara o erro: Record has been changed by another user
        //QOrdemServico.RefreshRecord;
        result := true
      end
      else
      begin
        MessageDlg('Alteração não permitida.' + chr(13) + char(10)
          + 'Este registro está sendo alterado pelo computador '
          + QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value, mtError, [mbOk], 0);
        result := false;
      end;
    end;
    if pOperacao = 'EXCLUIR' then
    begin
      if (QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value <> 'NENHUM')
        and (UpperCase(bib.PegaNomeComputador) <> UpperCase(QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value)) then
      begin
        MessageDlg('Exclusão não permitida.' + chr(13) + char(10)
          + 'Este registro está sendo alterado pelo computador '
          + QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value, mtError, [mbOk], 0);
        result := false;
      end
      else
        result := true;
    end;
    if (pOperacao = 'SALVAR') or (pOperacao = 'CANCELAR') then
    begin
      QControlaAlteracao.Edit;
        QControlaAlteracaoIND_COMPUTADOR_EDITANDO.Value
          := 'NENHUM';
        QControlaAlteracao.Post;
      result := true;
    end;
    QControlaAlteracao.Next;
  end;
end;

procedure TDMOrdemServico.QROrdemServicoRetifozCalcFields(
  DataSet: TDataSet);
begin
  QROrdemServicoRetifozendereco_bairro_cidade_estado.Value := QROrdemServicoRetifozDESC_ENDERECO_FILIAL.Value + ', ' +
                                                              QROrdemServicoRetifozDESC_BAIRRO_FILIAL.Value + ' | ' +
                                                              QROrdemServicoRetifozDESC_CIDADE_FILIAL.Value + ' - ' +
                                                              QROrdemServicoRetifozCOD_ESTADO_FILIAL.Value;

  QROrdemServicoRetifozcodigo_nome_cadastro.Value := QROrdemServicoRetifozCOD_CADASTRO.Text + ' ' +
                                                     QROrdemServicoRetifozNOME.Value;
                                                     
  QROrdemServicoRetifozendereco_bairro.Value := QROrdemServicoRetifozDESC_ENDERECO.Value + ', ' +
                                                QROrdemServicoRetifozDESC_BAIRRO.Value;


end;

procedure TDMOrdemServico.DSPAtualizaEquipamentoGetTableName(
  Sender: TObject; DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TB_FICHA_INSPECAO_VEICULAR';
end;

procedure TDMOrdemServico.QFichaInspecaoAfterPost(DataSet: TDataSet);
var wCodigo : integer;
begin
  wCodigo := QFichaInspecaoCOD_FICHA_INSPECAO_VEICULAR.Value;
  QFichaInspecao.Close;
  QFichaInspecao.Open;
  QFichaInspecao.Locate('COD_FICHA_INSPECAO_VEICULAR', wCodigo, []);
end;

procedure TDMOrdemServico.AbreFichaInspecaoRetifoz;
begin

    QEquipamentoFicha.Close;
    QEquipamentoFicha.Open;

    CDSFichaInspecao.Close;
    CDSFichaInspecao.Open;
    CDSFichaInspecao.EmptyDataSet;

    while not QEquipamentoFicha.Eof do
    begin
      QFichaInspecaoLista.Close;
      QFichaInspecaoLista.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QFichaInspecaoLista.SetVariable('COD_EQUIPAMENTO_FICHA', QEquipamentoFichaCOD_EQUIPAMENTO_FICHA.Value);
      QFichaInspecaoLista.Open;

      CDSFichaInspecao.Append;
      CDSFichaInspecaoCOD_EQUIPAMENTO_FICHA.Value := QEquipamentoFichaCOD_EQUIPAMENTO_FICHA.Value;

      if QFichaInspecaoLista.RecordCount > 0 then
      begin
        while not QFichaInspecaoLista.Eof do
        begin
          if QEquipamentoFichaCOD_EQUIPAMENTO_FICHA.Value = QFichaInspecaoListaCOD_EQUIPAMENTO_FICHA.Value then
            CDSFichaInspecaoQTDE.Value := QFichaInspecaoListaQT_QUANTIDADE.Value
          else
            CDSFichaInspecaoQTDE.Value := 0;
          QFichaInspecaoLista.Next;
        end;
      end
      else
         CDSFichaInspecaoQTDE.Value := 0;

      CDSFichaInspecao.Post;
      QEquipamentoFicha.Next;
    end;
    CDSFichaInspecao.First;
end;

procedure TDMOrdemServico.QREntradaCalcFields(DataSet: TDataSet);
begin
  with DMOrdemServico do
  begin
    if QREntradaCOD_PRODUTO.AsString <> '' then
    begin
      QREntradavl_unitario_acrescimo.Value := (((QREntradaVl_unitario.Value * QREntradaQt_Produto.Value)+ QREntradaVAL_ACRESCIMO.Value)/QREntradaQt_Produto.Value);
      QREntradavl_total_acrescimo.Value := ((QREntradaVl_unitario.Value * QREntradaQt_Produto.Value) - (QREntradaVAL_DESCONTO.Value*QREntradaQt_Produto.Value)
                                             + QREntradaVAL_ACRESCIMO.Value);
    end;
  end;

end;

procedure TDMOrdemServico.PrecoTabela;
begin

  // Verifica se o produto está cadastrado em tabela de preço
  // Se estiver, sobrescreve o valor do produto com o valor que está na tabela
  if QOrdemServicoItCOD_TABELA_PRECO_CAB.Value > 0 then
  begin
    with DMTabelaPreco do
    begin
      QTabelaPrecoProduto.Close;
      QTabelaPrecoProduto.SetVariable('COD_PRODUTO', QOrdemServicoItCOD_PRODUTO.Value);
      QTabelaPrecoProduto.SetVariable('COD_TABELA_PRECO', QOrdemServicoItCOD_TABELA_PRECO_CAB.Value);
      QTabelaPrecoProduto.Open;
      if QTabelaPrecoProduto.RecordCount > 0 then
      begin
        QOrdemServicoItVL_UNITARIO.Value := QTabelaPrecoProdutoVAL_PRECO.Value;
        if QTabelaPrecoProdutoQT_QUANTIDADE.Text <> '' then
          QOrdemServicoItQT_PRODUTO.Value := QTabelaPrecoProdutoQT_QUANTIDADE.Value;
        if QTabelaPrecoProdutoIND_BLOQUEIA_DESCONTO.Value = 'SIM' then
        begin
          QOrdemServicoItVAL_DESCONTO.Value := 0;
          QOrdemServicoItPERC_DESCONTO.Value := 0;
          QOrdemServicoItVAL_DESCONTO.ReadOnly := true;
          QOrdemServicoItPERC_DESCONTO.ReadOnly := true;
        end
        else
        begin
          QOrdemServicoItVAL_DESCONTO.ReadOnly := false;
          QOrdemServicoItPERC_DESCONTO.ReadOnly := false;
        end;
      end
      else
      begin
        QOrdemServicoItVAL_DESCONTO.ReadOnly := false;
        QOrdemServicoItPERC_DESCONTO.ReadOnly := false;
      end;

    end;
  end;
end;

procedure TDMOrdemServico.UtilizaListaPrecoTodosItens;
var wRecNo: integer;
  wEventoAfter: TDataSetNotifyEvent;
  wEventoBefore: TDataSetNotifyEvent;
begin
  if (pUtilizaListaPrecoTodosItens)
    and (pCodListaPreco > 0) then
  begin
    wRecNo := QOrdemServicoIt.RecNo;
    QOrdemServicoIt.First;

    //Deve retirar o evento que chama esta procedure para não criar um laço infinito ao fazer post
    wEventoAfter := QOrdemServicoIt.AfterPost;
    wEventoBefore := QOrdemServicoIt.BeforePost;
    QOrdemServicoIt.AfterPost := nil;
    QOrdemServicoIt.BeforePost := nil;
    try
      while not QOrdemServicoIt.Eof do
      begin
        QOrdemServicoIt.Edit;
        if pCodListaPreco > 0 then
          QOrdemServicoItCOD_TABELA_PRECO_CAB.Value := pCodListaPreco;
        QOrdemServicoItCOD_PRODUTOValidate(nil);
        QOrdemServicoIt.Post;
        QOrdemServicoIt.Next;
      end;
    finally
      // Devolve o evento para a query
      QOrdemServicoIt.AfterPost := wEventoAfter;
      QOrdemServicoIt.BeforePost := wEventoBefore;
      QOrdemServicoIt.RecNo := wRecNo;
    end;

    //pUtilizaListaPrecoTodosItens := false;
  end;
end;

procedure TDMOrdemServico.QContratoFornecedorBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContratoFornecedorCOD_FILIAL.Text);
end;

procedure TDMOrdemServico.QContratoMensalBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContratoMensalCOD_FILIAL.Text);
end;

procedure TDMOrdemServico.QrOrcamentoOsSemDescCalcFields(
  DataSet: TDataSet);
begin
  with DMOrdemServico do
  begin
    QrOrcamentoOsSemDescvl_unitario_acrescimo.Value := (((QrOrcamentoOsSemDescVl_unitario.Value * QrOrcamentoOsSemDescQt_Produto.Value)+
                                                          QrOrcamentoOsSemDescVAL_ACRESCIMO.Value)/QrOrcamentoOsSemDescQt_Produto.Value);
    QrOrcamentoOsSemDescvl_total_acrescimo.Value := ((QrOrcamentoOsSemDescVl_unitario.Value * QrOrcamentoOsSemDescQt_Produto.Value)+QrOrcamentoOsSemDescVAL_ACRESCIMO.Value);
  end;
end;

end.
