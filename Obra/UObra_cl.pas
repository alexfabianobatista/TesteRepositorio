unit UObra_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, Oracle;

type
  TDMObra = class(TDataModule)
    QObra_Cad: TOracleDataSet1;
    QObra_CadCOD_OBRA: TIntegerField;
    QObra_CadCOD_FILIAL: TIntegerField;
    QObra_CadDESC_OBRA: TStringField;
    QObra_CadDESC_ENDERECO: TStringField;
    QObra_CadCOD_CIDADE: TIntegerField;
    QObra_CadDT_INICIO_OBRA: TDateTimeField;
    QObra_CadDT_FIM_OBRA: TDateTimeField;
    QObra_CadCOD_CADASTRO: TIntegerField;
    QObra_CadDT_CADASTRO_OBRA: TDateTimeField;
    QObra_CadCOD_USUARIO: TIntegerField;
    QObra_Caddesc_filial: TStringField;
    QObra_Caddesc_cidade: TStringField;
    QObra_Caddesc_cadastro: TStringField;
    QObra_Cons: TOracleDataSet1;
    QObra_ConsCOD_OBRA: TIntegerField;
    QObra_ConsCOD_FILIAL: TIntegerField;
    QObra_ConsDESC_OBRA: TStringField;
    QObra_ConsDESC_ENDERECO: TStringField;
    QObra_ConsCOD_CIDADE: TIntegerField;
    QObra_ConsDT_INICIO_OBRA: TDateTimeField;
    QObra_ConsDT_FIM_OBRA: TDateTimeField;
    QObra_ConsCOD_CADASTRO: TIntegerField;
    QObra_ConsDT_CADASTRO_OBRA: TDateTimeField;
    QObra_ConsCOD_USUARIO: TIntegerField;
    QObra_Req_Cab: TOracleDataSet1;
    QObra_Req_CabCOD_OBRA_REQ_CAB: TIntegerField;
    QObra_Req_CabDT_LANCAMENTO: TDateTimeField;
    QObra_Req_CabCOD_CADASTRO: TIntegerField;
    QObra_Req_CabCOD_USUARIO: TIntegerField;
    QObra_Req_Item: TOracleDataSet1;
    QObra_Req_ItemCOD_OBRA_REQ_ITEM: TIntegerField;
    QObra_Req_ItemCOD_OBRA_REQ_CAB: TIntegerField;
    QObra_Req_CabDT_EMISSAO: TDateTimeField;
    QObra_Req_CabCOD_OBRA: TIntegerField;
    QObra_Req_CabCOD_FILIAL: TIntegerField;
    QObra_Req_Itemdescricao: TStringField;
    QObra_Req_Itemval_total: TFloatField;
    QObra_Req_Cons: TOracleDataSet1;
    QObra_Req_ConsCOD_OBRA_REQ_CAB: TIntegerField;
    QObra_Req_ConsDT_LANCAMENTO: TDateTimeField;
    QObra_Req_ConsCOD_CADASTRO: TIntegerField;
    QObra_Req_ConsCOD_USUARIO: TIntegerField;
    QObra_Req_ConsDT_EMISSAO: TDateTimeField;
    QObra_Req_ConsCOD_OBRA: TIntegerField;
    QObra_Req_ConsCOD_FILIAL: TIntegerField;
    QObra_Req_ConsNOME: TStringField;
    QSomaObraReq: TOracleDataSet1;
    QSomaObraReqTOTAL: TFloatField;
    QObra_Req_CabIND_SITUACAO: TStringField;
    QContasPagar_Cab: TOracleDataSet1;
    QContasPagar_Mov: TOracleDataSet1;
    QContasPagar_CabCOD_FINALIDADE: TIntegerField;
    QContasPagar_CabCOD_BANCO_AGENCIA: TIntegerField;
    QContasPagar_CabCOD_CADASTRO: TIntegerField;
    QContasPagar_CabCOD_FILIAL: TIntegerField;
    QContasPagar_CabNUM_PARCELA: TIntegerField;
    QContasPagar_CabDESC_TIPO_DOCUMENTO: TStringField;
    QContasPagar_CabDT_MOVIMENTO: TDateTimeField;
    QContasPagar_CabDT_BAIXA: TDateTimeField;
    QContasPagar_CabDT_VENCIMENTO: TDateTimeField;
    QContasPagar_CabDT_EMISSAO: TDateTimeField;
    QContasPagar_CabDT_CAPITALIZACAO: TDateTimeField;
    QContasPagar_CabVAL_TITULO: TFloatField;
    QContasPagar_CabDESC_OBSERVACAO: TStringField;
    QContasPagar_CabIND_ACEITE: TStringField;
    QContasPagar_CabIND_SITUACAO: TStringField;
    QContasPagar_CabVAL_ORIGINAL: TFloatField;
    QContasPagar_CabCOD_DEPARTAMENTO: TIntegerField;
    QContasPagar_CabDT_VENCIMENTO_PRORROGADO: TDateTimeField;
    QContasPagar_CabCOD_RPA: TIntegerField;
    QContasPagar_CabCOD_OBRA_REQ_CAB: TIntegerField;
    QContasPagar_MovIND_TIPO_MOVIMENTO: TStringField;
    QContasPagar_MovDT_MOVIMENTO: TDateTimeField;
    QContasPagar_MovVAL_MOVIMENTO: TFloatField;
    QContasPagar_MovDESC_OBSERVACAO: TStringField;
    QContasPagar_MovCOD_USUARIO: TIntegerField;
    QContasPagar_MovDT_USUARIO: TDateTimeField;
    QContasPagar_MovCOD_LANCTO_CONTABIL_DEB: TIntegerField;
    QContasPagar_MovCOD_LANCTO_CONTABIL_CRED: TIntegerField;
    QContasPagar_MovIND_FORMA_PAGAMENTO: TStringField;
    QObra_Req_CabCOD_MOTIVO: TIntegerField;
    QObra_Req_Emite: TOracleDataSet1;
    QObra_Req_EmiteCOD_OBRA_REQ_CAB: TIntegerField;
    QObra_Req_EmiteDT_LANCAMENTO: TDateTimeField;
    QObra_Req_EmiteCOD_CADASTRO: TIntegerField;
    QObra_Req_EmiteCOD_USUARIO: TIntegerField;
    QObra_Req_EmiteNUM_REQUISICAO: TIntegerField;
    QObra_Req_EmiteDT_EMISSAO: TDateTimeField;
    QObra_Req_EmiteCOD_OBRA: TIntegerField;
    QObra_Req_EmiteCOD_FILIAL: TIntegerField;
    QObra_Req_EmiteIND_SITUACAO: TStringField;
    QObra_Req_EmiteCOD_MOTIVO: TIntegerField;
    QObra_Req_EmiteNOME: TStringField;
    QObra_Req_EmiteDESC_FILIAL: TStringField;
    QObra_Req_EmiteDESC_CIDADE: TStringField;
    QObra_Req_EmiteDESC_CEP: TStringField;
    QObra_Req_EmiteDESC_ENDERECO: TStringField;
    QObra_Req_EmiteNUM_CGC: TStringField;
    QObra_Req_EmiteDESC_INSCRICAO: TStringField;
    QObra_Req_EmiteDESC_TELEFONE: TStringField;
    QObra_Req_EmiteDESC_OBRA: TStringField;
    QObra_Req_EmiteCOD_ESTADO: TStringField;
    QObra_Req_ItemDESC_COMPLEMENTO: TStringField;
    QObra_Req_ItemVAL_UNITARIO: TFloatField;
    QObra_CadIND_KM_HR: TStringField;
    QObra_CadTROCA_OLEO: TFloatField;
    QObra_CadTROCA_FILTRO: TFloatField;
    QObra_CadREVISAO: TFloatField;
    QObra_CadVAL_MARCADOR: TFloatField;
    QObra_Req_CabCOD_OPERACAO: TIntegerField;
    QObra_Req_CabIND_TIPO_REQUISICAO: TStringField;
    QObra_Req_CabCOD_CENTRO_CUSTO: TIntegerField;
    QObra_Req_EmiteCOD_OPERACAO: TIntegerField;
    QObra_Req_EmiteNUM_NOTA_FISCAL: TIntegerField;
    QObra_Req_EmiteIND_TIPO_REQUISICAO: TStringField;
    QObra_Req_EmiteCOD_CENTRO_CUSTO: TIntegerField;
    QObra_Req_Emitedesc_centro_custo: TStringField;
    QObra_Req_CabVAL_ENTRADA: TFloatField;
    QObra_Req_CabVAL_DESCONTO: TFloatField;
    QObra_Req_CabVAL_ACRESCIMO: TFloatField;
    QObra_Req_EmiteVAL_DESCONTO: TFloatField;
    QObra_Req_EmiteVAL_ACRESCIMO: TFloatField;
    QObra_Req_EmiteDESC_OPERACAO: TStringField;
    OPRequisicaoCab: TOraclePackage;
    QObra_Req_Cabdesc_centro_custo: TStringField;
    QObra_Req_Cabdesc_operacao: TStringField;
    QObra_Req_Cabdesc_filial: TStringField;
    QObra_Req_Cabdesc_obra: TStringField;
    QObra_Req_ItemCOD_OBRA: TIntegerField;
    QObra_Req_ItemCOD_CENTRO_CUSTO: TIntegerField;
    QObra_Req_Emitedesc_finalidade: TStringField;
    QObra_Req_CabVAL_PIS: TFloatField;
    QObra_Req_CabVAL_COFINS: TFloatField;
    QObra_Req_CabVAL_IRRF: TFloatField;
    QObra_Req_CabVAL_CSLL: TFloatField;
    QObra_Req_CabVAL_INSS: TFloatField;
    QObra_Req_CabVAL_ISSQN: TFloatField;
    QObra_Req_CabDESC_COMPETENCIA: TStringField;
    QObra_Req_EmiteDESC_COMPETENCIA: TStringField;
    QObra_Req_CabIND_CONDICAO_PAGTO: TStringField;
    QObra_CadIND_SITUACAO: TStringField;
    QObra_ConsNOME: TStringField;
    QObra_CadDESC_LOTEAMENTO: TStringField;
    QObra_CadDESC_BAIRRO: TStringField;
    QObra_CadNUM_AREA_OBRA: TFloatField;
    QObra_CadNUM_AREA_TERRENO: TFloatField;
    QObra_CadCOD_CADASTRO_FUNCIONARIO: TIntegerField;
    QObra_CadVAL_M2: TFloatField;
    QObra_Caddesc_cadastro_empreiteiro: TStringField;
    QContasPagar_CabCOD_OBRA: TIntegerField;
    QObra_CadDESC_NUMERO_LOTE: TStringField;
    QObra_CadDESC_NUMERO_QUADRA: TStringField;
    QObra_CadVAL_OBRA_M2: TFloatField;
    QObra_Req_ItemQT_QUANTIDADE: TFloatField;
    QObra_Req_Itemdesc_unidade: TStringField;
    QObra_Req_Itemdesc_obra: TStringField;
    QObra_Req_ItemCOD_LOTE_TIPO: TIntegerField;
    QObra_Req_ItemCOD_PRODUTO: TFloatField;
    QObra_Req_CabNUM_REQUISICAO: TIntegerField;
    QObra_Req_CabNUM_NOTA_FISCAL: TIntegerField;
    QObra_Req_ConsNUM_REQUISICAO: TIntegerField;
    QContasPagar_CabNUM_TITULO: TFloatField;
    QContasPagar_MovCOD_CONTA_PAGAR_MOV: TIntegerField;
    QContasPagar_MovCOD_CONTA_PAGAR_CAB: TIntegerField;
    QContasPagar_CabCOD_CONTA_PAGAR_CAB: TIntegerField;
    QObra_CadNUM_DISTANCIA_KM: TIntegerField;
    QObra_Req_EmiteIND_IMPRIME_REQ_OBRA: TStringField;
    procedure QObra_CadCalcFields(DataSet: TDataSet);
    procedure QObra_CadAfterInsert(DataSet: TDataSet);
    procedure QObra_Req_CabCalcFields(DataSet: TDataSet);
    procedure QObra_Req_CabAfterInsert(DataSet: TDataSet);
    procedure QObra_Req_CabBeforePost(DataSet: TDataSet);
    procedure QObra_Req_ItemBeforeInsert(DataSet: TDataSet);
    procedure QObra_Req_ItemAfterInsert(DataSet: TDataSet);
    procedure QObra_Req_CabBeforeCancel(DataSet: TDataSet);
    procedure QObra_Req_CabBeforeInsert(DataSet: TDataSet);
    procedure QObra_Req_CabAfterCancel(DataSet: TDataSet);
    procedure QObra_Req_CabBeforeDelete(DataSet: TDataSet);
    procedure QObra_Req_CabBeforeEdit(DataSet: TDataSet);
    procedure QObra_Req_CabDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure QObra_Req_ItemBeforeEdit(DataSet: TDataSet);
    procedure QObra_Req_ItemCalcFields(DataSet: TDataSet);
    procedure QObra_Req_CabAfterPost(DataSet: TDataSet);
    procedure QObra_Req_CabAfterDelete(DataSet: TDataSet);
    procedure QObra_Req_EmiteCalcFields(DataSet: TDataSet);
    procedure QObra_Req_CabDT_EMISSAOValidate(Sender: TField);
    procedure QObra_Req_ItemCOD_PRODUTOChange(Sender: TField);
    procedure QObra_Req_ItemBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Function Func_IncluiObra_Cab(pDt_Emissao : TDateTime; pNumero,pCod_Obra,pCod_Cadastro,pCod_Filial,pCod_Operacao : Integer; pCod_Pagto : string) : Integer;
    Procedure Proc_IncluiObra_Item(pCod_Obra: Integer; pCod_Produto: Real; pCod_Obra_Req_Cab : Integer; pQuant, pVal_Unitario : Real; pObservacao : String; pCod_Lote_Tipo: Integer = 1);
  end;

