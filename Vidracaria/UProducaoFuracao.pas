unit UProducaoFuracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TFProducaoFuracao = class(TFTProducao)
    btnSBVisualizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSBVisualizarClick(Sender: TObject);

  private
    { Private declarations }
    procedure AtualizaLista(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FProducaoFuracao: TFProducaoFuracao;

implementation
uses UOracle_cl, UVidracaria_cl, UMostraImagem;

{$R *.dfm}

procedure TFProducaoFuracao.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QFuracao.Close;
  DmVidracaria.QFuracao.SetVariable('DT_FURACAO', DMOracle.DataServ);
  DmVidracaria.QFuracao.Open;
  DmVidracaria.QFuracao.First;
end;

procedure TFProducaoFuracao.FormCreate(Sender: TObject);
begin
  wTipo := 'FURACAO';
  wQuery := DmVidracaria.QFuracao;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

procedure TFProducaoFuracao.btnSBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
