unit UBlocoH_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMBlocoH = class(TDataModule)
    QReg005: TOracleDataSet1;
    QReg005VL_INV: TFloatField;
    QReg010: TOracleDataSet1;
    QReg010UNID: TStringField;
    QReg010QTD: TFloatField;
    QReg010VL_UNIT: TFloatField;
    QReg010VL_ITEM: TFloatField;
    QReg010COD_ITEM: TFloatField;
    QReg010COD_CONTABIL_INVENTARIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBlocoH: TDMBlocoH;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