var
  DMObra: TDMObra;

implementation

uses UOracle_cl, UUsuario_cl, USequencia_cl, UParamSistema_cl, UEstoque_cl;

{$R *.DFM}

procedure TDMObra.QObra_CadCalcFields(DataSet: TDataSet);
begin
  QObra_CadDesc_Filial.value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QObra_CadCod_Filial.Value));
  QObra_CadDesc_Cidade.value:=DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_CIDADE','COD_CIDADE = '+FloatToStr(QObra_CadCod_Cidade.Value));
  QObra_CadDesc_Cadastro.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QObra_CadCod_Cadastro.Value));
  QObra_CadDesc_Cadastro_Empreiteiro.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QObra_CadCod_Cadastro_Funcionario.Value));
end;

procedure TDMObra.QObra_CadAfterInsert(DataSet: TDataSet);
begin
  QObra_CadCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QObra_CadDt_Cadastro_Obra.Value := Date;
  QObra_CadCod_Filial.Value := DMUsuario.CodFilialUsuario;
end;

procedure TDMObra.QObra_Req_CabCalcFields(DataSet: TDataSet);
begin
{  QObra_Req_CabDesc_Obra.value:=DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+FloatToStr(QObra_Req_CabCod_Obra.Value));
  QObra_Req_Cabnome.value:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(QObra_Req_CabCod_Cadastro.Value));
  QObra_Req_CabDesc_Filial.value:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(QObra_Req_CabCod_Filial.Value));
  QObra_Req_CabDesc_Operacao.value:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QObra_Req_CabCod_Operacao.Value));
  QObra_Req_CabDesc_Centro_Custo.value:=DMOracle.BuscaNome('SELECT DESC_CENTRO_CUSTO FROM TB_CENTRO_CUSTO','COD_CENTRO_CUSTO = '+FloatToStr(QObra_Req_CabCod_Centro_Custo.Value));
}
end;

