unit UTipoEquipamentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFTipoEquipamentoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoEquipamentoCons: TFTipoEquipamentoCons;

implementation

uses UTipoEquipamento_cl;

{$R *.DFM}

procedure TFTipoEquipamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTipoEquipamento do
  Begin
    QTipoEquipamentoCons.Close;
    QTipoEquipamentoCons.SetVariable('TIPO_EQUIPAMENTO',Trim(METexto.Text));
    QTipoEquipamentoCons.Open;
  End;

end;

end.
