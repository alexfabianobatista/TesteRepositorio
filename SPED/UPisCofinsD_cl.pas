unit UPisCofinsD_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPisCofinsD = class(TDataModule)
    QReg010: TOracleDataSet1;
    QReg010CNPJ: TStringField;
    QReg100: TOracleDataSet1;
    QReg100COD_CONHECIMENTO: TFloatField;
    QReg100COD_PART: TFloatField;
    QReg100COD_MOD: TStringField;
    QReg100IND_SITUACAO: TStringField;
    QReg100SER: TFloatField;
    QReg100NUM_DOC: TFloatField;
    QReg100DT_DOC: TDateTimeField;
    QReg100DT_A_P: TDateTimeField;
    QReg100VL_SERV: TFloatField;
    QReg100VL_DOC: TFloatField;
    QReg100IND_FRT: TFloatField;
    QReg100VL_BC_ICMS: TFloatField;
    QReg100VL_ICMS: TFloatField;
    QReg100VL_NT: TFloatField;
    QReg100VAL_PIS: TFloatField;
    QReg100VAL_COFINS: TFloatField;
    QReg100IND_TIPO_OPERACAO: TStringField;
    QReg100IND_EMITE: TStringField;
    QReg100CST_ICMS: TStringField;
    QReg100ALIQ_ICMS: TFloatField;
    QReg100TIPO: TStringField;
    QReg101: TOracleDataSet1;
    QReg101IND_NAT_FRT: TStringField;
    QReg101CST_PIS: TStringField;
    QReg101ALIQ_PIS: TFloatField;
    QReg101VL_PIS: TFloatField;
    QReg101COD_CTA: TStringField;
    QReg101VL_BC_PIS: TFloatField;
    QReg101VL_ITEM: TFloatField;
    QReg101TIPO: TStringField;
    QReg100VL_DESC: TFloatField;
    QReg100COD_CTA: TStringField;
    QReg105: TOracleDataSet1;
    QReg105IND_NAT_FRT: TStringField;
    QReg105CST_COFINS: TStringField;
    QReg105ALIQ_COFINS: TFloatField;
    QReg105VL_COFINS: TFloatField;
    QReg105COD_CTA: TStringField;
    QReg105VL_BC_COFINS: TFloatField;
    QReg105VL_ITEM: TFloatField;
    QReg105TIPO: TStringField;
    QReg200: TOracleDataSet1;
    QReg200COD_MOD: TStringField;
    QReg200IND_SITUACAO: TStringField;
    QReg200SER: TFloatField;
    QReg200DT_REF: TDateTimeField;
    QReg200CFOP: TFloatField;
    QReg200NUM_DOC_INI: TFloatField;
    QReg200NUM_DOC_FIN: TFloatField;
    QReg200VL_DOC: TFloatField;
    QReg200VL_DESC: TFloatField;
    QReg201: TOracleDataSet1;
    QReg201CST_PIS: TStringField;
    QReg201ALIQ_PIS: TFloatField;
    QReg201VL_PIS: TFloatField;
    QReg201COD_CTA: TStringField;
    QReg201VL_BC_PIS: TFloatField;
    QReg201TIPO: TStringField;
    QReg205: TOracleDataSet1;
    QReg205CST_COFINS: TStringField;
    QReg205ALIQ_COFINS: TFloatField;
    QReg205VL_COFINS: TFloatField;
    QReg205COD_CTA: TStringField;
    QReg205VL_ITEM: TFloatField;
    QReg205VL_BC_COFINS: TFloatField;
    QReg205TIPO: TStringField;
    QReg500: TOracleDataSet1;
    QReg500IND_OPER: TStringField;
    QReg500IND_EMIT: TStringField;
    QReg500COD_PART: TIntegerField;
    QReg500COD_MOD: TStringField;
    QReg500COD_SIT: TStringField;
    QReg500SER: TIntegerField;
    QReg500NUM_DOC: TIntegerField;
    QReg500DT_DOC: TDateTimeField;
    QReg500DT_A_P: TDateTimeField;
    QReg500VL_DESC: TFloatField;
    QReg500VL_TERC: TFloatField;
    QReg500VL_DA: TFloatField;
    QReg500VL_DOC: TFloatField;
    QReg500VL_SERV: TFloatField;
    QReg500VL_SERV_NT: TFloatField;
    QReg500VAL_BC_ICMS: TFloatField;
    QReg500VL_ICMS: TFloatField;
    QReg500VAL_PIS: TFloatField;
    QReg500VL_COFINS: TFloatField;
    QReg501: TOracleDataSet1;
    QReg501CST_PIS: TStringField;
    QReg501NAT_BC_CRED: TStringField;
    QReg501ALIQ_PIS: TFloatField;
    QReg501COD_CTA: TStringField;
    QReg501VL_PIS: TFloatField;
    QReg501VL_ITEM: TFloatField;
    QReg501VL_BC_PIS: TFloatField;
    QReg505: TOracleDataSet1;
    QReg505CST_COFINS: TStringField;
    QReg505NAT_BC_CRED: TStringField;
    QReg505ALIQ_COFINS: TFloatField;
    QReg505COD_CTA: TStringField;
    QReg505VL_COFINS: TFloatField;
    QReg505VL_ITEM: TFloatField;
    QReg505VL_BC_COFINS: TFloatField;
    QReg201VL_ITEM: TFloatField;
    QReg500COD_INF: TIntegerField;
    QReg500COD_NOTA_CAB: TIntegerField;
    QReg101NAT_BC_CRED: TFloatField;
    QReg105NAT_BC_CRED: TFloatField;
    QReg100DESC_CHAVE_ACESSO_CTE: TStringField;
    QReg501IND_OPER: TStringField;
    QReg101COD_BC_CREDITO_PISCOFINS: TStringField;
    QReg105COD_BC_CREDITO_PISCOFINS: TStringField;
    QReg505COD_BC_CREDITO_PISCOFINS: TStringField;
    QReg201VL_ICMS: TFloatField;
    QReg205VL_ICMS: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPisCofinsD: TDMPisCofinsD;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