procedure TDMObra.QObra_Req_CabAfterInsert(DataSet: TDataSet);
begin
  QObra_Req_CabCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
  QObra_Req_CabCod_Filial.Value := DMUsuario.CodFilialUsuario;
  QObra_Req_CabDt_Emissao.Value := Date;
  QObra_Req_CabDt_Lancamento.Value := Date;
  QObra_Req_CabCod_Operacao.Value := 1;
end;

procedure TDMObra.QObra_Req_CabBeforePost(DataSet: TDataSet);
begin
  If QObra_Req_Item.State in [dsEdit,dsInsert] then
     QObra_Req_Item.Post;
  If QObra_Req_CabNum_Requisicao.Text = '' Then
   Begin
     QObra_Req_CabNum_Requisicao.Value := DMSequencia.Sequencia(QObra_Req_CabCod_Filial.Value,'OBRA_REQ');
     if DMOracle.DBCemapa.inTransaction then
      Begin
        DMOracle.DBCemapa.Commit;
        DMOracle.DBCemapa.StartTransaction;
      End;
   End;
end;

procedure TDMObra.QObra_Req_ItemBeforeInsert(DataSet: TDataSet);
begin
  If QObra_Req_Cab.State = dsInsert then
  begin
    QObra_Req_Cab.Post;
    QObra_Req_Cab.Edit;
  end;
  If QObra_Req_Cab.State <> dsEdit then
     raise Exception.Create('Requisição não está no modo de alteração!');
