unit UMarcaPneu_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMMarcaPneu = class(TDataModule)
    QMarcaPneu: TOracleDataSet1;
    QMarcaPneuCOD_MARCA_PNEU: TIntegerField;
    QMarcaPneuDESC_MARCA_PNEU: TStringField;
    QMarcaPneuCons: TOracleDataSet1;
    QMarcaPneuConsCOD_MARCA_PNEU: TIntegerField;
    QMarcaPneuConsDESC_MARCA_PNEU: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMMarcaPneu: TDMMarcaPneu;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
