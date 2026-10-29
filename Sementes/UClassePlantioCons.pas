unit UClassePlantioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFClassePlantioCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassePlantioCons: TFClassePlantioCons;

implementation

uses UClassePlantio_cl;

{$R *.DFM}

procedure TFClassePlantioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMClassePlantio do
  Begin
    QClassePlantioCons.Close;
    QClassePlantioCons.SetVariable('DESCRICAO',Trim(METexto.Text));
    QClassePlantioCons.Open;
  End;
end;

end.
