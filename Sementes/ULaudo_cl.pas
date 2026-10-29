unit ULaudo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMLaudo = class(TDataModule)
    QLaudoFloracao: TOracleDataSet1;
    QLaudoFloracaoCOD_LAUDO_FLORACAO_CAB: TIntegerField;
    QLaudoFloracaoCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QLaudoFloracaoDT_INSPECAO: TDateTimeField;
    QLaudoFloracaoVAL_AREA_TOTAL: TFloatField;
    QLaudoFloracaoVAL_DENSIDADE_CULTURA: TFloatField;
    QLaudoFloracaoDT_PLANTIO_TERMINO: TDateTimeField;
    QLaudoFloracaoDT_PREVISAO_COLHEITA: TDateTimeField;
    QLaudoFloracaoVAL_AREA_APROVADA: TFloatField;
    QLaudoFloracaoDESC_DANINHA_PROIBIDA: TStringField;
    QLaudoFloracaoDESC_DANINHA_TOLERADA: TStringField;
    QLaudoFloracaoDESC_OUTRO_CULTIVAR: TStringField;
    QLaudoFloracaoPERC_CULTIVAR_CICLO: TIntegerField;
    QLaudoFloracaoPERC_CULTIVAR_CICLO_DIFERENTE: TIntegerField;
    QLaudoFloracaonum_campo: TIntegerField;
    QLaudoFloracaoItem: TOracleDataSet1;
    QLaudoFloracaoItemCOD_LAUDO_FLORACAO_ITEM: TIntegerField;
    QLaudoFloracaoItemCOD_LAUDO_FLORACAO_CAB: TIntegerField;
    QLaudoFloracaoItemCOD_PRAGA: TIntegerField;
    QLaudoFloracaoItemDESC_PROD_TRAT_PRAGA: TStringField;
    QLaudoFloracaoItemDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QLaudoFloracaoItemDESC_EPOCA_PRAGA: TStringField;
    QLaudoFloracaoItemDESC_PROD_TRAT_DOENCA: TStringField;
    QLaudoFloracaoItemDESC_EPOCA_DOENCA: TStringField;
    QLaudoFloracaoItemDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    DSExibeItem: TDataSource;
    QExibeItem: TOracleDataSet1;
    QExibeItemDESC_PRAGA: TStringField;
    QExibeItemDESC_PROD_TRAT_PRAGA: TStringField;
    QExibeItemDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QExibeItemDESC_EPOCA_PRAGA: TStringField;
    QExibeItemDESC_DOENCA: TStringField;
    QExibeItemDESC_PROD_TRAT_DOENCA: TStringField;
    QExibeItemDESC_EPOCA_DOENCA: TStringField;
    QExibeItemDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    DSLaudoFloracaoItem: TDataSource;
    QLaudoFloracaoCons: TOracleDataSet1;
    QLaudoFloracaoCOD_PLANTIO_SAFRA: TIntegerField;
    QLaudoFloracaodesc_safra: TStringField;
    QLaudoFloracaoConsNUM_LAUDO_FLORACAO: TIntegerField;
    QLaudoFloracaoConsDESC_SAFRA: TStringField;
    QLaudoFloracaoConsNOME: TStringField;
    QLaudoFloracaoConsCOD_LAUDO_FLORACAO_CAB: TIntegerField;
    QLaudoFloracaoItemCons: TOracleDataSet1;
    QLaudoFloracaoItemConsCOD_LAUDO_FLORACAO_ITEM: TIntegerField;
    QLaudoFloracaoItemConsDESC_DOENCA: TStringField;
    QLaudoFloracaoItemConsDESC_PRAGA: TStringField;
    QLaudoFloracaoItemConsDESC_SAFRA: TStringField;
    QLaudoFloracaoItemConsNUM_CAMPO_PLANTIO: TIntegerField;
    QLaudoFloracaoItemConsNOME: TStringField;
    QLaudoPreColheita: TOracleDataSet1;
    QLaudoPreColheitaCOD_LAUDO_PRE_COLHEITA_CAB: TIntegerField;
    QLaudoPreColheitaCOD_LAUDO_FLORACAO_CAB: TIntegerField;
    QLaudoPreColheitaDT_INSPECAO: TDateTimeField;
    QLaudoPreColheitaVAL_AREA_APROVADA: TFloatField;
    QLaudoPreColheitaNUM_LAUDO_PRE_COLHEITA: TIntegerField;
    QLaudoPreColheitanum_laudo: TIntegerField;
    QLaudoPreColheitaItem: TOracleDataSet1;
    QLaudoPreColheitaItemCOD_LAUDO_PRE_COLHEITA_ITEM: TIntegerField;
    QLaudoPreColheitaItemCOD_LAUDO_PRE_COLHEITA_CAB: TIntegerField;
    QLaudoPreColheitaItemCOD_PRAGA: TIntegerField;
    QLaudoPreColheitaItemDESC_PROD_TRAT_PRAGA: TStringField;
    QLaudoPreColheitaItemDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QLaudoPreColheitaItemDESC_EPOCA_PRAGA: TStringField;
    QLaudoPreColheitaItemDESC_PROD_TRAT_DOENCA: TStringField;
    QLaudoPreColheitaItemDESC_EPOCA_DOENCA: TStringField;
    QLaudoPreColheitaItemdesc_praga: TStringField;
    QLaudoPreColheitaItemDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    DSLaudoPreColheitaItem: TDataSource;
    QLaudoPreColheitaCOD_PLANTIO_SAFRA: TIntegerField;
    QExibeItemPreColheita: TOracleDataSet1;
    DSExibeItemPreColheita: TDataSource;
    QLaudoFloracaoConsVAL_AREA_APROVADA: TFloatField;
    QLaudoPreColheitaCons: TOracleDataSet1;
    QLaudoPreColheitaConsCOD_LAUDO_PRE_COLHEITA_CAB: TIntegerField;
    QLaudoPreColheitaConsCOD_LAUDO_FLORACAO_CAB: TIntegerField;
    QLaudoPreColheitaConsDT_INSPECAO: TDateTimeField;
    QLaudoPreColheitaConsVAL_AREA_APROVADA: TFloatField;
    QLaudoPreColheitaConsNUM_LAUDO_PRE_COLHEITA: TIntegerField;
    QLaudoPreColheitaConsCOD_PLANTIO_SAFRA: TIntegerField;
    QLaudoPreColheitaConsDESC_SAFRA: TStringField;
    QRLaudoFloracao: TOracleDataSet1;
    QRLaudoPreColheita: TOracleDataSet1;
    QLaudoFloracaoNUM_LAUDO_FLORACAO: TIntegerField;
    QRLaudoFloracaoDoenca: TOracleDataSet1;
    QRLaudoFloracaoDoencaDESC_PROD_TRAT_DOENCA: TStringField;
    QRLaudoFloracaoDoencaDESC_EPOCA_DOENCA: TStringField;
    QRLaudoFloracaoDoencaDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    QRLaudoFloracaoNUM_LAUDO_FLORACAO: TIntegerField;
    QRLaudoFloracaoDT_INSPECAO: TDateTimeField;
    QRLaudoFloracaoVAL_AREA_TOTAL: TFloatField;
    QRLaudoFloracaoDT_PLANTIO_TERMINO: TDateTimeField;
    QRLaudoFloracaoPERC_CULTIVAR_CICLO: TIntegerField;
    QRLaudoFloracaoPERC_CULTIVAR_CICLO_DIFERENTE: TIntegerField;
    QRLaudoFloracaoDESC_OUTRO_CULTIVAR: TStringField;
    QRLaudoFloracaoDESC_DANINHA_PROIBIDA: TStringField;
    QRLaudoFloracaoDESC_DANINHA_TOLERADA: TStringField;
    QRLaudoFloracaoVAL_AREA_APROVADA: TFloatField;
    QRLaudoFloracaoVAL_DENSIDADE_CULTURA: TFloatField;
    QRLaudoFloracaoDT_PREVISAO_COLHEITA: TDateTimeField;
    QRLaudoFloracaoDESC_CULTURA: TStringField;
    QRLaudoFloracaoDESC_COMPLEMENTO_2: TStringField;
    QRLaudoFloracaoDESC_SAFRA: TStringField;
    QRLaudoFloracaoNOME: TStringField;
    QRLaudoFloracaoDESC_CIDADE: TStringField;
    QRLaudoFloracaoDESC_ENDERECO: TStringField;
    QRLaudoFloracaoAREA_CAMPO: TFloatField;
    QRLaudoFloracaoDT_INICIO_PLANTIO: TDateTimeField;
    QRLaudoFloracaoNUM_CAMPO_PLANTIO: TIntegerField;
    QRLaudoFloracaoDESC_FILIAL: TStringField;
    QRLaudoFloracaoENDERECO_FILIAL: TStringField;
    QRLaudoFloracaoCIDADE_FILIAL: TStringField;
    QRLaudoFloracaoESTADO_FILIAL: TStringField;
    QRLaudoFloracaoPraga: TOracleDataSet1;
    QRLaudoFloracaoPragaDESC_PROD_TRAT_PRAGA: TStringField;
    QRLaudoFloracaoPragaDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QRLaudoFloracaoPragaDESC_EPOCA_PRAGA: TStringField;
    QRLaudoFloracaoPragaDESC_PRAGA: TStringField;
    QRLaudoFloracaoCOD_LAUDO_FLORACAO_CAB: TIntegerField;
    QLaudoFloracaoDESC_SITIO: TStringField;
    QRLaudoFloracaoDESC_SITIO: TStringField;
    QRLaudoFloracaoDESC_CLASSE_PLANTIO: TStringField;
    QLaudoFloracaoItemDESC_PRAGA: TStringField;
    QLaudoFloracaoVAL_PRODUCAO: TFloatField;
    QRLaudoFloracaoVAL_PRODUCAO: TFloatField;
    QLaudoFloracaoItemDESC_INCIDENCIA_DOENCA: TStringField;
    QLaudoFloracaoItemDESC_INCIDENCIA_PRAGA: TStringField;
    QExibeItemDESC_INCIDENCIA_PRAGA: TStringField;
    QExibeItemDESC_INCIDENCIA_DOENCA: TStringField;
    QRLaudoFloracaoPragaDESC_INCIDENCIA_PRAGA: TStringField;
    QRLaudoFloracaoDoencaDESC_INCIDENCIA_DOENCA: TStringField;
    QLaudoPreColheitaItemDESC_INCIDENCIA_PRAGA: TStringField;
    QLaudoPreColheitaItemDESC_INCIDENCIA_DOENCA: TStringField;
    QLaudoFloracaoDESC_ISOLAMENTO: TStringField;
    QRLaudoFloracaoDESC_ISOLAMENTO: TStringField;
    QRLaudoFloracaoDoencaDESC_DOENCA: TStringField;
    QLaudoFloracaoItemCOD_DOENCA: TIntegerField;
    QLaudoFloracaoItemdesc_doenca: TStringField;
    QLaudoPreColheitaConsDESC_DANINHA_PROIBIDA: TStringField;
    QRLaudoPreColheitaPraga: TOracleDataSet1;
    QRLaudoPreColheitaDoenca: TOracleDataSet1;
    QRLaudoPreColheitaPragaDESC_PROD_TRAT_PRAGA: TStringField;
    QRLaudoPreColheitaPragaDESC_INCIDENCIA_PRAGA: TStringField;
    QRLaudoPreColheitaPragaDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QRLaudoPreColheitaPragaDESC_EPOCA_PRAGA: TStringField;
    QRLaudoPreColheitaPragaDESC_PRAGA: TStringField;
    QRLaudoPreColheitaDoencaDESC_PROD_TRAT_DOENCA: TStringField;
    QRLaudoPreColheitaDoencaDESC_INCIDENCIA_DOENCA: TStringField;
    QRLaudoPreColheitaDoencaDESC_EPOCA_DOENCA: TStringField;
    QRLaudoPreColheitaDoencaDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    QRLaudoPreColheitaDoencaDESC_DOENCA: TStringField;
    QLaudoPreColheitaItemCOD_DOENCA: TIntegerField;
    QLaudoPreColheitaItemdesc_doenca: TStringField;
    QLaudoFloracaoDESC_PARECER_TECNICO: TStringField;
    QLaudoFloracaoDESC_PARECER_TECNICO_2: TStringField;
    QRLaudoFloracaoDESC_PARECER_TECNICO: TStringField;
    QRLaudoFloracaoDESC_PARECER_TECNICO_2: TStringField;
    QLaudoFloracaoConsNUM_CAMPO_PLANTIO: TIntegerField;
    QLaudoFloracaoarea_inscrita: TStringField;
    QLaudoPreColheitaDESC_PARECER_TECNICO_2: TStringField;
    QLaudoPreColheitaDESC_PARECER_TECNICO: TStringField;
    QRLaudoPreColheitaCOD_LAUDO_PRE_COLHEITA_CAB: TIntegerField;
    QRLaudoPreColheitaNUM_LAUDO_PRE_COLHEITA: TIntegerField;
    QRLaudoPreColheitaVAL_AREA_APROVADA: TFloatField;
    QRLaudoPreColheitaDT_INSPECAO: TDateTimeField;
    QRLaudoPreColheitaDESC_PARECER_TECNICO: TStringField;
    QRLaudoPreColheitaDESC_PARECER_TECNICO_2: TStringField;
    QRLaudoPreColheitaVAL_PRODUCAO: TFloatField;
    QRLaudoPreColheitaVAL_AREA_TOTAL: TFloatField;
    QRLaudoPreColheitaDESC_SITIO: TStringField;
    QRLaudoPreColheitaAREA_APROVADA_FLORACAO: TFloatField;
    QRLaudoPreColheitaDT_PLANTIO_TERMINO: TDateTimeField;
    QRLaudoPreColheitaPERC_CULTIVAR_CICLO: TIntegerField;
    QRLaudoPreColheitaPERC_CULTIVAR_CICLO_DIFERENTE: TIntegerField;
    QRLaudoPreColheitaDESC_OUTRO_CULTIVAR: TStringField;
    QRLaudoPreColheitaDESC_ISOLAMENTO: TStringField;
    QRLaudoPreColheitaDESC_DANINHA_PROIBIDA: TStringField;
    QRLaudoPreColheitaDESC_DANINHA_TOLERADA: TStringField;
    QRLaudoPreColheitaVAL_AREA_APROVADA_1: TFloatField;
    QRLaudoPreColheitaVAL_DENSIDADE_CULTURA: TFloatField;
    QRLaudoPreColheitaDESC_CULTURA: TStringField;
    QRLaudoPreColheitaDESC_COMPLEMENTO_2: TStringField;
    QRLaudoPreColheitaDESC_SAFRA: TStringField;
    QRLaudoPreColheitaNOME: TStringField;
    QRLaudoPreColheitaDESC_CIDADE: TStringField;
    QRLaudoPreColheitaDESC_ENDERECO: TStringField;
    QRLaudoPreColheitaAREA_CAMPO: TFloatField;
    QRLaudoPreColheitaDT_INICIO_PLANTIO: TDateTimeField;
    QRLaudoPreColheitaNUM_CAMPO_PLANTIO: TIntegerField;
    QRLaudoPreColheitaDESC_FILIAL: TStringField;
    QRLaudoPreColheitaENDERECO_FILIAL: TStringField;
    QRLaudoPreColheitaCIDADE_FILIAL: TStringField;
    QRLaudoPreColheitaESTADO_FILIAL: TStringField;
    QRLaudoPreColheitaDESC_CLASSE_PLANTIO: TStringField;
    QLaudoPreColheitaConsDESC_PARECER_TECNICO: TStringField;
    QLaudoPreColheitaConsDESC_PARECER_TECNICO_2: TStringField;
    QExibeItemPreColheitaDESC_PRAGA: TStringField;
    QExibeItemPreColheitaDESC_PROD_TRAT_PRAGA: TStringField;
    QExibeItemPreColheitaDESC_PROD_TRAT_DOENCA: TStringField;
    QExibeItemPreColheitaDESC_DOENCA: TStringField;
    QExibeItemDESC_DOENCA_1: TStringField;
    QLaudoPreColheitaDT_COLHEITA: TDateTimeField;
    QRLaudoPreColheitaDT_COLHEITA: TDateTimeField;
    QLaudoVistoria: TOracleDataSet1;
    QLaudoVistoriaCOD_LAUDO_VISTORIA: TIntegerField;
    QLaudoVistoriaCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QLaudoVistoriaCOD_FUNCIONARIO: TIntegerField;
    QLaudoVistoriaDT_PREVISAO_COLHEITA: TDateTimeField;
    QLaudoVistoriaQT_PRODUCAO_ESTIMADA: TFloatField;
    QLaudoVistoriaDESC_ISOLAMENTO: TStringField;
    QLaudoVistoriaCULTIVAR_ANO_ANTERIOR: TStringField;
    QLaudoVistoriaVAL_DENSIDADE: TFloatField;
    QLaudoVistoriaQT_SUBAMOSTRA: TFloatField;
    QLaudoVistoriaQT_PLANTA_SUBAMOSTRA: TFloatField;
    QLaudoVistoriaDESC_INCIDENCIAS: TStringField;
    QLaudoVistoriaDESC_TRATAMENTO: TStringField;
    QLaudoVistoriaDESC_OBSERVACAO1: TStringField;
    QLaudoVistoriaDESC_OBSERVACAO2: TStringField;
    QLaudoVistoriaDT_EMISSAO: TDateTimeField;
    QLaudoVistoriaQT_AREA_APROVADA: TFloatField;
    QLaudoVistoriaQT_AREA_CONDENADA: TFloatField;
    QLaudoVistoriaQT_AREA_REVISTORIADA: TFloatField;
    QLaudoVistoriaQT_PLANTA_ATIPICA_A: TIntegerField;
    QLaudoVistoriaQT_PLANTA_ATIPICA_B: TIntegerField;
    QLaudoVistoriaQT_PLANTA_ATIPICA_C: TIntegerField;
    QLaudoVistoriaQT_PLANTA_ATIPICA_D: TIntegerField;
    QLaudoVistoriaQT_PLANTA_ATIPICA_E: TIntegerField;
    QLaudoVistoriaQT_PLANTA_ATIPICA_F: TIntegerField;
    QLaudoVistoriaQT_OUTRAS_ESPECIES_A: TIntegerField;
    QLaudoVistoriaQT_OUTRAS_ESPECIES_B: TIntegerField;
    QLaudoVistoriaQT_OUTRAS_ESPECIES_C: TIntegerField;
    QLaudoVistoriaQT_OUTRAS_ESPECIES_D: TIntegerField;
    QLaudoVistoriaQT_OUTRAS_ESPECIES_E: TIntegerField;
    QLaudoVistoriaQT_OUTRAS_ESPECIES_F: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_TOLERADAS_A: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_TOLERADAS_B: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_TOLERADAS_C: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_TOLERADAS_D: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_TOLERADAS_E: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_TOLERADAS_F: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_PROIBIDA_A: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_PROIBIDA_B: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_PROIBIDA_C: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_PROIBIDA_D: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_PROIBIDA_E: TIntegerField;
    QLaudoVistoriaQT_NOCIVAS_PROIBIDA_F: TIntegerField;
    QLaudoVistoriaQT_OUTROS_A: TIntegerField;
    QLaudoVistoriaQT_OUTROS_B: TIntegerField;
    QLaudoVistoriaQT_OUTROS_C: TIntegerField;
    QLaudoVistoriaQT_OUTROS_D: TIntegerField;
    QLaudoVistoriaQT_OUTROS_E: TIntegerField;
    QLaudoVistoriaQT_OUTROS_F: TIntegerField;
    QLaudoVistoriaCOD_CADASTRO: TIntegerField;
    QLaudoVistoriaCOD_FILIAL: TIntegerField;
    QLaudoVistoriaDESC_FASE_CULTURA: TStringField;
    QLaudoVistoriaItem: TOracleDataSet1;
    QLaudoVistoriaNUM_LAUDO_VISTORIA: TIntegerField;
    DSLaudoVistoriaItem: TDataSource;
    QLaudoVistoriaCOD_PLANTIO_SAFRA: TIntegerField;
    QLaudoExibeItem: TOracleDataSet1;
    DSLaudoExibeItem: TDataSource;
    QLaudoExibeItemDESC_PRAGA: TStringField;
    QLaudoExibeItemCOD_LAUDO_VISTORIA_ITEM: TIntegerField;
    QLaudoExibeItemCOD_LAUDO_VISTORIA: TIntegerField;
    QLaudoExibeItemCOD_PRAGA: TIntegerField;
    QLaudoExibeItemDESC_INCIDENCIA_PRAGA: TStringField;
    QLaudoExibeItemDESC_PROD_TRAT_PRAGA: TStringField;
    QLaudoExibeItemDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QLaudoExibeItemDESC_EPOCA_PRAGA: TStringField;
    QLaudoExibeItemDESC_DOENCA: TStringField;
    QLaudoExibeItemDESC_INCIDENCIA_DOENCA: TStringField;
    QLaudoExibeItemDESC_PROD_TRAT_DOENCA: TStringField;
    QLaudoExibeItemDESC_EPOCA_DOENCA: TStringField;
    QLaudoExibeItemDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    QLaudoExibeItemCOD_DOENCA: TIntegerField;
    QLaudoExibeItemDESC_DOENCA_1: TStringField;
    QLaudoVistoriaCons: TOracleDataSet1;
    QLaudoVistoriaConsNUM_LAUDO_VISTORIA: TIntegerField;
    QLaudoVistoriaConsCOD_LAUDO_VISTORIA: TIntegerField;
    QLaudoVistoriaConsQT_AREA_APROVADA: TFloatField;
    QLaudoVistoriaConsDESC_SAFRA: TStringField;
    QLaudoVistoriaConsNUM_CAMPO_PLANTIO: TIntegerField;
    QLaudoVistoriaConsNOME: TStringField;
    QRLaudoVistoria: TOracleDataSet1;
    QRLaudoVistoriaCOD_LAUDO_VISTORIA: TIntegerField;
    QRLaudoVistoriaCOD_CAMPO_PLANTIO_CAB: TIntegerField;
    QRLaudoVistoriaCOD_FUNCIONARIO: TIntegerField;
    QRLaudoVistoriaDESC_FASE_CULTURA: TStringField;
    QRLaudoVistoriaDT_PREVISAO_COLHEITA: TDateTimeField;
    QRLaudoVistoriaQT_PRODUCAO_ESTIMADA: TFloatField;
    QRLaudoVistoriaDESC_ISOLAMENTO: TStringField;
    QRLaudoVistoriaCULTIVAR_ANO_ANTERIOR: TStringField;
    QRLaudoVistoriaVAL_DENSIDADE: TFloatField;
    QRLaudoVistoriaQT_SUBAMOSTRA: TFloatField;
    QRLaudoVistoriaQT_PLANTA_SUBAMOSTRA: TFloatField;
    QRLaudoVistoriaDESC_INCIDENCIAS: TStringField;
    QRLaudoVistoriaDESC_TRATAMENTO: TStringField;
    QRLaudoVistoriaDESC_OBSERVACAO1: TStringField;
    QRLaudoVistoriaDESC_OBSERVACAO2: TStringField;
    QRLaudoVistoriaDT_EMISSAO: TDateTimeField;
    QRLaudoVistoriaQT_AREA_APROVADA: TFloatField;
    QRLaudoVistoriaQT_AREA_CONDENADA: TFloatField;
    QRLaudoVistoriaQT_AREA_REVISTORIADA: TFloatField;
    QRLaudoVistoriaQT_PLANTA_ATIPICA_A: TIntegerField;
    QRLaudoVistoriaQT_PLANTA_ATIPICA_B: TIntegerField;
    QRLaudoVistoriaQT_PLANTA_ATIPICA_C: TIntegerField;
    QRLaudoVistoriaQT_PLANTA_ATIPICA_D: TIntegerField;
    QRLaudoVistoriaQT_PLANTA_ATIPICA_E: TIntegerField;
    QRLaudoVistoriaQT_PLANTA_ATIPICA_F: TIntegerField;
    QRLaudoVistoriaQT_OUTRAS_ESPECIES_A: TIntegerField;
    QRLaudoVistoriaQT_OUTRAS_ESPECIES_B: TIntegerField;
    QRLaudoVistoriaQT_OUTRAS_ESPECIES_C: TIntegerField;
    QRLaudoVistoriaQT_OUTRAS_ESPECIES_D: TIntegerField;
    QRLaudoVistoriaQT_OUTRAS_ESPECIES_E: TIntegerField;
    QRLaudoVistoriaQT_OUTRAS_ESPECIES_F: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_A: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_B: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_C: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_D: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_E: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_TOLERADAS_F: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_A: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_B: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_C: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_D: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_E: TIntegerField;
    QRLaudoVistoriaQT_NOCIVAS_PROIBIDA_F: TIntegerField;
    QRLaudoVistoriaQT_OUTROS_A: TIntegerField;
    QRLaudoVistoriaQT_OUTROS_B: TIntegerField;
    QRLaudoVistoriaQT_OUTROS_C: TIntegerField;
    QRLaudoVistoriaQT_OUTROS_D: TIntegerField;
    QRLaudoVistoriaQT_OUTROS_E: TIntegerField;
    QRLaudoVistoriaQT_OUTROS_F: TIntegerField;
    QRLaudoVistoriaCOD_CADASTRO: TIntegerField;
    QRLaudoVistoriaCOD_FILIAL: TIntegerField;
    QRLaudoVistoriaNUM_LAUDO_VISTORIA: TIntegerField;
    QRLaudoVistoriaCOD_PLANTIO_SAFRA: TIntegerField;
    QRLaudoVistoriaCOD_LAUDO_VISTORIA_ITEM: TIntegerField;
    QRLaudoVistoriaDESC_SAFRA: TStringField;
    QRLaudoVistoriaNOME: TStringField;
    QRLaudoVistoriaDESC_CIDADE: TStringField;
    QRLaudoVistoriaDESC_ENDERECO: TStringField;
    QRLaudoVistoriaCOD_ESTADO: TStringField;
    QRLaudoVistoriaNUM_AREA: TFloatField;
    QRLaudoVistoriaDT_INICIO_PLANTIO: TDateTimeField;
    QRLaudoVistoriaNUM_CAMPO_PLANTIO: TIntegerField;
    QRLaudoVistoriaDESC_FILIAL: TStringField;
    QRLaudoVistoriaENDERECO_FILIAL: TStringField;
    QRLaudoVistoriaCIDADE_FILIAL: TStringField;
    QRLaudoVistoriaESTADO_FILIAL: TStringField;
    QRLaudoVistoriaCGC_FILIAL: TStringField;
    QRLaudoVistoriaRENASEM_FILIAL: TIntegerField;
    QRLaudoVistoriaDESC_FUNCIONARIO: TStringField;
    QRLaudoVistoriaCREA_FUNCIONARIO: TStringField;
    QRLaudoVistoriaCPF_FUNCIONARIO: TStringField;
    QRLaudoVistoriaDESC_CULTURA: TStringField;
    QRLaudoDoencaPraga: TOracleDataSet1;
    QRLaudoDoencaPragaPRODUTO_TRATAMENTO: TStringField;
    QRLaudoDoencaPragaINCIDENCIA: TStringField;
    QRLaudoDoencaPragaEPOCA: TStringField;
    QRLaudoDoencaPragaDOSAGEM: TStringField;
    QRLaudoDoencaPragaPRAGA_DOENCA: TStringField;
    QRLaudoVistoriaDESC_CLASSE_PLANTIO: TStringField;
    QRLaudoVistoriaDESC_PRODUTO: TStringField;
    QRLaudoVistoriaDESC_COMPLEMENTO_2: TStringField;
    QRLaudoVistoriaRENASEM_FUNCIONARIO: TStringField;
    QLaudoVistoriaItemCOD_LAUDO_VISTORIA_ITEM: TIntegerField;
    QLaudoVistoriaItemCOD_LAUDO_VISTORIA: TIntegerField;
    QLaudoVistoriaItemCOD_PRAGA: TIntegerField;
    QLaudoVistoriaItemDESC_INCIDENCIA_PRAGA: TStringField;
    QLaudoVistoriaItemDESC_PROD_TRAT_PRAGA: TStringField;
    QLaudoVistoriaItemDESC_DOSAGEM_TRAT_PRAGA: TStringField;
    QLaudoVistoriaItemDESC_EPOCA_PRAGA: TStringField;
    QLaudoVistoriaItemDESC_INCIDENCIA_DOENCA: TStringField;
    QLaudoVistoriaItemDESC_PROD_TRAT_DOENCA: TStringField;
    QLaudoVistoriaItemDESC_EPOCA_DOENCA: TStringField;
    QLaudoVistoriaItemDESC_DOSAGEM_TRAT_DOENCA: TStringField;
    QLaudoVistoriaItemCOD_DOENCA: TIntegerField;
    QLaudoVistoriaItemdesc_doenca: TStringField;
    QLaudoVistoriaItemdesc_praga: TStringField;
    procedure QLaudoFloracaoCalcFields(DataSet: TDataSet);
    procedure QLaudoFloracaoItemAfterCancel(DataSet: TDataSet);
    procedure QExibeItemAfterEdit(DataSet: TDataSet);
    procedure QExibeItemAfterPost(DataSet: TDataSet);
    procedure QLaudoFloracaoItemCalcFields(DataSet: TDataSet);
    procedure DSLaudoFloracaoItemStateChange(Sender: TObject);
    procedure QLaudoFloracaoAfterPost(DataSet: TDataSet);
    procedure QLaudoFloracaoAfterInsert(DataSet: TDataSet);
    procedure QLaudoFloracaoAfterOpen(DataSet: TDataSet);
    procedure QLaudoFloracaoItemAfterInsert(DataSet: TDataSet);
    procedure QLaudoFloracaoBeforePost(DataSet: TDataSet);
    procedure QLaudoFloracaoItemAfterOpen(DataSet: TDataSet);
    procedure QLaudoFloracaoBeforeCancel(DataSet: TDataSet);
    procedure QLaudoPreColheitaCalcFields(DataSet: TDataSet);
    procedure QLaudoPreColheitaItemCalcFields(DataSet: TDataSet);
    procedure QLaudoPreColheitaItemBeforePost(DataSet: TDataSet);
    procedure QLaudoPreColheitaAfterInsert(DataSet: TDataSet);
    procedure DSLaudoPreColheitaItemStateChange(Sender: TObject);
    procedure QLaudoPreColheitaBeforeCancel(DataSet: TDataSet);
    procedure QLaudoFloracaoItemAfterPost(DataSet: TDataSet);
    procedure QLaudoFloracaoItemBeforePost(DataSet: TDataSet);
    procedure QLaudoPreColheitaBeforePost(DataSet: TDataSet);
    procedure QLaudoPreColheitaAfterOpen(DataSet: TDataSet);
    procedure QLaudoPreColheitaItemAfterInsert(DataSet: TDataSet);
    procedure QLaudoPreColheitaItemAfterOpen(DataSet: TDataSet);
    procedure QLaudoPreColheitaItemAfterCancel(DataSet: TDataSet);
    procedure QLaudoPreColheitaItemAfterPost(DataSet: TDataSet);
    procedure QLaudoFloracaoItemAfterDelete(DataSet: TDataSet);
    procedure QLaudoVistoriaAfterPost(DataSet: TDataSet);
    procedure QLaudoVistoriaItemAfterCancel(DataSet: TDataSet);
    procedure QLaudoVistoriaItemAfterDelete(DataSet: TDataSet);
    procedure QLaudoVistoriaItemAfterInsert(DataSet: TDataSet);
    procedure QLaudoVistoriaItemAfterOpen(DataSet: TDataSet);
    procedure QLaudoVistoriaItemAfterPost(DataSet: TDataSet);
    procedure QLaudoVistoriaItemBeforePost(DataSet: TDataSet);
    procedure QLaudoVistoriaAfterInsert(DataSet: TDataSet);
    procedure QLaudoVistoriaAfterOpen(DataSet: TDataSet);
    procedure QLaudoVistoriaBeforeCancel(DataSet: TDataSet);
    procedure DSLaudoVistoriaItemStateChange(Sender: TObject);
    procedure QLaudoVistoriaBeforePost(DataSet: TDataSet);
    procedure QLaudoExibeItemAfterEdit(DataSet: TDataSet);
    procedure QLaudoExibeItemAfterPost(DataSet: TDataSet);
    procedure QLaudoVistoriaItemCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLaudo: TDMLaudo;

