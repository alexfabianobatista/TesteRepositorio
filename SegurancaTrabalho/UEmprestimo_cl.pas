unit UEmprestimo_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, variants;

type
  TDMEmprestimo = class(TDataModule)
    QEmprestimo: TOracleDataSet1;
    QEmprestimoItem: TOracleDataSet1;
    QEmprestimoCOD_EMPRESTIMO_CAB: TIntegerField;
    QEmprestimoCOD_FUNCIONARIO: TIntegerField;
    QEmprestimoDT_EMPRESTIMO: TDateTimeField;
    QEmprestimoIND_RETORNAVEL: TStringField;
    QEmprestimoItemCOD_EMPRESTIMO_ITEM: TIntegerField;
    QEmprestimoItemCOD_EMPRESTIMO_CAB: TIntegerField;
    QEmprestimoItemQT_EMPRESTIMO: TIntegerField;
    DSEmprestimoItem: TDataSource;
    QEmprestimoCons: TOracleDataSet1;
    QEmprestimoConsCOD_EMPRESTIMO_CAB: TIntegerField;
    QEmprestimoConsCOD_FUNCIONARIO: TIntegerField;
    QEmprestimoConsDT_EMPRESTIMO: TDateTimeField;
    QEmprestimoConsIND_RETORNAVEL: TStringField;
    QEmprestimoConsDESC_FUNCIONARIO: TStringField;
    QEmprestimodesc_funcionario: TStringField;
    QEmprestimoItemDT_DEVOLUCAO: TDateTimeField;
    QEmprestimodesc_filial: TStringField;
    QEmprestimoCOD_FILIAL: TIntegerField;
    QRRelacaoEmprestimo: TOracleDataSet1;
    QRPosicaoEmprestimo: TOracleDataSet1;
    QREmprestimoRetornavel: TOracleDataSet1;
    QEquipamentoEmprestado: TOracleDataSet1;
    QEquipamentoDevolvido: TOracleDataSet1;
    QEquipamentoEmprestadoCOD_EMPRESTIMO_ITEM: TIntegerField;
    QEquipamentoEmprestadoCOD_EMPRESTIMO_CAB: TIntegerField;
    QEquipamentoEmprestadoQT_EMPRESTIMO: TIntegerField;
    QEquipamentoEmprestadoDT_DEVOLUCAO: TDateTimeField;
    QEquipamentoDevolvidoCOD_EMPRESTIMO_ITEM: TIntegerField;
    QEquipamentoDevolvidoCOD_EMPRESTIMO_CAB: TIntegerField;
    QEquipamentoDevolvidoQT_EMPRESTIMO: TIntegerField;
    QEquipamentoDevolvidoDT_DEVOLUCAO: TDateTimeField;
    DSEquipamentoEmprestado: TDataSource;
    DSEquipamentoDevolvido: TDataSource;
    QEmprestimoItemQT_ORIGINAL_EMPRESTIMO: TIntegerField;
    QEmprestimoItemCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEmprestimoItemdesc_produto_seguranca: TStringField;
    QREmprestimoRetornavelCOD_EMPRESTIMO_CAB: TIntegerField;
    QREmprestimoRetornavelCOD_FUNCIONARIO: TIntegerField;
    QREmprestimoRetornavelDESC_FUNCIONARIO: TStringField;
    QREmprestimoRetornavelDT_EMPRESTIMO: TDateTimeField;
    QREmprestimoRetornavelQT_EMPRESTIMO: TIntegerField;
    QREmprestimoRetornavelCOD_PRODUTO_SEGURANCA: TIntegerField;
    QREmprestimoRetornavelDESC_PRODUTO_SEGURANCA: TStringField;
    QREmprestimoRetornavelDESC_CIDADE: TStringField;
    QRRelacaoEmprestimoCOD_EMPRESTIMO_CAB: TIntegerField;
    QRRelacaoEmprestimoCOD_FUNCIONARIO: TIntegerField;
    QRRelacaoEmprestimoDT_EMPRESTIMO: TDateTimeField;
    QRRelacaoEmprestimoIND_RETORNAVEL: TStringField;
    QRRelacaoEmprestimoCOD_FILIAL: TIntegerField;
    QRRelacaoEmprestimoDESC_FUNCIONARIO: TStringField;
    QRRelacaoEmprestimoDESC_FILIAL: TStringField;
    QRRelacaoEmprestimoQT_EMPRESTIMO: TIntegerField;
    QRRelacaoEmprestimoCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRRelacaoEmprestimoDESC_PRODUTO_SEGURANCA: TStringField;
    QEquipamentoEmprestadoQT_ORIGINAL_EMPRESTIMO: TIntegerField;
    QEquipamentoEmprestadoCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEquipamentoEmprestadoDESC_PRODUTO_SEGURANCA: TStringField;
    QEquipamentoDevolvidoQT_ORIGINAL_EMPRESTIMO: TIntegerField;
    QEquipamentoDevolvidoCOD_PRODUTO_SEGURANCA: TIntegerField;
    QEquipamentoDevolvidoDESC_PRODUTO_SEGURANCA: TStringField;
    QEquipamentoDevolvidoQT_DEVOLUCAO_EMPRESTIMO: TFloatField;
    QEmprestimoItemCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEmprestimoItemdesc_caracteristica_produto: TStringField;
    QEquipamentoEmprestadoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEquipamentoEmprestadoDESC_CARACTERISTICA_PRODUTO: TStringField;
    QEquipamentoDevolvidoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QEquipamentoDevolvidoDESC_CARACTERISTICA_PRODUTO: TStringField;
    QEmprestimoIND_SITUACAO: TStringField;
    QRRelacaoEmprestimoIND_SITUACAO: TStringField;
    QRRelacaoEmprestimoQT_ORIGINAL_EMPRESTIMO: TIntegerField;
    QRPosicaoEmprestimoCOD_FILIAL: TIntegerField;
    QRPosicaoEmprestimoCOD_PRODUTO_SEGURANCA: TIntegerField;
    QRPosicaoEmprestimoDESC_PRODUTO_SEGURANCA: TStringField;
    QRPosicaoEmprestimoDESC_CARACTERISTICA_PRODUTO: TStringField;
    QRPosicaoEmprestimoDESC_FILIAL: TStringField;
    QRPosicaoEmprestimoQT_ESTOQUE: TFloatField;
    QRPosicaoEmprestimoQT_EMPRESTIMO: TFloatField;
    QRPosicaoEmprestimoCOD_CARACTERISTICA_PRODUTO: TIntegerField;
    QREmprestimoNaoRetornavel: TOracleDataSet1;
    QREmprestimoNaoRetornavelCOD_EMPRESTIMO_CAB: TIntegerField;
    QREmprestimoNaoRetornavelCOD_FUNCIONARIO: TIntegerField;
    QREmprestimoNaoRetornavelDESC_FUNCIONARIO: TStringField;
    QREmprestimoNaoRetornavelDT_EMPRESTIMO: TDateTimeField;
    QREmprestimoNaoRetornavelQT_EMPRESTIMO: TIntegerField;
    QREmprestimoNaoRetornavelCOD_PRODUTO_SEGURANCA: TIntegerField;
    QREmprestimoNaoRetornavelDESC_PRODUTO_SEGURANCA: TStringField;
    QREmprestimoNaoRetornavelDESC_CIDADE: TStringField;
    procedure DSEmprestimoItemStateChange(Sender: TObject);
    procedure QEmprestimoAfterOpen(DataSet: TDataSet);
    procedure QEmprestimoAfterDelete(DataSet: TDataSet);
    procedure QEmprestimoAfterInsert(DataSet: TDataSet);
    procedure QEmprestimoItemAfterInsert(DataSet: TDataSet);
    procedure QEmprestimoItemBeforePost(DataSet: TDataSet);
    procedure QEmprestimoCalcFields(DataSet: TDataSet);
    procedure QEmprestimoItemCalcFields(DataSet: TDataSet);
    procedure QEmprestimoItemBeforeDelete(DataSet: TDataSet);
    procedure QEmprestimoItemAfterPost(DataSet: TDataSet);
    procedure QEmprestimoItemBeforeInsert(DataSet: TDataSet);
    procedure QEmprestimoBeforeEdit(DataSet: TDataSet);
    procedure QEmprestimoBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMEmprestimo: TDMEmprestimo;

