unit UScpc_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMScpc = class(TDataModule)
    QConsultaSCPC: TOracleDataSet1;
    QConsultaSCPCCOD_CONSULTA_SCPC: TIntegerField;
    QConsultaSCPCCOD_CADASTRO: TIntegerField;
    QConsultaSCPCCOD_USUARIO: TIntegerField;
    QConsultaSCPCDT_CONSULTA: TDateTimeField;
    QConsultaSCPCDESC_RESULTADO: TMemoField;
    QConsultaSCPCCons: TOracleDataSet1;
    QConsultaSCPCConsCOD_CONSULTA_SCPC: TIntegerField;
    QConsultaSCPCConsCOD_CADASTRO: TIntegerField;
    QConsultaSCPCConsCOD_USUARIO: TIntegerField;
    QConsultaSCPCConsDT_CONSULTA: TDateTimeField;
    QConsultaSCPCConsDESC_RESULTADO: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMScpc: TDMScpc;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
