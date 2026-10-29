unit UProdutoSkyhub_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste, DBClient, UBiblioteca, Dialogs, Variants;

type
  TDMProdutoSkyhub = class(TDataModule)
    QProdutoSkyhub: TOracleDataSet1;
    QProdutoSkyhubCons: TOracleDataSet1;
    QVariacaoSkyhub: TOracleDataSet1;
    QProdutoSkyhubdesc_situacao: TStringField;
    QRConexaoProdutoSkyhub: TOracleDataSet1;
    QRConexaoProdutoSkyhubCOD_PRODUTO: TFloatField;
    QRConexaoProdutoSkyhubDESC_PRODUTO: TStringField;
    QProdutoSkyhubUrl: TOracleDataSet1;
    QProdutoSkyhubdesc_cor_situacao: TStringField;
    QProdutoSkyhubCOD_PRODUTO_SKYHUB: TFloatField;
    QProdutoSkyhubCOD_PRODUTO: TFloatField;
    QProdutoSkyhubDESC_PRODUTO: TStringField;
    QProdutoSkyhubDESC_STATUS: TStringField;
    QProdutoSkyhubDESC_MARCA: TStringField;
    QProdutoSkyhubVAL_ALTURA: TFloatField;
    QProdutoSkyhubVAL_LARGURA: TFloatField;
    QProdutoSkyhubVAL_COMPRIMENTO: TFloatField;
    QProdutoSkyhubCOD_PRODUTO_SKYHUB_PAI: TFloatField;
    QProdutoSkyhubDESC_CATEGORIA: TStringField;
    QProdutoSkyhubDESC_LINK_IMAGEM_1: TStringField;
    QProdutoSkyhubDESC_LINK_IMAGEM_2: TStringField;
    QProdutoSkyhubDESC_LINK_IMAGEM_3: TStringField;
    QProdutoSkyhubDESC_LINK_IMAGEM_4: TStringField;
    QProdutoSkyhubESP_ALIMENTACAO: TStringField;
    QProdutoSkyhubESP_APARELHOSCOMPATIVEIS: TStringField;
    QProdutoSkyhubESP_CONTEUDODAEMBALAGEM: TStringField;
    QProdutoSkyhubESP_COR: TStringField;
    QProdutoSkyhubESP_DATADELANCAMENTONOMERCADO: TStringField;
    QProdutoSkyhubESP_DIMENSOESPRODUTO: TStringField;
    QProdutoSkyhubESP_FABRICANTE: TStringField;
    QProdutoSkyhubESP_GARANTIADEFORNECEDOR: TStringField;
    QProdutoSkyhubESP_MAISINFORMACOES: TStringField;
    QProdutoSkyhubESP_MANUAL: TStringField;
    QProdutoSkyhubESP_MATERIALCOMPOSICAO: TStringField;
    QProdutoSkyhubESP_MODELO: TStringField;
    QProdutoSkyhubESP_PESOLIQDAEMBALAGEMCPRODUTO: TStringField;
    QProdutoSkyhubESP_PESOLIQDOPRODUTO: TStringField;
    QProdutoSkyhubESP_RECURSOSFUNCIONALIDADES: TStringField;
    QProdutoSkyhubESP_REFERENCIADOMODELO: TStringField;
    QProdutoSkyhubESP_SAC: TStringField;
    QProdutoSkyhubESP_TAMANHO: TStringField;
    QProdutoSkyhubESP_VIDEO: TStringField;
    QProdutoSkyhubESP_VOLTAGEM: TStringField;
    QProdutoSkyhubVAL_PESO: TFloatField;
    QProdutoSkyhubCOD_CATEGORIA_ML: TStringField;
    QProdutoSkyhubIMAGEM_1: TBlobField;
    QProdutoSkyhubIMAGEM_2: TBlobField;
    QProdutoSkyhubIMAGEM_3: TBlobField;
    QProdutoSkyhubIMAGEM_4: TBlobField;
    QProdutoSkyhubDESC_INFORMACOES_ADICIONAIS: TMemoField;
    QProdutoSkyhubDT_ATUALIZACAO_SKYHUB: TDateTimeField;
    QProdutoSkyhubDT_ATUALIZACAO_ML: TDateTimeField;
    QProdutoSkyhubDESC_CONEXAO_SKYHUB: TStringField;
    QProdutoSkyhubDESC_CONEXAO_ML: TStringField;
    QProdutoSkyhubConsCOD_PRODUTO_SKYHUB: TFloatField;
    QProdutoSkyhubConsCOD_PRODUTO: TFloatField;
    QProdutoSkyhubConsDESC_PRODUTO: TStringField;
    QProdutoSkyhubConsDESC_STATUS: TStringField;
    QProdutoSkyhubConsDESC_MARCA: TStringField;
    QProdutoSkyhubConsVAL_ALTURA: TFloatField;
    QProdutoSkyhubConsVAL_LARGURA: TFloatField;
    QProdutoSkyhubConsVAL_COMPRIMENTO: TFloatField;
    QProdutoSkyhubConsCOD_PRODUTO_SKYHUB_PAI: TFloatField;
    QProdutoSkyhubConsDESC_CATEGORIA: TStringField;
    QProdutoSkyhubConsDESC_LINK_IMAGEM_1: TStringField;
    QProdutoSkyhubConsDESC_LINK_IMAGEM_2: TStringField;
    QProdutoSkyhubConsDESC_LINK_IMAGEM_3: TStringField;
    QProdutoSkyhubConsDESC_LINK_IMAGEM_4: TStringField;
    QProdutoSkyhubConsESP_ALIMENTACAO: TStringField;
    QProdutoSkyhubConsESP_APARELHOSCOMPATIVEIS: TStringField;
    QProdutoSkyhubConsESP_CONTEUDODAEMBALAGEM: TStringField;
    QProdutoSkyhubConsESP_COR: TStringField;
    QProdutoSkyhubConsESP_DATADELANCAMENTONOMERCADO: TStringField;
    QProdutoSkyhubConsESP_DIMENSOESPRODUTO: TStringField;
    QProdutoSkyhubConsESP_FABRICANTE: TStringField;
    QProdutoSkyhubConsESP_GARANTIADEFORNECEDOR: TStringField;
    QProdutoSkyhubConsESP_MAISINFORMACOES: TStringField;
    QProdutoSkyhubConsESP_MANUAL: TStringField;
    QProdutoSkyhubConsESP_MATERIALCOMPOSICAO: TStringField;
    QProdutoSkyhubConsESP_MODELO: TStringField;
    QProdutoSkyhubConsESP_PESOLIQDAEMBALAGEMCPRODUTO: TStringField;
    QProdutoSkyhubConsESP_PESOLIQDOPRODUTO: TStringField;
    QProdutoSkyhubConsESP_RECURSOSFUNCIONALIDADES: TStringField;
    QProdutoSkyhubConsESP_REFERENCIADOMODELO: TStringField;
    QProdutoSkyhubConsESP_SAC: TStringField;
    QProdutoSkyhubConsESP_TAMANHO: TStringField;
    QProdutoSkyhubConsESP_VIDEO: TStringField;
    QProdutoSkyhubConsESP_VOLTAGEM: TStringField;
    QProdutoSkyhubConsVAL_PESO: TFloatField;
    QProdutoSkyhubConsCOD_CATEGORIA_ML: TStringField;
    QProdutoSkyhubConsIMAGEM_1: TBlobField;
    QProdutoSkyhubConsIMAGEM_2: TBlobField;
    QProdutoSkyhubConsIMAGEM_3: TBlobField;
    QProdutoSkyhubConsIMAGEM_4: TBlobField;
    QProdutoSkyhubConsDESC_INFORMACOES_ADICIONAIS: TMemoField;
    QProdutoSkyhubConsDT_ATUALIZACAO_SKYHUB: TDateTimeField;
    QProdutoSkyhubConsDT_ATUALIZACAO_ML: TDateTimeField;
    QProdutoSkyhubConsDESC_CONEXAO_SKYHUB: TStringField;
    QProdutoSkyhubConsDESC_CONEXAO_ML: TStringField;
    QProdutoSkyhubUrlCOD_PRODUTO_SKYHUB_URL: TIntegerField;
    QProdutoSkyhubUrlCOD_PRODUTO_SKYHUB: TFloatField;
    QProdutoSkyhubUrlCOD_FILIAL: TIntegerField;
    QProdutoSkyhubUrlURL_SUBMARINO: TStringField;
    QProdutoSkyhubUrlURL_SHOPTIME: TStringField;
    QProdutoSkyhubUrlURL_AMERICANAS: TStringField;
    QProdutoSkyhubUrlURL_MLIVRE: TStringField;
    QVariacaoSkyhubCOD_PRODUTO_SKYHUB: TFloatField;
    QVariacaoSkyhubCOD_PRODUTO_SISTEMA: TFloatField;
    QVariacaoSkyhubDESC_PRODUTO_SISTEMA: TStringField;
    QVariacaoSkyhubDESC_PRODUTO_SKYHUB: TStringField;
    QRConexaoProdutoSkyhubDESC_CONEXAO_SKYHUB: TStringField;
    QRConexaoProdutoSkyhubDESC_CONEXAO_ML: TStringField;
    QRConexaoProdutoSkyhubCOD_PRODUTO_SKYHUB: TFloatField;
    QRSincronizacoes: TOracleDataSet1;
    QRSincronizacoesCOD_PRODUTO: TFloatField;
    QRSincronizacoesDESC_PRODUTO: TStringField;
    QRSincronizacoesDT_REGISTRO: TDateTimeField;
    QRSincronizacoesTIPO_ACAO: TStringField;
    QRSincronizacoesIND_SINCRONIZADO: TStringField;
    QRSincronizacoesIND_SINCRONIZADO_ML: TStringField;
    QRSincronizacoesDT_SINCRONIZACAO: TDateTimeField;
    QRSincronizacoesDT_SINCRONIZACAO_ML: TDateTimeField;
    QProdutoSkyhubConsstatus: TStringField;
    QProdutoSkyhubdesc_produto_cadastro: TStringField;
    procedure QProdutoSkyhubAfterInsert(DataSet: TDataSet);
    procedure QProdutoSkyhubAfterOpen(DataSet: TDataSet);
    procedure QProdutoSkyhubAfterDelete(DataSet: TDataSet);
    procedure QProdutoSkyhubAfterCancel(DataSet: TDataSet);
    procedure QProdutoSkyhubCalcFields(DataSet: TDataSet);
    procedure QCategoriaMLAfterCancel(DataSet: TDataSet);
    procedure QCategoriaMLAfterDelete(DataSet: TDataSet);
    procedure QCategoriaMLAfterInsert(DataSet: TDataSet);
    procedure QProdutoSkyhubAfterPost(DataSet: TDataSet);
    procedure QProdutoSkyhubBeforeDelete(DataSet: TDataSet);
    procedure QProdutoSkyhubBeforePost(DataSet: TDataSet);
    procedure QProdutoSkyhubConsCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMProdutoSkyhub: TDMProdutoSkyhub;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMProdutoSkyhub.QProdutoSkyhubAfterInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
  QProdutoSkyhubDESC_STATUS.Value := 'enabled';
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubAfterOpen(DataSet: TDataSet);
var
  wAux : string;
