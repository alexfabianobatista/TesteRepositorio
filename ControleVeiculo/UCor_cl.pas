unit UCor_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCor = class(TDataModule)
    QCorCad: TOracleDataSet1;
    QCorCons: TOracleDataSet1;
    QRCor: TOracleDataSet1;
    QCorCadCOD_COR: TIntegerField;
    QCorCadDESC_COR: TStringField;
    QCorConsCOD_COR: TIntegerField;
    QCorConsDESC_COR: TStringField;
    QRCorCOD_COR: TIntegerField;
    QRCorDESC_COR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCor: TDMCor;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
