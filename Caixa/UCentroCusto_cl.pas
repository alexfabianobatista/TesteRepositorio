unit UCentroCusto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCentroCusto = class(TDataModule)
    QCentroCusto: TOracleDataSet1;
    QCentroCustoCOD_CENTRO_CUSTO: TIntegerField;
    QCentroCustoDESC_CENTRO_CUSTO: TStringField;
    QCentroCustoCons: TOracleDataSet1;
    QCentroCustoConsCOD_CENTRO_CUSTO: TIntegerField;
    QCentroCustoConsDESC_CENTRO_CUSTO: TStringField;
    QRCentroCustoHistorico: TOracleDataSet1;
    QRCentroCustoHistoricoCOD_CENTRO_CUSTO: TIntegerField;
    QRCentroCustoHistoricoDESC_CENTRO_CUSTO: TStringField;
    QRCentroCustoHistoricoCOD_HISTORICO: TIntegerField;
    QRCentroCustoHistoricoDESC_HISTORICO: TStringField;
    QRCentroCustoHistoricoVAL_MOVIMENTO: TFloatField;
    QRCentroCustoHistoricoCOD_FILIAL: TIntegerField;
    QRCentroCustoHistoricoDESC_FILIAL: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCentroCusto: TDMCentroCusto;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
