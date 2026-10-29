unit UGupoFiscal_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMGupoFiscal = class(TDataModule)
    QGrupoFiscal: TOracleDataSet1;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGupoFiscal: TDMGupoFiscal;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