end;

procedure TDMObra.QObra_Req_ItemAfterInsert(DataSet: TDataSet);
begin
  QObra_Req_ItemCod_Obra_Req_Cab.Value := QObra_Req_CabCod_Obra_Req_Cab.Value; 
end;

procedure TDMObra.QObra_Req_CabBeforeCancel(DataSet: TDataSet);
begin
  If QObra_Req_Item.State in [dsEdit,dsInsert] then
    QObra_Req_Item.Cancel;

end;

procedure TDMObra.QObra_Req_CabBeforeInsert(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMObra.QObra_Req_CabAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.RollBack;
end;

procedure TDMObra.QObra_Req_CabBeforeDelete(DataSet: TDataSet);
begin
  if not(DMOracle.DBCemapa.inTransaction) then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMObra.QObra_Req_CabBeforeEdit(DataSet: TDataSet);
begin
  If QObra_Req_CabInd_Situacao.Value <> '1' then
    Raise Exception.Create('Esta Requisição já esta confirmada ou cancelada!');
  If Not DMOracle.DBCemapa.InTransaction then
     DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMObra.QObra_Req_CabDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback;
end;

procedure TDMObra.QObra_Req_ItemBeforeEdit(DataSet: TDataSet);
begin
  if QObra_Req_Cab.State = dsInsert then
  begin
    QObra_Req_Cab.Post;
    QObra_Req_Cab.Edit;
  end;
end;

procedure TDMObra.QObra_Req_ItemCalcFields(DataSet: TDataSet);
begin
  QObra_Req_ItemDescricao.value:=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QObra_Req_ItemCod_Produto.Value));
  QObra_Req_Itemdesc_unidade.Text :=   DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QObra_Req_ItemCod_Produto.Value));
  QObra_Req_Itemdesc_obra.Text :=   DMOracle.BuscaNome('SELECT DESC_OBRA FROM TB_OBRA','COD_OBRA = '+FloatToStr(QObra_Req_ItemCOD_OBRA.Value));
  If (QObra_Req_ItemQt_Quantidade.Value <> 0) And (QObra_Req_ItemVal_Unitario.Value <> 0) Then
     QObra_Req_ItemVal_Total.Value := QObra_Req_ItemQt_Quantidade.Value * QObra_Req_ItemVal_Unitario.Value;