implementation

uses UOracle_cl, ULaudoFloracaoCad, ULaudoPreColheitaCad, ULaudoVistoriaCad,
  USequencia_cl;

{$R *.DFM}

function NumeroLaudoFloracao(Cod_Safra:Integer):Integer;
var
 wNum:String;
Begin
  //----bloco responsavel pela geracao da sequencia de numeracao dos laudos apartir da safra
  wNum:=DMOracle.BuscaNome('SELECT MAX(NUM_LAUDO_FLORACAO) FROM TB_LAUDO_FLORACAO_CAB','TB_LAUDO_FLORACAO_CAB.COD_PLANTIO_SAFRA = '+IntToStr(Cod_Safra));
  if wNum = '' then  //----verifica se for primeiro campo o laudo recebe numero 1
    result:= 1
  else
    result:=StrToInt(wNum)+1;
  //------ finaliza bloco
end;

function NumeroLaudoPreColheita(Cod_Safra:Integer):Integer;
var
 wNum:String;
Begin
  //----bloco responsavel pela geracao da sequencia de numeracao dos laudos apartir da safra
  wNum:=DMOracle.BuscaNome('SELECT MAX(NUM_LAUDO_PRE_COLHEITA) FROM TB_LAUDO_PRE_COLHEITA_CAB','TB_LAUDO_PRE_COLHEITA_CAB.COD_PLANTIO_SAFRA = '+IntToStr(Cod_Safra));
  if wNum = '' then  //----verifica se for primeiro campo o laudo recebe numero 1
    result:= NumeroLaudoFloracao(DMlaudo.QLaudoPreColheitaCod_Plantio_Safra.Value)
  else
    result:=StrToInt(wNum)+1;
    //------ finaliza bloco
