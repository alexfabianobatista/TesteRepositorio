unit UTipoCadastroCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, ActnList, Menus;

type
  TFTipoCadastroCons = class(TFTConsulta)
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoCadastroCons: TFTipoCadastroCons;

implementation

uses UTipoCadastro_cl;

{$R *.DFM}

procedure TFTipoCadastroCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMTipoCadastro do
  Begin
    QTipoCadastroCons.Close;
    QTipoCadastroCons.SetVariable('DESCRICAO',Trim(METexto.Text));
    QTipoCadastroCons.Open;
  End;
end;

end.
