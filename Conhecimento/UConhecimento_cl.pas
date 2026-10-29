unit UConhecimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMConhecimento = class(TDataModule)
    QConhecimentoCad: TOracleDataSet1;
    QConhecimentoCadCOD_FILIAL: TIntegerField;
    QConhecimentoCadCOD_CADASTRO: TIntegerField;
    QConhecimentoCadCOD_OPERACAO: TIntegerField;
    QConhecimentoCadDT_EMISSAO: TDateTimeField;
    QConhecimentoCadNUM_CONHECIMENTO: TIntegerField;
    QConhecimentoCadCOD_NOTA_CAB: TIntegerField;
    QConhecimentoCadVAL_FRETE: TFloatField;
    QConhecimentoCadCOD_TRIBUTACAO: TIntegerField;
    QConhecimentoCadCOD_SERIE: TStringField;
    QConhecimentoCadDESC_LOCAL_COLETA: TStringField;
    QConhecimentoCadDESC_LOCAL_ENTREGA: TStringField;
    QConhecimentoCadCOD_MOTORISTA: TIntegerField;
    QConhecimentoCadDESC_PLACA: TStringField;
    QConhecimentoCadCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCadDesc_Veiculo: TStringField;
    QConhecimentoCons: TOracleDataSet1;
    QConhecimentoCadNr_Nota: TIntegerField;
    QConhecimentoCadNum_Serie: TStringField;
    QRConhecimento: TOracleDataSet1;
    QConhecimentoCadVAL_ADIANTAMENTO: TFloatField;
    QConhecimentoCadPERC_DESCONTO_FRETE: TFloatField;
    QRConhecimentoCOD_FILIAL: TIntegerField;
    QRConhecimentoCOD_CADASTRO: TIntegerField;
    QRConhecimentoCOD_OPERACAO: TIntegerField;
    QRConhecimentoDT_EMISSAO: TDateTimeField;
    QRConhecimentoNUM_CONHECIMENTO: TIntegerField;
    QRConhecimentoCOD_NOTA_CAB: TIntegerField;
    QRConhecimentoVAL_FRETE: TFloatField;
    QRConhecimentoCOD_TRIBUTACAO: TIntegerField;
    QRConhecimentoCOD_SERIE: TStringField;
    QRConhecimentoDESC_LOCAL_COLETA: TStringField;
    QRConhecimentoDESC_LOCAL_ENTREGA: TStringField;
    QRConhecimentoCOD_MOTORISTA: TIntegerField;
    QRConhecimentoDESC_PLACA: TStringField;
    QRConhecimentoVAL_ADIANTAMENTO: TFloatField;
    QRConhecimentoPERC_DESCONTO_FRETE: TFloatField;
    QRConhecimentoCOD_CONHECIMENTO: TIntegerField;
    QRConhecimentoDESC_FILIAL: TStringField;
    QRConhecimentoNOME: TStringField;
    QRConhecimentoNUM_NOTA: TIntegerField;
    QRConhecimentoDESC_OPERACAO: TStringField;
    QRConhecimentoDESC_VEICULO: TStringField;
    QRConhecimentoDESC_ENDERECO: TStringField;
    QRConhecimentoDESC_CIDADE: TStringField;
    QRConhecimentoNUM_CGC: TStringField;
    QRConhecimentoCOD_ESTADO: TStringField;
    QRConhecimentoENDERECO_DESTINATARIO: TStringField;
    QRConhecimentoUF_DESTINATARIO: TStringField;
    QRConhecimentoCGC_DESTINATARIO: TStringField;
    QRConhecimentoCIDADE_DESTINATARIO: TStringField;
    QRConhecimentoENDERECO_PROPRIETARIO: TStringField;
    QRConhecimentoCIDADE_PROPRIETARIO: TStringField;
    QRConhecimentoUF_PROPRIETARIO: TStringField;
    QRConhecimentoPROPRIETARIO: TStringField;
    QRConhecimentoDESC_INSCRICAO: TStringField;
    QRConhecimentoNUM_INSCRICAO: TStringField;
    QRConhecimentoPERC_ALIQUOTA: TFloatField;
    QRConhecimentoDESC_TELEFONE: TStringField;
    QRConhecimentoDESC_CEP: TStringField;
    QRConhecimentodesc_motorista: TStringField;
    QRConhecimentodesc_carteira: TStringField;
    QRConhecimentototal_nota: TFloatField;
    QRConhecimentototal_quantidade: TFloatField;
    QRConhecimentodt_expedicao: TDateTimeField;
    QRConhecimentodesc_cidade_veiculo: TStringField;
    QRConhecimentoNUM_CNPJ_CGC: TStringField;
    QConhecimentoCadDESC_SEGURADORA: TStringField;
    QConhecimentoCadPERC_TOLERANCIA: TFloatField;
    QConhecimentoCadVAL_PEDAGIO: TFloatField;
    QConhecimentoCadVAL_NOTA: TFloatField;
    QConhecimentoCadQT_NOTA: TFloatField;
    QConhecimentoCadVAL_IRF: TFloatField;
    QCalculaSaldo: TOracleDataSet1;
    QCalculaSaldoSALDO: TFloatField;
    QCalculaIRFPago: TOracleDataSet1;
    QCalculaIRFPagoSALDO_IRF: TFloatField;
    QConhecimentoCadVAL_ICMS: TFloatField;
    QRConhecimentoDESC_SEGURADORA: TStringField;
    QRConhecimentoPERC_TOLERANCIA: TFloatField;
    QRConhecimentoDESC_OBS: TStringField;
    QRConhecimentoVAL_PEDAGIO: TFloatField;
    QRConhecimentoVAL_NOTA: TFloatField;
    QRConhecimentoQT_NOTA: TFloatField;
    QRConhecimentoVAL_IRF: TFloatField;
    QRConhecimentoVAL_ICMS: TFloatField;
    QConhecimentoCadCOD_CONTA_PAGAR_CAB: TIntegerField;
    QConhecimentoCadDESC_OBS2: TStringField;
    QRConhecimentoDESC_OBS2: TStringField;
    QConhecimentoCadCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoCadCOD_MENSAGEM: TIntegerField;
    QConhecimentoCadDESC_TARIFA: TStringField;
    QRConhecimentoCOD_MENSAGEM: TIntegerField;
    QRConhecimentoDESC_TARIFA: TStringField;
    QConhecimentoCadIND_SITUACAO: TStringField;
    QConhecimentoAlt: TOracleDataSet1;
    QConhecimentoAltVAL_VARIACAO_FRETE: TFloatField;
    QConhecimentoAltVAL_ESTADIA: TFloatField;
    QConhecimentoAltQT_PESO_CHEGADA: TFloatField;
    DSConhecimentoAlt: TDataSource;
    QConhecimentoAltCOD_CONHECIMENTO: TIntegerField;
    QRConhecimentoContrato: TOracleDataSet1;
    QRConhecimentoSContrato: TOracleDataSet1;
    QRConhecimentoSContratoVAL_FRETE: TFloatField;
    QRConhecimentoSContratoDT_EMISSAO: TDateTimeField;
    QRConhecimentoSContratoDESC_PLACA: TStringField;
    QRConhecimentoSContratoNUM_NOTA: TIntegerField;
    QRConhecimentoSContratoNUM_CONHECIMENTO: TIntegerField;
    QRConhecimentoSContratoVAL_ADIANTAMENTO: TFloatField;
    QRConhecimentoSContratoVAL_PEDAGIO: TFloatField;
    QRConhecimentoContratoNUM_CONHECIMENTO: TIntegerField;
    QRConhecimentoContratoVAL_FRETE: TFloatField;
    QRConhecimentoContratoVAL_ADIANTAMENTO: TFloatField;
    QRConhecimentoContratoVAL_PEDAGIO: TFloatField;
    QRConhecimentoContratoDT_EMISSAO: TDateTimeField;
    QRConhecimentoContratoDESC_PLACA: TStringField;
    QRConhecimentoContratoNUM_NOTA: TIntegerField;
    QRConhecimentoContratoNUM_CONTRATO: TIntegerField;
    QRConhecimentoContratoNOME: TStringField;
    QRConhecimentoNAT_INTERESTADUAL: TIntegerField;
    QRConhecimentoNAT_ESTADUAL: TIntegerField;
    QRConhecimentoSContratoQT_NOTA: TFloatField;
    QRConhecimentoSContratoQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoContratoQT_NOTA: TFloatField;
    QRConhecimentoContratoQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoProp: TOracleDataSet1;
    QRConhecimentoPropNUM_CONHECIMENTO: TIntegerField;
    QRConhecimentoPropVAL_FRETE: TFloatField;
    QRConhecimentoPropVAL_ADIANTAMENTO: TFloatField;
    QRConhecimentoPropVAL_PEDAGIO: TFloatField;
    QRConhecimentoPropDT_EMISSAO: TDateTimeField;
    QRConhecimentoPropDESC_PLACA: TStringField;
    QRConhecimentoPropQT_NOTA: TFloatField;
    QRConhecimentoPropQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoPropVAL_IRF: TFloatField;
    QRConhecimentoPropCOD_PROPRIETARIO: TIntegerField;
    QConhecimentoAltCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoAltDESC_PAGTO_FRETE: TStringField;
    QConhecimentoAltVL_PAGTO_FRETE: TFloatField;
    QConhecimentoAltDT_PAGTO_FRETE: TDateTimeField;
    QConhecimentoAltDESC_PAGTO_ADIANTAMENTO: TStringField;
    QConhecimentoAltDT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QConhecimentoAltVL_PAGTO_ADIANTAMENTO: TFloatField;
    QConhecimentoAltval_total: TFloatField;
    QRConhecimentoContratoVAL_ESTADIA: TFloatField;
    QRConhecimentoContratoVAL_ICMS: TFloatField;
    QRConhecimentoContratoVAL_VARIACAO_FRETE: TFloatField;
    QRConhecimentoCarga: TOracleDataSet1;
    QConhecimentoCadqt_quantidade_embarque: TFloatField;
    QConhecimentoCadqt_quantidade_contrato: TFloatField;
    QRConhecimentoSContratoVAL_ESTADIA: TFloatField;
    QRConhecimentoContratoCOD_FILIAL: TIntegerField;
    QRConhecimentoContratoDESC_FILIAL: TStringField;
    QRConhecimentoSContratoVAL_ICMS: TFloatField;
    QRConhecimentoSContratoVAL_VARIACAO_FRETE: TFloatField;
    QRConhecimentoSContratoCOD_FILIAL: TIntegerField;
    QRConhecimentoSContratoDESC_FILIAL: TStringField;
    QRConhecimentoIR: TOracleDataSet1;
    QRConhecimentoNAT_INTERESTADUAL_NOVO: TIntegerField;
    QRConhecimentoNAT_ESTADUAL_NOVO: TIntegerField;
    QRConhecimentoIRCOD_PROPRIETARIO: TIntegerField;
    QRConhecimentoIRNOME: TStringField;
    QRConhecimentoIRNUM_CNPJ_CGC: TStringField;
    QRConhecimentoIRMESANO: TStringField;
    QRConhecimentoIRVAL_IRF: TFloatField;
    QRConhecimentoIRVAL_NOTA: TFloatField;
    QConhecimentoCadVAL_INSS_FORNECEDOR: TFloatField;
    QConhecimentoCadVAL_INSS_PG_OUTRAS_EMPRESAS: TFloatField;
    QRConhecimentoVAL_INSS_FORNECEDOR: TFloatField;
    QRConhecimentoValorRetido: TOracleDataSet1;
    QRConhecimentoValorRetidopercentagemfrete: TFloatField;
    QRConhecimentoValorRetidoNOME: TStringField;
    QRConhecimentoValorRetidoVAL_FRETE: TFloatField;
    QRConhecimentoValorRetidoVAL_INSS_FORNECEDOR: TFloatField;
    QRConhecimentoValorRetidoDESC_INSS: TStringField;
    QConhecimentoCadCOD_USUARIO: TIntegerField;
    QConhecimentoCadCOD_CADASTRO_DESCARGA: TIntegerField;
    QEstadia: TOracleDataSet1;
    QEstadiaCons: TOracleDataSet1;
    QREstadia: TOracleDataSet1;
    QEstadiaCOD_ESTADIA: TIntegerField;
    QEstadiaDT_EMISSAO: TDateTimeField;
    QEstadiaDT_CHEGADA: TDateTimeField;
    QEstadiaHR_CHEGADA: TIntegerField;
    QEstadiaDT_SAIDA: TDateTimeField;
    QEstadiaHR_SAIDA: TIntegerField;
    QEstadiaQT_PESO_CHEGADA: TFloatField;
    QEstadiaQT_PESO_SAIDA: TFloatField;
    QEstadiaVAL_TON_HORA: TFloatField;
    QEstadiaQT_HORAS_ISENTAS: TIntegerField;
    QEstadiaVAL_PAGO: TFloatField;
    QEstadiaNUM_ESTADIA: TIntegerField;
    QEstadiaDESC_FILIAL: TStringField;
    QEstadiaDESC_CADASTRO: TStringField;
    QEstadiaMIN_CHEGADA: TIntegerField;
    QEstadiaMIN_SAIDA: TIntegerField;
    QEstadiatot_min: TIntegerField;
    QEstadiatot_hor: TIntegerField;
    QEstadiaval_apurado: TFloatField;
    QEstadiaConsCOD_ESTADIA: TIntegerField;
    QEstadiaConsNUM_ESTADIA: TIntegerField;
    QEstadiaConsDT_EMISSAO: TDateTimeField;
    QEstadiaConsDT_CHEGADA: TDateTimeField;
    QEstadiaConsHR_CHEGADA: TIntegerField;
    QEstadiaConsMIN_CHEGADA: TIntegerField;
    QEstadiaConsDT_SAIDA: TDateTimeField;
    QEstadiaConsHR_SAIDA: TIntegerField;
    QEstadiaConsMIN_SAIDA: TIntegerField;
    QEstadiaConsQT_PESO_CHEGADA: TFloatField;
    QEstadiaConsQT_PESO_SAIDA: TFloatField;
    QEstadiaConsVAL_PAGO: TFloatField;
    QEstadiaConsDESC_FILIAL: TStringField;
    QEstadiaConsNOME: TStringField;
    QEstadiaCOD_FILIAL: TIntegerField;
    QEstadiaCOD_CADASTRO: TIntegerField;
    QEstadiaCOD_RPA: TIntegerField;
    QEstadiaCOD_CONHECIMENTO_FRETE: TIntegerField;
    QEstadiaIND_SITUACAO: TStringField;
    QEstadiaConsIND_SITUACAO: TStringField;
    QEstadia_CP: TOracleDataSet1;
    QEstadia_CPCOD_CONTA_PAGAR_CAB: TIntegerField;
    QEstadia_CPCOD_RPA: TIntegerField;
    QEstadiaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QREstadiaCOD_ESTADIA: TFloatField;
    QREstadiaNUM_ESTADIA: TFloatField;
    QREstadiaDT_EMISSAO_ESTADIA: TDateTimeField;
    QREstadiaNUM_NOTA: TFloatField;
    QREstadiaDT_EMISSAO_NOTA: TDateTimeField;
    QREstadiaNUM_RPA: TFloatField;
    QREstadiaCOD_CONHECIMENTO_FRETE: TFloatField;
    QREstadiaDT_EMISSOA_RPA_CNH: TDateTimeField;
    QREstadiaCOD_FILIAL: TFloatField;
    QREstadiaVAL_PAGO: TFloatField;
    QREstadiaQT_PESO_SAIDA: TFloatField;
    QREstadiaQT_PESO_CHEGADA: TFloatField;
    QREstadiaDESTINO: TStringField;
    QREstadiaDT_CHEGADA: TDateTimeField;
    QREstadiaDT_SAIDA: TDateTimeField;
    QREstadiatot_hor: TIntegerField;
    QREstadiatot_min: TIntegerField;
    QREstadiaHR_CHEGADA: TFloatField;
    QREstadiaMIN_CHEGADA: TFloatField;
    QREstadiaHR_SAIDA: TFloatField;
    QREstadiaMIN_SAIDA: TFloatField;
    QConhecimentoCadVAL_FALTA_MERCADORIA_CHEGADA: TFloatField;
    QRConhecimentoVAL_FALTA_MERCADORIA_CHEGADA: TFloatField;
    QRConhecimentoPropNOME: TStringField;
    QRConhecimentoPropVAL_INSS_FORNECEDOR: TFloatField;
    QConhecimentoCadDT_RECEBIMENTO: TDateTimeField;
    QRConhecimentoDESC_INSS: TStringField;
    QEstadiaDESC_OBSERVACAO: TStringField;
    QConhecimentoCadVAL_SEGURO: TFloatField;
    QRConhecimentoVAL_SEGURO: TFloatField;
    QConhecimentoCadCOD_EMBARQUE: TIntegerField;
    QConhecimentoAltCOD_EMBARQUE: TIntegerField;
    QRConhecimentoCOD_FILIAL_NOTA: TIntegerField;
    QRConhecimentoIND_ENTRADA_SAIDA: TStringField;
    QConhecimentoCadVAL_SEST_SENAT: TFloatField;
    QRConhecimentoCargaCOD_FILIAL: TIntegerField;
    QRConhecimentoCargaCOD_CADASTRO: TIntegerField;
    QRConhecimentoCargaCOD_CADASTRO_DESCARGA: TIntegerField;
    QRConhecimentoCargaDT_EMISSAO: TDateTimeField;
    QRConhecimentoCargaNUM_CONHECIMENTO: TIntegerField;
    QRConhecimentoCargaQT_NOTA: TFloatField;
    QRConhecimentoCargaQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoCargaDESC_PLACA: TStringField;
    QRConhecimentoCargaVAL_FRETE: TFloatField;
    QRConhecimentoCargaVAL_PEDAGIO: TFloatField;
    QRConhecimentoCargaVAL_ICMS: TFloatField;
    QRConhecimentoCargaVAL_ESTADIA: TFloatField;
    QRConhecimentoCargaVAL_VARIACAO_FRETE: TFloatField;
    QRConhecimentoCargaNUM_NOTA: TIntegerField;
    QRConhecimentoCargaCOD_OPERACAO: TIntegerField;
    QRConhecimentoCargaDESC_OPERACAO: TStringField;
    QRConhecimentoCargaNOME: TStringField;
    QRConhecimentoCargaDESC_FILIAL: TStringField;
    QRConhecimentoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRConhecimentoCOD_CONTRATO_VEND: TIntegerField;
    QRConhecimentoIND_SITUACAO: TStringField;
    QRConhecimentoVAL_VARIACAO_FRETE: TFloatField;
    QRConhecimentoVAL_ESTADIA: TFloatField;
    QRConhecimentoQT_PESO_CHEGADA: TFloatField;
    QRConhecimentoVL_PAGTO_ADIANTAMENTO: TFloatField;
    QRConhecimentoDT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QRConhecimentoDESC_PAGTO_ADIANTAMENTO: TStringField;
    QRConhecimentoDT_PAGTO_FRETE: TDateTimeField;
    QRConhecimentoVL_PAGTO_FRETE: TFloatField;
    QRConhecimentoDESC_PAGTO_FRETE: TStringField;
    QRConhecimentoVAL_INSS_PG_OUTRAS_EMPRESAS: TFloatField;
    QRConhecimentoCOD_USUARIO: TIntegerField;
    QRConhecimentoCOD_CADASTRO_DESCARGA: TIntegerField;
    QRConhecimentoDT_RECEBIMENTO: TDateTimeField;
    QRConhecimentoCOD_EMBARQUE: TIntegerField;
    QRConhecimentoVAL_SEST_SENAT: TFloatField;
    QConhecimentoCadCOD_BCO_MOVIMENTO: TIntegerField;
    QConhecimentoCadCOD_FILIAL_DESTINO: TIntegerField;
    QRConhecimentoPropVAL_SEST_SENAT: TFloatField;
    QRConhecimentoValorRetidoVAL_SEST_SENAT: TFloatField;
    QConhecimentoAltVAL_SEST_SENAT: TFloatField;
    QConhecimentoCad_New: TOracleDataSet1;
    QConhecimentoCad_NewCOD_FILIAL: TIntegerField;
    QConhecimentoCad_NewCOD_CADASTRO: TIntegerField;
    QConhecimentoCad_NewCOD_OPERACAO: TIntegerField;
    QConhecimentoCad_NewDT_EMISSAO: TDateTimeField;
    QConhecimentoCad_NewNUM_CONHECIMENTO: TIntegerField;
    QConhecimentoCad_NewCOD_NOTA_CAB: TIntegerField;
    QConhecimentoCad_NewVAL_FRETE: TFloatField;
    QConhecimentoCad_NewCOD_TRIBUTACAO: TIntegerField;
    QConhecimentoCad_NewCOD_SERIE: TStringField;
    QConhecimentoCad_NewDESC_LOCAL_COLETA: TStringField;
    QConhecimentoCad_NewDESC_LOCAL_ENTREGA: TStringField;
    QConhecimentoCad_NewCOD_MOTORISTA: TIntegerField;
    QConhecimentoCad_NewDESC_PLACA: TStringField;
    QConhecimentoCad_NewVAL_ADIANTAMENTO: TFloatField;
    QConhecimentoCad_NewPERC_DESCONTO_FRETE: TFloatField;
    QConhecimentoCad_NewCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCad_NewDESC_SEGURADORA: TStringField;
    QConhecimentoCad_NewPERC_TOLERANCIA: TFloatField;
    QConhecimentoCad_NewDESC_OBS: TStringField;
    QConhecimentoCad_NewVAL_PEDAGIO: TFloatField;
    QConhecimentoCad_NewVAL_NOTA: TFloatField;
    QConhecimentoCad_NewQT_NOTA: TFloatField;
    QConhecimentoCad_NewVAL_IRF: TFloatField;
    QConhecimentoCad_NewVAL_ICMS: TFloatField;
    QConhecimentoCad_NewCOD_CONTA_PAGAR_CAB: TIntegerField;
    QConhecimentoCad_NewDESC_OBS2: TStringField;
    QConhecimentoCad_NewCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoCad_NewCOD_MENSAGEM: TIntegerField;
    QConhecimentoCad_NewDESC_TARIFA: TStringField;
    QConhecimentoCad_NewIND_SITUACAO: TStringField;
    QConhecimentoCad_NewVAL_VARIACAO_FRETE: TFloatField;
    QConhecimentoCad_NewVAL_ESTADIA: TFloatField;
    QConhecimentoCad_NewQT_PESO_CHEGADA: TFloatField;
    QConhecimentoCad_NewVL_PAGTO_ADIANTAMENTO: TFloatField;
    QConhecimentoCad_NewDT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QConhecimentoCad_NewDESC_PAGTO_ADIANTAMENTO: TStringField;
    QConhecimentoCad_NewDT_PAGTO_FRETE: TDateTimeField;
    QConhecimentoCad_NewVL_PAGTO_FRETE: TFloatField;
    QConhecimentoCad_NewDESC_PAGTO_FRETE: TStringField;
    QConhecimentoCad_NewVAL_INSS_FORNECEDOR: TFloatField;
    QConhecimentoCad_NewVAL_INSS_PG_OUTRAS_EMPRESAS: TFloatField;
    QConhecimentoCad_NewCOD_USUARIO: TIntegerField;
    QConhecimentoCad_NewCOD_CADASTRO_DESCARGA: TIntegerField;
    QConhecimentoCad_NewVAL_FALTA_MERCADORIA_CHEGADA: TFloatField;
    QConhecimentoCad_NewDT_RECEBIMENTO: TDateTimeField;
    QConhecimentoCad_NewVAL_SEGURO: TFloatField;
    QConhecimentoCad_NewCOD_EMBARQUE: TIntegerField;
    QConhecimentoCad_NewVAL_SEST_SENAT: TFloatField;
    QConhecimentoCad_NewCOD_BCO_MOVIMENTO: TIntegerField;
    QConhecimentoCad_NewCOD_FILIAL_DESTINO: TIntegerField;
    QConhecimentoCadVAL_VARIACAO_FRETE: TFloatField;
    QConhecimentoCadVAL_ESTADIA: TFloatField;
    QConhecimentoCadQT_PESO_CHEGADA: TFloatField;
    QConhecimentoCadVL_PAGTO_ADIANTAMENTO: TFloatField;
    QConhecimentoCadDT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QConhecimentoCadDESC_PAGTO_ADIANTAMENTO: TStringField;
    QConhecimentoCadDT_PAGTO_FRETE: TDateTimeField;
    QConhecimentoCadVL_PAGTO_FRETE: TFloatField;
    QConhecimentoCadDESC_PAGTO_FRETE: TStringField;
    QConhecimentoCadVAL_CONTABIL: TFloatField;
    QConhecimentoCad_NewVAL_CONTABIL: TFloatField;
    QConhecimentoCadDESC_CARTAO_PEDAGIO: TStringField;
    QRConhecimentoDESC_CARTAO_PEDAGIO: TStringField;
    QConhecimentoCad_NewDESC_CARTAO_PEDAGIO: TStringField;
    QRConhecimentoContratoCOD_PRODUTO: TIntegerField;
    QRConhecimentoContratoDESC_PRODUTO: TStringField;
    QRConhecimentoSContratoDESC_PRODUTO: TStringField;
    QRConhecimentoSContratoCOD_PRODUTO: TIntegerField;
    QConhecimentoCadCOD_CADASTRO_REMETENTE: TIntegerField;
    QConhecimentoCadCOD_CADASTRO_PAGADOR: TIntegerField;
    QConhecimentoCadIND_PAGAR_PAGO: TStringField;
    QConhecimentoCadVAL_TARIFA: TFloatField;
    QConhecimentoCadVAL_TARIFA_PROPRIETARIO: TFloatField;
    QRConhecimentoIND_PAGAR_PAGO: TStringField;
    QRConhecimentoVAL_TARIFA: TFloatField;
    QRConhecimentoVAL_TARIFA_PROPRIETARIO: TFloatField;
    QConhecimentoCadCOD_PRODUTO: TFloatField;
    QRConhecimentoCOD_CADASTRO_REMETENTE: TIntegerField;
    QRConhecimentoCOD_CADASTRO_PAGADOR: TIntegerField;
    QRConhecimentoCOD_PRODUTO: TFloatField;
    QConhecimentoCadNUM_NOTA: TIntegerField;
    QRConhecimentoNUM_NOTA_CAB: TIntegerField;
    QControleViagemCab: TOracleDataSet1;
    QControleViagemCabCOD_CONTROLE_VIAGEM_CAB: TIntegerField;
    QControleViagemCabCOD_MOTORISTA: TIntegerField;
    QControleViagemCabDT_SAIDA: TDateTimeField;
    QControleViagemCabDT_CHEGADA: TDateTimeField;
    QControleViagemCabDESC_DESTINO: TStringField;
    QControleViagemCabQT_COMBUSTIVEL: TFloatField;
    QControleViagemCabVAL_COMBUSTIVEL: TFloatField;
    QControleViagemCabVAL_REFEICAO: TFloatField;
    QControleViagemCabVAL_CHAPA: TFloatField;
    QControleViagemCabVAL_PEDAGIO: TFloatField;
    QControleViagemCabVAL_DIVERSOS: TFloatField;
    QControleViagemCabVAL_MANUTENCAO: TFloatField;
    QControleViagemCabVAL_SALARIO: TFloatField;
    QControleViagemCabVAL_SEGURO: TFloatField;
    QControleViagemCabVAL_COMBUSTIVEL_CAMARA: TFloatField;
    QControleViagemCabDESC_PLACA: TStringField;
    QControleViagemCabDESC_OBS: TStringField;
    QRControleViagem: TOracleDataSet1;
    QControleViagemCabQT_PESO_CLIENTE: TFloatField;
    QControleViagemCabVAL_CLIENTE: TFloatField;
    QControleViagemCabPERC_COMISSAO_CLIENTE: TFloatField;
    QControleViagemCabQT_PESO_DISTRIBUIDOR: TFloatField;
    QControleViagemCabVAL_DISTRIBUIDOR: TFloatField;
    QControleViagemCabQT_PESO_OUTRO: TFloatField;
    QControleViagemCabVAL_OUTRO: TFloatField;
    QControleViagemCabDESC_DIVERSOS: TStringField;
    QControleViagemCabQT_KM_SAIDA: TFloatField;
    QControleViagemCabQT_KM_CHEGADA: TFloatField;
    QControleViagemCabQT_KM_ENTRE_ENTREGAS: TFloatField;
    QControleViagemCabDESC_RETORNO: TStringField;
    QControleViagemCabQT_PESO_RETORNO: TFloatField;
    QControleViagemCabDT_RETORNO: TDateTimeField;
    QControleViagemCabVAL_BRUTO_RETORNO: TFloatField;
    QControleViagemCabVAL_COMISSAO_RETORNO: TFloatField;
    QControleViagemCabDESC_SAIDA_RETORNO: TStringField;
    QControleViagemCabDESC_CHEGADA_RETORNO: TStringField;
    QControleViagemCabNUM_ENTREGA: TIntegerField;
    QControleViagemCons: TOracleDataSet1;
    QControleViagemConsCOD_CONTROLE_VIAGEM_CAB: TIntegerField;
    QControleViagemConsCOD_MOTORISTA: TIntegerField;
    QControleViagemConsDT_SAIDA: TDateTimeField;
    QControleViagemConsDT_CHEGADA: TDateTimeField;
    QControleViagemConsDESC_DESTINO: TStringField;
    QControleViagemConsQT_COMBUSTIVEL: TFloatField;
    QControleViagemConsVAL_COMBUSTIVEL: TFloatField;
    QControleViagemConsVAL_REFEICAO: TFloatField;
    QControleViagemConsVAL_CHAPA: TFloatField;
    QControleViagemConsVAL_PEDAGIO: TFloatField;
    QControleViagemConsVAL_DIVERSOS: TFloatField;
    QControleViagemConsVAL_MANUTENCAO: TFloatField;
    QControleViagemConsVAL_SALARIO: TFloatField;
    QControleViagemConsVAL_SEGURO: TFloatField;
    QControleViagemConsVAL_COMBUSTIVEL_CAMARA: TFloatField;
    QControleViagemConsDESC_PLACA: TStringField;
    QControleViagemConsDESC_OBS: TStringField;
    QControleViagemConsQT_PESO_CLIENTE: TFloatField;
    QControleViagemConsVAL_CLIENTE: TFloatField;
    QControleViagemConsQT_PESO_DISTRIBUIDOR: TFloatField;
    QControleViagemConsVAL_DISTRIBUIDOR: TFloatField;
    QControleViagemConsQT_PESO_OUTRO: TFloatField;
    QControleViagemConsVAL_OUTRO: TFloatField;
    QControleViagemConsDESC_DIVERSOS: TStringField;
    QControleViagemConsQT_KM_SAIDA: TFloatField;
    QControleViagemConsQT_KM_CHEGADA: TFloatField;
    QControleViagemConsQT_KM_ENTRE_ENTREGAS: TFloatField;
    QControleViagemConsDESC_RETORNO: TStringField;
    QControleViagemConsQT_PESO_RETORNO: TFloatField;
    QControleViagemConsDT_RETORNO: TDateTimeField;
    QControleViagemConsVAL_BRUTO_RETORNO: TFloatField;
    QControleViagemConsVAL_COMISSAO_RETORNO: TFloatField;
    QControleViagemConsDESC_SAIDA_RETORNO: TStringField;
    QControleViagemConsDESC_CHEGADA_RETORNO: TStringField;
    QControleViagemConsPERC_COMISSAO_CLIENTE: TFloatField;
    QControleViagemConsNUM_ENTREGA: TIntegerField;
    QControleViagemConsDESC_VEICULO: TStringField;
    QControleViagemConsNOME: TStringField;
    QControleViagemCabVAL_CHAPA_RETORNO: TFloatField;
    QRControleViagemCOD_CONTROLE_VIAGEM_CAB: TIntegerField;
    QRControleViagemCOD_MOTORISTA: TIntegerField;
    QRControleViagemDT_SAIDA: TDateTimeField;
    QRControleViagemDT_CHEGADA: TDateTimeField;
    QRControleViagemDESC_DESTINO: TStringField;
    QRControleViagemQT_COMBUSTIVEL: TFloatField;
    QRControleViagemVAL_COMBUSTIVEL: TFloatField;
    QRControleViagemVAL_REFEICAO: TFloatField;
    QRControleViagemVAL_CHAPA: TFloatField;
    QRControleViagemVAL_PEDAGIO: TFloatField;
    QRControleViagemVAL_DIVERSOS: TFloatField;
    QRControleViagemVAL_MANUTENCAO: TFloatField;
    QRControleViagemVAL_SALARIO: TFloatField;
    QRControleViagemVAL_SEGURO: TFloatField;
    QRControleViagemVAL_COMBUSTIVEL_CAMARA: TFloatField;
    QRControleViagemDESC_PLACA: TStringField;
    QRControleViagemDESC_OBS: TStringField;
    QRControleViagemQT_PESO_CLIENTE: TFloatField;
    QRControleViagemVAL_CLIENTE: TFloatField;
    QRControleViagemQT_PESO_DISTRIBUIDOR: TFloatField;
    QRControleViagemVAL_DISTRIBUIDOR: TFloatField;
    QRControleViagemQT_PESO_OUTRO: TFloatField;
    QRControleViagemVAL_OUTRO: TFloatField;
    QRControleViagemDESC_DIVERSOS: TStringField;
    QRControleViagemQT_KM_SAIDA: TFloatField;
    QRControleViagemQT_KM_CHEGADA: TFloatField;
    QRControleViagemQT_KM_ENTRE_ENTREGAS: TFloatField;
    QRControleViagemDESC_RETORNO: TStringField;
    QRControleViagemQT_PESO_RETORNO: TFloatField;
    QRControleViagemDT_RETORNO: TDateTimeField;
    QRControleViagemVAL_BRUTO_RETORNO: TFloatField;
    QRControleViagemVAL_COMISSAO_RETORNO: TFloatField;
    QRControleViagemDESC_SAIDA_RETORNO: TStringField;
    QRControleViagemDESC_CHEGADA_RETORNO: TStringField;
    QRControleViagemPERC_COMISSAO_CLIENTE: TFloatField;
    QRControleViagemNUM_ENTREGA: TIntegerField;
    QRControleViagemVAL_CHAPA_RETORNO: TFloatField;
    QRControleViagemMOTORISTA: TStringField;
    QRControleViagemDESC_VEICULO: TStringField;
    QRConhecimentoCEP_DESTINATARIO: TStringField;
    QRConhecimentoCIDADE_MOTORISTA: TStringField;
    QConhecimentoCadCOD_CONTA_RECEBER_CAB: TIntegerField;
    QConhecimentoCadNUM_VOLUME: TIntegerField;
    QConhecimentoCadDESC_ESPECIE_VOLUME: TStringField;
    QRConhecimentoNUM_VOLUME: TIntegerField;
    QRConhecimentoDESC_ESPECIE_VOLUME: TStringField;
    QRConhecimentoCOD_BCO_MOVIMENTO: TIntegerField;
    QRConhecimentoCOD_FILIAL_DESTINO: TIntegerField;
    QRConhecimentoVAL_CONTABIL: TFloatField;
    QRConhecimentoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QRConhecimentoDESC_CIDADE_REMETENTE: TStringField;
    QRConhecimentoCOD_ESTADO_REMETENTE: TStringField;
    QRConhecimentoDESC_CIDADE_DESTINATARIO: TStringField;
    QRConhecimentoNOME_REMETENTE: TStringField;
    QRConhecimentoDESC_PLACA_REBOQUE: TStringField;
    QRConhecimentoCOD_CADASTRO_CONSIGNATARIO: TIntegerField;
    QRConhecimentoNOME_CONSIGNATARIO: TStringField;
    QRConhecimentoNOME_MOTORISTA: TStringField;
    QRConhecimentoNUM_CPF_MOTORISTA: TStringField;
    QRConhecimentoNUM_RG_MOTORISTA: TStringField;
    QRConhecimentoDESC_CARTEIRA_MOTORISTA: TStringField;
    QConhecimentoCadDESC_PLACA_REBOQUE: TStringField;
    QConhecimentoCadCOD_CADASTRO_CONSIGNATARIO: TIntegerField;
    n: TStringField;
    QConhecimentoAduaneiro: TOracleDataSet1;
    QRConhecimentoAduaneiro: TOracleDataSet1;
    QConhecimentoAduaneiroCons: TOracleDataSet1;
    QConhecimentoAduaneirodesc_veiculo: TStringField;
    QConhecimentoAduaneirodesc_reboque: TStringField;
    QConhecimentoAduaneiroCOD_CONHECIMENTO_ADUANEIRO: TIntegerField;
    QConhecimentoAduaneiroDT_EMISSAO: TDateTimeField;
    QConhecimentoAduaneiroDESC_PLACA: TStringField;
    QConhecimentoAduaneiroDESC_PLACA_REBOQUE: TStringField;
    QConhecimentoAduaneiroCOD_MOTORISTA: TIntegerField;
    QConhecimentoAduaneiroCOD_CIDADE_ORIGEM: TIntegerField;
    QConhecimentoAduaneiroCOD_CIDADE_DESTINO: TIntegerField;
    QConhecimentoAduaneiroConsCOD_CONHECIMENTO_ADUANEIRO: TIntegerField;
    QConhecimentoAduaneiroConsDT_EMISSAO: TDateTimeField;
    QConhecimentoAduaneiroConsDESC_PLACA: TStringField;
    QConhecimentoAduaneiroConsDESC_PLACA_REBOQUE: TStringField;
    QConhecimentoAduaneiroConsCOD_MOTORISTA: TIntegerField;
    QConhecimentoAduaneiroConsCOD_CIDADE_ORIGEM: TIntegerField;
    QConhecimentoAduaneiroConsCOD_CIDADE_DESTINO: TIntegerField;
    QRConhecimentoAduaneiroCOD_CONHECIMENTO_ADUANEIRO: TIntegerField;
    QRConhecimentoAduaneiroDT_EMISSAO: TDateTimeField;
    QRConhecimentoAduaneiroDESC_PLACA: TStringField;
    QRConhecimentoAduaneiroDESC_PLACA_REBOQUE: TStringField;
    QRConhecimentoAduaneiroCOD_MOTORISTA: TIntegerField;
    QRConhecimentoAduaneiroCOD_CIDADE_ORIGEM: TIntegerField;
    QRConhecimentoAduaneiroCOD_CIDADE_DESTINO: TIntegerField;
    QRConhecimentoAduaneiroDESC_CIDADE_ORIGEM: TStringField;
    QRConhecimentoAduaneiroDESC_CIDADE_DESTINO: TStringField;
    QRConhecimentoAduaneiroCOD_ESTADO_ORIGEM: TStringField;
    QRConhecimentoAduaneiroCOD_ESTADO_DESTINO: TStringField;
    QRConhecimentoAduaneiroDESC_CIDADE_ESTADO_ORIGEM: TStringField;
    QRConhecimentoAduaneiroDESC_CIDADE_ESTADO_DESTINO: TStringField;
    QRConhecimentoAduaneiroNOME_PROPRIETARIO: TStringField;
    QRConhecimentoAduaneiroDESC_ENDERECO_PROPRIETARIO: TStringField;
    QRConhecimentoAduaneiroDESC_FROTA: TStringField;
    QRConhecimentoAduaneiroDESC_MARCA: TStringField;
    QRConhecimentoAduaneiroDESC_CHASSIS: TStringField;
    QRConhecimentoAduaneiroVAL_MAX_CARGA: TIntegerField;
    QRConhecimentoAduaneiroDESC_ANO_MODELO: TStringField;
    QRConhecimentoAduaneiroNOME_MOTORISTA: TStringField;
    QRConhecimentoAduaneiroNUM_RG_MOTORISTA: TStringField;
    QRConhecimentoAduaneiroNUM_CPF_MOTORISTA: TStringField;
    QRConhecimentoAduaneiroDESC_CARTEIRA_MOTORISTA: TStringField;
    QConhecimentoAduaneiroMotCons: TOracleDataSet1;
    QConhecimentoAduaneiroMotConsCOD_MOTORISTA: TIntegerField;
    QConhecimentoAduaneiroMotConsNOME: TStringField;
    QConhecimentoAduaneiroMotConsDESC_CPF: TStringField;
    QConhecimentoAduaneiroMotConsDESC_RG: TStringField;
    QConhecimentoAduaneiroMotConsDESC_CNH: TStringField;
    QRConhecimentoDESC_ENDERECO_REMETENTE: TStringField;
    QRConhecimentoNUM_INSCRICAO_REMETENTE: TStringField;
    QRConhecimentoNUM_CGC_CPF_REMETENTE: TStringField;
    QRConhecimentoDESC_PRODUTO: TStringField;
    QRConhecimentoDESC_TIPO_VEICULO: TStringField;
    QRConhecimentoENDERECO_MOTORISTA: TStringField;
    QRConhecimentoDESC_INSCRICAO_INSS_MOTORISTA: TStringField;
    QConhecimentoCadDESC_NOTAS: TStringField;
    QRConhecimentoDESC_NOTAS: TStringField;
    QRConhecimentoAduaneiroDESC_FROTA_REBOQUE: TStringField;
    QConhecimentoCadVAL_DESCARGA: TFloatField;
    QRConhecimentoVAL_DESCARGA: TFloatField;
    QCaixa_Volta_Conhecimento: TOracleDataSet1;
    QCaixa_Volta_ConhecimentoCOD_CAIXA_MOV: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_USUARIO: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_FILIAL: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_DEPARTAMENTO: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_HISTORICO: TIntegerField;
    QCaixa_Volta_ConhecimentoDT_MOVIMENTO: TDateTimeField;
    QCaixa_Volta_ConhecimentoVAL_MOVIMENTO: TFloatField;
    QCaixa_Volta_ConhecimentoDESC_HORARIO: TStringField;
    QCaixa_Volta_ConhecimentoNUM_DOCUMENTO: TFloatField;
    QCaixa_Volta_ConhecimentoCOD_CADASTRO: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_NOTA_CAB: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixa_Volta_ConhecimentoDT_USUARIO: TDateTimeField;
    QCaixa_Volta_ConhecimentoDESC_COMPLEMENTO: TStringField;
    QCaixa_Volta_ConhecimentoCOD_CONTRATO_MOV: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_BCO_MOVIMENTO: TIntegerField;
    QCaixa_Volta_ConhecimentoDESC_COMPLEMENTO1: TStringField;
    QCaixa_Volta_ConhecimentoCOD_PEDIDO_CAB: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_ORDEM_COMPRA_CAB: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_OFICINA_CAB: TIntegerField;
    QCaixa_Volta_ConhecimentoNUM_OS: TIntegerField;
    QCaixa_Volta_ConhecimentoCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCadCOD_CST_PIS: TStringField;
    QConhecimentoCadCOD_CST_COFINS: TStringField;
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
    QConhecimentoCadCOD_SERIE_MODELO: TStringField;
    QConhecimentoCadDESC_CHAVE_ACESSO_CTE: TStringField;
    QConhecimentoCadVAL_PIS: TFloatField;
    QConhecimentoCadVAL_COFINS: TFloatField;
    QConhecimentoCadIND_TIPO_SERVICO: TIntegerField;
    QConhecimentoCadIND_TOMADOR_SERVICO: TIntegerField;
    QConhecimentoCadCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QConhecimentoCadCOD_CADASTRO_EXPEDIDOR: TIntegerField;
    QConhecimentoCadCOD_CADASTRO_RECEBEDOR: TIntegerField;
    QConhecimentoCadDT_PREVISAO_ENTREGA: TDateTimeField;
    QConhecimentoCadIND_FORMA_PGTO: TIntegerField;
    QConhecimentoCadCOD_CIDADE_ORIGEM: TIntegerField;
    QConhecimentoCadCOD_CIDADE_DESTINO: TIntegerField;
    QConhecimentoCadIND_RESP_SEGURO: TIntegerField;
    QConhecimentoCadNUM_APOLICE_SEGURO: TStringField;
    QConhecimentoCadNUM_AVERBACAO_SEGURO: TStringField;
    QConhecimentoCadVAL_BASE_ICMS: TFloatField;
    QConhecimentoCadVAL_ICMS_SUBST: TFloatField;
    QConhecimentoCadVAL_BASE_ICMS_SUBST: TFloatField;
    QConhecimentoCadIND_LOTACAO: TIntegerField;
    QConhecimentoCadDESC_CIOT: TStringField;
    QConhecimentoCadDESC_LACRES: TMemoField;
    QConhecimentoCadCOD_FORN_VALE_PEDAGIO: TIntegerField;
    QConhecimentoCadCOD_RESP_VALE_PEDAGIO: TIntegerField;
    QConhecimentoCadDESC_COMP_VALE_PEDAGIO: TStringField;
    QDocOriginario: TOracleDataSet;
    QDocOriginarioCOD_DOC_ORIGINARIO: TIntegerField;
    QDocOriginarioCOD_CONHECIMENTO: TIntegerField;
    QDocOriginarioDESC_CHAVE_ACESSO: TStringField;
    QDocOriginarioDESC_PIN_SUFRAMA: TStringField;
    QDocOriginarioCOD_NOTA_CAB: TIntegerField;
    QMotoristaCTe: TOracleDataSet;
    QMotoristaCTeCOD_MOTORISTA_CTE: TIntegerField;
    QMotoristaCTeCOD_CADASTRO: TIntegerField;
    QMotoristaCTeCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCadIND_TIPO_CTE: TIntegerField;
    QMotoristaCTenome: TStringField;
    QMotoristaCTedesc_cpf: TStringField;
    QConhecimentoCadnome_produto: TStringField;
    QConhecimentoCadDESC_OUT_CARAC_CARGA: TStringField;
    QConhecimentoCadNUM_PESO_BRUTO: TFloatField;
    QConhecimentoCadVAL_TOTAL_CARGA: TFloatField;
    QConhecimentoCadNUM_PESO_BC: TFloatField;
    QConhecimentoCadNUM_PESO_AFERIDO: TFloatField;
    QConhecimentoCadNUM_CUBAGEM: TFloatField;
    QConhecimentoCadVAL_DESPACHO: TFloatField;
    QConhecimentoCadVAL_GRIS: TFloatField;
    QConhecimentoCadVAL_FRETE_PESO: TFloatField;
    QConhecimentoCadDESC_CARAC_ADICIONAL_TRANSP: TStringField;
    QConhecimentoCadDESC_CARAC_ADICIONAL_SERV: TStringField;
    QConhecimentoCadDESC_FUNC_EMISSOR_CTE: TStringField;
    QConhecimentoCadDESC_INF_ADIC_FISCO: TMemoField;
    QVeiculoCTe: TOracleDataSet;
    QVeiculoCTeCOD_VEICULO_CTE: TIntegerField;
    QVeiculoCTeDESC_PLACA: TStringField;
    QVeiculoCTeCOD_CONHECIMENTO: TIntegerField;
    QVeiculoCTedesc_veiculo: TStringField;
    QConhecimentoConsCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoConsNUM_CONHECIMENTO: TIntegerField;
    QConhecimentoConsDT_EMISSAO: TDateTimeField;
    QConhecimentoConsCOD_NOTA_CAB: TIntegerField;
    QConhecimentoConsCOD_CONTRATO_VEND: TIntegerField;
    QConhecimentoConsDESC_FILIAL: TStringField;
    QConhecimentoConsnum_nota: TIntegerField;
    QConhecimentoCaddesc_situacao: TStringField;
    QConhecimentoCaddesc_situacao_sefaz: TStringField;
    QConhecimentoCadIND_AMBIENTE_CTE: TIntegerField;
    QConhecimentoCadIND_CONTINGENCIA_CTE: TStringField;
    QConhecimentoCadCOD_UF_ORIGEM: TStringField;
    QConhecimentoCadCOD_UF_DESTINO: TStringField;
    QDocOriginarioNUM_DOCUMENTO: TStringField;
    QDocOriginarioVAL_BASE_ICMS: TFloatField;
    QDocOriginarioVAL_ICMS: TFloatField;
    QDocOriginarioVAL_BASE_ICMS_SUBST: TFloatField;
    QDocOriginarioVAL_ICMS_SUBST: TFloatField;
    QDocOriginarioVAL_TOTAL_PRODUTOS: TFloatField;
    QDocOriginarioVAL_TOTAL: TFloatField;
    QDocOriginarioNUM_CFOP: TIntegerField;
    QDocOriginarioNUM_PESO: TFloatField;
    QDocOriginarioCOD_SERIE_MODELO: TStringField;
    QDocOriginarioCOD_SERIE: TStringField;
    QDocOriginarioDT_EMISSAO: TDateTimeField;
    DSNbs: TDataSource;
    QNbs: TOracleDataSet;
    QNbsCOD_NBS: TIntegerField;
    QNbsDESC_NBS: TStringField;
    QNbsPERC_TRIBUTO_NACIONAL: TFloatField;
    QNbsPERC_TRIBUTO_IMPORTADO: TFloatField;
    QConhecimentoCadCOD_NBS: TIntegerField;
    QConhecimentoConsREMETENTE: TStringField;
    QConhecimentoConsDESTINATARIO: TStringField;
    QConhecimentoCadQT_VOLUMES: TFloatField;
    QConhecimentoCadVAL_A_RECEBER: TFloatField;
    QConhecimentoCadVAL_TOTAL_CTE: TFloatField;
    QDocOriginarioNUM_PEDIDO: TStringField;
    QDocOriginarioNUM_VOLUMES: TIntegerField;
    QDocOriginarioNUM_ROMANEIO: TStringField;
    QConhecimentoCadCOD_CADASTRO_TOMADOR: TIntegerField;
    QRCte: TOracleDataSet;
    QRCteNUM_CONHECIMENTO: TIntegerField;
    QRCteCOD_FILIAL: TIntegerField;
    QRCteDT_EMISSAO: TDateTimeField;
    QRCteCOD_CADASTRO_REMETENTE: TIntegerField;
    QRCteREMETENTE: TStringField;
    QRCteCOD_OPERACAO: TIntegerField;
    QRCteVAL_TOTAL_CTE: TFloatField;
    QRCteVAL_A_RECEBER: TFloatField;
    QRCteIND_SITUACAO: TStringField;
    QRCtedesc_situacao: TStringField;
    QCaixa: TOracleDataSet1;
    QCaixaCOD_CAIXA_MOV: TIntegerField;
    QCaixaCOD_USUARIO: TIntegerField;
    QCaixaCOD_FILIAL: TIntegerField;
    QCaixaCOD_DEPARTAMENTO: TIntegerField;
    QCaixaCOD_HISTORICO: TIntegerField;
    QCaixaDT_MOVIMENTO: TDateTimeField;
    QCaixaVAL_MOVIMENTO: TFloatField;
    QCaixaDESC_HORARIO: TStringField;
    QCaixaCOD_CADASTRO: TIntegerField;
    QCaixaCOD_CONTA_RECEBER_CAB: TIntegerField;
    QCaixaCOD_CONTA_PAGAR_CAB: TIntegerField;
    QCaixaDT_USUARIO: TDateTimeField;
    QCaixaDESC_COMPLEMENTO: TStringField;
    QCaixaCOD_PEDIDO_CAB: TIntegerField;
    QCaixaCOD_OFICINA_CAB: TIntegerField;
    QCaixaNUM_DOCUMENTO: TFloatField;
    QCaixaCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCadCOD_CONHECIMENTO_REF: TIntegerField;
    QConhecimentoCadCOD_CTE_ANULACAO_REF: TIntegerField;
    QConhecimentoConsDESC_CHAVE_ACESSO_CTE: TStringField;
    QConhecimentoConsVAL_TOTAL_CTE: TFloatField;
    QConhecimentoConsVAL_FRETE: TFloatField;
    QConhecimentoConsVAL_FRETE_PESO: TFloatField;
    QConhecimentoConsVAL_GRIS: TFloatField;
    QConhecimentoConsVAL_DESPACHO: TFloatField;
    QConhecimentoConsVAL_PEDAGIO: TFloatField;
    QConhecimentoConsVAL_ICMS: TFloatField;
    QConhecimentoConsVAL_BASE_ICMS: TFloatField;
    QConhecimentoConsCST: TStringField;
    QConhecimentoConsPERC_ALIQUOTA: TFloatField;
    QConhecimentoConsPERC_TRIBUTADO: TFloatField;
    QConhecimentoConsPERC_TRIBUTADO_NOTA: TFloatField;
    QConhecimentoConsVAL_BASE_ICMS_SUBST: TFloatField;
    QConhecimentoConsVAL_ICMS_SUBST: TFloatField;
    QCTeComplemento: TOracleDataSet;
    IntegerField2: TIntegerField;
    QCTeComplementoCOD_CTE_COMPLEMENTO: TIntegerField;
    QCTeComplementoCOD_CONHECIMENTO_REF: TIntegerField;
    QConhecimentoCadDT_DECLARACAO_NAO_CONTRIB: TDateTimeField;
    QConhecimentoCadDESC_CHAVE_ACESSO_REF: TStringField;
    QConhecimentoCadIND_TOMA_ICMS: TStringField;
    QConhecimentoConsCOD_FILIAL: TIntegerField;
    QConhecimentoConsCOD_OPERACAO: TIntegerField;
    QConhecimentoConsIND_TOMADOR_SERVICO: TIntegerField;
    QConhecimentoConsIND_FORMA_PGTO: TIntegerField;
    QConhecimentoConsIND_LOTACAO: TIntegerField;
    QConhecimentoConsCOD_CIDADE_ORIGEM: TIntegerField;
    QConhecimentoConsCOD_CIDADE_DESTINO: TIntegerField;
    QConhecimentoConsCOD_CADASTRO_REMETENTE: TIntegerField;
    QConhecimentoConsCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QConhecimentoConsCOD_CADASTRO_EXPEDIDOR: TIntegerField;
    QConhecimentoConsCOD_CADASTRO_RECEBEDOR: TIntegerField;
    QConhecimentoConsCOD_CADASTRO_TOMADOR: TIntegerField;
    QConhecimentoConsCOD_PRODUTO: TFloatField;
    QConhecimentoConsCOD_TRIBUTACAO: TIntegerField;
    QConhecimentoConsDESC_OUT_CARAC_CARGA: TStringField;
    QConhecimentoConsQT_VOLUMES: TFloatField;
    QConhecimentoConsVAL_TOTAL_CARGA: TFloatField;
    QConhecimentoConsNUM_PESO_BRUTO: TFloatField;
    QConhecimentoConsNUM_PESO_BC: TFloatField;
    QConhecimentoConsNUM_PESO_AFERIDO: TFloatField;
    QConhecimentoConsNUM_CUBAGEM: TFloatField;
    QDocAnterior: TOracleDataSet;
    QDocAnteriorCOD_DOC_ANTERIOR: TIntegerField;
    QDocAnteriorCOD_CONHECIMENTO: TIntegerField;
    QDocAnteriorIND_TP_DOC: TStringField;
    QDocAnteriorCOD_SERIE: TStringField;
    QDocAnteriorCOD_SUB_SERIE: TStringField;
    QDocAnteriorNUM_DOCUMENTO: TStringField;
    QDocAnteriorDT_EMISSAO: TDateTimeField;
    QDocAnteriorDESC_CHAVE_ACESSO: TStringField;
    QConhecimentoConsCOD_SERIE: TStringField;
    QDocOriginarioIND_IMPORTADO_XML: TStringField;
    QDocAnteriorIND_IMPORTADO_XML: TStringField;
    QDocAnteriorVAL_TOTAL_CARGA: TFloatField;
    QDocAnteriorNUM_PESO_BRUTO: TFloatField;
    QDocAnteriorNUM_PESO_BC: TFloatField;
    QDocAnteriorNUM_PESO_AFERIDO: TFloatField;
    QDocAnteriorNUM_CUBAGEM: TFloatField;
    QDocAnteriorQT_VOLUMES: TIntegerField;
    QDocOriginarioCons: TOracleDataSet;
    QDocOriginarioConsCOD_DOC_ORIGINARIO: TIntegerField;
    QDocOriginarioConsCOD_CONHECIMENTO: TIntegerField;
    QDocOriginarioConsDESC_CHAVE_ACESSO: TStringField;
    QDocOriginarioConsDESC_PIN_SUFRAMA: TStringField;
    QDocOriginarioConsCOD_NOTA_CAB: TIntegerField;
    QDocOriginarioConsNUM_ROMANEIO: TStringField;
    QDocOriginarioConsNUM_PEDIDO: TStringField;
    QDocOriginarioConsCOD_SERIE_MODELO: TStringField;
    QDocOriginarioConsCOD_SERIE: TStringField;
    QDocOriginarioConsNUM_DOCUMENTO: TStringField;
    QDocOriginarioConsDT_EMISSAO: TDateTimeField;
    QDocOriginarioConsVAL_BASE_ICMS: TFloatField;
    QDocOriginarioConsVAL_ICMS: TFloatField;
    QDocOriginarioConsVAL_BASE_ICMS_SUBST: TFloatField;
    QDocOriginarioConsVAL_ICMS_SUBST: TFloatField;
    QDocOriginarioConsVAL_TOTAL_PRODUTOS: TFloatField;
    QDocOriginarioConsVAL_TOTAL: TFloatField;
    QDocOriginarioConsNUM_CFOP: TIntegerField;
    QDocOriginarioConsNUM_PESO: TFloatField;
    QDocOriginarioConsNUM_VOLUMES: TIntegerField;
    QDocOriginarioConsIND_IMPORTADO_XML: TStringField;
    QConhecimentoCadCOD_SEGURADORA: TIntegerField;
    QConhecimentoCadIND_PEDAGIO_INCLUSO: TStringField;
    QConhecimentoCadVAL_FRETE_POR_TON: TFloatField;
    QRConhecimentosCidades: TOracleDataSet;
    QDocOriginarioCOD_CIDADE_IBGE: TStringField;
    QDocOriginarioConsCOD_CIDADE_IBGE: TStringField;
    QDocOriginarioNOME: TStringField;
    QDocOriginarioDESC_ENDERECO: TStringField;
    QDocOriginarioDESC_COMPLEMENTO_ENDERECO: TStringField;
    QDocOriginarioDESC_BAIRRO: TStringField;
    QDocOriginarioDESC_CIDADE: TStringField;
    QDocOriginarioDESC_UF: TStringField;
    QDocOriginarioDESC_CEP: TStringField;
    QDocOriginarioConsNOME: TStringField;
    QDocOriginarioConsDESC_ENDERECO: TStringField;
    QDocOriginarioConsDESC_COMPLEMENTO_ENDERECO: TStringField;
    QDocOriginarioConsDESC_BAIRRO: TStringField;
    QDocOriginarioConsDESC_CIDADE: TStringField;
    QDocOriginarioConsDESC_UF: TStringField;
    QDocOriginarioConsDESC_CEP: TStringField;
    QRConhecimentosCidadesCOD_CONHECIMENTO: TIntegerField;
    QRConhecimentosCidadesNUM_CONHECIMENTO: TIntegerField;
    QRConhecimentosCidadesCIDADE_ORIG: TStringField;
    QRConhecimentosCidadesCIDADE_DEST: TStringField;
    QRConhecimentosCidadesNOME_REME: TStringField;
    QRConhecimentosCidadesNOME_DEST: TStringField;
    QRConhecimentosCidadesDESC_CHAVE_ACESSO_CTE: TStringField;
    QRConhecimentosCidadesDESC_FILIAL: TStringField;
    QRConhecimentosCidadesNUM_NOTA: TStringField;
    QRConhecimentosCidadesDESC_CHAVE_ACESSO: TStringField;
    QRConhecimentosCidadesNOME: TStringField;
    QRConhecimentosCidadesDESC_ENDERECO: TStringField;
    QRConhecimentosCidadesDESC_CIDADE: TStringField;
    QRConhecimentosCidadesDESC_CEP: TStringField;
    QDocOriginarioNUM_ENDERECO: TStringField;
    QDocOriginarioConsNUM_ENDERECO: TStringField;
    DSControleEntregaCad: TDataSource;
    QControleEntregaCad: TOracleDataSet1;
    QControleEntregaCadCOD_CONTROLE_ENTREGA: TIntegerField;
    QControleEntregaCadCOD_NOTA_CAB: TIntegerField;
    QControleEntregaCadDT_ENTREGA: TDateTimeField;
    QControleEntregaCadCOD_CADASTRO_REMETENTE: TIntegerField;
    QControleEntregaCadCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QControleEntregaCadCOD_CADASTRO_RECEBEDOR: TIntegerField;
    QControleEntregaCons: TOracleDataSet1;
    QControleEntregaConsCOD_CONTROLE_ENTREGA: TIntegerField;
    QControleEntregaConsCOD_NOTA_CAB: TIntegerField;
    QControleEntregaConsNUM_NOTA: TIntegerField;
    QControleEntregaConsDT_ENTREGA: TDateTimeField;
    QControleEntregaConsCOD_CADASTRO_REMETENTE: TIntegerField;
    QControleEntregaConsNOME_REMETENTE: TStringField;
    QControleEntregaConsCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QControleEntregaConsNOME_DESTINATARIO: TStringField;
    QControleEntregaConsCOD_CADASTRO_RECEBEDOR: TIntegerField;
    QControleEntregaConsNOME_RECEBEDOR: TStringField;
    QUFPercurso: TOracleDataSet;
    QUFPercursoCOD_ESTADO: TStringField;
    QUFPercursoCOD_UF_PERCURSO: TIntegerField;
    QUFPercursoCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCadVAL_IR: TFloatField;
    QConhecimentoCadVAL_INSS: TFloatField;
    QConhecimentoCadVAL_CSLL: TFloatField;
    QConhecimentoConsTOMADOR: TStringField;
    QConhecimentoCadIND_GLOBALIZADO: TStringField;
    QConhecimentoCadDESC_SERVICO: TStringField;
    QControleViagemCabQT_KM_PERCORRIDO: TFloatField;
    QControleViagemCabVAL_COMISSAO_CLIENTE: TFloatField;
    QControleViagemCabVL_MEDIA: TFloatField;
    QControleViagemCabVL_TOTAL_KM: TFloatField;
    QControleViagemCabVL_TROCO: TFloatField;
    QControleViagemCabVL_DIARIAS: TFloatField;
    QControleViagemCabsval_total_despesas: TFloatField;
    QControleViagemCabVL_ADIANTAMENTO_DESPESA: TFloatField;
    QRControleViagemCustos: TOracleDataSet1;
    QRControleViagemCustosCOD_CONTROLE_VIAGEM_CAB: TIntegerField;
    QRControleViagemCustosDT_SAIDA: TDateTimeField;
    QRControleViagemCustosDT_RETORNO: TDateTimeField;
    QRControleViagemCustosDESC_DESTINO: TStringField;
    QRControleViagemCustosCOD_MOTORISTA: TIntegerField;
    QRControleViagemCustosNOME: TStringField;
    QRControleViagemCustosDESC_PLACA: TStringField;
    QRControleViagemCustosDESC_VEICULO: TStringField;
    QRControleViagemCustosVL_MEDIA: TFloatField;
    QRControleViagemCustosVAL_FRETE: TFloatField;
    QRControleViagemCustosSVAL_DESPESAS: TFloatField;
    QControleViagemCabCOD_FILIAL: TIntegerField;
    QRControleViagemCustosSVAL_SALDO: TFloatField;
    QRControleViagemCustosVAL_COMBUSTIVEL: TFloatField;
    QRControleViagemCustosVAL_REFEICAO: TFloatField;
    QRControleViagemCustosVAL_CHAPA: TFloatField;
    QRControleViagemCustosVAL_DIVERSOS: TFloatField;
    QRControleViagemCustosVAL_PEDAGIO: TFloatField;
    QRControleViagemCustosVAL_MANUTENCAO: TFloatField;
    QRControleViagemCustosVAL_SALARIO: TFloatField;
    QRControleViagemCustosVAL_SEGURO: TFloatField;
    QRControleViagemCustosVAL_COMBUSTIVEL_CAMARA: TFloatField;
    QRControleViagemCustosVL_DIARIAS: TFloatField;
    QRControleViagemCustosSVAL_COMBUSTIVEL_LITRO: TFloatField;
    QRControleViagemCustosQT_COMBUSTIVEL: TFloatField;
    QControleViagemCabVL_ADIANTAMENTO: TFloatField;
    QControleViagemCabVAL_FRETE: TFloatField;
    QConhecimentoCadDESC_OBS: TStringField;
    QRCteCOD_CADASTRO_DESTINATARIO: TIntegerField;
    QRCteDESTINATARIO: TStringField;
    QRCteCOD_CADASTRO_TOMADOR: TIntegerField;
    QRCteTOMADOR: TStringField;
    QVeiculoCTeCons: TOracleDataSet;
    QVeiculoCTeConsCOD_VEICULO_CTE: TIntegerField;
    QVeiculoCTeConsDESC_PLACA: TStringField;
    QVeiculoCTeConsCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoConsVAL_A_RECEBER: TFloatField;
    QConhecimentoConsCOD_UF_ORIGEM: TStringField;
    QConhecimentoConsCOD_UF_DESTINO: TStringField;
    QMotoristaCTeCons: TOracleDataSet;
    QMotoristaCTeConsCOD_MOTORISTA_CTE: TIntegerField;
    QMotoristaCTeConsCOD_CADASTRO: TIntegerField;
    QMotoristaCTeConsCOD_CONHECIMENTO: TIntegerField;
    QConhecimentoCadDT_VIAGEM: TDateTimeField;
    QConhecimentoCadHORA_VIAGEM: TStringField;
    QConhecimentoCadIND_TIPO_FRETAMENTO: TIntegerField;
    QConhecimentoConsCPF_CNPJ_TOMADOR: TStringField;
    QRCteDESC_PLACA: TStringField;
    QRCteCOD_PRODUTO: TFloatField;
    QRCteDESC_PRODUTO: TStringField;
    QConhecimentoCadVAL_IBS_MUN: TFloatField;
    QConhecimentoCadVAL_IBS_EST: TFloatField;
    QConhecimentoCadVAL_IBS_TOTAL: TFloatField;
    QConhecimentoCadVAL_CBS_TOTAL: TFloatField;
    QConhecimentoCadVAL_IS_TOTAL: TFloatField;
    QConhecimentoCadVAL_BC_IBS_CBS: TFloatField;
    QConhecimentoCadNUM_CLASS_TRIB_IBS_CBS: TStringField;
    QConhecimentoCadNUM_CST_IBS_CBS: TStringField;
    QConhecimentoCadPERC_IBS_MUN: TFloatField;
    QConhecimentoCadPERC_IBS_UF: TFloatField;
    QConhecimentoCadPERC_CBS: TFloatField;
    QVerificaDocOriginario: TOracleDataSet;
    QVerificaDocOriginarioCOD_CONHECIMENTO: TIntegerField;
    QVerificaDocOriginarioNUM_CTE: TIntegerField;
    QVerificaDocOriginarioDESC_CHAVE_ACESSO: TStringField;
    QVerificaDocOriginarioDESC_RETORNO_PROCESSAMENTO: TStringField;
    procedure QConhecimentoCadCalcFields(DataSet: TDataSet);
    procedure QConhecimentoCadAfterInsert(DataSet: TDataSet);
    procedure QRConhecimentoCalcFields(DataSet: TDataSet);
    procedure QConhecimentoCadAfterPost(DataSet: TDataSet);
    procedure QConhecimentoAltCalcFields(DataSet: TDataSet);
    procedure QConhecimentoConsCalcFields(DataSet: TDataSet);
    procedure QRConhecimentoValorRetidoCalcFields(DataSet: TDataSet);
    procedure QConhecimentoCadBeforePost(DataSet: TDataSet);
    procedure QEstadiaCalcFields(DataSet: TDataSet);
    procedure QEstadiaAfterInsert(DataSet: TDataSet);
    procedure QEstadiaBeforePost(DataSet: TDataSet);
    procedure QEstadiaAfterPost(DataSet: TDataSet);
    procedure QEstadiaBeforeDelete(DataSet: TDataSet);
    procedure QREstadiaCalcFields(DataSet: TDataSet);
    procedure QConhecimentoAltAfterPost(DataSet: TDataSet);
    procedure QConhecimentoCadAfterEdit(DataSet: TDataSet);
    procedure QConhecimentoCadCOD_NOTA_CABChange(Sender: TField);
    procedure QConhecimentoAduaneiroAfterInsert(DataSet: TDataSet);
    procedure QConhecimentoAduaneiroAfterPost(DataSet: TDataSet);
    procedure QConhecimentoAduaneiroCalcFields(DataSet: TDataSet);
    procedure QConhecimentoCadAfterOpen(DataSet: TDataSet);
    procedure QConhecimentoCadDESC_CHAVE_ACESSO_CTEValidate(
      Sender: TField);
    procedure QDocOriginarioCalcFields(DataSet: TDataSet);
    procedure QMotoristaCTeCalcFields(DataSet: TDataSet);
    procedure QVeiculoCTeCalcFields(DataSet: TDataSet);
    procedure QDocOriginarioAfterInsert(DataSet: TDataSet);
    procedure QMotoristaCTeAfterInsert(DataSet: TDataSet);
    procedure QVeiculoCTeAfterInsert(DataSet: TDataSet);
    procedure QDocOriginarioAfterPost(DataSet: TDataSet);
    procedure QDocOriginarioBeforeDelete(DataSet: TDataSet);
    procedure QDocOriginarioBeforeEdit(DataSet: TDataSet);
    procedure QDocOriginarioBeforeInsert(DataSet: TDataSet);
    procedure QMotoristaCTeAfterPost(DataSet: TDataSet);
    procedure QMotoristaCTeBeforeDelete(DataSet: TDataSet);
    procedure QMotoristaCTeBeforeEdit(DataSet: TDataSet);
    procedure QVeiculoCTeAfterPost(DataSet: TDataSet);
    procedure QVeiculoCTeBeforeDelete(DataSet: TDataSet);
    procedure QVeiculoCTeBeforeEdit(DataSet: TDataSet);
    procedure QConhecimentoCadAfterCancel(DataSet: TDataSet);
    procedure QConhecimentoCadAfterDelete(DataSet: TDataSet);
    procedure QDocOriginarioBeforePost(DataSet: TDataSet);
    procedure QConhecimentoCadCOD_CIDADE_ORIGEMChange(Sender: TField);
    procedure QConhecimentoCadCOD_CIDADE_DESTINOChange(Sender: TField);
    procedure QConhecimentoCadBeforeDelete(DataSet: TDataSet);
    procedure QConhecimentoCadDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QRCteCalcFields(DataSet: TDataSet);
    procedure QDocAnteriorAfterInsert(DataSet: TDataSet);
    procedure QDocAnteriorAfterPost(DataSet: TDataSet);
    procedure QDocAnteriorBeforeDelete(DataSet: TDataSet);
    procedure QDocAnteriorBeforeEdit(DataSet: TDataSet);
    procedure QDocAnteriorBeforeInsert(DataSet: TDataSet);
    procedure QDocAnteriorBeforePost(DataSet: TDataSet);
    procedure QConhecimentoCadCOD_OPERACAOValidate(Sender: TField);
    procedure QConhecimentoCadCOD_FILIALChange(Sender: TField);
    procedure QUFPercursoAfterInsert(DataSet: TDataSet);
    procedure QUFPercursoAfterPost(DataSet: TDataSet);
    procedure QUFPercursoBeforeDelete(DataSet: TDataSet);
    procedure QUFPercursoBeforeEdit(DataSet: TDataSet);
    procedure QControleViagemCabCalcFields(DataSet: TDataSet);
    procedure QRControleViagemCustosCalcFields(DataSet: TDataSet);
    procedure QConhecimentoCadCOD_UF_ORIGEMChange(Sender: TField);
    procedure QConhecimentoCadCOD_PRODUTOValidate(Sender: TField);

  private
    { Private declarations }
    fApagando: Boolean;

  public
    { Public declarations }
    property pApagando: Boolean read fApagando write fApagando default False;
    procedure ExcluiConhecimento;
    procedure AtuCaixa(wVal_Movimento: Real; wOperacao, wFilial, wDepartamento,
      wNumConhecimento, wCadastro, wCodConhecimento: String; wDataMov: TDateTime);
  end;

