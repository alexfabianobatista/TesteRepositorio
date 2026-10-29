unit UHistoricoPromotorCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFHistoricoPromotorCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistoricoPromotorCons: TFHistoricoPromotorCons;

implementation

uses UHistoricoPromotor_cl;

{$R *.DFM}

procedure TFHistoricoPromotorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMHistoricoPromotor do
  Begin
    QHistoricoPromotorCons.Close;
    QHistoricoPromotorCons.SetVariable('DESCRICAO',Trim(METexto.Text));
    QHistoricoPromotorCons.Open;
  End;

end;

end.
