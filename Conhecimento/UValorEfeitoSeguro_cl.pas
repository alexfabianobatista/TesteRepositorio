unit UValorEfeitoSeguro_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMValorEfeitoSeguro = class(TDataModule)
    QValorEfeitoSeguroCad: TOracleDataSet1;
    QValorEfeitoSeguroCadCOD_VALOR_EFEITO_SEGURO: TIntegerField;
    QValorEfeitoSeguroCadCOD_PRODUTO: TIntegerField;
    QValorEfeitoSeguroCadDT_REFERENCIA: TDateTimeField;
    QValorEfeitoSeguroCadVAL_EFEITO_SEGURO: TFloatField;
    QValorEfeitoSeguroCaddesc_produto: TStringField;
    QValorEfeitoSeguroCons: TOracleDataSet1;
    QValorEfeitoSeguroConsCOD_VALOR_EFEITO_SEGURO: TIntegerField;
    QValorEfeitoSeguroConsDT_REFERENCIA: TDateTimeField;
    QValorEfeitoSeguroConsVAL_EFEITO_SEGURO: TFloatField;
    QValorEfeitoSeguroConsDESC_PRODUTO: TStringField;
    procedure QValorEfeitoSeguroCadAfterInsert(DataSet: TDataSet);
    procedure QValorEfeitoSeguroCadCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMValorEfeitoSeguro: TDMValorEfeitoSeguro;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMValorEfeitoSeguro.QValorEfeitoSeguroCadAfterInsert(
  DataSet: TDataSet);
begin
//     QValorEfeitoSeguroCadDT_REFERENCIA.Value := now;
end;

procedure TDMValorEfeitoSeguro.QValorEfeitoSeguroCadCalcFields(
  DataSet: TDataSet);
begin
  QValorEfeitoSeguroCaddesc_produto.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                    'COD_PRODUTO = ' + IntToStr(QValorEfeitoSeguroCadCOD_PRODUTO.Value));
end;

end.
