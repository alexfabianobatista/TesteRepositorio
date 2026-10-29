unit UTipoContrato_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMTipoContrato = class(TDataModule)
    QTipoContrato: TOracleDataSet1;
    QTipoContratoCOD_TIPO_CONTRATO: TIntegerField;
    QTipoContratoDESC_TIPO_CONTRATO: TStringField;
    QTipoContratoVAL_MENSAL: TFloatField;
    QTipoContratoCons: TOracleDataSet1;
    QTipoContratoConsCOD_TIPO_CONTRATO: TIntegerField;
    QTipoContratoConsDESC_TIPO_CONTRATO: TStringField;
    QTipoContratoConsVAL_MENSAL: TFloatField;
    QRTipoContrato: TOracleDataSet1;
    QRTipoContratoCOD_TIPO_CONTRATO: TIntegerField;
    QRTipoContratoDESC_TIPO_CONTRATO: TStringField;
    QRTipoContratoVAL_MENSAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoContrato: TDMTipoContrato;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
