unit UClasseSqlServer_cl;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMClasseSqlServer = class(TDataModule)
    SSQClasse: TADOQuery;
    SSQClasseCOD_CLASSE: TSmallintField;
    SSQClasseDESC_CLASSE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMClasseSqlServer: TDMClasseSqlServer;

implementation

{$R *.dfm}

end.
