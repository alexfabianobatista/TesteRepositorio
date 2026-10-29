unit UOficina_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, UOracle_cl;

  
type
  TDMOficina = class(TDataModule)
    QMecanicoCad: TOracleDataSet1;
    QMecanicoCadCOD_FILIAL: TIntegerField;
    QMecanicoCadCOD_MECANICO: TIntegerField;
    QMecanicoCadNOME: TStringField;
    QMecanicoCadVAL_OBJETIVO: TFloatField;
    QMecanicoCadPERC_COMISSAO: TFloatField;
    QMecanicoCons: TOracleDataSet1;
    QMecanicoConsCOD_FILIAL: TIntegerField;
    QMecanicoConsCOD_MECANICO: TIntegerField;
    QMecanicoConsNOME: TStringField;
    QMecanicoConsVAL_OBJETIVO: TFloatField;
    QMecanicoConsPERC_COMISSAO: TFloatField;
    QMecanicoCaddesc_filial: TStringField;
    QRMecanicoCad: TOracleDataSet1;
    QRMecanicoCadCOD_FILIAL: TIntegerField;
    QRMecanicoCadCOD_MECANICO: TIntegerField;
    QRMecanicoCadNOME: TStringField;
    QRMecanicoCadVAL_OBJETIVO: TFloatField;
    QRMecanicoCadPERC_COMISSAO: TFloatField;
    QVeiculoCad: TOracleDataSet1;
    QVeiculoCadCOD_VEICULO: TIntegerField;
    QVeiculoCadNUM_CHASSI: TStringField;
    QVeiculoCadCOD_CADASTRO: TIntegerField;
    QVeiculoCadCOD_MODELO: TIntegerField;
    QVeiculoCadDESC_CARACTERISTICA: TStringField;
    QVeiculoCadDESC_COR: TStringField;
    QVeiculoCadNUM_MOTOR: TStringField;
    QVeiculoCadNUM_PLACA: TStringField;
    QVeiculoCadNUM_ANO: TIntegerField;
    QVeiculoCadNUM_CERTIFICADO: TStringField;
    QVeiculoCadNUM_EIXO: TIntegerField;
    QVeiculoCadDT_REVISAO: TDateTimeField;
    QVeiculoCadDT_FATURA: TDateTimeField;
    QVeiculoCons: TOracleDataSet1;
    QVeiculoCadnome: TStringField;
    QVeiculoCaddesc_modelo: TStringField;
    QVeiculoModeloCad: TOracleDataSet1;
    QVeiculoModeloCadCOD_MODELO: TIntegerField;
    QVeiculoModeloCadDESC_MODELO: TStringField;
    QVeiculoModeloCons: TOracleDataSet1;
    QVeiculoModeloConsCOD_MODELO: TIntegerField;
    QVeiculoModeloConsDESC_MODELO: TStringField;
    QRVeiculoModelo: TOracleDataSet1;
    QRVeiculoModeloCOD_MODELO: TIntegerField;
    QRVeiculoModeloDESC_MODELO: TStringField;
    QRVeiculo: TOracleDataSet1;
    QRVeiculonome: TStringField;
    QRVeiculoNUM_CHASSI: TStringField;
    QRVeiculoNUM_PLACA: TStringField;
    QRVeiculoDESC_CARACTERISTICA: TStringField;
    QRVeiculoDESC_COR: TStringField;
    QRVeiculoCOD_VEICULO: TIntegerField;
    QRVeiculoCOD_CADASTRO: TIntegerField;
    QOS_TipoCad: TOracleDataSet1;
    QOS_TipoCadCOD_OS_TIPO: TIntegerField;
    QOS_TipoCadDESC_OS_TIPO: TStringField;
    QOS_TipoCons: TOracleDataSet1;
    QOS_TipoConsCOD_OS_TIPO: TIntegerField;
    QOS_TipoConsDESC_OS_TIPO: TStringField;
    QROS_Tipo: TOracleDataSet1;
    QROS_TipoCOD_OS_TIPO: TIntegerField;
    QROS_TipoDESC_OS_TIPO: TStringField;
    QVeiculoConsNUM_CHASSI: TStringField;
    QVeiculoConsNUM_MOTOR: TStringField;
    QVeiculoConsNUM_PLACA: TStringField;
    QVeiculoConsDESC_CARACTERISTICA: TStringField;
    QVeiculoConsDESC_COR: TStringField;
    QVeiculoConsNUM_CERTIFICADO: TStringField;
    QVeiculoConsDT_REVISAO: TDateTimeField;
    QVeiculoConsDT_FATURA: TDateTimeField;
    QVeiculoConsCOD_VEICULO: TIntegerField;
    QVeiculoConsCOD_CADASTRO: TIntegerField;
    QCondicao_PgtoCons: TOracleDataSet1;
    QCondicao_PgtoConsCOD_CP: TIntegerField;
    QCondicao_PgtoConsIND_ENTRADA: TStringField;
    QCondicao_PgtoConsIND_DIAS01: TIntegerField;
    QCondicao_PgtoConsIND_DIAS02: TIntegerField;
    QCondicao_PgtoConsIND_DIAS03: TIntegerField;
    QCondicao_PgtoConsIND_DIAS04: TIntegerField;
    QCondicao_PgtoConsIND_DIAS05: TIntegerField;
    QCondicao_PgtoConsIND_DIAS06: TIntegerField;
    QOSFechamento: TOracleDataSet1;
    QOSFechamentonome_cadastro: TStringField;
    QOSFechamentodesc_filial: TStringField;
    QOSFechamentonome_vendedor: TStringField;
    QOSFechamentonome_mecanico: TStringField;
    QOSFechamentodesc_tipo_os: TStringField;
    QOSFechamentodesc_caracteristica: TStringField;
    QROSCapa: TOracleDataSet1;
    QRequisicaoCad: TOracleDataSet1;
    QRequisicao_item: TOracleDataSet1;
    QRequisicao_itemCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicao_itemNUM_REQUISICAO: TIntegerField;
    QRequisicao_itemCOD_PRODUTO: TFloatField;
    QRequisicao_itemQT_QUANTIDADE: TFloatField;
    QRequisicao_itemVAL_UNITARIO: TFloatField;
    QRequisicaoCadnome_vendedor: TStringField;
    QRequisicaoCaddesc_filial: TStringField;
    QRequisicao_itemTotal_produto: TFloatField;
    QROSPeriodo: TOracleDataSet1;
    QROSPeriodoNUM_OS: TIntegerField;
    QROSPeriodoCOD_FILIAL: TIntegerField;
    QROSPeriodoCOD_VENDEDOR: TIntegerField;
    QROSPeriodoCOD_MECANICO: TIntegerField;
    QROSPeriodoCOD_CADASTRO: TIntegerField;
    QROSPeriodoNUM_CHASSI: TStringField;
    QROSPeriodoIND_SITUACAO: TStringField;
    QROSPeriodoIND_TIPO_OS: TIntegerField;
    QROSPeriodoDT_EMISSAO: TDateTimeField;
    QROSPeriodoDT_ENTRADA: TDateTimeField;
    QROSPeriodoDT_PREVISAOSAIDA: TDateTimeField;
    QROSPeriodoDT_SAIDA: TDateTimeField;
    QROSPeriodoCOD_MOTIVO_CANC: TIntegerField;
    QROSPeriodoHR_ENTRADA: TStringField;
    QROSPeriodoHR_PREVISTASAIDA: TStringField;
    QROSPeriodoHR_SAIDA: TStringField;
    QROSPeriodoVAL_LIMITE_REQUISICAO: TFloatField;
    QROSPeriodoNOME: TStringField;
    QROSPeriodoDESC_OS_TIPO: TStringField;
    QROSPeriodoNOME_MECANICO: TStringField;
    QROSPeriodoNOME_VENDEDOR: TStringField;
    QROSPeriodoNUM_PLACA: TStringField;
    QROSPreFechamento: TOracleDataSet1;
    QRequisicaoCadNUM_REQUISICAO: TIntegerField;
    QRequisicaoCadDT_EMISSAO: TDateTimeField;
    QRequisicaoCadNUM_OS: TIntegerField;
    QRequisicaoCadCOD_VENDEDOR: TIntegerField;
    QRequisicaoCadNUM_PEDIDO: TIntegerField;
    QRequisicaoCadIND_SITUACAO: TStringField;
    QRequisicaoCadVAL_TOTAL: TFloatField;
    QRequisicaoCadCOD_FILIAL: TIntegerField;
    QRequisicaoCadIND_TIPO_MOVIMENTO: TStringField;
    QOSVoltaFechamento: TOracleDataSet1;
    QOSMarcacao: TOracleDataSet1;
    QOSMarcacaoCOD_MARCACAO: TIntegerField;
    QOSMarcacaoCOD_MECANICO: TIntegerField;
    QOSMarcacaoNUM_OS: TIntegerField;
    QOSMarcacaoDT_LANCAMENTO: TDateTimeField;
    QOSMarcacaoIND_SITUACAO: TStringField;
    QOSMarcacaonome_mecanico: TStringField;
    QOSMarcacaoCons: TOracleDataSet1;
    QROSCapaNUM_OS: TIntegerField;
    QROSCapaCOD_FILIAL: TIntegerField;
    QROSCapaCOD_VENDEDOR: TIntegerField;
    QROSCapaCOD_CADASTRO: TIntegerField;
    QROSCapaNUM_CHASSI: TStringField;
    QROSCapaIND_SITUACAO: TStringField;
    QROSCapaIND_CONDICAO_PAGTO: TIntegerField;
    QROSCapaIND_TIPO_OS: TIntegerField;
    QROSCapaDT_EMISSAO: TDateTimeField;
    QROSCapaDT_ENTRADA: TDateTimeField;
    QROSCapaDT_PREVISAOSAIDA: TDateTimeField;
    QROSCapaDT_SAIDA: TDateTimeField;
    QROSCapaCOD_MOTIVO_CANC: TIntegerField;
    QROSCapaVAL_LIMITE_REQUISICAO: TFloatField;
    QROSCapaHR_ENTRADA: TStringField;
    QROSCapaHR_PREVISTASAIDA: TStringField;
    QROSCapaHR_SAIDA: TStringField;
    QROSCapaNUM_KM: TIntegerField;
    QROSCapaDESC_FILIAL: TStringField;
    QROSCapaNOME: TStringField;
    QROSCapaDESC_OS_TIPO: TStringField;
    QROSCapaDESC_COR: TStringField;
    QROSCapaNUM_PLACA: TStringField;
    QROSCapaDESC_MODELO: TStringField;
    QROSCapaDESC_TELEFONE: TStringField;
    QROSCapaCOD_MECANICO: TIntegerField;
    QROSCapaDT_FATURA: TDateTimeField;
    QROSCapaDT_REVISAO: TDateTimeField;
    QROSCapaNUM_MOTOR: TStringField;
    QRServico_Terceiro: TOracleDataSet1;
    QROSPreFechamentoMO: TOracleDataSet1;
    QROSPreFechamentoMOCOD_MECANICO: TIntegerField;
    QROSPreFechamentoMODT_LANCAMENTO: TDateTimeField;
    QROSPreFechamentoMONOME: TStringField;
    QOS_Requisicao_Item: TOracleDataSet1;
    QROSPreFechamentoNUM_OS: TIntegerField;
    QROSPreFechamentoDT_EMISSAO_OS: TDateTimeField;
    QROSPreFechamentoIND_TIPO_OS: TIntegerField;
    QROSPreFechamentoDESC_OS_TIPO: TStringField;
    QROSPreFechamentoCOD_CADASTRO: TIntegerField;
    QROSPreFechamentoNUM_KM: TIntegerField;
    QROSPreFechamentoNOME: TStringField;
    QROSPreFechamentoDESC_TELEFONE: TStringField;
    QROSPreFechamentoCOD_PRODUTO: TFloatField;
    QROSPreFechamentoQT_QUANTIDADE: TFloatField;
    QROSPreFechamentoVAL_UNITARIO: TFloatField;
    QROSPreFechamentoTOTAL_ITENS: TFloatField;
    QROSPreFechamentoCOD_MECANICO: TIntegerField;
    QROSPreFechamentoCOD_VENDEDOR: TIntegerField;
    QROSPreFechamentoNUM_REQUISICAO: TIntegerField;
    QROSPreFechamentoDT_EMISSAO_REQUISICAO: TDateTimeField;
    QROSPreFechamentoPERC_TRIBUTADO: TFloatField;
    QROSPreFechamentoPERC_ALIQUOTA: TFloatField;
    QROSPreFechamentototal_isento: TFloatField;
    QRequisicao_itemPERC_DESCONTO: TFloatField;
    QROSPreFechamentoMOHR_FINAL: TFloatField;
    QROSPreFechamentoMOhoras_trabalhadas: TStringField;
    QROSPreFechamentoMOHR_INICIO: TFloatField;
    QOSMarcacaoHR_INICIO: TFloatField;
    QOSMarcacaoHR_FINAL: TFloatField;
    QROSPreFechamentoMOvalor_horas_trabalhadas: TStringField;
    QOSMarcacaoLimiteHoras: TOracleDataSet1;
    QOSMarcacaoLimiteHorasSUMTB_MARCACAOHR_INICIO: TFloatField;
    QOSMarcacaoLimiteHorasSUMTB_MARCACAOHR_FINAL: TFloatField;
    QOS_Requisicao_ItemNUM_OS: TIntegerField;
    QOS_Requisicao_ItemDT_EMISSAO: TDateTimeField;
    QOS_Requisicao_ItemNUM_REQUISICAO: TIntegerField;
    QOS_Requisicao_ItemCOD_PRODUTO: TFloatField;
    QOS_Requisicao_ItemQT_QUANTIDADE: TFloatField;
    QOS_Requisicao_ItemVAL_UNITARIO: TFloatField;
    QOS_Requisicao_ItemCOD_TRIBUTACAO: TIntegerField;
    QOS_Requisicao_ItemPERC_IPI: TFloatField;
    QOS_Requisicao_ItemPERC_COMISSAO: TFloatField;
    QOS_Requisicao_ItemCOD_LOTE_TIPO: TIntegerField;
    QOS_Requisicao_ItemVL_CUSTO_MEDIO: TFloatField;
    QOS_Requisicao_ItemPERC_INSS: TFloatField;
    QOS_Requisicao_ItemNUM_CLASSIFICACAO: TStringField;
    QRServico_TerceiroCOD_SERVICO_TERCEIRO: TIntegerField;
    QRServico_TerceiroNUM_OS: TIntegerField;
    QRServico_TerceiroCOD_SERVICO: TIntegerField;
    QRServico_TerceiroCOD_VENDEDOR: TIntegerField;
    QRServico_TerceiroVAL_SERVICO: TFloatField;
    QRServico_TerceiroCOD_CADASTRO: TIntegerField;
    QRServico_TerceiroDT_SERVICO: TDateTimeField;
    QRServico_TerceiroNOME_CADASTRO: TStringField;
    QRServico_TerceiroNOME_VENDEDOR: TStringField;
    QOSMarcacaoConsCOD_MARCACAO: TIntegerField;
    QOSMarcacaoConsCOD_MECANICO: TIntegerField;
    QOSMarcacaoConsNUM_OS: TIntegerField;
    QOSMarcacaoConsDT_LANCAMENTO: TDateTimeField;
    QOSMarcacaoConsHR_INICIO: TFloatField;
    QOSMarcacaoConsHR_FINAL: TFloatField;
    QOSMarcacaoConsIND_SITUACAO: TStringField;
    QRequisicaoCadnome_cadastro: TStringField;
    QNFTotalMaoObra: TOracleDataSet1;
    QNFTotalServicoTerceiro: TOracleDataSet1;
    QNFTotalPecasAplicadas: TOracleDataSet1;
    QNFTotalPecasAplicadasTOTAL_PECAS_APLICADAS: TFloatField;
    QNFTotalItensIsentos: TOracleDataSet1;
    QNFTotalItensIsentosTOTAL_ITENS_ISENTOS: TFloatField;
    QOS_TipoCadVAL_HORA_MECANICO: TFloatField;
    QOS_TipoConsVAL_HORA_MECANICO: TFloatField;
    QROS_TipoVAL_HORA_MECANICO: TFloatField;
    QNFTotalServicoTerceiroTOTAL_SERVICO_TERCEIRO: TFloatField;
    QOSContaReceber: TOracleDataSet1;
    QOSContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    QOSContaReceberCOD_FINALIDADE: TIntegerField;
    QOSContaReceberCOD_BANCO_AGENCIA: TIntegerField;
    QOSContaReceberCOD_FILIAL: TIntegerField;
    QOSContaReceberNUM_PARCELA: TIntegerField;
    QOSContaReceberDESC_TIPO_DOCUMENTO: TStringField;
    QOSContaReceberDT_MOVIMENTO: TDateTimeField;
    QOSContaReceberDT_BAIXA: TDateTimeField;
    QOSContaReceberDT_VENCIMENTO: TDateTimeField;
    QOSContaReceberDT_EMISSAO: TDateTimeField;
    QOSContaReceberDT_CAPITALIZACAO: TDateTimeField;
    QOSContaReceberVAL_TITULO: TFloatField;
    QOSContaReceberVAL_NEGOCIO: TFloatField;
    QOSContaReceberIND_ACEITE: TStringField;
    QOSContaReceberIND_SITUACAO: TStringField;
    QOSContaReceberDESC_OBSERVACAO: TStringField;
    QOSContaReceberCOD_NOTA_CAB: TIntegerField;
    QOSContaReceberCOD_CADASTRO: TIntegerField;
    QOSContaReceberVAL_ORIGINAL: TFloatField;
    QOSContaReceberCOD_NOSSO_NUMERO: TStringField;
    QOSContaReceberVAL_JUROS: TFloatField;
    QOSContaReceberCOD_DEPARTAMENTO: TIntegerField;
    QOSContaReceberCOD_CONTRATO_VEND: TIntegerField;
    QOSContaReceberDESC_AVALISTA1: TStringField;
    QOSContaReceberDESC_AVALISTA2: TStringField;
    QOSContaReceberCOD_VENDEDOR: TIntegerField;
    QOSContaReceberPERC_COMISSAO: TFloatField;
    QOSContaReceberDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QOSContaReceberVAL_PROMISSORIA: TFloatField;
    QOSContaReceberMov: TOracleDataSet1;
    QOSContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QOSContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QOSContaReceberMovDT_MOVIMENTO: TDateTimeField;
    QOSContaReceberMovVAL_MOVIMENTO: TFloatField;
    QOSContaReceberMovDESC_OBSERVACAO: TStringField;
    QOSContaReceberMovCOD_USUARIO: TIntegerField;
    QOSContaReceberMovDT_USUARIO: TDateTimeField;
    QOSContaReceberMovIND_TIPO_MOVIMENTO: TStringField;
    QOSContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QOSContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QOSContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QOSContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QOSContaReceberCons: TOracleDataSet1;
    QROSPreFechamentoCOD_FILIAL: TIntegerField;
    QROSPreFechamentoMOVAL_HORA_MECANICO: TFloatField;
    QROSCapaDT_LIMITEHORAS: TStringField;
    QOSMarcacaoLimiteHorasDT_LIMITEHORAS: TStringField;
    QROSPreFechamentoMODT_LIMITEHORAS: TStringField;
    QOSCtaReceberExcluiMov: TOracleDataSet1;
    QOSCtaReceberExcluiCab: TOracleDataSet1;
    QOSFechamentoNUM_OS: TIntegerField;
    QOSFechamentoCOD_FILIAL: TIntegerField;
    QOSFechamentoCOD_VENDEDOR: TIntegerField;
    QOSFechamentoCOD_MECANICO: TIntegerField;
    QOSFechamentoCOD_CADASTRO: TIntegerField;
    QOSFechamentoNUM_CHASSI: TStringField;
    QOSFechamentoIND_SITUACAO: TStringField;
    QOSFechamentoIND_CONDICAO_PAGTO: TIntegerField;
    QOSFechamentoIND_TIPO_OS: TIntegerField;
    QOSFechamentoDT_EMISSAO: TDateTimeField;
    QOSFechamentoDT_ENTRADA: TDateTimeField;
    QOSFechamentoDT_PREVISAOSAIDA: TDateTimeField;
    QOSFechamentoDT_SAIDA: TDateTimeField;
    QOSFechamentoDT_LIMITEHORAS: TStringField;
    QOSFechamentoCOD_MOTIVO_CANC: TIntegerField;
    QOSFechamentoVAL_LIMITE_REQUISICAO: TFloatField;
    QOSFechamentoHR_ENTRADA: TStringField;
    QOSFechamentoHR_PREVISTASAIDA: TStringField;
    QOSFechamentoHR_SAIDA: TStringField;
    QOSFechamentoNUM_KM: TIntegerField;
    QOSFechamentoNUM_TITULO: TIntegerField;
    QOSVoltaFechamentoNUM_OS: TIntegerField;
    QOSVoltaFechamentoDT_SAIDA: TDateTimeField;
    QOSVoltaFechamentoHR_SAIDA: TStringField;
    QOSVoltaFechamentoIND_SITUACAO: TStringField;
    QOSVoltaFechamentoNUM_TITULO: TIntegerField;
    QOSVoltaFechamentoCOD_CADASTRO: TIntegerField;
    QOSVoltaFechamentoCOD_FILIAL: TIntegerField;
    QOSContaReceberConsCOD_CONTA_RECEBER_CAB: TIntegerField;
    QOSContaReceberConsCOD_FINALIDADE: TIntegerField;
    QOSContaReceberConsCOD_BANCO_AGENCIA: TIntegerField;
    QOSContaReceberConsCOD_FILIAL: TIntegerField;
    QOSContaReceberConsNUM_PARCELA: TIntegerField;
    QOSContaReceberConsDESC_TIPO_DOCUMENTO: TStringField;
    QOSContaReceberConsDT_MOVIMENTO: TDateTimeField;
    QOSContaReceberConsDT_BAIXA: TDateTimeField;
    QOSContaReceberConsDT_VENCIMENTO: TDateTimeField;
    QOSContaReceberConsDT_EMISSAO: TDateTimeField;
    QOSContaReceberConsDT_CAPITALIZACAO: TDateTimeField;
    QOSContaReceberConsVAL_TITULO: TFloatField;
    QOSContaReceberConsVAL_NEGOCIO: TFloatField;
    QOSContaReceberConsIND_ACEITE: TStringField;
    QOSContaReceberConsIND_SITUACAO: TStringField;
    QOSContaReceberConsDESC_OBSERVACAO: TStringField;
    QOSContaReceberConsCOD_NOTA_CAB: TIntegerField;
    QOSContaReceberConsCOD_CADASTRO: TIntegerField;
    QOSContaReceberConsVAL_ORIGINAL: TFloatField;
    QOSContaReceberConsCOD_NOSSO_NUMERO: TStringField;
    QOSContaReceberConsVAL_JUROS: TFloatField;
    QOSContaReceberConsCOD_DEPARTAMENTO: TIntegerField;
    QOSContaReceberConsCOD_CONTRATO_VEND: TIntegerField;
    QOSContaReceberConsDESC_AVALISTA1: TStringField;
    QOSContaReceberConsDESC_AVALISTA2: TStringField;
    QOSContaReceberConsCOD_VENDEDOR: TIntegerField;
    QOSContaReceberConsPERC_COMISSAO: TFloatField;
    QOSContaReceberConsDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QOSContaReceberConsVAL_PROMISSORIA: TFloatField;
    QRequisicaoItensCons: TOracleDataSet1;
    QRequisicao_itemNUM_FABRICANTE: TStringField;
    QROSPeriodoNUM_KM: TIntegerField;
    QROSPeriodoNUM_TITULO: TIntegerField;
    QROSPeriodoDT_LIMITEHORAS: TStringField;
    QRequisicao_itemdesc_produto: TStringField;
    QRequisicao_itemDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicao_itemCOD_FILIAL: TIntegerField;
    QOSEstoqueAtual: TOracleDataSet1;
    QOSEstoqueAtualQT_QUANTIDADE: TFloatField;
    QOSEstoqueAtualVL_CUSTO_MEDIO: TFloatField;
    QOSEstoqueAtualVL_ULTIMO_CUSTO: TFloatField;
    QOSEstoqueAtualDT_COMPRA: TDateTimeField;
    QOSEstoqueAtualQT_COMPRA: TFloatField;
    QOSEstoqueAtualVAL_VAREJO: TFloatField;
    QRequisicaoItensConsNUM_OS: TIntegerField;
    QRequisicaoItensConsNUM_FABRICANTE: TStringField;
    QRequisicaoItensConsCOD_MECANICO: TIntegerField;
    QRequisicaoItensConsQT_QUANTIDADE: TFloatField;
    QRequisicaoItensConsVAL_UNITARIO: TFloatField;
    QRequisicaoItensConsDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicaoItensConsCOD_FILIAL: TIntegerField;
    QRequisicaoItensConsNUM_REQUISICAO: TIntegerField;
    QOrcamento_Oficina: TOracleDataSet1;
    QOrcamento_OficinaNUM_ORCAMENTO: TIntegerField;
    QOrcamento_OficinaDT_EMISSAO: TDateTimeField;
    QOrcamento_OficinaCOD_VENDEDOR: TIntegerField;
    QOrcamento_OficinaCOD_CADASTRO: TIntegerField;
    QOrcamento_OficinaNUM_OS: TIntegerField;
    QOrcamento_Oficina_Item: TOracleDataSet1;
    QOrcamento_Oficina_ItemNUM_OS: TIntegerField;
    QOrcamento_Oficina_ItemNUM_ORCAMENTO: TIntegerField;
    QOrcamento_Oficina_ItemNUM_FABRICANTE: TStringField;
    QOrcamento_Oficina_ItemQT_QUANTIDADE: TIntegerField;
    QOrcamento_Oficina_ItemVAL_UNITARIO: TFloatField;
    QOrcamento_Oficina_ItemNUM_ORCAMENTO_ITEM: TIntegerField;
    QOrcamento_Oficinanome: TStringField;
    QOrcamento_Oficinanome_vendedor: TStringField;
    QOrcamento_OficinaCons: TOracleDataSet1;
    QOrcamento_OficinaConsNUM_ORCAMENTO: TIntegerField;
    QOrcamento_OficinaConsDT_EMISSAO: TDateTimeField;
    QOrcamento_OficinaConsCOD_VENDEDOR: TIntegerField;
    QOrcamento_OficinaConsCOD_CADASTRO: TIntegerField;
    QOrcamento_OficinaConsNUM_OS: TIntegerField;
    QOSFechamentoVAL_NF_MAO_DE_OBRA: TFloatField;
    QOSFechamentoVAL_NF_SERVICO_TERCEIRO: TFloatField;
    QOSFechamentoVAL_NF_PECAS: TFloatField;
    QOSFechamentoVAL_NF_PECAS_ISENTAS: TFloatField;
    QAtzEstoque_CustoViaOficina: TOracleDataSet1;
    QAtzEstoque_CustoViaOficinaCOD_LOTE_TIPO: TIntegerField;
    QAtzEstoque_CustoViaOficinaCOD_FILIAL: TIntegerField;
    QAtzEstoque_CustoViaOficinaCOD_PRODUTO: TFloatField;
    QAtzEstoque_CustoViaOficinaVL_CUSTO_MEDIO: TFloatField;
    QAtzEstoque_CustoViaOficinaVL_ULTIMO_CUSTO: TFloatField;
    QAtzEstoque_CustoViaOficinaVL_CUSTO_DOLAR: TFloatField;
    QAtzEstoque_CustoViaOficinaQT_QUANTIDADE: TFloatField;
    QAtzEstoque_CustoViaOficinaDT_COMPRA: TDateTimeField;
    QAtzEstoque_CustoViaOficinaDT_VENDA: TDateTimeField;
    QAtzEstoque_CustoViaOficinaQT_COMPRA: TFloatField;
    QAtzEstoque_CustoViaOficinaQT_MINIMO: TFloatField;
    QAtzEstoque_CustoViaOficinaQT_MAXIMO: TFloatField;
    QAtzEstoque_CustoViaOficinaQT_INVENTARIO: TFloatField;
    QAtzEstoque_CustoViaOficinaDT_INVENTARIO: TDateTimeField;
    QAtualizaPrecoVarejo: TOracleDataSet1;
    QAtualizaPrecoVarejoVAL_VAREJO: TFloatField;
    QAtualizaPrecoVarejoDT_ALTERACAO_PRECO: TDateTimeField;
    QRequisicaoCons: TOracleDataSet1;
    QRequisicaoConsNUM_REQUISICAO: TIntegerField;
    QRequisicaoConsDT_EMISSAO: TDateTimeField;
    QRequisicaoConsNUM_OS: TIntegerField;
    QRequisicaoConsCOD_MECANICO: TIntegerField;
    QRequisicaoConsCOD_VENDEDOR: TIntegerField;
    QRequisicaoConsNUM_PEDIDO: TIntegerField;
    QRequisicaoConsIND_SITUACAO: TStringField;
    QRequisicaoConsVAL_TOTAL: TFloatField;
    QRequisicaoConsCOD_FILIAL: TIntegerField;
    QRequisicaoConsIND_TIPO_MOVIMENTO: TStringField;
    QOSFechamentoDT_FECHAMENTO: TDateTimeField;
    QRServico_TerceiroNUM_NOTA: TIntegerField;
    QRequisicao_itemCOD_VENDEDOR: TIntegerField;
    QOSCaixaExcluirMov: TOracleDataSet1;
    QOSCaixaExcluirMovCOD_CAIXA_MOV: TIntegerField;
    QOSCaixaExcluirMovDT_MOVIMENTO: TDateTimeField;
    QOSCaixaExcluirMovVAL_MOVIMENTO: TFloatField;
    QLocalizaContaReceberCab: TOracleDataSet1;
    QLocalizaContaReceberCabCOD_CONTA_RECEBER_CAB: TIntegerField;
    QMecanicoCadIND_TIPO_MECANICO: TStringField;
    QNFTotalMOChapeacao: TOracleDataSet1;
    QOSFechamentoVAL_NF_SERVICO_CHAPEACAO: TFloatField;
    QROSPreFechamentoind_orcamento: TStringField;
    QNFTotalMOChapeacaoVAL_MO_MECANICO: TFloatField;
    QNFTotalMaoObraVAL_MO_MECANICO: TFloatField;
    QRProdutividadePendente: TOracleDataSet1;
    QRProdutividadePendenteCOD_MECANICO: TIntegerField;
    QRProdutividadePendenteNUM_OS: TIntegerField;
    QRProdutividadePendenteDT_EMISSAO: TDateTimeField;
    QRProdutividadePendenteNOME: TStringField;
    QRProdutividadePendenteTOTAL_HORAS: TFloatField;
    QRProdutividadePendenteVAL_MAO_OBRA: TFloatField;
    QRProdutividadeEncerrada: TOracleDataSet1;
    QRProdutividadeEncerradaCOD_MECANICO: TIntegerField;
    QRProdutividadeEncerradaNUM_OS: TIntegerField;
    QRProdutividadeEncerradaNOME: TStringField;
    QRProdutividadeEncerradaTOTAL_HORAS: TFloatField;
    QRProdutividadeEncerradaVAL_MAO_OBRA: TFloatField;
    QRProdutividadeChapeacao: TOracleDataSet1;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    QRProdutividadeChapeacaoDT_SAIDA: TDateTimeField;
    QRProdutividadeEncerradaDT_SAIDA: TDateTimeField;
    QRequisicao_itemIND_DESCONTO: TStringField;
    QROSPreFechamentoIND_DESCONTO: TStringField;
    QROSPeriodoDESC_SERVICO: TStringField;
    QROSCapaDESC_SERVICO: TStringField;
    QOSFechamentoDESC_SERVICO: TStringField;
    QOSFechamentoVAL_NF_MAO_DE_OBRA2: TFloatField;
    QOSFechamentoVAL_NF_SERVICO_TERCEIRO2: TFloatField;
    QOSFechamentoVAL_NF_PECAS2: TFloatField;
    QOSFechamentoVAL_NF_PECAS_ISENTAS2: TFloatField;
    QOSFechamentoVAL_NF_SERVICO_CHAPEACAO2: TFloatField;
    QOrcamento_OficinaDESC_OBS1: TStringField;
    QOrcamento_OficinaDESC_OBS2: TStringField;
    QOrcamento_OficinaDESC_OBS_PAGTO: TStringField;
    QOSFechamentoVAL_NF_SERVICO_ELETRICO: TFloatField;
    QOSFechamentoVAL_NF_SERVICO_ELETRICO2: TFloatField;
    QNFTotalMOEletricista: TOracleDataSet1;
    QNFTotalMOEletricistaVAL_MO_ELETRICISTA: TFloatField;
    QOrcamento_Oficina_ItemDESC_PRODUTO: TStringField;
    QROSPreFechamentoDESC_PRODUTO: TStringField;
    QRServico_TerceiroDESC_SERVICO: TStringField;
    QRServico_TerceiroDESC_PRODUTO: TStringField;
    QRequisicaoItensConsDESC_PRODUTO: TStringField;
    QOSContaReceberNUM_OS: TIntegerField;
    QControleEstoque: TOracleDataSet1;
    QControleEstoqueCOD_CONTROLE_ESTOQUE: TIntegerField;
    QControleEstoqueCOD_FILIAL: TIntegerField;
    QControleEstoqueCOD_PRODUTO: TIntegerField;
    QControleEstoqueQT_QUANTIDADE: TFloatField;
    QControleEstoqueDT_ALTERACAO: TDateTimeField;
    QControleEstoqueCOD_USUARIO: TIntegerField;
    QControleEstoqueVAL_CUSTO: TFloatField;
    QRMovimentacaoProduto: TOracleDataSet1;
    QRMovimentacaoProdutoNUM_FABRICANTE: TStringField;
    QRMovimentacaoProdutoDESC_PRODUTO: TStringField;
    QRMovimentacaoProdutoQT_MOV: TFloatField;
    QRMovimentacaoProdutoDESC_TIPO: TStringField;
    QRMovimentacaoProdutoCOD_PRODUTO: TFloatField;
    QOficinaCad: TOracleDataSet1;
    QOficinaCadCOD_OFICINA_CAB: TIntegerField;
    QOficinaCadCOD_FILIAL: TIntegerField;
    QOficinaCadCOD_VENDEDOR: TIntegerField;
    QOficinaCadCOD_CADASTRO: TIntegerField;
    QOficinaCadDESC_SERVICO: TStringField;
    QOficinaCadIND_SITUACAO: TStringField;
    QOficinaCadIND_CONDICAO_PAGTO: TIntegerField;
    QOficinaCadDT_ENTRADA: TDateTimeField;
    QOficinaCadDT_SAIDA: TDateTimeField;
    QOficinaCadIND_PARCIAL_TOTAL: TStringField;
    QOficinaCaddesc_situacao: TStringField;
    QOficinaItem: TOracleDataSet1;
    QOficinaItemCOD_OFICINA_ITEM: TIntegerField;
    QOficinaItemCOD_OFICINA_CAB: TIntegerField;
    QOficinaItemCOD_PRODUTO: TIntegerField;
    QOficinaItemQT_QUANTIDADE: TFloatField;
    QOficinaItemVAL_UNITARIO: TFloatField;
    QOficinaItemVAL_TOTAL: TFloatField;
    QOficinaItemdesc_produto: TStringField;
    QOficinaCons: TOracleDataSet1;
    QOficinaConsCOD_OFICINA_CAB: TIntegerField;
    QOficinaConsDT_ENTRADA: TDateTimeField;
    QOficinaConsDT_SAIDA: TDateTimeField;
    QOficinaConsCONDICAO_PAGTO: TStringField;
    QOficinaConsIND_PARCIAL_TOTAL: TStringField;
    QOficinaConsDESC_SERVICO: TStringField;
    QOficinaConsNOME_CLIENTE: TStringField;
    QOficinaConsDESC_FILIAL: TStringField;
    QOficinaItemCons: TOracleDataSet1;
    QOficinaItemConsCOD_OFICINA_CAB: TIntegerField;
    QOficinaItemConsQT_QUANTIDADE: TFloatField;
    QOficinaItemConsVAL_TOTAL: TFloatField;
    QOficinaItemConsVAL_UNITARIO: TFloatField;
    QOficinaItemConsDESC_PRODUTO: TStringField;
    QOficinaCadDT_FECHAMENTO: TDateTimeField;
    QOficinaCadCOD_OPERACAO: TIntegerField;
    QOficinaItemDESC_COMPLEMENTO: TStringField;
    QSomaItemOficina: TOracleDataSet1;
    QOficinaCadCOD_NOTA_CAB: TIntegerField;
    QContaReceber: TOracleDataSet1;
    QContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberCOD_FINALIDADE: TIntegerField;
    QContaReceberCOD_BANCO_AGENCIA: TIntegerField;
    QContaReceberCOD_FILIAL: TIntegerField;
    QContaReceberNUM_TITULO: TIntegerField;
    QContaReceberNUM_PARCELA: TIntegerField;
    QContaReceberDESC_TIPO_DOCUMENTO: TStringField;
    QContaReceberDT_MOVIMENTO: TDateTimeField;
    QContaReceberDT_BAIXA: TDateTimeField;
    QContaReceberDT_VENCIMENTO: TDateTimeField;
    QContaReceberDT_EMISSAO: TDateTimeField;
    QContaReceberDT_CAPITALIZACAO: TDateTimeField;
    QContaReceberVAL_TITULO: TFloatField;
    QContaReceberVAL_NEGOCIO: TFloatField;
    QContaReceberIND_ACEITE: TStringField;
    QContaReceberIND_SITUACAO: TStringField;
    QContaReceberDESC_OBSERVACAO: TStringField;
    QContaReceberCOD_NOTA_CAB: TIntegerField;
    QContaReceberCOD_CADASTRO: TIntegerField;
    QContaReceberVAL_ORIGINAL: TFloatField;
    QContaReceberCOD_NOSSO_NUMERO: TStringField;
    QContaReceberVAL_JUROS: TFloatField;
    QContaReceberCOD_DEPARTAMENTO: TIntegerField;
    QContaReceberCOD_CONTRATO_VEND: TIntegerField;
    QContaReceberDESC_AVALISTA1: TStringField;
    QContaReceberDESC_AVALISTA2: TStringField;
    QContaReceberCOD_VENDEDOR: TIntegerField;
    QContaReceberPERC_COMISSAO: TFloatField;
    QContaReceberDT_CAPITALIZACAO_MOEDA: TDateTimeField;
    QContaReceberVAL_PROMISSORIA: TFloatField;
    QContaReceberIND_ENVIADO_BANCO: TStringField;
    QContaReceberCOD_CONTA_CORRENTE: TIntegerField;
    QContaReceberCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QContaReceberCOD_OBRA_CONTRATO: TIntegerField;
    QContaReceberIND_EMITIDO_CARNE: TStringField;
    QContaReceberCOD_OBRA_CONTRATO_MOV: TIntegerField;
    QContaReceberNUM_OS: TIntegerField;
    QContaReceberCOD_ORDEM_SERVICO_CAB: TIntegerField;
    QContaReceberDESC_OBS: TStringField;
    QContaReceberCOD_VENDEDOR1: TIntegerField;
    QContaReceberPERC_COMISSAO1: TFloatField;
    QContaReceberCOD_OFICINA_CAB: TIntegerField;
    QContaReceberMov: TOracleDataSet1;
    QContaReceberMovCOD_CONTA_RECEBER_MOV: TIntegerField;
    QContaReceberMovCOD_CONTA_RECEBER_CAB: TIntegerField;
    QContaReceberMovDT_MOVIMENTO: TDateTimeField;
    QContaReceberMovVAL_MOVIMENTO: TFloatField;
    QContaReceberMovDESC_OBSERVACAO: TStringField;
    QContaReceberMovCOD_USUARIO: TIntegerField;
    QContaReceberMovDT_USUARIO: TDateTimeField;
    QContaReceberMovIND_TIPO_MOVIMENTO: TStringField;
    QContaReceberMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContaReceberMovCOD_CAIXA_MOV: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContaReceberMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QCaixa: TOracleDataSet1;
    QCaixaCOD_CAIXA_MOV: TIntegerField;
    QCaixaCOD_USUARIO: TIntegerField;
    QCaixaCOD_FILIAL: TIntegerField;
    QCaixaCOD_DEPARTAMENTO: TIntegerField;
    QCaixaCOD_HISTORICO: TIntegerField;
    QCaixaDT_MOVIMENTO: TDateTimeField;
    QCaixaVAL_MOVIMENTO: TFloatField;
    QCaixaDESC_HORARIO: TStringField;
    QCaixaNUM_DOCUMENTO: TIntegerField;
    QCaixaCOD_CADASTRO: TIntegerField;
    QCaixaCOD_NOTA_CAB: TIntegerField;
    QCaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixaDT_USUARIO: TDateTimeField;
    QCaixaDESC_COMPLEMENTO: TStringField;
    QCaixaCOD_PEDIDO_CAB: TIntegerField;
    QCaixaCOD_OFICINA_CAB: TIntegerField;
    QOficinaConsIND_SITUACAO: TStringField;
    QOficinaCadNUM_OFICINA_CAB: TIntegerField;
    QOficinaItemPERC_DESCONTO_CLIENTE: TFloatField;
    QOficinaItemPERC_DESCONTO_VENDA: TFloatField;
    QOficinaItemPERC_DESCONTO_MECANICO: TFloatField;
    QOficinaItemval_desconto: TFloatField;
    QOficinaItemval_item: TFloatField;
    QOficinaConsdesc_situacao: TStringField;
    QOficinaItemval_desc_cliente: TFloatField;
    QOficinaItemval_desc_venda: TFloatField;
    QOficinaItemval_desc_mecanico: TFloatField;
    QSomaItemOficinaCOD_OFICINA_CAB: TIntegerField;
    QSomaItemOficinaSVAL_TOTAL: TFloatField;
    QSomaItemOficinaSVAL_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_PRODUTO: TFloatField;
    QSomaItemOficinaSVAL_MEC_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_MEC_PRODUTO: TFloatField;
    QSomaItemOficinaSVAL_DESC_VENDA: TFloatField;
    QSomaItemOficinaSVAL_DESC_CLIENTE: TFloatField;
    QSomaItemOficinaSVAL_DESC_MECANICO: TFloatField;
    QSomaItemOficinaSVAL_S_DESCONTO: TFloatField;
    QSomaItemOficinaSVAL_DESCONTOS: TFloatField;
    QSomaItemOficinaSVAL_ITENS: TFloatField;
    QSomaItemOficinaSVAL_SERVICO_BRUTO: TFloatField;
    QSomaItemOficinaSVAL_PRODUTO_BRUTO: TFloatField;
    QOficinaOrcamentoCad: TOracleDataSet1;
    QOficinaOrcamentoCadCOD_OFICINA_ORCAMENTO_CAB: TIntegerField;
    QOficinaOrcamentoCadCOD_CADASTRO: TIntegerField;
    QOficinaOrcamentoCadCOD_MARCA: TIntegerField;
    QOficinaOrcamentoCadDESC_SERVICO: TStringField;
    QOficinaOrcamentoCadDT_ORCAMENTO: TDateTimeField;
    QOficinaOrcamentoItem: TOracleDataSet1;
    QOficinaOrcamentoItemCOD_OFICINA_ORCAMENTO_ITEM: TIntegerField;
    QOficinaOrcamentoItemCOD_OFICINA_ORCAMENTO_CAB: TIntegerField;
    QOficinaOrcamentoItemCOD_PRODUTO: TIntegerField;
    QOficinaOrcamentoItemDESC_COMPLEMENTO: TStringField;
    QOficinaOrcamentoItemQT_QUANTIDADE: TFloatField;
    QOficinaOrcamentoItemVAL_UNITARIO: TFloatField;
    QOficinaOrcamentoItemVAL_TOTAL: TFloatField;
    QOficinaOrcamentoItemdesc_produto: TStringField;
    QOficinaOrcamentoCons: TOracleDataSet1;
    QOficinaOrcamentoItemCons: TOracleDataSet1;
    QOficinaOrcamentoConsCOD_OFICINA_ORCAMENTO_CAB: TIntegerField;
    QOficinaOrcamentoConsCOD_CADASTRO: TIntegerField;
    QOficinaOrcamentoConsCOD_MARCA: TIntegerField;
    QOficinaOrcamentoConsDESC_SERVICO: TStringField;
    QOficinaOrcamentoConsDT_ORCAMENTO: TDateTimeField;
    QOficinaOrcamentoConsNOME: TStringField;
    QOficinaOrcamentoConsDESC_MARCA: TStringField;
    QOficinaOrcamentoItemConsCOD_OFICINA_ORCAMENTO_ITEM: TIntegerField;
    QOficinaOrcamentoItemConsCOD_OFICINA_ORCAMENTO_CAB: TIntegerField;
    QOficinaOrcamentoItemConsCOD_PRODUTO: TIntegerField;
    QOficinaOrcamentoItemConsDESC_COMPLEMENTO: TStringField;
    QOficinaOrcamentoItemConsQT_QUANTIDADE: TFloatField;
    QOficinaOrcamentoItemConsVAL_UNITARIO: TFloatField;
    QOficinaOrcamentoItemConsVAL_TOTAL: TFloatField;
    QOficinaOrcamentoItemConsDESC_PRODUTO: TStringField;
    QOficinaOrcamentoConsCOD_FILIAL: TIntegerField;
    QOficinaOrcamentoCadCOD_FILIAL: TIntegerField;
    QOficinaOrcamentoConsDESC_FILIAL: TStringField;
    QOficinaOrcamentoItemPERC_DESCONTO: TFloatField;
    QOficinaOrcamentoItemval_item: TFloatField;
    QOficinaConsNUM_OFICINA_CAB: TIntegerField;
    QSomaItemOficinasval_desc_mec: TFloatField;
    QSomaItemOficinasval_desc_produto: TFloatField;
    QSomaItemOficinasval_desc_servico: TFloatField;
    QOficinaOrcamentoCadCOD_VEICULO: TIntegerField;
    QOficinaOrcamentoConsNUM_PLACA: TStringField;
    QOficinaCadCOD_VEICULO: TIntegerField;
    QOficinaConsNUM_PLACA: TStringField;
    QOficinaCadDESC_COMPL_MARCA: TStringField;
    QOficinaCadVAL_DESCONTO_PECAS: TFloatField;
    QOficinaCadVAL_DESCONTO_SERVICOS: TFloatField;
    QSomaItemOficinaVAL_DESCONTO_PECAS: TFloatField;
    QSomaItemOficinaVAL_DESCONTO_SERVICOS: TFloatField;
    QOficinaOrcamentoCadNUM_ORCAMENTO: TIntegerField;
    QOficinaOrcamentoCadVAL_DESCONTO_PECAS: TFloatField;
    QOficinaOrcamentoCadVAL_DESCONTO_SERVICOS: TFloatField;
    QOficinaCadVAL_VIRA_MANCAL: TFloatField;
    QOficinaCadVAL_VIRA_BIELA: TFloatField;
    QOficinaCadVAL_CARCACA_MANCAL: TFloatField;
    QOficinaCadDESC_CARCACA_ALOJ_C: TStringField;
    QOficinaCadDESC_COMPR_CILINDRO: TStringField;
    QOficinaCadDESC_BLOCO_CILINDRO: TStringField;
    QOficinaCadVAL_COLO_C: TFloatField;
    QSomaItemOficinaSVAL_VEN_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_VEN_PRODUTO: TFloatField;
    QSomaItemOficinaSVAL_CLI_SERVICO: TFloatField;
    QSomaItemOficinaSVAL_CLI_PRODUTO: TFloatField;
    QSomaItemOficinadesc_mec_produto: TStringField;
    QSomaItemOficinadesc_mec_servico: TStringField;
    QSomaItemOficinadesc_cli_produto: TStringField;
    QSomaItemOficinadesc_cli_servico: TStringField;
    QSomaItemOficinadesc_ven_produto: TStringField;
    QSomaItemOficinadesc_ven_servico: TStringField;
    QSomaItemOficinadesc_mec: TStringField;
    QSomaItemOficinadesc_cli: TStringField;
    QSomaItemOficinadesc_ven: TStringField;
    QSomaItemOrcamento: TOracleDataSet1;
    QSomaItemOrcamentoVAL_TOTAL: TFloatField;
    QOficinaCadCOD_MARCA: TIntegerField;
    QOficinaCadCOD_SERIE: TStringField;
    QOficinaItemNUM_FABRICANTE: TStringField;
    QOficinaOrcamentoCadDESC_VEICULO: TStringField;
    QOficinaOrcamentoCadDESC_CADASTRO: TStringField;
    QOficinaItemPERC_COMISSAO: TFloatField;
    QOficinaCadIND_DESCRICAO_MARCA: TStringField;
    QOficinaOrcamentoCadIND_DESCRICAO_MARCA: TStringField;
    QOficinaOrcamentoCadDESC_COMPL_MARCA: TStringField;
    QVeiculoCadNUM_SERIE: TStringField;
    QVeiculoCadDESC_TRANSMISSAO_TRAS: TStringField;
    QVeiculoCadDESC_TRANSMISSAO_DIANT: TStringField;
    QVeiculoCadDESC_ALTERNADOR: TStringField;
    QVeiculoCadDESC_MOTOR_PARTIDA: TStringField;
    QVeiculoCadDESC_REDUTORES_DIREITA: TStringField;
    QVeiculoCadDESC_REDUTORES_ESQUERDA: TStringField;
    QVeiculoCadNUM_SERIE_BOMBA_INJ: TStringField;
    QRequisicao_itemDESC_REQUISICAO_ITEM: TStringField;
    QOSMarcacaoDESC_MARCACAO: TStringField;
    QOS_TipoCadCOD_COMISSAO: TIntegerField;
    QMecanicoComissaoCad: TOracleDataSet1;
    QMecanicoComissaoCadCOD_MECANICO: TIntegerField;
    QMecanicoComissaoCadCOD_COMISSAO: TIntegerField;
    QMecanicoComissaoCadPERC_COMISSAO: TFloatField;
    QMecanicoComissaoCaddesc_comissao: TStringField;
    QRequisicao_itemCOD_COMISSAO: TIntegerField;
    QOSFechamentoVAL_NF_LOCOMOCAO: TFloatField;
    QOSFechamentoVAL_NF_LOCOMOCAO2: TFloatField;
    QVeiculoCadDESC_OBSERVACAO: TStringField;
    QVeiculoCadDT_REV_PRE_ENTREGA: TDateTimeField;
    QOSMarcacaoCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicao_itemVAL_CUSTO: TFloatField;
    QRequisicaoItensConsCOD_REQUISICAO_ITEM: TIntegerField;
    QVeiculoCadDESC_MARCA_BOMBA: TStringField;
    QVeiculoCadDESC_MARCA_PNEU_DIANT: TStringField;
    QVeiculoCadDESC_MARCA_PNEU_TRAS: TStringField;
    QVeiculoCadDESC_MODELO_PNEU_DIANT: TStringField;
    QVeiculoCadDESC_MODELO_PNEU_TRAS: TStringField;
    QRequisicao_itemCOD_MECANICO: TIntegerField;
    QRequisicao_itemServico: TOracleDataSet1;
    QRequisicao_itemServicoCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicao_itemServicoNUM_REQUISICAO: TIntegerField;
    QRequisicao_itemServicoCOD_PRODUTO: TFloatField;
    QRequisicao_itemServicoQT_QUANTIDADE: TFloatField;
    QRequisicao_itemServicoVAL_UNITARIO: TFloatField;
    QRequisicao_itemServicoPERC_DESCONTO: TFloatField;
    QRequisicao_itemServicoCOD_MECANICO: TIntegerField;
    QRequisicao_itemServicoNUM_FABRICANTE: TStringField;
    QRequisicao_itemServicoDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicao_itemServicoCOD_FILIAL: TIntegerField;
    QRequisicao_itemServicoVAL_CUSTO: TFloatField;
    QRequisicao_itemServicoCOD_VENDEDOR: TIntegerField;
    QRequisicao_itemServicoIND_DESCONTO: TStringField;
    QRequisicao_itemServicoDESC_REQUISICAO_ITEM: TStringField;
    QRequisicao_itemServicoCOD_COMISSAO: TIntegerField;
    QRequisicao_itemServicodesc_produto: TStringField;
    QRequisicao_itemServicoTotal_produto: TFloatField;
    QRequisicaoItensConsDESC_REQUISICAO_ITEM: TStringField;
    QOSMarcacaoConsMECANICO: TStringField;
    QOSMarcacaoDT_INICIO: TDateTimeField;
    QOSMarcacaoDT_FIM: TDateTimeField;
    QRequisicao_itemServicoROWNUM: TFloatField;
    QOSMarcacaoConsDT_INICIO: TDateTimeField;
    QOSMarcacaoConsDT_FIM: TDateTimeField;
    QOSMarcacaoConsdesc_situacao: TStringField;
    QOSFechamentoIND_CAMPO_OFICINA: TStringField;
    QOS_TipoCadCOD_COMISSAO_PECA: TIntegerField;
    QOSFechamentoCOD_OPERACAO: TIntegerField;
    QOSFechamentoCOD_MENSAGEM: TIntegerField;
    QOSFechamentoVAL_DESCONTO: TFloatField;
    QOSFechamentoCOD_NOTA_CAB: TIntegerField;
    QOSFechamentoIND_VISTA_PRAZO: TIntegerField;
    QOSFechamentoIND_NATUREZA_OS: TStringField;
    QOSFechamentoDESC_SOLICITACAO: TStringField;
    QOSFechamentoCOD_SERIE: TStringField;
    QRequisicao_itemVeiculo: TOracleDataSet1;
    QRequisicao_itemVeiculoIND_VEICULO: TStringField;
    QRequisicao_itemVeiculoDESC_PLACA: TStringField;
    QRequisicao_itemVeiculoCOD_CADASTRO_MOTORISTA: TIntegerField;
    QRequisicao_itemVeiculoNUM_KM_SAIDA: TIntegerField;
    QRequisicao_itemVeiculoNUM_KM_CHEGADA: TIntegerField;
    QRequisicao_itemVeiculoCOD_REQUISICAO_ITEM: TIntegerField;
    QRequisicao_itemVeiculoNUM_REQUISICAO: TIntegerField;
    QRequisicao_itemVeiculoCOD_PRODUTO: TFloatField;
    QRequisicao_itemVeiculoQT_QUANTIDADE: TFloatField;
    QRequisicao_itemVeiculoVAL_UNITARIO: TFloatField;
    QRequisicao_itemVeiculoPERC_DESCONTO: TFloatField;
    QRequisicao_itemVeiculoCOD_MECANICO: TIntegerField;
    QRequisicao_itemVeiculoNUM_FABRICANTE: TStringField;
    QRequisicao_itemVeiculoDT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicao_itemVeiculoCOD_FILIAL: TIntegerField;
    QRequisicao_itemVeiculoVAL_CUSTO: TFloatField;
    QRequisicao_itemVeiculoCOD_VENDEDOR: TIntegerField;
    QRequisicao_itemVeiculoIND_DESCONTO: TStringField;
    QRequisicao_itemVeiculoDESC_REQUISICAO_ITEM: TStringField;
    QRequisicao_itemVeiculoCOD_COMISSAO: TIntegerField;
    QRequisicao_itemVeiculodesc_produto: TStringField;
    QRequisicao_itemVeiculototal_produto: TFloatField;
    QRequisicao_itemVeiculoVAL_PEDAGIO: TFloatField;
    QRequisicao_itemVeiculoVAL_REFEICAO: TFloatField;
    QRequisicao_itemVeiculoVAL_HOSPEDAGEM: TFloatField;
    QROSCapaDESC_CELULAR: TStringField;
    QControleEstoqueIND_CUSTO: TStringField;
    QControleEstoqueIND_ESTOQUE: TStringField;
    QOSContaReceberNUM_TITULO: TFloatField;
    QOSContaReceberConsNUM_TITULO: TFloatField;
    QControleEstoqueQT_QUANTIDADE_ANTERIOR: TFloatField;
    QOficinaCadCOD_SERIE_MODELO: TStringField;
    QRequisicaoCad2: TOracleDataSet1;
    QRequisicao_item2: TOracleDataSet1;
    QRequisicaoCad2NUM_REQUISICAO: TIntegerField;
    QRequisicaoCad2DT_EMISSAO: TDateTimeField;
    QRequisicaoCad2NUM_OS: TIntegerField;
    QRequisicaoCad2COD_MECANICO: TIntegerField;
    QRequisicaoCad2COD_VENDEDOR: TIntegerField;
    QRequisicaoCad2NUM_PEDIDO: TIntegerField;
    QRequisicaoCad2IND_SITUACAO: TStringField;
    QRequisicaoCad2VAL_TOTAL: TFloatField;
    QRequisicaoCad2COD_FILIAL: TIntegerField;
    QRequisicaoCad2IND_TIPO_MOVIMENTO: TStringField;
    QRequisicao_item2COD_REQUISICAO_ITEM: TIntegerField;
    QRequisicao_item2NUM_REQUISICAO: TIntegerField;
    QRequisicao_item2COD_PRODUTO: TFloatField;
    QRequisicao_item2QT_QUANTIDADE: TFloatField;
    QRequisicao_item2VAL_UNITARIO: TFloatField;
    QRequisicao_item2PERC_DESCONTO: TFloatField;
    QRequisicao_item2COD_MECANICO: TIntegerField;
    QRequisicao_item2NUM_FABRICANTE: TStringField;
    QRequisicao_item2DT_REQUISICAO_ITEM: TDateTimeField;
    QRequisicao_item2COD_FILIAL: TIntegerField;
    QRequisicao_item2VAL_CUSTO: TFloatField;
    QRequisicao_item2COD_VENDEDOR: TIntegerField;
    QRequisicao_item2IND_DESCONTO: TStringField;
    QRequisicao_item2DESC_REQUISICAO_ITEM: TStringField;
    QRequisicao_item2COD_COMISSAO: TIntegerField;
    QRequisicao_item2IND_VEICULO: TStringField;
    QRequisicao_item2DESC_PLACA: TStringField;
    QRequisicao_item2COD_CADASTRO_MOTORISTA: TIntegerField;
    QRequisicao_item2NUM_KM_SAIDA: TIntegerField;
    QRequisicao_item2NUM_KM_CHEGADA: TIntegerField;
    QRequisicao_item2VAL_PEDAGIO: TFloatField;
    QRequisicao_item2VAL_REFEICAO: TFloatField;
    QRequisicao_item2VAL_HOSPEDAGEM: TFloatField;
    QRequisicaoCad2desc_cadastro_os: TStringField;
    QRequisicao_item2desc_produto: TStringField;
    QRequisicao_item2val_total: TFloatField;
    QVeiculoCadNUM_CHASSI_CARRETA: TStringField;
    QVeiculoCadNUM_PLACA_CARRETA: TStringField;
    QVeiculoCadNUM_CERTIFICADO_CARRETA: TStringField;
    QVeiculoCadNUM_ANO_CARRETA: TIntegerField;
    QVeiculoCadNUM_ANO_FAB: TIntegerField;
    QRVeiculoNUM_ANO_FAB: TIntegerField;
    QRVeiculoNUM_ANO: TIntegerField;
    QRequisicaoCad2IND_LIBERADO: TStringField;
    QROSCapaNUM_ANO_FAB: TIntegerField;
    QROSCapaNUM_ANO: TIntegerField;
    QMecanicoCadVAL_HORA: TFloatField;
    QMecanicoCadIND_SITUACAO: TStringField;
    QMecanicoConsVAL_HORA: TFloatField;
    QMecanicoConsIND_TIPO_MECANICO: TStringField;
    QMecanicoConsIND_SITUACAO: TStringField;
    QDeletaCaixaAvista: TOracleDataSet1;
    QROSPreFechamentoNUM_FABRICANTE: TStringField;
    procedure QMecanicoCadCalcFields(DataSet: TDataSet);
    procedure QMecanicoCadNewRecord(DataSet: TDataSet);
    procedure QRVeiculoCalcFields(DataSet: TDataSet);
    procedure QOSFechamentoCalcFields(DataSet: TDataSet);
    procedure QOSFechamentoBeforeEdit(DataSet: TDataSet);
    procedure QOSFechamentoBeforePost(DataSet: TDataSet);
    procedure QOSFechamentoAfterOpen(DataSet: TDataSet);
    procedure QRequisicaoCadNewRecord(DataSet: TDataSet);
    procedure QRequisicaoCadCalcFields(DataSet: TDataSet);
    procedure QRequisicao_itemAfterPost(DataSet: TDataSet);
    procedure QRequisicao_itemBeforeDelete(DataSet: TDataSet);
    procedure QRequisicao_itemBeforeInsert(DataSet: TDataSet);
    procedure QROSPreFechamentoCalcFields(DataSet: TDataSet);
    procedure QRequisicaoCadBeforeDelete(DataSet: TDataSet);
    procedure QRequisicaoCadBeforePost(DataSet: TDataSet);
    procedure QOSMarcacaoCalcFields(DataSet: TDataSet);
    procedure QOSMarcacaoNewRecord(DataSet: TDataSet);
    procedure QRequisicao_itemnum_fabricanteChange(Sender: TField);