var
  DMConhecimento: TDMConhecimento;
  wProduto_Ant: integer;
  wVeiculo1_Ant, wVeiculo2_Ant: String;

const
  SIT_NOTA_DIGITADA: string = '1';
  SIT_NOTA_CONFIRMADA: string = '2';
  SIT_NOTA_CANCELADA: string = '3';
  SIT_NOTA_DENEGADA: string = '4';

implementation

uses UOracle_cl, UFilial_cl, UUsuario_cl,
  USequencia_cl, UBiblioteca, UNotaSaida_cl, DateUtils, UParamSistema_cl,
  UOperacao_cl, UCadastro_cl, uCalculoIBSCBS;

{$R *.DFM}

procedure TDMConhecimento.QConhecimentoCadCalcFields(DataSet: TDataSet);
Var wTotal, auxSitCancSefaz: String;
 x, y: array of string;
 wBuscador: TBuscador;
begin
  setLength(x, 7); //4 sql diferentes
  setLength(y, 7);

  //If QConhecimentoCadCOD_FILIAL.Text <> '' Then
  //Begin
    //x[0] := 'SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO WHERE DESC_PLACA = '+CHR(39)+QConhecimentoCadDESC_PLACA.Value+CHR(39);
//    x[1] := 'SELECT NUM_NOTA FROM TB_NOTA_CAB WHERE COD_NOTA_CAB = '+IntToStr(QConhecimentoCadCod_Nota_Cab.Value);
//    x[2] := 'SELECT NUM_SERIE FROM TB_SERIE WHERE COD_SERIE = '+CHR(39)+QConhecimentoCadCod_Serie.Value+CHR(39)+ ' And COD_FILIAL = '+QConhecimentoCadCOD_FILIAL.Text +
//      ' And COD_SERIE_MODELO = ' + quotedStr(QConhecimentoCadCOD_SERIE_MODELO.Value);
//    x[3] := 'SELECT NOME FROM TB_VEICULO_CONHECIMENTO,TB_PROPRIETARIO WHERE TB_PROPRIETARIO.COD_PROPRIETARIO = TB_VEICULO_CONHECIMENTO.COD_PROPRIETARIO AND DESC_PLACA = '+CHR(39)+QConhecimentoCadDESC_PLACA.Value+CHR(39);
//    x[4] := 'SELECT DESC_VEICULO FROM TB_VEICULO_CONHECIMENTO WHERE DESC_PLACA = '+CHR(39)+QConhecimentoCadDESC_PLACA_REBOQUE.Value+CHR(39);
//    x[5] := 'SELECT NOME FROM TB_VEICULO_CONHECIMENTO,TB_PROPRIETARIO WHERE TB_PROPRIETARIO.COD_PROPRIETARIO = TB_VEICULO_CONHECIMENTO.COD_PROPRIETARIO AND DESC_PLACA = '+CHR(39)+QConhecimentoCadDESC_PLACA_REBOQUE.Value+CHR(39);
//    x[6] := 'SELECT DESC_PRODUTO FROM TB_PRODUTO WHERE COD_PRODUTO = '+QConhecimentoCadCOD_PRODUTO.Text;

    //DMOracle.BuscaNomes(x, y);
  //End;
  //DMConhecimento.QConhecimentoCadDesc_Veiculo.value := Y[0] + ' - '+y[3];
