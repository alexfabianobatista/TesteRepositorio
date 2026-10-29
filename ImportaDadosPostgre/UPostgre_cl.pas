unit UPostgre_cl;

interface

uses
  SysUtils, Classes, ZConnection, ZAbstractConnection;

type
  TDMPostgre = class(TDataModule)
    ZConnection1: TZConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPostgre: TDMPostgre;

implementation

{$R *.dfm}

end.
