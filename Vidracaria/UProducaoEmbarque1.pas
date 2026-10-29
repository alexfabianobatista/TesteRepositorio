unit UProducaoEmbarque1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTProducao, DB, StdCtrls, Grids, DBGrids, Buttons;

type
  TFProducaoEmbarque1 = class(TFTProducao)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizaLista(Sender: TObject);
  public
    { Public declarations }
  end;

var
  FProducaoEmbarque1: TFProducaoEmbarque1;

implementation

uses UVidracaria_cl, UOracle_cl;

{$R *.dfm}

procedure TFProducaoEmbarque1.AtualizaLista(Sender: TObject);
var
  wRecNo: integer;
begin
  DmVidracaria.QEmbarque.Close;
  DmVidracaria.QEmbarque.SetVariable('DT_EMBARQUE', DMOracle.DataServ);
  DmVidracaria.QEmbarque.Open;
  DmVidracaria.QEmbarque.First;
end;

procedure TFProducaoEmbarque1.FormCreate(Sender: TObject);
begin
  wTipo := 'EMBARQUE';
  wQuery := DmVidracaria.QEmbarque;
  OnAcaoReload := AtualizaLista;
  inherited;

end;

end.
