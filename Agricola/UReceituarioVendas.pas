unit UReceituarioVendas;

interface

type
  TReceituarioItem = class
  private
    FAgrotoxico: Integer;
    FCpfAgronomo: String;
    FDose: Extended;
    FNumeroReceituario: Integer;
    FQuantidade: Extended;
    FTipo: String;
    FUnidade: Integer;
  protected
  public
    constructor Create;
    property Agrotoxico: Integer read FAgrotoxico write FAgrotoxico;
    property CpfAgronomo: String read FCpfAgronomo write FCpfAgronomo;
    property Dose: Extended read FDose write FDose;
    property NumeroReceituario: Integer read FNumeroReceituario write FNumeroReceituario;
    property Quantidade: Extended read FQuantidade write FQuantidade;
    property Tipo: String read FTipo write FTipo;
    property Unidade: Integer read FUnidade write FUnidade;
  end;

  TArrayReceitaItem = array of TReceituarioItem;

  TReceituario = class
  private
    FAlvo: Integer;
    FArea: Extended;
    FArt: String;
    FCpfAgronomo: String;
    FCpfUsuario: String;
    FCultura: Integer;
    FDataEmissao: TDateTime;
    FDiagnostico: String;
    FEpi: String;
    FIntervaloSeguranca: String;
    FItems: TArrayReceitaItem;
    FLatitude: String;
    FLocalPropriedade: String;
    FLongitude: String;
    FMicrobacia: Integer;
    FModalidadeEpoca: String;
    FMunicipio: Integer;
    FNomePropriedade: String;
    FNomeUsuario: String;
    FNumero: Integer;
    FOrientacao: String;
    FOutras: String;
    FPrecaucao: String;
    FTipo: String;
    FNumeroAplicacoes :Integer;
    FHash: String;
    FRepositorioPublico: String;
    FTipoAssinatura: String;
  protected
  public
    constructor Create;
    procedure AddItem(Item: TReceituarioItem);
    property Alvo: Integer read FAlvo write FAlvo;
    property Area: Extended read FArea write FArea;
    property Art: String read FArt write FArt;
    property CpfAgronomo: String read FCpfAgronomo write FCpfAgronomo;
    property CpfUsuario: String read FCpfUsuario write FCpfUsuario;
    property Cultura: Integer read FCultura write FCultura;
    property DataEmissao: TDateTime read FDataEmissao write FDataEmissao;
    property Diagnostico: String read FDiagnostico write FDiagnostico;
    property Epi: String read FEpi write FEpi;
    property IntervaloSeguranca: String read FIntervaloSeguranca write FIntervaloSeguranca;
    property Items: TArrayReceitaItem read FItems;
    property Latitude: String read FLatitude write FLatitude;
    property LocalPropriedade: String read FLocalPropriedade write FLocalPropriedade;
    property Longitude: String read FLongitude write FLongitude;
    property Microbacia: Integer read FMicrobacia write FMicrobacia;
    property ModalidadeEpoca: String read FModalidadeEpoca write FModalidadeEpoca;
    property Municipio: Integer read FMunicipio write FMunicipio;
    property NomePropriedade: String read FNomePropriedade write FNomePropriedade;
    property NomeUsuario: String read FNomeUsuario write FNomeUsuario;
    property Numero: Integer read FNumero write FNumero;
    property Orientacao: String read FOrientacao write FOrientacao;
    property Outras: String read FOutras write FOutras;
    property Precaucao: String read FPrecaucao write FPrecaucao;
    property Tipo: String read FTipo write FTipo;
    property NumeroAplicacoes :Integer read FNumeroAplicacoes write FNumeroAplicacoes;
    property Hash: String read FHash write FHash;
    property RepositorioPublico: String read FRepositorioPublico write FRepositorioPublico;
    property TipoAssinatura: String read FTipoAssinatura write FTipoAssinatura;
  end;

implementation

{ TReceituarioItem }

constructor TReceituarioItem.Create;
begin
  FTipo := 'P';
end;

{ TReceituario }

procedure TReceituario.AddItem(Item: TReceituarioItem);
var
  i: Integer;
begin
  i := Length(FItems);
  SetLength(FItems, i + 1);
  FItems[i] := Item;
end;

constructor TReceituario.Create;
begin
  FTipo := 'R';
  FHash := '';
  FRepositorioPublico := '';
  FTipoAssinatura := 'M';
  SetLength(FItems, 0);
end;

end.
