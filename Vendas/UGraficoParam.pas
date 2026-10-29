unit UGraficoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Grids,
  DBGrids;

type
  TFGraficoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraficoParam: TFGraficoParam;

implementation

uses UGrafico_cl, UGraficoVendaVendedor;

{$R *.dfm}

procedure TFGraficoParam.FormActivate(Sender: TObject);
begin
  inherited;
  RGPreview.Visible := false;
  DMGrafico.QVendedorCons.Open;
  if DMGrafico.QVendedorCons.RecordCount = 0 then
  begin
    DMGrafico.QVendedorCons.Close;
    DMGrafico.QVendedorCons.Open;
  end;
end;

procedure TFGraficoParam.BitBtn1Click(Sender: TObject);
var
  i: Integer;
  nomes : String;
begin
  inherited;
  nomes := '(';
  for i:= 0 to DBGrid1.SelectedRows.Count - 1 do
  begin
   DBGrid1.DataSource.DataSet.GotoBookmark(Pointer(DBGrid1.SelectedRows.items[i]));
   nomes := nomes + chr(39) + DBGrid1.DataSource.DataSet.FieldByName('NOME').AsString + chr(39)+',';
  end;
  nomes[length(nomes)] := ')';

  with DMGrafico do
  begin
    QGraficoVendedor.Close;
    QGraficoVendedor.SetVariable('NOMES', nomes);
    QGraficoVendedor.Open;
  end;

  if FGraficoVendaVendedor = Nil then
    FGraficoVendaVendedor := TFGraficoVendaVendedor.Create(Application);
  FGraficoVendaVendedor.ShowModal;

end;

end.
