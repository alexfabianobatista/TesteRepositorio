unit UContFiscK_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContFiscK = class(TDataModule)
    QReg155: TOracleDataSet1;
    QReg155COD_PLANO_CONTA: TIntegerField;
    QReg155COD_CTA: TStringField;
    QReg155VL_SLD_INI: TFloatField;
    QReg155IND_VL_SLD_INI: TStringField;
    QReg155VL_DEB: TFloatField;
    QReg155VL_CRED: TFloatField;
    QReg155VL_SLD_FIN: TFloatField;
    QReg155IND_VL_SLD_FIN: TStringField;
    QReg355: TOracleDataSet1;
    QReg355COD_CTA: TStringField;
    QReg355COD_CCUS: TStringField;
    QReg355VL_SLD_FIN: TFloatField;
    QReg355IND_VL_SLD_FIN: TStringField;
    QReg030: TOracleDataSet1;
    QReg155DESC_PLANO_CONTA_REFERENCIAL: TStringField;
    QReg355COD_PLANO_CONTA: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFiscK: TDMContFiscK;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
