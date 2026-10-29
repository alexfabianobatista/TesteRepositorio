unit URelatorio_Compra_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Math,
  Db, OracleData, OraTeste, DBClient, Provider;

type
  TDMRelatorio_Compra = class(TDataModule)
    QRMovEstoqueCompra: TOracleDataSet1;
    QRMovEstoqueCompraNUM_NOTA: TIntegerField;
    QRMovEstoqueCompraCOD_SERIE: TStringField;
    QRMovEstoqueCompraDT_RECEBIMENTO: TDateTimeField;
    QRMovEstoqueCompraCOD_OPERACAO: TIntegerField;
    QRMovEstoqueCompraDESC_LOTE: TStringField;
    QRMovEstoqueCompraQT_QUANTIDADE: TFloatField;
    QRMovEstoqueCompraCOD_PRODUTO: TFloatField;
    QRMovEstoqueCompraIND_ESTOQUE: TStringField;
    QRMovEstoqueCompraNOME: TStringField;
    QRMovEstoqueCompraCUSTO: TFloatField;
    QRMovEstoqueCompraVAL_TOTAL: TFloatField;
    QRNotasDevolucao: TOracleDataSet1;
    QRNotasDevolucaoNUM_NOTA: TIntegerField;
    QRNotasDevolucaoDESC_OBS_DEVOLUCAO: TStringField;
    QRNotasDevolucaoCOD_CADASTRO: TIntegerField;
    QRNotasDevolucaoNOME: TStringField;
    QRNotasDevolucaoVAL_TOTAL: TFloatField;
    QRNotasDevolucaoTOTAL_QUANTIDADE: TFloatField;
    QRNotasDevolucaoCOD_OPERACAO: TIntegerField;
    QRNotasDevolucaoDESC_OPERACAO: TStringField;
    QRNotasDevolucaoCOD_VENDEDOR: TIntegerField;
    QRNotasDevolucaoNOME_VENDEDOR: TStringField;
    QRMovEstoqueCompraDESC_PRODUTO: TStringField;
    QRTerceirizacao: TOracleDataSet1;
    QRTerceirizacaoVAL_TOTAL_JAN: TFloatField;
    QRTerceirizacaoVAL_TOTAL_FEV: TFloatField;
    QRTerceirizacaoVAL_TOTAL_MAR: TFloatField;
    QRTerceirizacaoVAL_TOTAL_ABR: TFloatField;
    QRTerceirizacaoVAL_TOTAL_MAI: TFloatField;
    QRTerceirizacaoVAL_TOTAL_JUN: TFloatField;
    QRTerceirizacaoVAL_TOTAL_JUL: TFloatField;
    QRTerceirizacaoVAL_TOTAL_AGO: TFloatField;
    QRTerceirizacaoVAL_TOTAL_SET: TFloatField;
    QRTerceirizacaoVAL_TOTAL_OUT: TFloatField;
    QRTerceirizacaoVAL_TOTAL_NOV: TFloatField;
    QRTerceirizacaoVAL_TOTAL_DEZ: TFloatField;
    QRTerceirizacaoTIPO_MOVIMENTO: TStringField;
    QRTerceirizacaoSALDO: TFloatField;
    QRMovMercadoria_GMO: TOracleDataSet1;
    QRMovMercadoria_GMODESC_PRODUTO: TStringField;
    QRMovMercadoria_GMONUM_EMBALAGEM: TFloatField;
    QRMovMercadoria_GMODESC_UNIDADE: TStringField;
    QRMovMercadoria_GMOQT_QUANTIDADE: TFloatField;
    QRMovMercadoria_GMOCOD_PRODUTO: TFloatField;
    QRMovMercadoria_GMOCOD_CADASTRO: TIntegerField;
    QRMovMercadoria_GMONOME_CADASTRO: TStringField;
    QRMovMercadoria_GMODESC_ENDERECO: TStringField;
    QRMovMercadoria_GMONUM_CGC_CPF: TStringField;
    QRMovMercadoria_GMODESC_TELEFONE: TStringField;
    QRMovMercadoria_GMOCOD_ESTADO: TStringField;
    QRMovMercadoria_GMOCOD_NOTA_CAB: TIntegerField;
    QRMovMercadoria_GMOCOD_SERIE: TStringField;
    QRMovMercadoria_GMONUM_NOTA: TIntegerField;
    QRMovMercadoria_GMODT_EMISSAO: TDateTimeField;
    QRMovMercadoria_GMOCOD_OPERACAO: TIntegerField;
    QRMovMercadoria_GMODESC_CIDADE: TStringField;
    QrMovMercadoria_GMO_CR: TOracleDataSet1;
    QrMovMercadoria_GMO_CRDT_EMISSAO: TDateTimeField;
    QrMovMercadoria_GMO_CRDT_VENCIMENTO: TDateTimeField;
    QrMovMercadoria_GMO_CRVAL_ORIGINAL: TFloatField;
    QrMovMercadoria_GMO_CRNUM_PARCELA: TIntegerField;
    QRMovMercadoria_GMODESC_CEP: TStringField;
    QEtiqNota: TOracleDataSet1;
    DspEtiqNota: TDataSetProvider;
    CdEtiqNota: TClientDataSet;
    QEtiqNotaCampos: TOracleDataSet1;
    QEtiqNotaCamposNUM_FABRICANTE: TStringField;
    QEtiqNotaCamposDESC_PRODUTO: TStringField;
    QEtiqNotaCamposDESC_LOCALIZACAO: TStringField;
    QEtiqNotaNUM_FABRICANTE: TStringField;
    QEtiqNotaDESC_PRODUTO: TStringField;
    QEtiqNotaQT_QUANTIDADE: TFloatField;
    CdEtiqNotaNUM_FABRICANTE: TStringField;
    CdEtiqNotaDESC_PRODUTO: TStringField;
    CdEtiqNotaDESC_LOCALIZACAO: TStringField;
    QRAutorizacaoDevolucao: TOracleDataSet1;
    QRAutorizacaoDevolucaoCOD_NOTA_CAB: TIntegerField;
    QRAutorizacaoDevolucaoNOME: TStringField;
    QRAutorizacaoDevolucaoNUM_CGC_CPF: TStringField;
    QRAutorizacaoDevolucaoDESC_E_MAIL: TStringField;
    QRAutorizacaoDevolucaoNOME_CONTATO: TStringField;
    QRAutorizacaoDevolucaoDESC_FONE_EMPRESA: TStringField;
    QRAutorizacaoDevolucaoDESC_OPERACAO: TStringField;
    QRAutorizacaoDevolucaoCFOP: TFloatField;
    QRAutorizacaoDevolucaoDESC_FILIAL: TStringField;
    QRAutorizacaoDevolucaoNUM_CGC_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_ENDERECO_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_BAIRRO_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_CEP_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_CIDADE_FILIAL: TStringField;
    QRAutorizacaoDevolucaoCOD_ESTADO_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_TELEFONE_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_FAX_FILIAL: TStringField;
    QRAutorizacaoDevolucaoDESC_INSCRICAO_FILIAL: TStringField;
    QRAutorizacaoDevolucaoNUM_NOTA: TIntegerField;
    QRAutorizacaoDevolucaoDT_EMISSAO: TDateTimeField;
    QRAutorizacaoDevolucaoIND_FRETE: TFloatField;
    QRAutorizacaoDevolucaoIT: TOracleDataSet1;
    QRAutorizacaoDevolucaoITCOD_PRODUTO: TFloatField;
    QRAutorizacaoDevolucaoITQT_QUANTIDADE: TFloatField;
    QRAutorizacaoDevolucaoITVAL_UNITARIO: TFloatField;
    QRAutorizacaoDevolucaoITVAL_TOTAL: TFloatField;
    QRAutorizacaoDevolucaoITPERC_ALIQUOTA: TFloatField;
    QRAutorizacaoDevolucaoITDESC_PRODUTO: TStringField;
    QRAutorizacaoDevolucaoITDESC_UNIDADE: TStringField;
    QRAutorizacaoDevolucaoNOME_TRANSP: TStringField;
    QRAutorizacaoDevolucaoNUM_CGC_CPF_TRANSP: TStringField;
    QRAutorizacaoDevolucaoITVAL_IPI: TFloatField;
    QRAutorizacaoDevolucaoIND_SITUACAO: TStringField;
    QEtiqNotaCOD_PRODUTO: TFloatField;
    QEtiqNotaVAL_VAREJO: TFloatField;
    QEtiqNotaCOD_LOTE_TIPO: TIntegerField;
    QEtiqNotaCamposVAL_VAREJO: TFloatField;
    QEtiqNotaCamposCOD_LOTE_TIPO: TIntegerField;
    QEtiqNotaCamposCOD_PRODUTO: TFloatField;
    CdEtiqNotaVAL_VAREJO: TFloatField;
    CdEtiqNotaCOD_LOTE_TIPO: TIntegerField;
    CdEtiqNotaCOD_PRODUTO: TFloatField;
    QRNfe: TOracleDataSet1;
    QRNfeIND_SISTEMA_NFE: TIntegerField;
    QRNfeCOD_NOTA_CAB: TIntegerField;
    QRNfeCOD_FILIAL: TIntegerField;
    QRNfeCOD_SERIE: TStringField;
    QRNfeNUM_NOTA: TIntegerField;
    QRNfeDT_EMISSAO: TDateTimeField;
    QRNfeDT_RECEBIMENTO: TDateTimeField;
    QRNfeDESC_CHAVE_ACESSO: TStringField;
    QRNfeSITUACAO: TStringField;
    QRNfeENTRADA_SAIDA: TStringField;
    QRNfeCOD_CADASTRO: TIntegerField;
    QRNfeCADASTRO: TStringField;
    QRNfeCOM_XML: TStringField;
    QRNfedesc_situacao: TStringField;
    QEtiqNotaDT_EMISSAO: TDateTimeField;
    QRComissaoFreteEntrada: TOracleDataSet1;
    QRComissaoFreteEntradaCOD_NOTA_CAB: TIntegerField;
    QRComissaoFreteEntradaNUM_NOTA: TIntegerField;
    QRComissaoFreteEntradaDESC_PLACA: TStringField;
    QRComissaoFreteEntradaDT_EMISSAO: TDateTimeField;
    QRComissaoFreteEntradaDESC_FILIAL: TStringField;
    QRComissaoFreteEntradaNOME_DESTINATARIO: TStringField;
    QRComissaoFreteEntradaCOD_TRANSPORTADOR: TIntegerField;
    QRComissaoFreteEntradaNOME_TRANSPORTADOR: TStringField;
    QRComissaoFreteEntradaPORCENTAGEM_COMISSAO: TFloatField;
    QRComissaoFreteEntradaVALOR_FRETE_SC: TStringField;
    QRComissaoFreteEntradaPESO: TFloatField;
    QRComissaoFreteEntradaVALOR_COMISSAO: TFloatField;
    QEtiqNotaIND_QTD_ETIQUETAS: TIntegerField;
    QRClienteForn_Sem_Compra: TOracleDataSet1;
    QRClienteForn_Sem_CompraCOD_CADASTRO: TIntegerField;
    QRClienteForn_Sem_CompraNOME: TStringField;
    QRClienteForn_Sem_CompraDESC_ENDERECO: TStringField;
    QRClienteForn_Sem_CompraNUM_CGC_CPF: TStringField;
    QRClienteForn_Sem_CompraDESC_CIDADE: TStringField;
    QRClienteForn_Sem_CompraCOD_ESTADO: TStringField;
    QRClienteForn_Sem_CompraDESC_TELEFONE: TStringField;
    QRClienteForn_Sem_CompraCOD_CIDADE: TIntegerField;
    QRClienteForn_Sem_Compraval_compra: TFloatField;
    QRPosicaoCompraEstMin: TOracleDataSet1;
    QRPosicaoCompraEstMinCOD_PRODUTO: TFloatField;
    QRPosicaoCompraEstMinDESC_PRODUTO: TStringField;
    QRPosicaoCompraEstMinDESC_LOTE: TStringField;
    QRPosicaoCompraEstMinQT_QUANTIDADE: TFloatField;
    QRPosicaoCompraEstMinQT_MINIMO: TFloatField;
    QRPosicaoCompraEstMinqt_saldo: TFloatField;
    QRPosicaoCompraEstMinqt_compra: TFloatField;
    QRPosicaoCompraEstMinCOD_FILIAL: TIntegerField;
    QRPosicaoCompraEstMinNUM_FABRICANTE: TStringField;
    QEtiqNotaIND_PRECO_VENDA_ETIQUETA: TStringField;
    QEtiqNotaCamposIND_PRECO_VENDA_ETIQUETA: TStringField;
    QRPosicaoCompraEstMinVL_ULTIMO_CUSTO: TFloatField;
    QRPosicaoCompraEstMinSUGESTAO_COMPRA: TFloatField;
    QEtiqNotaDESC_MARCA: TStringField;
    QEtiqNotaDESC_COD_BARRA: TStringField;
    QEtiqNotaNOME: TStringField;
    QEtiqNotaDESC_LOTE: TStringField;
    QEtiqNotaDT_RECEBIMENTO: TDateTimeField;
    QEtiqNotaDT_VENCIMENTO: TDateTimeField;
    QRFCCIA: TOracleDataSet1;
    QRFCCIANUM_ORDEM: TIntegerField;
    QRFCCIADESC_FILIAL: TStringField;
    QRFCCIANUM_CGC_FILIAL: TStringField;
    QRFCCIADESC_INSCRICAO_FILIAL: TStringField;
    QRFCCIADESC_ENDERECO_FILIAL: TStringField;
    QRFCCIADESC_CIDADE_FILIAL: TStringField;
    QRFCCIACOD_ESTADO_FILIAL: TStringField;
    QRFCCIADESC_CEP_FILIAL: TStringField;
    QRFCCIANOME_CADASTRO_PROD: TStringField;
    QRFCCIANUM_CPF_CADASTRO_PROD: TStringField;
    QRFCCIADESC_ENDERECO_CADASTRO_PROD: TStringField;
    QRFCCIADESC_CIDADE_CADASTRO_PROD: TStringField;
    QRFCCIACOD_ESTADO_CADASTRO_PROD: TStringField;
    QRFCCIADESC_CEP_CADASTRO_PROD: TStringField;
    QRFCCIADESC_PROPRIEDADE: TStringField;
    QRFCCIADESC_PRODUCAO_AGROPECUARIA: TStringField;
    QRFCCIANUM_AREA: TFloatField;
    QRFCCIADESC_CRI: TStringField;
    QRFCCIANUM_NOTA_COMPRA: TIntegerField;
    QRFCCIACOD_SERIE_COMPRA: TStringField;
    QRFCCIADT_EMISSAO_COMPRA: TDateTimeField;
    QRFCCIADESC_RAZAO_SOCIAL_ORIGEM_CRED: TStringField;
    QRFCCIACOD_ESTADO_ORIGEM_CRED: TStringField;
    QRFCCIANUM_NOTA_ORIGEM_CRED: TIntegerField;
    QRFCCIACOD_SERIE_ORIGEM_CRED: TStringField;
    QRFCCIADT_EMISSAO_ORIGEM_CRED: TDateTimeField;
    QRFCCIAVAL_ICMS_ORIGEM_CRED: TFloatField;
    QRFCCIANUM_ORDEM_FCCIA_ANTERIOR: TFloatField;
    QRDetalhamentoFunrural: TOracleDataSet1;
    QRDetalhamentoFunruralcprev: TFloatField;
    QRDetalhamentoFunruralrat: TFloatField;
    QRDetalhamentoFunruralsenar: TFloatField;
    QRDetalhamentoFunruralNUM_CGC_CPF: TStringField;
    QRDetalhamentoFunruralVAL_FUNRURAL: TFloatField;
    QRDetalhamentoFunruralNOME: TStringField;
    QRDetalhamentoFunruralCOD_NOTA_CAB: TIntegerField;
    QRDetalhamentoFunruralSVAL_TOTAL: TFloatField;
    QEtiqNotaDESC_LOCALIZACAO: TStringField;
    QEtiqNotaNUM_CONVERTE_FARDO: TFloatField;
    QRDetalhamentoFunruralPERC_FUNRURAL: TFloatField;
    QEtiqNotaDESC_OBSERVACAO: TStringField;
    procedure QRNfeCalcFields(DataSet: TDataSet);
    procedure QRClienteForn_Sem_CompraCalcFields(DataSet: TDataSet);
    procedure QRPosicaoCompraEstMinCalcFields(DataSet: TDataSet);
    procedure QRDetalhamentoFunruralCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelatorio_Compra: TDMRelatorio_Compra;

