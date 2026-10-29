unit UProducaoConferencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, StdCtrls, Buttons, Grids, DBGrids;

type
  TFProducaoConferencia = class(TFTProducao)
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
  FProducaoConferencia: TFProducaoConferencia;

implementation

uses UVidracaria_cl, UOracle_cl, UMostraImagem;

{$R *.dfm}

procedure TFProducaoConferencia.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QConferencia.Close;
  DmVidracaria.QConferencia.SetVariable('DT_CONFERENCIA', DMOracle.DataServ);
  DmVidracaria.QConferencia.Open;
  DmVidracaria.QConferencia.First;
end;

procedure TFProducaoConferencia.FormCreate(Sender: TObject);
begin
  wTipo := 'CONFERENCIA';
  wQuery := DmVidracaria.QConferencia;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

procedure TFProducaoConferencia.SBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

end.
