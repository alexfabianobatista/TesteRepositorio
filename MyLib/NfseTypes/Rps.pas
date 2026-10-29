unit Rps;

interface

uses
  Local, TypInfo, NfseTypes, Prestador, DadosServico, Valores, IdentificacaoRps, Tomador, IntermediarioServico, ConstrucaoCivil,
  NfseVersao, NfseConsts, DeclaracaoPrestacaoServico;

type
  TRps = class;

  TListaRps = Array of TRps;

  TInfRps = class(TNFSeElementNoEmptys)
  private
    procedure SetId(const Value: String);
  protected
    FId: String;
    FIdentificacaoRps: TIdentificacaoRps;

    FDataEmissao: String;
    FNaturezaOperacao: Integer;
    FRegimeEspecialTributacao: Integer;
    FOptanteSimplesNacional: Integer;
    FIncentivadorCultural: Integer;
    FStatus: Integer;
    FRpsSubstituido: TIdentificacaoRps;
    FServico: TDadosServico;
    FPrestador: TPrestador;
    FTomador: TTomador;
    FIntermediarioServico: TIntermediarioServico;
    FConstrucaoCivil: TConstrucaoCivil;

    constructor Create(Id: String);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Id: String read FId write SetId;
    property IdentificacaoRps: TIdentificacaoRps read FIdentificacaoRps write FIdentificacaoRps;
    property DataEmissao: String read FDataEmissao write FDataEmissao;
    property NaturezaOperacao: Integer read FNaturezaOperacao write FNaturezaOperacao;
    property RegimeEspecialTributacao: Integer read FRegimeEspecialTributacao write FRegimeEspecialTributacao;
    property OptanteSimplesNacional: Integer read FOptanteSimplesNacional write FOptanteSimplesNacional;
    property IncentivadorCultural: Integer read FIncentivadorCultural write FIncentivadorCultural;
    property Status: Integer read FStatus write FStatus;
    property RpsSubstituido: TIdentificacaoRps read FRpsSubstituido write FRpsSubstituido;
    property Servico: TDadosServico read FServico write FServico;
    property Prestador: TPrestador read FPrestador write FPrestador;
    property Tomador: TTomador read FTomador write FTomador;
    property IntermediarioServico: TIntermediarioServico read FIntermediarioServico write FIntermediarioServico;
    property ConstrucaoCivil: TConstrucaoCivil read FConstrucaoCivil write FConstrucaoCivil;
  end;

  TRps = class(TNFSeElementNoEmptys)
  private
  protected
    FInfRps: TInfRps;
  public
    constructor Create(Id: String; Versao: TNfseVersao);
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property InfRps: TInfRps read FInfRps;
  end;

  TLoteRps = class(TNFSeElementNoEmptys)
  private
  protected
    //FId: String;
    FNumeroLote: Integer;
    FCnpj: String;
    FInscricaoMunicipal: String;
    FQuantidadeRps: Integer;
    FListaRps: TListaRps;
    FListaRpsElotech: TListaRpsElotech;
    function GetXMLName(Prop: TPropInfo): String; override;
  public
    //constructor Create(Id: String);
    procedure AdicionaRps(Rps: TRps);
    procedure RemoveRps(Rps: TRps);
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    //property Id: String read FId;
    property NumeroLote: Integer read FNumeroLote write FNumeroLote;
    property Cnpj: String read FCnpj write FCnpj;
    property InscricaoMunicipal: String read FInscricaoMunicipal write FInscricaoMunicipal;
    property QuantidadeRps: Integer read FQuantidadeRps write FQuantidadeRps;
    property ListaRps: TListaRps read FListaRps write FListaRps;
    property ListaRpsElotech: TListaRpsElotech read FListaRpsElotech write FListaRpsElotech;
  end;

implementation

{ TRps }
constructor TRps.Create(Id: String; Versao: TNfseVersao );
begin
  FInfRps := TInfRps.Create(Id);
end;
{function TRps.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin
end;}

{ TInfRps }
constructor TInfRps.Create(Id: String);
begin
  FId := Id;
end;
procedure TInfRps.SetId(const Value: String);
begin
  FId := Value;
end;

{ TLoteNFe }

procedure TLoteRps.AdicionaRps(Rps: TRps);
var
  i: Integer;
begin
  i := Length(FListaRps);
  SetLength(FListaRps, i + 1);
  FListaRps[i] := Rps;
end;

//constructor TLoteRps.Create(Id: String);
//begin
//  FId := Id;
//end;

function TLoteRps.GetXMLName(Prop: TPropInfo): String;
begin
  Result := inherited GetXMLName(Prop);
  if (Prop.Name = 'ListaRpsElotech') then
    Result := 'ListaRps';
end;

procedure TLoteRps.RemoveRps(Rps: TRps);
var
  i: Integer;
begin
  for i := 0 to Length(FListaRps) - 1 do
    if (FListaRps[i] <> nil) and (FListaRps[i].FInfRps.Id = Rps.InfRps.Id) then
      FListaRps[i] := nil;
end;

end.

