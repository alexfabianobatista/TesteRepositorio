unit USelecionaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IniFiles, Buttons;

type
  TFSelecionaBanco = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSelecionaBanco: TFSelecionaBanco;

implementation

uses UDmSistema;

{$R *.dfm}

procedure TFSelecionaBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
var arq: TIniFile;
begin
  arq := TIniFile.Create('c:\banco.ini');
  arq.WriteString('config', 'caminhobanco', Edit2.Text);
  arq.Free;
  DmSistema.DbSistema.DatabaseName := Edit2.Text;

  DmSistema.ForcaConexao;

  Action := caFree;
end;

procedure TFSelecionaBanco.FormShow(Sender: TObject);
var arq: TIniFile;
begin
  arq := TIniFile.Create('c:\banco.ini');
  Edit2.Text := arq.ReadString('config', 'caminhobanco', '');
  arq.Free;
end;

procedure TFSelecionaBanco.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    OpenDialog1.Execute;
    Edit2.Text := OpenDialog1.FileName;
  end;
end;

procedure TFSelecionaBanco.BitBtn3Click(Sender: TObject);
begin
  Close;
end;

end.
