unit Cemapa.NotaSaida.Vendas.Pix.PixContexto;

interface

uses
  // proprias
  Cemapa.NotaSaida.Vendas.Pix.Interfaces,
  Cemapa.NotaSaida.Vendas.Pix.Strategy.PSPStrategy,
  Cemapa.Conversoes.API;

type
  TPixContexto =  class(TInterfacedObject, IPSPPixContext)
  private
    FConfig: IConfiguracao;
    FPSP: IPSPStrategy;
  public
    constructor Create(Config: IConfiguracao);
    destructor Destroy; override;
    class function New(Config: IConfiguracao): IPSPPixContext;
    function ExecutarStrategy: IPSPStrategy;
  end;

implementation

uses
  SysUtils;

{ TPixContexto }

constructor TPixContexto.Create(Config: IConfiguracao);
begin
  FConfig := Config;

end;

destructor TPixContexto.Destroy;
begin
  if Assigned(FPSP) then
    FPSP.Free;
  inherited;
end;

function TPixContexto.ExecutarStrategy: IPSPStrategy;
begin


  case FConfig.PSP  of
    tbpBancodoBrasil: Result := TPSPBancoDoBrasilStrategy.New(FConfig);
    tbpSantander: Result := TPSPSantanderStrategy.New(FConfig);
    tbpInter: Result := TPSPInterStrategy.New(FConfig);
    tbpItau: Result := TPSPInterStrategy.New(FConfig);
    tbpSicredi: Result := TPSPSicrediStrategy.New(FConfig);
    tbpShipay: Result := TPSPShipayStrategy.New(FConfig);
    tbpSicoob: Result := TPSPSicoobStrategy.New(FConfig);
    tbpPagSeguro: Result := TPSPPagSeguroStrategy.New(FConfig);
    tbpGerenciaNet: Result := TPSPGerenciaNetStrategy.New(FConfig);
    tbpBradesco: Result := TPSPBradescoStrategy.New(FConfig);
    tbpPixPDV: Result := TPSPPixPDVStrategy.New(FConfig);
    tbpAilos: Result := TPSPAilosStrategy.New(FConfig);
    tbpCielo: Result := TPSPCieloStrategy.New(FConfig);
    tbpMercadoPago: Result := TPSPMercadoPagoStrategy.New(FConfig);
    tbpMatera: Result := TPSPMateraStrategy.New(FConfig);
  end;


end;

class function TPixContexto.New(Config: IConfiguracao): IPSPPixContext;
begin
  result := Self.Create(Config);
end;

end.
