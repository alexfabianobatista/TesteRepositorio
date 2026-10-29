unit UFluxoCaixa_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMFluxoCaixa = class(TDataModule)
    QFluxoCaixaSaldo: TOracleDataSet1;
    QFluxoCaixaSaldoCOD_FLUXO_CAIXA_SALDO: TIntegerField;
    QFluxoCaixaSaldoCOD_FILIAL: TIntegerField;
    QFluxoCaixaSaldoCOD_DEPARTAMENTO: TIntegerField;
    QFluxoCaixaSaldoVAL_SALDO: TFloatField;
    QFluxoCaixaSaldoDESC_OBSERVACAO: TStringField;
    QFluxoCaixaSaldoDT_FLUXO_CAIXA_SALDO: TDateTimeField;
    QFluxoCaixaSaldodesc_filial: TStringField;
    QFluxoCaixaSaldodesc_departamento: TStringField;
    QFluxoCaixaSaldoCons: TOracleDataSet1;
    QFluxoCaixaSaldoConsCOD_FILIAL: TIntegerField;
    QFluxoCaixaSaldoConsCOD_DEPARTAMENTO: TIntegerField;
    QFluxoCaixaSaldoConsVAL_SALDO: TFloatField;
    QFluxoCaixaSaldoConsDT_FLUXO_CAIXA_SALDO: TDateTimeField;
    QFluxoCaixaSaldoConsDESC_FILIAL: TStringField;
    QFluxoCaixaSaldoConsDESC_DEPARTAMENTO: TStringField;
    QFluxoCaixaSaldoConsCOD_FLUXO_CAIXA_SALDO: TIntegerField;
    QRFluxoCaixa: TOracleDataSet1;
    QRFluxoCaixaDT_VENCIMENTO: TDateTimeField;
    QRFluxoCaixaSVAL_RECEBER: TFloatField;
    QRFluxoCaixaSVAL_PAGAR: TFloatField;
    QSaldoFluxoCaixa_Dt: TOracleDataSet1;
    QSaldoFluxoCaixa_DtCOD_FLUXO_CAIXA_SALDO: TIntegerField;
    QSaldoFluxoCaixa_DtCOD_FILIAL: TIntegerField;
    QSaldoFluxoCaixa_DtCOD_DEPARTAMENTO: TIntegerField;
    QSaldoFluxoCaixa_DtVAL_SALDO: TFloatField;
    QSaldoFluxoCaixa_DtDESC_OBSERVACAO: TStringField;
    QSaldoFluxoCaixa_DtDT_FLUXO_CAIXA_SALDO: TDateTimeField;
    QFluxoCaixaSaldoVAL_PAGAR: TFloatField;
    QFluxo_Caixa: TOracleDataSet1;
    QFluxo_CaixaCOD_FLUXO_CAIXA: TIntegerField;
    QFluxo_CaixaCOD_FILIAL: TIntegerField;
    QFluxo_CaixaCOD_DEPARTAMENTO: TIntegerField;
    QFluxo_CaixaDT_FLUXO_CAIXA: TDateTimeField;
    QFluxo_CaixaVAL_FLUXO_CAIXA: TFloatField;
    QFluxo_Caixadesc_filial: TStringField;
    QFluxo_Caixadesc_departamento: TStringField;
    QFluxo_CaixaVAL_PAGAR: TFloatField;
    QFluxo_Caixa_Cons: TOracleDataSet1;
    QFluxo_Caixa_ConsCOD_FLUXO_CAIXA: TIntegerField;
    QFluxo_Caixa_ConsCOD_FILIAL: TIntegerField;
    QFluxo_Caixa_ConsCOD_DEPARTAMENTO: TIntegerField;
    QFluxo_Caixa_ConsDT_FLUXO_CAIXA: TDateTimeField;
    QFluxo_Caixa_ConsVAL_FLUXO_CAIXA: TFloatField;
    QRMovimento: TOracleDataSet1;
    QRMovimentoCOD_FILIAL: TIntegerField;
    QRMovimentoCOD_DEPARTAMENTO: TIntegerField;
    QRMovimentoDT_FLUXO_CAIXA: TDateTimeField;
    QRMovimentoVAL_FLUXO_CAIXA: TFloatField;
    QRMovimentoVAL_PAGAR: TFloatField;
    QRFluxoCaixaAnalit: TOracleDataSet1;
    QRFluxoCaixaAnalitDT_VENCIMENTO: TDateTimeField;
    QRFluxoCaixaAnalitDT_EMISSAO: TDateTimeField;
    QRFluxoCaixaAnalitCOD_CADASTRO: TFloatField;
    QRFluxoCaixaAnalitNOME: TStringField;
    QRFluxoCaixaAnalitVAL_RECEBER: TFloatField;
    QRFluxoCaixaAnalitVAL_PAGAR: TFloatField;
    QFluxo_CaixaDESC_OBSERVACAO: TStringField;
    QRMovimentoDESC_OBSERVACAO: TStringField;
    QRMovimentoDESC_DEPARTAMENTO: TStringField;
    QFluxoCaixaSaldoConsDESC_OBSERVACAO: TStringField;
    QFluxoCaixaSaldoConsVAL_PAGAR: TFloatField;
    QFluxo_Caixa_ConsVAL_PAGAR: TFloatField;
    QRFluxoCaixaAnalitCOD_DEPARTAMENTO: TFloatField;
    QRFluxoCaixaAnalitDESC_DEPARTAMENTO: TStringField;
    procedure QFluxoCaixaSaldoCalcFields(DataSet: TDataSet);
    procedure QFluxoCaixaSaldoAfterInsert(DataSet: TDataSet);
    procedure QFluxo_CaixaCalcFields(DataSet: TDataSet);
    procedure QFluxo_CaixaAfterInsert(DataSet: TDataSet);
    procedure QFluxo_CaixaBeforePost(DataSet: TDataSet);
    procedure QFluxoCaixaSaldoBeforePost(DataSet: TDataSet);
  private
    fSaldoAnterior : Real;
    { Private declarations }
  public
    Property pSaldoAnterior : Real Read fSaldoAnterior Write fSaldoAnterior;
    { Public declarations }
  end;

