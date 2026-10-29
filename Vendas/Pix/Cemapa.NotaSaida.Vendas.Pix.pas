{$I ACBr.inc}

unit Cemapa.NotaSaida.Vendas.Pix;

interface

uses
  Classes, Forms, StrUtils, SysUtils, ComCtrls, Dialogs,
  // Chamadas do ACBr
  ACBrCEP, ACBrPIXCD, ACBrPIXPSPItau,
  ACBrPIXPSPBancoDoBrasil, ACBrPIXPSPSantander, ACBrPIXBase, ACBrPIXSchemasPix,
  ACBrPIXSchemasDevolucao, ACBrPIXSchemasCob, ACBrPIXPSPShipay, ShellAPI,
  ACBrOpenSSLUtils, ACBrPIXPSPSicredi, ACBrPIXBRCode, ACBrSocket, ACBrBase,
  ImgList, ACBrPIXPSPSicoob, ACBrPIXPSPPagSeguro, ACBrPIXPSPGerenciaNet,
  ACBrPIXPSPBradesco, ACBrPIXPSPPixPDV, ACBrPIXPSPInter, ACBrPIXPSPAilos,
  ACBrPIXPSPMatera, ACBrPIXPSPCielo, ACBrPIXPSPMercadoPago,
  // Para Conversão Cemapa
  Cemapa.Conversoes.API,
  Cemapa.NotaSaida.Vendas.Pix.Interfaces
  ;


type
  TCemapaPixAPI = class(TInterfacedObject, IConfiguracao)

 private
    FPSP: TTipoBancoPix;
    FNome: String;
    FCep: String;
    FCidade: String;
    FEstado: String;
    FAmbiente: String;
    FTimeOut: Integer;
    FHost: String;
    FPorta: String;
    FUsuario: String;
    FPassword: String;
    FArqLog: String;
    FNivelLog: String;
    FSenha: String;
    FTipoCertificado: Integer;
    FAPIVersion: String;
    FChavePIX: String;
    FConsumerKey: String;
    FConsumerSecret: String;
    FClientID: String;
    FClientSecret: String;
    FDevelopApplication: String;
    FAccessKey: String;
    FCNPJ: String;
    FAccountID: String;
    FToken: String;
    FTokenSandBox: String;
    FArquivoPFX: String;
    FCertificado: String;
    FCertificadoRoot: String;
    FSenhaCertificado: String;
    FChavePrivada: String;
    FMediatorFee: Currency;
    FSecretKey: String;

  public
    { Public declarations }

    class function New: IConfiguracao;

    constructor Create;
    destructor Destroy; override;
    // Tipo do PSP (Payment Service Provider - Serviço Provedor de Pagamento)
    function PSP(Value: TTipoBancoPix): IConfiguracao; overload;
    function PSP: TTipoBancoPix; overload;

    //Informações do RECEBEDOR
    function Nome(Value: String): IConfiguracao; overload;
    function Nome: String; overload;
    function Cep(Value: String): IConfiguracao; overload;
    function Cep: String; overload;
    function Cidade(Value: String): IConfiguracao; overload;
    function Cidade: String; overload;
    function Estado(Value: String): IConfiguracao; overload;
    function Estado: String; overload;

    // Configuração do PSP
    function Ambiente(Value: String): IConfiguracao; overload;
    function Ambiente: String; overload;
    function TimeOut(Value: Integer): IConfiguracao; overload;
    function TimeOut: Integer; overload;

    // Configuração do Proxy
    function Host(Value: String): IConfiguracao; overload;
    function Host: String; overload;
    function Porta(Value: String): IConfiguracao; overload;
    function Porta: String; overload;
    function Usuario(Value: String): IConfiguracao; overload;
    function Usuario: String; overload;
    function Password(Value: String): IConfiguracao; overload;
    function Password: String; overload;

    // Tipos e níveis de log
    function ArqLog(Value: String): IConfiguracao; overload;
    function ArqLog: String; overload;
    function NivelLog(Value: String): IConfiguracao; overload;
    function NivelLog: String; overload;
    function Senha(Value: String): IConfiguracao; overload;
    function Senha: String; overload;

    // Configurações específicas
    function TipoCertificado(Value: Integer): IConfiguracao; overload;
    function TipoCertificado: Integer; overload;
    function APIVersion(Value: String): IConfiguracao; overload;
    function APIVersion: String; overload;
    function ChavePIX(Value: String): IConfiguracao; overload;
    function ChavePIX: String; overload;
    function ConsumerKey(Value: String): IConfiguracao; overload;
    function ConsumerKey: String; overload;
    function ConsumerSecret(Value: String): IConfiguracao; overload;
    function ConsumerSecret: String; overload;
    function ClientID(Value: String): IConfiguracao; overload;
    function ClientID: String; overload;
    function ClientSecret(Value: String): IConfiguracao; overload;
    function ClientSecret: String; overload;
    function DevelopApplication(Value: String): IConfiguracao; overload;
    function DevelopApplication: String; overload;
    function AccessKey(Value: String): IConfiguracao; overload;
    function AccessKey: String; overload;
    function CNPJ(Value: String): IConfiguracao; overload;
    function CNPJ: String; overload;
    function AccountID(Value: String): IConfiguracao; overload;
    function AccountID: String; overload;
    function Token(Value: String): IConfiguracao; overload;
    function Token: String; overload;
    function TokenSandbox(Value: String): IConfiguracao; overload;
    function TokenSandbox: String; overload;
    function CertificadoPFX(Value: String): IConfiguracao; overload;
    function CertificadoPFX: String; overload;
    function Certificado(Value: String): IConfiguracao; overload;
    function Certificado: String; overload;
    function CertificadoRoot(Value: String): IConfiguracao; overload;
    function CertificadoRoot: String; overload;
    function SenhaCertificado(Value: String): IConfiguracao; overload;
    function SenhaCertificado: String; overload;
    function ChavePrivada(Value: String): IConfiguracao; overload;
    function ChavePrivada: String; overload;
    function MediatorFee(Value: Currency): IConfiguracao; overload;
    function MediatorFee: Currency; overload;
    function SecretKey(Value: String): IConfiguracao; overload;
    function SecretKey: String; overload;

  end;