implementation

uses UOracle_cl, UEmprestimoCad, UProdutoSeguranca_cl,
  UEstoqueSeguranca_cl;

{$R *.DFM}

procedure TDMEmprestimo.DSEmprestimoItemStateChange(Sender: TObject);
begin
  if DSEmprestimoItem.State in [DSInsert,DSEdit] then
  begin
    FEmprestimoCad.BTProdutoCons.Enabled:=true;
    FEmprestimoCad.BTCaracteristicaCons.Enabled:=true;
  end
  else
  begin
    FEmprestimoCad.BTProdutoCons.Enabled:=False;
    FEmprestimoCad.BTCaracteristicaCons.Enabled:=False;
  end;
end;

procedure TDMEmprestimo.QEmprestimoAfterOpen(DataSet: TDataSet);
begin
  QEmprestimoItem.Close;
  QEmprestimoItem.setVariable('COD_EMPRESTIMO_CAB',QEmprestimoCod_Emprestimo_Cab.Value);
  QEmprestimoItem.setVariable('COD_EMPRESTIMO_ITEM',Null);
  QEmprestimoItem.open;
end;

procedure TDMEmprestimo.QEmprestimoAfterDelete(DataSet: TDataSet);
begin
  QEmprestimoItem.Close;
  QEmprestimoItem.Open;