end;

procedure TDMObra.QObra_Req_CabAfterPost(DataSet: TDataSet);
Var wCodigo : Real;
Begin
  wCodigo := QObra_Req_CabCod_Obra_Req_Cab.Value;
  QObra_Req_Cab.Close;
  QObra_Req_Cab.SetVariable('PK',wCodigo);
  QObra_Req_Cab.Open;
End;

procedure TDMObra.QObra_Req_CabAfterDelete(DataSet: TDataSet);
Begin
  DMOracle.DBCemapa.Commit;
End;

procedure TDMObra.QObra_Req_EmiteCalcFields(DataSet: TDataSet);
Var wFinalidade : String;
begin
//  QObra_Req_EmiteDesc_Centro_Custo.value:=DMOracle.BuscaNome('SELECT DESC_CENTRO_CUSTO FROM TB_CENTRO_CUSTO','COD_CENTRO_CUSTO = '+FloatToStr(QObra_Req_EmiteCod_Centro_Custo.Value));
  wFinalidade := DMOracle.BuscaNome('SELECT COD_FINALIDADE FROM TB_CONTA_PAGAR_CAB','COD_OBRA_REQ_CAB = '+FloatToStr(QObra_Req_EmiteCod_Obra_Req_Cab.Value));
  If wFinalidade <> '' Then
    QObra_Req_EmiteDesc_Finalidade.Value:=DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+wFinalidade);
