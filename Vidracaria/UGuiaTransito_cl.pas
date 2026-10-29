unit UGuiaTransito_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMGuiaTransito = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGuiaTransito: TDMGuiaTransito;

implementation

uses UOracle_cl;

{$R *.dfm}

end.
