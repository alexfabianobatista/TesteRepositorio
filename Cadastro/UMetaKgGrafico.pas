unit UMetaKgGrafico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Series, TeEngine, ExtCtrls, TeeProcs, Chart, DbChart;

type
  TFMetaKgGrafico = class(TForm)
    DBChart1: TDBChart;
    Series1: TPieSeries;
    Series3: TBarSeries;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMetaKgGrafico: TFMetaKgGrafico;

implementation

uses UVendedor_cl;

{$R *.dfm}

procedure TFMetaKgGrafico.FormActivate(Sender: TObject);
begin
  with DMVendedor do
  begin
//    cdsMetasKg.Close;
//    cdsMetasKg.Params[0].AsInteger := QQuotaVendedorCOD_VENDEDOR.Value;
//    cdsMetasKg.Params[1].AsInteger := QQuotaVendedorNUM_ANO.Value;
//    cdsMetasKg.Params[2].AsInteger := QQuotaVendedorNUM_MES.Value;
//    cdsMetasKg.Params[3].AsDate := retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value);
//    cdsMetasKg.Params[4].AsDate := retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value);
//    cdsMetasKg.Params[5].AsInteger := QQuotaVendedorCOD_VENDEDOR_QUOTA.Value;
//    cdsMetasKg.Open;
    QMetaKGGrafico.Close;
    QMetaKGGrafico.SetVariable('VENDEDOR', QQuotaVendedorCOD_VENDEDOR.Value);
    QMetaKGGrafico.SetVariable('ANO', QQuotaVendedorNUM_ANO.Value);
    QMetaKGGrafico.SetVariable('MES', QQuotaVendedorNUM_MES.Value);
    QMetaKGGrafico.SetVariable('DT_INI', retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value));
    QMetaKGGrafico.SetVariable('DT_FIM', retornaData(QQuotaVendedorNUM_MES.Value,QQuotaVendedorNUM_ANO.Value));
    QMetaKGGrafico.SetVariable('CODIGO', QQuotaVendedorCOD_VENDEDOR_QUOTA.Value);
    QMetaKGGrafico.Open;
  end;
end;

end.
