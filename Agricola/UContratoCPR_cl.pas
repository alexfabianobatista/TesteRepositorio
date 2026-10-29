unit UContratoCPR_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, variants;

type
  TDMContrato_CPR = class(TDataModule)
    QContrato_CPRCons: TOracleDataSet1;
    QContrato_Cpr: TOracleDataSet1;
    QContrato_CPRConsCOD_FILIAL: TIntegerField;
    QContrato_CPRConsCOD_CONTRATO_CPR: TIntegerField;
    QContrato_CPRConsNUM_CONTRATO_CPR: TIntegerField;
    QContrato_CPRConsCOD_CADASTRO: TIntegerField;
    QContrato_CPRConsNOME: TStringField;
    QContrato_CPRConsCOD_PRODUTO: TFloatField;
    QContrato_CPRConsQT_QUANTIDADE: TFloatField;
    QContrato_CPRConsVAL_PRECO: TFloatField;
    QContrato_CPRConsDT_EMISSAO: TDateTimeField;
    QContrato_CPRConsDT_VENCIMENTO: TDateTimeField;
    QContrato_CPRConsQT_AREA: TFloatField;
    QContrato_CPRConsVAL_PRODUCAO: TFloatField;
    QContrato_CprCOD_CONTRATO_CPR: TIntegerField;
    QContrato_CprNUM_CONTRATO_CPR: TIntegerField;
    QContrato_CprCOD_CADASTRO: TIntegerField;
    QContrato_CprCOD_AVALISTA: TIntegerField;
    QContrato_CprCOD_PRODUTO: TFloatField;
    QContrato_CprQT_QUANTIDADE: TFloatField;
    QContrato_CprDT_EMISSAO: TDateTimeField;
    QContrato_CprDT_VENCIMENTO: TDateTimeField;
    QContrato_CprVAL_PRODUCAO: TFloatField;
    QContrato_CprDESC_DENOMINADA: TStringField;
    QContrato_CprDESC_LOCALIZADA: TStringField;
    QContrato_CprNUM_MATRICULA: TStringField;
    QContrato_CprDESC_COMARCA: TStringField;
    QContrato_CprDESC_AREA: TStringField;
    QContrato_CprDESC_GARANTIA_PENHOR: TStringField;
    QContrato_CprDESC_GARANTIA_HIPOTECA: TStringField;
    QContrato_CprCOD_FILIAL: TIntegerField;
    QContrato_CprIND_SITUACAO: TStringField;
    QContrato_CprCOD_CPR_PRODUTOR: TStringField;
    QContrato_CprDESC_OBSERVACAO: TStringField;
    QContrato_CprDESC_GARANTIA: TStringField;
    QContrato_CprQT_AREA: TFloatField;
    QContrato_CprDT_ANO_SAFRA: TStringField;
    QContrato_CprQTDETOTAL: TFloatField;
    QContrato_CprPRECOTOTAL: TFloatField;
    QContrato_CPRConsDESC_PRODUTO: TStringField;
    QContrato_CprNUM_REGISTRO_IMOVEL: TStringField;
    QContrato_CprNUM_LIVRO_REGISTRO: TStringField;
    QContrato_CprDT_REGISTRO: TDateTimeField;
    QRContratoCPR: TOracleDataSet1;
    QRContratoCPRNUM_CONTRATO_CPR: TIntegerField;
    QRContratoCPRCOD_CADASTRO: TIntegerField;
    QRContratoCPRNOME: TStringField;
    QRContratoCPRCOD_PRODUTO: TFloatField;
    QRContratoCPRDESC_PRODUTO: TStringField;
    QRContratoCPRQT_QUANTIDADE: TFloatField;
    QRContratoCPRDT_EMISSAO: TDateTimeField;
    QRContratoCPRDT_VENCIMENTO: TDateTimeField;
    QContrato_CprDESC_INTERVENIENTE_GARANTIDOR: TStringField;
    QContrato_CprCOD_INTERVENIENTE_GARANTIDOR: TIntegerField;
    QGarantidorSolidario: TOracleDataSet1;
    DSGarantidorSolidario: TDataSource;
    QGarantidorSolidarioCOD_GARANTIDOR_SOLIDARIO: TIntegerField;
    QGarantidorSolidarioCOD_CONTRATO_CPR: TIntegerField;
    QGarantidorSolidarioCOD_CADASTRO: TIntegerField;
    QGarantidorSolidariodesc_garantidor: TStringField;
    QContrato_CprNUM_CADASTRO_INCRA: TStringField;
    QContrato_CPRConsNUM_MATRICULA: TStringField;
    QContrato_CPRConsNUM_CADASTRO_INCRA: TStringField;
    QContasPagar: TOracleDataSet1;
    QContasPagarCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarCOD_FINALIDADE: TIntegerField;
    QContasPagarCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagarCOD_CADASTRO: TIntegerField;
    QContasPagarCOD_FILIAL: TIntegerField;
    QContasPagarNUM_TITULO: TIntegerField;
    QContasPagarNUM_PARCELA: TIntegerField;
    QContasPagarDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagarDT_MOVIMENTO: TDateTimeField;
    QContasPagarDT_BAIXA: TDateTimeField;
    QContasPagarDT_VENCIMENTO: TDateTimeField;
    QContasPagarDT_EMISSAO: TDateTimeField;
    QContasPagarDT_CAPITALIZACAO: TDateTimeField;
    QContasPagarVAL_TITULO: TFloatField;
    QContasPagarCOD_NOTA_CAB: TIntegerField;
    QContasPagarIND_ACEITE: TStringField;
    QContasPagarIND_SITUACAO: TStringField;
    QContasPagarVAL_ORIGINAL: TFloatField;
    QContasPagarVAL_INDEXADO: TFloatField;
    QContasPagarCOD_DEPARTAMENTO: TIntegerField;
    QContasPagarDESC_OBSERVACAO: TStringField;
    QContasPagarMov: TOracleDataSet1;
    QContasPagarMovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagarMovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagarMovDT_MOVIMENTO: TDateTimeField;
    QContasPagarMovVAL_MOVIMENTO: TFloatField;
    QContasPagarMovDESC_OBSERVACAO: TStringField;
    QContasPagarMovIND_TIPO_MOVIMENTO: TStringField;
    QContasPagarMovDT_USUARIO: TDateTimeField;
    QContasPagarMovCOD_USUARIO: TIntegerField;
    QContasPagarMovCOD_BCO_MOVIMENTO: TIntegerField;
    QContasPagarMovCOD_CAIXA_MOV: TIntegerField;
    QContasPagarMovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagarMovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContrato_CprIND_CP: TIntegerField;
    QContasPagarCOD_CONTRATO_CPR: TIntegerField;
    QContrato_CprVAL_PRECO: TFloatField;
    QContratoCpr_Doc: TOracleDataSet;
    QContratoCpr_DocCOD_CONTRATO_CPR_DOC: TIntegerField;
    QContratoCpr_DocNOME_ARQUIVO: TStringField;
    QContratoCpr_DocDT_INCLUSAO: TDateTimeField;
    QContratoCpr_DocDESCRICAO: TStringField;
    QContratoCpr_DocARQUIVO: TBlobField;
    QContratoCpr_DocCOD_CONTRATO_CPR: TIntegerField;
    QNotasContrato: TOracleDataSet1;
    QNotasContratoItens: TOracleDataSet1;
    QNotasContratoCOD_NOTA_CAB: TFloatField;
    QNotasContratoNUM_NOTA: TFloatField;
    QNotasContratoCOD_FILIAL: TFloatField;
    QNotasContratoCOD_SERIE: TStringField;
    QNotasContratoDT_RECEBIMENTO: TDateTimeField;
    QNotasContratoCOD_ESTADO: TStringField;
    QNotasContratoIND_SITUACAO: TStringField;
    QNotasContratoDT_EMISSAO: TDateTimeField;
    QNotasContratoCOD_OPERACAO: TFloatField;
    QNotasContratoCOD_CADASTRO: TFloatField;
    QNotasContratoNOME: TStringField;
    QNotasContratoSVAL_TOTAL: TFloatField;
    QNotasContratoSVAL_CUSTO: TFloatField;
    QNotasContratoSVAL_DESCONTO: TFloatField;
    QNotasContratoNUM_VOLUMES: TFloatField;
    QNotasContratoQT_QUANTIDADE: TFloatField;
    QNotasContratoNUM_CGC_CPF: TStringField;
    QNotasContratoCIDADE: TStringField;
    QNotasContratoNUM_PEDIDO: TIntegerField;
    QNotasContratoCOD_DEPARTAMENTO: TIntegerField;
    QNotasContratoDESC_FILIAL: TStringField;
    QNotasContratoCOD_CONTRATO_CPR: TIntegerField;
    QNotasContratoItensCOD_PRODUTO: TFloatField;
    QNotasContratoItensQT_QUANTIDADE: TFloatField;
    QNotasContratoItensVAL_UNITARIO: TFloatField;
    QNotasContratoItensDESC_PRODUTO: TStringField;
    QNotasContratoItensVAL_TOTAL: TFloatField;
    procedure QContrato_CPRAfterInsert(DataSet: TDataSet);
    procedure QContrato_CprBeforePost(DataSet: TDataSet);
    procedure QGarantidorSolidarioAfterInsert(DataSet: TDataSet);
    procedure QContrato_CprAfterOpen(DataSet: TDataSet);
    procedure QContrato_CprAfterPost(DataSet: TDataSet);
    procedure QContrato_CprBeforeCancel(DataSet: TDataSet);
    procedure QGarantidorSolidarioAfterEdit(DataSet: TDataSet);
    procedure QGarantidorSolidarioCalcFields(DataSet: TDataSet);
    procedure QGarantidorSolidarioBeforePost(DataSet: TDataSet);
    procedure QContrato_CprBeforeEdit(DataSet: TDataSet);
    procedure QContrato_CprBeforeInsert(DataSet: TDataSet);
    procedure QContrato_CprAfterCancel(DataSet: TDataSet);
    procedure QContrato_CprAfterDelete(DataSet: TDataSet);
    procedure QContrato_CprBeforeDelete(DataSet: TDataSet);
    procedure QContratoCpr_DocBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContrato_CPR: TDMContrato_CPR;

