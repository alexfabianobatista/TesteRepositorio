unit URPA_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, variants;


type
  TDMRPA = class(TDataModule)
    QRPA: TOracleDataSet1;
    QRPACons: TOracleDataSet1;
    QRRPAFrete: TOracleDataSet1;
    QCalculaSaldo: TOracleDataSet1;
    QRServicoPrestado: TOracleDataSet1;
    QRPANUM_NOTA: TIntegerField;
    QRPADESC_LOCALIDADE: TStringField;
    QCalculaSaldoSALDO: TFloatField;
    QRRPAFreteNUM_RPA: TIntegerField;
    QRRPAFreteVAL_SERVICO: TFloatField;
    QRRPAFreteCOD_NOTA_CAB: TIntegerField;
    QRRPAFreteDT_EMISSAO: TDateTimeField;
    QRRPAFreteDESC_ORIGEM: TStringField;
    QRRPAFreteDESC_DESTINO: TStringField;
    QRRPAFreteCOD_CADASTRO: TIntegerField;
    QRRPAFreteVAL_SEST_SENAT: TFloatField;
    QRRPAFreteCOD_FILIAL: TIntegerField;
    QRRPAFreteVAL_IRF: TFloatField;
    QRRPAFreteVAL_LIQUIDO: TFloatField;
    QRRPAFreteVAL_ADIANTAMENTO: TFloatField;
    QRRPAFreteVAL_DESPESA: TFloatField;
    QRRPAFreteVAL_ICMS_DEVIDO: TFloatField;
    QRRPAFreteVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPAFreteVAL_ICMS_PRESUMIDO: TFloatField;
    QRRPAFreteVAL_INSS: TFloatField;
    QRRPAFreteDESC_OBSERVACAO: TStringField;
    QRRPAFreteIND_TIPO_RPA: TStringField;
    QRRPAFreteDESC_FILIAL: TStringField;
    QRRPAFreteNUM_CGC: TStringField;
    QRRPAFreteDESC_TELEFONE: TStringField;
    QRRPAFreteDESC_FAX: TStringField;
    QRRPAFreteDESC_CEP: TStringField;
    QRRPAFreteDESC_BAIRRO: TStringField;
    QRRPAFreteDESC_CIDADE: TStringField;
    QRRPAFreteDESC_E_MAIL: TStringField;
    QRRPAFreteNUM_ENDERECO: TIntegerField;
    QRRPAFreteDESC_ENDERECO: TStringField;
    QRRPAFreteCOD_ESTADO: TStringField;
    QRRPAFreteNOME_CADASTRO: TStringField;
    QRRPAFreteNUM_NOTA: TIntegerField;
    QRRPAFreteNUM_CGC_CPF: TStringField;
    QRRPAFreteDESC_INSCRICAO_INSS: TStringField;
    QRRPAFreteDESC_CARTEIRA: TStringField;
    QRRPAFreteDESC_ORGAO_EMISSOR: TStringField;
    QRRPAFreteNUM_INSCRICAO: TStringField;
    QRPANUM_RPA: TIntegerField;
    QRPAVAL_SERVICO: TFloatField;
    QRPADT_EMISSAO: TDateTimeField;
    QRPAVAL_SEST_SENAT: TFloatField;
    QRPACOD_FILIAL: TIntegerField;
    QRPAVAL_IRF: TFloatField;
    QRPAVAL_LIQUIDO: TFloatField;
    QRPAVAL_ADIANTAMENTO: TFloatField;
    QRPAVAL_DESPESA: TFloatField;
    QRPAVAL_ICMS_DEVIDO: TFloatField;
    QRPAVAL_ICMS_RECOLHIDO: TFloatField;
    QRPAVAL_ICMS_PRESUMIDO: TFloatField;
    QRPAVAL_INSS: TFloatField;
    QRPADESC_OBSERVACAO: TStringField;
    QRPAConsNUM_RPA: TIntegerField;
    QRPAConsVAL_SERVICO: TFloatField;
    QRPAConsDT_EMISSAO: TDateTimeField;
    QRPAConsDESC_ORIGEM: TStringField;
    QRPAConsDESC_DESTINO: TStringField;
    QRPAConsCOD_CADASTRO: TIntegerField;
    QRPAConsVAL_SEST_SENAT: TFloatField;
    QRPAConsCOD_FILIAL: TIntegerField;
    QRPAConsVAL_IRF: TFloatField;
    QRPAConsVAL_LIQUIDO: TFloatField;
    QRPAConsVAL_ADIANTAMENTO: TFloatField;
    QRPAConsVAL_DESPESA: TFloatField;
    QRPAConsVAL_ICMS_DEVIDO: TFloatField;
    QRPAConsVAL_ICMS_RECOLHIDO: TFloatField;
    QRPAConsVAL_ICMS_PRESUMIDO: TFloatField;
    QRPAConsVAL_INSS: TFloatField;
    QRPAConsDESC_OBSERVACAO: TStringField;
    QRPAConsIND_TIPO_RPA: TStringField;
    QRRPAServico: TOracleDataSet1;
    QRRPA: TOracleDataSet1;
    QRRPANUM_RPA: TIntegerField;
    QRRPAVAL_IRF: TFloatField;
    QRRPAVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPAVAL_ADIANTAMENTO: TFloatField;
    QRRPAVAL_DESPESA: TFloatField;
    QRRPADESC_DESTINO: TStringField;
    QRRPADESC_ORIGEM: TStringField;
    QRRPAVAL_SERVICO: TFloatField;
    QRRPADT_EMISSAO: TDateTimeField;
    QRRPAVAL_LIQUIDO: TFloatField;
    QRRelatorioFiscalFrete: TOracleDataSet1;
    QRRelatorioFiscalFreteDESC_FILIAL: TStringField;
    QRRelatorioFiscalFreteNUM_CGC: TStringField;
    QRRelatorioFiscalFreteDESC_INSCRICAO: TStringField;
    QRRelatorioFiscalFreteNOME: TStringField;
    QRRelatorioFiscalFreteDESC_INSCRICAO_INSS: TStringField;
    QRRelatorioFiscalFreteNUM_RPA: TIntegerField;
    QRRelatorioFiscalFreteDT_EMISSAO: TDateTimeField;
    QRRelatorioFiscalFreteVAL_SEST_SENAT: TFloatField;
    QRRelatorioFiscalFreteVAL_ICMS_DEVIDO: TFloatField;
    QRRelatorioFiscalFreteVAL_ICMS_PRESUMIDO: TFloatField;
    QRRelatorioFiscalFreteVAL_ICMS_RECOLHIDO: TFloatField;
    QRRelatorioFiscalFreteVAL_INSS: TFloatField;
    QRRelatorioFiscalFreteVAL_SERVICO: TFloatField;
    QRPACOD_CADASTRO: TIntegerField;
    QRPAIND_TIPO_RPA: TStringField;
    QRRelatorioFiscalServico: TOracleDataSet1;
    QRRelatorioFiscalServicoDESC_FILIAL: TStringField;
    QRRelatorioFiscalServicoNUM_CGC: TStringField;
    QRRelatorioFiscalServicoDESC_INSCRICAO: TStringField;
    QRRelatorioFiscalServicoNOME: TStringField;
    QRRelatorioFiscalServicoDESC_INSCRICAO_INSS: TStringField;
    QRRelatorioFiscalServicoNUM_RPA: TIntegerField;
    QRRelatorioFiscalServicoDT_EMISSAO: TDateTimeField;
    QRRelatorioFiscalServicoVAL_INSS: TFloatField;
    QRRelatorioFiscalServicoVAL_SERVICO: TFloatField;
    QRPACOD_CONTA_PAGAR_CAB: TIntegerField;
    QRPAConsNOME: TStringField;
    QRServicoPrestadoDT_EMISSAO: TDateTimeField;
    QRServicoPrestadoNUM_NOTA: TIntegerField;
    QRServicoPrestadoVAL_SERVICO: TFloatField;
    QRServicoPrestadoCOD_SERIE: TStringField;
    QRServicoPrestadoNUM_CGC: TStringField;
    QRServicoPrestadoDESC_CIDADE: TStringField;
    QRPACOD_RPA: TIntegerField;
    QRRelatorioFiscalServicoVAL_IRF: TFloatField;
    QRPACOD_NOTA_CAB: TIntegerField;
    QRPADESC_ORIGEM: TStringField;
    QRPADESC_DESTINO: TStringField;
    QRPAConsCOD_NOTA_CAB: TIntegerField;
    QRRPAServicoNUM_RPA: TIntegerField;
    QRRPAServicoVAL_SERVICO: TFloatField;
    QRRPAServicoCOD_NOTA_CAB: TIntegerField;
    QRRPAServicoDT_EMISSAO: TDateTimeField;
    QRRPAServicoDESC_ORIGEM: TStringField;
    QRRPAServicoDESC_DESTINO: TStringField;
    QRRPAServicoCOD_CADASTRO: TIntegerField;
    QRRPAServicoVAL_SEST_SENAT: TFloatField;
    QRRPAServicoCOD_FILIAL: TIntegerField;
    QRRPAServicoVAL_IRF: TFloatField;
    QRRPAServicoVAL_LIQUIDO: TFloatField;
    QRRPAServicoVAL_ADIANTAMENTO: TFloatField;
    QRRPAServicoVAL_DESPESA: TFloatField;
    QRRPAServicoVAL_ICMS_DEVIDO: TFloatField;
    QRRPAServicoVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPAServicoVAL_ICMS_PRESUMIDO: TFloatField;
    QRRPAServicoVAL_INSS: TFloatField;
    QRRPAServicoDESC_OBSERVACAO: TStringField;
    QRRPAServicoIND_TIPO_RPA: TStringField;
    QRRPAServicoCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRRPAServicoCOD_RPA: TIntegerField;
    QRRPAServicoDESC_FILIAL: TStringField;
    QRRPAServicoNUM_CGC: TStringField;
    QRRPAServicoDESC_TELEFONE: TStringField;
    QRRPAServicoDESC_FAX: TStringField;
    QRRPAServicoDESC_CEP: TStringField;
    QRRPAServicoDESC_BAIRRO: TStringField;
    QRRPAServicoDESC_CIDADE: TStringField;
    QRRPAServicoDESC_E_MAIL: TStringField;
    QRRPAServicoNUM_ENDERECO: TIntegerField;
    QRRPAServicoDESC_ENDERECO: TStringField;
    QRRPAServicoCOD_ESTADO: TStringField;
    QRRPAServicoNUM_INSCRICAO: TStringField;
    QRRPAServicoNOME_CADASTRO: TStringField;
    QRRPAServicoNUM_CGC_CPF: TStringField;
    QRRPAServicoDESC_INSCRICAO_INSS: TStringField;
    QRRPAServicoDESC_CARTEIRA: TStringField;
    QRRPAServicoDESC_ORGAO_EMISSOR: TStringField;
    QRPAConsCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRPAConsCOD_RPA: TIntegerField;
    QRRPAFreteCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRRPAFreteCOD_RPA: TIntegerField;
    QRReciboPedagio: TOracleDataSet1;
    QRPAVAL_PEDAGIO: TFloatField;
    QRPAIND_SITUACAO: TStringField;
    QRRPACOD_NOTA_CAB: TIntegerField;
    QRRPAnum_nota: TIntegerField;
    QRTransporteAutonomo: TOracleDataSet1;
    QRTransporteAutonomoNUM_RPA: TIntegerField;
    QRTransporteAutonomoDT_EMISSAO: TDateTimeField;
    QRTransporteAutonomoNUM_NOTA: TIntegerField;
    QRTransporteAutonomoDT_EMISSAO_1: TDateTimeField;
    QRTransporteAutonomoVAL_SERVICO: TFloatField;
    QRTransporteAutonomoVAL_ICMS_DEVIDO: TFloatField;
    QRTransporteAutonomoVAL_ICMS_PRESUMIDO: TFloatField;
    QRTransporteAutonomoVAL_ICMS_RECOLHIDO: TFloatField;
    QRTransporteAutonomoNOME: TStringField;
    QRpa_Cp: TOracleDataSet1;
    QRpa_CpCOD_CONTA_PAGAR_CAB: TIntegerField;
    QRpa_CpCOD_RPA: TIntegerField;
    QRTransporteMunicipal: TOracleDataSet1;
    QRTransporteMunicipalNUM_RPA: TIntegerField;
    QRTransporteMunicipalDT_EMISSAO: TDateTimeField;
    QRTransporteMunicipalNUM_NOTA: TIntegerField;
    QRTransporteMunicipalDT_EMISSAO_1: TDateTimeField;
    QRTransporteMunicipalVAL_SEST_SENAT: TFloatField;
    QRTransporteMunicipalVAL_INSS: TFloatField;
    QRTransporteMunicipalNOME: TStringField;
    QRTransporteMunicipalVAL_IRF: TFloatField;
    QRTransporteMunicipalVAL_SERVICO: TFloatField;
    QRRPAIND_TIPO_RPA: TStringField;
    QRPAVAL_FRETE_TON: TFloatField;
    QRPADESC_VIA: TStringField;
    QRRPAInterMunicipal: TOracleDataSet1;
    QCalculaQuantidade: TOracleDataSet1;
    QCalculaQuantidadeQUANTIDADE: TFloatField;
    QCalculaPesoSaida: TOracleDataSet1;
    QCalculaPesoSaidaQUANTIDADE: TFloatField;
    QRRelatorioIRF_RPA: TOracleDataSet1;
    QRRelatorioIRF_RPANUM_CGC_CPF: TStringField;
    QRRelatorioIRF_RPANOME: TStringField;
    QRRelatorioIRF_RPAMESANO: TStringField;
    QRRelatorioIRF_RPAVAL_IRF: TFloatField;
    QRRelatorioIRF_RPACOD_CADASTRO: TIntegerField;
    QRRelatorioIRF_RPAVAL_SERVICO: TFloatField;
    QRPAQT_PESO_CHEGADA: TFloatField;
    QRGerenciaRPA: TOracleDataSet1;
    QRGerenciaRPAPESO_SAIDA: TFloatField;
    QRGerenciaRPANUM_RPA: TIntegerField;
    QRGerenciaRPADT_EMISSAO: TDateTimeField;
    QRGerenciaRPADESC_ORIGEM: TStringField;
    QRGerenciaRPADESC_DESTINO: TStringField;
    QRGerenciaRPAQT_PESO_CHEGADA: TFloatField;
    QRGerenciaRPAVAL_FRETE_TON: TFloatField;
    QRGerenciaRPAVAL_PEDAGIO: TFloatField;
    QRGerenciaRPAVAL_ADIANTAMENTO: TFloatField;
    QRGerenciaRPAVAL_SEST_SENAT: TFloatField;
    QRGerenciaRPAVAL_IRF: TFloatField;
    QRGerenciaRPAVAL_LIQUIDO: TFloatField;
    QRGerenciaRPAVLR_PRESTACAO: TFloatField;
    QRGerenciaRPANOME: TStringField;
    QRGerenciaRPANUM_NOTA: TIntegerField;
    QRGerenciaRPADESC_PLACA: TStringField;
    QRGerenciaRPACOD_PRODUTO: TFloatField;
    QRPAVAL_INSS_FORNECEDOR: TFloatField;
    QRPAVAL_INSS_PG_OUTRAS_EMPRESAS: TFloatField;
    QRTransporteMunicipalVAL_INSS_FORNECEDOR: TFloatField;
    QRRPAServicoVAL_INSS_FORNECEDOR: TFloatField;
    QRRPAFreteVAL_INSS_FORNECEDOR: TFloatField;
    QRAutonomosINSS: TOracleDataSet1;
    QRAutonomosINSSporcentagem_frete: TFloatField;
    QRAutonomosINSSDESC_FILIAL: TStringField;
    QRAutonomosINSSNUM_CGC: TStringField;
    QRAutonomosINSSDESC_INSCRICAO: TStringField;
    QRAutonomosINSSNOME: TStringField;
    QRAutonomosINSSDESC_INSCRICAO_INSS: TStringField;
    QRAutonomosINSSVAL_SEST_SENAT: TFloatField;
    QRAutonomosINSSVAL_ICMS_DEVIDO: TFloatField;
    QRAutonomosINSSVAL_ICMS_PRESUMIDO: TFloatField;
    QRAutonomosINSSVAL_ICMS_RECOLHIDO: TFloatField;
    QRAutonomosINSSVAL_INSS: TFloatField;
    QRAutonomosINSSVAL_SERVICO: TFloatField;
    QRRPAVAL_INSS_FORNECEDOR: TFloatField;
    QRRelatorioFiscalFreteVAL_INSS_FORNECEDOR: TFloatField;
    QRRelatorioFiscalServicoVAL_INSS_FORNECEDOR: TFloatField;
    QRAutonomosINSSVAL_INSS_FORNECEDOR: TFloatField;
    QRGerenciaRPAVAL_INSS: TFloatField;
    QRGerenciaRPAVAL_ICMS_PRESUMIDO: TFloatField;
    QRGerenciaRPAVAL_ESTADIA: TFloatField;
    QRRPACOD_CADASTRO: TIntegerField;
    QRRPANOME: TStringField;
    QRPACOD_OPERACAO: TIntegerField;
    QRPACOD_CONTRATO_VEND: TIntegerField;
    QRpa_Alt: TOracleDataSet1;
    QRpa_AltVL_VARIACAO: TFloatField;
    QRpa_AltVL_ESTADIA: TFloatField;
    QRpa_AltDESC_PAGTO_FRETE: TStringField;
    QRpa_AltVL_PAGTO_FRETE: TFloatField;
    QRpa_AltDT_PAGTO_FRETE: TDateTimeField;
    QRpa_AltCOD_CADASTRO_DESCARGA: TIntegerField;
    QRpa_AltDESC_PAGTO_ADIANTAMENTO: TStringField;
    QRpa_AltDT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QRpa_AltVL_PAGTO_ADIANTAMENTO: TFloatField;
    QRpa_AltQT_PESO_CHEGADA: TFloatField;
    QRPAConsVAL_PEDAGIO: TFloatField;
    QRPAConsIND_SITUACAO: TStringField;
    QRPAConsVAL_FRETE_TON: TFloatField;
    QRPAConsDESC_VIA: TStringField;
    QRPAConsQT_PESO_CHEGADA: TFloatField;
    QRPAConsVAL_INSS_FORNECEDOR: TFloatField;
    QRPAConsVAL_INSS_PG_OUTRAS_EMPRESAS: TFloatField;
    QRPAConsCOD_OPERACAO: TIntegerField;
    QRPAConsDESC_PLACA: TStringField;
    QRPAConsCOD_CONTRATO_VEND: TIntegerField;
    QRPAConsVL_VARIACAO: TFloatField;
    QRPAConsVL_ESTADIA: TFloatField;
    QRPAConsDESC_PAGTO_FRETE: TStringField;
    QRPAConsVL_PAGTO_FRETE: TFloatField;
    QRPAConsDT_PAGTO_FRETE: TDateTimeField;
    QRPAConsCOD_CADASTRO_DESCARGA: TIntegerField;
    QRPAConsDESC_PAGTO_ADIANTAMENTO: TStringField;
    QRPAConsDT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QRPAConsVL_PAGTO_ADIANTAMENTO: TFloatField;
    QRPAqt_quantidade_contrato: TFloatField;
    QRPAqt_quantidade_embarque: TFloatField;
    QRPAQT_PESO_NOTA: TFloatField;
    QRpa_AltCOD_CONTRATO_VEND: TIntegerField;
    QRPAConsQT_PESO_NOTA: TFloatField;
    QRpa_Altval_pagamento: TFloatField;
    QRpa_AltVAL_SERVICO: TFloatField;
    QRpa_AltVAL_PEDAGIO: TFloatField;
    QRpa_AltVAL_INSS_PG_OUTRAS_EMPRESAS: TFloatField;
    QRpa_AltVAL_SEST_SENAT: TFloatField;
    QRpa_AltVAL_INSS_FORNECEDOR: TFloatField;
    QRpa_AltVAL_IRF: TFloatField;
    QRRPASemContrato: TOracleDataSet1;
    QRRPAContrato: TOracleDataSet1;
    QRRPAContratoCOD_FILIAL: TIntegerField;
    QRRPAContratoDESC_FILIAL: TStringField;
    QRRPAContratoNUM_RPA: TIntegerField;
    QRRPAContratoVAL_FRETE_TON: TFloatField;
    QRRPAContratoVAL_ADIANTAMENTO: TFloatField;
    QRRPAContratoVAL_PEDAGIO: TFloatField;
    QRRPAContratoVL_ESTADIA: TFloatField;
    QRRPAContratoVAL_ICMS_DEVIDO: TFloatField;
    QRRPAContratoVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPAContratoVAL_ICMS_PRESUMIDO: TFloatField;
    QRRPAContratoDT_EMISSAO: TDateTimeField;
    QRRPAContratoDESC_PLACA: TStringField;
    QRRPAContratoQT_PESO_CHEGADA: TFloatField;
    QRRPAContratoNUM_NOTA: TIntegerField;
    QRRPAContratoNUM_CONTRATO: TIntegerField;
    QRRPAContratoNOME: TStringField;
    QRRPASemContratoNUM_RPA: TIntegerField;
    QRRPASemContratoVAL_FRETE_TON: TFloatField;
    QRRPASemContratoVAL_ADIANTAMENTO: TFloatField;
    QRRPASemContratoVAL_PEDAGIO: TFloatField;
    QRRPASemContratoVL_ESTADIA: TFloatField;
    QRRPASemContratoVAL_ICMS_DEVIDO: TFloatField;
    QRRPASemContratoVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPASemContratoVAL_ICMS_PRESUMIDO: TFloatField;
    QRRPASemContratoDT_EMISSAO: TDateTimeField;
    QRRPASemContratoDESC_PLACA: TStringField;
    QRRPASemContratoQT_PESO_CHEGADA: TFloatField;
    QRRPASemContratoNUM_NOTA: TIntegerField;
    QRRPASemContratoCOD_FILIAL: TIntegerField;
    QRRPASemContratoDESC_FILIAL: TStringField;
    QRRPASemContratoQT_PESO_NOTA: TFloatField;
    QRRPASemContratoVL_VARIACAO: TFloatField;
    QRRPAContratoQT_PESO_NOTA: TFloatField;
    QRRPAContratoVL_VARIACAO: TFloatField;
    QRPADESC_PLACA: TStringField;
    QRPAVL_VARIACAO: TFloatField;
    QRPAVL_ESTADIA: TFloatField;
    QRPADESC_PAGTO_FRETE: TStringField;
    QRPAVL_PAGTO_FRETE: TFloatField;
    QRPADT_PAGTO_FRETE: TDateTimeField;
    QRPACOD_CADASTRO_DESCARGA: TIntegerField;
    QRPADESC_PAGTO_ADIANTAMENTO: TStringField;
    QRPADT_PAGTO_ADIANTAMENTO: TDateTimeField;
    QRPAVL_PAGTO_ADIANTAMENTO: TFloatField;
    QRPACOD_CADASTRO_PARCEIRO: TIntegerField;
    QRPADESC_CARTAO_PEDAGIO: TStringField;
    QRPAConsCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRPAConsDESC_CARTAO_PEDAGIO: TStringField;
    QRPACOD_BCO_MOVIMENTO: TIntegerField;
    QRRelatorioIRF_RPAVAL_SEST_SENAT: TFloatField;
    QRRelatorioIRF_RPAVAL_BASE_INSS: TFloatField;
    QRRelatorioIRF_RPAVAL_BASE_IRF: TFloatField;
    QRRelatorioIRF_RPAVAL_INSS_FORNECEDOR: TFloatField;
    QRRelatorioFiscalServicoVAL_SEST_SENAT: TFloatField;
    QRPACOD_EMBARQUE: TIntegerField;
    QRRPACOD_EMBARQUE: TIntegerField;
    QRRPA_Carga: TOracleDataSet1;
    QRRPA_CargaNUM_RPA: TIntegerField;
    QRRPA_CargaCOD_CADASTRO: TIntegerField;
    QRRPA_CargaCOD_NOTA_CAB: TIntegerField;
    QRRPA_CargaCOD_EMBARQUE: TIntegerField;
    QRRPA_CargaVAL_SERVICO: TFloatField;
    QRRPA_CargaVAL_PEDAGIO: TFloatField;
    QRRPA_CargaVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPA_CargaVL_ESTADIA: TFloatField;
    QRRPA_CargaVL_VARIACAO: TFloatField;
    QRRPA_CargaDESC_PLACA: TStringField;
    QRRPA_CargaQT_PESO_NOTA: TFloatField;
    QRRPA_CargaQT_PESO_CHEGADA: TFloatField;
    QRRPA_CargaDT_EMISSAO: TDateTimeField;
    QRRPA_CargaCOD_OPERACAO: TIntegerField;
    QRRPA_CargaDESC_OPERACAO: TStringField;
    QRRPA_CargaQT_DIFERENCA: TFloatField;
    QRRPAInterMunicipalNUM_RPA: TIntegerField;
    QRRPAInterMunicipalDT_EMISSAO: TDateTimeField;
    QRRPAInterMunicipalVAL_SERVICO: TFloatField;
    QRRPAInterMunicipalVAL_ADIANTAMENTO: TFloatField;
    QRRPAInterMunicipalVAL_SEST_SENAT: TFloatField;
    QRRPAInterMunicipalVAL_IRF: TFloatField;
    QRRPAInterMunicipalVAL_LIQUIDO: TFloatField;
    QRRPAInterMunicipalVAL_FRETE_TON: TFloatField;
    QRRPAInterMunicipalVAL_PEDAGIO: TFloatField;
    QRRPAInterMunicipalDESC_VIA: TStringField;
    QRRPAInterMunicipalVAL_ICMS_RECOLHIDO: TFloatField;
    QRRPAInterMunicipalVAL_INSS_FORNECEDOR: TFloatField;
    QRRPAInterMunicipalDESC_OBSERVACAO: TStringField;
    QRRPAInterMunicipalDESC_ORIGEM: TStringField;
    QRRPAInterMunicipalDESC_DESTINO: TStringField;
    QRRPAInterMunicipalQT_PESO_CHEGADA: TFloatField;
    QRRPAInterMunicipalCOD_EMBARQUE: TIntegerField;
    QRRPAInterMunicipalDESC_PLACA: TStringField;
    QRRPAInterMunicipalCIDADE_ORIGEM: TStringField;
    QRRPAInterMunicipalESTADO_ORIGEM: TStringField;
    QRRPAInterMunicipalDESC_FILIAL: TStringField;
    QRRPAInterMunicipalNUM_CGC: TStringField;
    QRRPAInterMunicipalDESC_TELEFONE: TStringField;
    QRRPAInterMunicipalDESC_FAX: TStringField;
    QRRPAInterMunicipalDESC_CEP: TStringField;
    QRRPAInterMunicipalDESC_BAIRRO: TStringField;
    QRRPAInterMunicipalDESC_E_MAIL: TStringField;
    QRRPAInterMunicipalDESC_INSCRICAO: TStringField;
    QRRPAInterMunicipalNUM_ENDERECO: TIntegerField;
    QRRPAInterMunicipalDESC_ENDERECO_FILIAL: TStringField;
    QRRPAInterMunicipalNUM_INSCRICAO: TStringField;
    QRRPAInterMunicipalNUM_CGC_CPF: TStringField;
    QRRPAInterMunicipalDESC_INSCRICAO_INSS: TStringField;
    QRRPAInterMunicipalDESC_ENDERECO: TStringField;
    QRRPAInterMunicipalDESC_CIDADE: TStringField;
    QRRPAInterMunicipalCOD_ESTADO_NOTA: TStringField;
    QRRPAInterMunicipalMOTORISTA: TStringField;
    QRRPAInterMunicipalCOD_MOTORISTA: TIntegerField;
    QRRPAInterMunicipalDESC_CARTEIRA: TStringField;
    QRRPAInterMunicipalDT_EXPEDICAO_CARTEIRA: TDateTimeField;
    QRRPAInterMunicipalDESC_OPERACAO: TStringField;
    QRRPAInterMunicipalnum_nota: TIntegerField;
    QRRPAInterMunicipalpeso_saida: TFloatField;
    QRRPAInterMunicipalval_total: TFloatField;
    QRRPAInterMunicipalnome_nota: TStringField;
    QRRPAInterMunicipalCOD_NOTA_CAB: TIntegerField;
    QRPACOD_ESTADO: TStringField;
    QRRPAInterMunicipalNATUREZA: TFloatField;
    QRRPAInterMunicipalESTADO_DESTINO: TStringField;
    QRRPAInterMunicipalCIDADE_DESTINO: TStringField;
    QRRPAInterMunicipalDESC_CARTAO_PEDAGIO: TStringField;
    QRPAConsCOD_BCO_MOVIMENTO: TIntegerField;
    QRPAConsCOD_EMBARQUE: TIntegerField;
    QRPAConsCOD_ESTADO: TStringField;
    QRPAConsNUM_NOTA: TIntegerField;
    QRRPA_CargaNUM_NOTA: TIntegerField;
    QRPACOD_USUARIO: TIntegerField;
    QRPADT_CADASTRO: TDateTimeField;
    QRRPASemContratoVAL_SERVICO: TFloatField;
    QRRPAContratoVAL_SERVICO: TFloatField;
    QRRPAInterMunicipaldesc_endereco_nota: TStringField;
    QRRPAInterMunicipaldesc_cidade_nota: TStringField;
    QRRPAInterMunicipalnum_cgc_cpf_nota: TStringField;
    QRRPAInterMunicipaldesc_inscricao_nota: TStringField;
    QRRPA_CargaDESC_PRODUTO: TStringField;
    QRRPA_CargaCOD_FILIAL: TIntegerField;
    QRRPASemContratoCOD_CADASTRO: TIntegerField;
    QRRPAContratoCOD_CADASTRO: TIntegerField;
    QRRPA_Carganome: TStringField;
    QRRPA_CargaCOD_CADASTRO_PARCEIRO: TFloatField;
    QRRPAContratonome_parceiro: TStringField;
    QRRPAContratoCOD_CADASTRO_PARCEIRO: TFloatField;
    QRRPASemContratoCOD_CADASTRO_PARCEIRO: TFloatField;
    QRRPASemContratonome_parceiro: TStringField;
    QRRPA_CargaCOD_PRODUTO: TIntegerField;
    QRRPAContratoCOD_PRODUTO: TIntegerField;
    QRRPAContratoDESC_PRODUTO: TStringField;
    QRRPASemContratoCOD_PRODUTO: TIntegerField;
    QRRPASemContratoDESC_PRODUTO: TStringField;
    QRPAVAL_SENAT: TFloatField;
    QRRPAFreteVAL_SENAT: TFloatField;
    procedure QRPACalcFields(DataSet: TDataSet);
    procedure QRPAAfterInsert(DataSet: TDataSet);
    procedure QRPABeforeInsert(DataSet: TDataSet);
    procedure QRPABeforeEdit(DataSet: TDataSet);
    procedure QRPAAfterPost(DataSet: TDataSet);
    procedure QRRPACalcFields(DataSet: TDataSet);
    procedure QRAutonomosINSSCalcFields(DataSet: TDataSet);
    procedure QRpa_AltAfterPost(DataSet: TDataSet);
    procedure QRpa_AltCalcFields(DataSet: TDataSet);
    procedure QRRPAInterMunicipalCalcFields(DataSet: TDataSet);
    procedure QRRPA_CargaCalcFields(DataSet: TDataSet);
    procedure QRRPAContratoCalcFields(DataSet: TDataSet);
    procedure QRRPASemContratoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRPA: TDMRPA;

