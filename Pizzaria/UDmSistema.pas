unit UDmSistema;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBUpdateSQL, IBQuery, Forms,
  IniFiles, Dialogs, Controls;

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
  OperadorLogado: Integer;

implementation

uses ULogin, UFuncoes, UDmOperador;

{$R *.dfm}

procedure TDmSistema.ForcaConexao;
var arq: TIniFile;
    caminho: String;
Begin
  arq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'banco.ini');
  caminho := arq.ReadString('config', 'caminhobanco', '');
  arq.Free;

  DbSistema.Connected := False;

  repeat
    try
      DbSistema.Connected := True;
    except
      if (MessageDlg('Banco de dados não encontrado.'+#13+#10+'Deseja informar manualmente?.', mtError, [mbYes, mbNo], 0) = mrNo) then
        Application.Terminate;
      caminho := InputBox('Caminho do Banco de Dados', 'Informe o caminho do banco de dados', caminho);

      arq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'banco.ini');
      arq.WriteString('config', 'caminhobanco', caminho);
      arq.Free;

      DmSistema.DbSistema.DatabaseName := caminho;
    end;
  until DbSistema.Connected;
End;

procedure TDmSistema.DataModuleCreate(Sender: TObject);
var arq: TIniFile;
    caminho: string;
begin
  arq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'banco.ini');
  caminho := arq.ReadString('config', 'caminhobanco', '');
  arq.Free;

  DmSistema.DbSistema.Connected := False;
  DmSistema.DbSistema.DatabaseName := caminho;

  ForcaConexao;

  OperadorLogado := 0;
  Application.CreateForm(TDmOperador, DmOperador);
  Application.CreateForm(TFLogin, FLogin);
  FLogin.ShowModal;
  FLogin.Free;
end;

end.