implementation

uses UOracle_cl, USequencia_cl;

{$R *.DFM}

procedure TDMContrato_CPR.QContrato_CPRAfterInsert(DataSet: TDataSet);
begin
  QContrato_CPRCOD_Filial.Value:=1;
  QContrato_CPRDT_EMISSAO.Value:=DMoracle.DataServ;
  QContrato_CPRDT_VENCIMENTO.Value:=DMoracle.DataServ;
  QContrato_CPRIND_SITUACAO.Value:='ABERTO';
  QContrato_CPRNUM_CONTRATO_CPR.Value := 0;
  QGarantidorSolidario.Close;
  QGarantidorSolidario.SetVariable('CPR',IntToStr(QContrato_CPRCod_Contrato_CPR.Value));
  QGarantidorSolidario.SetVariable('PK',NULL);
  QGarantidorSolidario.open;
end;

procedure TDMContrato_CPR.QContrato_CprBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContrato_CPRConsCOD_FILIAL.Text);
  if QContrato_CPR.State = dsInsert then
     QContrato_CPRNUM_CONTRATO_CPR.Value:=DMSequencia.Sequencia(Trunc(QContrato_CPRCOD_FILIAL.VALUE),'Contrato_CPR');
end;

procedure TDMContrato_CPR.QGarantidorSolidarioAfterInsert(
  DataSet: TDataSet);
