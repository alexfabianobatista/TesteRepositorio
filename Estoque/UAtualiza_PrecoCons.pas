unit UAtualiza_PrecoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFAtualiza_PrecoCons = class(TFTConsulta)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtualiza_PrecoCons: TFAtualiza_PrecoCons;

implementation

uses UProduto_cl;

{$R *.DFM}

procedure TFAtualiza_PrecoCons.FormActivate(Sender: TObject);
begin
  inherited;
  DMProduto.QAtualiza_PrecoCons.Close;
  DMProduto.QAtualiza_PrecoCons.open;
end;

end.
