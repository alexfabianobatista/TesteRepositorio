unit UDoencaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFDoencaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDoencaCons: TFDoencaCons;

implementation

uses UDoenca_cl;

{$R *.DFM}

procedure TFDoencaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMDoenca.QDoencaCons.Close;
  If METexto.Text <> '' then
    DMDoenca.QDoencaCons.SetVariable('DESC_DOENCA', Trim(METexto.Text))
  Else
    DMDoenca.QDoencaCons.SetVariable('DESC_DOENCA', null);
  DMDoenca.QDoencaCons.Open;
end;

end.