implementation

uses UOracle_cl, UConhecimento_cl, UBaseCalculoIRF_cl, UMotorista_cl,
  USequencia_cl, UEmbarque_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMRPA.QRPACalcFields(DataSet: TDataSet);
Var wTotal : String;
begin
  If DMRPA.QRPACod_Nota_Cab.Text <> '' Then
    QRPANum_Nota.Text:= DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB = '+IntToStr(DMRPA.QRPACod_Nota_Cab.Value));

  QRPADesc_Localidade.Text:= DMOracle.BuscaNome('SELECT DESC_Cidade FROM TB_FILIAL','COD_FILIAL = '+IntToStr(DMRPA.QRPACod_Filial.Value));
  If QRpaCod_Contrato_Vend.Text <> '' Then
   Begin
     wTotal :=DMOracle.BuscaNome('SELECT SUM(QT_PESO_NOTA) FROM TB_RPA ','COD_CONTRATO_VEND =' +FloatToStr(QRpaCOD_CONTRATO_VEND.VALUE));
     If wTotal <> '' Then
        QRpaQt_Quantidade_Embarque.Value := StrToFloat(wTotal);
     wTotal := DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_CONTRATO_VEND','COD_CONTRATO_VEND =' +FloatToStr(QRpaCOD_CONTRATO_VEND.VALUE));
     If wTotal <> '' Then
        QRpaQt_Quantidade_Contrato.Value := StrToFloat(wTotal);
   end;
