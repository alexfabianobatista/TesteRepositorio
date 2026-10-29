unit UEquipamentoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFEquipamentoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipamentoCons: TFEquipamentoCons;

implementation

uses UEquipamento_cl;

{$R *.DFM}

procedure TFEquipamentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEquipamento do
  Begin
    QEquipamentoCons.Close;
    If Trim(METexto.Text) = '' then
      QEquipamentoCons.SetVariable('DESC_EQUIPAMENTO',Null)
    Else
      QEquipamentoCons.SetVariable('DESC_EQUIPAMENTO',METexto.Text);
    QEquipamentoCons.Open;
  End;
end;

end.
