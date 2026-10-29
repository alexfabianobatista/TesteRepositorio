unit USqlServer_cl;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMSqlServer = class(TDataModule)
    ConexaoSqlServer: TADOConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMSqlServer: TDMSqlServer;

implementation

{$R *.dfm}

procedure TDMSqlServer.DataModuleCreate(Sender: TObject);
begin
  try
    DMSqlServer.ConexaoSqlServer.Connected := false;
    DMSqlServer.ConexaoSqlServer.ConnectionString := 'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=SIGIND;Data Source=JUNIOR-PC;Initial File Name="";Server SPN="";Authentication="";Access Token=""';
    DMSqlServer.ConexaoSqlServer.Connected := true;
    finally;
  end;
end;

end.
