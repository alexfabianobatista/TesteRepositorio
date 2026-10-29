unit UNotaSkyhub_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDataModule1 = class(TDataModule)
    OracleDataSet11: TOracleDataSet1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

uses UORacle_cl;

{$R *.dfm}

end.
