unit UEnderecoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFEnderecoCad = class(TFPadrao)
    TBCODENDERECO: TIntegerField;
    TBDSCENDERECO: TIBStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
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
  FEnderecoCad: TFEnderecoCad;

implementation

uses UDmEndereco;

{$R *.dfm}

procedure TFEnderecoCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODENDERECO';
end;

procedure TFEnderecoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmEndereco.QSelEndereco.Active then
  Begin
    DmEndereco.QSelEndereco.Close;
    DmEndereco.QSelEndereco.Open;
  End;
end;

procedure TFEnderecoCad.TGravarClick(Sender: TObject);
begin
  if TBDSCENDERECO.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  inherited;

end;

end.
