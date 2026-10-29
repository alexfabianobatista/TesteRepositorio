unit UCaixa_Transf_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCaixa_Transf = class(TDataModule)
    QCaixaTransfCab: TOracleDataSet1;
    QCaixaTransfItem: TOracleDataSet1;
    QCaixaTransfItemCOD_CAIXA_TRANSF_ITEM: TIntegerField;
    QCaixaTransfItemCOD_CAIXA_TRANSF_CAB: TIntegerField;
    QCaixaTransfItemDT_LANCAMENTO: TDateTimeField;
    QCaixaTransfItemDESC_HISTORICO: TStringField;
    QCaixaTransfItemVAL_LANCAMENTO: TFloatField;
    QCaixaTransfItemDESC_COMPLEMENTO: TStringField;
    QCaixaTransfItemCOD_CAIXA_MOV: TIntegerField;
    QCaixaTransCab_Cons: TOracleDataSet1;
    QCaixaTransfItem_Cx: TOracleDataSet1;
    QCaixaTransfItem_CxCOD_CAIXA_TRANSF_ITEM: TIntegerField;
    QCaixaTransfItem_CxCOD_CAIXA_TRANSF_CAB: TIntegerField;
    QCaixaTransfItem_CxDT_LANCAMENTO: TDateTimeField;
    QCaixaTransfItem_CxDESC_HISTORICO: TStringField;
    QCaixaTransfItem_CxVAL_LANCAMENTO: TFloatField;
    QCaixaTransfItem_CxDESC_COMPLEMENTO: TStringField;
    QCaixaTransfItem_CxCOD_CAIXA_MOV: TIntegerField;
    QCaixaTransfSoma: TOracleDataSet1;
    QCaixaTransfSomaSVAL_TOTAL: TFloatField;
    QRCaixaTransf: TOracleDataSet1;
    QRCaixaTransfDT_LANCAMENTO: TDateTimeField;
    QRCaixaTransfCOD_FILIAL_REMETENTE: TIntegerField;
    QRCaixaTransfCOD_FILIAL_RECEBE: TIntegerField;
    QRCaixaTransfCOD_HISTORICO_ENTRADA: TIntegerField;
    QRCaixaTransfCOD_HISTORICO_SAIDA: TIntegerField;
    QRCaixaTransfNUM_LOTE_TRANSFERENCIA: TIntegerField;
    QRCaixaTransfDT_LANC_ITEM: TDateTimeField;
    QRCaixaTransfDESC_HISTORICO: TStringField;
    QRCaixaTransfVAL_LANCAMENTO: TFloatField;
    QRCaixaTransfNUM_DOCUMENTO: TIntegerField;
    QRCaixaTransfCOD_CAIXA_MOV: TIntegerField;
    QRCaixaTransfDESC_COMPLEMENTO: TStringField;
    QRCaixaTransfDESC_FILIAL_SAIDA: TStringField;
    QRCaixaTransfDESC_HISTORICO_SAIDA: TStringField;
    QRCaixaTransfdesc_historico_entrada: TStringField;
    QRCaixaTransfdesc_filial_entrada: TStringField;
    QRCaixaTransfdesc_historico_rel: TStringField;
    QRCaixaTransfCOD_HISTORICO_CAIXA: TIntegerField;
    QRCaixaTransfCOD_CADASTRO: TIntegerField;
    QRCaixaTransfdesc_complemento_rel: TStringField;
    QRCaixaTransfdesc_cidade_remete: TStringField;
    QRCaixaTransfdesc_cidade_recebe: TStringField;
    QCaixaTransCab_ConsDT_LANCAMENTO: TDateTimeField;
    QCaixaTransCab_ConsCOD_FILIAL_REMETENTE: TIntegerField;
    QCaixaTransCab_ConsCOD_HISTORICO_SAIDA: TIntegerField;
    QCaixaTransCab_ConsCOD_FILIAL_RECEBE: TIntegerField;
    QCaixaTransCab_ConsCOD_HISTORICO_ENTRADA: TIntegerField;
    QCaixaTransCab_ConsCOD_USUARIO: TIntegerField;
    QCaixaTransCab_ConsVAL_LANCAMENTO: TFloatField;
    QCaixaTransfCabCOD_CAIXA_TRANSF_CAB: TIntegerField;
    QCaixaTransfCabDT_LANCAMENTO: TDateTimeField;
    QCaixaTransfCabCOD_FILIAL_REMETENTE: TIntegerField;
    QCaixaTransfCabCOD_HISTORICO_SAIDA: TIntegerField;
    QCaixaTransfCabCOD_FILIAL_RECEBE: TIntegerField;
    QCaixaTransfCabCOD_HISTORICO_ENTRADA: TIntegerField;
    QCaixaTransfCabCOD_USUARIO: TIntegerField;
    QCaixaTransfCabIND_SITUACAO: TStringField;
    QCaixaTransfCabCOD_CAIXA_MOV_RECEBE: TIntegerField;
    QCaixaTransfCabCOD_CAIXA_MOV_REMETE: TIntegerField;
    QCaixaTransfCabNUM_LOTE_TRANSFERENCIA: TIntegerField;
    QCaixaTransCab_ConsCOD_CAIXA_TRANSF_CAB: TIntegerField;
    QCaixaTransfItemNUM_DOCUMENTO: TFloatField;
    QCaixaTransfItem_CxNUM_DOCUMENTO: TFloatField;
    procedure QCaixaTransfCabAfterInsert(DataSet: TDataSet);
    procedure QCaixaTransfItemBeforeInsert(DataSet: TDataSet);
    procedure QCaixaTransfItem_CxBeforeInsert(DataSet: TDataSet);
    procedure QCaixaTransfCabBeforeEdit(DataSet: TDataSet);
    procedure QCaixaTransfCabAfterPost(DataSet: TDataSet);
    procedure QCaixaTransfCabBeforeDelete(DataSet: TDataSet);
    procedure QCaixaTransfItemBeforeDelete(DataSet: TDataSet);
    procedure QCaixaTransfItem_CxBeforeDelete(DataSet: TDataSet);
    procedure QCaixaTransfItemBeforeEdit(DataSet: TDataSet);
    procedure QCaixaTransfCabBeforePost(DataSet: TDataSet);
    procedure QCaixaTransfCabBeforeInsert(DataSet: TDataSet);
    procedure QCaixaTransfCabAfterCancel(DataSet: TDataSet);
    procedure QCaixaTransfCabAfterDelete(DataSet: TDataSet);
    procedure QRCaixaTransfCalcFields(DataSet: TDataSet);
    procedure QCaixaTransfCabDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    { Private declarations }
    fVolta_Confirmacao : Boolean;
  public
    { Public declarations }
    Property pVolta_Confirmacao : Boolean Read fVolta_Confirmacao Write fVolta_Confirmacao Default False;

  end;

