unit UEquipamentoItemCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFEquipamentoItemCons = class(TFTConsulta)
    Label2: TLabel;
    MEItem: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipamentoItemCons: TFEquipamentoItemCons;

implementation

uses UEquipamento_cl;

{$R *.DFM}

procedure TFEquipamentoItemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMEquipamento do
  Begin
    QEquipamentoItemCons.Close;
    If Trim(MEItem.Text) = '' then
      QEquipamentoItemCons.SetVariable('DESC_EQUIPAMENTO_ITEM',Null)
    Else
      QEquipamentoItemCons.SetVariable('DESC_EQUIPAMENTO_ITEM',MEItem.Text);
    QEquipamentoItemCons.Open;
  End;
end;

end.
