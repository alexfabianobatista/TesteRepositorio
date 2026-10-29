unit UFinanciamento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient;

type
  TDMFinanciamento = class(TDataModule)
    QFinanciamentoCab: TOracleDataSet1;
    QFinanciamentoCabCOD_BANCO_AGENCIA: TIntegerField;
    QFinanciamentoCabDT_EMISSAO: TDateTimeField;
    QFinanciamentoCabDESC_FINANCIAMENTO: TStringField;
    QFinanciamentoCabDESC_OBS: TStringField;
    QFinanciamentoCabCOD_FINANCIAMENTO_CAB: TIntegerField;
    QFinanciamentoParc: TOracleDataSet1;
    QFinanciamentoParcCOD_FINANCIAMENTO_PARC: TIntegerField;
    QFinanciamentoParcCOD_FINANCIAMENTO_CAB: TIntegerField;
    QFinanciamentoParcDT_VENCIMENTO: TDateTimeField;
    QFinanciamentoParcVAL_PARCELA: TFloatField;
    QFinanciamentoParcIND_SITUACAO: TStringField;
    QFinanciamentoParcDT_BAIXA: TDateTimeField;
    QFinanciamentoParcVAL_JURO: TFloatField;
    QFinanciamentoCons: TOracleDataSet1;
    QFinanciamentoConsCOD_FINANCIAMENTO_CAB: TIntegerField;
    QFinanciamentoConsCOD_BANCO_AGENCIA: TIntegerField;
    QFinanciamentoConsDT_EMISSAO: TDateTimeField;
    QFinanciamentoConsDESC_FINANCIAMENTO: TStringField;
    CDSGerarParcelas: TClientDataSet;
    CDSGerarParcelasDT_VENCIMENTO: TDateField;
    CDSGerarParcelasVL_PARCELA: TFloatField;
    procedure QFinanciamentoCabAfterInsert(DataSet: TDataSet);
    procedure QFinanciamentoParcAfterInsert(DataSet: TDataSet);
    procedure QFinanciamentoParcBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFinanciamento: TDMFinanciamento;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMFinanciamento.QFinanciamentoCabAfterInsert(DataSet: TDataSet);
begin
  QFinanciamentoCabDT_EMISSAO.Value := date;
end;

procedure TDMFinanciamento.QFinanciamentoParcAfterInsert(
  DataSet: TDataSet);
begin
  QFinanciamentoParcIND_SITUACAO.Value := 'A';
end;

procedure TDMFinanciamento.QFinanciamentoParcBeforeInsert(
  DataSet: TDataSet);
begin
  QFinanciamentoCab.Post;
  QFinanciamentoCab.Edit;
end;

end.