//    procedure QRequisicao_itemCOD_MECANICOValidate(Sender: TField);
    procedure QRequisicao_itemCalcFields(DataSet: TDataSet);
    procedure QRequisicao_itemNewRecord(DataSet: TDataSet);
    procedure QOrcamento_OficinaCalcFields(DataSet: TDataSet);
    procedure QOrcamento_OficinaNewRecord(DataSet: TDataSet);
    procedure QOrcamento_Oficina_ItemNewRecord(DataSet: TDataSet);
    procedure QOrcamento_Oficina_ItemBeforeInsert(DataSet: TDataSet);
    procedure QRequisicao_itemBeforePost(DataSet: TDataSet);
    procedure QRequisicaoCadAfterCancel(DataSet: TDataSet);
    procedure QRequisicaoCadAfterDelete(DataSet: TDataSet);
    procedure QRequisicaoCadDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QRequisicao_itemAfterDelete(DataSet: TDataSet);
    procedure QOficinaCadCalcFields(DataSet: TDataSet);
    procedure QOficinaCadAfterInsert(DataSet: TDataSet);
    procedure QOficinaItemCalcFields(DataSet: TDataSet);
    procedure QOficinaItemBeforeEdit(DataSet: TDataSet);
    procedure QOficinaItemBeforeInsert(DataSet: TDataSet);
    procedure QOficinaConsAfterOpen(DataSet: TDataSet);
    procedure QOficinaCadAfterOpen(DataSet: TDataSet);
    procedure QOficinaCadAfterClose(DataSet: TDataSet);
    procedure QOficinaItemAfterPost(DataSet: TDataSet);
    procedure QOficinaCadAfterPost(DataSet: TDataSet);
    procedure QOficinaItemBeforeDelete(DataSet: TDataSet);
    procedure QOficinaItemBeforePost(DataSet: TDataSet);
    procedure QOficinaConsCalcFields(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemCalcFields(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemBeforeInsert(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemBeforeEdit(DataSet: TDataSet);
    procedure QOficinaOrcamentoCadAfterInsert(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemAfterInsert(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemBeforeDelete(DataSet: TDataSet);
    procedure QSomaItemOficinaCalcFields(DataSet: TDataSet);
    procedure QOficinaOrcamentoCadAfterOpen(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemAfterPost(DataSet: TDataSet);
    procedure QOficinaOrcamentoItemBeforePost(DataSet: TDataSet);
    procedure QOficinaItemNUM_FABRICANTEChange(Sender: TField);
    procedure QOficinaItemCOD_PRODUTOChange(Sender: TField);
    procedure QOficinaOrcamentoCadCOD_CADASTROChange(Sender: TField);
    procedure QOficinaOrcamentoCadCOD_VEICULOChange(Sender: TField);
    procedure QOficinaCadCOD_CADASTROChange(Sender: TField);
    procedure QOficinaCadBeforePost(DataSet: TDataSet);
    procedure QOficinaItemAfterInsert(DataSet: TDataSet);
    procedure QOficinaCadCOD_MARCAChange(Sender: TField);
    procedure QOficinaOrcamentoCadCOD_MARCAChange(Sender: TField);
    procedure QOficinaOrcamentoItemCOD_PRODUTOChange(Sender: TField);
    procedure QMecanicoCadAfterOpen(DataSet: TDataSet);
    procedure QMecanicoComissaoCadCalcFields(DataSet: TDataSet);
    procedure QMecanicoComissaoCadBeforeDelete(DataSet: TDataSet);
    procedure QMecanicoComissaoCadBeforeEdit(DataSet: TDataSet);
    procedure QMecanicoComissaoCadBeforeInsert(DataSet: TDataSet);
    procedure QRequisicao_itemAfterInsert(DataSet: TDataSet);
    procedure QRequisicao_itemServicoNUM_FABRICANTEChange(Sender: TField);
    procedure QRequisicao_itemBeforeEdit(DataSet: TDataSet);
    procedure QOSMarcacaoDT_INICIOChange(Sender: TField);
    procedure QOSMarcacaoConsCalcFields(DataSet: TDataSet);
    procedure ClearVariablesAfterClose(DataSet: TDataSet);
    procedure QOSMarcacaoBeforePost(DataSet: TDataSet);
    procedure QRequisicaoCadAfterOpen(DataSet: TDataSet);
    procedure QRequisicaoCadAfterClose(DataSet: TDataSet);
    procedure QRequisicao_itemVeiculoNUM_KM_SAIDAChange(Sender: TField);
    procedure QMecanicoCadBeforeDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QRequisicaoCadBeforeEdit(DataSet: TDataSet);
    procedure QRequisicaoCad2CalcFields(DataSet: TDataSet);
    procedure QRequisicao_item2CalcFields(DataSet: TDataSet);
    procedure QRequisicaoCad2AfterInsert(DataSet: TDataSet);
    procedure QRequisicao_item2AfterInsert(DataSet: TDataSet);
    procedure QRequisicao_item2BeforePost(DataSet: TDataSet);
    procedure QRequisicao_item2AfterPost(DataSet: TDataSet);
    procedure QRequisicao_item2AfterDelete(DataSet: TDataSet);
    procedure QRequisicao_item2BeforeDelete(DataSet: TDataSet);
    procedure QRequisicao_item2BeforeInsert(DataSet: TDataSet);
  private   
    Buscador: TBuscador;
    procedure AtualizaEstoqueOficina(pOperacao: String);
  public
    procedure AtualizaValorItemReq(pReqItem: String; pValor: String);
    function SenhaLiberaCadastro(): boolean;
    procedure calculaTotalRequisicao;
    procedure calculaTotalRequisicao2;
  end;

var
  DMOficina: TDMOficina;
  wQtdeItemAntesDaEdicao: Real;
  wFilial: String = '';
  wProduto: String = '';
  wQuantidade: String = '';
  wLimiteMaximo : string = '';
implementation

uses UEstoque_cl, UOficinaPassword,
  UBiblioteca, UUsuario_cl, UParamSistema_cl, USerie_cl, UCadastro_cl,
  UNotaSaida_cl, UNotaEntrada_cl;

{$R *.DFM}

procedure TDMOficina.QMecanicoCadCalcFields(DataSet: TDataSet);
begin
  QMecanicoCaddesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + IntToStr(QMecanicoCadCOD_FILIAL.Value));
end;

procedure TDMOficina.QMecanicoCadNewRecord(DataSet: TDataSet);
begin
  QMecanicoCadCOD_FILIAL.Value := 1;
end;

procedure TDMOficina.QRVeiculoCalcFields(DataSet: TDataSet);
begin
  QRVeiculonome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(QRVeiculoCOD_CADASTRO.Value));
end;

procedure TDMOficina.QOSFechamentoCalcFields(DataSet: TDataSet);
var Buscador: TBuscador;
begin
  Buscador := TBuscador.Create;
  Buscador.Limpa;
  Buscador.Adiciona('DESC_FILIAL', 'TB_FILIAL', 'COD_FILIAL = ' + IntToStr(QOSFechamentoCOD_FILIAL.Value));
  Buscador.Adiciona('NOME', 'TB_VENDEDOR', 'COD_VENDEDOR = ' + IntToStr(QOSFechamentoCOD_VENDEDOR.Value));
  Buscador.Adiciona('NOME', 'TB_MECANICO', 'COD_MECANICO = ' + IntToStr(QOSFechamentoCOD_MECANICO.Value));
  Buscador.Adiciona('DESC_OS_TIPO', 'TB_OS_TIPO', 'COD_OS_TIPO = ' + IntToStr(QOSFechamentoIND_TIPO_OS.Value));
  Buscador.Adiciona('DESC_CARACTERISTICA', 'TB_VEICULO', 'NUM_CHASSI = ' + CHR(39) + QOSFechamentoNUM_CHASSI.Value + CHR(39));
  Buscador.Adiciona('NOME', 'TB_CADASTRO', 'COD_CADASTRO = ' + IntToStr(QOSFechamentoCOD_CADASTRO.Value));
  Buscador.Buscar(True);
  QOSFechamentodesc_filial.Value := Buscador.Proximo;
  QOSFechamentonome_vendedor.Value := Buscador.Proximo;
  QOSFechamentonome_mecanico.Value := Buscador.Proximo;
  QOSFechamentodesc_tipo_os.Value := Buscador.Proximo;
  QOSFechamentodesc_caracteristica.Value := Buscador.Proximo;
  QOSFechamentonome_cadastro.Value := Buscador.Proximo;
end;

procedure TDMOficina.QOSFechamentoBeforeEdit(DataSet: TDataSet);
begin
  QOSFechamentoDT_SAIDA.Value := Date;
end;

procedure TDMOficina.QOSFechamentoBeforePost(DataSet: TDataSet);
begin
  QOSFechamentoIND_SITUACAO.Value := 'F';
  QOSFechamentoHR_SAIDA.Value := TimeToStr(Time);
  QOSFechamentoDT_SAIDA.Value := Date;
end;

procedure TDMOficina.QOSFechamentoAfterOpen(DataSet: TDataSet);
begin
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS') and
      (QOSFechamentoIND_SITUACAO.Value = 'F') then
    QOSFechamento.CloseAll;
end;

procedure TDMOficina.QRequisicaoCadNewRecord(DataSet: TDataSet);
begin
  QRequisicaoCadDT_EMISSAO.Value := Date;
  QRequisicaoCadIND_SITUACAO.Value := 'A';
  QRequisicaoCadIND_TIPO_MOVIMENTO.Value := 'S';
end;

procedure TDMOficina.QRequisicaoCadCalcFields(DataSet: TDataSet);
var
  mCodCadastro: string;
begin
  if QRequisicaoCadNUM_OS.Value > 0 then
  begin
    mCodCadastro := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_OS', 'NUM_OS = ' + QRequisicaoCadNUM_OS.Text);
    QRequisicaoCadnome_cadastro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
        'COD_CADASTRO = ' + mCodCadastro);
  end;
  if QRequisicaoCadCOD_FILIAL.Value > 0 then
    QRequisicaoCaddesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
        'COD_FILIAL = ' + QRequisicaoCadCOD_FILIAL.Text);
end;

procedure TDMOficina.QRequisicao_itemAfterPost(DataSet: TDataSet);
var
  agronews: bool;
  qtMinimo, qtEstoque : Real;
begin
  //verifica estoque minimo
  qtMinimo := StrToFloat(DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_MINIMO FROM TB_ESTOQUE',
        'COD_FILIAL = ' + QRequisicaoCadCOD_FILIAL.Text + ' AND COD_PRODUTO = ' +QRequisicao_itemCOD_PRODUTO.Text));
  qtEstoque := StrToFloat(DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE FROM TB_ESTOQUE',
        'COD_FILIAL = ' + QRequisicaoCadCOD_FILIAL.Text + ' AND COD_PRODUTO = ' +QRequisicao_itemCOD_PRODUTO.Text));

  if ((qtEstoque - QRequisicao_itemQT_QUANTIDADE.Value) <= qtMinimo) then
    MessageDlg('O Estoque do Produto Vai Atingir o Minimo Configurado!'           +#13+#10+
          'Estoque: '+ FloatToStr(qtEstoque) + ' Minimo: ' + FloatToStr(qtMinimo) +
          ' Vai Restar: ' + FloatToStr(qtEstoque - QRequisicao_itemQT_QUANTIDADE.Value)
          , mtInformation, [mbOK], 0);


  agronews := DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS';
  if not agronews then
    try
      if DMOracle.DBCemapa.InTransaction = false then
        DMOracle.DBCemapa.StartTransaction;

      DMEstoque.AtualizaEstoque(-2, DataSet.FieldByName('COD_FILIAL').Value,
          DataSet.FieldByName('COD_PRODUTO').Value,
          1, // Lote fixo padrão usado na oficina.
          (DataSet.FieldByName('QT_QUANTIDADE').Value - wQtdeItemAntesDaEdicao) * -1, 0, 0, 0);

      if DMOracle.DBCemapa.InTransaction = true then
        DMOracle.DBCemapa.Commit;
    except
      on e: Exception do
      begin
        DMOracle.DBCemapa.Rollback;
        with DataSet do
        begin
          Cancel;
          FieldByName('COD_PRODUTO').Clear;
          FieldByName('COD_MECANICO').Clear;
          FieldByName('VAL_UNITARIO').Clear;
          FieldByName('QT_QUANTIDADE').Clear;
          FieldByName('desc_produto').Clear;
          FieldByName('NUM_FABRICANTE').Clear;
          FieldByName('Total_produto').Clear;
        end;
        MessageDlg('Erro na atualização do estoque!'+#13+#10+
          e.Message, mtError, [mbOK], 0);
        Exit;
      end;
    end;

  //Atualiza total no arquivo e na tela.
  if QRequisicaoCad.State in [dsBrowse, dsInactive] then
    QRequisicaoCad.Edit;

  DataSet.First;
  calculaTotalRequisicao;
  if DataSet.State in [dsInsert, dsEdit] then
    DataSet.Post;

  QRequisicaoCad.Post;
  QRequisicaoCad.Edit;

  if agronews then
  begin
    DataSet.Close;
    DataSet.Open;
  end;
