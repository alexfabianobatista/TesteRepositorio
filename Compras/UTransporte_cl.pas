unit UTransporte_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMTransporte = class(TDataModule)
    DSTransporte: TDataSource;
    DSTransporteCons: TDataSource;
    DSTransporteAll: TDataSource;
    QTransporte: TOracleDataSet1;
    QTransporteCOD_TRANSPORTE: TIntegerField;
    QTransporteDESC_TRANSPORTE: TStringField;
    QTransporteCons: TOracleDataSet1;
    QTransporteConsCOD_TRANSPORTE: TIntegerField;
    QTransporteConsDESC_TRANSPORTE: TStringField;
    QTransporteAll: TOracleDataSet1;
    QTransporteAllCOD_TRANSPORTE: TIntegerField;
    QTransporteAllDESC_TRANSPORTE: TStringField;
    procedure QTransporteAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTransporte: TDMTransporte;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMTransporte.QTransporteAfterInsert(DataSet: TDataSet);
begin
  QTransporteCod_Transporte.Value := DMOracle.Sequencia('TRANSPORTE');
end;

end.
