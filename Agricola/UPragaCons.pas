unit UPragaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFPragaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPragaCons: TFPragaCons;

implementation

uses UPraga_cl;

{$R *.DFM}

procedure TFPragaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPraga do
    Begin
      QPragaCons.Close;
      QPragaCons.SetVariable(':DESC_PRAGA',Trim(METexto.Text));
      QPragaCons.Open;
    End;

end;

end.
