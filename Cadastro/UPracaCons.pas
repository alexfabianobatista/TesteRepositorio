unit UPracaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFPracaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPracaCons: TFPracaCons;

implementation

uses UPraca_cl;

{$R *.DFM}

procedure TFPracaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
   DMPraca.QPracaCons.close;
  if METexto.Text = '' then
    DMPraca.QPracaCons.setVariable('desc_cidade',null)
  else
    DMPraca.QPracaCons.setVariable('desc_cidade',Trim(METexto.Text));
  DMPraca.QPracaCons.open;
end;

end.
