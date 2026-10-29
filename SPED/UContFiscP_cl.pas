unit UContFiscP_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContFiscP = class(TDataModule)
    QReg030: TOracleDataSet1;
    QReg030DT_INI: TDateTimeField;
    QReg030PER_APUR: TStringField;
    QReg030DT_FIN: TDateTimeField;
    QReg100: TOracleDataSet1;
    QReg100CODIGO: TStringField;
    QReg100DESCRICAO: TStringField;
    QReg100TIPO: TStringField;
    QReg100NIVEL: TIntegerField;
    QReg100COD_NAT: TStringField;
    QReg100COD_CTA_SUP: TStringField;
    QReg100DT_ANO_MES: TIntegerField;
    QReg100IND_VAL_CTA_REF_INI: TStringField;
    QReg100IND_VAL_CTA_REF_FIN: TStringField;
    QReg100VAL_CTA_REF_INI: TFloatField;
    QReg100VAL_CTA_REF_FIN: TFloatField;
    QReg100VAL_CTA_REF_DEB: TFloatField;
    QReg100VAL_CTA_REF_CRED: TFloatField;
    QReg130Saldo: TOracleDataSet1;
    QReg130SaldoVAL_ATUAL: TFloatField;
    QReg130Contas: TOracleDataSet1;
    QReg130ContasCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QReg130ContasDESC_COMPOSICAO_CUSTOS: TStringField;
    QReg130ContasIND_ATIVO: TStringField;
    QReg130ContasCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QReg130ContasNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg130ContasDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg130: TOracleDataSet1;
    QReg130COD_COMPOSICAO_CUSTOS: TIntegerField;
    QReg130DESC_COMPOSICAO_CUSTOS: TStringField;
    QReg130IND_ATIVO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFiscP: TDMContFiscP;

implementation

{$R *.dfm}

end.
