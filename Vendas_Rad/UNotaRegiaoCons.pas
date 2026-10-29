unit UNotaRegiaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFRegiaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegiaoCons: TFRegiaoCons;

implementation

{$R *.DFM}

procedure TFRegiaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    QRegiaoCons.Close;
    QRegiaoCons.ParamByName('DESCRICAO').AsString := METexto.Text;
    QRegiaoCons.Open;
  End;

end;

end.
