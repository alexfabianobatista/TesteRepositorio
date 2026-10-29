unit UPromotorCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPromotorCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPromotorCons: TFPromotorCons;

implementation

uses UPromoto_cl;

{$R *.DFM}

procedure TFPromotorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMPromotor do
  Begin
    QPromotorCons.Close;
    QPromotorCons.SetVariable('NOME',Trim(METexto.Text));
    QPromotorCons.Open;
  End;
end;

end.