end;

procedure TDMOficina.calculaTotalRequisicao;
begin
  QRequisicaoCadVAL_TOTAL.Value := StrToFloat('0' + DMOracle.FastSelect('SUM((QT_QUANTIDADE * VAL_UNITARIO) + ' +
      'NVL(VAL_PEDAGIO,0) + NVL(VAL_REFEICAO,0) + NVL(VAL_HOSPEDAGEM,0))',
      'TB_REQUISICAO_ITEM', 'NUM_REQUISICAO = ' + QRequisicaoCadNUM_REQUISICAO.Text));
end;

procedure TDMOficina.calculaTotalRequisicao2;
var wValor: String;
begin
  with DMOracle do
  begin
    wValor :=  DMOracle.FastSelect('SUM(NVL((QT_QUANTIDADE * VAL_UNITARIO),0) + ' +
      'NVL(VAL_PEDAGIO,0) + NVL(VAL_REFEICAO,0) + NVL(VAL_HOSPEDAGEM,0))',
      'TB_REQUISICAO_ITEM', 'NUM_REQUISICAO = ' + QRequisicaoCad2NUM_REQUISICAO.Text);
    if wValor = '' then
      wValor := '0';
    wValor := bib.TrocaVirgulaPorPonto(wValor);
    ExecutaSql('UPDATE TB_REQUISICAO SET VAL_TOTAL = ' + wValor +
        ' WHERE NUM_REQUISICAO = ' +  QRequisicaoCad2NUM_REQUISICAO.Text);
  end;
