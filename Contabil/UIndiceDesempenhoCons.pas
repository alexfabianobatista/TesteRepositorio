unit UIndiceDesempenhoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFIndiceDesempenhoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIndiceDesempenhoCons: TFIndiceDesempenhoCons;

implementation

uses UIndiceDesempenho_cl;

{$R *.DFM}

procedure TFIndiceDesempenhoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMIndiceDesempenho do
  begin
    if Trim(FIndiceDesempenhoCons.METexto.Text) <> '' then
    begin
      QIndiceDesempenhoCons.Close;
      QIndiceDesempenhoCons.setVariable('DESC_INDICE_DESEMPENHO',Trim(FIndiceDesempenhoCons.METexto.Text));
      QIndiceDesempenhoCons.Open;
    end;
  end;
end;

end.
