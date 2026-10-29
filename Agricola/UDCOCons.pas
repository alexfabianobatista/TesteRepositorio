unit UDCOCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFDCOCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDCOCons: TFDCOCons;

implementation

uses UDCO_cl;

{$R *.DFM}

procedure TFDCOCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMDCO.QDCOCons.close;
  if METexto.Text <> '  -   .    - ' then
    DMDCO.QDCOCons.SetVariable('NUM_DCO',METexto.text)
  else
    DMDCO.QDCOCons.SetVariable('NUM_DCO',null);
  DMDCO.QDCOCons.open;
end;

end.