end;

procedure TDMOficina.QRequisicao_itemBeforeDelete(DataSet: TDataSet);
begin
  // Atualiza total no arquivo e na tela
  if QRequisicaoCad.State in [dsEdit, dsInsert] then
    QRequisicaoCad.Post;

  // Inicia procedimento de atualização do estoque, volta posição anterior.
  if (DataSet = QRequisicao_item) and (QRequisicaoCadIND_TIPO_MOVIMENTO.Value = 'S') then
  begin
    try
//      if not DMOracle.DBCemapa.InTransaction then
//        DMOracle.DBCemapa.StartTransaction;
      with DataSet do
        DMEstoque.AtualizaEstoque(-2, FieldByName('COD_FILIAL').Value,
            FieldByName('COD_PRODUTO').Value,
            1, // Lote fixo padrão usado na oficina.
            FieldByName('QT_QUANTIDADE').Value, 0, 0, 0);
//      if DMOracle.DBCemapa.InTransaction = True then   <--- Commit vai ser feito no
//        DMOracle.DBCemapa.Commit;                             AfterDelete da query
    except
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
        DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

procedure TDMOficina.QRequisicao_itemBeforeInsert(DataSet: TDataSet);
begin
//  if QRequisicaoCad.State in [dsBrowse, dsInactive] then
//    QRequisicaoCad.Edit // Edita requisição caso não esteja no modo de inserção/edição.
//  else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
//  begin
//    QRequisicaoCad.Post; // Esta no modo de edição - salva registro atual.
//    QRequisicaoCad.Edit; // Entra no modo de edição novamente.
//  end;
  if QRequisicaoCad.State = DsInsert then
    QRequisicaoCad.Post;
  if QRequisicaoCad.State = DsBrowse then
    QRequisicaoCad.Edit;
