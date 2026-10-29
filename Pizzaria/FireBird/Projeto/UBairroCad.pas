unit UBairroCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, StdCtrls, Mask, DBCtrls, DB, IBCustomDataSet, ImgList,
  IBUpdateSQL, IBDatabase, IBQuery, Buttons, ExtCtrls, Grids, DBGrids,
  ComCtrls, ToolWin;

type
  TFBairroCad = class(TFPadrao)
    TBCODBAIRRO: TIntegerField;
    TBDSCBAIRRO: TIBStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DBEFoco: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBairroCad: TFBairroCad;

implementation

uses UDmEndereco, UDmBairro;

{$R *.dfm}

procedure TFBairroCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DmBairro.QSelBairro.Active then
  Begin
    DmBairro.QSelBairro.Close;
    DmBairro.QSelBairro.Open;
  End;
end;

procedure TFBairroCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'CODBAIRRO';
end;

procedure TFBairroCad.TGravarClick(Sender: TObject);
begin
  if TBDSCBAIRRO.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DBEFoco.SetFocus;
    Exit;
  End;

  inherited;

end;

end.