//  //DMConhecimento.QConhecimentoCaddesc_veiculo_reboque.value := Y[4] + ' - '+y[5];
//  DMConhecimento.QConhecimentoCadnome_produto.Value := y[6];
//  DMConhecimento.QConhecimentoCadNr_Nota.text := Y[1];
//  DMConhecimento.QConhecimentoCadNum_Serie.Value := Y[2];
  If QConhecimentoCadCOD_PRODUTO.Text <> '' Then
  Begin
    wBuscador := TBuscador.Create;
    wBuscador.Limpa;
    if (not QConhecimentoCadCOD_PRODUTO.IsNull) then
      wBuscador.Adiciona('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QConhecimentoCadCOD_PRODUTO.Text);
    wBuscador.Buscar;
    QConhecimentoCadnome_produto.Value := wBuscador.Proximo;
  end;
  If QConhecimentoCadCod_Contrato_Vend.Text <> '' Then
   Begin
     wTotal :=DMOracle.BuscaNome('SELECT SUM(QT_NOTA) FROM TB_CONHECIMENTO ','COD_CONTRATO_VEND =' +FloatToStr(QConhecimentoCadCOD_CONTRATO_VEND.VALUE));
     If wTotal <> '' Then
        QConhecimentoCadQt_Quantidade_Embarque.Value := StrToFloat(wTotal);
     wTotal := DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND =' +FloatToStr(QConhecimentoCadCOD_CONTRATO_VEND.VALUE));
     If wTotal <> '' Then
        QConhecimentoCadQt_Quantidade_Contrato.Value := StrToFloat(wTotal);
   end;

  // Situacao do CT-e - Djeison Selzlein 06/07/2013
  QConhecimentoCaddesc_situacao.Value := '';
  if QConhecimentoCadIND_SITUACAO.Value = SIT_NOTA_DIGITADA then
    QConhecimentoCaddesc_situacao.Value := 'DIGITADO'
  else if QConhecimentoCadIND_SITUACAO.Value = SIT_NOTA_CONFIRMADA then
    QConhecimentoCaddesc_situacao.Value := 'CONFIRMADO'
  else if QConhecimentoCadIND_SITUACAO.Value = SIT_NOTA_CANCELADA then
    QConhecimentoCaddesc_situacao.Value := 'CANCELADO'
  else if QConhecimentoCadIND_SITUACAO.Value = SIT_NOTA_DENEGADA then
    QConhecimentoCaddesc_situacao.Value := 'DENEGADO';


  // Situacao do CT-e na SEFAZ - Djeison Selzlein 06/07/2013
  QConhecimentoCaddesc_situacao_sefaz.Value := '';
  if not QConhecimentoCadDESC_CHAVE_ACESSO_CTE.IsNull then
  begin
    auxSitCancSefaz := DMOracle.BuscaNome('SELECT DESC_RETORNO_CANCELAMENTO FROM TB_CTE',
        'COD_CONHECIMENTO = ' + QConhecimentoCadCOD_CONHECIMENTO.Text);
    if auxSitCancSefaz <> '' then
    begin
      QConhecimentoCaddesc_situacao_sefaz.Value := auxSitCancSefaz + ' - '
       + DMOracle.BuscaNome('SELECT DESC_MSG_CANCELAMENTO FROM TB_CTE',
      'COD_CONHECIMENTO = ' + QConhecimentoCadCOD_CONHECIMENTO.Text);
    end
    else
    begin
      QConhecimentoCaddesc_situacao_sefaz.Value :=
      DMOracle.BuscaNome('SELECT DESC_RETORNO_PROCESSAMENTO FROM TB_CTE',
        'COD_CONHECIMENTO = ' + QConhecimentoCadCOD_CONHECIMENTO.Text) + ' - '
         + DMOracle.BuscaNome('SELECT DESC_MSG_VALIDACAO_LOTE FROM TB_CTE',
        'COD_CONHECIMENTO = ' + QConhecimentoCadCOD_CONHECIMENTO.Text);
    end;
  end;
end;

procedure TDMConhecimento.QConhecimentoCadAfterInsert(DataSet: TDataSet);
var wAmbienteNFe: String;
    indice: integer;
begin  
  QConhecimentoCadDT_Emissao.value:= Date;
  QConhecimentoCadDT_PREVISAO_ENTREGA.Value := Date;
  QConhecimentoCadDT_Recebimento.value:=Date;
  QConhecimentoCadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QConhecimentoCadNUM_CONHECIMENTO.Value := 0;
  QConhecimentoCadCod_Serie.Value := DMUsuario.CodSerieCTe;
  QConhecimentoCadCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloCTe;

  if DMUsuario.CodOperacaoCTe > 0 then
    QConhecimentoCadCOD_OPERACAO.Value := DMUsuario.CodOperacaoCTe;

  if DMOperacao.QOperacaoCod_Tributacao.Value > 0 then  //Sul Amazonas precisa que assuma a TR da operação por primeiro. Junior 24/02/2025
    QConhecimentoCadCOD_TRIBUTACAO.Value := DMOperacao.QOperacaoCod_Tributacao.Value
  else
  if DMUsuario.CodTributacaoCTe > 0 then
    QConhecimentoCadCOD_TRIBUTACAO.Value := DMUsuario.CodTributacaoCTe;

  QConhecimentoCadVAL_ICMS.Value := 0;

  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    QConhecimentoCadIND_PAGAR_PAGO.Value := 'A pagar';
    QConhecimentoCadIND_FORMA_PGTO.Value := 1;
  end
  else
  begin
    QConhecimentoCadIND_PAGAR_PAGO.Value := 'Outros';
    QConhecimentoCadIND_FORMA_PGTO.Value := 2;
  end;

  QConhecimentoCadIND_LOTACAO.Value := 1;
  QConhecimentoCadCod_Filial.Value := DMUsuario.CodFilialUsuario;
  //Trazer o produto do último CTE. Junior 30/11/2021. Autorizado Marcos.
  if (DMParamSistema.CodEmpresa = 'CTE-ALEX') then
  begin
    if wProduto_Ant <> 0 then
      QConhecimentoCadCOD_PRODUTO.Value := wProduto_Ant;
  end;
end;

procedure TDMConhecimento.QRConhecimentoCalcFields(DataSet: TDataSet);
Var x, y: array of string;
begin
  setLength(x, 4); //4 sql diferentes
  setLength(y, 4);

  x[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+IntToStr(DMConhecimento.QRConhecimentoCod_Motorista.Value);
  x[1] := 'SELECT DESC_CARTEIRA FROM TB_CADASTRO WHERE COD_CADASTRO = '+IntToStr(DMConhecimento.QRConhecimentoCod_Motorista.Value);
  x[2] := 'SELECT DT_EXPEDICAO_CARTEIRA FROM TB_CADASTRO WHERE COD_CADASTRO = '+IntToStr(DMConhecimento.QRConhecimentoCod_Motorista.Value);
  x[3] := 'SELECT DESC_CIDADE FROM TB_VEICULO_CONHECIMENTO WHERE DESC_PLACA = '+chr(39)+Trim(DMConhecimento.QRConhecimentoDESC_PLACA.Value)+chr(39);

  DMOracle.BuscaNomes(x, y);

  QRConhecimentoDesc_Motorista.Value:= Y[0];
  QRConhecimentoDesc_Carteira.Value:= Y[1];
  QRConhecimentoDt_Expedicao.Text:= Y[2];
  QRConhecimentoDesc_Cidade_Veiculo.Value:= Y[3];
  
  if(QRConhecimentoCod_Nota_Cab.Text <> '') then
  begin
    QRConhecimentoTotal_Nota.Value:= StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.VAL_TOTAL) FROM TB_NOTA_CAB, TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB = '
                                                      +IntToStr(DMConhecimento.QRConhecimentoCod_Nota_Cab.Value)));
    QRConhecimentoTotal_Quantidade.Value:= StrToFloat(DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) FROM TB_NOTA_CAB, TB_NOTA_ITEM','TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_CAB AND TB_NOTA_CAB.COD_NOTA_CAB = '
                                                      +IntToStr(DMConhecimento.QRConhecimentoCod_Nota_Cab.Value)));
  end;
