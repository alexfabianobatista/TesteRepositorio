unit UPisCofinsM_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient;

type
  TDMPisCofinsM = class(TDataModule)
    QReg400: TOracleDataSet1;
    QReg400CST_PIS: TStringField;
    QReg400DESC_COMPL: TStringField;
    QReg410: TOracleDataSet1;
    QReg800: TOracleDataSet1;
    QReg800CST_COFINS: TStringField;
    QReg800DESC_COMPL: TStringField;
    QReg810: TOracleDataSet1;
    QReg810NAT_REC: TIntegerField;
    QReg810DESC_COMPL: TStringField;
    QReg410NAT_REC: TIntegerField;
    QReg410DESC_COMPL: TStringField;
    QReg200_old: TOracleDataSet1;
    QReg200_oldVL_TOT_CRED_DESC: TFloatField;
    QReg200_oldVL_TOT_CONT_NC_PER: TFloatField;
    QReg200_oldVL_TOT_CONT_CUM_PER: TFloatField;
    QReg200_oldVL_TOT_CRED_DESC_ANT: TFloatField;
    QReg100_old: TOracleDataSet1;
    QReg105_old: TOracleDataSet1;
    QReg105_oldNAT_BC_CRED: TStringField;
    QReg105_oldCST_PIS: TStringField;
    QReg105_oldVL_BC_PIS_NC: TFloatField;
    QReg105_oldVL_BC_PIS: TFloatField;
    QReg105_oldVL_BC_PIS_TOT: TFloatField;
    QReg105_oldVL_BC_PIS_CUM: TFloatField;
    QReg100_oldCOD_CRED: TFloatField;
    QReg100_oldIND_CRED_ORI: TFloatField;
    QReg100_oldVL_AJUS_ACRES: TFloatField;
    QReg100_oldVL_AJUS_REDUC: TFloatField;
    QReg100_oldVL_CRED_DIF: TFloatField;
    QReg100_oldIND_DESC_CRED: TFloatField;
    QReg100_oldSLD_CRED: TFloatField;
    QReg100_oldALIQ_PIS: TFloatField;
    QReg100_oldVL_CRED: TFloatField;
    QReg100_oldVL_CRED_DISP: TFloatField;
    QReg100_oldVL_CRED_DESC: TFloatField;
    QReg100_oldVL_BC_PIS: TFloatField;
    QReg210: TOracleDataSet1;
    QReg210COD_CONT: TStringField;
    QReg210ALIQ_PIS: TFloatField;
    QReg210VL_CONT_APUR: TFloatField;
    QReg210VL_CONT_PER: TFloatField;
    QReg210VL_REC_BRT: TFloatField;
    QReg210VL_BC_CONT: TFloatField;
    QReg500_old: TOracleDataSet1;
    QReg500_oldCOD_CRED: TFloatField;
    QReg500_oldIND_CRED_ORI: TFloatField;
    QReg500_oldVL_AJUS_ACRES: TFloatField;
    QReg500_oldVL_AJUS_REDUC: TFloatField;
    QReg500_oldVL_CRED_DIF: TFloatField;
    QReg500_oldIND_DESC_CRED: TFloatField;
    QReg500_oldSLD_CRED: TFloatField;
    QReg500_oldALIQ_COFINS: TFloatField;
    QReg500_oldVL_CRED: TFloatField;
    QReg500_oldVL_CRED_DISP: TFloatField;
    QReg500_oldVL_CRED_DESC: TFloatField;
    QReg500_oldVL_BC_COFINS: TFloatField;
    QReg600_old: TOracleDataSet1;
    QReg600_oldVL_TOT_CRED_DESC: TFloatField;
    QReg600_oldVL_TOT_CONT_NC_PER: TFloatField;
    QReg600_oldVL_TOT_CONT_CUM_PER: TFloatField;
    QReg600_oldVL_TOT_CRED_DESC_ANT: TFloatField;
    QReg610: TOracleDataSet1;
    QReg610COD_CONT: TStringField;
    QReg610ALIQ_COFINS: TFloatField;
    QReg610VL_CONT_APUR: TFloatField;
    QReg610VL_CONT_PER: TFloatField;
    QReg610VL_REC_BRT: TFloatField;
    QReg610VL_BC_CONT: TFloatField;
    QReg505_old: TOracleDataSet1;
    QReg505_oldNAT_BC_CRED: TStringField;
    QReg505_oldCST_COFINS: TStringField;
    QReg505_oldVL_BC_COFINS_TOT: TFloatField;
    QReg505_oldVL_BC_COFINS_CUM: TFloatField;
    QReg505_oldVL_BC_COFINS_NC: TFloatField;
    QReg505_oldVL_BC_COFINS: TFloatField;
    QReg200_oldVL_CONT_CUM_REC: TFloatField;
    QReg200_oldVL_TOT_CONT_REC: TFloatField;
    QReg600_oldVL_CONT_CUM_REC: TFloatField;
    QReg600_oldVL_TOT_CONT_REC: TFloatField;
    QReg205: TOracleDataSet1;
    QReg205NUM_CAMPO: TStringField;
    QReg605: TOracleDataSet1;
    QReg205COD_REC: TStringField;
    QReg605COD_REC: TStringField;
    QReg605NUM_CAMPO: TStringField;
    QReg205VL_DEBITO: TFloatField;
    QReg605VL_DEBITO: TFloatField;
    QReg200_oldVL_TOT_CONT_NC_DEV: TFloatField;
    QReg600_oldVL_TOT_CONT_NC_DEV: TFloatField;
    QReg600_oldVL_CONT_NC_REC: TFloatField;
    QReg200_oldVL_CONT_NC_REC: TFloatField;
    QReg400COD_CTA: TStringField;
    QReg800COD_CTA: TStringField;
    QReg200: TOracleDataSet1;
    QReg200DESC_REGISTRO: TStringField;
    QReg200VAL_REGISTRO: TFloatField;
    QReg200VAL_BC: TFloatField;
    QReg100: TOracleDataSet1;
    QReg100DESC_REGISTRO: TStringField;
    QReg100VAL_REGISTRO: TFloatField;
    QReg100PERC_ALIQUOTA: TFloatField;
    QReg100VAL_BC: TFloatField;
    QReg105: TOracleDataSet1;
    QReg105DESC_REGISTRO: TStringField;
    QReg105COD_CST_PIS: TStringField;
    QReg105VAL_REGISTRO: TFloatField;
    QReg105VAL_BC: TFloatField;
    QReg100COD_NATUREZA_RECEITA: TFloatField;
    QReg105COD_NAT_BC_CRED: TFloatField;
    QReg500: TOracleDataSet1;
    QReg500DESC_REGISTRO: TStringField;
    QReg500COD_NATUREZA_RECEITA: TFloatField;
    QReg500PERC_ALIQUOTA: TFloatField;
    QReg500VAL_REGISTRO: TFloatField;
    QReg500VAL_BC: TFloatField;
    QReg600: TOracleDataSet1;
    QReg600DESC_REGISTRO: TStringField;
    QReg600COD_NATUREZA_RECEITA: TFloatField;
    QReg600PERC_ALIQUOTA: TFloatField;
    QReg600COD_CONT: TIntegerField;
    QReg600VAL_REGISTRO: TFloatField;
    QReg600VAL_BC: TFloatField;
    QReg505: TOracleDataSet1;
    QReg505DESC_REGISTRO: TStringField;
    QReg505COD_NAT_BC_CRED: TFloatField;
    QReg505COD_CST_COFINS: TStringField;
    QReg505VAL_REGISTRO: TFloatField;
    QReg505VAL_BC: TFloatField;
    CDS210_610: TClientDataSet;
    CDS210_610DESC_REGISTRO: TStringField;
    CDS210_610PERC_ALIQUOTA: TFloatField;
    CDS210_610VAL_REGISTRO: TFloatField;
    CDS210_610VAL_BC: TFloatField;
    QReg210_610: TOracleDataSet1;
    QReg210_610DESC_REGISTRO: TStringField;
    QReg210_610COD_NATUREZA_RECEITA: TFloatField;
    QReg210_610PERC_ALIQUOTA: TFloatField;
    QReg210_610COD_CONT: TIntegerField;
    QReg210_610COD_CST_PIS: TStringField;
    QReg210_610COD_CST_COFINS: TStringField;
    QReg210_610VAL_REGISTRO: TFloatField;
    QReg210_610VAL_BC: TFloatField;
    CDS210_610VL_REC_BRT: TFloatField;
    CDS210_610COD_CONT: TIntegerField;
    QReg210_610VAL_REC_BRT: TFloatField;
    CDS200_600: TClientDataSet;
    CDS200_600VL_TOT_CONT_NC_PER: TFloatField;
    CDS200_600VL_TOT_CONT_CUM_PER: TFloatField;
    QReg200COD_CONT: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPisCofinsM: TDMPisCofinsM;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