end;

procedure TDMOficina.QROSPreFechamentoCalcFields(DataSet: TDataSet);
var
  wNum_Orcamento: string;
begin
  wNum_Orcamento := '';
  if (QROSPreFechamentoPERC_TRIBUTADO.Value = 0) and (QROSPreFechamentoPERC_ALIQUOTA.Value = 0) then
    QROSPreFechamentototal_isento.Value := QROSPreFechamentoTOTAL_ITENS.Value;

  wNum_Orcamento := DMOracle.BuscaNome('SELECT NUM_ORCAMENTO FROM TB_ORCAMENTO_OFICINA', 'NUM_OS = ' +
    Trim(QROSPreFechamentoNum_OS.Text));
  if (wNum_Orcamento <> '') then
  begin
    if (DMOracle.BuscaNome('SELECT NUM_ORCAMENTO_ITEM FROM TB_ORCAMENTO_OFICINA_ITEM',
      'NUM_ORCAMENTO = ' + wNum_Orcamento + ' AND NUM_FABRICANTE = '
      + chr(39) + Trim(QROSPreFechamentoNUM_FABRICANTE.Text) + chr(39)) <> '') then
      QROSPreFechamentoInd_Orcamento.Text := 'S'
    else
      QROSPreFechamentoInd_Orcamento.Text := 'N';
  end
  else
    QROSPreFechamentoInd_Orcamento.Text := 'N';
end;

procedure TDMOficina.QRequisicaoCadBeforeDelete(DataSet: TDataSet);
begin
//  if not DMOracle.DBCemapa.inTransaction then
//    DMOracle.DBCemapa.StartTransaction;

  if QRequisicao_item.State in [dsInsert, dsEdit] then
    raise exception.Create('Itens da requisição em edição!, Vocë deve cancelar ou confirmar primeiro!');

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    QRequisicao_item.First;
    while not QRequisicao_item.Eof do
      QRequisicao_item.Delete;
    QRequisicao_itemServico.First;
    while not QRequisicao_itemServico.Eof do
      QRequisicao_itemServico.Delete;
    QRequisicao_itemVeiculo.First;
    while not QRequisicao_itemVeiculo.Eof do
      QRequisicao_itemVeiculo.Delete;
  end
  else
  begin
    QRequisicao_item.Close;
    QRequisicao_item.SetVariable('NUM_REQUISICAO', QRequisicaoCadNUM_REQUISICAO.Value);
    QRequisicao_item.Open;
    if (QRequisicao_item.RecordCount > 0) then
      raise exception.Create('Requisição contém itens já lançados, não pode ser excluida!');
  end;
end;

procedure TDMOficina.QRequisicaoCadBeforePost(DataSet: TDataSet);
var
  mSituacao: string;
begin
  mSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_OS', 'NUM_OS = ' + QRequisicaoCadNUM_OS.AsString);
  if Trim(mSituacao) = 'F' then
    raise exception.Create('O.S. já foi fechada, impossivel editar requisição!');
end;

procedure TDMOficina.QOSMarcacaoCalcFields(DataSet: TDataSet);
begin
  QOSMarcacaonome_mecanico.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO', 'COD_MECANICO = ' + IntToStr(QOSMarcacaoCOD_MECANICO.Value));
end;

procedure TDMOficina.QOSMarcacaoNewRecord(DataSet: TDataSet);
begin
  QOSMarcacaoIND_SITUACAO.Value := 'I'; // Inicia marcacao.
  QOSMarcacaoDT_LANCAMENTO.Value := Date;
//  QOSMarcacaoHR_INICIO.Value := StrToFloat(Copy(TimeToStr(Time), 1, 2) + ',' + Copy(TimeToStr(Time), 4, 2)); <- Isso vai ser feito no OnChange do DT_INICIO
  QOSMarcacaoDT_INICIO.Value := StrToDateTime(FormatDateTime('dd/mm/yyyy hh:nn',Now));
end;

procedure TDMOficina.QRequisicao_itemnum_fabricanteChange(Sender: TField);
var
  wCodproduto, wVlrUnitario: string;
begin
  QRequisicao_itemCOD_PRODUTO.Value := 0;
  if not Sender.IsNull then
  begin
    wCodProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
        'TRIM(NUM_FABRICANTE) = ' + chr(39) + Sender.Value + chr(39));
    if Trim(wCodProduto) <> '' then
      QRequisicao_itemCOD_PRODUTO.Value := StrToInt(wCodProduto)
    else
      raise exception.Create('Código do produto invalido!');
  end;

  if DMOficina.QRequisicao_itemCOD_PRODUTO.Value <> 0 then
  begin
    wVlrUnitario := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO',
        'COD_PRODUTO = ' + FloatToStr(QRequisicao_itemCOD_PRODUTO.Value));
    if Trim(wVlrUnitario) <> '' then
      QRequisicao_itemVAL_UNITARIO.Value := StrToFloat(wVlrUnitario)
    else if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
      raise exception.Create('Produto sem preço para venda, verifique!');
  end;
