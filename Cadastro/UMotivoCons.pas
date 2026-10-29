unit UMotivoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db;

type
  TFMotivoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMotivoCons: TFMotivoCons;

implementation

uses UMotivo_cl;

{$R *.DFM}

procedure TFMotivoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMotivo do
  Begin
    QMotivoCons.Close;
    QMotivoCons.SetVariable('DESC_MOTIVO',Trim(METexto.Text));
    QMotivoCons.Open;
  End;
end;

end.
