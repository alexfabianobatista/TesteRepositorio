unit UEstadoCivil_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMEstadoCivil = class(TDataModule)
    DSEstadoCivil: TDataSource;
    DSEstadoCivilCons: TDataSource;
    QEstadoCivil: TOracleDataSet1;
    QEstadoCivilCOD_ESTADO_CIVIL: TIntegerField;
    QEstadoCivilDESC_ESTADO_CIVIL: TStringField;
    QEstadoCivilCons: TOracleDataSet1;
    QEstadoCivilConsCOD_ESTADO_CIVIL: TIntegerField;
    QEstadoCivilConsDESC_ESTADO_CIVIL: TStringField;
    QREstadoCivil: TOracleDataSet1;
    QREstadoCivilCOD_ESTADO_CIVIL: TIntegerField;
    QREstadoCivilDESC_ESTADO_CIVIL: TStringField;
    procedure QEstadoCivilAfterInsert(DataSet: TDataSet);
    procedure QEstadoCivilAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEstadoCivil: TDMEstadoCivil;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMEstadoCivil.QEstadoCivilAfterInsert(DataSet: TDataSet);
begin
  QEstadoCivilCod_Estado_Civil.Value := DMOracle.Sequencia('ESTADO_CIVIL');
end;

procedure TDMEstadoCivil.QEstadoCivilAfterPost(DataSet: TDataSet);
begin
  QEstadoCivil.SetVariable('PK',QEstadoCivilCod_Estado_Civil.Value);
end;

end.
