unit UDmCor;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmCor = class(TDataModule)
    QSelCor: TIBQuery;
    DsSelCor: TDataSource;
    QSelCorCODCOR: TIntegerField;
    QSelCorDSCCOR: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCor: TDmCor;

implementation

{$R *.dfm}

end.
