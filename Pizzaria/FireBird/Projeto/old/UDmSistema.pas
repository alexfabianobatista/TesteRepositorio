unit UDmSistema;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBUpdateSQL, IBQuery, Forms;

type
  TDmSistema = class(TDataModule)
    DbSistema: TIBDatabase;
    TSistema: TIBTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ForcaConexao;
  end;

var
  DmSistema: TDmSistema;

implementation

uses ULogin, USelecionaBanco;

{$R *.dfm}

procedure TDmSistema.ForcaConexao;
Begin
  DbSistema.Connected := False;

  repeat
    try
      DbSistema.Connected := True;
    except
      if FSelecionaBanco <> nil then
        FSelecionaBanco.Close;
      Application.CreateForm(TFSelecionaBanco, FSelecionaBanco);
      FSelecionaBanco.ShowModal;
    end;
  until DbSistema.Connected;
End;

procedure TDmSistema.DataModuleCreate(Sender: TObject);
begin
  ForcaConexao;

  Application.CreateForm(TFLogin, FLogin);
  FLogin.ShowModal;
end;

end.
