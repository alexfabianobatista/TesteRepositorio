unit URelatorioVar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls;

type
  TFRelatorioVar = class(TForm)
    BtProximo: TBitBtn;
    BtCancela: TBitBtn;
    Mvar: TMemo;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    EdValor: TEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure BtProximoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtCancelaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure AddCondicao;
    Procedure preparaEdValor;
  public
    { Public declarations }
  end;

var
  FRelatorioVar: TFRelatorioVar;

implementation

uses URelatorio_cl;

{$R *.DFM}

procedure TFRelatorioVar.BtProximoClick(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    AddCondicao;
    EdValor.SetFocus;
    QWhere.Next;
    PreparaEdvalor;
    If QWhere.Eof then
      ModalResult := mrOk;
  End;
end;

procedure TFRelatorioVar.FormActivate(Sender: TObject);
begin
  MVar.Lines.Clear;
  PreparaEdValor;

  With DMRelatorio do
  Begin
   // QWhere.Open;
  End;
end;

procedure TFRelatorioVar.BtCancelaClick(Sender: TObject);
begin
  DMRelatorio.QWhere.Last;
end;

procedure TFRelatorioVar.AddCondicao;
Var wCondicao : String;
begin
  With DMRelatorio do
  Begin
    wCondicao := QWhereNome_Tabela.Value + '.' + QWhereNome_Campo.Value;
    If QWhereDesc_Condicao.Value = 'IGUAL A' then
      wCondicao := wCondicao + ' = ';
    If QWhereDesc_Condicao.Value = 'MAIOR QUE' then
      wCondicao := wCondicao + ' > ';
    If QWhereDesc_Condicao.Value = 'MAIOR OU IGUAL' then
      wCondicao := wCondicao + ' >= ';
    If QWhereDesc_Condicao.Value = 'MENOR QUE' then
      wCondicao := wCondicao + ' < ';
    If QWhereDesc_Condicao.Value = 'MENOR OU IGUAL' then
      wCondicao := wCondicao + ' <= ';
    If QWhereDesc_Condicao.Value = 'DIFERENTE DE' then
      wCondicao := wCondicao + ' <> ';

    If QWhereInd_Tipo_Variavel.Value = 'DATE' then
      wCondicao := wCondicao + 'TO_DATE(' + CHR(39)+EdValor.Text + Chr(39) + ')'
    Else
      If (QWhereInd_Tipo_Variavel.Value = 'VARCHAR2')
        or (QWhereInd_Tipo_Variavel.Value = 'CHAR') then
        wCondicao := wCondicao + chr(39) + EdValor.Text+chr(39)
      Else
        wCondicao := wCondicao + EdValor.Text;
    MVar.Lines.Add(wCondicao);
  end;
end;

Procedure TFRelatorioVar.PreparaEdValor;
Begin
  With DMRelatorio do
  Begin
    If QWhereInd_Variavel.Value = 'NAO' Then
    Begin
      EdValor.Text := DMRelatorio.QWhereNome_Filtro.Value;
      EdValor.ParentColor := True;
      EdValor.ReadOnly := True;
    End
    Else
    Begin
      EdValor.Text := '';
      EdValor.ParentColor := False;
      EdValor.Color := clWindow;
      EdValor.ReadOnly := False;
    End;
  End;
  EdValor.SetFocus;
End;

procedure TFRelatorioVar.FormCreate(Sender: TObject);
begin
  MVar.Lines.Clear;
end;

end.

