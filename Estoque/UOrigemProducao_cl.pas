unit UOrigemProducao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOrigemProducao = class(TDataModule)
    QOrigemProducao: TOracleDataSet1;
    QOrigemProducaoCOD_ORIGEM_PRODUCAO: TIntegerField;
    QOrigemProducaoDESC_ORIGEM_PRODUCAO: TStringField;
    QOrigemProducaoCons: TOracleDataSet1;
    QOrigemProducaoConsCOD_ORIGEM_PRODUCAO: TIntegerField;
    QOrigemProducaoConsDESC_ORIGEM_PRODUCAO: TStringField;
    QOrigemProducaoIND_OPERACAO: TStringField;
    QOrigemProducaoConsIND_OPERACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOrigemProducao: TDMOrigemProducao;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
