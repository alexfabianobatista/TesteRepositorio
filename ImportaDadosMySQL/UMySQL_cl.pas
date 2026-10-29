unit UMySQL_cl;

interface

uses
  SysUtils, Classes, ZConnection, ZAbstractConnection;

type
  TDMMySQL = class(TDataModule)
    ZConnection1: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMySQL: TDMMySQL;

implementation

{$R *.dfm}

end.
