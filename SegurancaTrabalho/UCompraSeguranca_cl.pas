unit UCompraSeguranca_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMCompraSeguranca = class(TDataModule)
    QRNotasRelacao: TOracleDataSet1;
    QCompraEquipCons: TOracleDataSet1;
    QCompraEquipConsCOD_COMPRA_EQUIPAMENTO_CAB: TIntegerField;
    QCompraEquipConsDESC_FILIAL: TStringField;
    QCompraEquipConsDATA_ENTRADA: TDateTimeField;
    QCompraEquipConsIND_SITUACAO: TStringField;
    QCompraEquipConsNOME: TStringField;
    QCompraEquipCab: TOracleDataSet1;
    QCompraEquipCabdesc_filial: TStringField;
    QCompraEquipCabCOD_COMPRA_EQUIPAMENTO_CAB: TIntegerField;
    QCompraEquipCabCOD_FILIAL: TIntegerField;
    QCompraEquipCabCOD_FUNCIONARIO: TIntegerField;
    QCompraEquipCabDATA_ENTRADA: TDateTimeField;
    QCompraEquipCabIND_SITUACAO: TStringField;
    QCompraEquipCabNUM_NOTA: TIntegerField;
    QCompraEquipCabDT_EMISSAO: TDateTimeField;
    QCompraEquipCabCOD_NOTA_CAB: TIntegerField;
    QCompraEquipCabdesc_fornecedor: TStringField;
    QCompraEquipCabCOD_CADASTRO: TIntegerField;
    QCompraEquipItem: TOracleDataSet1;
    QCompraEquipItemCOD_COMPRA_EQUIPAMENTO_ITEM: TIntegerField;
    QCompraEquipItemCOD_COMPRA_EQUIPAMENTO_CAB: TIntegerField;
    QCompraEquipItemCOD_PRODUTO_SEGURANCA: TIntegerField;
    QCompraEquipItemQT_QUANTIDADE: TFloatField;
    QCompraEquipItemVAL_ITEM: TFloatField;
    QCompraEquipItemdesc_produto_seguranca: TStringField;
    QCompraEquipItemval_total_item: TFloatField;
    QCompraEquipCabCOD_USUARIO: TIntegerField;
    QCompraEquipItemCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QCompraEquipItemdesc_caracteristica_produto: TStringField;
    QRNotasRelacaoCOD_FILIAL: TIntegerField;
    QRNotasRelacaoCOD_CADASTRO: TIntegerField;
    QRNotasRelacaoNOME: TStringField;
    QRNotasRelacaoCOD_ESTADO: TStringField;
    QRNotasRelacaoNUM_NOTA: TIntegerField;
    QRNotasRelacaoCOD_SERIE: TStringField;
    QRNotasRelacaoDT_EMISSAO: TDateTimeField;
    QRNotasRelacaoDT_RECEBIMENTO: TDateTimeField;
    QRNotasRelacaoTOTAL_ITEM: TFloatField;
    QRMovEstoqueSeg: TOracleDataSet1;
    QRMovEstoqueSegDATA_ENTRADA: TDateTimeField;
    QRMovEstoqueSegCOD_NOTA_CAB: TIntegerField;
    QRMovEstoqueSegCOD_FILIAL: TIntegerField;
    QRMovEstoqueSegCOD_CADASTRO: TIntegerField;
    QRMovEstoqueSegNOME: TStringField;
    QRMovEstoqueSegCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRMovEstoqueSegDESC_PRODUTO_SEGURANCA: TStringField;
    QRMovEstoqueSegCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QRMovEstoqueSegDESC_CARACTERISTICA_PRODUTO: TStringField;
    QRMovEstoqueSegQT_QUANTIDADE: TFloatField;
    QRMovEstoqueSegVAL_ITEM: TFloatField;
    QRPosicaoCompra: TOracleDataSet1;
    QRPosicaoCompraCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRPosicaoCompraDESC_PRODUTO_SEGURANCA: TStringField;
    QRPosicaoCompraCOD_FILIAL: TIntegerField;
    QRPosicaoCompraDESC_FILIAL: TStringField;
    QRPosicaoCompraCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QRPosicaoCompraDESC_CARACTERISTICA_PRODUTO: TStringField;
    QRPosicaoCompraQT_ESTOQUE: TFloatField;
    QRPosicaoCompraVL_CUSTO_MEDIO: TFloatField;
    QRPosicaoCompraVL_ULTIMO_CUSTO: TFloatField;
    QRPosicaoCompraQT_EFETIVO: TFloatField;
    QRPosicaoCompraQT_TERCEIRIZADO: TFloatField;
    procedure QCompraEquipCabCalcFields(DataSet: TDataSet);
    procedure QCompraEquipCabAfterInsert(DataSet: TDataSet);
    procedure QCompraEquipItemCalcFields(DataSet: TDataSet);
    procedure QCompraEquipItemAfterInsert(DataSet: TDataSet);
    procedure QCompraEquipCabAfterOpen(DataSet: TDataSet);
    procedure QCompraEquipCabBeforeDelete(DataSet: TDataSet);
    procedure QCompraEquipItemBeforeEdit(DataSet: TDataSet);
    procedure QCompraEquipItemBeforeInsert(DataSet: TDataSet);
    procedure QCompraEquipItemBeforePost(DataSet: TDataSet);
    procedure QCompraEquipCabBeforePost(DataSet: TDataSet);
    procedure QCompraEquipCabAfterClose(DataSet: TDataSet);
    procedure QCompraEquipCabAfterDelete(DataSet: TDataSet);
    procedure QCompraEquipCabDeleteError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCompraSeguranca: TDMCompraSeguranca;