implementation

uses UOracle_cl, UNfe_cl;

{$R *.DFM}

procedure TDMRelatorio_Compra.QRNfeCalcFields(DataSet: TDataSet);
begin
  QRNfedesc_situacao.Value := DMNfe.getWSMessage(StrToInt('0' + QRNfeSITUACAO.Value));
end;

procedure TDMRelatorio_Compra.QRClienteForn_Sem_CompraCalcFields(
  DataSet: TDataSet);
Var wValor : String;
begin
  wValor := DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL+TB_NOTA_ITEM.VAL_ICMS_SUBST-(Tb_nota_item.VAL_DESCONTO * Tb_nota_item.QT_QUANTIDADE) - Tb_nota_item.VAL_DESCONTO_RATEIO) FROM TB_NOTA_CAB,TB_NOTA_ITEM','TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB AND COD_CADASTRO = '+QRClienteForn_Sem_CompraCOD_CADASTRO.Text);
  If wValor <> '' Then
     QRClienteForn_Sem_Compraval_compra.Value := StrToFloat(wValor);
end;

procedure TDMRelatorio_Compra.QRPosicaoCompraEstMinCalcFields(
  DataSet: TDataSet);

begin
  QRPosicaoCompraEstMinqt_compra.Text := DMOracle.BuscaNome('SELECT SUM(TB_NOTA_ITEM.QT_QUANTIDADE) AS SQT FROM TB_NOTA_ITEM, TB_NOTA_CAB','TB_NOTA_ITEM.COD_PRODUTO = ' + QRPosicaoCompraEstMinCOD_PRODUTO.Text + ' AND TB_NOTA_ITEM.COD_NOTA_CAB = TB_NOTA_CAB.COD_NOTA_CAB AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' +  QuotedStr('E') + ' AND TB_NOTA_CAB.IND_SITUACAO = 1 AND TB_NOTA_CAB.COD_FILIAL = '+ QRPosicaoCompraEstMinCOD_FILIAL.text);
  QRPosicaoCompraEstMinqt_saldo.Value := QRPosicaoCompraEstMinqt_compra.Value  + QRPosicaoCompraEstMinQT_QUANTIDADE.Value;
