unit UCalculaDigito_cl;

interface

uses
  SysUtils, Classes, DB, OracleData;

type
  TDMCalculaDigito = class(TDataModule)
    QCalculaDigito: TOracleDataSet;
    QCalculaDigitoNUMERO: TFloatField;
    QCalculaDigitoEMAIL: TStringField;
    QCalculaDigitoTELEFONE: TStringField;
    QCalculaDigitoCOD_CALCULA_DIGITO: TIntegerField;
    QCalculaDigitoCons: TOracleDataSet;
    QCalculaDigitoConsCOD_CALCULA_DIGITO: TIntegerField;
    QCalculaDigitoConsNUMERO: TFloatField;
    QCalculaDigitoConsEMAIL: TStringField;
    QCalculaDigitoConsTELEFONE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCalculaDigito: TDMCalculaDigito;

implementation

uses
  UOracle_cl;

{$R *.dfm}

end.