end;

procedure TDMLaudo.QLaudoFloracaoCalcFields(DataSet: TDataSet);
begin
  with DMLaudo do
  begin
    if QLaudoFloracaoCod_Campo_Plantio_Cab.Text <> '' then
    begin
      QLaudoFloracaoNum_Campo.Text:=DMOracle.BuscaNome('SELECT NUM_CAMPO_PLANTIO FROM TB_CAMPO_PLANTIO_CAB ',' COD_CAMPO_PLANTIO_CAB = '+IntToStr(QLaudoFloracaoCod_Campo_Plantio_Cab.Value));
      QLaudoFloracaoArea_Inscrita.Text:=DMOracle.BuscaNome('SELECT NUM_AREA FROM TB_CAMPO_PLANTIO_CAB ',' COD_CAMPO_PLANTIO_CAB = '+IntToStr(QLaudoFloracaoCod_Campo_Plantio_Cab.Value));
    end;
    if QLaudoFloracaoCod_Plantio_Safra.Text <> '' then
      QLaudoFloracaoDesc_Safra.Value:=DMOracle.BuscaNome('SELECT DESC_SAFRA FROM TB_PLANTIO_SAFRA ',' COD_PLANTIO_SAFRA = '+IntToStr(QLaudoFloracaoCod_Plantio_Safra.Value));
  end;
