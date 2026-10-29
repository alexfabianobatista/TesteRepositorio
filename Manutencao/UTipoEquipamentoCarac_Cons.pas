unit UTipoEquipamentoCarac_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTipoEquipamentoCarac_Cons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoEquipamentoCarac_Cons: TFTipoEquipamentoCarac_Cons;

implementation

uses UTipoEquipamento_cl;

{$R *.DFM}

procedure TFTipoEquipamentoCarac_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTipoEquipamento do
  Begin
    QTipoEquipamentoCarac_Cons.Close;
    QTipoEquipamentoCarac_Cons.SetVariable('Cod_Tipo_Equipamento',MeTexto.Text);
    QTipoEquipamentoCarac_Cons.Open;
  End;
end;

end.
