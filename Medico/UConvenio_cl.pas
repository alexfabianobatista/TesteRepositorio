unit UConvenio_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMConvenio = class(TDataModule)
    QConvenio: TOracleDataSet1;
    QConvenioCOD_CONVENIO: TIntegerField;
    QConvenioDESC_CONVENIO: TStringField;
    QConvenioCons: TOracleDataSet1;
    QConvenioConsCOD_CONVENIO: TIntegerField;
    QConvenioConsDESC_CONVENIO: TStringField;
    QRConvenio: TOracleDataSet1;
    QRConvenioCOD_CONVENIO: TIntegerField;
    QRConvenioDESC_CONVENIO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConvenio: TDMConvenio;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
