unit NfeConsts;

interface

const
  CSOSN_ICMS_TRIB_SN_COM_CRED: Integer = 101; //Tributada pelo Simples Nacional com permissão de crédito.
  CSOSN_ICMS_TRIB_SN_SEM_CRED: Integer = 102; //Tributada pelo Simples Nacional sem permissão de crédito.
  CSOSN_ICMS_TRIB_SN_ISENTO: Integer = 103; //Isenção do ICMS no Simples Nacional para faixa de receita bruta
  CSOSN_ICMS_TRIB_SN_IMUNE: Integer = 300; //Imune
  CSOSN_ICMS_TRIB_SN_NAO_TRIB: Integer = 400; //Não tributada pelo Simples Nacional
  CSOSN_ICMS_TRIB_SN_COM_CRED_ST: Integer = 201; //Tributada pelo Simples Nacional com permissão de crédito e com cobrança do ICMS por Substituição Tributária
  CSOSN_ICMS_TRIB_SN_SEM_CRED_ST: Integer = 202; //Tributada pelo Simples Nacional sem permissão de crédito e com cobrança do ICMS por Substituição Tributária
  CSOSN_ICMS_TRIB_SN_ISENTO_ST: Integer = 203; //Isenção do ICMS nos Simples Nacional para faixa de receita bruta e com cobrança do ICMS por Substituição Tributária
  CSOSN_ICMS_TRIB_SN_COBRADO_POR_ST: Integer = 500; //ICMS cobrado anteriormente por substituição tributária (substituído) ou por antecipação
  CSOSN_ICMS_TRIB_SN_OUTROS: Integer = 900; //Outros

  CST_COFINS_TRIBUTAVEL_ALIQ_NORMAL: Integer = 1;
  CST_COFINS_TRIBUTAVEL_ALIQ_DIF: Integer = 2;
  CST_COFINS_TRIBUTAVEL_ALIQ_UN_PROD: Integer = 3;
  CST_COFINS_TRIBUTAVEL_MONOFASICA: Integer = 4;
  CST_COFINS_TRIBUTAVEL_ALIQ_ZERO: Integer = 6;
  CST_COFINS_ISENTO: Integer = 7;
  CST_COFINS_SEM_INCIDENCIA: Integer = 8;
  CST_COFINS_SUSPENSAO: Integer = 9;
  CST_COFINS_OUTRAS: Integer = 99;

  CST_ICMS_TRIB_INTEGRAL: Integer = 0; //Tributada integralmente
  CST_ICMS_TRIB_MONOFASICA: Integer = 2; //Tributação monofásica própria sobre combustíveis
  CST_ICMS_TRIB_COM_ST: Integer = 10; //Tributada e com cobrança do ICMS por substituição tributária
  CST_ICMS_TRIB_MONOFASICA_RETENCAO: Integer = 15; //Tributação monofásica própria e com responsabilidade pela retenção sobre combustíveis;
  CST_ICMS_TRIB_COM_RED_BC: Integer = 20; //Com redução de base de cálculo
  CST_ICMS_TRIB_ISENTA_COM_ST: Integer = 30; //Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  CST_ICMS_TRIB_ISENTA: Integer = 40; //Isenta
  CST_ICMS_TRIB_NAO_TRIBUTADA: Integer = 41; //Não tributada
  CST_ICMS_TRIB_SUSPENSAO: Integer = 50; //Suspensão
  CST_ICMS_TRIB_DIFERIDA: Integer = 51; //Diferimento
  CST_ICMS_TRIB_MONOFASICA_DIFERIDO: Integer = 53; //Tributação monofásica sobre combustíveis com recolhimento diferido;
  CST_ICMS_TRIB_COBRADA_POR_ST: Integer = 60; //ICMS cobrado anteriormente por substituição tributária
  CST_ICMS_TRIB_MONOFASICA_COBRADA_ANTERIORMENTE: Integer = 61; //Tributação monofásica sobre combustíveis cobrada anteriormente;
  CST_ICMS_TRIB_RED_BC_COM_ST: Integer = 70; //Com redução de base de cálculo e cobrança do ICMS por substituição tributária ICMS por substituição tributária
  CST_ICMS_TRIB_OUTROS: Integer = 90; //Outros

  CST_IPI_ENTRADA_COM_REC_CREDITO: String = '00'; //Entrada com recuperação de crédito
  CST_IPI_OUTRAS_ENTRADAS: String = '49'; //Outras entradas
  CST_IPI_SAIDA_TRIBUTADA: String = '50'; //Saída tributada
  CST_IPI_OUTRAS_SAIDAS: String = '99'; //Outras saídas

  CST_IPI_ENTRADA_TRIB: String = '01'; //Entrada tributada com alíquota zero
  CST_IPI_ENTRADA_ISENTA: String = '02'; //Entrada isenta
  CST_IPI_ENTRADA_NAO_TRIB: String = '03'; //Entrada não-tributada
  CST_IPI_ENTRADA_IMUNE: String = '04'; //Entrada imune
  CST_IPI_ENTRADA_SUSPENSAO: String = '05'; //Entrada com suspensão
  CST_IPI_SAIDA_TRIB: String = '51'; //Saída tributada com alíquota zero
  CST_IPI_SAIDA_ISENTA: String = '52'; //Saída isenta
  CST_IPI_SAIDA_NAO_TRIB: String = '53'; //Saída não-tributada
  CST_IPI_SAIDA_IMUNE: String = '54'; //Saída imune
  CST_IPI_SAIDA_SUSPENSAO: String = '55'; //Saída com suspensão

  CST_PIS_TRIB_ALIQ_NORMAL: Integer = 01; //Operação Tributável (base de cálculo = valor da operação alíquota normal (cumulativo/não cumulativo));
  CST_PIS_TRIB_ALIQ_DIF: Integer = 02; //Operação Tributável (base de cálculo = valor da operação (alíquota diferenciada));
  CST_PIS_TRIB_ALIQ_UN_PRODUTO: Integer = 03; //Operação Tributável (base de cálculo = quantidade vendida x alíquota por unidade de produto);
  CST_PIS_TRIB_MONOFASICA: Integer = 04; //Operação Tributável (tributação monofásica (alíquota zero));
  CST_PIS_TRIB_ALIQ_ZERO: Integer = 06; //Operação Tributável (alíquota zero);
  CST_PIS_TRIB_ISENTA: Integer = 07; //Operação Isenta da Contribuição;
  CST_PIS_TRIB_SEM_INCIDENCIA: Integer = 08; //Operação Sem Incidência da Contribuição;
  CST_PIS_TRIB_SUSPENSA: Integer = 09; //Operação com Suspensão da Contribuição;
  CST_PIS_TRIB_OUTRAS: Integer = 99; //Outras Operações;

  FIN_NFE_NORMAL: Integer = 1;
  FIN_NFE_COMPLEMENTAR: Integer = 2;
  FIN_NFE_AJUSTE: Integer = 3;

  IND_PAG_VISTA: String = '0';
  IND_PAG_PRAZO: String = '1';
  IND_PAG_OUTROS: String = '2';

  IND_TOT_NAO_COMPOE_TOTAL: Integer = 0;
  IND_TOT_COMPOE_TOTAL: Integer = 1;

  MOD_BC_ST_TABELADO: Integer = 0;
  MOD_BC_ST_NEGATIVA: Integer = 1;
  MOD_BC_ST_POSITIVA: Integer = 2;
  MOD_BC_ST_NEUTRA: Integer = 3;
  MOD_BC_ST_MARGEM_VAL_AGREGADO: Integer = 4;
  MOD_BC_ST_PAUTA: Integer = 5;

  MOD_BC_VAL_AGREGADO: Integer = 0;
  MOD_BC_VAL_PAUTA: Integer = 1;
  MOD_BC_VAL_TABELADO: Integer = 2;
  MOD_BC_VAL_OPERACAO: Integer = 3;

  MOD_FRETE_EMITENTE: Integer = 0;
  MOD_FRETE_DESTINATARIO: Integer = 1;
  MOD_FRETE_TERCEIRO: Integer = 2;
  MOD_FRETE_PROPRIO_REMETENTE: Integer = 3;
  MOD_FRETE_PROPRIO_DESTINATARIO: Integer = 4;
  MOD_FRETE_SEM_FRETE: Integer = 9;

  MODELO_ECF_MAQ_REG: String = '2B';
  MODELO_ECF_CF_PDV: String = '2C';
  MODELO_ECF_CF_ECF: String = '2D';

  MOTIVO_DESONERA_TAXI: Integer = 1;
  MOTIVO_DESONERA_DEFICIENTE: Integer = 2;
  MOTIVO_DESONERA_PRODUTOR_AGRO: Integer = 3;
  MOTIVO_DESONERA_FROTISTA_LOCADORA: Integer = 4;
  MOTIVO_DESONERA_DIPLOMATICO: Integer = 5;
  MOTIVO_DESONERA_UTILITARIOS: Integer = 6;
  MOTIVO_DESONERA_SUFRAMA: Integer = 7;
  MOTIVO_DESONERA_OUTROS: Integer = 9;

  ORIG_ICMS_NACIONAL: Integer = 0;
  ORIG_ICMS_ESTRANG_IMPORTACAO: Integer = 1;
  ORIG_ICMS_ESTRANG_INTERNA: Integer = 2;

  PROC_EMI_APP_CONTRIBUINTE: Integer = 0;
  PROC_EMI_AVULSA_FISCO: Integer = 1;
  PROC_EMI_AVULSA_SITE: Integer = 2;
  PROC_EMI_APP_FISCO: Integer = 3;

  CRT_SIMPLES_NACIONAL: Integer = 1;
  CRT_SIMPLES_NACIONAL_EXCESSO: Integer = 2;
  CRT_NORMAL: Integer = 3;

  SIT_ISSQN_NORMAL: String = 'N';
  SIT_ISSQN_RETIDA: String = 'R';
  SIT_ISSQN_SUBSTITUTA: String = 'S';
  SIT_ISSQN_ISENTA: String = 'I';

  TP_AMB_PRODUCAO: Integer = 1;
  TP_AMB_HOMOLOGACAO: Integer = 2;

  TP_EMIS_NORMAL: Integer = 1;
  TP_EMIS_CONTINGENCIA_FS: Integer = 2;
  TP_EMIS_CONTINGENCIA_SCAN: Integer = 3;
  TP_EMIS_CONTINGENCIA_DPEC: Integer = 4;
  TP_EMIS_CONTINGENCIA_FSDA: Integer = 5;

  TP_IMP_RETRATO: Integer = 1;
  TP_IMP_PAISAGEM: Integer = 2;

  TP_NF_ENTRADA: Integer = 0;
  TP_NF_SAIDA: Integer = 1;

  VERSAO_APLICATIVO: String = '1.0';
  VERSAO_NFE_1_10: String = '1.10';
  VERSAO_NFE_2: String = '2.00';
  VERSAO_NFE_3_10: String = '3.10';
  VERSAO_NFE_4_00: String = '4.00';
  VERSAO_CCE_1_00: String = '1.00';
  
implementation

end.
 