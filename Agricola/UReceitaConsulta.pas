unit UReceitaConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus,
  UFmDatas;

type
  TFReceitaConsulta = class(TFTConsulta)
    FmDatas1: TFmDatas;
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReceitaConsulta: TFReceitaConsulta;

implementation

uses UReceita_cl, DateUtils;

{$R *.dfm}

procedure TFReceitaConsulta.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMReceita do
  begin
    QReceitaConsulta.Close;
    if Trim(METexto.Text) <> '' then
      QReceitaConsulta.SetVariable('RECEITA', METexto.Text)
    else
      QReceitaConsulta.SetVariable('RECEITA', Null);
    if Trim(FmDatas1.MeDtInicial.Text) <> '' then
      QReceitaConsulta.SetVariable('DT_INI', Trim(FmDatas1.MeDtInicial.Text))
    else
      QReceitaConsulta.SetVariable('DT_INI', null);
    if Trim(FmDatas1.MeDtFinal.Text) <> '' then
      QReceitaConsulta.SetVariable('DT_FIN', Trim(FmDatas1.MeDtFinal.Text))
    else
      QReceitaConsulta.SetVariable('DT_FIN', null);
    QReceitaConsulta.Open;
  end;
end;

end.
