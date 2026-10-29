unit UDiasUteis_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMDiasUteis = class(TDataModule)
    QDiasUteis: TOracleDataSet1;
    QDiasUteisDIAS_UTEIS: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDiasUteis: TDMDiasUteis;

implementation

uses UOracle_cl, UDiasUteis;

{$R *.DFM}

end.
