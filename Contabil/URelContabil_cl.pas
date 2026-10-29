unit URelContabil_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMRelContabil = class(TDataModule)
    QRSaldo: TOracleDataSet1;
    QRSaldoCREDITO: TFloatField;
    QRSaldoDEBITO: TFloatField;
    QRSaldoContabil: TOracleDataSet1;
    QRSaldoContabilDT_LANCAMENTO: TDateTimeField;
    QRSaldoContabilDESC_COMPLEMENTO: TStringField;
    QRSaldoContabilVAL_LANCAMENTO: TFloatField;
    QRSaldoContabilIND_OPERACAO: TStringField;
    QRSaldoContabilVAL_CALCULO: TFloatField;
    QRSaldoContabilNUM_CONTRAPARTIDA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelContabil: TDMRelContabil;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
