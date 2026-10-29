unit UProducaoMarcacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TFProducaoMarcacao = class(TFTProducao)
    SBVisualizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SBVisualizarClick(Sender: TObject);
  private
    procedure AtualizaLista(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoMarcacao: TFProducaoMarcacao;

implementation

uses UVidracaria_cl, UOracle_cl, UMostraImagem;

{$R *.dfm}

procedure TFProducaoMarcacao.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QMarcacao.Close;
  DmVidracaria.QMarcacao.SetVariable('DT_MARCACAO', DMOracle.DataServ);
  DmVidracaria.QMarcacao.Open;
  DmVidracaria.QMarcacao.First;
end;

procedure TFProducaoMarcacao.FormCreate(Sender: TObject);
begin
  wTipo := 'MARCACAO';
  wQuery := DmVidracaria.QMarcacao;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

procedure TFProducaoMarcacao.SBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
