unit UBorderoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmContaCorrente, UFmDatas;

type
  TFBorderoCons = class(TFTConsulta)
    FmContaCorrente1: TFmContaCorrente;
    FmDatas1: TFmDatas;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBorderoCons: TFBorderoCons;

implementation

uses UBordero_cl, UOracle_cl;

{$R *.dfm}

procedure TFBorderoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMBordero do
  begin
    QBorderoCons.Close;
    QBorderoCons.SetVariable('DT_INICIAL', FmDatas1.MeDtInicial.Text);
    QBorderoCons.SetVariable('DT_FINAL', FmDatas1.MeDtFinal.Text);
    if Trim(FmContaCorrente1.MeContaCorrente.Text) <> '' then
      QBorderoCons.SetVariable('CONTA_CORRENTE', Trim(FmContaCorrente1.MeContaCorrente.Text))
    else
      QBorderoCons.SetVariable('CONTA_CORRENTE', null);
    QBorderoCons.Open;
  end;
end;

procedure TFBorderoCons.FormActivate(Sender: TObject);
begin
  inherited;
  if trim(FmDatas1.MeDtInicial.Text) = '' then
    FmDatas1.MeDtInicial.Text := DateToStr(DMOracle.DataServ);
  if trim(FmDatas1.MeDtFinal.Text) = '' then
    FmDatas1.MeDtFinal.Text := DateToStr(DMOracle.DataServ);
end;

end.
