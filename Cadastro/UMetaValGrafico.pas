unit UMetaValGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, TeEngine, ExtCtrls, TeeProcs, Chart, DbChart;

type
  TFMetaValGrafico = class(TForm)
    DBChart2: TDBChart;
    Series2: TPieSeries;
    Series4: TBarSeries;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMetaValGrafico: TFMetaValGrafico;

implementation

uses UVendedor_cl;

{$R *.dfm}

procedure TFMetaValGrafico.FormActivate(Sender: TObject);
begin
  with DMVendedor do
  begin
    QMetaValGrafico.Close();
    QMetaValGrafico.SetVariable('VENDEDOR',QQuotaVendedorCOD_VENDEDOR.Value);
    QMetaValGrafico.SetVariable('ANO',QQuotaVendedorNUM_ANO.Value);
    QMetaValGrafico.SetVariable('MES',QQuotaVendedorNUM_MES.Value);
    QMetaValGrafico.SetVariable('DT_INI',retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value));
    QMetaValGrafico.SetVariable('DT_FIM',retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value));
    QMetaValGrafico.SetVariable('CODIGO',QQuotaVendedorCOD_VENDEDOR_QUOTA.Value);
    QMetaValGrafico.Open();
  end;
end;

end.
