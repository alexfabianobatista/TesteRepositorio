unit UDCO_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMDCO = class(TDataModule)
    QDCO: TOracleDataSet1;
    QDCOCOD_DCO: TIntegerField;
    QDCOCOD_NOTA_CAB: TIntegerField;
    QDCONUM_DCO: TStringField;
    QDCOCons: TOracleDataSet1;
    QDCOConsCOD_DCO: TIntegerField;
    QDCOConsCOD_NOTA_CAB: TIntegerField;
    QDCOConsNUM_DCO: TStringField;
    QDCOConsNUM_NOTA: TIntegerField;
    OracleDataSet11: TOracleDataSet1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDCO: TDMDCO;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