end;

procedure TDMRelatorio_Compra.QRDetalhamentoFunruralCalcFields(
  DataSet: TDataSet);
begin
{Alterado o calculo para puxar a aliquota que esta no cadastro. Alex 11/05/2026}
// ----------  Aliq.: 1,50%
  if SameValue(QRDetalhamentoFunruralPERC_FUNRURAL.Value, 1.50, 0.005) then
  begin
    QRDetalhamentoFunruralcPrev.Value := QRDetalhamentoFunruralsVAL_TOTAL.Value * 1.20 / 100;
    QRDetalhamentoFunruralRat.Value   := QRDetalhamentoFunruralsVAL_TOTAL.Value * 0.10 / 100;
    QRDetalhamentoFunruralSenar.Value := QRDetalhamentoFunruralsVAL_TOTAL.Value * 0.20 / 100;
  end
// ---------- Aliq.: 1,63%
  else if SameValue(QRDetalhamentoFunruralPERC_FUNRURAL.Value, 1.63, 0.005) then
  begin
    QRDetalhamentoFunruralcPrev.Value := QRDetalhamentoFunruralsVAL_TOTAL.Value * 1.32 / 100;  // INSS
    QRDetalhamentoFunruralRat.Value   := QRDetalhamentoFunruralsVAL_TOTAL.Value * 0.11 / 100;  // RAT
    QRDetalhamentoFunruralSenar.Value := QRDetalhamentoFunruralsVAL_TOTAL.Value * 0.20 / 100;  // SENAR
  end
  // ---------- Aliq.: 2,23%
  else if SameValue(QRDetalhamentoFunruralPERC_FUNRURAL.Value, 2.23, 0.005) then
  begin
    QRDetalhamentoFunruralcPrev.Value := QRDetalhamentoFunruralsVAL_TOTAL.Value * 1.87 / 100; // INSS
    QRDetalhamentoFunruralRat.Value   := QRDetalhamentoFunruralsVAL_TOTAL.Value * 0.11 / 100; // RAT
    QRDetalhamentoFunruralSenar.Value := QRDetalhamentoFunruralsVAL_TOTAL.Value * 0.25 / 100; // SENAR
  end
  else
  begin
    QRDetalhamentoFunruralcPrev.Value := 0;
    QRDetalhamentoFunruralRat.Value   := 0;
    QRDetalhamentoFunruralSenar.Value := 0;
  end;
end;

end.
