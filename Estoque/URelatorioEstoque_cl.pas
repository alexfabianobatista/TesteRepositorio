unit URelatorioEstoque_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste, DBClient;

type
  TDMRelatorio_Estoque = class(TDataModule)
    QRControleMovProduto: TOracleDataSet1;
    QRControleMovProdutoDESC_OPERACAO: TStringField;
    QRControleMovProdutoIND_TIPO_OPERACAO: TStringField;
    QRControleMovProdutoCOD_OPERACAO: TIntegerField;
    QRControleMovProdutoTOTAL_QUANTIDADE: TFloatField;
    QrEstoque_Inicial: TOracleDataSet1;
    QrEstoque_InicialQT_ESTOQUE: TFloatField;
    QRControleMovProdutoDESC_TIPO_OPERACAO: TStringField;
    QrEstoqueComposicao: TOracleDataSet1;
    QrEstoqueComposicaoIND_CUSTO: TStringField;
    QrEstoqueComposicaoIND_TIPO_OPERACAO: TStringField;
    QrEstoqueComposicaoIND_CUSTO_NOTA: TStringField;
    QrEstoqueComposicaoIND_VENDAS: TStringField;
    QrEstoqueComposicaoIND_COMPRAS: TStringField;
    QrComposicaoEstoque: TOracleDataSet1;
    QrComposicaoEstoqueDT_EMISSAO: TDateTimeField;
    QrComposicaoEstoqueDT_MOVIMENTO: TDateTimeField;
    QrComposicaoEstoqueQT_QUANTIDADE_ENTRADA: TFloatField;
    QrComposicaoEstoqueVAL_CUSTO_ENTRADA: TFloatField;
    QrComposicaoEstoqueQT_QUANTIDADE_SAIDA: TFloatField;
    QrComposicaoEstoqueVAL_CUSTO_SAIDA: TFloatField;
    QrComposicaoEstoqueIND_ESTOQUE: TStringField;
    QrComposicaoEstoqueIND_CUSTO: TStringField;
    QrComposicaoEstoqueIND_TIPO_OPERACAO: TStringField;
    QrComposicaoEstoqueIND_VENDAS: TStringField;
    QrComposicaoEstoqueIND_COMPRAS: TStringField;
    QrComposicaoEstoqueIND_CUSTO_NOTA: TStringField;
    QrComposicaoEstoqueDESC_UNIDADE: TStringField;
    QrComposicaoEstoqueNUM_EMBALAGEM: TFloatField;
    QRConfEstoqueProducao: TOracleDataSet1;
    QRConfEstoqueProducaoCOD_PRODUTO: TFloatField;
    QRConfEstoqueProducaoPRODUZIDO: TFloatField;
    QRConfEstoqueProducaoVENDIDO: TFloatField;
    QRConfEstoqueProducaoESTOQUE_TOTAL: TFloatField;
    QRConfEstoqueProducaoDESC_PRODUTO: TStringField;
    QrComposicaoEstoqueDESC_PRODUTO: TStringField;
    QRCustoCompra: TOracleDataSet1;
    QRCustoCompraDESC_PRODUTO: TStringField;
    QRCustoCompraDESC_CLASSE: TStringField;
    QRCustoCompraVL_TOTAL_COMPRAS: TFloatField;
    QRCustoCompraQT_TOTAL_COMPRA: TFloatField;
    QRCustoCompraVL_CUSTO_MEDIO: TFloatField;
    QRCustoCompraQT_QUANTIDADE: TFloatField;
    QRCustoCompravl_ultimo_custo: TFloatField;
    QRCustoCompraVL_CUSTO_COMPRA: TFloatField;
    QRCustoCompravalor_estoque: TFloatField;
    QrEstoqueComposicaoCOD_PRODUTO: TFloatField;
    QrEstoqueComposicaoCOD_LOTE_TIPO: TFloatField;
    QrEstoqueComposicaoCOD_FILIAL: TFloatField;
    QrEstoqueComposicaoNUM_NOTA: TFloatField;
    QrEstoqueComposicaoDT_EMISSAO: TDateTimeField;
    QrEstoqueComposicaoDT_MOVIMENTO: TDateTimeField;
    QrEstoqueComposicaoQT_QUANTIDADE_ENTRADA: TFloatField;
    QrEstoqueComposicaoVAL_CUSTO_ENTRADA: TFloatField;
    QrEstoqueComposicaoQT_QUANTIDADE_SAIDA: TFloatField;
    QrEstoqueComposicaoVAL_CUSTO_SAIDA: TFloatField;
    QrEstoqueComposicaoDESC_OPERACAO: TStringField;
    QrEstoqueComposicaoCOD_OPERACAO: TFloatField;
    QrEstoqueComposicaoIND_ESTOQUE: TStringField;
    QrEtiquetas_Estoque: TOracleDataSet1;
    QrEtiquetas_EstoqueCOD_PRODUTO: TFloatField;
    QrEtiquetas_EstoqueDESC_PRODUTO: TStringField;
    QrEtiquetas_EstoqueCOD_LOTE_TIPO: TIntegerField;
    QrEtiquetas_EstoqueDESC_LOTE: TStringField;
    CDS_Etiquetas: TClientDataSet;
    CDS_Etiquetascod_produto: TIntegerField;
    CDS_Etiquetasdesc_produto: TStringField;
    CDS_Etiquetascod_lote_tipo: TIntegerField;
    CDS_Etiquetasdesc_lote: TStringField;
    QREtiquetaConfirmadaEstoque: TOracleDataSet1;
    QREtiquetaConfirmadaEstoqueCOD_PESAGEM: TIntegerField;
    QREtiquetaConfirmadaEstoqueCOD_FILIAL: TIntegerField;
    QREtiquetaConfirmadaEstoqueCOD_PRODUTO: TIntegerField;
    QREtiquetaConfirmadaEstoqueCOD_LOTE_TIPO: TIntegerField;
    QREtiquetaConfirmadaEstoqueDT_FABRICACAO: TDateTimeField;
    QREtiquetaConfirmadaEstoqueNUM_PESO_TARA: TFloatField;
    QREtiquetaConfirmadaEstoqueNUM_PESO_LIQUIDO: TFloatField;
    QREtiquetaConfirmadaEstoqueIND_SITUACAO: TStringField;
    QREtiquetaConfirmadaEstoqueCOD_USUARIO: TIntegerField;
    QREtiquetaConfirmadaEstoqueDESC_PRODUTO: TStringField;
    QREtiquetaConfirmadaEstoqueDT_PESAGEM: TDateTimeField;
    QREtiquetaConfirmadaEstoqueUSUARIO: TStringField;
    QREtiquetaConfirmadaEstoqueDESC_LOTE: TStringField;
    QREtiqConfEstUsuario: TOracleDataSet1;
    QREtiqConfEstUsuarioUSUARIO: TStringField;
    QREtiqConfEstUsuarioQT_PESO: TFloatField;
    QREtiqConfEstUsuarioQT_VOLUME: TFloatField;
    QrComposicaoEstoqueCOD_LOTE_TIPO: TIntegerField;
    QrComposicaoEstoqueCOD_QUEBRA_RELATORIO: TStringField;
    QrComposicaoEstoqueCOD_PRODUTO: TFloatField;
    QrComposicaoEstoqueCOD_FILIAL: TIntegerField;
    QrComposicaoEstoqueCOD_OPERACAO: TFloatField;
    QREstoqueCompraVenda: TOracleDataSet1;
    QREstoqueCompraVendaCOD_PRODUTO: TFloatField;
    QREstoqueCompraVendaDESC_PRODUTO: TStringField;
    QREstoqueCompraVendaQTDE_COMPRA: TFloatField;
    QREstoqueCompraVendaQTDE_SAIDA: TFloatField;
    QREstoqueCompraVendaqtde_estoque: TStringField;
    QREstoqueCompraVendacod_lote: TStringField;
    QrEtiquetasEstoque2: TOracleDataSet1;
    QrEtiquetasEstoque2COD_PRODUTO: TFloatField;
    QrEtiquetasEstoque2NUM_FABRICANTE: TStringField;
    QrEtiquetasEstoque2DESC_PRODUTO: TStringField;
    QrEtiquetasEstoque2DESC_LOCALIZACAO: TStringField;
    QrEtiquetasEstoque2VAL_VAREJO: TFloatField;
    QrEtiquetasEstoque2COD_LOTE_TIPO: TIntegerField;
    QrEtiquetasEstoque2QT_QUANTIDADE: TFloatField;
    CdsEtiquetasEstoque2: TClientDataSet;
    CdsEtiquetasEstoque2NUM_FABRICANTE: TStringField;
    CdsEtiquetasEstoque2DESC_PRODUTO: TStringField;
    CdsEtiquetasEstoque2DESC_LOCALIZACAO: TStringField;
    CdsEtiquetasEstoque2VAL_VAREJO: TFloatField;
    CdsEtiquetasEstoque2COD_LOTE_TIPO: TIntegerField;
    CdsEtiquetasEstoque2COD_PRODUTO: TFloatField;
    QRCustoCompraCOD_FILIAL: TIntegerField;
    QRCustoCompraNUM_SUBCLASSE: TIntegerField;
    QRCustoCompraCOD_PRODUTO: TFloatField;
    procedure QRControleMovProdutoCalcFields(DataSet: TDataSet);
    procedure QRCustoCompraCalcFields(DataSet: TDataSet);
    procedure QREstoqueCompraVendaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorio_Estoque: TDMRelatorio_Estoque;