End;

procedure TDMObra.QObra_Req_CabDT_EMISSAOValidate(Sender: TField);
begin
  if DMParamSistema.QParamSistemaCod_Empresa.Text = 'CAVALCA' then
  begin
    if QObra_Req_CabDt_Emissao.Value < (DMOracle.QDataServDTSERVIDOR.Value-5) then
    begin
      QObra_Req_Cab.cancel;
      showmessage('Não é permitido lançar requisições com data de emissão retroativa');
    end;
  end;

end;

Function TDMObra.Func_IncluiObra_Cab(pDt_Emissao : TDateTime; pNumero,pCod_Obra,pCod_Cadastro,pCod_Filial,pCod_Operacao : Integer; pCod_Pagto : string) : Integer;
Begin
    QObra_Req_Cab.Insert;
    QObra_Req_CabDT_LANCAMENTO.Value := pDt_Emissao;
    QObra_Req_CabCOD_CADASTRO.Value := pCod_Cadastro;
    QObra_Req_CabNUM_REQUISICAO.Value := pNumero;
    QObra_Req_CabDT_EMISSAO.Value := pDt_Emissao;
    If pCod_Obra <> 0 Then
       QObra_Req_CabCOD_OBRA.Value := pCod_Obra;
    QObra_Req_CabCOD_FILIAL.Value := pCod_Filial;
    QObra_Req_CabIND_SITUACAO.Value := '1';
    QObra_Req_CabCOD_OPERACAO.Value := pCod_Operacao;
    QObra_Req_CabNUM_NOTA_FISCAL.Value := pNumero;;
    QObra_Req_CabIND_TIPO_REQUISICAO.Value := 'NOTA';
    QObra_Req_CabIND_CONDICAO_PAGTO.Value := pCod_Pagto;
    QObra_Req_Cab.Post;

    Result := QObra_Req_CabCOD_OBRA_REQ_CAB.Value;

End;

Procedure TDMObra.Proc_IncluiObra_Item(pCod_Obra: Integer; pCod_Produto: Real; pCod_Obra_Req_Cab : Integer; pQuant, pVal_Unitario : Real; pObservacao : String; pCod_Lote_Tipo : Integer = 1);
Begin
    QObra_Req_Item.Insert;
    QObra_Req_ItemCOD_PRODUTO.Value := PCod_Produto;
    QObra_Req_ItemQT_QUANTIDADE.Value := pQuant;
    QObra_Req_ItemVAL_UNITARIO.Value := pVal_Unitario;
    QObra_Req_ItemCOD_OBRA.Value := pCod_Obra;
    QObra_Req_ItemCOD_OBRA_REQ_CAB.Value := pCod_Obra_Req_Cab;
    QObra_Req_ItemDESC_COMPLEMENTO.Value := pObservacao;
    QObra_req_itemCOD_LOTE_TIPO.Value := pCod_lote_Tipo;
    QObra_Req_Item.Post;
End;
procedure TDMObra.QObra_Req_ItemCOD_PRODUTOChange(Sender: TField);
begin
  with dmOracle, dmEstoque do
  begin
    QEstoqueCons.Open;
    If Trim(QObra_Req_ItemCOD_PRODUTO.Text) <> '' then
      if QEstoqueCons.RecordCount > 0 then
        QObra_Req_ItemCOD_LOTE_TIPO.Value := QEstoqueConsCOD_LOTE_TIPO.Value
      else
        QObra_Req_ItemCOD_LOTE_TIPO.Value := 1;
  end;
end;

procedure TDMObra.QObra_Req_ItemBeforePost(DataSet: TDataSet);
begin
  If Trim(QObra_Req_ItemCOD_OBRA.Text) = '' Then
     Raise Exception.Create('Para lançamento de requisição, obrigatório preencher uma OBRA/EVENTO!');
  If Trim(QObra_Req_ItemCOD_PRODUTO.Text) = '' Then
     Raise Exception.Create('Para lançamento de requisição, obrigatório preencher um PRODUTO!');
end;

End.
