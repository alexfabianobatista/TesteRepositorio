unit ULinhaProducao_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMLinhaProducao = class(TDataModule)
    QLinhaProducao: TOracleDataSet1;
    QLinhaProducaoCOD_LINHA_PRODUCAO: TIntegerField;
    QLinhaProducaoDESC_LINHA_PRODUCAO: TStringField;
    QLinhaProducaoCons: TOracleDataSet1;
    QLinhaProducaoConsCOD_LINHA_PRODUCAO: TIntegerField;
    QLinhaProducaoConsDESC_LINHA_PRODUCAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLinhaProducao: TDMLinhaProducao;

implementation

{$R *.dfm}

end.
