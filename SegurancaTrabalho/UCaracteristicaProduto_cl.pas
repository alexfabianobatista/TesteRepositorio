unit UCaracteristicaProduto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCaracteristicaProduto = class(TDataModule)
    QCaracteristicaProduto: TOracleDataSet1;
    QCaracteristicaProdutoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QCaracteristicaProdutoDESC_CARACTERISTICA_PRODUTO: TStringField;
    QCaracteristicaProdutoCons: TOracleDataSet1;
    QCaracteristicaProdutoConsCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QCaracteristicaProdutoConsDESC_CARACTERISTICA_PRODUTO: TStringField;
    QRCaracteristicaProduto: TOracleDataSet1;
    QRCaracteristicaProdutoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QRCaracteristicaProdutoDESC_CARACTERISTICA_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCaracteristicaProduto: TDMCaracteristicaProduto;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
