unit UProducaoCorte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TFProducaoCorte = class(TFTProducao)
    SBVisualizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SBVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaLista(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FProducaoCorte: TFProducaoCorte;

implementation

uses UVidracaria_cl, UOracle_cl, UMostraImagem;

{$R *.dfm}

procedure TFProducaoCorte.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QCorte.Close;
  DmVidracaria.QCorte.SetVariable('DT_CORTE', DMOracle.DataServ);
  DmVidracaria.QCorte.Open;
  DmVidracaria.QCorte.First;
end;

procedure TFProducaoCorte.FormCreate(Sender: TObject);
begin
  wTipo := 'CORTE';
  wQuery := DmVidracaria.QCorte;
  OnAcaoReload := AtualizaLista;
    inherited;

end;

procedure TFProducaoCorte.SBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
