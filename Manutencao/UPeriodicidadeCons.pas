unit UPeriodicidadeCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFPeriodicidadeCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPeriodicidadeCons: TFPeriodicidadeCons;

implementation

uses UPeriodicidade_cl;

{$R *.DFM}

procedure TFPeriodicidadeCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPeriodicidade do
  Begin
    QPeriodicidadeCons.close;
    if Trim(METexto.Text) = '' then
      QPeriodicidadeCons.SetVariable('DESC_PERIODICIDADE',Null)
    Else
      QPeriodicidadeCons.SetVariable('DESC_PERIODICIDADE',Trim(METexto.Text));
    QPeriodicidadeCons.Open;
  End;
end;

end.
