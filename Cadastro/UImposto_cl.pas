unit UImposto_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMImposto = class(TDataModule)
    QImposto: TOracleDataSet1;
    QImpostoCOD_IMPOSTO: TIntegerField;
    QImpostoCOD_FINALIDADE: TIntegerField;
    QImpostoCONTA_CREDITO: TStringField;
    QImpostoCONTA_DEBITO: TStringField;
    QImpostoDESC_IMPOSTO: TStringField;
    QImpostoCons: TOracleDataSet1;
    QImpostoConsCOD_IMPOSTO: TIntegerField;
    QImpostoConsCOD_FINALIDADE: TIntegerField;
    QImpostoConsCONTA_CREDITO: TStringField;
    QImpostoConsCONTA_DEBITO: TStringField;
    QImpostoConsDESC_IMPOSTO: TStringField;
    QImpostoPERC_ALIQUOTA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMImposto: TDMImposto;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
