unit UTravamento_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMTravamento = class(TDataModule)
    QTravamentoCons: TOracleDataSet1;
    QTravamentoConsORACLE_USERNAME: TStringField;
    QTravamentoConsOS_USER_NAME: TStringField;
    QTravamentoConsPROGRAM: TStringField;
    QTravamentoConsOBJECT_NAME: TStringField;
    QTravamentoConsOBJECT_TYPE: TStringField;
    QTravamentoConsSID: TFloatField;
    QTravamentoConsSERIAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTravamento: TDMTravamento;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