var
  DMCaixa_Transf: TDMCaixa_Transf;

implementation

uses UOracle_cl, UUsuario_cl, USequencia_cl;

{$R *.DFM}

procedure TDMCaixa_Transf.QCaixaTransfCabAfterInsert(DataSet: TDataSet);
begin
  QCaixaTransfCabCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QCaixaTransfCabDt_Lancamento.Value := DMOracle.DataServ;
End;

procedure TDMCaixa_Transf.QCaixaTransfItemBeforeInsert(DataSet: TDataSet);
begin
  If QCaixaTransfCab.State = dsInsert then
  Begin
    QCaixaTransfCab.Post;
    QCaixaTransfCab.Edit;
  End;
  If QCaixaTransfCab.State <> dsEdit then
    Raise Exception.Create('Lote não está no modo de alteração!')
end;

procedure TDMCaixa_Transf.QCaixaTransfItem_CxBeforeInsert(
  DataSet: TDataSet);
begin
  If QCaixaTransfCab.State = dsInsert then
  Begin
    QCaixaTransfCab.Post;
    QCaixaTransfCab.Edit;
  End;
  If QCaixaTransfCab.State <> dsEdit then
    Raise Exception.Create('Lote não está no modo de alteração!')
end;

procedure TDMCaixa_Transf.QCaixaTransfCabBeforeEdit(DataSet: TDataSet);
begin
  If pVolta_Confirmacao = False Then // quando esta voltando confirmacao do lote pode executar o Edit
    If QCaixaTransfCabInd_Situacao.Value <> '1' then
        Raise Exception.Create('Este lote já está confirmado!');
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCaixa_Transf.QCaixaTransfCabAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
begin
  wCodigo := QCaixaTransfCabCod_Caixa_Transf_Cab.Value;
  QCaixaTransfCab.Close;
  QCaixaTransfCab.SetVariable('PK',wCodigo);
  QCaixaTransfCab.Open;
  DMOracle.DBCemapa.Commit;
