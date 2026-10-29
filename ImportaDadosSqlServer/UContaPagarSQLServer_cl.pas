unit UContaPagarSQLServer_cl;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMContaPagarSQLServer = class(TDataModule)
    SSQCP: TADOQuery;
    SSQCPCOD_CONTA_PAGAR_CAB: TIntegerField;
    SSQCPNUM_DUPLICATA: TStringField;
    SSQCPCOD_FORNECEDOR: TIntegerField;
    SSQCPNOME_FORNECEDOR: TStringField;
    SSQCPDT_VENCIMENTO: TDateTimeField;
    SSQCPDT_EMISSAO: TDateTimeField;
    SSQCPVALOR: TBCDField;
    SSQCPVALOR_PAGO: TBCDField;
    SSQCPVALOR_JUROS: TBCDField;
    SSQCPDT_PAGAMENTO: TDateTimeField;
    SSQCPIND_SITUACAO: TStringField;
    SSQCPCOD_FINALIDADE: TStringField;
    SSQCPDESC_FINALIDADE: TStringField;
    SSQCPHistorico: TStringField;
    SSQCPNumeronf: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContaPagarSQLServer: TDMContaPagarSQLServer;

implementation

{$R *.dfm}

end.
