unit UPadraoProdutoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFPadraoProdutoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPadraoProdutoCons: TFPadraoProdutoCons;

implementation

uses UPadraoProduto_cl;

{$R *.dfm}

procedure TFPadraoProdutoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPadraoProduto do
  begin
    QPadraoProdutoCons.Close;
    if Trim(MeTexto.Text) <> '' then
      QPadraoProdutoCons.SetVariable('DESCRICAO', Trim(MeTexto.Text))
    else
      QPadraoProdutoCons.SetVariable('DESCRICAO', Null);
    QPadraoProdutoCons.Open;
  end;
end;

end.
