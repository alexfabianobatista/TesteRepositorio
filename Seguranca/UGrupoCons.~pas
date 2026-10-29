unit UGrupoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus;

type
  TFGrupoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoCons: TFGrupoCons;

implementation

uses UGrupo_cl;

{$R *.DFM}

procedure TFGrupoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMGrupo do
  Begin
    QGrupoCons.Close;
    QGrupoCons.SetVariable('NOME', METexto.Text);
    QGrupoCons.Open;
  End;
end;

end.
