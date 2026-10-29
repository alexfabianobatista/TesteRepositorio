unit UContaReceberSQLServer_cl;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMContaReceberSQLServer = class(TDataModule)
    SSQCR: TADOQuery;
    SSQCRCOD_CONTA_RECEBER_CAB: TIntegerField;
    SSQCRNUM_TITULO: TStringField;
    SSQCRCOD_CADASTRO: TIntegerField;
    SSQCRNOME_CADASTRO: TStringField;
    SSQCRDT_EMISSAO: TDateTimeField;
    SSQCRDT_VENCIMENTO: TDateTimeField;
    SSQCRDT_PAGAMENTO: TDateTimeField;
    SSQCRVAL_TITULO: TBCDField;
    SSQCRVAL_JUROS: TBCDField;
    SSQCRNUM_PEDIDO: TIntegerField;
    SSQCRIND_SITUACAO: TStringField;
    SSQCRNossonumero: TIntegerField;
    SSQCRDESC_REGISTRO: TStringField;
    SSQCRValorpecas: TBCDField;
    SSQCRValorbruto: TBCDField;
    SSQCRVAL_RECEBIDO: TBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContaReceberSQLServer: TDMContaReceberSQLServer;

implementation

{$R *.dfm}

end.
