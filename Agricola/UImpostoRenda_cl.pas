unit UImpostoRenda_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMImpostoRenda = class(TDataModule)
    QRImpostoRenda_Vendas: TOracleDataSet1;
    QRImpostoRenda_VendasSVAL_MES1: TFloatField;
    QRImpostoRenda_VendasSVAL_MES2: TFloatField;
    QRImpostoRenda_VendasSVAL_MES3: TFloatField;
    QRImpostoRenda_VendasSVAL_MES4: TFloatField;
    QRImpostoRenda_VendasSVAL_MES5: TFloatField;
    QRImpostoRenda_VendasSVAL_MES6: TFloatField;
    QRImpostoRenda_VendasSVAL_MES7: TFloatField;
    QRImpostoRenda_VendasSVAL_MES8: TFloatField;
    QRImpostoRenda_VendasSVAL_MES9: TFloatField;
    QRImpostoRenda_VendasSVAL_MES10: TFloatField;
    QRImpostoRenda_VendasSVAL_MES11: TFloatField;
    QRImpostoRenda_VendasSVAL_MES12: TFloatField;
    QRImpostoRenda_Receb: TOracleDataSet1;
    QRImpostoRenda_RecebSVAL_MES1_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES1_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES1_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES2_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES2_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES2_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES3_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES3_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES3_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES4_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES4_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES4_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES5_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES5_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES5_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES6_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES6_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES6_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES7_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES7_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES7_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES8_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES8_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES8_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES9_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES9_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES9_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES10_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES10_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES10_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES11_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES11_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES11_DESCONTO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES12_PRINCIPAL: TFloatField;
    QRImpostoRenda_RecebSVAL_MES12_JURO: TFloatField;
    QRImpostoRenda_RecebSVAL_MES12_DESCONTO: TFloatField;
    QRImpostoRenda_Adiant: TOracleDataSet1;
    QRImpostoRenda_AdiantSVAL_MES1_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES1_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES2_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES2_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES3_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES3_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES4_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES4_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES5_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES5_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES6_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES6_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES7_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES7_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES8_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES8_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES9_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES9_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES10_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES10_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES11_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES11_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES12_PRINCIPAL_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES12_BAIXA_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES1_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES1_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES2_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES2_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES3_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES3_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES4_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES4_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES5_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES5_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES6_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES6_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES7_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES7_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES8_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES8_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES9_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES9_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES10_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES10_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES11_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES11_BAIXA_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES12_PRINCIPAL_CP: TFloatField;
    QRImpostoRenda_AdiantSVAL_MES12_BAIXA_CP: TFloatField;
    QRImpostoRenda_Agricola: TOracleDataSet1;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES1: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES2: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES3: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES4: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES5: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES6: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES7: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES8: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES9: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES10: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES11: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXAR_MES12: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES1: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES2: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES3: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES4: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES5: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES6: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES7: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES8: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES9: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES10: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES11: TFloatField;
    QRImpostoRenda_AgricolaSQT_FIXACAO_MES12: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES1: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES2: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES3: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES4: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES5: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES6: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES7: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES8: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES9: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES10: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES11: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FIXACAO_MES12: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES1: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES2: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES3: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES4: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES5: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES6: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES7: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES8: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES9: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES10: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES11: TFloatField;
    QRImpostoRenda_AgricolaSVAL_FUNRURAL_MES12: TFloatField;
    QRImpostoRenda_AgricolaCOD_PRODUTO: TFloatField;
    QRImpostoRenda_AgricolaSQT_SALDO_FIXAR: TFloatField;
    QRImpostoRenda_AgricolaSQT_DEVOLUCAO: TFloatField;
    QRImpostoRenda_AdiantSVAL_SALDO_ANTERIOR_CR: TFloatField;
    QRImpostoRenda_AdiantSVAL_SALDO_ANTERIOR_CP: TFloatField;
    QRImpostoRenda_RecebSALDO_FINAL: TFloatField;
    QRImpostoRenda_VendasIND_ENTRADA_SAIDA: TStringField;
    QRImpostoRendaCadastro: TOracleDataSet1;
    QRImpostoRendaCadastroCOD_CADASTRO: TIntegerField;
    QRImpostoRendaCadastroNUM_CGC_CPF: TStringField;
    QRImpostoRendaCadastroNOME: TStringField;
    QRImpostoRenda_AgricolaDESC_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMImpostoRenda: TDMImpostoRenda;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
