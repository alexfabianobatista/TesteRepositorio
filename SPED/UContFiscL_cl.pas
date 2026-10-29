unit UContFiscL_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, UOracle_cl;

type
  TDMContFiscL = class(TDataModule)
    QReg030: TOracleDataSet1;
    QReg030DT_INI: TDateTimeField;
    QReg030PER_APUR: TStringField;
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
    QReg030DT_FIN: TDateTimeField;
    QReg100VAL_CTA_REF_DEB: TFloatField;
    QReg100VAL_CTA_REF_CRED: TFloatField;
    QReg210Saldo: TOracleDataSet1;
    QReg210SaldoVAL_ATUAL: TFloatField;
    QReg210Contas: TOracleDataSet1;
    QReg210: TOracleDataSet1;
    QReg210ContasCOD_COMPOSICAO_CUSTOS: TIntegerField;
    QReg210ContasDESC_COMPOSICAO_CUSTOS: TStringField;
    QReg210ContasIND_ATIVO: TStringField;
    QReg210ContasCOD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QReg210ContasNUM_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg210ContasDESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg210COD_COMPOSICAO_CUSTOS: TIntegerField;
    QReg210DESC_COMPOSICAO_CUSTOS: TStringField;
    QReg210IND_ATIVO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFiscL: TDMContFiscL;

implementation


{$R *.dfm}

end.
