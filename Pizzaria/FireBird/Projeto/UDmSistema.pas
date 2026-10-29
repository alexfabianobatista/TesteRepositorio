unit UDmSistema;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBUpdateSQL, IBQuery, Forms, IniFiles;

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

uses ULogin, USelecionaBanco, Dialogs, UFuncoes;

{$R *.dfm}

procedure TDmSistema.ForcaConexao;
var OD: TOpenDialog;
    arq: TIniFile;
Begin
  DbSistema.Connected := False;

  repeat
    try
      DbSistema.Connected := True;
    except
      MessageDlg('Banco de dados não encontrado.'+#13+#10+'Especifique outro.', mtError, [mbOK], 0);
      OD := TOpenDialog.Create(Self);
      OD.Filter := 'Bancos de Dados|*.GDB;*.FDB';
      OD.Execute;

      arq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'banco.ini');
      arq.WriteString('config', 'caminhobanco', OD.FileName);
      arq.Free;

      DmSistema.DbSistema.DatabaseName := OD.FileName;
      OD.Free;
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

  DbSistema.Connected := False;

  DmSistema.DbSistema.DatabaseName := caminho;

  ForcaConexao;
end;

end.
