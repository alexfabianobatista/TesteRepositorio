unit UExameCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFExameCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExameCons: TFExameCons;

implementation

uses UExame_cl;

{$R *.DFM}

procedure TFExameCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMExame do
  begin
    QExameCons.Close;
    QExameCons.setVariable('DESC_EXAME',METexto.text);
    QExameCons.open
  end
end;

end.
