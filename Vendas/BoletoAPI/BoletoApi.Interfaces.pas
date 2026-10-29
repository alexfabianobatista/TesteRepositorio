unit BoletoApi.Interfaces;

interface

uses
  ACBrBase, ACBrBoleto, ACBrUtil, ACBrMail, ACBrUtil.FilesIO, blcksock,
  ACBrDFeSSL, pcnConversao, ACBrBoletoConversao, ACBrBoletoRetorno,
  SysUtils, Classes;

type
  IBoletoApi = Interface
    { ENVIAR BOLETOS API }
    procedure EnviarBoletosApi;
    procedure SetaConfigBanco(IndAmbiente: String);
    procedure AssociarRelatorioCPN;
    procedure GerarPDF;

    { IMPRIMIR BOLETOS API }
    procedure ImprimirBoletosApi;
    procedure EnviaEmailBoletosApi;
    procedure SetaImpressao;

    { Melhoria para tentar dar independência para a geração }
    procedure PreecherBeneficiario;
    procedure AdicionarBoletoNaLista;
    function GetIndTemRejeicao: Boolean;


    procedure ConsultarBoletos;
    procedure CancelarBoleto;

    procedure SetCodContaCorrente(codConta: integer);
  end;


implementation

end.
