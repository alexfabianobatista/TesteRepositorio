unit UImpostoRendaRelTXT_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMImpostoRendaRelTXT = class(TDataModule)
    QRImpostoRenda_VendasTXT: TOracleDataSet1;
    QRImpostoRenda_RecebTXT: TOracleDataSet1;
    QRImpostoRenda_AgricolaTXT: TOracleDataSet1;
    QRImpostoRenda_adiantTXT: TOracleDataSet1;
    QRImpostoRenda_VendasTXTIND_ENTRADA_SAIDA: TStringField;
    QRImpostoRenda_VendasTXTSVAL_MES1: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES2: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES3: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES4: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES5: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES6: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES7: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES8: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES9: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES10: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES11: TFloatField;
    QRImpostoRenda_VendasTXTSVAL_MES12: TFloatField;
    QRImpostoRenda_AgricolaTXTCOD_PRODUTO: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES1: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES2: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES3: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES4: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES5: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES6: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES7: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES8: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES9: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES10: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES11: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXAR_MES12: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES1: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES2: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES3: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES4: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES5: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES6: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES7: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES8: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES9: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES10: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES11: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_FIXACAO_MES12: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES1: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES2: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES3: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES4: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES5: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES6: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES7: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES8: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES9: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES10: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES11: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FIXACAO_MES12: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES1: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES2: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES3: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES4: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES5: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES6: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES7: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES8: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES9: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES10: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES11: TFloatField;
    QRImpostoRenda_AgricolaTXTSVAL_FUNRURAL_MES12: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_SALDO_FIXAR: TFloatField;
    QRImpostoRenda_AgricolaTXTSQT_DEVOLUCAO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES1_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES1_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES1_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES2_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES2_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES2_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES3_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES3_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES3_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES4_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES4_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES4_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES5_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES5_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES5_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES6_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES6_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES6_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES7_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES7_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES7_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES8_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES8_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES8_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES9_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES9_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES9_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES10_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES10_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES10_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES11_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES11_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES11_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES12_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES12_JURO: TFloatField;
    QRImpostoRenda_RecebTXTSVAL_MES12_DESCONTO: TFloatField;
    QRImpostoRenda_RecebTXTSALDO_FINAL: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES1_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES1_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES2_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES2_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES3_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES3_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES4_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES4_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES5_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES5_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES6_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES6_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES7_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES7_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES8_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES8_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES9_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES9_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES10_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES10_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES11_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES11_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES12_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES12_BAIXA_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES1_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES1_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES2_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES2_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES3_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES3_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES4_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES4_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES5_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES5_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES6_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES6_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES7_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES7_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES8_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES8_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES9_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES9_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES10_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES10_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES11_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES11_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES12_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_MES12_BAIXA_CP: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_SALDO_ANTERIOR_CR: TFloatField;
    QRImpostoRenda_adiantTXTSVAL_SALDO_ANTERIOR_CP: TFloatField;
    QRImpostoRenda_AgricolaTXTDESC_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMImpostoRendaRelTXT: TDMImpostoRendaRelTXT;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
