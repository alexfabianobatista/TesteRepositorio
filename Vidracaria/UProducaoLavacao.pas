unit UProducaoLavacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TFProducaoLavacao = class(TFTProducao)
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
  FProducaoLavacao: TFProducaoLavacao;

implementation
uses UVidracaria_cl, UOracle_cl, UMostraImagem;
{$R *.dfm}

{ TFProducaoLavacao }

procedure TFProducaoLavacao.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QLavacao.Close;
  DmVidracaria.QLavacao.SetVariable('DT_LAVACAO', DMOracle.DataServ);
  DmVidracaria.QLavacao.Open;
  DmVidracaria.QLavacao.First;
end;

procedure TFProducaoLavacao.FormCreate(Sender: TObject);
begin
  wTipo := 'LAVACAO';
  wQuery := DmVidracaria.QLAVACAO;
  OnAcaoReload := AtualizaLista;
    inherited;

end;

procedure TFProducaoLavacao.btnSBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;

end;

end.
