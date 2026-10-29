unit UPisCofinsF_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDmPisCofinsF = class(TDataModule)
    QReg010: TOracleDataSet1;
    QReg010CNPJ: TStringField;
    QReg120: TOracleDataSet1;
    QReg120NAT_BC_CRED: TStringField;
    QReg120IDENT_BEM_IMOB: TStringField;
    QReg120IND_ORIG_CRED: TStringField;
    QReg120IND_UTIL_BEM_IMOB: TIntegerField;
    QReg120CST_PIS: TStringField;
    QReg120CST_COFINS: TStringField;
    QReg120COD_CTA: TStringField;
    QReg120ALIQ_COFINS: TFloatField;
    QReg120ALIQ_PIS: TFloatField;
    QReg120VL_PIS: TFloatField;
    QReg120VL_COFINS: TFloatField;
    QReg120VL_BC_PIS: TFloatField;
    QReg120VL_BC_COFINS: TFloatField;
    QReg120VL_OPER_DEP: TFloatField;
    QReg130: TOracleDataSet1;
    QReg130NAT_BC_CRED: TStringField;
    QReg130IDENT_BEM_IMOB: TStringField;
    QReg130IND_ORIG_CRED: TStringField;
    QReg130IND_UTIL_BEM_IMOB: TIntegerField;
    QReg130MES_OPER_AQUIS: TStringField;
    QReg130IND_NR_PARC: TFloatField;
    QReg130CST_PIS: TStringField;
    QReg130CST_COFINS: TStringField;
    QReg130COD_CTA: TStringField;
    QReg130ALIQ_COFINS: TFloatField;
    QReg130ALIQ_PIS: TFloatField;
    QReg130VL_BC_CRED: TFloatField;
    QReg130VL_OPER_AQUIS: TFloatField;
    QReg130VL_BC_PIS: TFloatField;
    QReg130VL_BC_COFINS: TFloatField;
    QReg130VL_PIS: TFloatField;
    QReg130VL_COFINS: TFloatField;
    QReg010FILIAL: TIntegerField;
    QReg600: TOracleDataSet1;
    QReg600IND_NAT_RET: TFloatField;
    QReg600DT_RET: TDateTimeField;
    QReg600COD_REC: TStringField;
    QReg600IND_NAT_CRED: TFloatField;
    QReg600CNPJ: TStringField;
    QReg600IND_DEC: TFloatField;
    QReg600VL_RET: TFloatField;
    QReg600VL_RET_PIS: TFloatField;
    QReg600VL_RET_COFINS: TFloatField;
    QReg600VL_BC_RET: TFloatField;
    QReg120COD_BC_CREDITO_PISCOFINS: TStringField;
    QReg130COD_BC_CREDITO_PISCOFINS: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPisCofinsF: TDmPisCofinsF;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
