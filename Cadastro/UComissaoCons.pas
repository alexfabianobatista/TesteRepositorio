unit UComissaoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFComissaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComissaoCons: TFComissaoCons;

implementation

uses UComissao_cl;

{$R *.dfm}

procedure TFComissaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMComissao do
  begin
    QComissaoCons.Close;
    QComissaoCons.SetVariable('DESC_COMISSAO', METexto.Text);
    QComissaoCons.Open;
  end;
end;

end.
