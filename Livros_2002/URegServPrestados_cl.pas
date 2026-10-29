unit URegServPrestados_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRegServPrestados = class(TDataModule)
    QRegServPrestados: TOracleDataSet1;
    QRegServPrestadosDT_RECEBIMENTO: TDateTimeField;
    QRegServPrestadosNUM_NOTA: TIntegerField;
    QRegServPrestadosCOD_SERIE: TStringField;
    QRegServPrestadosPERC_INSS: TFloatField;
    QRegServPrestadosDESC_RESUMO: TStringField;
    QRegServPrestadosOBSERVACAO: TStringField;
    QRegServPrestadosVAL_BASE_CALCULO: TFloatField;
    QRegServPrestadosVAL_ISS: TFloatField;
    QRegServPrestadosPERC_ISS: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegServPrestados: TDMRegServPrestados;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
