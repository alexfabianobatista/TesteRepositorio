unit UDmMarca;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmMarca = class(TDataModule)
    QSelMarca: TIBQuery;
    DsSelMarca: TDataSource;
    QSelMarcaCODMARCA: TIntegerField;
    QSelMarcaDSCMARCA: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmMarca: TDmMarca;

implementation

{$R *.dfm}

end.
