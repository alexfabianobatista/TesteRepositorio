unit UTipoExame_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMTipoExame = class(TDataModule)
    QTipoExame: TOracleDataSet1;
    QTipoExameCOD_TIPO_EXAME: TIntegerField;
    QTipoExameDESC_TIPO_EXAME: TStringField;
    QTipoExameCons: TOracleDataSet1;
    QTipoExameConsCOD_TIPO_EXAME: TIntegerField;
    QTipoExameConsDESC_TIPO_EXAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipoExame: TDMTipoExame;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
