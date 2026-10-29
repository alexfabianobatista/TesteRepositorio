unit UPrioridadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPrioridadeCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrioridadeCons: TFPrioridadeCons;

implementation

uses UPrioridade_cl;

{$R *.DFM}

procedure TFPrioridadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPrioridade do
  Begin
    QPrioridadeCons.Close;
    If Trim(METexto.Text) = '' then
      QPrioridadeCons.SetVariable('DESCRICAO',Null)
    Else
      QPrioridadeCons.SetVariable('DESCRICAO',METexto.Text);
    QPrioridadeCons.Open;
  End;
end;

end.