end;

//procedure TDMOficina.QRequisicao_itemCOD_MECANICOValidate(Sender: TField);
//begin
//{  mMecanicoMarcacao:= DMOracle.BuscaNome('SELECT COD_MECANICO FROM TB_MARCACAO','COD_MECANICO = '+IntToStr(QRequisicao_itemCOD_MECANICO.Value)+' AND NUM_OS = '+IntToStr(QRequisicaoCadNUM_OS.Value));
//  if Trim(mMecanicoMarcacao) = '' then
//     raise exception.Create('Mecanico não está MARCADO para O.S. informada!');
//     }
//end;

procedure TDMOficina.QRequisicao_itemCalcFields(DataSet: TDataSet);
begin
  if not DataSet.FieldByName('NUM_FABRICANTE').IsNull then
    DataSet.FieldByName('desc_produto').Value := DMOracle.FastSelect('DESC_PRODUTO',
        'TB_PRODUTO', 'NUM_FABRICANTE = ' + CHR(39) + DataSet.FieldByName('NUM_FABRICANTE').Text + CHR(39));
  DataSet.FieldByName('Total_produto').Value := DataSet.FieldByName('QT_QUANTIDADE').Value *
      DataSet.FieldByName('VAL_UNITARIO').Value;
end;

procedure TDMOficina.QRequisicao_itemNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('DT_REQUISICAO_ITEM').Value := DMOracle.DataServ;
  DataSet.FieldByName('COD_FILIAL').Value := 1; // Filial padrão
end;

procedure TDMOficina.QOrcamento_OficinaCalcFields(DataSet: TDataSet);
begin
  QOrcamento_Oficinanome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(QOrcamento_OficinaCOD_CADASTRO.Value));
  QOrcamento_Oficinanome_vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(QOrcamento_OficinaCOD_VENDEDOR.Value));
end;

procedure TDMOficina.QOrcamento_OficinaNewRecord(DataSet: TDataSet);
begin
  QOrcamento_OficinaDT_EMISSAO.Value := DMOracle.DataServ;
end;

procedure TDMOficina.QOrcamento_Oficina_ItemNewRecord(DataSet: TDataSet);
begin
  QOrcamento_Oficina_ItemNUM_OS.Value := QOrcamento_OficinaNUM_OS.Value;
end;

procedure TDMOficina.QOrcamento_Oficina_ItemBeforeInsert(
  DataSet: TDataSet);
begin
  if QOrcamento_Oficina.State in [dsBrowse, dsInactive] then
    QOrcamento_Oficina.Edit;
end;

procedure TDMOficina.QRequisicao_itemBeforePost(DataSet: TDataSet);
var
  wQt_Estoque, wVl_Custo: Variant;
  wUn, wDescMax, wUnProd, wQt: Real;
  wEstoque :String;
begin
{  if (StrToInt(DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_MARCACAO',' NUM_OS = '+Trim(QRequisicaoCadNum_Os.Text)+
                ' AND (TB_MARCACAO.HR_FINAL IS NULL) AND TB_MARCACAO.COD_MECANICO = '+Trim(QRequisicao_itemCod_Mecanico.Text))) = 0 ) then
    raise exception.Create('Mecanico não está marcado nesta O.S ou já encerrou Marcação!!');
 }
//  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS' then
//  begin
  with DataSet do
  begin
    if (DMParamSistema.CodEmpresa = 'MEDIBENS') then
    begin
      if (FieldByName('COD_MECANICO').IsNull) then
        Raise Exception.Create('Mecânico obrigatório.');
      if (FieldByName('COD_VENDEDOR').IsNull) then
        Raise Exception.Create('Vendedor obrigatório.');
    end;
    wEstoque := DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE', 'COD_PRODUTO = ' +
        FloatToStr(FieldByName('COD_PRODUTO').Value) + ' AND COD_LOTE_TIPO = 1 AND COD_FILIAL = ' +
        FieldByName('COD_FILIAL').Text);
    if wEstoque <> '' then
      wQt_Estoque := StrToFloat(wEstoque) + wQtdeItemAntesDaEdicao
    else
      wQt_Estoque := 0 + wQtdeItemAntesDaEdicao;
  end;

  if wQt_Estoque = 0 then
  begin
    DataSet.Cancel;
    raise exception.Create('Produto com estoque zero!');
  end;
  if wQt_Estoque > 0 then
  begin
    if (wQt_Estoque - DataSet.FieldByName('QT_QUANTIDADE').Value) < 0 then
    begin
      DataSet.Cancel;
      raise exception.Create('Quantidade solicitada maior que quantidade em estoque!');
    end;
  end;
//  end
//  else
//  begin
//    DMParamSistema.QParamSistema.RefreshRecord;
//    wUn := 0;
//    wDescMax := 100;
//    if Dataset = QRequisicao_item then
//    begin
//      wUn := StrToFloat('0' + DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' +
//          Dataset.FieldByName('COD_PRODUTO').Text));
//      wDescMax := DMParamSistema.QParamSistemaPERC_DESC_MAX_PECA.Value;
//
//      try
//        if Dataset.State = DsEdit then
//          wQt := DataSet.FieldByName('QT_QUANTIDADE').Value - DataSet.FieldByName('QT_QUANTIDADE').OldValue
//        else
//          wQt := DataSet.FieldByName('QT_QUANTIDADE').Value;
//        DMEstoque.AtualizaEstoque(-2, DataSet.FieldByName('COD_FILIAL').Value,
//            DataSet.FieldByName('COD_PRODUTO').Value,
//            1, // Lote fixo padrão usado na oficina.
//            wQt * -1, 0, 0, 0);
//      except
//        Raise;
//      end;
//    end
//    else if Dataset = QRequisicao_itemServico then
//    begin
//      wUn := Bib.ift(DMOracle.FastSelect('IND_CAMPO_OFICINA', 'TB_OS',
//          'NUM_OS = ' + QRequisicaoCadNUM_OS.Text) = 'C', DMParamSistema.QParamSistemaVAL_HORA_CAMPO.Value,
//          DMParamSistema.QParamSistemaVAL_HORA_OFICINA.Value);
//      wDescMax := DMParamSistema.QParamSistemaPERC_DESC_MAX_SERVICO.Value;
//    end;
//    wUnProd := Dataset.FieldByName('VAL_UNITARIO').Value;
//    if (wUn > 0) and (wDescMax < 100) and (wUnProd < (wUn - (wUn * wDescMax / 100))) then
//      if not SenhaLiberaCadastro then
//        Raise Exception.Create('O desconto dado é inferior ao permitido (' +
//            FloatToStr(wDescMax) + '%).');
//  end;

  // Grava custo atual do produto na tabela de itens da requisicao.
  wVl_Custo := DMOracle.BuscaNome('SELECT VL_ULTIMO_CUSTO FROM TB_ESTOQUE', 'COD_PRODUTO = ' +
      FloatToStr(DataSet.FieldByName('COD_PRODUTO').Value) + ' AND COD_LOTE_TIPO = 1 AND COD_FILIAL = ' +
      DataSet.FieldByName('COD_FILIAL').Text);

  if (wVl_Custo <> '0') and (wVl_Custo <> '') then
    DataSet.FieldByName('VAL_CUSTO').Value := wVl_Custo
  else if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'AGRONEWS') then
    raise exception.create('Não é possivel vender peça com Custo Zero!');
end;

procedure TDMOficina.QRequisicaoCadAfterCancel(DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;
//  QRequisicaoCad.Close;
//  QRequisicaoCad.Open;
//  QRequisicao_Item.Close;
//  QRequisicao_Item.Open;
//  QRequisicao_itemServico.Close;
//  QRequisicao_itemServico.Open;
end;

procedure TDMOficina.QRequisicaoCadAfterDelete(DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
end;

procedure TDMOficina.QRequisicaoCadDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMOficina.QRequisicao_itemAfterDelete(DataSet: TDataSet);
begin
  try
    if QRequisicaoCad.State in [dsBrowse] then
      QRequisicaoCad.Edit;

    DataSet.First;
    calculaTotalRequisicao;

    if QRequisicaoCad.State in [dsInsert, dsEdit] then
      QRequisicaoCad.Post;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  except
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Rollback;
    raise;
  end;
end;

function TDMOficina.SenhaLiberaCadastro(): boolean;
begin
  if FOficinaPassword = nil then
    FOficinaPassword := TFOficinaPassword.Create(Application);
  if FOficinaPassword.ShowModal = mrOk then
  begin
    if (UpperCase(FOficinaPassword.Password.Text) = UpperCase(DMParamSistema.QParamSistemaDesc_Senha_Oficina.Text)) then
      result := true
    else
      result := false;
  end
  else
    result := false;
end;

procedure TDMOficina.QOficinaCadCalcFields(DataSet: TDataSet);
begin
  if QOficinaCadIND_SITUACAO.Value = 'A' then
    QOficinaCaddesc_situacao.Value := 'ABERTO'
  else if QOficinaCadIND_SITUACAO.Value = 'F' then
    QOficinaCaddesc_situacao.Value := 'FECHADO'
  else
    QOficinaCaddesc_situacao.Value := 'CANCELADO';
end;

procedure TDMOficina.QOficinaCadAfterInsert(DataSet: TDataSet);
begin
  QOficinaCadIND_SITUACAO.Value := 'A';
  QOficinaCadIND_DESCRICAO_MARCA.Value := 'N';
  QOficinaCadIND_CONDICAO_PAGTO.Value := 2;
  QOficinaCadIND_PARCIAL_TOTAL.Value := 'PARCIAL';
  QOficinaCadDT_ENTRADA.Value := Date;
  QOficinaCadDT_SAIDA.Value := Date;
  QOficinaCadVAL_DESCONTO_PECAS.Value := 0;
  QOficinaCadVAL_DESCONTO_SERVICOS.Value := 0;
  if DMUsuario.CodFilialUsuario > 0 then
    QOficinaCadCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
  begin
    QOficinaCadCOD_OPERACAO.Value := 2;
    QOficinaCadCOD_SERIE.Value := 'OS';
    QOficinaCadCOD_SERIE_MODELO.Value := '99';
  end;
end;

procedure TDMOficina.QOficinaItemCalcFields(DataSet: TDataSet);
var
  wValor: Real;
begin
  if (QOficinaItemCOD_PRODUTO.Text <> '') and (QOficinaItemDESC_COMPLEMENTO.Value = '')
    and (QOficinaItem.State in [DsEdit, DsInsert]) then
    QOficinaItemDESC_COMPLEMENTO.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
      'COD_PRODUTO = ' + QOficinaItemCOD_PRODUTO.Text);

  wValor := QOficinaItemQT_QUANTIDADE.Value * QOficinaItemVAL_UNITARIO.Value;
  QOficinaItemval_desc_venda.Value := wValor * QOficinaItemPERC_DESCONTO_VENDA.Value / 100;
  wValor := wValor - QOficinaItemval_desc_venda.Value;
  QOficinaItemval_desc_cliente.Value := wValor * QOficinaItemPERC_DESCONTO_CLIENTE.Value / 100;
  wValor := wValor - QOficinaItemval_desc_cliente.Value;
  QOficinaItemval_desc_mecanico.Value := wValor * QOficinaItemPERC_DESCONTO_MECANICO.Value / 100;
  wValor := wValor - QOficinaItemval_desc_mecanico.Value;
  QOficinaItemval_item.Value := wValor;

  QOficinaItem.AutoCalcFields := False;
  if (QOficinaItem.State in [DsEdit, DsInsert]) and (QOficinaItemQT_QUANTIDADE.Text <> '') and (QOficinaItemVAL_UNITARIO.Text <> '') then
    QOficinaItemVAL_TOTAL.Value := QOficinaItemQT_QUANTIDADE.Value * QOficinaItemVAL_UNITARIO.Value;
  QOficinaItem.AutoCalcFields := True;

  QOficinaItemval_desconto.Value := QOficinaItemval_desc_cliente.Value +
    QOficinaItemval_desc_venda.Value + QOficinaItemval_desc_mecanico.Value;
end;

procedure TDMOficina.QOficinaItemBeforeEdit(DataSet: TDataSet);
begin
  if not (QOficinaCad.State in [DsEdit, DsInsert]) then
    raise Exception.Create('OS não está em modo de alteração.');
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'A' then
    raise Exception.Create('Esta Ordem de Serviço já foi fechada ou cancelada.');
  QOficinaCad.Edit;
end;

procedure TDMOficina.QOficinaItemBeforeInsert(DataSet: TDataSet);
begin
  if not (QOficinaCad.State in [DsEdit, DsInsert]) then
    raise Exception.Create('OS não está em modo de alteração.');
  if DMOficina.QOficinaCadIND_SITUACAO.Value <> 'A' then
    raise Exception.Create('Esta Ordem de Serviço já foi fechada ou cancelada.');
  if QOficinaCad.State = DsInsert then
  begin
    QOficinaCad.Post;
    QOficinaCad.Edit;
  end;
end;

procedure TDMOficina.QOficinaConsAfterOpen(DataSet: TDataSet);
begin
  QOficinaItemCons.Close;
  QOficinaItemCons.open;
end;

procedure TDMOficina.QOficinaCadAfterOpen(DataSet: TDataSet);
begin
  QSomaItemOficina.Close;
  QSomaItemOficina.open;
end;

procedure TDMOficina.QOficinaCadAfterClose(DataSet: TDataSet);
begin
  QSomaItemOficina.Close;
end;

procedure TDMOficina.QOficinaItemAfterPost(DataSet: TDataSet);
begin
  QSomaItemOficina.Close;
  QSomaItemOficina.open;
end;

procedure TDMOficina.QOficinaCadAfterPost(DataSet: TDataSet);
begin
  QSomaItemOficina.Close;
  QSomaItemOficina.open;
end;

procedure TDMOficina.QOficinaItemBeforeDelete(DataSet: TDataSet);
begin
  if QOficinaCadIND_SITUACAO.Value <> 'A' then
    raise Exception.Create('Esta Ordem de Serviço já foi fechada ou cancelada.');
  if not (QOficinaCad.State in [DsEdit, DsInsert]) then
    raise Exception.Create('OS não está em modo de alteração.');
end;

procedure TDMOficina.QOficinaItemBeforePost(DataSet: TDataSet);
begin
  if QOficinaItemCOD_PRODUTO.Text = '' then
  begin
    QOficinaItem.Cancel;
    Exit;
  end;
  if QOficinaItemPERC_DESCONTO_CLIENTE.Text = '' then
    QOficinaItemPERC_DESCONTO_CLIENTE.Value := 0;
  if QOficinaItemPERC_DESCONTO_VENDA.Text = '' then
    QOficinaItemPERC_DESCONTO_VENDA.Value := 0;
  if QOficinaItemPERC_DESCONTO_MECANICO.Text = '' then
    QOficinaItemPERC_DESCONTO_MECANICO.Value := 0;
end;

procedure TDMOficina.QOficinaConsCalcFields(DataSet: TDataSet);
begin
  if QOficinaConsIND_SITUACAO.Value = 'F' then
    QOficinaConsdesc_situacao.Value := 'FECHADO';
  if QOficinaConsIND_SITUACAO.Value = 'A' then
    QOficinaConsdesc_situacao.Value := 'ABERTO';
  if QOficinaConsIND_SITUACAO.Value = 'C' then
    QOficinaConsdesc_situacao.Value := 'CANCELADO';
end;

procedure TDMOficina.QOficinaOrcamentoItemCalcFields(DataSet: TDataSet);
var
  wValor: Real;
begin
  if QOficinaOrcamentoItemCOD_PRODUTO.Text <> '' then
    QOficinaOrcamentoItemdesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + QOficinaOrcamentoItemCOD_PRODUTO.Text);
  QOficinaOrcamentoItem.AutoCalcFields := False;
  if (QOficinaOrcamentoItemQT_QUANTIDADE.Text <> '') and (QOficinaOrcamentoItemVAL_UNITARIO.Text <> '') then
  begin
    wValor := QOficinaOrcamentoItemQT_QUANTIDADE.Value * QOficinaOrcamentoItemVAL_UNITARIO.Value;
    QOficinaOrcamentoItemVAL_TOTAL.Value := wValor;
    wValor := wValor - (wValor * QOficinaOrcamentoItemPERC_DESCONTO.Value / 100);
    QOficinaOrcamentoItemval_item.Value := wValor;
  end;
  QOficinaOrcamentoItem.AutoCalcFields := True;
end;