var
  DMFluxoCaixa: TDMFluxoCaixa;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMFluxoCaixa.QFluxoCaixaSaldoCalcFields(DataSet: TDataSet);
begin
  If Trim(QFluxoCaixaSaldoCOD_FILIAL.Text) <> '' Then
    QFluxoCaixaSaldodesc_filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(QFluxoCaixaSaldoCOD_FILIAL.Text));
  If Trim(QFluxoCaixaSaldoCOD_DEPARTAMENTO.Text) <> '' Then
    QFluxoCaixaSaldodesc_departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO  = '+Trim(QFluxoCaixaSaldoCOD_DEPARTAMENTO.Text));

end;

procedure TDMFluxoCaixa.QFluxoCaixaSaldoAfterInsert(DataSet: TDataSet);
begin
  QFluxoCaixaSaldoVal_Saldo.Value := 0;
  QFluxoCaixaSaldoVal_Pagar.Value := 0;
end;

procedure TDMFluxoCaixa.QFluxo_CaixaCalcFields(DataSet: TDataSet);
begin
  If Trim(QFluxo_CaixaCOD_FILIAL.Text) <> '' Then
    QFluxo_Caixadesc_filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+CHR(39)+Trim(QFluxo_CaixaCOD_FILIAL.Text)+CHR(39));
  If Trim(QFluxo_CaixaCOD_DEPARTAMENTO.Text) <> '' Then
    QFluxo_Caixadesc_departamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO  = '+CHR(39)+Trim(QFluxo_CaixaCOD_DEPARTAMENTO.Text)+CHR(39));

end;

procedure TDMFluxoCaixa.QFluxo_CaixaAfterInsert(DataSet: TDataSet);
begin
  QFluxo_CaixaVal_Fluxo_Caixa.Value := 0;
  QFluxo_CaixaVal_Pagar.Value := 0;
end;

procedure TDMFluxoCaixa.QFluxo_CaixaBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QFluxo_CaixaCOD_FILIAL.Text);
end;

procedure TDMFluxoCaixa.QFluxoCaixaSaldoBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QFluxoCaixaSaldoCOD_FILIAL.Text);
end;

end.
