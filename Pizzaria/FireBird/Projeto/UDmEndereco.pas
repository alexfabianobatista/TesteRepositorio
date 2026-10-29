unit UDmEndereco;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery;

type
  TDmEndereco = class(TDataModule)
    QSelEndereco: TIBQuery;
    DsSelEndereco: TDataSource;
    QSelEnderecoCODENDERECO: TIntegerField;
    QSelEnderecoDSCENDERECO: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmEndereco: TDmEndereco;

implementation

uses UDmSistema;

{$R *.dfm}

end.
