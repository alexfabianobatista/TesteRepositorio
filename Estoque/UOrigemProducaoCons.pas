unit UOrigemProducaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFOrigemProducaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrigemProducaoCons: TFOrigemProducaoCons;

implementation

uses UOrigemProducao_cl;

{$R *.DFM}

procedure TFOrigemProducaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMOrigemProducao do
  Begin
    QOrigemProducaoCons.Close;
    QOrigemProducaoCons.SetVariable('DESC_ORIGEM_PRODUCAO',Trim(METexto.Text));
    QOrigemProducaoCons.Open;
  End;
end;

end.
