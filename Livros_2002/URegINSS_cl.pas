unit URegINSS_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRegINSS = class(TDataModule)
    QRegINSS: TOracleDataSet1;
    QRegINSSNUM_NOTA: TIntegerField;
    QRegINSSCOD_SERIE: TStringField;
    QRegINSSIND_SITUACAO: TStringField;
    QRegINSSDT_RECEBIMENTO: TDateTimeField;
    QRegINSSNUM_CGC: TStringField;
    QRegINSSDESC_INSCRICAO: TStringField;
    QRegINSSBASE_CALCULO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRegINSS: TDMRegINSS;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