implementation




{ TCemapaPixAPI }

function TCemapaPixAPI.AccessKey(Value: String): IConfiguracao;
begin
  Result := Self;
  FAccessKey := Value;
end;

function TCemapaPixAPI.AccessKey: String;
begin
  Result := FAccessKey;
end;

function TCemapaPixAPI.AccountID(Value: String): IConfiguracao;
begin
  Result := Self;
  FAccountID := Value;
end;

function TCemapaPixAPI.AccountID: String;
begin
  Result := AccountID;
end;

function TCemapaPixAPI.Ambiente(Value: String): IConfiguracao;
begin
  Result := Self;
  FAmbiente := Value;
end;

function TCemapaPixAPI.Ambiente: String;
begin
  Result := FAmbiente;
end;

function TCemapaPixAPI.APIVersion(Value: String): IConfiguracao;
begin
  Result := Self;
  FAPIVersion := Value;
end;

function TCemapaPixAPI.APIVersion: String;
begin
  Result := FAPIVersion;
end;

function TCemapaPixAPI.ArqLog(Value: String): IConfiguracao;
begin
  Result := Self;
  FArqLog := Value;
end;

function TCemapaPixAPI.ArqLog: String;
begin
  Result := FArqLog;
end;

function TCemapaPixAPI.Cep(Value: String): IConfiguracao;
begin
  Result := Self;
  FCep := Value;
end;

function TCemapaPixAPI.Cep: String;
begin
  Result := FCep;
end;

function TCemapaPixAPI.CertificadoPFX(Value: String): IConfiguracao;
begin
  Result := Self;
  FArquivoPFX := Value;
end;

function TCemapaPixAPI.CertificadoPFX: String;
begin
//  Result := FArquivoPFX;
end;

function TCemapaPixAPI.Certificado: String;
begin
  Result := FCertificado;
end;

function TCemapaPixAPI.Certificado(Value: String): IConfiguracao;
begin
  Result := Self;
  FCertificado := Value;
end;

function TCemapaPixAPI.CertificadoRoot: String;
begin
  Result := FCertificadoRoot;
end;

function TCemapaPixAPI.CertificadoRoot(Value: String): IConfiguracao;
begin
  Result := Self;
  FCertificadoRoot := Value;
end;

function TCemapaPixAPI.ChavePIX: String;
begin
  Result := FChavePIX;
end;

function TCemapaPixAPI.ChavePIX(Value: String): IConfiguracao;
begin
  Result := Self;
  FChavePIX := Value;
end;

function TCemapaPixAPI.ChavePrivada: String;
begin
  Result := FChavePrivada;
end;

function TCemapaPixAPI.ChavePrivada(Value: String): IConfiguracao;
begin
  Result := Self;
  FChavePrivada := Value;
end;

function TCemapaPixAPI.Cidade(Value: String): IConfiguracao;
begin
  Result := Self;
  FCidade := Value;
end;

function TCemapaPixAPI.Cidade: String;
begin
  Result := FCidade;
end;

function TCemapaPixAPI.ClientID(Value: String): IConfiguracao;
begin
  Result := Self;
  FClientID := Value;
end;

function TCemapaPixAPI.ClientID: String;
begin
  Result := FClientID;
end;

function TCemapaPixAPI.ClientSecret: String;
begin
  Result := FClientSecret;
end;

function TCemapaPixAPI.ClientSecret(Value: String): IConfiguracao;
begin
  Result := Self;
  FClientSecret := Value;
end;

function TCemapaPixAPI.CNPJ(Value: String): IConfiguracao;
begin
  Result := Self;
  FCNPJ := Value;
end;

function TCemapaPixAPI.CNPJ: String;
begin
  Result := FCNPJ;
end;

function TCemapaPixAPI.ConsumerKey: String;
begin
  Result := FConsumerKey;