end;

procedure TDMConhecimento.QConhecimentoCadAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QConhecimentoCadCod_Conhecimento.Value;
  QConhecimentoCad.Close;
  QConhecimentoCad.SetVariable('PK',wCodigo);
  QConhecimentoCad.Open;
end;

procedure TDMConhecimento.QConhecimentoAltCalcFields(DataSet: TDataSet);
Var wDesconto : Real;
begin
  If QConhecimentoCadPerc_Desconto_Frete.Value > 0 Then
     wDesconto := QConhecimentoCadVAL_FRETE.Value * QConhecimentoCadPerc_Desconto_Frete.Value / 100
  Else
     wDesconto := 0;
  QConhecimentoAltVal_Total.Value := QConhecimentoCadVal_Frete.Value +
                                     QConhecimentoCadVal_Seguro.Value -
//                                     QConhecimentoCadVal_Pedagio.Value -
                                     QConhecimentoCadVal_Irf.Value -
                                     QConhecimentoCadVal_Inss_Fornecedor.Value -
                                     QConhecimentoCadVal_Falta_Mercadoria_Chegada.Value -
                                     QConhecimentoAltVl_Pagto_Frete.Value -
                                     QConhecimentoAltVal_Sest_Senat.Value -
                                     QConhecimentoAltVl_Pagto_Adiantamento.Value -
                                     wDesconto;
  If (QConhecimentoCadCod_Operacao.Value = 421) Or (QConhecimentoCadCod_Operacao.Value = 402) Or (QConhecimentoCadCod_Operacao.Value = 407) Then
    QConhecimentoAltVal_Total.Value := QConhecimentoAltVal_Total.Value + QConhecimentoCadVal_Pedagio.Value;
