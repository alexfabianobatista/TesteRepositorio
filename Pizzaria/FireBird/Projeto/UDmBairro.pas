unit UDmBairro;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmBairro = class(TDataModule)
    QSelBairro: TIBQuery;
    DsSelBairro: TDataSource;
    QSelBairroCODBAIRRO: TIntegerField;
    QSelBairroDSCBAIRRO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmBairro: TDmBairro;

implementation

{$R *.dfm}

end.
