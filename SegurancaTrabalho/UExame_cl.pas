unit UExame_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMExame = class(TDataModule)
    QExame: TOracleDataSet1;
    QTipoExame: TOracleDataSet1;
    QExameCOD_EXAME: TIntegerField;
    QExameDESC_EXAME: TStringField;
    QTipoExameCOD_TIPO_EXAME: TIntegerField;
    QTipoExameDESC_TIPO_EXAME: TStringField;
    QExameCons: TOracleDataSet1;
    QExameConsCOD_EXAME: TIntegerField;
    QExameConsDESC_EXAME: TStringField;
    QRExame: TOracleDataSet1;
    QRTipoExame: TOracleDataSet1;
    QRTipoExameCOD_TIPO_EXAME: TIntegerField;
    QRTipoExameDESC_TIPO_EXAME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMExame: TDMExame;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
