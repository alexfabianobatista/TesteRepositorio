unit UContrato_Vend_Cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMContrato_Vend = class(TDataModule)
    QContrato_Vend_Custos: TOracleDataSet1;
    QContrato_Vend_CustosCOD_CONTRATO_VEND_CUSTOS: TIntegerField;
    QContrato_Vend_CustosNUM_NOTA: TIntegerField;
    QContrato_Vend_CustosCOD_SERIE: TStringField;
    QContrato_Vend_CustosCOD_FILIAL: TIntegerField;
    QContrato_Vend_CustosCOD_CONTRATO_VEND: TIntegerField;
    QContrato_Vend_CustosVAL_LANCAMENTO: TFloatField;
    QContrato_Vend_CustosDT_EMISSAO: TDateTimeField;
    QContrato_Vend_CustosCOD_CADASTRO: TIntegerField;
    QContrato_Vend_CustosDT_PAGAMENTO: TDateTimeField;
    QContrato_Vend_CustosQT_QUANTIDADE: TFloatField;
    QContrato_Vend_Custos_Cons: TOracleDataSet1;
    QContrato_Vend_Custos_ConsCOD_CONTRATO_VEND_CUSTOS: TIntegerField;
    QContrato_Vend_Custos_ConsNUM_NOTA: TIntegerField;
    QContrato_Vend_Custos_ConsCOD_SERIE: TStringField;
    QContrato_Vend_Custos_ConsCOD_FILIAL: TIntegerField;
    QContrato_Vend_Custos_ConsCOD_CONTRATO_VEND: TIntegerField;
    QContrato_Vend_Custos_ConsVAL_LANCAMENTO: TFloatField;
    QContrato_Vend_Custos_ConsDT_EMISSAO: TDateTimeField;
    QContrato_Vend_Custos_ConsCOD_CADASTRO: TIntegerField;
    QContrato_Vend_Custos_ConsDT_PAGAMENTO: TDateTimeField;
    QContrato_Vend_Custos_ConsQT_QUANTIDADE: TFloatField;
    QContrato_Vend_CustosQTDE_SALDO: TFloatField;
    QContrato_Vend_CustosCOD_PRODUTO: TIntegerField;
    QContrato_Vend_Custos_Exclui: TOracleDataSet1;
    QContrato_Vend_Custos_ExcluiCOD_CONTRATO_VEND_MOV: TIntegerField;
    QContrato_Vend_Custos_ExcluiCOD_CONTRATO_VEND: TIntegerField;
    QContrato_Vend_Custos_ExcluiDATA: TDateTimeField;
    QContrato_Vend_Custos_ExcluiQT_QUANTIDADE: TFloatField;
    QContrato_Vend_Custos_ExcluiVAL_MOVIMENTO: TFloatField;
    QContrato_Vend_Custos_ExcluiDESC_OBSERVACAO: TStringField;
    QContrato_Vend_Custos_ExcluiCOD_CONTRATO_GP_MOV: TIntegerField;
    QContrato_Vend_Custos_ExcluiCOD_CONTRATO_MOV: TIntegerField;
    QContrato_Vend_Custos_ExcluiCOD_CONTRATO_VEND_CUSTOS: TIntegerField;
    QContrato_Vend_CustosCOD_CADASTRO_PARCEIRO: TIntegerField;
    QContrato_Vend_Custos_ConsQTDE_SALDO: TFloatField;
    QRContrato_Vend_Custos: TOracleDataSet1;
    QRContrato_Vend_CustosCOD_CONTRATO_VEND_CUSTOS: TIntegerField;
    QRContrato_Vend_CustosNUM_NOTA: TIntegerField;
    QRContrato_Vend_CustosCOD_SERIE: TStringField;
    QRContrato_Vend_CustosCOD_FILIAL: TIntegerField;
    QRContrato_Vend_CustosCOD_CONTRATO_VEND: TIntegerField;
    QRContrato_Vend_CustosVAL_LANCAMENTO: TFloatField;
    QRContrato_Vend_CustosDT_EMISSAO: TDateTimeField;
    QRContrato_Vend_CustosCOD_CADASTRO: TIntegerField;
    QRContrato_Vend_CustosDT_PAGAMENTO: TDateTimeField;
    QRContrato_Vend_CustosQT_QUANTIDADE: TFloatField;
    QRContrato_Vend_CustosQTDE_SALDO: TFloatField;
    QRContrato_Vend_CustosCOD_PRODUTO: TIntegerField;
    QRContrato_Vend_CustosCOD_CADASTRO_PARCEIRO: TIntegerField;
    QRContrato_Vend_CustosNOME: TStringField;
    QRContrato_Vend_CustosDESC_PRODUTO: TStringField;
    QRContrato_Vend_CustosDESC_FILIAL: TStringField;
    QCalculo_Variacao_Cambial: TOracleDataSet1;
    QCalculo_Variacao_CambialCOD_CONTRATO_VEND: TFloatField;
    QCalculo_Variacao_CambialCOD_FILIAL: TFloatField;
    QCalculo_Variacao_CambialQT_SALDO_CONTRATO: TFloatField;
    QCalculo_Variacao_CambialDT_CONTRATO: TDateTimeField;
    QCalculo_Variacao_CambialNUM_CONTRATO: TFloatField;
    QCalculo_Variacao_CambialNOME: TStringField;
    QCalculo_Variacao_CambialCOD_CADASTRO: TFloatField;
    QCalculo_Variacao_CambialCOD_OPERACAO: TFloatField;
    procedure QContrato_Vend_CustosBeforeInsert(DataSet: TDataSet);
    procedure QContrato_Vend_CustosAfterPost(DataSet: TDataSet);
    procedure QContrato_Vend_CustosAfterCancel(DataSet: TDataSet);
    procedure QContrato_Vend_CustosAfterDelete(DataSet: TDataSet);
    procedure QContrato_Vend_CustosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContrato_Vend: TDMContrato_Vend;

implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMContrato_Vend.QContrato_Vend_CustosBeforeInsert(
  DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContrato_Vend.QContrato_Vend_CustosAfterPost(
  DataSet: TDataSet);
Var wCodigo : Integer;
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.Commit;
  wCodigo := QContrato_Vend_CustosCOD_CONTRATO_VEND_CUSTOS.Value;
  QContrato_Vend_Custos.Close;
  QContrato_Vend_Custos.SetVariable('PK',wCodigo);
  QContrato_Vend_Custos.Open;
end;

procedure TDMContrato_Vend.QContrato_Vend_CustosAfterCancel(
  DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
end;

procedure TDMContrato_Vend.QContrato_Vend_CustosAfterDelete(
  DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.Commit;

end;

procedure TDMContrato_Vend.QContrato_Vend_CustosBeforePost(
  DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContrato_Vend_CustosCOD_FILIAL.Text);
end;

end.
