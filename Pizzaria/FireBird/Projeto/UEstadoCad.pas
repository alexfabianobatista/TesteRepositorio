unit UEstadoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFEstadoCad = class(TFPadrao)
    TBCODESTADO: TIntegerField;
    TBDSCESTADO: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEFoco: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstadoCad: TFEstadoCad;

implementation

uses UDmEstado;

{$R *.dfm}

procedure TFEstadoCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODESTADO';
end;

procedure TFEstadoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DmEstado.QSelEstado.Active then
  Begin
    DmEstado.QSelEstado.Close;
    DmEstado.QSelEstado.Open;
  End;
end;

procedure TFEstadoCad.TGravarClick(Sender: TObject);
begin
  if TBDSCESTADO.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  inherited;

end;

end.
