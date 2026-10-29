unit UVeiculoModeloCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFVeiculoModeloCons = class(TFTConsulta)
    SBIncluirModelo: TSpeedButton;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBIncluirModeloClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoModeloCons: TFVeiculoModeloCons;

implementation

uses UVeiculoModelo_cl, UVeiculoModeloCad;

{$R *.DFM}

procedure TFVeiculoModeloCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMVeiculoModelo do
  begin
    QVeiculoModeloCons.Close;
    QVeiculoModeloCons.SetVariable('DESC_MODELO',Trim(METexto.Text));
    QVeiculoModeloCons.Open;
  end;
end;

procedure TFVeiculoModeloCons.SBIncluirModeloClick(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCad = Nil then
    FVeiculoModeloCad := TFVeiculoModeloCad.Create(Application);
  FVeiculoModeloCad.SBConsulta.Enabled := false;
  FVeiculoModeloCad.ShowModal;
end;

end.
