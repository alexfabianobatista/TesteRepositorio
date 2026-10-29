unit UDispositivoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFDispositivoCons = class(TFTConsulta)
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDispositivoCons: TFDispositivoCons;

implementation

uses UUsuario_cl;

{$R *.dfm}

procedure TFDispositivoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMUsuario do
  begin
    QDispositivosCons.Close;
    QDispositivosCons.SetVariable('DESC_MODELO',METexto.Text);
    QDispositivosCons.Open;
  end;
end;

procedure TFDispositivoCons.FormCreate(Sender: TObject);
begin
  inherited;
  DMUsuario.QDispositivosCons.Open;
end;

end.
