unit URecebimentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, Menus, DB, Grids, DBGrids, StdCtrls, Mask, Buttons,
  UFmCadastro;

type
  TFRecebimentoCons = class(TFTConsulta)
    FmCadastro1: TFmCadastro;
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecebimentoCons: TFRecebimentoCons;

implementation

uses UOracle_cl, URecebimento_cl;

{$R *.dfm}

procedure TFRecebimentoCons.FormActivate(Sender: TObject);
var wDia, wMes, wAno: word;
begin
  inherited;
  DecodeDate(DMOracle.DataServ, wAno, wMes, wDia);
  METexto.Text := IntToStr(wAno);
end;

procedure TFRecebimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMRecebimento do
  begin
    QRecebimentoJornalCons.Close;
    QRecebimentoJornalCons.SetVariable('ANO', METexto.Text);
    if Trim(FmCadastro1.MeCadastro.Text) <> '' then
      QRecebimentoJornalCons.SetVariable('CADASTRO', Trim(FmCadastro1.MeCadastro.Text))
    else
      QRecebimentoJornalCons.SetVariable('CADASTRO', null);
    QRecebimentoJornalCons.Open;
  end;
end;

end.
