unit UPraca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMPraca = class(TDataModule)
    QPracaCons: TOracleDataSet1;
    QPracaConsDESC_CIDADE: TStringField;
    QPracaConsDESC_SIGLA: TStringField;
    QPracaConsIND_SITUACAO: TStringField;
    QPracaConsCOD_PRACA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPraca: TDMPraca;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
