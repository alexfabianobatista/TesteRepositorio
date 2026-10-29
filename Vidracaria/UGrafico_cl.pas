unit UGrafico_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMGrafico = class(TDataModule)
    QGraficoVendedor: TOracleDataSet1;
    QVendedorCons: TOracleDataSet1;
    QVendedorConsNOME: TStringField;
    DSVendedorCons: TDataSource;
    QGraficoVendedorNOME: TStringField;
    QGraficoVendedorVAL_VENDAS: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGrafico: TDMGrafico;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
