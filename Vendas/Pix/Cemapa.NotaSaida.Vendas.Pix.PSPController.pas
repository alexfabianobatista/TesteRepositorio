unit Cemapa.NotaSaida.Vendas.Pix.PSPController;

interface

uses
  SysUtils,
  Cemapa.NotaSaida.Vendas.Pix.Interfaces,
  Cemapa.Conversoes.API;

type
  TPSPPixController =  class(TInterfacedObject, IPSPPixController)
  private
    FConfiguracao: IConfiguracao;
    FContexto: IPSPPixContext;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : IPSPPixController;


    function Configuracao: IConfiguracao;
    function Contexto: IPSPPixContext;
    function TipoBanco(Value: Integer): TTipoBancoPix;
  end;

implementation

uses
  Cemapa.NotaSaida.Vendas.Pix.PixContexto,
  Cemapa.NotaSaida.Vendas.Pix;

{ TPixController }

function TPSPPixController.Configuracao: IConfiguracao;
begin
  Result := FConfiguracao;
end;

function TPSPPixController.Contexto: IPSPPixContext;
begin
  if not Assigned(FContexto) then
    FContexto := TPixContexto.New(FConfiguracao);

  Result := FContexto;
end;

constructor TPSPPixController.Create;
begin

  FConfiguracao := TCemapaPixAPI.New;

end;

destructor TPSPPixController.Destroy;
begin

  inherited;
end;

class function TPSPPixController.New: IPSPPixController;
begin
  result := Self.Create;

end;

function TPSPPixController.TipoBanco(Value: Integer): TTipoBancoPix;
begin
  case value of
    1 : Result := tbpBancodoBrasil;
    33: Result := tbpSantander;
    77: Result := tbpInter;
    184: Result := tbpItau;
    748: Result := tbpSicredi;
    // 0: Result := tbpShipay;      // Até o momento, sem condigo de banco - descobrir a forma de vínculo
    756: Result := tbpSicoob;
    290: Result := tbpPagSeguro;
    364: Result := tbpGerenciaNet;
    63: Result := tbpBradesco;
    // 0 : Result := tbpPixPDV;  // Até o momento, sem condigo de banco - descobrir a forma de vínculo
    85: Result := tbpAilos;
    362: Result := tbpCielo;
    323: Result := tbpMercadoPago;
    // 0: Result := tbpMatera; // Até o momento, sem condigo de banco - descobrir a forma de vínculo
  else
     Raise Exception.Create('Não foi possível localizar o tipo de banco');
  end;
end;

end.
