unit URegiaoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus;

type
  TFRegiaoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegiaoCons: TFRegiaoCons;

implementation

uses URegiao_cl;

{$R *.DFM}

procedure TFRegiaoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMRegiao do
  Begin
    QRegiaoCons.Close;
    QRegiaoCons.SetVariable('DESC_REGIAO',Trim(METexto.Text));
    QRegiaoCons.Open;
  End;
end;

procedure TFRegiaoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMRegiao.QRegiaoCons;
end;

end.