end;

function TCemapaPixAPI.ConsumerKey(Value: String): IConfiguracao;
begin
  Result := Self;
  FConsumerKey := Value;
end;

function TCemapaPixAPI.ConsumerSecret(Value: String): IConfiguracao;
begin
  Result := Self;
  FConsumerSecret := Value;
end;

function TCemapaPixAPI.ConsumerSecret: String;
begin
  Result := FConsumerSecret;
end;

function TCemapaPixAPI.SecretKey(Value: String): IConfiguracao;
begin
  Result := Self;
  FSecretKey := Value;
end;

function TCemapaPixAPI.SecretKey: String;
begin
  Result := FSecretKey;
end;

function TCemapaPixAPI.Senha(Value: String): IConfiguracao;
begin
  Result := Self;
  FSenha := Value;
end;

function TCemapaPixAPI.Senha: String;
begin
  Result := FSenha;
end;

function TCemapaPixAPI.SenhaCertificado(Value: String): IConfiguracao;
begin
  Result := Self;
  FSenhaCertificado := Value;
end;

function TCemapaPixAPI.SenhaCertificado: String;
begin
  Result := FSenhaCertificado;
end;

function TCemapaPixAPI.TimeOut(Value: Integer): IConfiguracao;
begin
  Result := Self;
  FTimeOut := Value;
end;

function TCemapaPixAPI.TimeOut: Integer;
begin
  Result := FTimeOut;
end;

function TCemapaPixAPI.TipoCertificado(Value: Integer): IConfiguracao;
begin
  Result := Self;
  FTipoCertificado := Value;
end;

function TCemapaPixAPI.TipoCertificado: Integer;
begin
  Result := FTipoCertificado;
end;

function TCemapaPixAPI.Token: String;
begin
  Result := FToken;
end;

function TCemapaPixAPI.Token(Value: String): IConfiguracao;
begin
  Result := Self;
  FToken := Value;
end;


function TCemapaPixAPI.TokenSandbox(Value: String): IConfiguracao;
begin
  Result := Self;
  FTokenSandBox := Value;
end;

function TCemapaPixAPI.TokenSandbox: String;
begin
  Result := FTokenSandBox;
end;

function TCemapaPixAPI.Usuario(Value: String): IConfiguracao;
begin
  Result := Self;
  FUsuario := Value;
end;

function TCemapaPixAPI.Usuario: String;
begin
  Result := FUsuario;
end;

function TCemapaPixAPI.DevelopApplication: String;
begin
  Result := FDevelopApplication;
end;

function TCemapaPixAPI.DevelopApplication(Value: String): IConfiguracao;
begin
  Result := Self;
  FDevelopApplication := Value;
end;

function TCemapaPixAPI.Estado(Value: String): IConfiguracao;
begin
  Result := Self;
  FEstado := Value;
end;

function TCemapaPixAPI.Estado: String;
begin
  Result := FEstado;
end;

function TCemapaPixAPI.Host: String;
begin
  Result := FHost;
end;

function TCemapaPixAPI.Host(Value: String): IConfiguracao;
begin
  Result := Self;
  FHost := Value;
end;

function TCemapaPixAPI.MediatorFee(Value: Currency): IConfiguracao;
begin
  Result := Self;
  FMediatorFee := Value;
end;

function TCemapaPixAPI.MediatorFee: Currency;
begin
  Result := FMediatorFee;
end;

function TCemapaPixAPI.NivelLog(Value: String): IConfiguracao;
begin
  Result := Self;
  FNivelLog := Value;
end;

function TCemapaPixAPI.NivelLog: String;
begin
  Result := FNivelLog;
end;

function TCemapaPixAPI.Nome: String;
begin
  Result := FNome;
end;

function TCemapaPixAPI.Nome(Value: String): IConfiguracao;
begin
  Result := Self;
  FNome := Value;
end;

function TCemapaPixAPI.Porta(Value: String): IConfiguracao;
begin
  Result := Self;
  FPorta := Value;
end;

function TCemapaPixAPI.Porta: String;
begin
  Result := FPorta;
end;
function TCemapaPixAPI.Password: String;
begin
  Result := FPassword;
end;

function TCemapaPixAPI.Password(Value: String): IConfiguracao;
begin
  Result := Self;
  FPassword := Value;
end;


function TCemapaPixAPI.PSP(Value: TTipoBancoPix): IConfiguracao;
begin
  Result := Self;
  FPSP := Value;
end;

function TCemapaPixAPI.PSP: TTipoBancoPix;
begin
  Result := FPSP;
end;

class function TCemapaPixAPI.New: IConfiguracao;
begin
  result := Self.Create;
end;

constructor TCemapaPixAPI.Create;
begin
  // Vai inicializar os valores padrão dos componentes para preparar o pix
end;

destructor TCemapaPixAPI.Destroy;
begin
  // Vai destruir os objetos que foram criados na inicialização da classe para
  // finalizar sem erros.

  Inherited;

end;

end.