implementation

uses UOracle_cl, UOrdemCompra_cl;

{$R *.DFM}

procedure TDMRelatorio_Estoque.QRControleMovProdutoCalcFields(
  DataSet: TDataSet);
begin
//  QRControleMovProdutoQt_Estoque_Inicial.Value := QREstoqueInicialQt_Estoque.Value;
end;

procedure TDMRelatorio_Estoque.QRCustoCompraCalcFields(DataSet: TDataSet);
begin
  With DMOrdemCompra do
  Begin
    QOrdemCompraUltima.Close;
    QOrdemCompraUltima.SetVariable('Produto',QRCustoCompraCod_Produto.Value);
    QOrdemCompraUltima.SetVariable('Recebimento',Date - 90);
    QOrdemCompraUltima.SetVariable('Recebimento1',Date);
    QOrdemCompraUltima.Open;
    If Not(QOrdemCompraUltima.Eof) Then
       If QOrdemCompraUltimaQt_Quantidade.Value > 0 Then
          QRCustoCompraVl_Ultimo_Custo.Value := (QOrdemCompraUltimaVal_Total.Value - QOrdemCompraUltimaVal_Desconto.Value + QOrdemCompraUltimaVal_Despesas.Value + QOrdemCompraUltimaVal_Ipi.Value) / QOrdemCompraUltimaQt_Quantidade.Value
       Else
          QRCustoCompraVl_Ultimo_Custo.Value := (QOrdemCompraUltimaVal_Total.Value - QOrdemCompraUltimaVal_Desconto.Value + QOrdemCompraUltimaVal_Despesas.Value + QOrdemCompraUltimaVal_Ipi.Value)
    Else
       QRCustoCompraVl_Ultimo_Custo.Value := QRCustoCompraVl_Custo_Medio.Value;
    QOrdemCompraUltima.Close;
    QRCustoCompraValor_Estoque.Value := QRCustoCompraVl_Ultimo_Custo.Value * QRCustoCompraQt_Quantidade.Value;
  End;
end;

procedure TDMRelatorio_Estoque.QREstoqueCompraVendaCalcFields(
  DataSet: TDataSet);
begin
  QREstoqueCompraVendaqtde_estoque.Value := DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO='+QREstoqueCompraVendaCOD_PRODUTO.Text);
  QREstoqueCompraVendacod_lote.Value := DMOracle.BuscaNome('SELECT COD_LOTE_TIPO FROM TB_ESTOQUE','COD_PRODUTO='+QREstoqueCompraVendaCOD_PRODUTO.Text)
end;

end.
