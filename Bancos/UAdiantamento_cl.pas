unit UAdiantamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMAdiantamento = class(TDataModule)
    QAdiantamentoCons: TOracleDataSet1;
    QAdiantamentoConsVALOR: TFloatField;
    QAdiantamentoConsDOCUMENTO: TFloatField;
    QAdiantamentoConsCOD_ADIANTAMENTO: TFloatField;
    QAdiantamentoConsNOME: TStringField;
    QAdiantamentoConsTIPO_DOCUMENTO: TStringField;
    QRAdiantamento: TOracleDataSet1;
    QRAdiantamentoNUM_DOC: TFloatField;
    QRAdiantamentoVAL_MOVIMENTO: TFloatField;
    QRAdiantamentoDT_MOVIMENTO: TDateTimeField;
    QRAdiantamentoNOME: TStringField;
    QRAdiantamentoBaixa: TOracleDataSet1;
    QRAdiantamentoVAL_BAIXADO: TFloatField;
    QRAdiantamentoVAL_SALDO: TFloatField;
    QRAdiantamentoBaixaCOD_ADIANTAMENTO: TFloatField;
    QRAdiantamentoBaixaNUM_DOC: TFloatField;
    QRAdiantamentoBaixaVAL_MOVIMENTO: TFloatField;
    QRAdiantamentoBaixaDT_MOVIMENTO: TDateTimeField;
    QRAdiantamentoBaixaNOME: TStringField;
    QRAdiantamentoBaixaVAL_BAIXADO: TFloatField;
    QRAdiantamentoBaixaDT_BAIXA: TDateTimeField;
    QRAdiantamentoVAL_JUROS: TFloatField;
    QAdiantamentoConsSALDO: TFloatField;
    QRAdiantamentoBaixaDESC_BAIXA: TStringField;
    QRAdiantamentoBaixaNUMERO: TFloatField;
    QRAdiantamentoIND_BANCO_CAIXA: TStringField;
    QAdiantamentoConsVAL_BAIXADO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMAdiantamento: TDMAdiantamento;

implementation

uses UOracle_cl;

{$R *.DFM}

end.