end;

procedure TDMConhecimento.QConhecimentoConsCalcFields(DataSet: TDataSet);
begin
  QConhecimentoConsNum_Nota.text:= DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB = '+IntToStr(QConhecimentoConsCod_Nota_Cab.Value));
end;

procedure TDMConhecimento.QRConhecimentoValorRetidoCalcFields(
  DataSet: TDataSet);
begin
  If(NOT QRConhecimentoValorRetidoVAL_FRETE.IsNull)Then
    QRConhecimentoValorRetidopercentagemfrete.Value := QRConhecimentoValorRetidoVAL_FRETE.Value * 0.2;
end;

procedure TDMConhecimento.QConhecimentoCadBeforePost(DataSet: TDataSet);
var
  wPisIsento, wCofinsIsento: Boolean;
  rBaseCBSIBS: real;
  rCalculaImposto: TImpostosCalculados;
begin
  DMOracle.ValidaFilial(QConhecimentoCadCOD_FILIAL.Text);
  QConhecimentoCadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  if DMParamSistema.CodEmpresa = 'CTE-ALEX' then
  begin
    wProduto_Ant := QConhecimentoCadCod_Produto.AsInteger;
    {wPlacas_Ant := TStringList.Create;
    QVeiculoCTe.First;
    while not QVeiculoCTe.Eof do
    begin
      wPlacas_Ant.Add(QVeiculoCTeDESC_PLACA.Value);
      ShowMessage(wPlacas_Ant.Text);
      QVeiculoCTe.Next;
    end;}
  end;

  QConhecimentoCadCOD_OPERACAOValidate(QConhecimentoCadCOD_OPERACAO.ParentField);

  wPisIsento := (QConhecimentoCadCOD_CST_PIS.Value = '') or
                      (StrToInt(QConhecimentoCadCOD_CST_PIS.Value) in [4,6,7,8,9,49]);
  wCofinsIsento := (QConhecimentoCadCOD_CST_COFINS.Value = '') or
                     (StrToInt(QConhecimentoCadCOD_CST_COFINS.Value) in [4,6,7,8,9,49]);

  if DMOperacao.QOperacaoPERC_BASE_PIS.Value > 0 then
  begin
    QConhecimentoCadVAL_PIS.Value := (QConhecimentoCadVAL_FRETE.Value - QConhecimentoCadVAL_ICMS.Value)
        * DMParamSistema.QParamSistemaPerc_Pis.Value *
        (DMOperacao.QOperacaoPerc_Base_Pis.Value / 100) / 100;

    if wPisIsento then
      QConhecimentoCadVAL_PIS.Value := 0;
  end
  else
    QConhecimentoCadVAL_PIS.Value := 0;
  if DMOperacao.QOperacaoPerc_Base_Cofins.Value > 0 then
  begin
    QConhecimentoCadVAL_COFINS.Value := (QConhecimentoCadVAL_FRETE.Value  - QConhecimentoCadVAL_ICMS.Value) *
        DMParamSistema.QParamSistemaPerc_Cofins.Value *
        (DMOperacao.QOperacaoPerc_Base_Cofins.Value / 100) / 100;

    if wCofinsIsento then
      QConhecimentoCadVAL_COFINS.Value := 0;
  end
  else
    QConhecimentoCadVAL_COFINS.Value := 0;


  //Reforma Tributária
  QConhecimentoCadNUM_CST_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CST_IBS_CBS FROM TB_CST_IBS_CBS', 'COD_CST_IBS_CBS = ' +
                              '(SELECT COD_CST_IBS_CBS FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QConhecimentoCadCOD_TRIBUTACAO.Text + ')');
{  if not (DMFilial.QFilialIND_REGIME_TRIBUTARIO.Value in [1,2]) and (QConhecimentoCadNUM_CST_IBS_CBS.Value <> '410') and  (QConhecimentoCadNUM_CST_IBS_CBS.Value <> '620') then
  begin
    QConhecimentoCadNUM_CST_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CST_IBS_CBS FROM TB_CST_IBS_CBS', 'COD_CST_IBS_CBS = ' +
                              '(SELECT COD_CST_IBS_CBS FROM TB_TRIBUTACAO WHERE COD_TRIBUTACAO = ' + QConhecimentoCadCOD_TRIBUTACAO.Text + ')');

    // Calculo do IBSCBS para o CTe
    rBaseCBSIBS := QConhecimentoCadVAL_FRETE.Value - (QConhecimentoCadVAL_ICMS.Value - QConhecimentoCadVAL_PIS.Value - QConhecimentoCadVAL_COFINS.Value);
    rCalculaImposto := TCalculoIBSCBS.CalcularIBSCBS(rBaseCBSIBS,
                                                     0.1, // aliquota estadual IBS
                                                     0, // aliquota municipal IBS
                                                     0.9, // aliquota CBS
                                                     0,    // imposto seletivo
                                                     0, //inserido 0 no valor do frete o que seria o item
                                                     0,  // seguro
                                                     0,
                                                     0);

    QConhecimentoCadVAL_IBS_MUN.Value := rCalculaImposto.vIBS_Mun;
    QConhecimentoCadVAL_IBS_EST.Value := rCalculaImposto.vIBS_Est;
    QConhecimentoCadVAL_CBS_TOTAL.Value := rCalculaImposto.vCBS;
    QConhecimentoCadVAL_BC_IBS_CBS.Value := rCalculaImposto.vBC;
  end
  else
  begin
    QConhecimentoCadVAL_IBS_MUN.Value := 0;
    QConhecimentoCadVAL_IBS_EST.Value := 0;
    QConhecimentoCadVAL_CBS_TOTAL.Value := 0;
    QConhecimentoCadVAL_BC_IBS_CBS.Value := 0;     
  end;}
