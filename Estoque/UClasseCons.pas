unit UClasseCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ExtCtrls, Menus,
  DBCtrls, ComCtrls, ActnList, variants;

type
  TFClasseCons = class(TFTConsulta)
    DBText1: TDBText;
    Label2: TLabel;
    StatusBar1: TStatusBar;
    RgSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure proc_consulta_classe;
    procedure METextoChange(Sender: TObject);
    procedure RgSituacaoClick(Sender: TObject);
    procedure METextoEnter(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClasseCons: TFClasseCons;

implementation

uses UClasse_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFClasseCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  proc_consulta_classe;
end;

procedure TFClasseCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFClasseCons.proc_consulta_classe;
begin
   With DMClasse do
  Begin
    QClasseCons.Close;
//    QClasseCons.SQL[QClasseCons.SQL.Count-1]:='';  // elimina a última Linha da SQL
//    Case RGOrdem.ItemIndex of
//      0: QClasseCons.SQL.Add('ORDER BY TB_CLASSE.DESC_CLASSE');
//      1: QClasseCons.SQL.Add('ORDER BY TB_CLASSE.NUM_CLASSE');
//    End;
    QClasseCons.SetVariable('DESC_CLASSE',Trim('%'+METexto.Text+'%'));
    Case RgSituacao.ItemIndex of
      0 : QClasseCons.SetVariable('Ind_Situacao', 'ATIVO');
      1 : QClasseCons.SetVariable('Ind_Situacao', 'INATIVO');
      2 : QClasseCons.SetVariable('Ind_Situacao', Null);
    End;
    QClasseCons.Open;
  End;
end;

procedure TFClasseCons.METextoChange(Sender: TObject);
begin
  inherited;
  proc_consulta_classe;
end;

procedure TFClasseCons.RgSituacaoClick(Sender: TObject);
begin
  inherited;
  proc_consulta_classe;
end;

procedure TFClasseCons.METextoEnter(Sender: TObject);
begin
  inherited;
  Tag := 777; //Habilitar a possibilidade de mudar o ModalResult por código;
end;

procedure TFClasseCons.METextoExit(Sender: TObject);
begin
  inherited;
  Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código.
end;

procedure TFClasseCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with DMClasse do
  begin
    if Key = vk_down then
      if QClasseCons.Active and (QClasseCons.RecordCount > 1) and
        (QClasseCons.RecNo < QClasseCons.RecordCount) then
        QClasseCons.Next;
    if Key = vk_up then
      if QClasseCons.Active and (QClasseCons.RecordCount > 1) and
         (QClasseCons.RecNo > 1) then
        QClasseCons.Prior;
    if Key = vk_return then
      ModalResult := MrOk;
  end;
end;

procedure TFClasseCons.FormActivate(Sender: TObject);
begin
  inherited;
  Tag := 0;
end;

end.
