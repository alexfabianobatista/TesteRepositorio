unit DeclaracaoPrestacaoServico;

interface

uses
  Local, TypInfo, NfseTypes, DadosServico, Valores, IdentificacaoRps, IdentificacaoTomador, Tomador,
  IntermediarioServico, ConstrucaoCivil, NfseVersao, NfseConsts, EnderecoNfse, Contato, InfIbsCbs;

type
  TDeclaracaoPrestacaoServico = class;

  TListaRpsElotech = Array of TDeclaracaoPrestacaoServico;

  TRpsElotech = class(TNFSeElement)
  private
  protected
    FIdentificacaoRps: TIdentificacaoRps;
    FDataEmissao: String;
    FStatus: Integer;
  public
    constructor Create;
  published
    property IdentificacaoRps: TIdentificacaoRps read FIdentificacaoRps write FIdentificacaoRps;
    property DataEmissao: String read FDataEmissao write FDataEmissao;
    property Status: Integer read FStatus write FStatus;
  end;

  TDadosPrestador = class(TNFSeElement)
  private
  protected
    FIdentificacaoPrestador: TIdentificacaoTomador;
    FRazaoSocial: String;
    FEndereco: TEndereco;
    FContato: TContato;
  published
    property IdentificacaoPrestador: TIdentificacaoTomador read FIdentificacaoPrestador write FIdentificacaoPrestador;
    property RazaoSocial: String read FRazaoSocial write FRazaoSocial;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property Contato: TContato read FContato write FContato;
  end;
  TInfDeclaracaoPrestacaoServico = class(TNFSeElementNoEmptys)
  private
  protected
    FRps: TRpsElotech;
    FCompetencia: String;
    FServico: TDadosServico; 
	  FPrestador: TIdentificacaoTomador;
    FIntermediario: TIntermediarioServico;
    FDadosPrestador: TDadosPrestador;
	  FTomador: TTomador;
    FIntermediarioServico: TIntermediarioServico;
    FConstrucaoCivil: TConstrucaoCivil;
    FRegimeEspecialTributacao: Integer;
	  FOptanteSimplesNacional: Integer;
    FIncentivoFiscal: Integer;
    FInfIbsCbs: TInfIbsCbs;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Rps: TRpsElotech read FRps write FRps;
    property Competencia: String read FCompetencia write FCompetencia;
    property Servico: TDadosServico read FServico write FServico;
	  property Prestador: TIdentificacaoTomador read FPrestador write FPrestador;
    property Intermediario: TIntermediarioServico read FIntermediario write FIntermediario;
    property DadosPrestador: TDadosPrestador read FDadosPrestador write FDadosPrestador;
    property Tomador: TTomador read FTomador write FTomador;
    property IntermediarioServico: TIntermediarioServico read FIntermediarioServico write FIntermediarioServico;
    property ConstrucaoCivil: TConstrucaoCivil read FConstrucaoCivil write FConstrucaoCivil;
    property RegimeEspecialTributacao: Integer read FRegimeEspecialTributacao write FRegimeEspecialTributacao;
	  property OptanteSimplesNacional: Integer read FIncentivoFiscal write FIncentivoFiscal;
    property IncentivoFiscal: Integer read FIncentivoFiscal write FIncentivoFiscal;
    property InfIbsCbs: TInfIbsCbs read FInfIbsCbs write FInfIbsCbs;
  end;

  TDeclaracaoPrestacaoServico = class(TNFSeElementNoEmptys)
  private
  protected
    FInfDeclaracaoPrestacaoServico: TInfDeclaracaoPrestacaoServico;
  public
    constructor Create;
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property InfDeclaracaoPrestacaoServico: TInfDeclaracaoPrestacaoServico read FInfDeclaracaoPrestacaoServico;
  end;


implementation

{ TDeclaracaoPrestacaoServico }

constructor TDeclaracaoPrestacaoServico.Create;
begin
  FInfDeclaracaoPrestacaoServico := TInfDeclaracaoPrestacaoServico.Create;
end;

{ TRpsElotech }

constructor TRpsElotech.Create;
begin
  FIdentificacaoRps := TIdentificacaoRps.Create;
end;

end.
