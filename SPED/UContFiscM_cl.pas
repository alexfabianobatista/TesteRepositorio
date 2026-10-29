unit UContFiscM_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContFiscM = class(TDataModule)
    QReg030: TOracleDataSet1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFiscM: TDMContFiscM;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
