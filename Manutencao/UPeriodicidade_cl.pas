unit UPeriodicidade_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPeriodicidade = class(TDataModule)
    QPeriodicidade: TOracleDataSet1;
    QPeriodicidadeCons: TOracleDataSet1;
    QPeriodicidadeCOD_PERIODICIDADE: TIntegerField;
    QPeriodicidadeDESC_PERIODICIDADE: TStringField;
    QPeriodicidadeNUM_DIAS: TIntegerField;
    QPeriodicidadeConsCOD_PERIODICIDADE: TIntegerField;
    QPeriodicidadeConsDESC_PERIODICIDADE: TStringField;
    QPeriodicidadeConsNUM_DIAS: TIntegerField;
    QRPeriodicidade: TOracleDataSet1;
    QRPeriodicidadeCOD_PERIODICIDADE: TIntegerField;
    QRPeriodicidadeDESC_PERIODICIDADE: TStringField;
    QRPeriodicidadeNUM_DIAS: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPeriodicidade: TDMPeriodicidade;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
