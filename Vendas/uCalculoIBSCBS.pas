unit uCalculoIBSCBS;

interface

uses
  SysUtils;

type
  TImpostosCalculados = record
    vBC: Currency;
    vIBS_Tot: Currency;
    vIBS_Mun: Currency;
    vIBS_Est: Currency;
    vCBS: Currency;
    vTotalOperacao: Currency;
  end;

  TCalculoIBSCBS = Class

    private

    protected

    public
      class function CalcularIBSCBS(
                                const aValorOperacao: Currency;
                                const aAliqIBSUF: Extended;
                                const aAliqIBSMun: Extended;
                                const aAliqCBS: Extended;
                                const aImpostoSeletivo: Currency = 0;
                                const aFrete: Currency = 0;
                                const aSeguro: Currency = 0;
                                const aDespesas: Currency = 0;
                                const aDescontoCondicional: Currency = 0
                              ): TImpostosCalculados;


    end;

var
  FCalculoIBSCBS: TCalculoIBSCBS;

implementation

class function TCalculoIBSCBS.CalcularIBSCBS(
  const aValorOperacao: Currency;
  const aAliqIBSUF: Extended;
  const aAliqIBSMun: Extended;
  const aAliqCBS: Extended;
  const aImpostoSeletivo: Currency = 0;
  const aFrete: Currency = 0;
  const aSeguro: Currency = 0;
  const aDespesas: Currency = 0;
  const aDescontoCondicional: Currency = 0
): TImpostosCalculados;
var
  BaseCalculo: Currency;
begin
  // A base de cálculo é o valor da operação, que pode incluir Imposto Seletivo,
  // frete, seguro e despesas, e subtrair descontos condicionais.
  BaseCalculo := (aValorOperacao + aFrete + aSeguro + aDespesas + aImpostoSeletivo) - aDescontoCondicional;

  // Calculando o IBS e a CBS
  Result.vIBS_Mun := BaseCalculo * (aAliqIBSMun / 100);
  Result.vIBS_Est := BaseCalculo * (aAliqIBSUF / 100);
  Result.vIBS_Tot := BaseCalculo * (aAliqIBSUF / 100) + BaseCalculo * (aAliqIBSMun / 100);
  Result.vCBS := BaseCalculo * (aAliqCBS / 100);

  // A base de cálculo para ambos é a mesma
  Result.vBC := BaseCalculo;

  // O valor total da operação inclui os tributos calculados, pois eles são por fora
  Result.vTotalOperacao := aValorOperacao + aImpostoSeletivo + Result.vIBS_Tot + Result.vCBS;
end;

end.

