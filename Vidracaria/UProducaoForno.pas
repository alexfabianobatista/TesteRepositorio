unit UProducaoForno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, Grids, DBGrids, StdCtrls, Buttons;

type
  TFProducaoForno = class(TFTProducao)
    SBVisualizar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure SBVisualizarClick(Sender: TObject);
    procedure EPecaChange(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaLista(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FProducaoForno: TFProducaoForno;
  wAux : integer = 0;
implementation

uses UVidracaria_cl, UOracle_cl, UMostraImagem, UParamSistema_cl;

{$R *.dfm}

procedure TFProducaoForno.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QForno.Close;
  DmVidracaria.QForno.SetVariable('DT_FORNO', DMOracle.DataServ);
  DmVidracaria.QForno.Open;
  DmVidracaria.QForno.First;
end;

procedure TFProducaoForno.FormCreate(Sender: TObject);
begin
  wTipo := 'FORNO';
  wQuery := DmVidracaria.QForno;
  OnAcaoReload := AtualizaLista;
  inherited;

end; 

procedure TFProducaoForno.SBVisualizarClick(Sender: TObject);
begin
  inherited;
  if FMostraImagem = nil then
    FMostraImagem := TFMostraImagem.Create(Application);
  FMostraImagem.ShowModal;
end;

procedure TFProducaoForno.EPecaChange(Sender: TObject);
var
wPeca,wPedidoItem : string;
begin
  if ((DMParamSistema.QParamSistemaDESC_EMPRESA.Text = 'MERCURIO VIDROS') and (Trim(EPeca.Text) <> '')) then
  Begin
    wPedidoItem := '0'+DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM','NUM_FABRICANTE='+COPY(EPeca.Text,1,6));
    if wPedidoItem <> '0' then
      wPeca := FormatFloat('000000',StrToFloat(DMOracle.BuscaNome('SELECT COD_PECA FROM TB_MATERIAL','COD_PEDIDO_ITEM='+wPedidoItem)));
    if wPeca <> '' then
      EPeca.Text := wPeca + '990010';
  end;
  inherited;

end;

end.
