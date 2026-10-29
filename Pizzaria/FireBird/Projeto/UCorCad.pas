unit UCorCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, DB, IBCustomDataSet, ImgList, IBUpdateSQL, IBDatabase,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFCorCad = class(TFPadrao)
    TBCODCOR: TIntegerField;
    TBDSCCOR: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEFoco: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCorCad: TFCorCad;

implementation

uses UDmCor;

{$R *.dfm}

procedure TFCorCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODCOR';
end;

procedure TFCorCad.TGravarClick(Sender: TObject);
begin
  if TBDSCCOR.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  inherited;

end;

procedure TFCorCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DmCor.QSelCor.Active then
  Begin
    DmCor.QSelCor.Close;
    DmCor.QSelCor.Open;
  End;
end;

end.
