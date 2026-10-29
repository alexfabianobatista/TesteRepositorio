unit UComissao_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMComissao = class(TDataModule)
    QComissao: TOracleDataSet1;
    QComissaoCOD_COMISSAO: TIntegerField;
    QComissaoDESC_COMISSAO: TStringField;
    QComissaoCons: TOracleDataSet1;
    QComissaoConsCOD_COMISSAO: TIntegerField;
    QComissaoConsDESC_COMISSAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMComissao: TDMComissao;

implementation

{$R *.dfm}

end.
