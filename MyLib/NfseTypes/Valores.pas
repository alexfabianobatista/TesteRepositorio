unit Valores;

interface

uses
  Local, TypInfo, NfseTypes;

type
  TValores = class(TNFSeElement)
  private
  protected
    FValorServicos: TNFSeFloat2;
    FValorDeducoes: TNFSeFloat2;
    FAliquotaPis: TNFSeFloat2;
    FValorPis: TNFSeFloat2;
    FRetidoPis: Integer;
    FAliquotaCofins: TNFSeFloat2;
    FCSTPisCofins: string;
    FValorCofins: TNFSeFloat2;
    FRetidoCofins: Integer;
    FAliquotaInss: TNFSeFloat2;
    FValorInss: TNFSeFloat2;
    FRetidoInss: Integer;
    FAliquotaIr: TNFSeFloat2;
    FValorIr: TNFSeFloat2;
    FRetidoIr: Integer;
    FAliquotaCsll: TNFSeFloat2;
    FValorCsll: TNFSeFloat2;
    FRetidoCsll: Integer;
    FAliquotaCpp: TNFSeFloat2;
    FValorCpp: TNFSeFloat2;
    FRetidoCpp: Integer;
    FIssRetido: Integer;
    FValorIss: TNFSeFloat2;
    FOutrasRetencoes: TNFSeFloat2;
    FRetidoOutrasRetencoes: Integer;
    FBaseCalculo: TNFSeFloat2; (*Valor dos serviços - Valor das deduções - descontos incondicionados*)
    FAliquota: TNFSeFloat4;
    FValorLiquidoNfse: TNFSeFloat2;  (* ValorServicos - ValorPIS - ValorCOFINS - ValorINSS - ValorIR - ValorCSLL - OutrasRetençoes - ValorISSRetido - DescontoIncondicionado - DescontoCondicionado*)
    FValorIssRetido: TNFSeFloat2;
    FDescontoIncondicionado: TNFSeFloat2;
    FDescontoCondicionado: TNFSeFloat2;
  public
    //function IsTagEvenEmpty(Prop: TPropInfo): Boolean; override;
  published (* Não altere a ordem das propriedades, elas são mapeadas nesta ordem no XML *)
    property ValorServicos: TNFSeFloat2 read FValorServicos write FValorServicos;
    property ValorDeducoes: TNFSeFloat2 read FValorDeducoes write FValorDeducoes;
    property AliquotaPis: TNFSeFloat2 read FAliquotaPis write FAliquotaPis;
    property RetidoPis: Integer read FRetidoPis write FRetidoPis;
    property ValorPis: TNFSeFloat2 read FValorPis write FValorPis;
    property AliquotaCofins: TNFSeFloat2 read FAliquotaCofins write FAliquotaCofins;
    property CSTPisCofins: string read FCSTPisCofins write FCSTPisCofins;
    property RetidoCofins: Integer read FRetidoCofins write FRetidoCofins;
    property ValorCofins: TNFSeFloat2 read FValorCofins write FValorCofins;
    property AliquotaInss: TNFSeFloat2 read FAliquotaInss write FAliquotaInss;
    property RetidoInss: Integer read FRetidoInss write FRetidoInss;
    property ValorInss: TNFSeFloat2 read FValorInss write FValorInss;
    property AliquotaIr: TNFSeFloat2 read FAliquotaIr write FAliquotaIr;
    property RetidoIr: Integer read FRetidoIr write FRetidoIr;
    property ValorIr: TNFSeFloat2 read FValorIr write FValorIr;
    property AliquotaCsll: TNFSeFloat2 read FAliquotaCsll write FAliquotaCsll;
    property RetidoCsll: Integer read FRetidoCsll write FRetidoCsll;
    property ValorCsll: TNFSeFloat2 read FValorCsll write FValorCsll;
    property AliquotaCpp: TNFSeFloat2 read FAliquotaCpp write FAliquotaCpp;
    property RetidoCpp: Integer read FRetidoCpp write FRetidoCpp;
    property ValorCpp: TNFSeFloat2 read FValorCpp write FValorCpp;
    property IssRetido: Integer read FIssRetido write FIssRetido;
    property ValorIss: TNFSeFloat2 read FValorIss write FValorIss;
    property RetidoOutrasRetencoes: Integer read FRetidoOutrasRetencoes write FRetidoOutrasRetencoes;
    property OutrasRetencoes: TNFSeFloat2 read FOutrasRetencoes write FOutrasRetencoes;
    property BaseCalculo: TNFSeFloat2 read FBaseCalculo write FBaseCalculo;
    property Aliquota: TNFSeFloat4 read FAliquota write FAliquota;
    property ValorLiquidoNfse: TNFSeFloat2 read FValorLiquidoNfse write FValorLiquidoNfse;
    property ValorIssRetido: TNFSeFloat2 read FValorIssRetido write FValorIssRetido;
    property DescontoCondicionado: TNFSeFloat2 read FDescontoCondicionado write FDescontoCondicionado;
    property DescontoIncondicionado: TNFSeFloat2 read FDescontoIncondicionado write FDescontoIncondicionado;  
  end;


implementation

{function TValores.IsTagEvenEmpty(Prop: TPropInfo): Boolean;
begin

end;}
end.
 