procedure TDMOficina.QOficinaOrcamentoItemBeforeInsert(DataSet: TDataSet);
begin
  if QOficinaOrcamentoCad.State = DsInsert then
  begin
    QOficinaOrcamentoCad.Post;
    QOficinaOrcamentoCad.Edit;
  end
  else if not (QOficinaOrcamentoCad.State = DsEdit) then
    raise Exception.Create('Orçamento não está em modo de alteração');
end;

procedure TDMOficina.QOficinaOrcamentoItemBeforeEdit(DataSet: TDataSet);
begin
  if not (QOficinaOrcamentoCad.State in [DsEdit, DsInsert]) then
    raise Exception.Create('Orçamento não está em modo de alteração');
end;

procedure TDMOficina.QOficinaOrcamentoCadAfterInsert(DataSet: TDataSet);
begin
  QOficinaOrcamentoCadDT_ORCAMENTO.Value := Date;
  QOficinaOrcamentoCadVAL_DESCONTO_PECAS.Value := 0;
  QOficinaOrcamentoCadVAL_DESCONTO_SERVICOS.Value := 0;
  QOficinaOrcamentoCadIND_DESCRICAO_MARCA.Value := 'N';
  if DMUsuario.CodFilialUsuario > 0 then
    QOficinaOrcamentoCadCOD_FILIAL.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMOficina.QOficinaOrcamentoItemAfterInsert(DataSet: TDataSet);
begin
  QOficinaOrcamentoItemVAL_UNITARIO.Value := 0;
  QOficinaOrcamentoItemVAL_TOTAL.Value := 0;
  QOficinaOrcamentoItemval_item.Value := 0;
  QOficinaOrcamentoItemPERC_DESCONTO.Value := 0;
end;

procedure TDMOficina.QOficinaOrcamentoItemBeforeDelete(DataSet: TDataSet);
begin
  if not (QOficinaOrcamentoCad.State in [DsEdit, DsInsert]) then
    raise Exception.Create('Orçamento não está em modo de alteração');
end;

procedure TDMOficina.QSomaItemOficinaCalcFields(DataSet: TDataSet);
var
  valor: Real;
begin
  QSomaItemOficinasval_desc_mec.Value := QSomaItemOficinaSVAL_MEC_SERVICO.Value + QSomaItemOficinaSVAL_MEC_PRODUTO.Value;
  QSomaItemOficinasval_desc_produto.Value := QSomaItemOficinaSVAL_PRODUTO_BRUTO.Value - QSomaItemOficinaSVAL_PRODUTO.Value;
  QSomaItemOficinasval_desc_servico.Value := QSomaItemOficinaSVAL_SERVICO_BRUTO.Value - QSomaItemOficinaSVAL_SERVICO.Value;
  QSomaItemOficinadesc_mec_produto.Value := '';
  if QSomaItemOficinaSVAL_MEC_PRODUTO.Value > 0 then
    QSomaItemOficinadesc_mec_produto.Value := FormatFloat('#,##0.00', QSomaItemOficinaSVAL_MEC_PRODUTO.Value);
  QSomaItemOficinadesc_mec_servico.Value := '';
  if QSomaItemOficinaSVAL_MEC_SERVICO.Value > 0 then
    QSomaItemOficinadesc_mec_servico.Value := FormatFloat('#,##0.00', QSomaItemOficinaSVAL_MEC_SERVICO.Value);
  QSomaItemOficinadesc_cli_produto.Value := '';
  if QSomaItemOficinaSVAL_CLI_PRODUTO.Value > 0 then
    QSomaItemOficinadesc_cli_produto.Value := FormatFloat('#,##0.00', QSomaItemOficinaSVAL_CLI_PRODUTO.Value);
  QSomaItemOficinadesc_cli_servico.Value := '';
  if QSomaItemOficinaSVAL_CLI_SERVICO.Value > 0 then
    QSomaItemOficinadesc_cli_servico.Value := FormatFloat('#,##0.00', QSomaItemOficinaSVAL_CLI_SERVICO.Value);
  QSomaItemOficinadesc_ven_produto.Value := '';
  if QSomaItemOficinaSVAL_VEN_PRODUTO.Value > 0 then
    QSomaItemOficinadesc_ven_produto.Value := FormatFloat('#,##0.00', QSomaItemOficinaSVAL_VEN_PRODUTO.Value);
  QSomaItemOficinadesc_ven_servico.Value := '';
  if QSomaItemOficinaSVAL_VEN_SERVICO.Value > 0 then
    QSomaItemOficinadesc_ven_servico.Value := FormatFloat('#,##0.00', QSomaItemOficinaSVAL_VEN_SERVICO.Value);

  QSomaItemOficinadesc_ven.Value := '';
  valor := QSomaItemOficinaSVAL_VEN_SERVICO.Value + QSomaItemOficinaSVAL_VEN_PRODUTO.Value;
  if valor > 0 then
    QSomaItemOficinadesc_ven.Value := FormatFloat('#,##0.00', valor);
  QSomaItemOficinadesc_cli.Value := '';
  valor := QSomaItemOficinaSVAL_CLI_SERVICO.Value + QSomaItemOficinaSVAL_CLI_PRODUTO.Value;
  if valor > 0 then
    QSomaItemOficinadesc_cli.Value := FormatFloat('#,##0.00', valor);
  QSomaItemOficinadesc_mec.Value := '';
  valor := QSomaItemOficinaSVAL_MEC_SERVICO.Value + QSomaItemOficinaSVAL_MEC_PRODUTO.Value;
  if valor > 0 then
    QSomaItemOficinadesc_mec.Value := FormatFloat('#,##0.00', valor);
end;

procedure TDMOficina.QOficinaOrcamentoCadAfterOpen(DataSet: TDataSet);
begin
  QSomaItemOrcamento.Close;
  QSomaItemOrcamento.Open;
end;

procedure TDMOficina.QOficinaOrcamentoItemAfterPost(DataSet: TDataSet);
begin
  QSomaItemOrcamento.Close;
  QSomaItemOrcamento.Open;
end;

procedure TDMOficina.QOficinaOrcamentoItemBeforePost(DataSet: TDataSet);
begin
  if QOficinaOrcamentoItemCOD_PRODUTO.IsNull then
    QOficinaOrcamentoItem.Cancel;
end;

procedure TDMOficina.QOficinaItemNUM_FABRICANTEChange(Sender: TField);
var
  wAux: string;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
  begin
    QOficinaItem.AutoCalcFields := False;
    if QOficinaItemNUM_FABRICANTE.Value <> '' then
    begin
      wAux := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
        'NUM_FABRICANTE LIKE ' + QuotedStr(QOficinaItemNUM_FABRICANTE.Value + '%'));
      if wAux <> QOficinaItemCOD_PRODUTO.Text then
        QOficinaItemCOD_PRODUTO.Value := StrToInt('0' + wAux);
    end;
    QOficinaItem.AutoCalcFields := True;
  end;
end;

procedure TDMOficina.QOficinaItemCOD_PRODUTOChange(Sender: TField);
var
  wAux: string;
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INJEPAR' then
  begin
    QOficinaItem.AutoCalcFields := False;
    if QOficinaItemCOD_PRODUTO.Value > 0 then
    begin
      wAux := DMOracle.BuscaNome('SELECT NUM_FABRICANTE FROM TB_PRODUTO',
        'COD_PRODUTO = ' + QOficinaItemCOD_PRODUTO.Text);
      if wAux <> QOficinaItemNUM_FABRICANTE.Value then
        QOficinaItemNUM_FABRICANTE.Value := wAux;

      if QOficinaCadCOD_MARCA.Value > 0 then
      begin
        QOficinaItemQT_QUANTIDADE.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM ' +
          'TB_PRODUTO_MARCA', 'COD_PRODUTO = ' + QOficinaItemCOD_PRODUTO.Text + ' AND COD_MARCA = ' +
          QOficinaCadCOD_MARCA.Text));

      // TIRADO DO ONEXIT DO DBECODPRODUTO
        wAux := DMOracle.BuscaNome('SELECT VAL_PRODUTO_MARCA FROM TB_PRODUTO_MARCA',
          'COD_PRODUTO = ' + QOficinaItemCOD_PRODUTO.Text +
          'AND COD_MARCA = ' + QOficinaCadCOD_MARCA.Text);
        if wAux <> '' then
          QOficinaItemVAL_UNITARIO.Value := StrToFloat(wAux);
      end;
      wAux := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO',
        'COD_PRODUTO = ' + QOficinaItemCOD_PRODUTO.Text, True);
      QOficinaItemPERC_DESCONTO_CLIENTE.Value := 0;
      if wAux = 'SERVIÇO' then
        wAux := DMOracle.BuscaNome('SELECT PERC_META FROM TB_CADASTRO', 'COD_CADASTRO = ' + QOficinaCadCOD_CADASTRO.Text)
      else
        wAux := DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QOficinaCadCOD_CADASTRO.Text);
      if wAux <> '' then
        QOficinaItemPERC_DESCONTO_CLIENTE.Value := StrToFloat(wAux);

      wAux := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO',
        'COD_PRODUTO = ' + QOficinaItemCOD_PRODUTO.Text, True);
      if (wAux = 'SERVIÇO') then
        wAux := DMOracle.BuscaNome('SELECT PERC_ESPECIAL_SERVICO FROM TB_CADASTRO', 'COD_CADASTRO = ' + QOficinaCadCOD_CADASTRO.Text)
      else
        wAux := DMOracle.BuscaNome('SELECT PERC_ESPECIAL_PECA FROM TB_CADASTRO', 'COD_CADASTRO = ' + QOficinaCadCOD_CADASTRO.Text);
      if wAux > '0' then
        QOficinaItemPERC_DESCONTO_MECANICO.Value := StrToFloat(wAux);
      // FIM DO ONEXIT
    end;
    QOficinaItem.AutoCalcFields := True;

  end;
end;

procedure TDMOficina.QOficinaOrcamentoCadCOD_CADASTROChange(
  Sender: TField);
begin
  if (QOficinaOrcamentoCadCOD_CADASTRO.Text <> '') then
    QOficinaOrcamentoCadDESC_CADASTRO.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
      'COD_CADASTRO = ' + QOficinaOrcamentoCadCOD_CADASTRO.Text);
end;

procedure TDMOficina.QOficinaOrcamentoCadCOD_VEICULOChange(Sender: TField);
begin
  if (QOficinaOrcamentoCadCOD_VEICULO.Text <> '') then
    QOficinaOrcamentoCadDESC_VEICULO.Value := DMOracle.BuscaNome('SELECT NUM_PLACA FROM TB_VEICULO',
      'COD_VEICULO = ' + QOficinaOrcamentoCadCOD_VEICULO.Text);
end;

procedure TDMOficina.QOficinaCadCOD_CADASTROChange(Sender: TField);
var
  wAux: string;
begin
  if QOficinaCadCOD_CADASTRO.Text <> '' then
  begin
    wAux := DMOracle.BuscaNome('SELECT COD_VENDEDOR FROM TB_CADASTRO', 'COD_CADASTRO = '
      + QOficinaCadCOD_CADASTRO.Text, True);
    if wAux > '0' then
      QOficinaCadCOD_VENDEDOR.Value := StrToInt(wAux);
  end;
end;

procedure TDMOficina.QOficinaCadBeforePost(DataSet: TDataSet);
begin
  if QOficinaCadCOD_SERIE.Value = '' then
    raise Exception.Create('Por favor, informe a série.');
end;

procedure TDMOficina.QOficinaItemAfterInsert(DataSet: TDataSet);
var
  wAux: string;
begin
  if QOficinaCadCOD_VENDEDOR.Text <> '' then
  begin
    wAux := DMOracle.BuscaNome('SELECT PERC_COMISSAO1 FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + QOficinaCadCOD_VENDEDOR.Text);
    if (wAux > '0') then
      QOficinaItemPERC_COMISSAO.Value := StrToFloat(wAux);
  end;
end;

procedure TDMOficina.QOficinaCadCOD_MARCAChange(Sender: TField);
begin
  if QOficinaCadCOD_MARCA.Value > 0 then
    QOficinaCadDESC_COMPL_MARCA.Value := DMOracle.BuscaNome('SELECT DESC_MOTOR FROM TB_MARCA',
      'COD_MARCA = ' + QOficinaCadCOD_MARCA.Text, true);
end;

procedure TDMOficina.QOficinaOrcamentoCadCOD_MARCAChange(Sender: TField);
begin
  if QOficinaOrcamentoCadCOD_MARCA.Value > 0 then
    QOficinaOrcamentoCadDESC_COMPL_MARCA.Value := DMOracle.BuscaNome('SELECT DESC_MOTOR FROM TB_MARCA',
      'COD_MARCA = ' + QOficinaOrcamentoCadCOD_MARCA.Text);
end;

procedure TDMOficina.QOficinaOrcamentoItemCOD_PRODUTOChange(Sender: TField);
begin
  if (QOficinaOrcamentoItemCOD_PRODUTO.Value > 0) and (QOficinaOrcamentoCadCOD_MARCA.Value > 0) then
  begin
    QOficinaOrcamentoItemQT_QUANTIDADE.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM ' +
      'TB_PRODUTO_MARCA', 'COD_PRODUTO = ' + QOficinaOrcamentoItemCOD_PRODUTO.Text + ' AND COD_MARCA = ' +
      QOficinaOrcamentoCadCOD_MARCA.Text, True));
    QOficinaOrcamentoItemVAL_UNITARIO.Value := StrToFloat('0' + DMOracle.BuscaNome('SELECT VAL_PRODUTO_MARCA FROM ' +
      'TB_PRODUTO_MARCA', 'COD_PRODUTO = ' + QOficinaOrcamentoItemCOD_PRODUTO.Text + ' AND COD_MARCA = ' +
      QOficinaOrcamentoCadCOD_MARCA.Text, True));
  end;
end;

procedure TDMOficina.QMecanicoCadAfterOpen(DataSet: TDataSet);
begin
  DMOficina.QMecanicoComissaoCad.Close;
  DMOficina.QMecanicoComissaoCad.Open;
end;

procedure TDMOficina.QMecanicoComissaoCadCalcFields(DataSet: TDataSet);
begin
  if QMecanicoComissaoCadCOD_COMISSAO.Value > 0 then
    QMecanicoComissaoCaddesc_comissao.Value := DMOracle.BuscaNome('SELECT COD_COMISSAO || ' +
      QuotedStr(' - ') + ' || DESC_COMISSAO FROM TB_COMISSAO',
      'COD_COMISSAO = ' + QMecanicoComissaoCadCOD_COMISSAO.Text);
end;

procedure TDMOficina.QMecanicoComissaoCadBeforeDelete(DataSet: TDataSet);
begin
  QMecanicoCad.Edit;
end;

procedure TDMOficina.QMecanicoComissaoCadBeforeEdit(DataSet: TDataSet);
begin
  QMecanicoCad.Edit;
end;

procedure TDMOficina.QMecanicoComissaoCadBeforeInsert(DataSet: TDataSet);
begin
  if QMecanicoCad.State = DsInsert then
    QMecanicoCad.Post;
  QMecanicoCad.Edit;
end;

procedure TDMOficina.QRequisicao_itemAfterInsert(DataSet: TDataSet);
var
  wCom: Integer;
  wVendedor: String;
begin
  wQtdeItemAntesDaEdicao := 0; //a cada post da QRequisicao_item o estoque é atualizado novamente. O campo wQtdeItemAntesDaEdicao recebe a quantidade que o item tinha antes de ele ser editado, para na hora da atualização do estoque descontar esse valor, no caso de uma inserção 0(zero). Alesandro 10/08/12
  DataSet.FieldByName('COD_FILIAL').Value := 1;