implementation

uses UOracle_cl, {UCompraProdutoCad,} UEstoqueSeguranca_cl, UUsuario_cl;

{$R *.DFM}

procedure TDMCompraSeguranca.QCompraEquipCabAfterInsert(
  DataSet: TDataSet);
begin
  QCompraEquipCabDATA_ENTRADA.Value:=DMOracle.DataServ;;
  QCompraEquipItem.Close;
  QCompraEquipItem.open;
end;

procedure TDMCompraSeguranca.QCompraEquipItemCalcFields(
  DataSet: TDataSet);
begin
  if Trim(QCompraEquipItemCOD_PRODUTO_SEGURANCA.text) <> '' then
    QCompraEquipItemdesc_produto_seguranca.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                                                       'COD_PRODUTO_SEGURANCA = '+Trim(QCompraEquipItemCOD_PRODUTO_SEGURANCA.text));
  if Trim(QCompraEquipItemCOD_CARACTERISTICA_PRODUTO.text) <> '' then
    QCompraEquipItemdesc_caracteristica_produto.Value := DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA_PRODUTO FROM TB_CARACTERISTICA_PRODUTO',
                                                                            'COD_CARACTERISTICA_PRODUTO = '+Trim(QCompraEquipItemCOD_CARACTERISTICA_PRODUTO.text));
  if (Trim(QCompraEquipItemQT_QUANTIDADE.Text) <> '') and (Trim(QCompraEquipItemVAL_ITEM.Text) <> '') then
    QCompraEquipItemval_total_item.Value := QCompraEquipItemQT_QUANTIDADE.Value*QCompraEquipItemVAL_ITEM.Value;
end;

procedure TDMCompraSeguranca.QCompraEquipItemAfterInsert(
  DataSet: TDataSet);
begin
  QCompraEquipItemCOD_COMPRA_EQUIPAMENTO_CAB.Value := QCompraEquipCabCOD_COMPRA_EQUIPAMENTO_CAB.Value;
end;

procedure TDMCompraSeguranca.QCompraEquipCabAfterOpen(DataSet: TDataSet);
begin
  QCompraEquipItem.Close;
  QCompraEquipItem.open;
end;

procedure TDMCompraSeguranca.QCompraEquipCabBeforeDelete(
  DataSet: TDataSet);
begin
  if QCompraEquipCabIND_SITUACAO.Value = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível excluir Compra  - Compra Confirmada');
{  begin
    QCompraEquipItem.First;
    while not QCompraEquipItem.Eof do
    begin
      DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QCompraEquipCabCOD_FILIAL.Value,QCompraEquipItemCOD_PRODUTO_SEGURANCA.Value,
                               QCompraEquipItemQT_QUANTIDADE.Value,QCompraEquipItemVAL_ITEM.Value,'-');
      QCompraEquipItem.Next;
    end;
  end;}
  if not DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.StartTransaction; //inicia transação
  //exclui os ítens da compra
  QCompraEquipItem.First;
  While not QCompraEquipItem.Eof do
  Begin
    QCompraEquipItem.Delete;
//    QCompraEquipItem.Next;
  end;
end;

procedure TDMCompraSeguranca.QCompraEquipItemBeforeEdit(
  DataSet: TDataSet);
begin
  if QCompraEquipCab.State <> DSEdit then
    Raise Exception.Create('Compra não está em modo de Alteração');
  if QCompraEquipCabIND_SITUACAO.Value = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível alterar ítens - Compra Confirmada');
end;

procedure TDMCompraSeguranca.QCompraEquipItemBeforeInsert(
  DataSet: TDataSet);
begin
  if not(QCompraEquipCab.State in [DsInsert,DSEdit]) then
    Raise Exception.Create('Compra não está em modo de inserção ou Alteração');
  if QCompraEquipCabIND_SITUACAO.Value = 'CONFIRMADA' then
    Raise Exception.Create('Não é possível inserir ítens - Compra Confirmada');
end;

procedure TDMCompraSeguranca.QCompraEquipCabCalcFields(DataSet: TDataSet);
begin
  if Trim(QCompraEquipCabCOD_CADASTRO.text) <> '' then
    QCompraEquipCabdesc_fornecedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO',
                                                                'COD_CADASTRO = '+Trim(QCompraEquipCabCOD_CADASTRO.text));
  if Trim(QCompraEquipCabCOD_FILIAL.text) <> '' then
    QCompraEquipCabdesc_filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                           'COD_FILIAL = '+Trim(QCompraEquipCabCOD_FILIAL.text));
end;

procedure TDMCompraSeguranca.QCompraEquipItemBeforePost(DataSet: TDataSet);
begin
  if QCompraEquipCab.State in [DSInsert] then
  begin
    QCompraEquipCab.Post;
    QCompraEquipCab.RefreshRecord;
    QCompraEquipCab.Edit;
  end;
end;

procedure TDMCompraSeguranca.QCompraEquipCabBeforePost(DataSet: TDataSet);
begin
  if QCompraEquipCab.State in [DSInsert] then
  begin
    QCompraEquipCabIND_SITUACAO.Value := 'DIGITADA';
    QCompraEquipCabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
  end;
end;

procedure TDMCompraSeguranca.QCompraEquipCabAfterClose(DataSet: TDataSet);
begin
  QCompraEquipItem.Close;
end;

procedure TDMCompraSeguranca.QCompraEquipCabAfterDelete(DataSet: TDataSet);
begin
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit; //finaliza transação
end;

procedure TDMCompraSeguranca.QCompraEquipCabDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Rollback; //desfaz transação
end;

end.
