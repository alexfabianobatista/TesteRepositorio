unit UPrecoPrazoVendedor_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPrecoPrazoVendedor = class(TDataModule)
    QPrecoPrazoVendedor: TOracleDataSet1;
    QPrecoPrazoVendedorCOD_PRECO_PRAZO_VENDEDOR: TIntegerField;
    QPrecoPrazoVendedorCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrecoPrazoVendedorCOD_PRODUTO: TFloatField;
    QPrecoPrazoVendedorVAL_PRODUTO: TFloatField;
    QPrecoPrazoVendedorCons: TOracleDataSet1;
    QPrecoPrazoVendedorConsCOD_PRECO_PRAZO_VENDEDOR: TIntegerField;
    QPrecoPrazoVendedorConsDESC_PRAZO_VENCIMENTO: TStringField;
    QPrecoPrazoVendedorConsDESC_PRODUTO: TStringField;
    QPrecoPrazoVendedorConsVAL_PRODUTO: TFloatField;
    QPrecoPrazoVendedorCOD_ESTADO: TStringField;
    QPrecoPrazoVendedorConsDESC_ESTADO: TStringField;
    QPrecoPrazoReajuste: TOracleDataSet1;
    QPrecoPrazoReajusteCOD_PRECO_PRAZO_VENDEDOR: TIntegerField;
    QPrecoPrazoReajusteVAL_PRODUTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrecoPrazoVendedor: TDMPrecoPrazoVendedor;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
