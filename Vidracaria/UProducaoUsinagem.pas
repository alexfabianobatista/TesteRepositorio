unit UProducaoUsinagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TFProducaoUsinagem = class(TFTProducao)
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
  FProducaoUsinagem: TFProducaoUsinagem;

implementation

uses UVidracaria_cl, UOracle_cl, UMostraImagem;

{$R *.dfm}

procedure TFProducaoUsinagem.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QUsinagem.Close;
  DmVidracaria.QUsinagem.SetVariable('DT_USINAGEM', DMOracle.DataServ);
  DmVidracaria.QUsinagem.Open;
  DmVidracaria.QUsinagem.First;
end;

procedure TFProducaoUsinagem.FormCreate(Sender: TObject);
begin
  wTipo := 'USINAGEM';
  wQuery := DmVidracaria.QUsinagem;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

procedure TFProducaoUsinagem.SBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
