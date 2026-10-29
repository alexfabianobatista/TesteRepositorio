unit UMecanicoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus,
  ExtCtrls;

type
  TFMecanicoCons = class(TFTConsulta)
    RGSituacao: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMecanicoCons: TFMecanicoCons;

implementation

uses UOficina_cl;

{$R *.DFM}

procedure TFMecanicoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QMecanicoCons.Close;
    if METexto.Text = '' then
       QMecanicoCons.SetVariable('NOME',Null)
    else
       QMecanicoCons.SetVariable('NOME','%'+METexto.Text+'%');
    if RGSituacao.ItemIndex = 0 then
      QMecanicoCons.SetVariable('IND_SITUACAO', 'A')
    else if RGSituacao.ItemIndex = 1 then
      QMecanicoCons.SetVariable('IND_SITUACAO', 'I')
    else
      QMecanicoCons.SetVariable('IND_SITUACAO', NULL);
    QMecanicoCons.Open;
  end;
end;

end.
