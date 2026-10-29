unit UDmEstado;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmEstado = class(TDataModule)
    QSelEstado: TIBQuery;
    DsSelEstado: TDataSource;
    QSelEstadoCODESTADO: TIntegerField;
    QSelEstadoDSCESTADO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmEstado: TDmEstado;

implementation

{$R *.dfm}

end.
