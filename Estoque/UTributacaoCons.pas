unit UTributacaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus, ActnList,
  ComCtrls;

type
  TFTributacaoCons = class(TFTConsulta)
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure METextoChange(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure METextoEnter(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTributacaoCons: TFTributacaoCons;

implementation

uses UTributacao_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFTributacaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTributacao do
  Begin
    QTributacaoCons.Close;
    QTributacaoCons.SetVariable('DESC_TRIBUTACAO',METexto.Text);
    QTributacaoCons.Open;
  End;
end;

procedure TFTributacaoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFTributacaoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFTributacaoCons.METextoChange(Sender: TObject);
begin
  inherited;
 if Trim(METexto.Text) <> '' then
    BtProcurarClick(Sender);
end;

procedure TFTributacaoCons.METextoExit(Sender: TObject);
begin
  inherited;
  Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código.
end;

procedure TFTributacaoCons.METextoEnter(Sender: TObject);
begin
  inherited;
  Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código.
end;

procedure TFTributacaoCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with DMTributacao do
  begin
    if Key = vk_down then
      if QTributacaoCons.Active and (QTributacaoCons.RecordCount > 1) and
        (QTributacaoCons.RecNo < QTributacaoCons.RecordCount) then
        QTributacaoCons.Next;
    if Key = vk_up then
      if QTributacaoCons.Active and (QTributacaoCons.RecordCount > 1) and
         (QTributacaoCons.RecNo > 1) then
        QTributacaoCons.Prior;
    if Key = vk_return then
      ModalResult := MrOk;
  end;

end;

procedure TFTributacaoCons.FormActivate(Sender: TObject);
begin
  inherited;
  Tag := 0;
end;

end.
