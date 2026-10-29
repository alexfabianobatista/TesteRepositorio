unit UPisCofinsA_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMPisCofinsA = class(TDataModule)
    QReg010: TOracleDataSet1;
    QReg010CNPJ: TStringField;
    QReg100: TOracleDataSet1;
    QReg100IND_OPER: TStringField;
    QReg100IND_EMIT: TStringField;
    QReg100COD_PART: TIntegerField;
    QReg100COD_SIT: TStringField;
    QReg100SER: TIntegerField;
    QReg100NUM_DOC: TIntegerField;
    QReg100DT_DOC: TDateTimeField;
    QReg100IND_PAGTO: TStringField;
    QReg100VL_DESC: TFloatField;
    QReg100VL_ISS: TFloatField;
    QReg100VL_DOC: TFloatField;
    QReg110: TOracleDataSet1;
    QReg110COD_MENSAGEM: TFloatField;
    QReg110DESC_MENSAGEM: TStringField;
    QReg111: TOracleDataSet1;
    QReg120: TOracleDataSet1;
    QReg120VL_BC_PIS: TFloatField;
    QReg120VL_PIS_IMP: TFloatField;
    QReg120DT_PAG_PIS: TDateTimeField;
    QReg120VL_BC_COFINS: TFloatField;
    QReg120VL_COFINS_IMP: TFloatField;
    QReg120DT_PAG_COFINS: TDateTimeField;
    QReg120LOC_EXE_SERV: TFloatField;
    QReg120VL_TOT_SERV: TFloatField;
    QReg170: TOracleDataSet1;
    QReg170NUM_ITEM: TIntegerField;
    QReg170COD_ITEM: TFloatField;
    QReg170DESCR_COMPL: TStringField;
    QReg170VL_ITEM: TFloatField;
    QReg170VL_DESC: TFloatField;
    QReg170CST_PIS: TStringField;
    QReg100COD_NOTA_CAB: TIntegerField;
    QReg010COD_FILIAL: TIntegerField;
    QReg170COD_NATUREZA_RECEITA: TIntegerField;
    QReg170PERC_PIS: TFloatField;
    QReg170PERC_COFINS: TFloatField;
    QReg170NUM_NATUREZA_INT_NOVO: TIntegerField;
    QReg170COD_BC_CREDITO_PISCOFINS: TStringField;
    QReg170CST_COFINS: TStringField;
    QReg100VL_PIS: TFloatField;
    QReg100VL_COFINS: TFloatField;
    QReg100VL_BC_PIS: TFloatField;
    QReg100VL_BC_COFINS: TFloatField;
    QReg170ALIQ_PIS: TFloatField;
    QReg170ALIQ_COFINS: TFloatField;
    QReg170VL_PIS: TFloatField;
    QReg170VL_COFINS: TFloatField;
    QReg170VL_BC_PIS: TFloatField;
    QReg170VL_BC_COFINS: TFloatField;
    QReg100COD_OPERACAO: TIntegerField;
    QReg100NUM_CGC_CPF: TStringField;
    QReg100COD_ESTADO: TStringField;
    QReg100COD_SERIE_MODELO: TStringField;
    QReg100IND_PIS_COFINS_RETIDO: TStringField;
    QReg170COD_CTA: TStringField;
    QReg170IND_ENTRADA_SAIDA: TStringField;
    QReg100RETENCAO_GRASEL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPisCofinsA: TDMPisCofinsA;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
