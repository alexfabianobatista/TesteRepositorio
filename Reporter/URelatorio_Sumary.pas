unit URelatorio_Sumary;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids;

type
  TFRelatorio_sumary = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    SBRemovSumary: TSpeedButton;
    SBAddSumary: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure SBAddSumaryClick(Sender: TObject);
    procedure SBRemovSumaryClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorio_sumary: TFRelatorio_sumary;

implementation

uses URelatorio_cl;

{$R *.DFM}

procedure TFRelatorio_sumary.FormActivate(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    Qsumary.Close;
    QSumary.Open;
    QNotSumary.Close;
    QNotSumary.Open;
  End;
end;

procedure TFRelatorio_sumary.SBAddSumaryClick(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    QNotSumary.Edit;
    QNotSumaryInd_Sumary.Value := 'SIM';
    QNotSumary.Post;

    QNotSumary.Close;
    QNotSumary.Open;
    QSumary.Close;
    QSumary.Open;

  End;
end;

procedure TFRelatorio_sumary.SBRemovSumaryClick(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    QSumary.Edit;
    QSumaryInd_Sumary.Value := 'NAO';
    QSumary.Post;
    QNotSumary.Close;
    QNotSumary.Open;
    QSumary.Close;
    QSumary.Open;

  End;
end;

procedure TFRelatorio_sumary.BitBtn1Click(Sender: TObject);
begin
  With DMRelatorio do
  Begin
    QSelect.Close;
    QSelect.Open;
  End;
end;

end.