end;

procedure TDMLaudo.QLaudoFloracaoItemAfterCancel(DataSet: TDataSet);
begin
  if QLaudoFloracaoCod_Laudo_Floracao_cab.Text <> '' then
  begin
     QExibeItem.Close;
     QExibeItem.SetVariable('COD_LAUDO',IntToStr(QLaudoFloracaoCod_Laudo_Floracao_cab.Value));
     QExibeItem.Open;
  end;
end;

procedure TDMLaudo.QExibeItemAfterEdit(DataSet: TDataSet);
begin
  if QLaudoFloracaoCod_Laudo_Floracao_cab.Text <> '' then
  begin
     QExibeItem.Close;
     QExibeItem.SetVariable('COD_LAUDO',IntToStr(QLaudoFloracaoCod_Laudo_Floracao_cab.Value));
     QExibeItem.Open;
  end;
end;

procedure TDMLaudo.QExibeItemAfterPost(DataSet: TDataSet);
begin
  if QLaudoFloracaoCod_Laudo_Floracao_cab.Text <> '' then
  begin
     QExibeItem.Close;
     QExibeItem.SetVariable('COD_LAUDO',IntToStr(QLaudoFloracaoCod_Laudo_Floracao_cab.Value));
     QExibeItem.Open;
  end;
