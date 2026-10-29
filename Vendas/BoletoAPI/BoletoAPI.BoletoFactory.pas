unit BoletoAPI.BoletoFactory;

interface

uses
  SysUtils,
  TypInfo,
  BoletoApi.Interfaces,      // definição de IBoletoApi  
  BoletoAPI.BoletoSicredi,   // implementação concreta para nota
  BoletoAPI.ContasReceber.BoletoSicredi, // implementação concreta contas receber
  BoletoAPI.BoletoCresol,
  BoletoAPI.ContasReceber.BoletoCresol;

type
  // Enum para identificar de onde vem o boleto
  TTipoGeraBoleto = (TGBNota, TGBContasReceber, TGBContrato);

  TBoletoFactory = class
  public
    class function RetornaBoletoBanco(CodFilial, NumNota, CodNota,
                                    NumBanco, CodContrato: Integer; tTipoGeracaoBoleto: TTipoGeraBoleto;
                                    IndAmbiente: String; bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
    class function RetornaBoletoNota(CodFilial, NumNota, CodNota, NumBanco: Integer;
                                               IndAmbiente: String; bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
    class function RetornaBoletoContasReceber(CodFilial, NumBanco: Integer;
                                               IndAmbiente: String; bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
    class function RetornaBoletoContrato(CodFilial, NumBanco, CodContrato: Integer;
                                               IndAmbiente: String; bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
  end;

implementation

{ TBoletoFactory }

class function TBoletoFactory.RetornaBoletoBanco(CodFilial, NumNota, CodNota,
  NumBanco, CodContrato: Integer; tTipoGeracaoBoleto: TTipoGeraBoleto;
  IndAmbiente: String; bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
begin

  Result := nil;

  case tTipoGeracaoBoleto of
    TGBNota: Result := RetornaBoletoNota(CodFilial, NumNota, CodNota, NumBanco, IndAmbiente, bEnviaEmail, bGeraPdf);
    TGBContasReceber: Result := RetornaBoletoContasReceber(CodFilial, NumBanco, IndAmbiente, bEnviaEmail, bGeraPdf);
    TGBContrato: Result := RetornaBoletoContasReceber(CodFilial, NumBanco, IndAmbiente, bEnviaEmail, bGeraPdf);
  end;

end;

class function TBoletoFactory.RetornaBoletoContasReceber(CodFilial, NumBanco: Integer;
  IndAmbiente: String; bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
begin

  Result := nil;
  case NumBanco of
    748: Result := TEnvioBoletoApiSicrediCR.Create(CodFilial, NumBanco, IndAmbiente, bEnviaEmail, bGeraPdf);
    133: Result := TEnvioBoletoApiCresolCR.Create(CodFilial, NumBanco, IndAmbiente, bEnviaEmail, bGeraPdf);
  end;


end;

class function TBoletoFactory.RetornaBoletoContrato(CodFilial, NumBanco,
  CodContrato: Integer; IndAmbiente: String;
  bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
begin

  Result := nil;
  {
  case NumBanco of
    748: Result := TEnvioBoletoApiSicrediContrato.Create(CodFilial, NumBanco, CodContrato, IndAmbiente, bEnviaEmail, bGeraPdf);
  end;
  }
end;

class function TBoletoFactory.RetornaBoletoNota(CodFilial, NumNota,
  CodNota, NumBanco: Integer; IndAmbiente: String;
  bEnviaEmail, bGeraPdf: Boolean): IBoletoApi;
begin

  Result := nil;

  case NumBanco of
    748: Result := TEnvioBoletoApiSicredi.Create(CodFilial, NumNota, CodNota, NumBanco, IndAmbiente, bEnviaEmail);
    133: Result := TEnvioBoletoApiCresol.Create(CodFilial, NumNota, CodNota, NumBanco, IndAmbiente, bEnviaEmail);
  end;

end;

end.

