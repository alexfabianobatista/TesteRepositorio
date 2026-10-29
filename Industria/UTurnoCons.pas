unit UTurnoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTurnoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTurnoCons: TFTurnoCons;

implementation

uses UTurno_cl;

{$R *.DFM}

procedure TFTurnoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTurno do
  Begin
    QTurnoAll.Close;
    QTurnoAll.Open;
  End;
end;

end.
