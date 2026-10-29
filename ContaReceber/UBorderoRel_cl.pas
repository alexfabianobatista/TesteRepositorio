unit UBorderoRel_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, UOracle_cl;

type
  TDMBorderoRel = class(TDataModule)
    QRBordero: TOracleDataSet1;
    QRBorderoCOD_BORDERO: TIntegerField;
    QRBorderoVAL_JUROS: TFloatField;
    QRBorderoDT_BORDERO: TDateTimeField;
    QRBorderoIND_SITUACAO: TStringField;
    QRBorderoDESC_CONTA_CORRENTE: TStringField;
    QRBorderoNUM_TITULO: TFloatField;
    QRBorderoNUM_PARCELA: TIntegerField;
    QRBorderoVAL_TITULO: TFloatField;
    QRBorderoNOME: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBorderoRel: TDMBorderoRel;

implementation

{$R *.dfm}

end.
