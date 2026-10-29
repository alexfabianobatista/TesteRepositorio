unit Cemapa.NotaSaida.Vendas.Pix.Interfaces;

interface

uses
  Cemapa.Conversoes.API, ACBrPIXCD;

type
  IConfiguracao = interface
     ['{014A119B-34C3-468A-BD38-0CC3D7DDB6FD}']
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
    function PassWord(Value: String): IConfiguracao; overload;
    function PassWord: String; overload;

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
    /// <summary> Informa Client ID da conta fornecida pelo banco para configuração
    /// </summary>
    /// <param name="Value">Client ID fornecido pelo banco
    /// </param>
    /// <returns>Retorna a própria interface permitindo a sequencia de inserção de dados
    /// </returns>
    function ClientID(Value: String): IConfiguracao; overload;
    /// <summary> Retorna informação do arquivo de configuração
    /// </summary>
    /// <returns>Retorna Client ID da conta fornecida pelo banco para configuração
    /// </returns>
    function ClientID: String; overload;
    /// <summary> Informa ClientSecret da conta fornecida pelo banco para configuração
    /// </summary>
    /// <param name="Value">ClientSecret fornecido pelo banco
    /// </param>
    /// <returns>Retorna a própria interface permitindo a sequencia de inserção de dados
    /// </returns>
    function ClientSecret(Value: String): IConfiguracao; overload;
    /// <summary> Retorna informação do arquivo de configuração
    /// </summary>
    /// <returns>Retorna ClientSecret da conta fornecida pelo banco para configuração
    /// </returns>
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

  IPSPStrategy = interface
    ['{95842DD5-E343-4433-B9CA-94B80E27DF4D}']
    function PSP: TACBrPSP;
    procedure Free;
  end;

  IPSPPixContext = interface
    ['{055D34F2-EF49-4828-B38A-1ED334518CE0}']
    function ExecutarStrategy: IPSPStrategy;
  end;

  IPSPPixController = interface
    ['{D984AB0F-AF13-45CC-A25E-BFEC00FB148A}']
    function Configuracao: IConfiguracao;
    function Contexto: IPSPPixContext;
    function TipoBanco(Value: Integer): TTipoBancoPix;
  end;

implementation



end.
