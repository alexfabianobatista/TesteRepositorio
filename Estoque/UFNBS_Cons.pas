unit UFNBS_Cons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFNBS_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNBS_Cons: TFNBS_Cons;

implementation
uses UNBS_cl;
{$R *.dfm}

procedure TFNBS_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMNbs do
  begin
    QNBS_Cons.Close;
    if Trim(METexto.Text) <> '' then
      QNBS_Cons.SetVariable('DESCRICAO', Trim(METexto.Text)+'%')
    else
      QNBS_Cons.SetVariable('DESCRICAO', null);
    QNBS_Cons.Open;
  end;
end;

procedure TFNBS_Cons.METextoChange(Sender: TObject);
begin
  inherited;
  if Trim(METexto.Text) <> '' then
    BtProcurarClick(Sender);
end;

end.