begin
  DMContrato_CPR.QGarantidorSolidarioCOD_CONTRATO_CPR.Value := QContrato_CPRCod_Contrato_CPR.Value;
end;

procedure TDMContrato_CPR.QContrato_CprAfterOpen(DataSet: TDataSet);
begin
  if QContrato_CPRCod_Contrato_CPR.Text <> '' then
  begin
     QGarantidorSolidario.Close;
     QGarantidorSolidario.SetVariable('CPR',IntToStr(QContrato_CPRCod_Contrato_CPR.Value));
     QGarantidorSolidario.SetVariable('PK',NULL);
     QGarantidorSolidario.Open;
  end;
end;

procedure TDMContrato_CPR.QContrato_CprAfterPost(DataSet: TDataSet);
begin
  if QGarantidorSolidario.State in [DSInsert,DSEdit] then
    QGarantidorSolidario.POST;  
end;

procedure TDMContrato_CPR.QContrato_CprBeforeCancel(DataSet: TDataSet);
begin
  DMContrato_CPR.QGarantidorSolidario.cancel;
end;

procedure TDMContrato_CPR.QGarantidorSolidarioAfterEdit(DataSet: TDataSet);
begin
  if QContrato_CPRCod_Contrato_CPR.Text <> '' then
  begin
     QGarantidorSolidario.Close;
     QGarantidorSolidario.SetVariable('CPR',IntToStr(QContrato_CPRCod_Contrato_CPR.Value));
     QGarantidorSolidario.SetVariable('PK',NULL);
     QGarantidorSolidario.Open;
  end;
end;

procedure TDMContrato_CPR.QGarantidorSolidarioCalcFields(
  DataSet: TDataSet);
begin
  If QGarantidorSolidarioCOD_CADASTRO.text <> '' then
     QGarantidorSolidariodesc_garantidor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + QGarantidorSolidarioCod_Cadastro.Text);
end;

procedure TDMContrato_CPR.QGarantidorSolidarioBeforePost(
  DataSet: TDataSet);
begin
  if QContrato_Cpr.State in [DSInsert,DSEdit] then
    QContrato_Cpr.POST;
end;

procedure TDMContrato_CPR.QContrato_CprBeforeEdit(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContrato_CPR.QContrato_CprBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContrato_CPR.QContrato_CprAfterCancel(DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.RollBack;
end;

procedure TDMContrato_CPR.QContrato_CprAfterDelete(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;

end;

procedure TDMContrato_CPR.QContrato_CprBeforeDelete(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;

end;

procedure TDMContrato_CPR.QContratoCpr_DocBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QContrato_CprCOD_FILIAL.Text);
end;

end.
