unit UContasPagarFirebird_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMContasPagarFirebird = class(TDataModule)
    ZQCP_INTELIC: TZQuery;
    ZQCP_INTELICFILIAL: TIntegerField;
    ZQCP_INTELICCODCLI: TIntegerField;
    ZQCP_INTELICVENDEDOR: TIntegerField;
    ZQCP_INTELICPARCELA: TStringField;
    ZQCP_INTELICVENCIMENTO: TDateTimeField;
    ZQCP_INTELICPAGAMENTO: TDateTimeField;
    ZQCP_INTELICVALOR: TFloatField;
    ZQCP_INTELICMULTA: TFloatField;
    ZQCP_INTELICJUROS: TFloatField;
    ZQCP_INTELICVLRPAGO: TFloatField;
    ZQCP_INTELICOUTROS: TFloatField;
    ZQCP_INTELICDESCONTO: TFloatField;
    ZQCP_INTELICTOTAL: TFloatField;
    ZQCP_INTELICNFVLR: TFloatField;
    ZQCP_INTELICABATIMENTO: TFloatField;
    ZQCP_INTELICNUMERO_NOTA: TStringField;
    ZQCP_INTELICOBS: TStringField;
    ZQCP_INTELICVALOR_MORA_PAGO: TFloatField;
    ZQCP_INTELICVALOR_MULTA_PAGO: TFloatField;
    ZQCP_INTELICVALOR_DESCONTO_CONCEDIDO: TFloatField;
    ZQCP_INTELICVALOR_ABATIMENTO_CONCEDIDO: TFloatField;
    ZQCP_INTELICCOMPETE: TDateTimeField;
    ZQCP_INTELICCONTA: TStringField;
    ZQCP_Retifoz: TZQuery;
    ZQCP_RetifozCOD_CONTA_PAGAR_CAB: TIntegerField;
    ZQCP_RetifozNUM_TITULO: TStringField;
    ZQCP_RetifozNUM_PARCELA: TSmallintField;
    ZQCP_RetifozTIPO_DOCUMENTO: TStringField;
    ZQCP_RetifozCOD_FILIAL: TIntegerField;
    ZQCP_RetifozCOD_CADASTRO: TIntegerField;
    ZQCP_RetifozNOMEFORNECEDOR: TStringField;
    ZQCP_RetifozCOD_FINALIDADE: TIntegerField;
    ZQCP_RetifozCOD_DEPARTAMENTO: TIntegerField;
    ZQCP_RetifozDT_EMISSAO: TDateField;
    ZQCP_RetifozDT_VENCIMENTO: TDateField;
    ZQCP_RetifozPORTADOR: TSmallintField;
    ZQCP_RetifozTIPODOC: TSmallintField;
    ZQCP_RetifozVAL_ORIGINAL: TFloatField;
    ZQCP_RetifozDT_ACEITE: TDateField;
    ZQCP_RetifozVAL_TITULO: TFloatField;
    ZQCP_RetifozNOMETIPODOC: TStringField;
    ZQCP_RetifozCREDITO: TFloatField;
    ZQCP_RetifozDEBITO: TFloatField;
    ZQCP_RetifozOBS: TStringField;
    ZQCP_RetifozBaixado: TZQuery;
    ZQCP_RetifozBaixadoCOD_CONTA_PAGAR_CAB: TIntegerField;
    ZQCP_RetifozBaixadoNUM_TITULO: TStringField;
    ZQCP_RetifozBaixadoNUM_PARCELA: TSmallintField;
    ZQCP_RetifozBaixadoTIPO_DOCUMENTO: TStringField;
    ZQCP_RetifozBaixadoCOD_FILIAL: TIntegerField;
    ZQCP_RetifozBaixadoCOD_CADASTRO: TIntegerField;
    ZQCP_RetifozBaixadoNOMEFORNECEDOR: TStringField;
    ZQCP_RetifozBaixadoCOD_FINALIDADE: TIntegerField;
    ZQCP_RetifozBaixadoCOD_DEPARTAMENTO: TIntegerField;
    ZQCP_RetifozBaixadoDT_EMISSAO: TDateField;
    ZQCP_RetifozBaixadoDT_VENCIMENTO: TDateField;
    ZQCP_RetifozBaixadoPORTADOR: TSmallintField;
    ZQCP_RetifozBaixadoTIPODOC: TSmallintField;
    ZQCP_RetifozBaixadoVAL_ORIGINAL: TFloatField;
    ZQCP_RetifozBaixadoDT_ACEITE: TDateField;
    ZQCP_RetifozBaixadoVAL_TITULO: TFloatField;
    ZQCP_RetifozBaixadoNOMETIPODOC: TStringField;
    ZQCP_RetifozBaixadoCREDITO: TFloatField;
    ZQCP_RetifozBaixadoDEBITO: TFloatField;
    ZQCP_RetifozBaixadoOBS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContasPagarFirebird: TDMContasPagarFirebird;

implementation
Uses UFirebird_cl;
{$R *.dfm}

end.
