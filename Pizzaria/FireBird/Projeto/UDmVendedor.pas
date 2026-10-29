unit UDmVendedor;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmVendedor = class(TDataModule)
    QSelVendedor: TIBQuery;
    DsSelVendedor: TDataSource;
    QSelVendedorCODVENDEDOR: TIntegerField;
    QSelVendedorNOME: TIBStringField;
    QSelVendedorCOMISSAO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVendedor: TDmVendedor;

implementation

{$R *.dfm}

end.