end;

procedure TDMLaudo.QLaudoFloracaoItemCalcFields(DataSet: TDataSet);
begin
  with DMLaudo do
  begin
    if QLaudoFloracaoItemCod_Praga.Text <> '' then
      QLaudoFloracaoITemDesc_Praga.Value:=DMOracle.BuscaNome('SELECT DESC_PRAGA FROM TB_PRAGA ',' COD_PRAGA = '+IntToStr(QLaudoFloracaoItemCod_Praga.Value));
    if QLaudoFloracaoItemCod_Doenca.Text <> '' then
      QLaudoFloracaoITemDesc_Doenca.Value:=DMOracle.BuscaNome('SELECT DESC_DOENCA FROM TB_DOENCA ',' COD_DOENCA = '+IntToStr(QLaudoFloracaoItemCod_Doenca.Value));
    end;
end;

procedure TDMLaudo.DSLaudoFloracaoItemStateChange(Sender: TObject);
begin
  if DSLaudoFloracaoItem.State in [DSInsert,DSEdit] then
  begin
    FLaudoFloracaoCad.BTPraga.Enabled:=True;
    FLaudoFloracaoCad.BTDoenca.Enabled:=True;
  end
  else
  begin
    FLaudoFloracaoCad.BTPraga.Enabled:=False;
    FLaudoFloracaoCad.BTDoenca.Enabled:=False;
  end;