//  DataSet.FieldByName('QT_QUANTIDADE').Value := 1;
  DataSet.FieldByName('VAL_UNITARIO').Value := 0;
  if DMUsuario.CodVendedorPadrao <> 0 then
    QRequisicao_itemCOD_VENDEDOR.Value := DMUsuario.CodVendedorPadrao;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    with DataSet do
    begin
      wCom := 0;
      if DataSet = QRequisicao_itemServico then
      begin
        FieldByName('NUM_FABRICANTE').Value := '00'; // Serviço padrão na AgroNews.
        FieldByName('QT_QUANTIDADE').Value := 0;
        DMParamSistema.QParamSistema.RefreshRecord;
        FieldByName('VAL_UNITARIO').Value := Bib.ift(DMOracle.FastSelect('IND_CAMPO_OFICINA', 'TB_OS',
            'NUM_OS = ' + QRequisicaoCadNUM_OS.Text) = 'C', DMParamSistema.QParamSistemaVAL_HORA_CAMPO.Value,
            DMParamSistema.QParamSistemaVAL_HORA_OFICINA.Value);
        wCom := StrToInt('0' + DMOracle.FastSelect('T.COD_COMISSAO', 'TB_OS_TIPO T, TB_OS O',
            'O.IND_TIPO_OS = T.COD_OS_TIPO AND O.NUM_OS = ' + QRequisicaoCadNUM_OS.Text));
      end
      else if DataSet = QRequisicao_item then
      begin
        wCom := StrToInt('0' + DMOracle.FastSelect('T.COD_COMISSAO_PECA', 'TB_OS_TIPO T, TB_OS O',
            'O.IND_TIPO_OS = T.COD_OS_TIPO AND O.NUM_OS = ' + QRequisicaoCadNUM_OS.Text));
      end
      else if DataSet = QRequisicao_itemVeiculo then
      begin
        FieldByName('IND_VEICULO').Value := 'S';
        FieldByName('NUM_FABRICANTE').Value := '10'; // Produto "Gasto com Veiculo"
        FieldByName('QT_QUANTIDADE').Value := 0;
        FieldByName('DT_REQUISICAO_ITEM').Value := Date;
        if FieldByName('COD_PRODUTO').Value > 0 then
        begin
          FieldByName('DESC_REQUISICAO_ITEM').Value := DMOracle.FastSelect('DESC_PRODUTO',
              'TB_PRODUTO', 'COD_PRODUTO = ' + FieldByName('COD_PRODUTO').Text);
          FieldByName('VAL_UNITARIO').Value := DMOracle.FastSelect('VAL_VAREJO',
              'TB_PRODUTO', 'COD_PRODUTO = ' + FieldByName('COD_PRODUTO').Text);
        end;
      end;
      if wCom > 0 then
        FieldByName('COD_COMISSAO').Value := wCom;
      FieldByName('COD_VENDEDOR').Value := DMUsuario.CodVendedorPadrao;
    end;
end;

procedure TDMOficina.QRequisicao_itemServicoNUM_FABRICANTEChange(
  Sender: TField);
var
  wCodproduto, wVlrUnitario: string;
begin
//  QRequisicao_itemServicoCOD_PRODUTO.Value := 0;
  Sender.DataSet.FieldByName('COD_PRODUTO').Value := 0;
  if not Sender.IsNull then
  begin
    wCodProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO',
        'NUM_FABRICANTE = ' + chr(39) + Sender.Value + chr(39));
    if Trim(wCodProduto) <> '' then
      Sender.DataSet.FieldByName('COD_PRODUTO').Value := StrToInt(wCodProduto)
    else
      raise exception.Create('Código do produto invalido!');
  end;

  if DMOficina.QRequisicao_itemServicoCOD_PRODUTO.Value <> 0 then
  begin
    wVlrUnitario := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO',
        'COD_PRODUTO = ' + FloatToStr(QRequisicao_itemServicoCOD_PRODUTO.Value));
    if Trim(wVlrUnitario) <> '' then
      QRequisicao_itemServicoVAL_UNITARIO.Value := StrToFloat(wVlrUnitario);
  end;
end;

procedure TDMOficina.QRequisicao_itemBeforeEdit(DataSet: TDataSet);
begin
  if QRequisicaoCad.State = DsBrowse then
    QRequisicaoCad.Edit;
  wQtdeItemAntesDaEdicao := QRequisicao_itemQT_QUANTIDADE.Value;
end;

procedure TDMOficina.QOSMarcacaoDT_INICIOChange(Sender: TField);
begin
  if not Sender.IsNull then
    if FormatDateTime('yyyy', Sender.Value) <> FormatDateTime('yyyy', Date) then
      Sender.Value := StrToDateTime(FormatDateTime('dd/mm/yyyy', QOSMarcacaoDT_LANCAMENTO.Value) + ' ' +
          FormatDateTime('hh:nn', Sender.Value) + ':00')
    else
    begin
      if Sender.FieldName = 'DT_INICIO' then
        QOSMarcacaoHR_INICIO.Value := StrToFloat(FormatDateTime('h,n', Sender.Value))
      else if Sender.FieldName = 'DT_FIM' then
        QOSMarcacaoHR_FINAL.Value := StrToFloat(FormatDateTime('h,n', Sender.Value));
    end;
end;

procedure TDMOficina.QOSMarcacaoConsCalcFields(DataSet: TDataSet);
begin
  if QOSMarcacaoConsIND_SITUACAO.Value = 'F' then
    QOSMarcacaoConsdesc_situacao.Value := 'FECHADA'
  else
    QOSMarcacaoConsdesc_situacao.Value := 'ABERTA';
end;

procedure TDMOficina.ClearVariablesAfterClose(DataSet: TDataSet);
begin
  if DataSet is TOracleDataSet then
    TOracleDataSet(DataSet).ClearVariables;
end;

procedure TDMOficina.QOSMarcacaoBeforePost(DataSet: TDataSet);
begin
  if DMOracle.FastSelect('IND_SITUACAO', 'TB_OS', 'NUM_OS = ' + QOSMarcacaoNUM_OS.Text) = 'F' then
    Raise Exception.Create('OS já está fechada.');
end;

procedure TDMOficina.QRequisicaoCadAfterOpen(DataSet: TDataSet);
begin
  QRequisicao_item.Open;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    QRequisicao_itemServico.Open;
    QRequisicao_itemVeiculo.Open;
  end;
end;

procedure TDMOficina.QRequisicaoCadAfterClose(DataSet: TDataSet);
begin
  QRequisicao_item.Close;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    QRequisicao_itemServico.Close;
    QRequisicao_itemVeiculo.Close;
  end;
end;

procedure TDMOficina.QRequisicao_itemVeiculoNUM_KM_SAIDAChange(
  Sender: TField);
begin
  if (QRequisicao_itemVeiculoNUM_KM_SAIDA.Value > 0) and (QRequisicao_itemVeiculoNUM_KM_CHEGADA.Value > 0) then
    QRequisicao_itemVeiculoQT_QUANTIDADE.Value := QRequisicao_itemVeiculoNUM_KM_CHEGADA.Value -
        QRequisicao_itemVeiculoNUM_KM_SAIDA.Value;
end;

procedure TDMOficina.QMecanicoCadBeforeDelete(DataSet: TDataSet);
begin
  QMecanicoComissaoCad.First;
  while not QMecanicoComissaoCad.Eof do
    QMecanicoComissaoCad.Delete;
end;

procedure TDMOficina.DataModuleCreate(Sender: TObject);
begin
  Buscador := TBuscador.Create();
end;

procedure TDMOficina.QRequisicaoCadBeforeEdit(DataSet: TDataSet);
var
  mSituacao: string;
begin
  mSituacao := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_OS', 'NUM_OS = ' + QRequisicaoCadNUM_OS.AsString);
  if Trim(mSituacao) = 'F' then
    raise exception.Create('O.S. já foi fechada, impossivel editar requisição!');
end;

procedure TDMOficina.QRequisicaoCad2CalcFields(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    if QRequisicaoCad2NUM_OS.Value > 0 then
    begin
      QRequisicaoCad2desc_cadastro_os.Value :=
      BuscaNome('SELECT C.NOME FROM TB_OS OS INNER JOIN TB_CADASTRO C '+
        'ON C.COD_CADASTRO = OS.COD_CADASTRO ', 'OS.NUM_OS = ' +
        QRequisicaoCad2NUM_OS.Text);
    end;
  end;
end;

procedure TDMOficina.QRequisicao_item2CalcFields(DataSet: TDataSet);
begin
  with DMOracle do
  begin
    if QRequisicao_item2COD_PRODUTO.Value > 0 then
    begin
      QRequisicao_item2desc_produto.Value :=
        BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
          'COD_PRODUTO = ' + QRequisicao_item2COD_PRODUTO.Text);
    end;
    if (QRequisicao_item2QT_QUANTIDADE.Value > 0) and
      (QRequisicao_item2VAL_UNITARIO.Value > 0) then
      QRequisicao_item2val_total.Value :=
      (QRequisicao_item2QT_QUANTIDADE.Value *
      QRequisicao_item2VAL_UNITARIO.Value)
    else
      QRequisicao_item2val_total.Value := 0;
  end;
end;

procedure TDMOficina.QRequisicaoCad2AfterInsert(DataSet: TDataSet);
begin
  QRequisicaoCad2DT_EMISSAO.Value :=
    DMOracle.DataServ;
  QRequisicaoCad2IND_SITUACAO.Value := 'A';
end;

procedure TDMOficina.QRequisicao_item2AfterInsert(DataSet: TDataSet);
begin
  QRequisicao_item2COD_FILIAL.Value :=
    1;
  if DMUsuario.CodVendedorPadrao <> 0 then
    QRequisicao_item2COD_VENDEDOR.Value := DMUsuario.CodVendedorPadrao;
  QRequisicao_item2DT_REQUISICAO_ITEM.Value :=
    DMOracle.DataServ;
end;

procedure TDMOficina.AtualizaEstoqueOficina(pOperacao: String);
var wQt: String;
exec: TExecutador;
begin
  if (wFilial = '') or (wQuantidade = '') or (wProduto = '') then
  begin
    MessageDlg('Parâmetros não informados para atualizar estoque',
      mtError, [mbOk], 0);
    Abort;
  end;
  if UpperCase(Trim(pOperacao)) = 'DIMINUIR' then
    wQt := '-' + wQuantidade
  else
    if UpperCase(Trim(pOperacao)) = 'SOMAR' then
      wQt := '+' + wQuantidade
    else
    begin
      MessageDlg('Operação incorreta', mtError, [mbOk],0);
      Abort;
    end;
    with DMOracle do
    begin
      DBCemapa.StartTransaction;
      try
        exec := TExecutador.Create;
        exec.Adiciona('UPDATE TB_ESTOQUE SET QT_QUANTIDADE = (QT_QUANTIDADE' +
          wQt + ')' +
          ' WHERE COD_PRODUTO = ' + wProduto +
          ' AND COD_FILIAL = ' + wFilial +
          ' AND COD_LOTE_TIPO = 1');
        exec.Executar(true,false);
        exec.Limpa;
        exec.Fecha;
        exec.Free;
        exec := Nil;
        wFilial := '';
        wProduto := '';
        wQuantidade := '';
      DBCemapa.Commit;
      calculaTotalRequisicao2;
      Except
      on e: Exception do
      begin
        DBCemapa.Rollback;
        MessageDlg('Erro ao atualizar estoque'+#13+#10+
        e.Message, mtError, [mbOk], 0);
        Abort;
      end;
    end;
  end;
end;

procedure TDMOficina.AtualizaValorItemReq(pReqItem: String; pValor: String);
var exec: TExecutador;
begin
  if (pReqItem = '') or (pValor = '') then
  begin
    MessageDlg('Parâmetros não informados para atualizar Valor',
      mtError, [mbOk], 0);
    Abort;
  end;

  with DMOracle do
  begin
    pValor := bib.TrocaVirgulaPorPonto(pValor);
    DBCemapa.StartTransaction;
    try
      exec := TExecutador.Create;
      exec.Adiciona('UPDATE TB_REQUISICAO_ITEM SET VAL_UNITARIO = ' +
        pValor + ', IND_DESCONTO = ' + quotedStr('S') +
        ' WHERE COD_REQUISICAO_ITEM = ' + pReqItem);
      exec.Executar(true,false);
      exec.Limpa;
      exec.Fecha;
      exec.Free;
      exec := Nil;
    DBCemapa.Commit;
    calculaTotalRequisicao2;
    Except
      on e: Exception do
      begin
        DBCemapa.Rollback;
        MessageDlg('Erro ao atualizar valor unitário'+#13+#10+
        e.Message, mtError, [mbOk], 0);
        Abort;
      end;
    end;
  end;
end;

procedure TDMOficina.QRequisicao_item2BeforePost(DataSet: TDataSet);
var wEstoque, wVl_Custo: String;
begin
  //Validações
  if QRequisicao_item2COD_MECANICO.IsNull then
  begin
    MessageDlg('Mecânico obrigatório.', mtError, [mbOk],0);
    Abort
  end;
  if QRequisicao_item2COD_VENDEDOR.IsNull then
  begin
    MessageDlg('Vendedor obrigatório.', mtError, [mbOk],0);
    Abort
  end;
  wEstoque := DMOracle.BuscaNome('SELECT NVL(QT_QUANTIDADE,0) FROM TB_ESTOQUE', 'COD_PRODUTO = ' +
        QRequisicao_item2COD_PRODUTO.Text + ' AND COD_LOTE_TIPO = 1 AND COD_FILIAL = ' +
        QRequisicao_item2COD_FILIAL.Text);
  if wEstoque = '0' then
  begin
    MessageDlg('Produto sem estoque.', mtError, [mbOk],0);
    Abort
  end;
  if (StrToFloat(wEstoque) - QRequisicao_item2QT_QUANTIDADE.Value) < 0 then
  begin
    MessageDlg('Quantidade solicitada maior que quantidade em estoque!',
      mtError, [mbOk],0);
    Abort;
  end;
  //Atualiza o custo
  wVl_Custo := DMOracle.BuscaNome('SELECT NVL(VL_ULTIMO_CUSTO,0) FROM TB_ESTOQUE', 'COD_PRODUTO = ' +
      QRequisicao_item2COD_PRODUTO.Text + ' AND COD_LOTE_TIPO = 1 AND COD_FILIAL = ' +
      QRequisicao_item2COD_FILIAL.Text);

  if (wVl_Custo <> '0') then
    QRequisicao_item2VAL_CUSTO.Text := wVl_Custo
  else
  begin
    MessageDlg('Não é possivel vender peça com Custo Zero.', mtError, [mbOk],0);
    Abort;
  end;
  //Atualiza os parâmetros para movimentação de estoque
  wFilial := QRequisicao_item2COD_FILIAL.Text;
  wProduto := QRequisicao_item2COD_PRODUTO.Text;
  wQuantidade := QRequisicao_item2QT_QUANTIDADE.Text;
end;

procedure TDMOficina.QRequisicao_item2AfterPost(DataSet: TDataSet);
begin
  AtualizaEstoqueOficina('DIMINUIR');
  QRequisicaoCad2.RefreshRecord;
  QRequisicao_item2.RefreshRecord;
  if QRequisicaoCad2.State = DSBrowse then
    QRequisicaoCad2.Edit;

  //Vanessa 03/08/2016
  wLimiteMaximo := DMOracle.BuscaNome('SELECT VAL_LIMITE_REQUISICAO FROM TB_OS','NUM_OS = ' + DMOficina.QRequisicaoCad2NUM_OS.Text);
  if QRequisicaoCad2VAL_TOTAL.Value > strtofloat(wLimiteMaximo) then
  begin
    MessageDlg('Limite máximo da OS excedido. O máximo é de R$ ' + wLimiteMaximo + '.', mtWarning, [mbOk],0);
  end;

end;

procedure TDMOficina.QRequisicao_item2AfterDelete(DataSet: TDataSet);
begin
  AtualizaEstoqueOficina('SOMAR');
  QRequisicaoCad2.RefreshRecord;
  QRequisicao_item2.RefreshRecord;
  if QRequisicaoCad2.State = DSBrowse then
    QRequisicaoCad2.Edit;
end;

procedure TDMOficina.QRequisicao_item2BeforeDelete(DataSet: TDataSet);
begin
  //Bloqueio de Requisição. Solicitação Raquel-Medibens. Junior 09/07/2015
  if DMOracle.FastSelect('IND_LIBERADO','TB_REQUISICAO','NUM_REQUISICAO = ' + DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text) = 'S' THEN
  begin
    //Atualiza os parâmetros para movimentação de estoque
    wFilial := QRequisicao_item2COD_FILIAL.Text;
    wProduto := QRequisicao_item2COD_PRODUTO.Text;
    wQuantidade := QRequisicao_item2QT_QUANTIDADE.Text;
  end
  else
    raise Exception.Create('REQUISIÇÃO BLOQUEADA');
end;

procedure TDMOficina.QRequisicao_item2BeforeInsert(DataSet: TDataSet);
begin
  //Bloqueio de Requisição. Solicitação Raquel-Medibens. Junior 09/07/2015
  if DMOracle.FastSelect('IND_LIBERADO','TB_REQUISICAO','NUM_REQUISICAO = ' + DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text) <> 'N' THEN
  begin
    if QRequisicaoCad2.State in [DSInsert, DSEdit] then
    begin
      QRequisicaoCad2.Post;
      QRequisicaoCad2.RefreshRecord;
      QRequisicaoCad2.Edit;
    end;
  end
  else
   raise Exception.Create('REQUISIÇÃO BLOQUEADA');
end;

end.

