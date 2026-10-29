unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Grids, DBGrids, DB, ExtCtrls,
  StdCtrls, Buttons, IBDatabase, IBCustomDataSet, IBQuery, IBUpdateSQL,
  ImgList, Mask, DBCtrls;

type
  TFPadrao = class(TForm)
    TbOpcoes: TToolBar;
    TIncluir: TToolButton;
    ToolButton2: TToolButton;
    TEditar: TToolButton;
    ToolButton4: TToolButton;
    TCancelar: TToolButton;
    ToolButton6: TToolButton;
    TPesquisar: TToolButton;
    ToolButton8: TToolButton;
    TSair: TToolButton;
    DS: TDataSource;
    DbGDados: TDBGrid;
    PnDados: TPanel;
    TGravar: TToolButton;
    ToolButton3: TToolButton;
    PnBotoes: TPanel;
    BtnGravar: TBitBtn;
    BtnCancelar: TBitBtn;
    PnEdits: TPanel;
    TExcluir: TToolButton;
    ToolButton5: TToolButton;
    TB: TIBQuery;
    IBT: TIBTransaction;
    IBU: TIBUpdateSQL;
    ILLig: TImageList;
    ILDeslig: TImageList;
    Label11: TLabel;
    ToolButton1: TToolButton;
    PnLocalizar: TPanel;
    LLocalizar: TLabel;
    ELocalizar: TEdit;
    BtnOKLocalizar: TBitBtn;
    procedure TSairClick(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
    procedure TEditarClick(Sender: TObject);
    procedure TCancelarClick(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DbGDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TExcluirClick(Sender: TObject);
    procedure DbGDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBBeforeDelete(DataSet: TDataSet);
    procedure PnDadosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBAfterOpen(DataSet: TDataSet);
    procedure TBAfterClose(DataSet: TDataSet);
    procedure TPesquisarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DbGDadosDblClick(Sender: TObject);
    procedure PnLocalizarExit(Sender: TObject);
    procedure ELocalizarChange(Sender: TObject);
    procedure ELocalizarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnOKLocalizarClick(Sender: TObject);
  private
    procedure Barra(Incluir, Editar, Gravar, Cancelar, Excluir, Pesquisar, Sair: Boolean);
    procedure SetaFoco;
    { Private declarations }
  public
    { Public declarations }
    Consultando: Boolean;
    CampoRetorno, Filtro: String;
    CampoFoco: Integer;
  end;

var
  FPadrao: TFPadrao;

implementation

uses UDmSistema, UFuncoes;

{$R *.dfm}

procedure TFPadrao.TSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFPadrao.TIncluirClick(Sender: TObject);
begin
  if (not TB.Active) then TB.Open;

  PnDados.Visible := True;

  Barra(False, False, True, True, False, False, True);
  PnEdits.SetFocus;

  IBT.CommitRetaining;
  TB.Append;

  SetaFoco;
end;

procedure TFPadrao.TEditarClick(Sender: TObject);
begin
  if (TB.IsEmpty) or (not TB.Active) then Exit;

  RetornoConsulta := -1;

  PnDados.Visible := True;

  Barra(False, False, True, True, False, False, True);
  PnEdits.SetFocus;

  IBT.CommitRetaining;
  TB.Edit;

  SetaFoco;
end;

procedure TFPadrao.TCancelarClick(Sender: TObject);
begin
  TB.Cancel;
  IBT.RollbackRetaining;

  PnDados.Visible := False;

  Barra(True, True, False, False, True, True, True);

  DbGDados.SetFocus;
end;

procedure TFPadrao.TGravarClick(Sender: TObject);
var Inserindo: Boolean;
begin
  Inserindo := TB.State = dsInsert;

  try
    TB.Post;
  except
    MessageDlg('Erro ao incluir registro.'+#13+#10+'Verifique valores já cadastrados e dependências.', mtError, [mbOK], 0);
    IBT.RollbackRetaining;
    Exit;
  end;
  IBT.CommitRetaining;

  PnDados.Visible := False;

  Barra(True, True, False, False, True, True, True);

  DbGDados.SetFocus;

  if Inserindo then
    TIncluir.Click;
end;

procedure TFPadrao.Barra(Incluir, Editar, Gravar, Cancelar, Excluir, Pesquisar, Sair: Boolean);
Begin
  TIncluir.Enabled := Incluir;
  TEditar.Enabled := Editar;
  TGravar.Enabled := Gravar;
  TCancelar.Enabled := Cancelar;
  TExcluir.Enabled := Excluir;
  TPesquisar.Enabled := Pesquisar;
  TSair.Enabled := Sair;
End;

procedure TFPadrao.FormShow(Sender: TObject);
begin
  PnDados.Visible := False;
  Barra(True, False, False, False, True, True, True);
  TB.Close;
//  TB.Open;

  PnDados.Left := Trunc(Width / 2) - Trunc(PnDados.Width / 2);
  PnDados.Top := Trunc(Height / 2) - Trunc(PnDados.Height / 2);
  PnLocalizar.Left := Trunc(Width / 2) - Trunc(PnLocalizar.Width / 2);
  PnLocalizar.Top := Trunc(Height / 2) - Trunc(PnLocalizar.Height / 2);

  if Consultando then
    TPesquisar.Click;

  if CampoFoco < 0 then
  Begin
    if DbGDados.Columns.Count > 1 then
      DbGDados.SelectedIndex := 1
    else
      DbGDados.SelectedIndex := 0;
  end
  else
    DbGDados.SelectedIndex := CampoFoco;
  DbGDados.SetFocus;
end;

procedure TFPadrao.FormResize(Sender: TObject);
begin
  PnDados.Left := Trunc(ClientWidth / 2) - Trunc(PnDados.Width / 2);
  PnDados.Top := Trunc(ClientHeight / 2) - Trunc(PnDados.Height / 2);
  PnLocalizar.Left := Trunc(ClientWidth / 2) - Trunc(PnLocalizar.Width / 2);
  PnLocalizar.Top := Trunc(ClientHeight / 2) - Trunc(PnLocalizar.Height / 2);
end;

procedure TFPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (TGravar.Enabled) and (Key = Vk_f9) then
  Begin
    BtnGravar.SetFocus;
    TGravar.Click;
  End;
  if Key = Vk_ESCAPE then
    if TCancelar.Enabled then
      TCancelar.Click
    else
      if PnLocalizar.Visible then
        PnLocalizarExit(Self)
      else
        TSair.Click;
  if (TIncluir.Enabled) and (Key = Vk_Insert) then
    TIncluir.Click;
  if (Key = VK_F3) then
  Begin
    if (not TB.Active) then
      TPesquisar.Click;
    if (TB.State = dsBrowse) then
    Begin
      LLocalizar.Caption := DbGDados.Columns[DbGDados.SelectedIndex].Title.Caption;
      PnLocalizar.Visible := True;
      Elocalizar.SetFocus;
    End;
  End;
end;

procedure TFPadrao.DbGDadosKeyPress(Sender: TObject; var Key: Char);
begin
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
      TEditar.Click;
  End;
end;

procedure TFPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SelectNext(ActiveControl, True, True);
end;

procedure TFPadrao.TExcluirClick(Sender: TObject);
begin
  if (TB.IsEmpty) or (not TB.Active) then Exit;

  if (MessageDlg('Apagar o registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  IBT.CommitRetaining;
  try
    try
      TB.Delete;
    except
      MessageDlg('Não foi possível apagar o registro.' + #13 + #10 + 'Provavelmente ele já possui dependências.', mtError, [mbOK], 0);
      IBT.RollbackRetaining;
    end;
  finally
    IBT.CommitRetaining;
  end;
end;

procedure TFPadrao.DbGDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
    TExcluir.Click;
end;

procedure TFPadrao.TBBeforeDelete(DataSet: TDataSet);
begin
//  if (MessageDlg('Apagar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
//    Abort;
end;

procedure TFPadrao.PnDadosExit(Sender: TObject);
begin
  if TCancelar.Enabled then
    TCancelar.Click;
end;

procedure TFPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (TB.State = dsEdit) or (TB.State = dsInsert) then
    if (MessageDlg('Há uma alteração em andamento.'+#13+#10+'Deseja realmente sair?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
      Abort;

  Action := caFree;
end;

procedure TFPadrao.TBAfterOpen(DataSet: TDataSet);
begin
  IBT.Active := True;
end;

procedure TFPadrao.TBAfterClose(DataSet: TDataSet);
begin
  IBT.Active := False;
end;

procedure TFPadrao.TPesquisarClick(Sender: TObject);
begin
  TB.Open;
  TB.Filtered := False;
  TB.Filter := Filtro;
  TB.Filtered := TB.Filter <> '';
  Barra(True, True, False, False, True, True, True);
end;

procedure TFPadrao.FormCreate(Sender: TObject);
begin
  Consultando := False;
  Filtro := '';
  RetornoConsulta := -1;
  CampoFoco := -1;
end;

procedure TFPadrao.SetaFoco;
var i: Integer;
Begin
  for i := 0 to ComponentCount -1 do
  Begin
    if Components[i].ClassName = 'TDBEdit' then
      if UpperCase(TDBEdit(Components[i]).Name) = 'DBEFOCO' then
      Begin
        TDBEdit(Components[i]).SetFocus;
        Exit;
      End;
  End;
End;

procedure TFPadrao.DbGDadosDblClick(Sender: TObject);
begin
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
    TEditar.Click;
end;

procedure TFPadrao.PnLocalizarExit(Sender: TObject);
begin
  PnLocalizar.Visible := False;
  Barra(True, True, False, False, True, True, True);
  DbGDados.SetFocus;
end;

procedure TFPadrao.ELocalizarChange(Sender: TObject);
begin
  TB.Locate(DbGDados.Columns[DbGDados.SelectedIndex].FieldName, ELocalizar.Text, [loPartialKey])
end;

procedure TFPadrao.ELocalizarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_RETURN) or (Key = vk_TAB) then
    PnLocalizarExit(Self);
end;

procedure TFPadrao.BtnOKLocalizarClick(Sender: TObject);
begin
  PnLocalizarExit(Self);
end;

end.