begin
  QVariacaoSkyhub.Close;
  QVariacaoSkyhub.Open;

  wAux := DMOracle.FastSelect(
    'COD_FILIAL','TB_CONFIGURACAO_SKYHUB',
    'IND_ATIVO = ' + QuotedStr('S') + ' OR ' + 'IND_ML_ATIVO = ' + QuotedStr('S')
  );

  if wAux <> '' then
  begin
    QProdutoSkyhubUrl.Close;
    QProdutoSkyhubUrl.SetVariable('COD_PRODUTO_SKYHUB', QProdutoSkyhubCOD_PRODUTO_SKYHUB.Value);
    QProdutoSkyhubUrl.SetVariable('COD_FILIAL', StrToInt(wAux));
    QProdutoSkyhubUrl.Open;
  end
  else
  begin
    QProdutoSkyhubUrl.Close;
    QProdutoSkyhubUrl.SetVariable('COD_PRODUTO_SKYHUB', Null);
    QProdutoSkyhubUrl.SetVariable('COD_FILIAL', Null);
    QProdutoSkyhubUrl.Open;
  end;

end;

procedure TDMProdutoSkyhub.QProdutoSkyhubAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
  QProdutoSkyhubUrl.Refresh;
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;

  QProdutoSkyhub.Close;
  QProdutoSkyhub.SetVariable('PK', 0);
  QProdutoSkyhub.Open;
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubCalcFields(DataSet: TDataSet);
begin
  QProdutoSkyhubdesc_situacao.Value := '';
  QProdutoSkyhubdesc_cor_situacao.Value := 'clBlack';

  if ((QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value = 'linked') and (QProdutoSkyhubDESC_CONEXAO_ML.Value = 'active')) then
  begin
    QProdutoSkyhubdesc_situacao.Value := 'Públicado';
    QProdutoSkyhubdesc_cor_situacao.Value := 'clGreen';
  end
  else if ((QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value = 'paused') and (QProdutoSkyhubDESC_CONEXAO_ML.Value = 'paused')) then
  begin
    QProdutoSkyhubdesc_situacao.Value := 'Pausado';
    QProdutoSkyhubdesc_cor_situacao.Value := 'clNavy';
  end
  else
  begin
    if QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value = 'declined' then
    begin
      QProdutoSkyhubdesc_situacao.Value := 'Recusado na skyhub';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clRed';
    end
    else if QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value = 'waiting_confirmation' then
    begin
      QProdutoSkyhubdesc_situacao.Value := 'Aguardando validação na skyhub';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clNavy';
    end
    else if QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value = 'paused' then
    begin
      QProdutoSkyhubdesc_situacao.Value := 'Pausado na skyhub';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clNavy';
    end
    else if QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value = '' then
    begin
      QProdutoSkyhubdesc_situacao.Value := 'Inexistente na skyhub';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clRed';
    end;

    if (QProdutoSkyhubDESC_CONEXAO_SKYHUB.Value <> 'linked') and (QProdutoSkyhubDESC_CONEXAO_ML.Value <> 'active') then
      QProdutoSkyhubdesc_situacao.Value := QProdutoSkyhubdesc_situacao.Value + ' e ';

    if QProdutoSkyhubDESC_CONEXAO_ML.Value = 'paused' then
    begin
      QProdutoSkyhubdesc_situacao.Value := QProdutoSkyhubdesc_situacao.Value + 'Pausado no Mercado Livre';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clNavy';
    end
    else if QProdutoSkyhubDESC_CONEXAO_ML.Value = 'disabled' then
    begin
      QProdutoSkyhubdesc_situacao.Value := QProdutoSkyhubdesc_situacao.Value + 'Desativado no Mercado Livre';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clRed';
    end
    else if QProdutoSkyhubDESC_CONEXAO_ML.Value = 'closed' then
    begin
      QProdutoSkyhubdesc_situacao.Value := QProdutoSkyhubdesc_situacao.Value + 'Fechado no Mercado Livre';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clRed';
    end
    else if QProdutoSkyhubDESC_CONEXAO_ML.Value = 'under_review' then
    begin
      QProdutoSkyhubdesc_situacao.Value := QProdutoSkyhubdesc_situacao.Value + 'Em revisão no Mercado Livre';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clRed';
    end
    else if QProdutoSkyhubDESC_CONEXAO_ML.Value = '' then
    begin
      QProdutoSkyhubdesc_situacao.Value := QProdutoSkyhubdesc_situacao.Value + 'Inexistente no Mercado Livre';
      QProdutoSkyhubdesc_cor_situacao.Value := 'clRed';
    end;
  end;
  QProdutoSkyhubDesc_produto_Cadastro.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO=' + Trim(QProdutoSkyhubCod_Produto.Text));
