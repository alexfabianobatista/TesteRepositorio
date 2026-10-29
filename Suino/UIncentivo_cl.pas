unit UIncentivo_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMIncentivo = class(TDataModule)
    QIncentivo_Cad: TOracleDataSet1;
    QIncentivo_CadCOD_INCENTIVO: TIntegerField;
    QIncentivo_CadCOD_CADASTRO: TIntegerField;
    QIncentivo_CadDT_INICIO_INCENTIVO: TDateTimeField;
    QIncentivo_CadDT_FINAL_INCENTIVO: TDateTimeField;
    QIncentivo_CadVAL_INCENTIVO: TFloatField;
    QIncentivo_Cons: TOracleDataSet1;
    QIncentivo_ConsCOD_CADASTRO: TIntegerField;
    QIncentivo_ConsDT_INICIO_INCENTIVO: TDateTimeField;
    QIncentivo_ConsDT_FINAL_INCENTIVO: TDateTimeField;
    QIncentivo_ConsVAL_INCENTIVO: TFloatField;
    QIncentivo_ConsNOME: TStringField;
    QIncentivo_ConsCOD_INCENTIVO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMIncentivo: TDMIncentivo;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
