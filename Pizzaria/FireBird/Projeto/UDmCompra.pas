unit UDmCompra;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmCompra = class(TDataModule)
    QInsCompra: TIBQuery;
    QUltCompra: TIBQuery;
    QUltCompraULTIMA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCompra: TDmCompra;

implementation

{$R *.dfm}

end.
