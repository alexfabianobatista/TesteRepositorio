unit Cemapa.NotaSaida.Vendas.Pix.Strategy.PSPStrategy;

interface

uses
  // proprias
  Cemapa.NotaSaida.Vendas.Pix.Interfaces,

  // ACBr
  ACBrPIXPSPSicredi, ACBrPIXPSPBradesco, ACBrPIXPSPItau, ACBrPIXPSPBancoDoBrasil,
  ACBrPIXPSPSantander, ACBrPIXPSPShipay, ACBrPIXPSPSicoob, ACBrPIXPSPPagSeguro,
  ACBrPIXPSPGerenciaNet, ACBrPIXPSPPixPDV, ACBrPIXPSPInter, ACBrPIXPSPAilos,
  ACBrPIXPSPMatera, ACBrPIXPSPCielo, ACBrPIXPSPMercadoPago, ACBrPIXCD;


type
  TPSPMercadoPagoStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPMercadoPago;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPCieloStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPCielo;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPMateraStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPMatera;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPAilosStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPAilos;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPInterStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPInter;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPPixPDVStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPPixPDV;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPGerenciaNetStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPGerenciaNet;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPPagSeguroStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPPagSeguro;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPSicoobStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPSicoob;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPShipayStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPShipay;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPSantanderStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPSantander;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPBancoDoBrasilStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPBancoDoBrasil;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPItauStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPItau;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

type
  TPSPBradescoStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPBradesco;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;


type
  TPSPSicrediStrategy =  class(TInterfacedObject, IPSPStrategy)
  private
    FPSP: TACBrPSPSicredi;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    function PSP: TACBrPSP;
    class function New (Config: IConfiguracao): IPSPStrategy;
  end;

implementation

uses
  Cemapa.Conversoes.API, SysUtils;

{ TPSPSicrediStrategy }

constructor TPSPSicrediStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPSicredi.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
  FPSP.ArquivoCertificado := Config.Certificado;
end;

destructor TPSPSicrediStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPSicrediStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  result := Self.Create(Config);
end;

function TPSPSicrediStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPShipayStrategy }

constructor TPSPShipayStrategy.Create(Config: IConfiguracao);
begin

  FPSP := TACBrPSPShipay.Create(nil);

  FPSP.ClientID := Config.ClientID;
  FPSP.SecretKey := Config.SecretKey;
  FPSP.AccessKey := Config.AccessKey;
end;

destructor TPSPShipayStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPShipayStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  result := Self.Create(Config);
end;

function TPSPShipayStrategy.PSP: TACBrPSP;
begin
  result := FPSP;
end;

{ TPSPBradescoStrategy }

constructor TPSPBradescoStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPBradesco.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoPFX := Config.Certificado;
  FPSP.SenhaPFX := AnsiString(Config.SenhaCertificado);
end;

destructor TPSPBradescoStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPBradescoStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPBradescoStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPMercadoPagoStrategy }

constructor TPSPMercadoPagoStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPMercadoPago.Create(nil);

  FPSP.AccessToken := Config.Token;
end;

destructor TPSPMercadoPagoStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPMercadoPagoStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPMercadoPagoStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPCieloStrategy }

constructor TPSPCieloStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPCielo.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
end;

destructor TPSPCieloStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPCieloStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPCieloStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPMateraStrategy }

constructor TPSPMateraStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPMatera.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.AccountId := Config.AccountID;
  FPSP.SecretKey := Config.SecretKey;
  FPSP.MediatorFee := Config.MediatorFee;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoCertificado := Config.Certificado;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
end;

destructor TPSPMateraStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPMateraStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPMateraStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPAilosStrategy }

constructor TPSPAilosStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPAilos.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
  FPSP.ArquivoCertificado := Config.Certificado;
  FPSP.RootCrt := Config.CertificadoRoot;

end;

destructor TPSPAilosStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPAilosStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPAilosStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPInterStrategy }

constructor TPSPInterStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPInter.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
  FPSP.ArquivoCertificado := Config.Certificado;
end;

destructor TPSPInterStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPInterStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPInterStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPPixPDVStrategy }

constructor TPSPPixPDVStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPPixPDV.Create(nil);

  FPSP.CNPJ := Config.CNPJ;
  FPSP.Token := Config.Token;
  FPSP.ClientSecret := Config.ClientSecret;
end;

destructor TPSPPixPDVStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPPixPDVStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.New(Config);
end;

function TPSPPixPDVStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPGerenciaNetStrategy }

constructor TPSPGerenciaNetStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPGerenciaNet.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoPFX := Config.Certificado;
end;

destructor TPSPGerenciaNetStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPGerenciaNetStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPGerenciaNetStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPPagSeguroStrategy }

constructor TPSPPagSeguroStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPPagSeguro.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
  FPSP.ArquivoCertificado := Config.Certificado;
end;

destructor TPSPPagSeguroStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPPagSeguroStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPPagSeguroStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPSicoobStrategy }

constructor TPSPSicoobStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPSicoob.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.TokenSandbox := Config.Token;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
  FPSP.ArquivoCertificado := Config.Certificado;
end;

destructor TPSPSicoobStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPSicoobStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPSicoobStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPSantanderStrategy }

constructor TPSPSantanderStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPSantander.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ConsumerKey := Config.ConsumerKey;
  FPSP.ConsumerSecret := Config.ConsumerSecret;
  FPSP.SenhaPFX := AnsiString(Config.SenhaCertificado);
  FPSP.ArquivoPFX := Config.Certificado;
end;

destructor TPSPSantanderStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPSantanderStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPSantanderStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPBancoDoBrasilStrategy }

constructor TPSPBancoDoBrasilStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPBancoDoBrasil.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.DeveloperApplicationKey := Config.DevelopApplication;
  FPSP.BBAPIVersao := TACBrBBAPIVersao(StrToInt(Config.APIVersion));


  if (FPSP.BBAPIVersao = apiVersao2) then
  begin
    if (config.TipoCertificado = 0) then  // Se usa PFX
    begin
      FPSP.ArquivoPFX := Config.Certificado;
      FPSP.SenhaPFX := AnsiString(Config.SenhaCertificado);
    end
    else  // Se usa Certificado PEM + Chave Privada
    begin
      FPSP.ArquivoChavePrivada := Config.ChavePrivada;
      FPSP.ArquivoCertificado := Config.Certificado;
    end;
  end;

end;

destructor TPSPBancoDoBrasilStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPBancoDoBrasilStrategy.New(
  Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPBancoDoBrasilStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

{ TPSPItauStrategy }

constructor TPSPItauStrategy.Create(Config: IConfiguracao);
begin
  FPSP := TACBrPSPItau.Create(nil);

  FPSP.ChavePIX := Config.ChavePIX;
  FPSP.ClientID := Config.ClientID;
  FPSP.ClientSecret := Config.ClientSecret;
  FPSP.ArquivoChavePrivada := Config.ChavePrivada;
  FPSP.ArquivoCertificado := Config.Certificado;
end;

destructor TPSPItauStrategy.Destroy;
begin
  FPSP.Free;
  inherited;
end;

class function TPSPItauStrategy.New(Config: IConfiguracao): IPSPStrategy;
begin
  Result := Self.Create(Config);
end;

function TPSPItauStrategy.PSP: TACBrPSP;
begin
  Result := FPSP;
end;

end.