end;

procedure TDMLaudo.QLaudoFloracaoAfterPost(DataSet: TDataSet);
begin
  if QLaudoFloracaoItem.State in [DSInsert,DSEdit] then
    QLaudoFloracaoItem.POST;
end;

procedure TDMLaudo.QLaudoFloracaoAfterInsert(DataSet: TDataSet);
begin
 QLaudoFloracaoItem.Close;
 QLaudoFloracaoItem.Open;
 QLaudoFloracaoNum_Laudo_Floracao.Value:=0;
end;

procedure TDMLaudo.QLaudoFloracaoAfterOpen(DataSet: TDataSet);
begin
  QLaudoFloracaoItem.Close;
  QLaudoFloracaoItem.Open;
end;

procedure TDMLaudo.QLaudoFloracaoItemAfterInsert(DataSet: TDataSet);
begin
  QLaudoFloracaoItemCod_Laudo_Floracao_Cab.Value:=QLaudoFloracaoCod_Laudo_Floracao_Cab.Value;
end;

procedure TDMLaudo.QLaudoFloracaoBeforePost(DataSet: TDataSet);
var wLaudoF, wLaudoP : integer;
begin

  if QLaudoFloracao.state in [DSInsert] then
  begin
    //-alteraçao para o laudo da floracao nao ter o mesmo codigo da pre colheita
    wLaudoF := NumeroLaudoFloracao(QLaudoFloracaoCod_Plantio_Safra.Value);
    wLaudoP := NumeroLaudoPreColheita(QLaudoFloracaoCod_Plantio_Safra.Value);
    if wLaudoF > wLaudoP then
      QLaudoFloracaoNum_Laudo_Floracao.Value:=wLaudoF
    else
      QLaudoFloracaoNum_Laudo_Floracao.Value:=wLaudoP;
    //-------fim alteracao---FABIANO:16/08/2004

    if Trim(IntToStr(QLaudoFloracaoCod_Plantio_Safra.Value)) <>
      (DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.COD_PLANTIO_SAFRA FROM TB_CAMPO_PLANTIO_CAB',' COD_CAMPO_PLANTIO_CAB = '
      +Trim(IntToStr(QLaudoFloracaoCod_Campo_Plantio_cab.Value)))) then
      raise exception.create('Campo Não pertence a esta Safra');
    if (DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.DT_CANCELAMENTO FROM TB_CAMPO_PLANTIO_CAB',' COD_CAMPO_PLANTIO_CAB = '
      +Trim(IntToStr(QLaudoFloracaoCod_Campo_Plantio_cab.Value)))) <> '' then
    begin
      QLaudoFloracaoItem.Cancel;
      QLaudoFloracao.Cancel;
      raise exception.create('Campo Cancelado. Verifique a situação do campo no cadastro de Campos');
    end;

    if StrToFloat(DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.NUM_AREA FROM TB_CAMPO_PLANTIO_CAB',' COD_CAMPO_PLANTIO_CAB = '
      +Trim(IntToStr(QLaudoFloracaoCod_Campo_Plantio_cab.Value)))) < QLaudoFloracaoVal_Area_Aprovada.Value then
    begin
      raise exception.create('Área aprovada não pode ser maior do que Inscrita!, verifique área no cadastro de Campos');
    end;
  end;
end;

procedure TDMLaudo.QLaudoFloracaoItemAfterOpen(DataSet: TDataSet);
begin
  QExibeItem.Close;
  QExibeItem.SetVariable('Cod_laudo',QLaudoFloracaoCod_Laudo_Floracao_Cab.Value);
  QExibeItem.Open;
end;

procedure TDMLaudo.QLaudoFloracaoBeforeCancel(DataSet: TDataSet);
begin
  DMLaudo.QLaudoFloracaoItem.cancel;
end;

procedure TDMLaudo.QLaudoPreColheitaCalcFields(DataSet: TDataSet);
begin
  if QLaudoPreColheitaCod_Laudo_Floracao_Cab.Text <> '' then
    QLaudoPreColheitaNum_laudo.Text:=DMOracle.BuscaNome('SELECT TB_LAUDO_FLORACAO_CAB.NUM_LAUDO_FLORACAO FROM TB_LAUDO_FLORACAO_CAB',' COD_LAUDO_FLORACAO_CAB = '+IntToStr(QLaudoPreColheitaCod_Laudo_Floracao_Cab.Value));

end;

procedure TDMLaudo.QLaudoPreColheitaItemCalcFields(DataSet: TDataSet);
begin
  with DMLaudo do
  begin
    if QLaudoPreColheitaItemCod_Praga.Text <> '' then
      QLaudoPreColheitaItemDesc_Praga.Value:=DMOracle.BuscaNome('SELECT DESC_PRAGA FROM TB_PRAGA ',' COD_PRAGA = '+IntToStr(QLaudoPreColheitaItemCod_Praga.Value));
  end;
  if QLaudoPreColheitaItemCod_Doenca.Text <> '' then
      QLaudoPreColheitaItemDesc_Doenca.Value:=DMOracle.BuscaNome('SELECT DESC_DOENCA FROM TB_DOENCA ',' COD_DOENCA = '+IntToStr(QLaudoPreColheitaItemCod_Doenca.Value));
end;

procedure TDMLaudo.QLaudoPreColheitaItemBeforePost(DataSet: TDataSet);
begin
  if QLaudoPreColheita.State in [DSInsert,DSEdit] then
    QLaudoPreColheita.Post;
  QExibeItemPreColheita.Close;
  QExibeItemPreColheita.SetVariable('COD_LAUDO_PRE_COLHEITA_CAB',QLaudoPreColheitaItemCod_Laudo_Pre_Colheita_Cab.Value);
  QExibeItemPreColheita.Open;
end;

