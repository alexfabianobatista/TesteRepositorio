unit URamo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMRamo = class(TDataModule)
    QRamo: TOracleDataSet1;
    QRamoCOD_RAMO: TIntegerField;
    QRamoDESC_RAMO: TStringField;
    QRamoCons: TOracleDataSet1;
    QRamoConsCOD_RAMO: TIntegerField;
    QRamoConsDESC_RAMO: TStringField;
    QRRamo: TOracleDataSet1;
    QRRamoCOD_RAMO: TIntegerField;
    QRRamoDESC_RAMO: TStringField;
    QRRamoIND_SINC_MAX_ROTEIRIZADOR: TStringField;
    procedure QRamoAfterInsert(DataSet: TDataSet);
    procedure QRamoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRamo: TDMRamo;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMRamo.QRamoAfterInsert(DataSet: TDataSet);
begin
  QRamoCod_Ramo.Value := DMOracle.Sequencia('RAMO');
end;

procedure TDMRamo.QRamoAfterPost(DataSet: TDataSet);
begin
  QRamo.SetVariable('PK',QRamoCod_Ramo.Value);
end;

end.
