unit UAnp_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMAnp = class(TDataModule)
    QAnpCons: TOracleDataSet1;
    QAnpConsCOD_ANP: TStringField;
    QAnpConsDESC_ANP: TStringField;
    QAnp: TOracleDataSet1;
    QAnpCOD_ANP: TStringField;
    QAnpDESC_ANP: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAnp: TDMAnp;

implementation

{$R *.dfm}

end.
