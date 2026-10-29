unit URPA_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRPA = class(TDataModule)
    QRPA: TOracleDataSet1;
    QRPANUM_RPA: TIntegerField;
    QRPAVAL_RPA: TFloatField;
    QRPACOD_NOTA_CAB: TIntegerField;
    QRPADT_EMISSAO: TDateTimeField;
    QRPADESC_LOCALIDADE: TStringField;
    QRPADESC_ORIGEM: TStringField;
    QRPADESC_DESTINO: TStringField;
    QRPACOD_MOTORISTA: TIntegerField;
    QRPAVAL_SEST_SENAT: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRPA: TDMRPA;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