end;

procedure TDMProdutoSkyhub.QCategoriaMLAfterCancel(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Rollback;
end;

procedure TDMProdutoSkyhub.QCategoriaMLAfterDelete(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.Commit;
end;

procedure TDMProdutoSkyhub.QCategoriaMLAfterInsert(DataSet: TDataSet);
begin
  DMOracle.DBCemapa.StartTransaction;
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubAfterPost(DataSet: TDataSet);
begin
  QProdutoSkyhub.SetVariable('PK',QProdutoSkyhubCOD_PRODUTO_SKYHUB.Value);
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubBeforeDelete(DataSet: TDataSet);
begin
  if QProdutoSkyhubCOD_PRODUTO_SKYHUB.Value > 0 then
    DMOracle.ExecutaSql('DELETE FROM TB_PRODUTO_SKYHUB_URL WHERE COD_PRODUTO_SKYHUB = ' + QProdutoSkyhubCOD_PRODUTO_SKYHUB.Text, false);
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubBeforePost(DataSet: TDataSet);
begin
  QProdutoSkyhubDESC_PRODUTO.Value := Bib.TitleCase(QProdutoSkyhubDESC_PRODUTO.Value);
  QProdutoSkyhubDESC_MARCA.Value := Bib.TitleCase(QProdutoSkyhubDESC_MARCA.Value);
  QProdutoSkyhubESP_ALIMENTACAO.Value := Bib.TitleCase(QProdutoSkyhubESP_ALIMENTACAO.Value);
  QProdutoSkyhubESP_APARELHOSCOMPATIVEIS.Value := Bib.TitleCase(QProdutoSkyhubESP_APARELHOSCOMPATIVEIS.Value);
  QProdutoSkyhubESP_CONTEUDODAEMBALAGEM.Value := Bib.TitleCase(QProdutoSkyhubESP_CONTEUDODAEMBALAGEM.Value);
  QProdutoSkyhubESP_COR.Value := Bib.TitleCase(QProdutoSkyhubESP_COR.Value);
  QProdutoSkyhubESP_FABRICANTE.Value := Bib.TitleCase(QProdutoSkyhubESP_FABRICANTE.Value);
  QProdutoSkyhubESP_GARANTIADEFORNECEDOR.Value := Bib.TitleCase(QProdutoSkyhubESP_GARANTIADEFORNECEDOR.Value);
  QProdutoSkyhubESP_MAISINFORMACOES.Value := Bib.TitleCase(QProdutoSkyhubESP_MAISINFORMACOES.Value);
  QProdutoSkyhubESP_MATERIALCOMPOSICAO.Value := Bib.TitleCase(QProdutoSkyhubESP_MATERIALCOMPOSICAO.Value);
  QProdutoSkyhubESP_MODELO.Value := Bib.TitleCase(QProdutoSkyhubESP_MODELO.Value);
  QProdutoSkyhubESP_RECURSOSFUNCIONALIDADES.Value := Bib.TitleCase(QProdutoSkyhubESP_RECURSOSFUNCIONALIDADES.Value);
  QProdutoSkyhubESP_REFERENCIADOMODELO.Value := Bib.TitleCase(QProdutoSkyhubESP_REFERENCIADOMODELO.Value);
  QProdutoSkyhubESP_TAMANHO.Value := Bib.TitleCase(QProdutoSkyhubESP_TAMANHO.Value);
end;

procedure TDMProdutoSkyhub.QProdutoSkyhubConsCalcFields(DataSet: TDataSet);
begin
  if QProdutoSkyhubConsDESC_STATUS.Value = 'enabled' then
    QProdutoSkyhubConsstatus.value := 'Habilitado'
  else
    QProdutoSkyhubConsstatus.value := 'Desabilitado';
end;

end.