end;

procedure TDMEmprestimo.QEmprestimoAfterInsert(DataSet: TDataSet);
begin
  QEmprestimoItem.Close;
  QEmprestimoItem.setVariable('COD_EMPRESTIMO_CAB',QEmprestimoCod_Emprestimo_Cab.Value);
  QEmprestimoItem.open;
  QEmprestimoDt_Emprestimo.Value:=DMOracle.DataServ;
  QEmprestimoInd_Situacao.Value := 'DIGITADO';
end;

procedure TDMEmprestimo.QEmprestimoItemAfterInsert(DataSet: TDataSet);
begin
  QEmprestimoItemCod_Emprestimo_Cab.Value := QEmprestimoCod_Emprestimo_Cab.Value;
end;

procedure TDMEmprestimo.QEmprestimoItemBeforePost(DataSet: TDataSet);
var
  wQtEstoque,wQtEmprestimo :real;
begin
  if QEmprestimo.state in [DSInsert] then
    DMEmprestimo.QEmprestimo.Post;
  //Este bloco é responsavel pela baixa dos produtos do estoque,
  //é executando quando adicionamos um item ao emprestimo
  if QEmprestimoItem.State in [DSInsert] then
  begin
    //verifica se o produto é da mesma categoria do empréstimo
    if Trim(DMOracle.BuscaNome('SELECT IND_RETORNAVEL FROM TB_PRODUTO_SEGURANCA','COD_PRODUTO_SEGURANCA = '+
            Trim(QEmprestimoItemCod_Produto_Seguranca.Text)))<>Trim(DMEmprestimo.QEmprestimoIND_RETORNAVEL.Text) then
      raise exception.Create('Este Produto não pode ser emprestado nesta categoria de Empréstimo.');
    //verifica estoque
    try
      wQtEstoque := StrToFloat(DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE_SEGURANCA',
                                                  'COD_PRODUTO_SEGURANCA = '+QEmprestimoItemCOD_PRODUTO_SEGURANCA.Text+
                                                  ' AND COD_FILIAL = '+QEmprestimoCOD_FILIAL.Text+
                                                  ' AND COD_CARACTERISTICA_PRODUTO = '+QEmprestimoItemCOD_CARACTERISTICA_PRODUTO.Text));
    except
      wQtEstoque := 0;
    end;
    if wQtEstoque < QEmprestimoItemQT_EMPRESTIMO.Value then
    begin
      DMEmprestimo.QEmprestimoItem.cancel;
      Raise exception.Create('Quantidade insuficiente de equipamentos existentes na filial para este empréstimo');
    end;

    DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QEmprestimoCOD_FILIAL.Value,QEmprestimoItemCOD_PRODUTO_SEGURANCA.Value,
                                                QEmprestimoItemCOD_CARACTERISTICA_PRODUTO.Value,QEmprestimoItemQT_Emprestimo.Value,0,'-');
    QEmprestimoItemQT_Original_Emprestimo.Value:=QEmprestimoItemQT_Emprestimo.Value;
  end;
end;