end;

procedure TDMConhecimento.QEstadiaCalcFields(DataSet: TDataSet);
var
  totMin, totHor:Integer;
begin
  QEstadiaDESC_FILIAL.value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+IntToStr(QEstadiaCOD_FILIAL.Value));
  QEstadiaDESC_CADASTRO.value:= DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+IntToStr(QEstadiaCOD_CADASTRO.Value));
  if (QEstadiaDT_CHEGADA.Text <> '') and (QEstadiaDT_SAIDA.Text <> '') and
     (QEstadiaHR_CHEGADA.Text <> '') and (QEstadiaHR_SAIDA.Text <> '') and
     (QEstadiaMIN_CHEGADA.Text <> '') and (QEstadiaMIN_SAIDA.Text <> '') then
  begin
    //calcula o total de horas decorridas
    Bib.HorasDecorridas(QEstadiaDT_CHEGADA.Value,QEstadiaDT_SAIDA.Value,
                        QEstadiaHR_CHEGADA.Value,QEstadiaMIN_CHEGADA.Value,
                        QEstadiaHR_SAIDA.Value,QEstadiaMIN_SAIDA.Value,
                        totHor,totMin);
    QEstadiatot_hor.Value:=totHor;
    QEstadiatot_min.Value:=totMin;
  end
  else
  begin
    QEstadiatot_hor.Text:='';
    QEstadiatot_min.Text:=''
  end;
  //calcula o valor da estadia
  if (QEstadiatot_hor.Text <> '') and (QEstadiatot_min.Text <> '') and
     (QEstadiaQT_HORAS_ISENTAS.Text <> '') and (QEstadiaVAL_TON_HORA.Text <> '') then
    QEstadiaval_apurado.Value := (QEstadiatot_hor.Value+(QEstadiatot_min.Value/60)-QEstadiaQT_HORAS_ISENTAS.Value)
                                 *(QEstadiaQT_PESO_CHEGADA.Value/1000)*QEstadiaVAL_TON_HORA.Value
  else
    QEstadiaval_apurado.Text:='';
end;

procedure TDMConhecimento.QEstadiaAfterInsert(DataSet: TDataSet);
begin
  QEstadiaDT_EMISSAO.Value := Date;
  QEstadiaQT_HORAS_ISENTAS.Value:=24;
  QEstadiaVAL_TON_HORA.Value:=0.25;
end;

procedure TDMConhecimento.QEstadiaBeforePost(DataSet: TDataSet);
begin
  If QEstadia.State In [DsInsert] Then
     DMConhecimento.QEstadiaNUM_ESTADIA.Value:=DMSequencia.Sequencia(Trunc(DMConhecimento.QEstadiaCod_Filial.Value),'ESTADIA');
end;

procedure TDMConhecimento.QEstadiaAfterPost(DataSet: TDataSet);
var
  wEstadia:Integer;
begin
  wEstadia:=QEstadiaCod_Estadia.Value;
  QEstadia.Close;
  QEstadia.setVariable('PK',wEstadia);
  QEstadia.Open;
end;

procedure TDMConhecimento.QEstadiaBeforeDelete(DataSet: TDataSet);
begin
  if(QEstadiaIND_SITUACAO.Value = 'CONFIRMADA')or(QEstadiaIND_SITUACAO.Value = 'CANCELADA') then
    Raise Exception.Create('Não é possível excluir esta estadia - Estadia Confirmada ou cancelada');
end;

procedure TDMConhecimento.QREstadiaCalcFields(DataSet: TDataSet);
var
  totMin, totHor:Integer;
begin
  if (QREstadiaDT_CHEGADA.Text <> '') and (QREstadiaDT_SAIDA.Text <> '') and
     (QREstadiaHR_CHEGADA.Text <> '') and (QREstadiaHR_SAIDA.Text <> '') and
     (QREstadiaMIN_CHEGADA.Text <> '') and (QREstadiaMIN_SAIDA.Text <> '') then
  begin
    //calcula o total de horas decorridas
    Bib.HorasDecorridas(QREstadiaDT_CHEGADA.Value,QREstadiaDT_SAIDA.Value,
                        StrToInt(QREstadiaHR_CHEGADA.Text),StrToInt(QREstadiaMIN_CHEGADA.Text),
                        StrToInt(QREstadiaHR_SAIDA.Text),StrToInt(QREstadiaMIN_SAIDA.Text),
                        totHor,totMin);
    QREstadiatot_hor.Value:=totHor;
    QREstadiatot_min.Value:=totMin;
  end;
