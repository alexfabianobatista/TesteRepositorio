unit DadosServico;

interface

uses
  Local, TypInfo, NfseTypes, Valores, IBSCBS_NFSE;

type
  TItemServico = class;       
  TItemServico = class(TNFSeElement)
  private
  protected
    FItemListaServico: String;
    FCodigoCnae: String;
    FDescricao: String;
    FTributavel: Integer;
    FQuantidade: TNFSeFloat2;
    FValorUnitario: TNFSeFloat4;
    FValorDesconto: TNFSeFloat2;
    FValorLiquido: TNFSeFloat2;
  published
    property ItemListaServico: String read FItemListaServico write FItemListaServico;
    property CodigoCnae: String read FCodigoCnae write FCodigoCnae;
    property Descricao: String read FDescricao write FDescricao;
    property Tributavel: Integer read FTributavel write FTributavel;
    property Quantidade: TNFSeFloat2 read FQuantidade write FQuantidade;
    property ValorUnitario: TNFSeFloat4 read FValorUnitario write FValorUnitario;
    property ValorDesconto: TNFSeFloat2 read FValorDesconto write FValorDesconto;
    property ValorLiquido: TNFSeFloat2 read FValorLiquido write FValorLiquido;
  end;
  TListaItensServico = class(TNFSeElement)
  private
  protected
    FItemServico: TNFSeElementItems;
  published
    property ItemServico: TNFSeElementItems read FItemServico write FItemServico;
  end;
  TDadosServico = class(TNFSeElementNoEmptys)
  private
  protected
    FValores: TValores;
    FIssRetido: Integer;
    FItemListaServico: String;
    FCodigoCnae: Integer;
    FCodigoTributacaoMunicipio: String;
    FCodigoNbs: String;
    FDiscriminacao: String;
    FCodigoMunicipio: Integer;
    FExigibilidadeISS: Integer;
    FMunicipioIncidencia: Integer;
    FListaItensServico: TListaItensServico;
    FIBSCBS: TIBSCBS;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property Valores: TValores read FValores write FValores;
    property IssRetido: Integer read FIssRetido write FIssRetido;
    property ItemListaServico: String read FItemListaServico write FItemListaServico;
    property CodigoCnae: Integer read FCodigoCnae write FCodigoCnae;
    property CodigoTributacaoMunicipio: String read FCodigoTributacaoMunicipio write FCodigoTributacaoMunicipio;
    property CodigoNbs: String read FCodigoNbs write FCodigoNbs;
    property Discriminacao: String read FDiscriminacao write FDiscriminacao;
    property CodigoMunicipio: Integer read FCodigoMunicipio write FCodigoMunicipio;
    property ExigibilidadeISS: Integer read FExigibilidadeISS write FExigibilidadeISS;
    property MunicipioIncidencia: Integer read FMunicipioIncidencia write FMunicipioIncidencia;
    property ListaItensServico: TListaItensServico read FListaItensServico write FListaItensServico;
    property IBSCBS: TIBSCBS read FIBSCBS write FIBSCBS;
  end;

implementation

{function TDadosServico.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end;}
end.