procedure TDMLaudo.QLaudoPreColheitaAfterInsert(DataSet: TDataSet);
begin
  QLaudoPreColheitaItem.Close;
  QLaudoPreColheitaItem.Open;
  QLaudoPreColheitaNum_Laudo_Pre_Colheita.Value:=0;
  QLaudoPreColheitaCod_Plantio_Safra.Value:=0;
end;

procedure TDMLaudo.DSLaudoPreColheitaItemStateChange(Sender: TObject);
begin
  if DSLaudoPreColheitaItem.State in [DSInsert,DSEdit] then
  begin
    FLaudoPreColheitaCad.BTPraga.Enabled:=True;
    FLaudoPreColheitaCad.BTDoenca.Enabled:=True;
  end
  else
  begin
    FLaudoPreColheitaCad.BTPraga.Enabled:=False;
    FLaudoPreColheitaCad.BTDoenca.Enabled:=False;
  end;
end;

procedure TDMLaudo.QLaudoPreColheitaBeforeCancel(DataSet: TDataSet);
begin
  DMLaudo.QLaudoPreColheitaItem.cancel;
end;

procedure TDMLaudo.QLaudoFloracaoItemAfterPost(DataSet: TDataSet);
begin
  QExibeItem.Close;
  QExibeItem.SetVariable('Cod_laudo',QLaudoFloracaoCod_Laudo_Floracao_Cab.Value);
  QExibeItem.Open;
end;


procedure TDMLaudo.QLaudoFloracaoItemBeforePost(DataSet: TDataSet);
begin
   if QLaudoFloracao.State in [DSInsert,DSEdit] then
    QLaudoFloracao.Post;
end;

procedure TDMLaudo.QLaudoPreColheitaBeforePost(DataSet: TDataSet);
var wLaudoF, wLaudoP : integer;
begin
  if QLaudoPreColheita.state in [DSInsert] then
  begin
    if QLaudoPreColheitaCod_Laudo_Floracao_Cab.Text <> '' then
    begin
      if StrToFloat(DMOracle.BuscaNome('SELECT VAL_AREA_APROVADA FROM TB_LAUDO_FLORACAO_CAB','COD_LAUDO_FLORACAO_CAB = '+IntToStr(QLaudoPreColheitaCod_Laudo_Floracao_cab.Value))) > 0 then
      begin
        QLaudoPreColheitaCod_Plantio_Safra.Value:=StrToInt(DMOracle.BuscaNome('SELECT TB_LAUDO_FLORACAO_CAB.COD_PLANTIO_SAFRA FROM TB_LAUDO_FLORACAO_CAB',' COD_LAUDO_FLORACAO_CAB = '+IntToStr(QLaudoPreColheitaCOD_LAUDO_FLORACAO_CAB.Value)));

        //-alteraçao para o laudo da floracao nao ter o mesmo codigo da pre colheita
        wLaudoF := NumeroLaudoFloracao(QLaudoPreColheitaCOD_PLANTIO_SAFRA.Value);
        wLaudoP := NumeroLaudoPreColheita(QLaudoPreColheitaCOD_PLANTIO_SAFRA.Value);
        if wLaudoF > wLaudoP then
          QLaudoPreColheitaNUM_LAUDO_PRE_COLHEITA.Value:=wLaudoF
        else
          QLaudoPreColheitaNUM_LAUDO_PRE_COLHEITA.Value:=wLaudoP;
        //-------fim alteracao---FABIANO:16/08/2004

        //QLaudoPreColheitaNum_Laudo_Pre_Colheita.Value:=NumeroLaudoPreColheita(QLaudoPreColheitaCod_Plantio_Safra.Value);

        if StrToFloat(DMOracle.BuscaNome('SELECT TB_LAUDO_FLORACAO_CAB.VAL_AREA_APROVADA FROM TB_LAUDO_FLORACAO_CAB',' COD_LAUDO_FLORACAO_CAB = '
           +Trim(IntToStr(QLaudoPreColheitaCod_Laudo_Floracao_cab.Value)))) < QLaudoPreColheitaVal_Area_Aprovada.Value then
         raise exception.create('Erro!! - Área aprovada no Laudo de Pré-Colheita maior do que Área aprovada no Laudo de Floração');
      end
      else
      begin
        QLaudoPreColheitaItem.Cancel;
        QLaudoPreColheita.Cancel;
        raise exception.Create('Campo '+DMOracle.BuscaNome('SELECT NUM_LAUDO_FLORACAO FROM TB_LAUDO_FLORACAO_CAB','COD_LAUDO_FLORACAO_CAB = '+IntToStr(QLaudoPreColheitaCod_Laudo_Floracao_cab.Value))
                                +' Reprovado no Laudo de Floração - Área Aprovada igual a zero!');
      end;
    end;
  end;
end;

procedure TDMLaudo.QLaudoPreColheitaAfterOpen(DataSet: TDataSet);
begin
  QLaudoPreColheitaItem.Close;
  QLaudoPreColheitaItem.Open;
  QExibeItemPreColheita.Open;
end;

procedure TDMLaudo.QLaudoPreColheitaItemAfterInsert(DataSet: TDataSet);
begin
  QLaudoPreColheitaItemCod_Laudo_Pre_Colheita_Cab.Value:=QLaudoPreColheitaCod_Laudo_Pre_Colheita_Cab.Value;
end;

procedure TDMLaudo.QLaudoPreColheitaItemAfterOpen(DataSet: TDataSet);
begin
  QExibeItemPreColheita.Close;
  QExibeItemPreColheita.SetVariable('COD_LAUDO_PRE_COLHEITA_CAB',QLaudoPreColheitaItemCod_Laudo_Pre_Colheita_Cab.Value);
  QExibeItemPreColheita.Open;
end;

procedure TDMLaudo.QLaudoPreColheitaItemAfterCancel(DataSet: TDataSet);
begin
  QExibeItemPreColheita.Close;
  QExibeItemPreColheita.SetVariable('COD_LAUDO_PRE_COLHEITA_CAB',QLaudoPreColheitaItemCod_Laudo_Pre_Colheita_Cab.Value);
  QExibeItemPreColheita.Open;
end;

procedure TDMLaudo.QLaudoPreColheitaItemAfterPost(DataSet: TDataSet);
begin
  QExibeItemPreColheita.Close;
  QExibeItemPreColheita.SetVariable('COD_LAUDO_PRE_COLHEITA_CAB',QLaudoPreColheitaItemCod_Laudo_Pre_Colheita_Cab.Value);
  QExibeItemPreColheita.Open;
end;

procedure TDMLaudo.QLaudoFloracaoItemAfterDelete(DataSet: TDataSet);
begin
  QExibeItem.Close;
  QExibeItem.SetVariable('Cod_laudo',QLaudoFloracaoCod_Laudo_Floracao_Cab.Value);
  QExibeItem.Open;
end;

procedure TDMLaudo.QLaudoVistoriaAfterPost(DataSet: TDataSet);
begin
  if QLaudoVistoriaItem.State in [DSInsert,DSEdit] then
    QLaudoVistoriaItem.POST;
end;

procedure TDMLaudo.QLaudoVistoriaItemAfterCancel(DataSet: TDataSet);
begin
  if QLaudoVistoriaCod_Laudo_Vistoria.Text <> '' then
  begin
     QLaudoExibeItem.Close;
     QLaudoExibeItem.SetVariable('COD_LAUDO',IntToStr(QLaudoVistoriaCod_Laudo_Vistoria.Value));
     QLaudoExibeItem.Open;
  end; 
