unit UEstimativaProduto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMEstimativaProduto = class(TDataModule)
    QEstimativaProduto: TOracleDataSet1;
    QEstimativaProdutoCOD_ESTIMATIVA_PRODUTO: TIntegerField;
    QEstimativaProdutoCOD_PRODUTO: TIntegerField;
    QEstimativaProdutoCOD_PLANTIO_SAFRA: TIntegerField;
    QEstimativaProdutoCons: TOracleDataSet1;
    QEstimativaProdutoConsCOD_ESTIMATIVA_PRODUTO: TIntegerField;
    QEstimativaProdutoConsCOD_PRODUTO: TIntegerField;
    QEstimativaProdutoConsCOD_PLANTIO_SAFRA: TIntegerField;
    QEstimativaProdutoQT_ESTIMATIVA: TFloatField;
    QEstimativaProdutoConsQT_ESTIMATIVA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEstimativaProduto: TDMEstimativaProduto;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
