unit URelatorioCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFRelatorioCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRelatorioCons: TFRelatorioCons;

implementation

uses URelatorio_cl;

{$R *.DFM}

procedure TFRelatorioCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMRelatorio do
  Begin
    QRelatorioCons.Close;
    QRelatorioCons.SetVariable('DESC_TITULO',METexto.Text);
    QRelatorioCons.Open;
  End;
end;

end.
