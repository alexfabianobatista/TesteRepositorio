unit UCultivar_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCultivar = class(TDataModule)
    QCultivar: TOracleDataSet1;
    QCultivarCOD_CULTIVAR: TIntegerField;
    QCultivarDESC_CULTIVAR: TStringField;
    QCultivarCons: TOracleDataSet1;
    QCultivarConsCOD_CULTIVAR: TIntegerField;
    QCultivarConsDESC_CULTIVAR: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCultivar: TDMCultivar;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
