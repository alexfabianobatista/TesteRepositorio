unit UPrazoVencimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMPrazoVencimento = class(TDataModule)
    QPrazoVencimento: TOracleDataSet1;
    QPrazoVencimentoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoDESC_PRAZO_VENCIMENTO: TStringField;
    QPrazoVencimentoNUM_PARCELAS: TIntegerField;
    QPrazoVencimentoDias: TOracleDataSet1;
    QPrazoVencimentoDias_Cons: TOracleDataSet1;
    DSPrazoVencimentoDias_Cons: TDataSource;
    DSPrazoVencimentoDias: TDataSource;
    QPrazoVencimentoDiasCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoDias_ConsCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoDias_ConsNUM_DIAS: TIntegerField;
    QPrazoVencimento_Cons: TOracleDataSet1;
    QPrazoVencimento_ConsCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimento_ConsDESC_PRAZO_VENCIMENTO: TStringField;
    QPrazoVencimento_ConsNUM_PARCELAS: TIntegerField;
    QPrazoVencimentoIND_SITUACAO: TStringField;
    QPrazoVencimentoNUM_DIAS_CARENCIA1: TIntegerField;
    QPrazoVencimentoNUM_DIAS_CARENCIA2: TIntegerField;
    QPrazoVencimentoNUM_DIAS_CARENCIA3: TIntegerField;
    QPrazoVencimentoNUM_DIAS_CARENCIA4: TIntegerField;
    QPrazoVencimentoNUM_DIAS_CARENCIA5: TIntegerField;
    QPrazoVencimentoNUM_DIAS_CARENCIA6: TIntegerField;
    QPrazoVencimentoNUM_DIAS_CARENCIA7: TIntegerField;
    QPrazoVencimentoPERC_CARENCIA1: TFloatField;
    QPrazoVencimentoPERC_CARENCIA2: TFloatField;
    QPrazoVencimentoPERC_CARENCIA3: TFloatField;
    QPrazoVencimentoPERC_CARENCIA4: TFloatField;
    QPrazoVencimentoPERC_CARENCIA5: TFloatField;
    QPrazoVencimentoPERC_CARENCIA6: TFloatField;
    QPrazoVencimentoPERC_CARENCIA7: TFloatField;
    QPrazoVencimentoPERC_DESCONTO: TFloatField;
    QPrazoVencimentoIND_ENTRADA: TStringField;
    QRPrazoVencimento: TOracleDataSet1;
    QRPrazoVencimentoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QRPrazoVencimentoDESC_PRAZO_VENCIMENTO: TStringField;
    QRPrazoVencimentoNUM_PARCELAS: TIntegerField;
    QPrazoVencimentoNUM_PRAZO_MAXIMO: TIntegerField;
    QPrazoVencimentoIND_TIPO_PAGTO: TStringField;
    QPrazoVencimentoVAL_MINIMO_VENDA: TFloatField;
    QPrazoVencimentoIND_FORA_MES: TStringField;
    QPrazoVencimentoDiasNUM_DIAS: TIntegerField;
    procedure QPrazoVencimentoDiasAfterInsert(DataSet: TDataSet);
    procedure QPrazoVencimentoDiasAfterPost(DataSet: TDataSet);
    procedure QPrazoVencimentoAfterDelete(DataSet: TDataSet);
    procedure QPrazoVencimentoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMPrazoVencimento: TDMPrazoVencimento;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMPrazoVencimento.QPrazoVencimentoDiasAfterInsert(
  DataSet: TDataSet);
begin
  QPrazoVencimentoDiasCod_Prazo_Vencimento.Value := QPrazoVencimentoCod_Prazo_Vencimento.Value;
end;

procedure TDMPrazoVencimento.QPrazoVencimentoDiasAfterPost(
  DataSet: TDataSet);
begin
  QPrazoVencimentoDias_Cons.Close;
  QPrazoVencimentoDias_Cons.Open;
end;

procedure TDMPrazoVencimento.QPrazoVencimentoAfterDelete(
  DataSet: TDataSet);
begin
    DMPrazoVencimento.QPrazoVencimentoDias_Cons.Close;
    DMPrazoVencimento.QPrazoVencimentoDias_Cons.Open;
end;

procedure TDMPrazoVencimento.QPrazoVencimentoAfterInsert(
  DataSet: TDataSet);
begin
  QPrazoVencimentoIND_SITUACAO.Value := 'ATIVO';
  QPrazoVencimentoIND_FORA_MES.Value := 'N';
end;

end.
