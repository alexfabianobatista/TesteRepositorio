unit Cemapa.Conversoes.API;

interface

uses
  ACBrPIXBase;

Type
  TTipoBancoPix =
    (tbpBancodoBrasil, tbpSantander, tbpInter, tbpItau, tbpSicredi, tbpShipay,
    tbpSicoob, tbpPagSeguro, tbpGerenciaNet, tbpBradesco, tbpPixPDV, tbpAilos,
    tbpCielo, tbpMercadoPago, tbpMatera);

  TTipoCertificadoPix = (tcpPFX, tcpCertificadoSenha);

  TFluxoPagtoDados = record
    TxID: String;
    E2E: String;
    QRCode: String;
    Total: Double;
    StatusCobranca: TACBrPIXStatusCobranca;
    StatusDevolucao: TACBrPIXStatusDevolucao;
    EmErro: Boolean;
    QtdConsultas: Integer;
  end;
  


Const
  // Para Preenchimento dos componentes ACBr quando necessário
  SOFTWARE_HOUSE = 'CEMAPA SOLUCOES EM INFORMATICA LTDA';
  SOFTWARE_HOUSE_CNPJ = '81.504.763/0001-71';
  SOFTWARE_HOUSE_SOFTWARE = 'SISTEMA CEMAPA';
  SOFTWARE_HOUSE_VERSAO_SOFTWARE = '1.0';
  SOFTWARE_HOUSE_CEP = '85884-000';
  SOFTWARE_HOUSE_CIDADE = 'MEDIANEIRA';
  SOFTWARE_HOUSE_UF = 'PR';


  // Dados informados para funcionamento do PIX
  CMaxConsultas = 36;
  CURL_MateraPagto = 'https://flagship-payment-app.vercel.app/';
  CURL_MCC = 'https://classification.codes/classifications/industry/mcc/';


implementation

end.
