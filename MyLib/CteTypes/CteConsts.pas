unit CteConsts;

interface

const
  CST_ICMS_TRIB_INTEGRAL: Integer = 0; //Tributada integralmente
  CST_ICMS_TRIB_COM_ST: Integer = 10; //Tributada e com cobrança do ICMS por substituição tributária
  CST_ICMS_TRIB_COM_RED_BC: Integer = 20; //Com redução de base de cálculo
  CST_ICMS_TRIB_ISENTA_COM_ST: Integer = 30; //Isenta ou não tributada e com cobrança do ICMS por substituição tributária
  CST_ICMS_TRIB_ISENTA: Integer = 40; //Isenta
  CST_ICMS_TRIB_NAO_TRIBUTADA: Integer = 41; //Não tributada
  CST_ICMS_TRIB_SUSPENSAO: Integer = 50; //Suspensão
  CST_ICMS_TRIB_DIFERIDA: Integer = 51; //Diferimento
  CST_ICMS_TRIB_COBRADA_POR_ST: Integer = 60; //ICMS cobrado anteriormente por substituição tributária
  CST_ICMS_TRIB_RED_BC_COM_ST: Integer = 70; //Com redução de base de cálculo e cobrança do ICMS por substituição tributária ICMS por substituição tributária
  CST_ICMS_TRIB_OUTROS: Integer = 90; //Outros

  FOR_PAG_PAGO: Integer = 0;
  FOR_PAG_PAGAR: Integer = 1;
  FOR_PAG_OUTROS: Integer = 2;

  MODAL_RODOVIARIO: Integer = 1; //01-Rodoviário;
  MODAL_AEREO: Integer = 2; //02-Aéreo;
  MODAL_AQUAVIARIO: Integer = 3; //03-Aquaviário;
  MODAL_FERROVIARIO: Integer = 4; //04-Ferroviário;
  MODAL_DUTOVIARIO: Integer = 5; //05-Dutoviário

  PROC_EMI_APL_CONTRIBUINTE: Integer = 0; //0 - emissão de CT-e com aplicativo do contribuinte;
  PROC_EMI_AVULSA_FISCO: Integer = 1; //1 - emissão de CT-e avulsa pelo Fisco;
  PROC_EMI_AVULSA_CONTRIBUINTE: Integer = 2; //2 - emissão de CT-e avulsa, pelo contribuinte com seu certificado digital, através do site do Fisco;
  PROC_EMI_APL_CONTRIBUINTE_FISCO: Integer = 3; //3- emissão CT-e pelo contribuinte com aplicativo fornecido pelo Fisco.

  //Se o recebedor retira no local de destino
  RETIRA_SIM: Integer = 0;
  RETIRA_NAO: Integer = 1;

  TOMA_REMETENTE: Integer = 0; //0-Remetente;
  TOMA_EXPEDIDOR: Integer = 1; //1-Expedidor;
  TOMA_RECEBEDOR: Integer = 2; //2-Recebedor;
  TOMA_DESTINATARIO: Integer = 3; //3-Destinatário
  TOMA_OUTROS: Integer = 4; //3-Destinatário

  TP_AMB_HOMOLOGACAO: Integer = 2;
  TP_AMB_PRODUCAO: Integer = 1;

  TP_CTE_NORMAL: Integer = 0; //0 - CT-e Normal,
  TP_CTE_COMPLEMENTO: Integer = 1; //1 - CT-e de Complemento de Valores,
  TP_CTE_ANULACAO: Integer = 2; //2 - CT-e de Anulação de Valores,
  TP_CTE_SUBSTITUTO: Integer = 3; //3 - CT-e Substituto

  TP_EMIS_NORMAL: Integer = 1;
  TP_EMIS_CONTINGENCIA: Integer = 2;

  TP_IMP_RETRATO: Integer = 1;
  TP_IMP_PAISAGEM: Integer = 2;

  TP_SERV_NORMAL: Integer = 0; //0 - Normal;
  TP_SERV_SUBCONTRATACAO: Integer = 1; //1 - Subcontratação;
  TP_SERV_REDESPACHO: Integer = 2; //2 - Redespacho;
  TP_SERV_REDESPACHO_ITERMEDIARIO: Integer = 3; //3 - Redespacho Intermediário

  VERSAO_CTE_1_03: String = '1.03';
  VERSAO_CTE_1_04: String = '1.04';
  VERSAO_CTE_2_00: String = '2.00';
  VERSAO_CTE_3_00: String = '3.00';
  VERSAO_CTE_4_00: String = '4.00';
  VERSAO_CTE_EVENTO_1_00: String = '1.00';

implementation

end.
