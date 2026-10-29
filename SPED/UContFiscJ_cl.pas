unit UContFiscJ_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMContFiscJ = class(TDataModule)
    QReg050: TOracleDataSet1;
    QReg050COD_NAT: TStringField;


    QReg050IND_CTA: TStringField;
    QReg050NIVEL: TIntegerField;
    QReg050COD_CTA: TStringField;
    QReg050CTA: TStringField;
    QReg050NUM_GRAUS_CONTABIL: TIntegerField;
    QReg050COD_PLANO_CONTA_REFERENCIAL: TIntegerField;
    QReg050COD_REDUZIDO: TIntegerField;
    QReg051: TOracleDataSet1;
    QReg050COD_PLANO_CONTA: TIntegerField;
    QReg051COD_CCUS: TStringField;
    QReg051COD_CTA_REF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContFiscJ: TDMContFiscJ;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
