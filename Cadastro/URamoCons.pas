unit URamoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus;

type
  TFRamoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRamoCons: TFRamoCons;

implementation

uses URamo_cl;

{$R *.DFM}

procedure TFRamoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMRamo do
  Begin
    QRamoCons.Close;
    QRamoCons.SetVariable('DESC_RAMO',Trim(METexto.Text));
    QRamoCons.Open;
  End;
end;

procedure TFRamoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMRamo.QRamoCons;  
end;

end.
