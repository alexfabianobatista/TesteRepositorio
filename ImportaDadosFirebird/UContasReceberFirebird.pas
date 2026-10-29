unit UContasReceberFirebird;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TDMContasREceberFirebird = class(TDataModule)
    ZQCR_INTELIC: TZQuery;
    ZQCR_INTELICFILIAL: TIntegerField;
    ZQCR_INTELICCODCLI: TIntegerField;
    ZQCR_INTELICVENDEDOR: TIntegerField;
    ZQCR_INTELICPARCELA: TStringField;
    ZQCR_INTELICVENCIMENTO: TDateTimeField;
    ZQCR_INTELICPAGAMENTO: TDateTimeField;
    ZQCR_INTELICVALOR: TFloatField;
    ZQCR_INTELICMULTA: TFloatField;
    ZQCR_INTELICJUROS: TFloatField;
    ZQCR_INTELICVLRPAGO: TFloatField;
    ZQCR_INTELICOUTROS: TFloatField;
    ZQCR_INTELICDESCONTO: TFloatField;
    ZQCR_INTELICTOTAL: TFloatField;
    ZQCR_INTELICNFVLR: TFloatField;
    ZQCR_INTELICABATIMENTO: TFloatField;
    ZQCR_INTELICNUMERO_NOTA: TStringField;
    ZQCR_INTELICOBS: TStringField;
    ZQCR_INTELICVALOR_MORA_PAGO: TFloatField;
    ZQCR_INTELICVALOR_MULTA_PAGO: TFloatField;
    ZQCR_INTELICVALOR_DESCONTO_CONCEDIDO: TFloatField;
    ZQCR_INTELICVALOR_ABATIMENTO_CONCEDIDO: TFloatField;
    ZQCR_INTELICCOMPETE: TDateTimeField;
    ZQCR_INTELICCONTA: TStringField;
    ZQCR_INTELICPAGA: TStringField;
    ZQCR_Atenas: TZQuery;
    ZQCR_AtenasCOD_CONTA_RECEBER_CAB: TIntegerField;
    ZQCR_AtenasNUM_PARCELA: TStringField;
    ZQCR_AtenasCOD_CADASTRO: TIntegerField;
    ZQCR_AtenasDT_EMISSAO: TDateField;
    ZQCR_AtenasDT_VENCIMENTO: TDateField;
    ZQCR_AtenasVAL_TITULO: TFloatField;
    ZQCR_AtenasVAL_ORIGINAL: TFloatField;
    ZQCR_AtenasDESC_OBSERVACAO: TStringField;
    ZQCR_AtenasDT_PAGAMENTO: TDateField;
    ZQCR_AtenasNUM_TITULO: TIntegerField;
    ZQCRMOV_Atenas: TZQuery;
    ZQCRMOV_AtenasCOD_CONTA_RECEBER_CAB: TIntegerField;
    ZQCRMOV_AtenasDT_MOVIMENTO: TDateField;
    ZQCRMOV_AtenasVAL_MOVIMENTO: TFloatField;
    ZQCRMOV_AtenasIND_TIPO_MOVIMENTO: TStringField;
    ZQCRMOV_AtenasDT_USUARIO: TDateField;
    ZQCRMOV_AtenasCOD_USUARIO: TStringField;
    ZQCR_Retifoz: TZQuery;
    ZQCR_RetifozCOD_CONTA_RECEBER_CAB: TIntegerField;
    ZQCR_RetifozNUM_TITULO: TStringField;
    ZQCR_RetifozNUM_PARCELA: TSmallintField;
    ZQCR_RetifozTIPO_DOCUMENTO: TStringField;
    ZQCR_RetifozCOD_FILIAL: TIntegerField;
    ZQCR_RetifozCOD_CADASTRO: TIntegerField;
    ZQCR_RetifozNOMECLIENTE: TStringField;
    ZQCR_RetifozCOD_FINALIDADE: TIntegerField;
    ZQCR_RetifozCOD_DEPARTAMENTO: TIntegerField;
    ZQCR_RetifozDT_EMISSAO: TDateField;
    ZQCR_RetifozDT_VENCIMENTO: TDateField;
    ZQCR_RetifozPORTADOR: TSmallintField;
    ZQCR_RetifozTIPODOC: TSmallintField;
    ZQCR_RetifozVAL_ORIGINAL: TFloatField;
    ZQCR_RetifozDT_ACEITE: TDateField;
    ZQCR_RetifozVAL_TITULO: TFloatField;
    ZQCR_RetifozNOMETIPODOC: TStringField;
    ZQCR_RetifozCREDITO: TFloatField;
    ZQCR_RetifozDEBITO: TFloatField;
    ZQCR_RetifozOBS: TStringField;
    ZQCR_RetifozBaixado: TZQuery;
    ZQCR_RetifozBaixadoCOD_CONTA_RECEBER_CAB: TIntegerField;
    ZQCR_RetifozBaixadoNUM_TITULO: TStringField;
    ZQCR_RetifozBaixadoNUM_PARCELA: TSmallintField;
    ZQCR_RetifozBaixadoTIPO_DOCUMENTO: TStringField;
    ZQCR_RetifozBaixadoCOD_FILIAL: TIntegerField;
    ZQCR_RetifozBaixadoCOD_CADASTRO: TIntegerField;
    ZQCR_RetifozBaixadoNOMECLIENTE: TStringField;
    ZQCR_RetifozBaixadoCOD_FINALIDADE: TIntegerField;
    ZQCR_RetifozBaixadoCOD_DEPARTAMENTO: TIntegerField;
    ZQCR_RetifozBaixadoDT_EMISSAO: TDateField;
    ZQCR_RetifozBaixadoDT_VENCIMENTO: TDateField;
    ZQCR_RetifozBaixadoPORTADOR: TSmallintField;
    ZQCR_RetifozBaixadoTIPODOC: TSmallintField;
    ZQCR_RetifozBaixadoVAL_ORIGINAL: TFloatField;
    ZQCR_RetifozBaixadoDT_ACEITE: TDateField;
    ZQCR_RetifozBaixadoVAL_TITULO: TFloatField;
    ZQCR_RetifozBaixadoNOMETIPODOC: TStringField;
    ZQCR_RetifozBaixadoCREDITO: TFloatField;
    ZQCR_RetifozBaixadoDEBITO: TFloatField;
    ZQCR_RetifozBaixadoOBS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContasREceberFirebird: TDMContasREceberFirebird;

implementation
uses UFirebird_cl;
{$R *.dfm}

end.
