unit URelatorioFiltro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask;

type
  TFRelatorioFiltro = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    DBCheckBox1: TDBCheckBox;
    DBEdit2: TDBEdit;
    MENomeFiltro: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MENomeFiltroExit(Sender: TObject);
    procedure DBCheckBox1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Procedure SetaMascara;
  public
    { Public declarations }
  end;

var
  FRelatorioFiltro: TFRelatorioFiltro;

implementation

uses URelatorio_cl;

{$R *.DFM}

procedure TFRelatorioFiltro.FormActivate(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    QWhere.Insert;
    MENomeFiltro.Text := QWhereNome_Filtro.Value;
  End;

end;

procedure TFRelatorioFiltro.BitBtn2Click(Sender: TObject);
begin
  With DMRelatorio do
    QWhere.Cancel;
end;

procedure TFRelatorioFiltro.BitBtn1Click(Sender: TObject);
begin
  Try
    DMRelatorio.QWhere.Post;
  Except
    ModalResult := mrNone;
    Raise;
  End;
end;

procedure TFRelatorioFiltro.MENomeFiltroExit(Sender: TObject);
begin
  DMRelatorio.QWhereNome_Filtro.Value := MENomeFiltro.Text;
end;

procedure TFRelatorioFiltro.DBCheckBox1Exit(Sender: TObject);
begin
  SetaMascara;
end;

Procedure TFRelatorioFiltro.SetaMascara;
Begin
  With DMRelatorio do
  Begin
    If QWhereIND_Variavel.Value = 'SIM' Then
      MENomeFiltro.EditMask := ''
    Else
    Begin
      If (QWhereInd_Tipo_Variavel.Value = 'CHAR')
        or (QWhereInd_Tipo_Variavel.Value = 'VARCHAR2') Then
        MENomeFiltro.EditMask := '';
      If QWhereInd_Tipo_Variavel.Value = 'NUMBER' Then
        MENomeFiltro.EditMask := '';    //  '######.####;0;';
      If QWhereInd_Tipo_Variavel.Value = 'DATE' Then
        MENomeFiltro.EditMask := '!99/99/0000;1;_'
    end;
  End;
End;

procedure TFRelatorioFiltro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FRelatorioFiltro := Nil;
end;

end.
