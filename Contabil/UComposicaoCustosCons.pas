unit UComposicaoCustosCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UComposicaoCustos_cl;

type
  TFComposicaoCustosCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComposicaoCustosCons: TFComposicaoCustosCons;

implementation

{$R *.dfm}

procedure TFComposicaoCustosCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMComposicaoCustos do
  begin
    QComposicaoCustosCons.Close;
    QComposicaoCustosCons.SetVariable('DESCRICAO', METexto.Text);
    QcomposicaoCustosCons.Open;
  end;
end;

end.
