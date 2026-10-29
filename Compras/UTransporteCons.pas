unit UTransporteCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db;

type
  TFTransporteCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransporteCons: TFTransporteCons;

implementation

uses UTransporte_cl;

{$R *.DFM}

procedure TFTransporteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTransporte Do
  Begin
    QTransporteCons.Close;
    QTransporteCons.SetVariable('DESC_TRANSPORTE',Trim(METexto.Text));
    QTransporteCons.Open;
  End;
end;

end.
