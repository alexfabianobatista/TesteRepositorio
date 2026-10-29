unit UMarcaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFMarca_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoEnter(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure METextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarca_Cons: TFMarca_Cons;

implementation

uses UMarca_cl;

{$R *.DFM}

procedure TFMarca_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
 with DMMarca do
  begin
    QMarcaCons.Close;
    if Trim(METexto.Text)<>'' then
       QMarcaCons.SetVariable('DESCRICAO',METexto.Text)
    else
       QMarcaCons.SetVariable('DESCRICAO','A');
    QMarcaCons.Open;    
  end;
end;

procedure TFMarca_Cons.METextoEnter(Sender: TObject);
begin
  inherited;
  Tag := 777; //Habilitar a possibilidade de mudar o ModalResult por código;
end;

procedure TFMarca_Cons.METextoExit(Sender: TObject);
begin
  inherited;
  Tag := 0; //desabilita a possibilidade de mudar o ModalResult por código.
end;

procedure TFMarca_Cons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  with DMMarca do
  begin
    if Key = vk_down then
      if QMarcaCons.Active and (QMarcaCons.RecordCount > 1) and
        (QMarcaCons.RecNo < QMarcaCons.RecordCount) then
        QMarcaCons.Next;
    if Key = vk_up then
      if QMarcaCons.Active and (QMarcaCons.RecordCount > 1) and
         (QMarcaCons.RecNo > 1) then
        QMarcaCons.Prior;
    if Key = vk_return then
      ModalResult := MrOk;
  end;
end;

procedure TFMarca_Cons.FormActivate(Sender: TObject);
begin
  inherited;
  Tag := 0;
end;

procedure TFMarca_Cons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
    BtProcurarClick(Sender);
end;

end.
