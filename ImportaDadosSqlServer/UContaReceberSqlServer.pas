unit UContaReceberSqlServer;

interface

uses
  SysUtils, Classes, USqlServer_cl, DB, ADODB;

type
  TDMContaReceberSqlServer = class(TDataModule)
    SSQContaReceber: TADOQuery;
    SSQContaReceberCOD_CONTA_RECEBER_CAB: TIntegerField;
    SSQContaReceberNUM_CONTA_RECEBER: TStringField;
    SSQContaReceberNUM_PARCELA: TStringField;
    SSQContaReceberCOD_CADASTRO: TIntegerField;
    SSQContaReceberNOME_CADASTRO: TStringField;
    SSQContaReceberDT_VENCIMENTO: TDateTimeField;
    SSQContaReceberDT_EMISSAO: TDateTimeField;
    SSQContaReceberVAL_TITULO: TBCDField;
    SSQContaReceberVAL_PAGO: TBCDField;
    SSQContaReceberVAL_JUROS: TBCDField;
    SSQContaReceberDT_PAGAMENTO: TDateTimeField;
    SSQContaReceberIND_SITUACAO: TStringField;
    SSQContaReceberCOD_CONTA_CONTABIL: TStringField;
    SSQContaReceberDESC_CONTA_CONTABIL: TStringField;
    SSQContaReceberCOD_CAIXA: TSmallintField;
    SSQContaReceberIND_TIPO_COBRANCA: TSmallintField;
    SSQContaReceberCheque: TStringField;
    SSQContaReceberHistorico: TStringField;
    SSQContaReceberDiasatraso: TIntegerField;
    SSQContaReceberNUM_NOTA: TIntegerField;
    SSQContaReceberCOD_FILIAL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContaReceberSqlServer: TDMContaReceberSqlServer;

implementation

{$R *.dfm}

end.
