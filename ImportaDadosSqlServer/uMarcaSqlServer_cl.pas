unit uMarcaSqlServer_cl;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMMarcaSqlServer = class(TDataModule)
    SSQMarca: TADOQuery;
    SSQMarcaMarca: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMarcaSqlServer: TDMMarcaSqlServer;

implementation

{$R *.dfm}

end.
