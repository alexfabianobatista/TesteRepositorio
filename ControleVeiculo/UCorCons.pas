unit UCorCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus;

type
  TFCorCons = class(TFTConsulta)
    SBIncluirCor: TSpeedButton;
    procedure BtProcurarClick(Sender: TObject);
    procedure SBIncluirCorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCorCons: TFCorCons;

implementation

uses UCor_cl, UCorCad;

{$R *.DFM}

procedure TFCorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMCor do
  begin
    QCorCons.Close;
    QCorCons.SetVariable('DESC_COR',Trim(METexto.Text));
    QCorCons.Open;
  end;
end;

procedure TFCorCons.SBIncluirCorClick(Sender: TObject);
begin
  inherited;
  if FCorCad = Nil then
    FCorCad := TFCorCad.Create(Application);
  FCorCad.SBConsulta.Enabled := false;
  FCorCad.ShowModal;
end;

end.
