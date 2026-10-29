unit UProducaoReposicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TFProducaoReposicao = class(TFTProducao)
    procedure FormCreate(Sender: TObject);
  private
    procedure AtualizaLista(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProducaoReposicao: TFProducaoReposicao;

implementation

uses UVidracaria_cl, UOracle_cl;

{$R *.dfm}

procedure TFProducaoReposicao.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
//  DmVidracaria.QReposicao.Close;
//  DmVidracaria.QReposicao.SetVariable('DT_REPOSICAO', DMOracle.DataServ);
//  DmVidracaria.QReposicao.Open;
//  DmVidracaria.QReposicao.First;

  DmVidracaria.QQuebraSetor.Close;
  DmVidracaria.QQuebraSetor.SetVariable('DT_QUEBRA', DMOracle.DataServ);
  DmVidracaria.QQuebraSetor.SetVariable('DESC_TIPO', wTipoQuebra);
  DmVidracaria.QQuebraSetor.Open;
  DmVidracaria.QQuebraSetor.First;
end;

procedure TFProducaoReposicao.FormCreate(Sender: TObject);
begin
  wTipo := 'REPOSICAO';
  wQuery := DmVidracaria.QQuebraSetor;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

end.
