unit UDoenca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMDoenca = class(TDataModule)
    QDoenca: TOracleDataSet1;
    QDoencaCOD_DOENCA: TIntegerField;
    QDoencaDESC_DOENCA: TStringField;
    QDoencaCons: TOracleDataSet1;
    QDoencaConsCOD_DOENCA: TIntegerField;
    QDoencaConsDESC_DOENCA: TStringField;
    QRDoenca: TOracleDataSet1;
    QRDoencaCOD_DOENCA: TIntegerField;
    QRDoencaDESC_DOENCA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDoenca: TDMDoenca;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
