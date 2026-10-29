unit UProducaoLapidacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TFProducaoLapidacao = class(TFTProducao)
    btnSBVisualizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSBVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaLista(Sender: TObject);

    { Public declarations }
  end;

var
  FProducaoLapidacao: TFProducaoLapidacao;

implementation
uses UOracle_cl, UVidracaria_cl, UMostraImagem;
{$R *.dfm}


{ TFProducaoLapidacao }

procedure TFProducaoLapidacao.AtualizaLista(Sender: TObject);
begin
  DmVidracaria.QLapidacao.Close;
  DmVidracaria.QLapidacao.SetVariable('DT_LAPIDACAO', DMOracle.DataServ);
  DmVidracaria.QLapidacao.Open;
  DmVidracaria.QLapidacao.First;
end;

procedure TFProducaoLapidacao.FormCreate(Sender: TObject);
begin
  wTipo := 'LAPIDACAO';
  wQuery := DmVidracaria.QLapidacao;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

procedure TFProducaoLapidacao.btnSBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
