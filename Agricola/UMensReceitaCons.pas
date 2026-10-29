unit UMensReceitaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFMensReceitaCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensReceitaCons: TFMensReceitaCons;

implementation

uses UMensReceita_cl;

{$R *.DFM}

procedure TFMensReceitaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMensReceita do
    Begin
      QMensReceitaCons.Close;
      QMensReceitaCons.Open;
    End;

end;

end.
