unit UClassePlantio_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMClassePlantio = class(TDataModule)
    QClassePlantio: TOracleDataSet1;
    QClassePlantioCOD_CLASSE_PLANTIO: TIntegerField;
    QClassePlantioDESC_CLASSE_PLANTIO: TStringField;
    QClassePlantioCons: TOracleDataSet1;
    QClassePlantioConsCOD_CLASSE_PLANTIO: TIntegerField;
    QClassePlantioConsDESC_CLASSE_PLANTIO: TStringField;
    QRClassePlantio: TOracleDataSet1;
    QRClassePlantioCOD_CLASSE_PLANTIO: TIntegerField;
    QRClassePlantioDESC_CLASSE_PLANTIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClassePlantio: TDMClassePlantio;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
