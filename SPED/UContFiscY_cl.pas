unit UContFiscY_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContFiscY = class(TDataModule)
    QReg600: TOracleDataSet1;
    QReg600COD_CADASTRO: TIntegerField;
    QReg600IND_QUALIF: TStringField;
    QReg600DT_ALT_SOC: TDateTimeField;
    QReg600PAIS: TStringField;
    QReg600CPF_CNPJ: TStringField;
    QReg600NOME_EMP: TStringField;
    QReg600PERC_CAP_TOT: TFloatField;
    QReg600PERC_CAP_VOT: TFloatField;
    QReg600DT_FIM_SOC: TStringField;
    QReg600QUALIF: TStringField;
    QReg600CPF_REP_LEG: TStringField;
    QReg600QUALIF_REP_LEG: TStringField;
    QReg600VL_REM_TRAB: TStringField;
    QReg600VL_LUC_DIV: TStringField;
    QReg600VL_JUR_CAP: TStringField;
    QReg600VL_DEM_REND: TStringField;
    QReg600VL_IR_RET: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFiscY: TDMContFiscY;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
