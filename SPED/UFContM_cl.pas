unit UFContM_cl;

interface

uses
  SysUtils, Classes, UOracle_cl, DB, OracleData, OraTeste;

type
  TDmFContM = class(TDataModule)
    QReg020: TOracleDataSet1;
    QReg020QUALI_PJ: TFloatField;
    QReg020FORM_APUR: TStringField;
    QReg020FORM_TRIBUT: TFloatField;
    QReg030: TOracleDataSet1;
    QReg025: TOracleDataSet1;
    QReg025COD_CTA: TStringField;
    QReg025COD_CCUS: TStringField;
    QReg025COD_CTA_REF: TStringField;
    QReg025VL_SLD_FIN_FC: TFloatField;
    QReg025IND_DC_FIN_FC: TStringField;
    QReg025VL_SLD_FIN_SOC: TFloatField;
    QReg025IND_DC_FIN_SOC: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmFContM: TDmFContM;

implementation

{$R *.dfm}

end.
