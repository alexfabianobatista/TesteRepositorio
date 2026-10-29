unit UPecaRetornoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmDatas;

type
  TFPecaRetornoCons = class(TFTConsulta)
    FmData: TFmDatas;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPecaRetornoCons: TFPecaRetornoCons;

implementation

uses UPecaRetorno_cl;

{$R *.dfm}

procedure TFPecaRetornoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMPecaRetorno do
  begin
    QPecaRetornoCons.Close;
    QPecaRetornoCons.ClearVariables;
    if Trim(METexto.Text) <> '' then
      QPecaRetornoCons.SetVariable('PECA', Trim(METexto.Text));
    if Trim(FmData.MeDtInicial.Text) <> '' then
      QPecaRetornoCons.SetVariable('DT_INICIO', FmData.MeDtInicial.Text);
    if Trim(FmData.MeDtFinal.Text) <> '' then
      QPecaRetornoCons.SetVariable('DT_FIM', FmData.MeDtFinal.Text);
    QPecaRetornoCons.Open;
  end;
end;

end.

