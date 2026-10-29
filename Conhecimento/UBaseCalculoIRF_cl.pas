unit UBaseCalculoIRF_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMIRF = class(TDataModule)
    QBaseCalcIRF: TOracleDataSet1;
    QlistaBaseCalc: TOracleDataSet1;
    DSListaBaseCalc: TDataSource;
    QCalculaSaldo: TOracleDataSet1;
    QBaseCalcIRFCOD_BASE_CALC: TIntegerField;
    QBaseCalcIRFVAL_BASE_CALC: TFloatField;
    QBaseCalcIRFVAL_BASE_CALC_1: TFloatField;
    QBaseCalcIRFALIQUOTA: TFloatField;
    QBaseCalcIRFVAL_DEDUCAO: TFloatField;
    QBaseCalcIRFCOD_OPCAO: TIntegerField;
    QlistaBaseCalcCOD_BASE_CALC: TIntegerField;
    QlistaBaseCalcVAL_BASE_CALC: TFloatField;
    QlistaBaseCalcVAL_BASE_CALC_1: TFloatField;
    QlistaBaseCalcALIQUOTA: TFloatField;
    QlistaBaseCalcVAL_DEDUCAO: TFloatField;
    QlistaBaseCalcCOD_OPCAO: TIntegerField;
    QCalculaIRFPago: TOracleDataSet1;
    QCalculaSaldoSALDO: TFloatField;
    QCalculaSaldoSALDO_SERVICO: TFloatField;
    QCalculaIRFPagoSALDO_IRF: TFloatField;
    QCalculaIRFPagoSALDO_IRF_SERVICO: TFloatField;
    procedure QBaseCalcIRFAfterPost(DataSet: TDataSet);
    procedure QBaseCalcIRFAfterDelete(DataSet: TDataSet);
    procedure QBaseCalcIRFAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMIRF: TDMIRF;

implementation

uses UOracle_cl, UIRFCad;

{$R *.DFM}

procedure TDMIRF.QBaseCalcIRFAfterPost(DataSet: TDataSet);
begin
  DMIRF.QListaBaseCalc.Close;
  DMIRF.QListaBaseCalc.Open;
end;

procedure TDMIRF.QBaseCalcIRFAfterDelete(DataSet: TDataSet);
begin
  DMIRF.QListaBaseCalc.Close;
  DMIRF.QListaBaseCalc.Open;
end;

procedure TDMIRF.QBaseCalcIRFAfterEdit(DataSet: TDataSet);
begin
  DMIRF.QListaBaseCalc.Close;
  DMIRF.QListaBaseCalc.Open;
  FBaseCalcIRFCad.DBRGOpcoes.OnClick(self);
end;

end.
