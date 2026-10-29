unit UProducaoLaminado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TFProducaoLaminado = class(TFTProducao)
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
  FProducaoLaminado: TFProducaoLaminado;

implementation

uses UVidracaria_cl, UOracle_cl, UMostraImagem;

{$R *.dfm}

procedure TFProducaoLaminado.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QLaminado.Close;
  DmVidracaria.QLaminado.SetVariable('DT_LAMINADO', DMOracle.DataServ);
  DmVidracaria.QLaminado.Open;
  DmVidracaria.QLaminado.First;
end;

procedure TFProducaoLaminado.FormCreate(Sender: TObject);
begin
  wTipo := 'LAMINADO';
  wQuery := DmVidracaria.QLaminado;
  OnAcaoReload := AtualizaLista;
  inherited;
end;

procedure TFProducaoLaminado.btnSBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
