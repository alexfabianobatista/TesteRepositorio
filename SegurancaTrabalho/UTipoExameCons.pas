unit UTipoExameCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTipoExameCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoExameCons: TFTipoExameCons;

implementation

uses UTipoExame_cl;

{$R *.DFM}

procedure TFTipoExameCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMTipoExame do
  begin
    QTipoExameCons.Close;
    QTipoExameCons.setVariable('DESC_TIPO_EXAME',METexto.text);
    QTipoExameCons.open
  end
end;

end.
