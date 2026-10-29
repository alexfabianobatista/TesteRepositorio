unit UPrazoVencimento_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste;

type
  TDMPrazoVencimento = class(TDataModule)
    QPrazoVencimentoDias_Cons: TOracleDataSet1;
    DSPrazoVencimentoDias_Cons: TDataSource;
    QPrazoVencimentoDias_ConsCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoDias_ConsNUM_DIAS: TIntegerField;
    QPrazoVencimento_Cons: TOracleDataSet1;
    QPrazoVencimento_ConsCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimento_ConsDESC_PRAZO_VENCIMENTO: TStringField;
    QPrazoVencimento_ConsNUM_PARCELAS: TIntegerField;
    QRPrazoVencimento: TOracleDataSet1;
    QRPrazoVencimentoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QRPrazoVencimentoDESC_PRAZO_VENCIMENTO: TStringField;
    QRPrazoVencimentoNUM_PARCELAS: TIntegerField;
    QDias: TOracleDataSet1;
    QDiasCOD_PRAZO_VENCIMENTO: TIntegerField;
    QDiasNUM_DIAS: TIntegerField;
    QDiasPERC_JURO: TFloatField;
    QPrazo: TOracleDataSet1;
    QPrazoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoDESC_PRAZO_VENCIMENTO: TStringField;
    QPrazoNUM_PARCELAS: TIntegerField;
    QPrazoIND_SITUACAO: TStringField;
    QPrazoPERC_DESCONTO: TFloatField;
    QPrazoIND_ENTRADA: TStringField;
    QPrazoNUM_PRAZO_MAXIMO: TIntegerField;
    QPrazoIND_TIPO_PAGTO: TStringField;
    QPrazoVAL_MINIMO_VENDA: TFloatField;
    QPrazoIND_FORA_MES: TStringField;
    QPrazoVencimentoDias: TOracleDataSet1;
    QPrazoVencimentoDiasCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoDiasNUM_DIAS: TIntegerField;
    QPrazoVencimento: TOracleDataSet1;
    QPrazoVencimentoCOD_PRAZO_VENCIMENTO: TIntegerField;
    QPrazoVencimentoDESC_PRAZO_VENCIMENTO: TStringField;
    QPrazoVencimentoNUM_PARCELAS: TIntegerField;
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
    QPrazoVencimentoNUM_PRAZO_MAXIMO: TIntegerField;
    QPrazoVencimentoIND_TIPO_PAGTO: TStringField;
    QPrazoVencimentoVAL_MINIMO_VENDA: TFloatField;
    QPrazoVencimentoIND_FORA_MES: TStringField;
    DSPrazoVencimentoDias: TDataSource;
    QPrazoIND_JURO_COMPOSTO: TStringField;
    QListaDias: TOracleDataSet1;
    QListaDiasNUM_DIAS: TIntegerField;
    QListaDiasDT_VENCIMENTO: TDateTimeField;
    QListaPrazo: TOracleDataSet1;
    QListaPrazoDESC_PRAZO_VENCIMENTO: TStringField;
    QListaPrazoIND_JURO_COMPOSTO: TStringField;
    QListaPrazoNUM_PARCELAS: TFloatField;
    QPrazoIND_SUBST_PRIMEIRA_PARC: TStringField;
    QPrazoPERC_JUROS: TFloatField;
    QPrazoVencimento_ConsIND_SITUACAO: TStringField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA1: TIntegerField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA2: TIntegerField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA3: TIntegerField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA4: TIntegerField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA5: TIntegerField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA6: TIntegerField;
    QPrazoVencimento_ConsNUM_DIAS_CARENCIA7: TIntegerField;
    QPrazoVencimento_ConsPERC_CARENCIA1: TFloatField;
    QPrazoVencimento_ConsPERC_CARENCIA2: TFloatField;
    QPrazoVencimento_ConsPERC_CARENCIA3: TFloatField;
    QPrazoVencimento_ConsPERC_CARENCIA4: TFloatField;
    QPrazoVencimento_ConsPERC_CARENCIA5: TFloatField;
    QPrazoVencimento_ConsPERC_CARENCIA6: TFloatField;
    QPrazoVencimento_ConsPERC_CARENCIA7: TFloatField;
    QPrazoVencimento_ConsPERC_DESCONTO: TFloatField;
    QPrazoVencimento_ConsIND_ENTRADA: TStringField;
    QPrazoVencimento_ConsNUM_PRAZO_MAXIMO: TIntegerField;
    QPrazoVencimento_ConsIND_TIPO_PAGTO: TStringField;
    QPrazoVencimento_ConsVAL_MINIMO_VENDA: TFloatField;
    QPrazoVencimento_ConsIND_FORA_MES: TStringField;
    QPrazoVencimento_ConsIND_JURO_COMPOSTO: TStringField;
    QPrazoVencimento_ConsIND_SUBST_PRIMEIRA_PARC: TStringField;
    QPrazoVencimento_ConsPERC_JUROS: TFloatField;
    QPrazoPERC_DESC_ADIANTAMENTO: TFloatField;
    procedure QPrazoAfterInsert(DataSet: TDataSet);
    procedure QPrazoAfterOpen(DataSet: TDataSet);
    procedure QPrazoAfterPost(DataSet: TDataSet);
    procedure QPrazoBeforeCancel(DataSet: TDataSet);
    procedure QDiasAfterInsert(DataSet: TDataSet);
    procedure QDiasBeforeDelete(DataSet: TDataSet);
    procedure QDiasBeforeEdit(DataSet: TDataSet);
    procedure QDiasBeforeInsert(DataSet: TDataSet);
    procedure QDiasBeforePost(DataSet: TDataSet);
    procedure QPrazoBeforeClose(DataSet: TDataSet);
    procedure QPrazoBeforePost(DataSet: TDataSet);
    procedure QDiasAfterPost(DataSet: TDataSet);
    procedure QPrazoAfterCancel(DataSet: TDataSet);
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