end;

procedure TDMLaudo.QLaudoVistoriaItemAfterDelete(DataSet: TDataSet);
begin
  QLaudoExibeItem.Close;
  QLaudoExibeItem.SetVariable('COD_LAUDO',QLaudoVistoriaCod_Laudo_Vistoria.Value);
  QLaudoExibeItem.Open; 
end;

procedure TDMLaudo.QLaudoVistoriaItemAfterInsert(DataSet: TDataSet);
begin
  DMLaudo.QLaudoVistoriaItemCod_Laudo_Vistoria.Value:=QLaudoVistoriaCod_Laudo_Vistoria.Value;
end;

procedure TDMLaudo.QLaudoVistoriaItemAfterOpen(DataSet: TDataSet);
begin
  QLaudoExibeItem.Close;
  QLaudoExibeItem.SetVariable('COD_LAUDO',QLaudoVistoriaCod_Laudo_Vistoria.Value);
  QLaudoExibeItem.Open;
end;

procedure TDMLaudo.QLaudoVistoriaItemAfterPost(DataSet: TDataSet);
begin
  QLaudoExibeItem.Close;
  QLaudoExibeItem.SetVariable('COD_LAUDO',QLaudoVistoriaCod_Laudo_Vistoria.Value);
  QLaudoExibeItem.Open; 
end;

procedure TDMLaudo.QLaudoVistoriaItemBeforePost(DataSet: TDataSet);
begin
   if QLaudoVistoria.State in [DSInsert,DSEdit] then
    QLaudoVistoria.Post;
end;

procedure TDMLaudo.QLaudoVistoriaAfterInsert(DataSet: TDataSet);
begin
 QLaudoVistoriaItem.Close;
 QLaudoVistoriaItem.Open;
 QLaudoVistoriaNum_Laudo_Vistoria.Value:=0;
end;

procedure TDMLaudo.QLaudoVistoriaAfterOpen(DataSet: TDataSet);
begin
  QLaudoVistoriaItem.Close;
  QLaudoVistoriaItem.Open;   
end;

procedure TDMLaudo.QLaudoVistoriaBeforeCancel(DataSet: TDataSet);
begin
  DMLaudo.QLaudoVistoriaItem.cancel;
end;

procedure TDMLaudo.DSLaudoVistoriaItemStateChange(Sender: TObject);
begin
  if DSLaudoVistoriaItem.State in [DSInsert,DSEdit] then
  begin
    FLaudoVistoriaCad.BTPraga.Enabled:=True;
    FLaudoVistoriaCad.BTDoenca.Enabled:=True;
  end
  else
  begin
    FLaudoVistoriaCad.BTPraga.Enabled:=False;
    FLaudoVistoriaCad.BTDoenca.Enabled:=False;
  end;
end;

procedure TDMLaudo.QLaudoVistoriaBeforePost(DataSet: TDataSet);
var wAux : string;
begin
  If DMLaudo.QlaudoVistoriaNum_laudo_Vistoria.Value = 0 then
  Begin
    wAux := DMOracle.BuscaNome('SELECT COD_CLASSE_PLANTIO FROM TB_PLANTIO_SAFRA', 'COD_PLANTIO_SAFRA = ' + DMLaudo.QLaudoVistoriaCOD_PLANTIO_SAFRA.Text);
    DMLaudo.QLaudoVistoriaNum_Laudo_Vistoria.Value := DMSequencia.Sequencia(DMLaudo.QLaudoVistoriaCod_Filial.Value, 'NUM_LD_VISTORIA_' + wAux);
    //if DMLaudo.QLaudoVistoriaCOD_PLANTIO_SAFRA.Text = '15' then
    //  DMLaudo.QLaudoVistoriaNum_Laudo_Vistoria.Value := DMSequencia.Sequencia(DMLaudo.QLaudoVistoriaCod_Filial.Value,'NUM_LAUDO_VISTORIA')
    //else
    //  DMLaudo.QLaudoVistoriaNum_Laudo_Vistoria.Value := DMSequencia.Sequencia(DMLaudo.QLaudoVistoriaCod_Filial.Value,'NUM_LD_VISTORIA_C1');
  end;

    if Trim(IntToStr(QLaudoVistoriaCod_Plantio_Safra.Value)) <>
      (DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.COD_PLANTIO_SAFRA FROM TB_CAMPO_PLANTIO_CAB',' COD_CAMPO_PLANTIO_CAB = '
      +Trim(IntToStr(QLaudoVistoriaCod_Campo_Plantio_cab.Value)))) then
      raise exception.create('Campo Não pertence a esta Safra');
    if (DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.DT_CANCELAMENTO FROM TB_CAMPO_PLANTIO_CAB',' COD_CAMPO_PLANTIO_CAB = '
      +Trim(IntToStr(QLaudoVistoriaCod_Campo_Plantio_cab.Value)))) <> '' then
    begin
      QLaudoVistoriaItem.Cancel;
      QLaudoVistoria.Cancel;
      raise exception.create('Campo Cancelado. Verifique a situação do campo no cadastro de Campos');
    end;

    if StrToFloat(DMOracle.BuscaNome('SELECT TB_CAMPO_PLANTIO_CAB.NUM_AREA FROM TB_CAMPO_PLANTIO_CAB',' COD_CAMPO_PLANTIO_CAB = '
      +Trim(IntToStr(QLaudoVistoriaCod_Campo_Plantio_cab.Value)))) < QLaudoVistoriaQt_Area_Aprovada.Value then
    begin
      raise exception.create('Área aprovada não pode ser maior do que Inscrita!, verifique área no cadastro de Campos');
    end;
  end;


procedure TDMLaudo.QLaudoExibeItemAfterEdit(DataSet: TDataSet);
begin
  if QLaudoVistoriaCod_Laudo_Vistoria.Text <> '' then
  begin
     QLaudoExibeItem.Close;
     QLaudoExibeItem.SetVariable('COD_LAUDO',IntToStr(QLaudoVistoriaCod_Laudo_Vistoria.Value));
     QLaudoExibeItem.Open;
  end; 
end;

procedure TDMLaudo.QLaudoExibeItemAfterPost(DataSet: TDataSet);
begin
  if QLaudoVistoriaCod_Laudo_Vistoria.Text <> '' then
  begin
     QLaudoExibeItem.Close;
     QLaudoExibeItem.SetVariable('COD_LAUDO',IntToStr(QLaudoVistoriaCod_Laudo_Vistoria.Value));
     QLaudoExibeItem.Open;
  end;

end;

procedure TDMLaudo.QLaudoVistoriaItemCalcFields(DataSet: TDataSet);
begin
  with DMLaudo do
  begin
    if QLaudoVistoriaItemCod_Praga.Text <> '' then
      QLaudoVistoriaItemDesc_Praga.Value:=DMOracle.BuscaNome('SELECT DESC_PRAGA FROM TB_PRAGA ',' COD_PRAGA = '+IntToStr(QLaudoVistoriaItemCod_Praga.Value));
    if QLaudoVistoriaItemCod_Doenca.Text <> '' then
      QLaudoVistoriaItemDesc_Doenca.Value:=DMOracle.BuscaNome('SELECT DESC_DOENCA FROM TB_DOENCA ',' COD_DOENCA = '+IntToStr(QLaudoVistoriaItemCod_Doenca.Value));
    end;

end;

end.
