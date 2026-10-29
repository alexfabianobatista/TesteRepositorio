unit UGraficoVendaVendedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DbChart;

type
  TFGraficoVendaVendedor = class(TForm)
    DBChart1: TDBChart;
    DataSource1: TDataSource;
    Series1: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraficoVendaVendedor: TFGraficoVendaVendedor;

implementation

uses UGrafico_cl;

{$R *.dfm}

end.