procedure TDMPrazoVencimento.QPrazoAfterInsert(
  DataSet: TDataSet);
begin
  QPrazoIND_SITUACAO.Value := 'ATIVO';
  QPrazoIND_FORA_MES.Value := 'N';
  QPrazoIND_JURO_COMPOSTO.Value := 'S';
end;

procedure TDMPrazoVencimento.QPrazoAfterOpen(DataSet: TDataSet);
begin
  QDias.Close;
  QDias.Open;
end;

procedure TDMPrazoVencimento.QPrazoAfterPost(DataSet: TDataSet);
var wCodigo: Integer;
begin
  if QDias.State in [DsEdit, DsInsert] then
  begin
    try
      QDias.Post;
    except
      QDias.Cancel;
    end;
  end;

  wCodigo := QPrazoCOD_PRAZO_VENCIMENTO.Value;

  QPrazo.Close;
  QPrazo.SetVariable('PK', wCodigo);
  QPrazo.Open;
end;

procedure TDMPrazoVencimento.QPrazoBeforeCancel(DataSet: TDataSet);
begin
  QDias.Cancel;
end;

procedure TDMPrazoVencimento.QDiasAfterInsert(DataSet: TDataSet);
begin
  QDiasCOD_PRAZO_VENCIMENTO.Value := QPrazoCOD_PRAZO_VENCIMENTO.Value;
end;

procedure TDMPrazoVencimento.QDiasBeforeDelete(DataSet: TDataSet);
begin
  if not (QPrazo.State in [DsEdit, DsInsert]) then
    QPrazo.Edit;
end;

procedure TDMPrazoVencimento.QDiasBeforeEdit(DataSet: TDataSet);
begin
  if not (QPrazo.State in [DsEdit, DsInsert]) then
    QPrazo.Edit;
end;

procedure TDMPrazoVencimento.QDiasBeforeInsert(DataSet: TDataSet);
var wCodigo: Integer;
begin
//  wCodigo := QPrazoCOD_PRAZO_VENCIMENTO.Value;

  if (QPrazo.State = DsInsert) then
    QPrazo.Post;

//  QPrazo.Close;
//  QPrazo.SetVariable('PK', wCodigo);
//  QPrazo.Open;

  if not (QPrazo.State in [DsEdit, DsInsert]) then
    QPrazo.Edit;
end;

procedure TDMPrazoVencimento.QDiasBeforePost(DataSet: TDataSet);
begin
  if QDiasCOD_PRAZO_VENCIMENTO.IsNull then
    QDias.Cancel;
end;

procedure TDMPrazoVencimento.QPrazoBeforeClose(DataSet: TDataSet);
begin
  QDias.Close;
end;

procedure TDMPrazoVencimento.QPrazoBeforePost(DataSet: TDataSet);
begin
//  if QPrazoNUM_PARCELAS.IsNull then
//    QPrazoNUM_PARCELAS.Value := 0;
//  if QPrazoIND_ENTRADA.IsNull then
//    QPrazoIND_ENTRADA.Value := 'S';

  QPrazoNUM_PARCELAS.Value := QDias.RecordCount;
  QDias.First;
  while not QDias.Eof do
  begin
    if QDiasNUM_DIAS.Value = 0 then
    begin
      QPrazoIND_ENTRADA.Value := 'SIM';
      Exit;
    end;

    QDias.Next;
  end;
  QPrazoIND_ENTRADA.Value := 'NAO';
end;

procedure TDMPrazoVencimento.QDiasAfterPost(DataSet: TDataSet);
begin
//  try
//    if DMOracle.DBCemapa.InTransaction then
//      DMOracle.DBCemapa.Commit;
//  except
//    DMOracle.DBCemapa.Rollback;
//  end;
end;

procedure TDMPrazoVencimento.QPrazoAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
  QDias.Refresh;
end;

end.