end;

procedure TDMConhecimento.QConhecimentoAltAfterPost(DataSet: TDataSet);
begin
  If QConhecimentoAltQt_Peso_Chegada.Value > 0 Then
   Begin
     If QConhecimentoCadCod_Nota_Cab.Value > 0 Then
      Begin
         DMOracle.QExecSQL.Close;
         DMOracle.QExecSQL.SQL.Clear;
         DMOracle.QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM SET QT_CHEGADA = '+FloatToStr(QConhecimentoAltQt_Peso_Chegada.Value));
         DMOracle.QExecSQL.SQL.Add(' WHERE COD_NOTA_CAB = '+QConhecimentoCadCod_Nota_Cab.Text);
         DMOracle.QExecSQL.ExecSQL;
      End;
     If DMOracle.DBCemapa.InTransaction Then
        DMOracle.DBCemapa.Commit;
   End;
end;

procedure TDMConhecimento.QConhecimentoCadAfterEdit(DataSet: TDataSet);
begin
  QConhecimentoCadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
end;

procedure TDMConhecimento.QConhecimentoCadCOD_NOTA_CABChange(
  Sender: TField);
begin
  If Sender.AsString <> '' Then
     DMConhecimento.QConhecimentoCadNUM_NOTA.Value := StrToInt('0' + DMOracle.BuscaNome(
        'SELECT NUM_NOTA FROM TB_NOTA_CAB', 'COD_NOTA_CAB = ' + Sender.AsString));
end;

procedure TDMConhecimento.QConhecimentoAduaneiroAfterInsert(
  DataSet: TDataSet);
begin
  QConhecimentoAduaneiroDT_EMISSAO.Value := Date;
end;

procedure TDMConhecimento.QConhecimentoAduaneiroAfterPost(
  DataSet: TDataSet);
var wCodigo: Integer;
begin
  wCodigo := QConhecimentoAduaneiroCOD_CONHECIMENTO_ADUANEIRO.Value;
  QConhecimentoAduaneiro.Close;
  QConhecimentoAduaneiro.SetVariable('PK', wCodigo);
  QConhecimentoAduaneiro.Open;
end;

procedure TDMConhecimento.QConhecimentoAduaneiroCalcFields(
  DataSet: TDataSet);
