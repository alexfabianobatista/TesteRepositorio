unit USelecionaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, IniFiles, Buttons;

type
  TFSelecionaBanco = class(TForm)
    Panel1: TPanel;
    ListBox1: TListBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    SaveDialog1: TSaveDialog;
    BtnGravar: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure Carrega;
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
begin
  Action := caFree;
end;

procedure TFSelecionaBanco.FormShow(Sender: TObject);
begin
  Carrega;
end;

procedure TFSelecionaBanco.Edit2Exit(Sender: TObject);
begin
  if Edit2.Text = '' then
  begin
    SaveDialog1.Execute;
    Edit2.Text := SaveDialog1.FileName;
  end;
end;

procedure TFSelecionaBanco.ListBox1Click(Sender: TObject);
var arq: TIniFile;
begin
  arq := TIniFile.Create('c:\banco.ini');
  Edit1.Text := ListBox1.Items[ListBox1.ItemIndex];
  Edit2.Text := arq.ReadString(ListBox1.Items[ListBox1.ItemIndex], 'caminho', '');
  arq.Free;
end;

procedure TFSelecionaBanco.BtnGravarClick(Sender: TObject);
var arq: TIniFile;
    NomeSessao: String;
begin
  if ListBox1.ItemIndex = -1 then
    NomeSessao := Edit1.Text
  else
    NomeSessao := ListBox1.Items[ListBox1.ItemIndex];
  arq := TIniFile.Create('c:\banco.ini');
  arq.WriteString(NomeSessao, 'caminho', Edit2.Text);
  arq.Free;

  Carrega;
end;

procedure TFSelecionaBanco.BitBtn1Click(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  ListBox1.ItemIndex := -1;
end;

procedure TFSelecionaBanco.Carrega;
var arq: TIniFile;
begin
  arq := TIniFile.Create('c:\banco.ini');
  arq.ReadSections(ListBox1.Items);
  arq.Free;
  if ListBox1.Items.Count = 0 then
    ListBox1.ItemIndex := -1
  else
  Begin
    ListBox1.ItemIndex := 0;
    ListBox1Click(Self);
  End;
end;

procedure TFSelecionaBanco.BitBtn2Click(Sender: TObject);
var arq: TIniFile;
begin
  if ListBox1.ItemIndex > -1 then
  Begin
    arq := TIniFile.Create('c:\banco.ini');
    arq.EraseSection(ListBox1.Items[ListBox1.ItemIndex]);
    arq.Free;

    Carrega;
  End;
end;

procedure TFSelecionaBanco.BitBtn3Click(Sender: TObject);
var arq: TIniFile;
begin
  arq := TIniFile.Create('c:\banco.ini');
  DmSistema.DbSistema.DatabaseName := arq.ReadString(ListBox1.Items[ListBox1.ItemIndex], 'caminho', '');
  arq.Free;

  DmSistema.ForcaConexao;
//  Close;
end;

end.
