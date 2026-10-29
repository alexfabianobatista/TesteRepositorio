unit UMarcacaoFinaliza;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, Db, Grids, DBGrids, Dialogs, variants, Mask, ActnList,
  ComCtrls;

type
  TFMarcacaoFinalizar = class(TForm)
    BtConfirmar: TButton;
    BtSair: TButton;
    Bevel1: TBevel;
    DBGMarcacao: TDBGrid;
    Label1: TLabel;
    EdCodMecanico: TEdit;
    Label2: TLabel;
    EdNomeMecanico: TEdit;
    DSConsulta: TDataSource;
    MEHoraFinal: TMaskEdit;
    SBMarcacaoFinaliza: TStatusBar;
    ALMarcacaoFinaliza: TActionList;
    EscolheMarcacaoAction: TAction;
    FinalizaMarcacaoAction: TAction;
    SairAction: TAction;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure DBGMarcacaoDblClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MEHoraFinalExit(Sender: TObject);
    procedure EscolheMarcacaoActionExecute(Sender: TObject);
    procedure FinalizaMarcacaoActionExecute(Sender: TObject);
    procedure SairActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarcacaoFinalizar: TFMarcacaoFinalizar;

implementation

uses UOficina_cl, UMecanicoCons, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFMarcacaoFinalizar.FormActivate(Sender: TObject);
begin
  with DMOficina do
  begin
    QOSMarcacaoCons.Close;
    QOSMarcacaoCons.SetVariable('NUM_OS',Null);
    QOSMarcacaoCons.SetVariable('COD_MECANICO',Null);
    QOSMarcacaoCons.SetVariable('IND_SITUACAO','I');
    QOSMarcacaoCons.Open;
  end;
end;

procedure TFMarcacaoFinalizar.FormCreate(Sender: TObject);
procedure addColumn(grid: TDBGrid; field, title: String; index: Integer = -1; width: Integer = 0);
var
  col: TColumn;
begin
  col := grid.Columns.Add;
  col.FieldName := field;
  col.Title.Caption := title;
  if index > -1 then
    col.Index := index;
  if width > 0 then
    col.Width := width;
end;
begin
  with DMOficina do
  begin
    QOSMarcacao.Close;
    QOSMarcacao.Open;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
  begin
    DBGMarcacao.Columns.Items[5].Visible := False;
    DBGMarcacao.Columns.Items[4].Visible := False;
    DBGMarcacao.Columns.Items[3].Visible := False;
    DBGMarcacao.Columns.Items[0].Visible := False;
    addColumn(DBGMarcacao, 'MECANICO', 'Mecânico', 0, 140);
    addColumn(DBGMarcacao, 'DT_INICIO', 'Início', 3);
    addColumn(DBGMarcacao, 'DT_FIM', 'Fim', 4);
    MEHoraFinal.EditMask := '!99:99;1;_';

    EscolheMarcacaoAction.ShortCut := VK_F3;
    FinalizaMarcacaoAction.ShortCut := VK_F4;
    SairAction.ShortCut := VK_ESCAPE;
    SBMarcacaoFinaliza.SimpleText := 'F3 - ESCOLHER MARCAÇÃO; F4 - FINALIZAR; ESC - SAIR';
    SBMarcacaoFinaliza.SimplePanel := True;
  end;
end;

procedure TFMarcacaoFinalizar.BtConfirmarClick(Sender: TObject);
begin
  if (Trim(EdCodMecanico.Text) = '') or (Trim(MEHoraFinal.Text) = '') then
     raise exception.Create('Código do mecanico e Hora final devem ser informados!');

  if (StrToInt(Copy(MEHoraFinal.Text,1,2)) > 24) or
     (StrToInt(Copy(MEHoraFinal.Text,4,2)) > 60) then
     raise exception.Create('Hora informada é invalida!');

  // Verificou integridade do dados inicia gravação
  with DMOficina do
  begin
    QOSMarcacao.Close;
    QOSMarcacao.SetVariable('PK',QOSMarcacaoConsCOD_MARCACAO.Value);
    QOSMarcacao.Open;
    try
      QOSMarcacao.Edit;
//      QOSMarcacaoHR_FINAL.Value := StrToFloat(Copy(MEHoraFinal.Text,1,2)+','+Copy(MEHoraFinal.Text,4,2)); <- Isso vai ser feito no OnChange do DT_FIM
      QOSMarcacaoDT_FIM.Value := StrToTime(MEHoraFinal.Text);
      QOSMarcacaoIND_SITUACAO.Value:= 'F';
      QOSMarcacao.Post;

      EdCodMecanico.Clear;
      EdNomeMecanico.Clear;
      MEHoraFinal.Clear;
    except
      MessageDlg('Erro ao tentar gravar registro, Verifique!',mtInformation,[mbOk],0);
      raise;
    end;
    QOSMarcacaoCons.Close;
    QOSMarcacaoCons.SetVariable('NUM_OS',Null);
    QOSMarcacaoCons.SetVariable('COD_MECANICO',Null);
    QOSMarcacaoCons.SetVariable('IND_SITUACAO','I');
    QOSMarcacaoCons.Open;
  end;

end;

procedure TFMarcacaoFinalizar.DBGMarcacaoDblClick(Sender: TObject);
begin
  EdCodMecanico.Text:= IntToStr(DMOficina.QOSMarcacaoConsCOD_MECANICO.Value);
  EdNomeMecanico.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_MECANICO','COD_MECANICO = '+EdCodMecanico.Text);
  MEHoraFinal.Text:= FormatDateTime('hh:nn',Time);
  MEHoraFinal.SetFocus;
end;

procedure TFMarcacaoFinalizar.BtSairClick(Sender: TObject);
begin
  Close;
  FMarcacaoFinalizar.Release;
  FMarcacaoFinalizar := nil;
end;

procedure TFMarcacaoFinalizar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMOficina.QOSMarcacaoCons.Close;
  Action := CaFree;
  FMarcacaoFinalizar := Nil;
end;

procedure TFMarcacaoFinalizar.MEHoraFinalExit(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AGRONEWS' then
    MEHoraFinal.Text := StringReplace(MEHoraFinal.Text, ' ', '0', [rfReplaceAll]);
end;

procedure TFMarcacaoFinalizar.EscolheMarcacaoActionExecute(
  Sender: TObject);
begin
  DBGMarcacaoDblClick(Sender);
end;

procedure TFMarcacaoFinalizar.FinalizaMarcacaoActionExecute(
  Sender: TObject);
begin
  BtConfirmarClick(Sender);
end;

procedure TFMarcacaoFinalizar.SairActionExecute(Sender: TObject);
begin
  BtSairClick(Sender);
end;

end.
