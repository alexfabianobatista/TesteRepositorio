unit UAgronomoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFAgronomoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAgronomoCons: TFAgronomoCons;

implementation

uses UAgronomo_cl;

{$R *.DFM}

procedure TFAgronomoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DmAgronomo do
  Begin
       QAgronomoCons.Close;
       QAgronomoCons.Open;
  end;

end;

end.