end;

procedure TDMCaixa_Transf.QCaixaTransfCabBeforeDelete(DataSet: TDataSet);
begin
  If QCaixaTransfCabInd_Situacao.Value <> '1' then
      Raise Exception.Create('Este lote já está confirmado!');
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCaixa_Transf.QCaixaTransfItemBeforeDelete(DataSet: TDataSet);
begin
  If QCaixaTransfCab.State <> dsEdit then
    Raise Exception.Create('Lote não está no modo de alteração!')
end;

procedure TDMCaixa_Transf.QCaixaTransfItem_CxBeforeDelete(
  DataSet: TDataSet);
begin
  If QCaixaTransfCab.State <> dsEdit then
    Raise Exception.Create('Lote não está no modo de alteração!')
end;

procedure TDMCaixa_Transf.QCaixaTransfItemBeforeEdit(DataSet: TDataSet);
begin
  If QCaixaTransfCab.State <> dsEdit then
    Raise Exception.Create('Lote não está no modo de alteração!')
end;

procedure TDMCaixa_Transf.QCaixaTransfCabBeforePost(DataSet: TDataSet);
begin
  DMOracle.ValidaFilial(QCaixaTransfCabCOD_FILIAL_RECEBE.Text);
  DMOracle.ValidaFilial(QCaixaTransfCabCOD_FILIAL_REMETENTE.Text);  
  If QCaixaTransfCabNum_Lote_Transferencia.Text = '' Then
     QCaixaTransfCabNum_Lote_Transferencia.Value := DMSequencia.Sequencia(QCaixaTransfCabCod_Filial_Remetente.Value,'TRANSF_CAIXA');
end;

procedure TDMCaixa_Transf.QCaixaTransfCabBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.InTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMCaixa_Transf.QCaixaTransfCabAfterCancel(DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.RollBack;
end;

procedure TDMCaixa_Transf.QCaixaTransfCabAfterDelete(DataSet: TDataSet);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
end;

procedure TDMCaixa_Transf.QRCaixaTransfCalcFields(DataSet: TDataSet);
begin
  QRCaixaTransfDesc_Filial_Entrada.Value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRCaixaTransfCod_Filial_Recebe.Value));
  QRCaixaTransfDesc_Historico_Entrada.Value:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QRCaixaTransfCod_Historico_Entrada.Value));
  QRCaixaTransfDesc_Cidade_Remete.Value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRCaixaTransfCod_Filial_Remetente.Value));
  QRCaixaTransfDesc_Cidade_Recebe.Value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QRCaixaTransfCod_Filial_Recebe.Value));
  If QRCaixaTransfCod_Caixa_Mov.Text <> '' Then
    QRCaixaTransfDesc_Historico_Rel.Value := DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+FloatToStr(QRCaixaTransfCod_Historico_Caixa.Value))
  Else
    QRCaixaTransfDesc_Historico_Rel.Value := QRCaixaTransfDesc_Historico.Value;
  If QRCaixaTransfCod_Cadastro.Text <> '' Then
    QRCaixaTransfDesc_Complemento_Rel.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QRCaixaTransfCod_Cadastro.Value)) + '-'+QRCaixaTransfDesc_Complemento.Value
  Else
    QRCaixaTransfDesc_Complemento_Rel.Value := QRCaixaTransfDesc_Complemento.Value;
end;

procedure TDMCaixa_Transf.QCaixaTransfCabDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;

end;

end.
