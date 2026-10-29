unit UDmCidade;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmCidade = class(TDataModule)
    QSelCidade: TIBQuery;
    QSelCidadeCODCIDADE: TIntegerField;
    QSelCidadeDSCCIDADE: TIBStringField;
    QSelCidadeCODESTADO: TIntegerField;
    QSelCidadeDSCESTADO: TIBStringField;
    QSelCidadeDSCCIDADEESTADO: TIBStringField;
    DsSelCidade: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmCidade: TDmCidade;

implementation

{$R *.dfm}

end.
