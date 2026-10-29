unit UDmVenda;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmVenda = class(TDataModule)
    QInsVenda: TIBQuery;
    QUltVenda: TIBQuery;
    QUltVendaULTIMA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVenda: TDmVenda;

implementation

uses UDmSistema;

{$R *.dfm}

end.
