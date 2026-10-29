unit UCondicao_pgtoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFCondicaoPgtoCons = class(TFTConsulta)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCondicaoPgtoCons: TFCondicaoPgtoCons;

implementation

uses UOficina_cl;

{$R *.DFM}

procedure TFCondicaoPgtoCons.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QCondicao_PgtoCons.Close;
    QCondicao_PgtoCons.Open;
  end;
end;

end.