begin
  QConhecimentoAduaneirodesc_veiculo.Value := DMOracle.FastSelect('DESC_VEICULO', 'TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QConhecimentoAduaneiroDESC_PLACA.Value));
  QConhecimentoAduaneirodesc_reboque.Value := DMOracle.FastSelect('DESC_VEICULO', 'TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + QuotedStr(QConhecimentoAduaneiroDESC_PLACA_REBOQUE.Value));
end;

procedure TDMConhecimento.QConhecimentoCadAfterOpen(DataSet: TDataSet);
begin
  QCstpis.Open;
  QCstCofins.Open;
end;

procedure TDMConhecimento.QConhecimentoCadDESC_CHAVE_ACESSO_CTEValidate(
  Sender: TField);
begin
  if QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value <> '' then
  begin
    if UpperCase(Copy(QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value,
      0,3)) <> 'CTE' then
      QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value :=
        'CTe' + QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value;
    if Length(QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value) <> 47 then
    begin
      MessageDlg('Chave de acesso deve ter 47 caracteres', mtError, [mbOk],0);
      Abort;
    end;
  end;
end;

procedure TDMConhecimento.QDocOriginarioCalcFields(DataSet: TDataSet);
begin
//  if (not QDocOriginarioCOD_NOTA_CAB.IsNull) and (QDocOriginarioCOD_NOTA_CAB.Value <> 0) then
//  begin
//    if Buscador = nil then
//      Buscador := TBuscador.Create([''], False);
//    Buscador.Limpa;
//    Buscador.Adiciona('COD_SERIE','TB_NOTA_CAB', 'COD_NOTA_CAB = '+QDocOriginarioCOD_NOTA_CAB.Text);
//    Buscador.Adiciona('NUM_NOTA','TB_NOTA_CAB', 'COD_NOTA_CAB = '+QDocOriginarioCOD_NOTA_CAB.Text);
//    Buscador.Adiciona('COD_SERIE_MODELO','TB_NOTA_CAB', 'COD_NOTA_CAB = '+QDocOriginarioCOD_NOTA_CAB.Text);
//    Buscador.Adiciona('DT_EMISSAO','TB_NOTA_CAB', 'COD_NOTA_CAB = '+QDocOriginarioCOD_NOTA_CAB.Text);
//    Buscador.Buscar;
//    QDocOriginariocod_serie.Value := Buscador.Proximo;
//    QDocOriginarionum_nota.Value := StrToInt(Buscador.Proximo);
//    QDocOriginariocod_serie_modelo.Value := Buscador.Proximo;
//    QDocOriginariodt_emissao.Value := StrToDate(Buscador.Proximo);
//    Buscador.Fecha;
//  end;
end;

procedure TDMConhecimento.QMotoristaCTeCalcFields(DataSet: TDataSet);
begin
  if (not QMotoristaCTeCOD_CADASTRO.IsNull) and (QMotoristaCTeCOD_CADASTRO.Value <> 0) then
  begin
    if Buscador = nil then
      Buscador := TBuscador.Create([''], False);
    Buscador.Limpa;
    Buscador.Adiciona('NOME','TB_CADASTRO', 'COD_CADASTRO = '+QMotoristaCTeCOD_CADASTRO.Text);
    Buscador.Adiciona('NUM_CGC_CPF','TB_CADASTRO', 'COD_CADASTRO = '+QMotoristaCTeCOD_CADASTRO.Text);
    Buscador.Buscar;
    QMotoristaCTenome.Value := Buscador.Proximo;
    QMotoristaCTedesc_cpf.Value := Buscador.Proximo;
    Buscador.Fecha;
  end;
end;

procedure TDMConhecimento.QVeiculoCTeCalcFields(DataSet: TDataSet);
begin
  if (not QVeiculoCTeDESC_PLACA.IsNull) and (QVeiculoCTeDESC_PLACA.Value <> '') then
  begin
    if Buscador = nil then
      Buscador := TBuscador.Create([''], False);
    Buscador.Limpa;
    Buscador.Adiciona('DESC_VEICULO','TB_VEICULO_CONHECIMENTO', 'DESC_PLACA = ' + chr(39) + QVeiculoCTeDESC_PLACA.Text + chr(39));
    Buscador.Buscar;
    QVeiculoCTedesc_veiculo.Value := Buscador.Proximo;
    Buscador.Fecha;
  end;
end;

procedure TDMConhecimento.QDocOriginarioAfterInsert(DataSet: TDataSet);
var
  wChaveAcesso: String;
begin
  QDocOriginarioCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;

  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') or (DMParamSistema.CodEmpresa = 'MATRANSP') then
  begin
    QDocOriginarioCOD_SERIE.Value := '1';
    QDocOriginarioCOD_SERIE_MODELO.Value := '04';
    QDocOriginarioNUM_CFOP.Value := 5352;
  end
  else
    QDocOriginarioCOD_SERIE_MODELO.Value := '55';
end;

procedure TDMConhecimento.QMotoristaCTeAfterInsert(DataSet: TDataSet);
begin
  QMotoristaCTeCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
end;

procedure TDMConhecimento.QVeiculoCTeAfterInsert(DataSet: TDataSet);
begin
  QVeiculoCTeCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
end;

procedure TDMConhecimento.QDocOriginarioAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QDocOriginarioCOD_DOC_ORIGINARIO.Value;
  QDocOriginario.DisableControls;
  if QDocOriginario.RecordCount < 2 then
  begin
   QConhecimentoCad.Post;
   QConhecimentoCad.Edit;
  end;
  QDocOriginario.Locate('COD_DOC_ORIGINARIO', wCodigo, []);
  QDocOriginario.EnableControls;
    //Trazer veiculos do último CTE. Junior 30/11/2021. Autorizado Marcos.
  if (DMParamSistema.CodEmpresa = 'CTE-ALEX') and (wVeiculo1_Ant <> '') then
  begin
    QVeiculoCTe.Edit;
    QVeiculoCTeDESC_PLACA.Value := wVeiculo1_Ant;
    QVeiculoCTe.Post;
    if wVeiculo2_Ant <> '' then
    begin
      QVeiculoCTe.Append;
      QVeiculoCTeDESC_PLACA.Value := wVeiculo2_Ant;
      QVeiculoCTe.Post;
    end;
 end;
end;

procedure TDMConhecimento.QDocOriginarioBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QConhecimentoCad.State <> dsEdit then
      raise Exception.Create('CT não está no modo de alteração!');
    if QDocOriginario.State in [dsEdit, dsInsert] then
      QDocOriginario.Cancel;
  end;
end;

procedure TDMConhecimento.QDocOriginarioBeforeEdit(DataSet: TDataSet);
begin
  QDocOriginarioBeforeInsert(DataSet);
end;

procedure TDMConhecimento.QDocOriginarioBeforeInsert(DataSet: TDataSet);
begin
  if QConhecimentoCad.State = dsInsert then
  begin
    QConhecimentoCad.Post;
    QConhecimentoCad.Edit;
  end;
  if QConhecimentoCad.State <> dsEdit then
    raise Exception.Create('CT não está no modo de alteração!');
end;

procedure TDMConhecimento.QMotoristaCTeAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QMotoristaCTeCOD_MOTORISTA_CTE.Value;
  QMotoristaCTe.DisableControls;
  if QMotoristaCTe.RecordCount < 2 then
  begin
   QConhecimentoCad.Post;
   QConhecimentoCad.Edit;
  end;
  QMotoristaCTe.Locate('COD_MOTORISTA_CTE', wCodigo, []);
  QMotoristaCTe.EnableControls;
end;

procedure TDMConhecimento.QMotoristaCTeBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QConhecimentoCad.State <> dsEdit then
      raise Exception.Create('CT não está no modo de alteração!');
    if QMotoristaCTe.State in [dsEdit, dsInsert] then
      QMotoristaCTe.Cancel;
  end;
end;

procedure TDMConhecimento.QMotoristaCTeBeforeEdit(DataSet: TDataSet);
begin
  QDocOriginarioBeforeInsert(DataSet);
end;

procedure TDMConhecimento.QVeiculoCTeAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QVeiculoCTeCOD_VEICULO_CTE.Value;
  QVeiculoCTe.DisableControls;
  if QVeiculoCTe.RecordCount < 2 then
  begin
   QConhecimentoCad.Post;
   QConhecimentoCad.Edit;
   wVeiculo1_Ant := QVeiculoCTeDESC_PLACA.Value;
  end
  else
    wVeiculo2_Ant := QVeiculoCTeDESC_PLACA.Value;
  QVeiculoCTe.Locate('COD_VEICULO_CTE', wCodigo, []);
  QVeiculoCTe.EnableControls;
end;

procedure TDMConhecimento.QVeiculoCTeBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QConhecimentoCad.State <> dsEdit then
      raise Exception.Create('CT não está no modo de alteração!');
    if QVeiculoCTe.State in [dsEdit, dsInsert] then
      QVeiculoCTe.Cancel;
  end;
end;

procedure TDMConhecimento.QVeiculoCTeBeforeEdit(DataSet: TDataSet);
begin
  QDocOriginarioBeforeInsert(DataSet);
end;

procedure TDMConhecimento.QConhecimentoCadAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
  QConhecimentoCad.Close;
  QConhecimentoCad.Open;
end;

procedure TDMConhecimento.QConhecimentoCadAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMConhecimento.QDocOriginarioBeforePost(DataSet: TDataSet);
begin
  if ((QDocOriginarioCOD_SERIE_MODELO.Value = '55') and
    (Trim(QDocOriginarioDESC_CHAVE_ACESSO.Value) = '')) then
    raise Exception.Create('Para modelo 55 deve ser informada Chave de Acesso!');
  //Verificar se existe CTE autorizado com um DOC. ORIGINARIO já informado. Junior 21/08/2026. 
  if Trim(QDocOriginarioDESC_CHAVE_ACESSO.Value) <> '' then
  begin
    QVerificaDocOriginario.Close;
    QVerificaDocOriginario.SetVariable('CHAVE_NFE', QDocOriginarioDESC_CHAVE_ACESSO.Value);  //('CHAVE_NFE').AsString :=  DataSet.FieldByName('DESC_CHAVE_ACESSO').AsString;
    QVerificaDocOriginario.Open;
    if not QVerificaDocOriginario.IsEmpty then
    begin
      if MessageDlg('Chave de acesso informada já está vinculada ao CT-e nº ' + QVerificaDocOriginarioNUM_CTE.AsString +
            ', que está autorizado.' + #13#10#13#10 + 'Deseja continuar mesmo assim?', mtWarning, [mbYes, mbNo], 0) = mrNo then
      begin
        if QDocOriginario.State in [dsEdit, dsInsert] then
          QDocOriginario.Cancel;
        Abort;
      end;
    end;
  end;
end;

procedure TDMConhecimento.QConhecimentoCadCOD_CIDADE_ORIGEMChange(
  Sender: TField);
begin
  if QConhecimentoCadCOD_CIDADE_ORIGEM.Text <> '' then
    QConhecimentoCadCOD_UF_ORIGEM.Value := DMOracle.FastSelect('COD_ESTADO','TB_CIDADE','COD_CIDADE = '+QConhecimentoCadCOD_CIDADE_ORIGEM.Text);
end;

procedure TDMConhecimento.QConhecimentoCadCOD_CIDADE_DESTINOChange(
  Sender: TField);
begin
  if QConhecimentoCadCOD_CIDADE_DESTINO.Text <> '' then
    QConhecimentoCadCOD_UF_DESTINO.Value := DMOracle.FastSelect('COD_ESTADO','TB_CIDADE','COD_CIDADE = '+QConhecimentoCadCOD_CIDADE_DESTINO.Text);
end;

procedure TDMConhecimento.ExcluiConhecimento;
var wComando: string;
begin
  try
    if QConhecimentoCadIND_SITUACAO.Value <> '1' then
      raise Exception.Create('Somente Conhecimentos digitados podem ser excluídos!');
    pApagando := True;
    QMotoristaCTe.First;
    while not QMotoristaCTe.Eof do
    begin
      QMotoristaCTe.Delete;
    end;
    QVeiculoCTe.First;
    while not QVeiculoCTe.Eof do
    begin
      QVeiculoCTe.Delete;
    end;
    QDocOriginario.First;
    while not QDocOriginario.Eof do
    begin
      QDocOriginario.Delete;
    end;
    QDocAnterior.First;
    while not QDocAnterior.Eof do
    begin
      QDocAnterior.Delete;
    end;
    QUFPercurso.First;
    while not QUFPercurso.Eof do
    begin
      QUFPercurso.Delete;
    end;
    with DMOracle do
    begin
      if Trim(QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value) <> '' then
      begin
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        wComando := 'DELETE FROM TB_CTE_EVENTO';
        wComando := wComando + ' WHERE DESC_CHAVE_ACESSO = ' + Bib.LimpaNumero(QConhecimentoCadDESC_CHAVE_ACESSO_CTE.Value);
        QExecSQL.SQL.Add(wComando);
        QExecSQL.ExecSQL;
      end;

      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'DELETE FROM TB_CTE';
      wComando := wComando + ' WHERE COD_CONHECIMENTO = ' + FloatToStr(QConhecimentoCadCOD_CONHECIMENTO.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
    end;

    QConhecimentoCad.Delete;
    pApagando := False;
  except
    pApagando := False;
    raise;
  end;
end;

procedure TDMConhecimento.QConhecimentoCadBeforeDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMConhecimento.QConhecimentoCadDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMConhecimento.QRCteCalcFields(DataSet: TDataSet);
begin
  Case QRCteIND_SITUACAO.AsInteger Of
  1: Begin
      QRCtedesc_situacao.Text := 'Digitado';
    End;
  2: Begin
      QRCtedesc_situacao.Text := 'Confirmado';
    End;
  3: Begin
      QRCtedesc_situacao.Text := 'Cancelado';
    End;
  4: Begin
      QRCtedesc_situacao.Text := 'Denegado'
    End;
  end;
end;

procedure TDMConhecimento.AtuCaixa(wVal_Movimento: Real; wOperacao,
  wFilial, wDepartamento, wNumConhecimento, wCadastro, wCodConhecimento: String;
  wDataMov: TDateTime);
var wHistorico, wNome: string;
begin
  try
    wHistorico := DMOracle.BuscaNome('SELECT Cod_Historico_Caixa FROM TB_OPERACAO', 'COD_OPERACAO = ' + wOperacao, True);
    if wHistorico <> '' then
    begin
      wNome := '';
      if wCodConhecimento <> '' then
       wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + wCadastro, True);
      QCaixa.Open;
      QCaixa.Insert;
      QCaixaCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
      QCaixaCOD_FILIAL.Value := StrToInt(wFilial);
      if wDepartamento = '' then
        QCaixaCOD_DEPARTAMENTO.Value := DMUsuario.CodDepartamentoUsuario
      else
        QCaixaCOD_DEPARTAMENTO.Value := StrToInt(wDepartamento);
      QCaixaCOD_HISTORICO.Value := StrToInt(wHistorico);
      QCaixaDT_MOVIMENTO.Value := wDataMov;
      QCaixaVAL_MOVIMENTO.Value := wVal_Movimento;
      if wNumConhecimento <> '' then
        QCaixaNUM_DOCUMENTO.Value := StrToInt(wNumConhecimento);
      if (wNumConhecimento <> '') and (wCodConhecimento <> '') then
        QCaixaDESC_COMPLEMENTO.Value := 'CT-e Nr: ' + wNumConhecimento + ' ' + wNome;
      QCaixaCOD_CADASTRO.Value := StrToInt(wCadastro);
      if wCodConhecimento <> '' then
        QCaixaCOD_CONHECIMENTO.Value := StrToInt(wCodConhecimento);
      QCaixaDT_USUARIO.Value := DMOracle.DataServ;
      QCaixa.Post;
      QCaixa.Close;
    end;
  except
    if QCaixa.State = dsInsert then
      QCaixa.Cancel;
    raise;
  end;

end;

procedure TDMConhecimento.QDocAnteriorAfterInsert(DataSet: TDataSet);
begin
  QDocAnteriorCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
end;

procedure TDMConhecimento.QDocAnteriorAfterPost(DataSet: TDataSet);
var wCodigo: Real;
begin
  wCodigo := QDocAnteriorCOD_DOC_ANTERIOR.Value;
  QDocAnterior.DisableControls;
  if QDocAnterior.RecordCount < 2 then
  begin
   QConhecimentoCad.Post;
   QConhecimentoCad.Edit;
  end;
  QDocAnterior.Locate('COD_DOC_ANTERIOR', wCodigo, []);
  QDocAnterior.EnableControls;
end;

procedure TDMConhecimento.QDocAnteriorBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QConhecimentoCad.State <> dsEdit then
      raise Exception.Create('CT não está no modo de alteração!');
    if QDocAnterior.State in [dsEdit, dsInsert] then
      QDocAnterior.Cancel;
  end;
end;

procedure TDMConhecimento.QDocAnteriorBeforeEdit(DataSet: TDataSet);
begin
  QDocAnteriorBeforeInsert(DataSet);
end;

procedure TDMConhecimento.QDocAnteriorBeforeInsert(DataSet: TDataSet);
begin
  if QConhecimentoCad.State = dsInsert then
  begin
    QConhecimentoCad.Post;
    QConhecimentoCad.Edit;
  end;
  if QConhecimentoCad.State <> dsEdit then
    raise Exception.Create('CT não está no modo de alteração!');
end;

procedure TDMConhecimento.QDocAnteriorBeforePost(DataSet: TDataSet);
begin
  if ((QDocAnteriorIND_TP_DOC.Value = '57') and
    (Trim(QDocAnteriorDESC_CHAVE_ACESSO.Value) = '')) then
    raise Exception.Create('Para modelo 57 deve ser informada Chave de Acesso!');
end;

procedure TDMConhecimento.QConhecimentoCadCOD_OPERACAOValidate(
  Sender: TField);
begin
  if DMConhecimento.QConhecimentoCadCOD_OPERACAO.Text <> '' then
  begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk', DMConhecimento.QConhecimentoCadCOD_OPERACAO.Value);
    DMOperacao.QOperacao.Open;
    if DMOperacao.QOperacao.Eof then
      raise Exception.Create('Operação Não Cadastrada');
    if DMOperacao.QOperacaoIND_LIBERADO.Value = 'N' then
      raise Exception.Create('Esta Operação não está liberada para uso!');
    DMConhecimento.QConhecimentoCadCOD_MENSAGEM.Text := DMOperacao.QOperacaoCOD_MENSAGEM.Text;
    //Reforma Tributária - CST DA OPERAÇÃO
    if Trim(DMOperacao.QOperacaoCOD_CLASS_TRIB_IBS_CBS.Text) <> '' then
     QConhecimentoCadNUM_CLASS_TRIB_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS', 'COD_CLASS_TRIB = ' + DMOperacao.QOperacaoCOD_CLASS_TRIB_IBS_CBS.Text);

    if Trim(DMParamSistema.QParamSistemaCOD_CST_PIS_FRETE.Text) <> '' then
      QConhecimentoCadCOD_CST_PIS.Value := DMParamSistema.QParamSistemaCOD_CST_PIS_FRETE.Value;
    if Trim(DMParamSistema.QParamSistemaCOD_CST_COFINS_FRETE.Text) <> '' then
      QConhecimentoCadCOD_CST_COFINS.Value := DMParamSistema.QParamSistemaCOD_CST_COFINS_FRETE.Value;

  end;
end;

procedure TDMConhecimento.QConhecimentoCadCOD_FILIALChange(Sender: TField);
var
  wCodNbsPadrao: String;
begin
  if QConhecimentoCad.State in [DsInsert, DsEdit] then
  begin
    wCodNbsPadrao := DMOracle.FastSelect('COD_NBS_PADRAO','TB_FILIAL','COD_FILIAL = '+ QConhecimentoCadCOD_FILIAL.Text);
    if wCodNbsPadrao <> '' then
      QConhecimentoCadCOD_NBS.Value := StrToInt(wCodNbsPadrao);
    QConhecimentoCadIND_RESP_SEGURO.Text := DMOracle.FastSelect('IND_RESP_SEGURO_PADRAO','TB_FILIAL', 'COD_FILIAL = ' + QConhecimentoCadCod_Filial.Text);
    QConhecimentoCadIND_PEDAGIO_INCLUSO.Value := DMOracle.FastSelect('IND_PEDAGIO_INCLUSO','TB_FILIAL', 'COD_FILIAL = ' + QConhecimentoCadCod_Filial.Text);
    QConhecimentoCadNUM_APOLICE_SEGURO.Value := DMOracle.FastSelect('DESC_APOLICE_SEGURO_PADRAO','TB_FILIAL', 'COD_FILIAL = ' + QConhecimentoCadCod_Filial.Text);
    QConhecimentoCadCOD_SEGURADORA.Text := DMOracle.FastSelect('COD_SEGURADORA_PADRAO','TB_FILIAL', 'COD_FILIAL = ' + QConhecimentoCadCod_Filial.Text);
    if QConhecimentoCadCOD_SEGURADORA.Value > 0 then
      QConhecimentoCadDESC_SEGURADORA.Value := DMOracle.FastSelect('NOME','TB_CADASTRO','COD_CADASTRO = ' + QConhecimentoCadCOD_SEGURADORA.Text);
    QConhecimentoCadCOD_UF_ORIGEMChange(Sender);
  end;
end;

procedure TDMConhecimento.QUFPercursoAfterInsert(DataSet: TDataSet);
begin
  QUFPercursoCOD_CONHECIMENTO.Value := QConhecimentoCadCOD_CONHECIMENTO.Value;
end;

procedure TDMConhecimento.QUFPercursoAfterPost(DataSet: TDataSet);
var
  wCodigo: Real;
begin
  wCodigo := QUFPercursoCOD_UF_PERCURSO.Value;

  QUFPercurso.DisableControls;
  if QUFPercurso.RecordCount < 2 then
  begin
   QConhecimentoCad.Post;
   QConhecimentoCad.Edit;
  end;
  QUFPercurso.Locate('COD_UF_PERCURSO', wCodigo, []);
  QUFPercurso.EnableControls;
  QUFPercurso.Refresh;
end;

procedure TDMConhecimento.QUFPercursoBeforeDelete(DataSet: TDataSet);
begin
  if not pApagando then
  begin
    if QConhecimentoCad.State <> dsEdit then
      raise Exception.Create('Conhecimento não está no modo de alteração!');
    if QUFPercurso.State in [dsEdit, dsInsert] then
      QUFPercurso.Cancel;
  end;
end;

procedure TDMConhecimento.QUFPercursoBeforeEdit(DataSet: TDataSet);
begin
  if QConhecimentoCad.State = dsInsert then
  begin
    QConhecimentoCad.Post;
    QConhecimentoCad.Edit;
  end;
  if QConhecimentoCad.State <> dsEdit then
    raise Exception.Create('Conhecimento não está no modo de alteração!');
end;

procedure TDMConhecimento.QControleViagemCabCalcFields(DataSet: TDataSet);
begin
  QControleViagemCabsval_total_despesas.Value :=
    QControleViagemCabVAL_COMBUSTIVEL.Value +
    QControleViagemCabVAL_REFEICAO.Value +
    QControleViagemCabVAL_CHAPA.Value +
    QControleViagemCabVAL_DIVERSOS.Value +
    QControleViagemCabVAL_PEDAGIO.Value +
    QControleViagemCabVAL_MANUTENCAO.Value +
    QControleViagemCabVAL_SALARIO.Value +
    QControleViagemCabVAL_SEGURO.Value +
    QControleViagemCabVAL_COMBUSTIVEL_CAMARA.Value +
    QControleViagemCabVL_DIARIAS.Value;
end;

procedure TDMConhecimento.QRControleViagemCustosCalcFields(
  DataSet: TDataSet);
begin
  QRControleViagemCustosSVAL_DESPESAS.Value :=
    QRControleViagemCustosVAL_COMBUSTIVEL.Value +
    QRControleViagemCustosVAL_REFEICAO.Value +
    QRControleViagemCustosVAL_CHAPA.Value +
    QRControleViagemCustosVAL_DIVERSOS.Value +
    QRControleViagemCustosVAL_PEDAGIO.Value +
    QRControleViagemCustosVAL_MANUTENCAO.Value +
    QRControleViagemCustosVAL_SALARIO.Value +
    QRControleViagemCustosVAL_SEGURO.Value +
    QRControleViagemCustosVAL_COMBUSTIVEL_CAMARA.Value +
    QRControleViagemCustosVL_DIARIAS.Value;
  QRControleViagemCustosSVAL_SALDO.Value := QRControleViagemCustosVAL_FRETE.Value - QRControleViagemCustosSVAL_DESPESAS.Value;
  if (QRControleViagemCustosVAL_COMBUSTIVEL.Value <> 0) and (QRControleViagemCustosQT_COMBUSTIVEL.Value <> 0) then
    QRControleViagemCustosSVAL_COMBUSTIVEL_LITRO.Value := QRControleViagemCustosVAL_COMBUSTIVEL.Value/QRControleViagemCustosQT_COMBUSTIVEL.Value
  else
    QRControleViagemCustosSVAL_COMBUSTIVEL_LITRO.Value := 0;
end;

procedure TDMConhecimento.QConhecimentoCadCOD_UF_ORIGEMChange(
  Sender: TField);
var wAliquotaInterna, wCodTributacao, wCodTribOperacao: String;
begin
  if (DMOracle.BuscaNome('SELECT IND_REGIME_TRIBUTARIO FROM TB_FILIAL','COD_FILIAL = '+ QConhecimentoCadCOD_FILIAL.Text) <> '1') then
  begin
    wCodTributacao := '';
    wCodTributacao := DMOracle.FastSelect('COD_TRIBUTACAO','TB_OPERACAO','COD_OPERACAO = ' + QConhecimentoCadCOD_OPERACAO.Text);
    if wCodTributacao = '' then
    begin
      if (QConhecimentoCadCOD_UF_ORIGEM.Text <> '') and (QConhecimentoCadCOD_UF_DESTINO.Text <> '') then
      begin
        if (QConhecimentoCadCOD_UF_ORIGEM.Value = DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_FILIAL','COD_FILIAL = '+ QConhecimentoCadCOD_FILIAL.Text)) then
        begin
          if (pos(QConhecimentoCadCOD_UF_DESTINO.Value,',AC,AL,AM,AP,BA,CE,DF,ES,GO,MA,MT,MS,'+
              'PA,PB,PE,PI,RN,RO,RR,SE,TO,') > 0) and
             (pos(QConhecimentoCadCOD_UF_ORIGEM.Value,',MG,PR,RS,RJ,SC,SP,') > 0) then
          begin
            wCodTributacao := DMOracle.BuscaNome('SELECT DISTINCT(COD_TRIBUTACAO) FROM TB_TRIBUTACAO','PERC_ALIQUOTA = 7');
            if wCodTributacao <> '' then
              QConhecimentoCadCOD_TRIBUTACAO.Text := wCodTributacao;
          end
          else
          begin
            if QConhecimentoCadCOD_UF_DESTINO.Value <> QConhecimentoCadCOD_UF_ORIGEM.Value then
            begin
              wCodTributacao := DMOracle.BuscaNome('SELECT DISTINCT(COD_TRIBUTACAO) FROM TB_TRIBUTACAO','PERC_ALIQUOTA = 12');
              if wCodTributacao <> '' then
                QConhecimentoCadCOD_TRIBUTACAO.Text := wCodTributacao;
            end
            else
              if (DMUsuario.CodTributacaoCTe > 0)  then
                QConhecimentoCadCOD_TRIBUTACAO.Value := DMUsuario.CodTributacaoCTe;
          end;
        end
        else
        begin
          wCodTributacao := DMOracle.BuscaNome('SELECT DISTINCT(COD_TRIBUTACAO) FROM TB_TRIBUTACAO','DESC_SITUACAO_TRIB = ''060''');
          if wCodTributacao <> '' then
            QConhecimentoCadCOD_TRIBUTACAO.Text := wCodTributacao;
        end;
      end;
    end
    else
      QConhecimentoCadCOD_TRIBUTACAO.Text := wCodTributacao
  end
  else
  begin
    wCodTribOperacao := '';
    wCodTribOperacao := DMOracle.FastSelect('COD_TRIBUTACAO','TB_OPERACAO','COD_OPERACAO = ' + QConhecimentoCadCOD_OPERACAO.Text);
    if wCodTribOperacao <> '' then
      QConhecimentoCadCOD_TRIBUTACAO.Text := wCodTribOperacao
    else
      QConhecimentoCadCOD_TRIBUTACAO.Value := DMUsuario.CodTributacaoCTe
  end;
end;

procedure TDMConhecimento.QConhecimentoCadCOD_PRODUTOValidate(
  Sender: TField);
begin
  if Trim(QConhecimentoCadNUM_CLASS_TRIB_IBS_CBS.Text) = '' then
    QConhecimentoCadNUM_CLASS_TRIB_IBS_CBS.Value := DMOracle.BuscaNome('SELECT NUM_CLASS_TRIB FROM TB_CLASS_TRIB_IBS_CBS', 'COD_CLASS_TRIB = ' +
                                         '(SELECT COD_CLASS_TRIB_IBS_CBS FROM TB_PRODUTO WHERE COD_PRODUTO = ' + QConhecimentoCadCOD_PRODUTO.Text + ')');

end;

end.