procedure TDMEmprestimo.QEmprestimoCalcFields(DataSet: TDataSet);
begin
  if Trim(QEmprestimoCod_Funcionario.text) <> '' then
    QEmprestimoDesc_Funcionario.Value := DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO',
        'COD_FUNCIONARIO = '+Trim(QEmprestimoCod_Funcionario.text));
  if Trim(QEmprestimoCod_Filial.text) <> '' then
    QEmprestimoDesc_Filial.Value := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
        'COD_FILIAL = '+Trim(QEmprestimoCod_Filial.text));
end;

procedure TDMEmprestimo.QEmprestimoItemCalcFields(DataSet: TDataSet);
begin
   if Trim(QEmprestimoItemCod_Produto_Seguranca.text) <> '' then
    QEmprestimoItemDesc_Produto_Seguranca.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
        'COD_PRODUTO_SEGURANCA = '+Trim(QEmprestimoItemCod_Produto_Seguranca.text));
   if Trim(QEmprestimoItemCod_Caracteristica_Produto.text) <> '' then
     QEmprestimoItemDesc_Caracteristica_Produto.Text := DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA_PRODUTO FROM TB_CARACTERISTICA_PRODUTO',
     'COD_CARACTERISTICA_PRODUTO = '+Trim(QEmprestimoItemCod_Caracteristica_Produto.text));
end;

procedure TDMEmprestimo.QEmprestimoItemBeforeDelete(DataSet: TDataSet);
begin
  if QEmprestimoInd_Situacao.Value = 'CONFIRMADO' then
    Raise Exception.Create('Não é possível Excluir o ítem - Empréstimo Confirmado');
  if not (QEmprestimo.State in [DSEdit]) then
    Raise Exception.Create('Empréstimo não esta em modo de Alteração');
  if (Trim(QEmprestimoItemDT_DEVOLUCAO.Text) <> '') and
    (QEmprestimoItemQT_EMPRESTIMO.Value <> QEmprestimoItemQT_ORIGINAL_EMPRESTIMO.Value) then
  Raise Exception.Create('Não é possível Excluir ítem com Quantidade Devolvida');
    DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QEmprestimoCOD_FILIAL.Value,QEmprestimoItemCOD_PRODUTO_SEGURANCA.Value,
                                                  QEmprestimoItemCOD_CARACTERISTICA_PRODUTO.Value,QEmprestimoItemQT_Emprestimo.Value,0.0,'+');
end;

procedure TDMEmprestimo.QEmprestimoItemAfterPost(DataSet: TDataSet);
begin
  QEquipamentoDevolvido.close;
  QEquipamentoDevolvido.setVariable('COD_EMPRESTIMO_CAB',QEmprestimoCod_Emprestimo_Cab.Value);
  QEquipamentoDevolvido.open;

  QEquipamentoEmprestado.close;
  QEquipamentoEmprestado.setVariable('COD_EMPRESTIMO_CAB',QEmprestimoCod_Emprestimo_Cab.Value);
  QEquipamentoEmprestado.open;
end;

procedure TDMEmprestimo.QEmprestimoItemBeforeInsert(DataSet: TDataSet);
begin
  if not (QEmprestimo.State in [DSInsert,DSEdit]) then
    Raise Exception.Create('Empréstimo não está em modo de Inserção ou Alteração');
  if Trim(QEmprestimoInd_Situacao.Text) = 'CONFIRMADO' then
    Raise Exception.Create('Não é possível inserir ítens em um Empréstimo Confirmado');

  if QEmprestimo.State in [DSInsert] then
  begin
    QEmprestimo.post;
    QEmprestimo.RefreshRecord;
    QEmprestimo.Edit;
  end;
end;

procedure TDMEmprestimo.QEmprestimoBeforeEdit(DataSet: TDataSet);
begin
  if QEmprestimoInd_Situacao.Value = 'CONFIRMADO' then
    Raise Exception.Create('Não é possível Alterar um Empréstimo Confirmado');
//  if QEmprestimoItem.RecordCount <> 0 then
//    Raise Exception.Create('Não é possível Alterar um Empréstimo com Ítens');
end;

procedure TDMEmprestimo.QEmprestimoBeforeDelete(DataSet: TDataSet);
begin
  if QEmprestimoInd_Situacao.Value = 'CONFIRMADO' then
    Raise Exception.Create('Não é possível Excluir um Empréstimo Confirmado');
  if QEmprestimoItem.RecordCount <> 0 then
    Raise Exception.Create('Não é possível Excluir um Empréstimo com Ítens');
end;

end.
