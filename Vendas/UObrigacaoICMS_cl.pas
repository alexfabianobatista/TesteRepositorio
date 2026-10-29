unit UObrigacaoICMS_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMObrigacaoICMS = class(TDataModule)
    QObrigacaoICMSCons: TOracleDataSet1;
    QObrigacaoICMSConsCOD_OBRIGACAO_ICMS: TStringField;
    QObrigacaoICMSConsDESC_OBRIGACAO_ICMS: TStringField;
    QObrigacaoICMSConsDESC_COMPLETA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMObrigacaoICMS: TDMObrigacaoICMS;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
