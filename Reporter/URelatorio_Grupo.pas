unit URelatorio_Grupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, Buttons;

type
  TFRelatorio_Grupo = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    SBMarca: TSpeedButton;
    SBDesmarca: TSpeedButton;
    DBGrid1: TDBGrid;
    procedure SBMarcaClick(Sender: TObject);
    procedure SBDesmarcaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio_Grupo: TFRelatorio_Grupo;

implementation

uses URelatorio_cl;

{$R *.DFM}

procedure TFRelatorio_Grupo.SBMarcaClick(Sender: TObject);
Var wCampo : String;
begin
  With DMRelatorio do
  Begin
    QSelect.DisableControls;
    wCampo := QSelectNome_Campo.Value;
    While not QSelect.Bof do
    Begin
      QSelect.Edit;
      QSelectInd_Grupo.Value := 1;
      QSelect.Post;
      QSelect.Prior;
    End;
    QSelect.Locate('NOME_CAMPO',wCampo,[]);
    QSelect.EnableControls;
  End;
end;

procedure TFRelatorio_Grupo.SBDesmarcaClick(Sender: TObject);
Var wCampo : String;
begin
  With DMRelatorio do
  Begin
    wCampo := QSelectNome_Campo.Value;
    QSelect.DisableControls;
    QSelect.First;
    While not QSelect.Eof do
    Begin
      QSelect.Edit;
      QSelectInd_Grupo.Value := 0;
      QSelect.Post;
      QSelect.Next;
    End;
    QSelect.Locate('NOME_CAMPO',wCampo,[]);
    QSelect.EnableControls;
  End;
end;

end.
