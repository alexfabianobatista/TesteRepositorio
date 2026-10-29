unit UOperadorCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFOperadorCad = class(TFPadrao)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DbEFoco: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    TBCOD_OPERADOR: TIntegerField;
    TBDESC_NOME: TIBStringField;
    TBDESC_SENHA: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TGravarClick(Sender: TObject);
    procedure TExcluirClick(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
    procedure TEditarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGDadosKeyPress(Sender: TObject; var Key: Char);
    procedure DbGDadosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOperadorCad: TFOperadorCad;

implementation

uses UDmOperador, UDmSistema, UFuncoes;

{$R *.dfm}

procedure TFOperadorCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'COD_OPERADOR';
end;

procedure TFOperadorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmOperador.QSelOperador.Active then
  Begin
    DmOperador.QSelOperador.Close;
    DmOperador.QSelOperador.Open;
  End;
end;

procedure TFOperadorCad.TGravarClick(Sender: TObject);
begin
  if TBDESC_NOME.Value = '' then
  Begin
    MessageDlg('Informe o Nome.', mtWarning, [mbOK], 0);
    DbEFoco.SetFocus;
    Exit;
  End;

  if TBDESC_SENHA.Value = '' then
  Begin
    MessageDlg('Informe a Senha.', mtWarning, [mbOK], 0);
    DBEdit4.SetFocus;
    Exit;
  End;

  inherited;

end;

procedure TFOperadorCad.TExcluirClick(Sender: TObject);
begin
  if Consultando then Abort;
  inherited;

end;

procedure TFOperadorCad.TIncluirClick(Sender: TObject);
begin
  if Consultando then Abort;
  inherited;

end;

procedure TFOperadorCad.TEditarClick(Sender: TObject);
begin
  if OperadorLogado <> TBCOD_OPERADOR.Value then
  Begin
    DbEFoco.ReadOnly := True;
    DBEdit4.ReadOnly := True;
  End
  Else
  Begin
    DbEFoco.ReadOnly := False;
    DBEdit4.ReadOnly := False;
  End;
  inherited;

end;

procedure TFOperadorCad.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) or (Key = Vk_Insert) then
    Abort;
  inherited;

end;

procedure TFOperadorCad.DbGDadosKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
  if Key = #13 then
  Begin
    if Consultando then
    Begin
      if (TB.IsEmpty) or (not TB.Active) then
        RetornoConsulta := -1
      else
        RetornoConsulta := TB.FieldByName(CampoRetorno).AsInteger;
      Close;
      Exit;
    End
    else
      if not Consultando then
        TEditar.Click;
  End;
end;

procedure TFOperadorCad.DbGDadosDblClick(Sender: TObject);
begin
//  inherited;
  if Consultando then
  Begin
    if (TB.IsEmpty) or (not TB.Active) then
      RetornoConsulta := -1
    else
      RetornoConsulta := TB.FieldByName(CampoRetorno).AsInteger;
    Close;
    Exit;
  End
  else
    if not Consultando then
      TEditar.Click;

end;

end.
