unit UMarcaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFMarcaCad = class(TFPadrao)
    TBCODMARCA: TIntegerField;
    TBDSCMARCA: TIBStringField;
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
  FMarcaCad: TFMarcaCad;

implementation

uses UDmMarca;

{$R *.dfm}

procedure TFMarcaCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODMARCA';
end;

procedure TFMarcaCad.TGravarClick(Sender: TObject);
begin
  if TBDSCMARCA.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  inherited;

end;

procedure TFMarcaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DmMarca.QSelMarca.Active then
  Begin
    DmMarca.QSelMarca.Close;
    DmMarca.QSelMarca.Open;
  End;
end;

end.
