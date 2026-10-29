unit UFirebird_cl;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection;

type
  TDMFirebird = class(TDataModule)
    ZConnection1: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFirebird: TDMFirebird;

implementation

{$R *.dfm}

end.
