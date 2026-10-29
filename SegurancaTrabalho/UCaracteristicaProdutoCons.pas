unit UCaracteristicaProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFCaracteristicaProdutoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaracteristicaProdutoCons: TFCaracteristicaProdutoCons;

implementation

uses UCaracteristicaProduto_cl;

{$R *.DFM}

procedure TFCaracteristicaProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  try
    with DMCaracteristicaProduto do
    begin
      QCaracteristicaProdutoCons.Close;
      QCaracteristicaProdutoCons.SetVariable('DESC_CARACTERISTICA',Trim(METexto.Text));
      QCaracteristicaProdutoCons.Open;
    end;
  except
    Raise Exception.Create('Não foi possível realizar a Consulta');
  end;
end;

end.