end;

procedure TDMRPA.QRPAAfterInsert(DataSet: TDataSet);
begin
  DMRPA.QRPADT_EMISSAO.Value:=Date;
  DMRPA.QRPAIND_TIPO_RPA.Value := 'S';
  DMRPA.QRPACOD_USUARIO.Value := DMUsuario.codUsuarioCorrente;
  DMRPA.QRPADT_CADASTRO.Value := DMOracle.DataHoraServ;
end;

procedure TDMRPA.QRPABeforeInsert(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
     DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMRPA.QRPABeforeEdit(DataSet: TDataSet);
begin
  If not(DMOracle.DBCemapa.InTransaction) then
     DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMRPA.QRPAAfterPost(DataSet: TDataSet);
Var wCodigo : Integer;
begin
  wCodigo := QRpaCod_Rpa.Value;
  QRpa.Close;
  QRpa.SetVariable('PK',wCodigo);
  QRpa.Open;

end;

procedure TDMRPA.QRRPACalcFields(DataSet: TDataSet);
begin
  If DMRPA.QRRPACod_Nota_Cab.Text <> '' Then
     QRRPANum_Nota.Text:= DMOracle.BuscaNome('SELECT NUM_NOTA FROM TB_NOTA_CAB','COD_NOTA_CAB = '+IntToStr(DMRPA.QRRPACod_Nota_Cab.Value));
end;

procedure TDMRPA.QRAutonomosINSSCalcFields(DataSet: TDataSet);
begin
  If(NOT QRAutonomosINSSVAL_SERVICO.IsNull)Then
    QRAutonomosINSSporcentagem_frete.Value := QRAutonomosINSSVAL_SERVICO.Value * 20 / 100
  Else
    QRAutonomosINSSporcentagem_frete.Value := 0;
end;

procedure TDMRPA.QRpa_AltAfterPost(DataSet: TDataSet);
begin
  If QRpa_AltQt_Peso_Chegada.Value > 0 Then
    If QRPACod_Nota_Cab.Value > 0 Then
     Begin
         DMOracle.QExecSQL.Close;
         DMOracle.QExecSQL.SQL.Clear;
         DMOracle.QExecSQL.SQL.Add('UPDATE TB_NOTA_ITEM SET QT_CHEGADA = '+FloatToStr(QRpa_AltQt_Peso_Chegada.Value));
         DMOracle.QExecSQL.SQL.Add(' WHERE COD_NOTA_CAB = '+QRPACod_Nota_Cab.Text);
         DMOracle.QExecSQL.ExecSQL;
     End;
    If DMOracle.DBCemapa.InTransaction Then
       DMOracle.DBCemapa.Commit;

end;

procedure TDMRPA.QRpa_AltCalcFields(DataSet: TDataSet);
begin
  QRpa_Altval_pagamento.value := QRpa_AltVAL_SERVICO.Value -
                                 QRpa_AltVAL_SEST_SENAT.Value - QRpa_AltVAL_IRF.Value -
                                 QRpa_AltVAL_INSS_FORNECEDOR.Value -
                                 QRpa_AltVL_PAGTO_FRETE.Value -
                                 QRpa_AltVL_PAGTO_ADIANTAMENTO.Value;
end;

procedure TDMRPA.QRRPAInterMunicipalCalcFields(DataSet: TDataSet);
var
 x, y: array of string;
 wCadastro : String;
begin
  If QRRPAInterMunicipalCOD_NOTA_CAB.Text <> '' Then
   Begin
     setLength(x, 8); //8 sql diferentes
     setLength(y, 8);

     wCadastro:= DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB','COD_NOTA_CAB = '+IntToStr(QRRPAInterMunicipalCOD_NOTA_CAB.Value));
     x[0] := 'SELECT NUM_NOTA FROM TB_NOTA_CAB where COD_NOTA_CAB = '+IntToStr(QRRPAInterMunicipalCOD_NOTA_CAB.Value);
     x[1] := 'SELECT NOME FROM TB_CADASTRO where COD_CADASTRO = '+wCadastro;
     x[2] := 'SELECT SUM(QT_QUANTIDADE) FROM TB_NOTA_ITEM where COD_NOTA_CAB = '+QRRPAInterMunicipalCOD_NOTA_CAB.Text;
     x[3] := 'SELECT SUM(VAL_TOTAL) FROM TB_NOTA_ITEM WHERE COD_NOTA_CAB = '+IntToStr(QRRPAInterMunicipalCOD_NOTA_CAB.Value);
     x[4] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO where COD_CADASTRO = '+wCadastro;
     x[5] := 'SELECT DESC_CIDADE FROM TB_CADASTRO where COD_CADASTRO = '+wCadastro;
     x[6] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO where COD_CADASTRO = '+wCadastro;
     x[7] := 'SELECT NUM_INSCRICAO FROM TB_CADASTRO where COD_CADASTRO = '+wCadastro;

     DMOracle.BuscaNomes(x, y);

     QRRPAInterMunicipalNum_Nota.Text:= y[0];
     QRRPAInterMunicipalNome_Nota.Value := y[1];
     QRRPAInterMunicipalPeso_Saida.Value := StrToFloat(y[2]);
     QRRPAInterMunicipalVal_Total.Value := StrToFloat(Y[3]);
     QRRPAInterMunicipalDesc_Endereco_Nota.Value := Y[4];
     QRRPAInterMunicipalDesc_Cidade_Nota.Value := Y[5];
     QRRPAInterMunicipalNum_Cgc_Cpf_Nota.Value := Y[6];
     QRRPAInterMunicipalDesc_Inscricao_Nota.Value := Y[7];
   End;
  If QRRPAInterMunicipalCOD_EMBARQUE.Text <> '' Then
   Begin
     DMEmbarque.QSomaNF.Close;
     DMEmbarque.QSomaNF.SetVariable('EMBARQUE',QRRPAInterMunicipalCOD_EMBARQUE.Value);
     DMEmbarque.QSomaNF.SetVariable('IND_LIVRO_FISCAL',Null);
     DMEmbarque.QSomaNF.Open;
     QRRPAInterMunicipalPeso_Saida.Value := DMEmbarque.QSomaNFSQuantidade.Value;
     QRRPAInterMunicipalVal_Total.Value := DMEmbarque.QSomaNFSVal_Total.Value;
     QRRPAInterMunicipalCidade_Destino.Value := DMEmbarque.QRNFsDesc_Cidade.Value;
     QRRPAInterMunicipalNome_Nota.Value := 'Embarque:'+QRRPAInterMunicipalCOD_EMBARQUE.Text;
     QRRPAInterMunicipalNum_Nota.Text := QRRPAInterMunicipalCOD_EMBARQUE.Text;
   End;
end;

procedure TDMRPA.QRRPA_CargaCalcFields(DataSet: TDataSet);
begin
  If QRRPA_CargaCod_Filial.Value = QRRPA_CargaCod_Cadastro_Parceiro.Value Then
     QRRPA_CargaNome.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+QRRPA_CargaCod_Filial.Text)
  Else
     QRRPA_CargaNome.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRRPA_CargaCod_Cadastro_Parceiro.Text);
end;

procedure TDMRPA.QRRPAContratoCalcFields(DataSet: TDataSet);
begin
  If QRRPAContratoCod_Filial.Value = QRRPAContratoCod_Cadastro_Parceiro.Value Then
     QRRPAContratoNome_parceiro.Value := QRRPAContratoDESC_FILIAL.Text
  Else
     QRRPAContratoNome_parceiro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRRPAContratoCod_Cadastro_Parceiro.Text);

end;

procedure TDMRPA.QRRPASemContratoCalcFields(DataSet: TDataSet);
begin
  If QRRPASemContratoCod_Filial.Value = QRRPASemContratoCod_Cadastro_Parceiro.Value Then
     QRRPASemContratoNome_parceiro.Value := QRRPASemContratoDESC_FILIAL.Text
  Else
     QRRPASemContratoNome_parceiro.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+QRRPASemContratoCod_Cadastro_Parceiro.Text);

end;

end.
