unit UOrdemProducao_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, OracleData, OraTeste;

type
  TDMOrdemProducao = class(TDataModule)
    QOrdemProducao_Item: TOracleDataSet1;
    QREstoque_Producao: TOracleDataSet1;
    QOrdemProducao_ItemCOD_ORDEM_PRODUCAO_CAB: TIntegerField;
    QOrdemProducao_ItemCOD_ORDEM_PRODUCAO_ITEM: TIntegerField;
    QOrdemProducao_ItemCOD_PRODUTO: TIntegerField;
    QOrdemProducao_ItemCOD_LOTE: TIntegerField;
    QOrdemProducao_ItemQT_QUANTIDADE: TIntegerField;
    QOrdemProducao_Itemdesc_produto: TStringField;
    QOrdemProducao_Cab: TOracleDataSet1;
    QOrdemProducao_CabCOD_ORDEM_PRODUCAO_CAB: TIntegerField;
    QOrdemProducao_CabDT_PRODUCAO: TDateTimeField;
    QOrdemProducao_CabCOD_USUARIO: TIntegerField;
    QOrdemProducao_Itemdesc_lote: TStringField;
    QOrdemProducao_CabIND_SITUACAO: TStringField;
    QRComponenteProducao: TOracleDataSet1;
    QRComponenteProducaoCOD_ORDEM_PRODUCAO_CAB: TIntegerField;
    QRComponenteProducaoCOD_ORDEM_PRODUCAO_ITEM: TIntegerField;
    QRComponenteProducaoCOD_PRODUTO: TIntegerField;
    QRComponenteProducaoDESC_PRODUTO: TStringField;
    QRComponenteProducaoQT_QUANTIDADE: TIntegerField;
    QOrdemProducaoCons: TOracleDataSet1;
    QOrdemProducaoConsCOD_ORDEM_PRODUCAO_CAB: TIntegerField;
    QOrdemProducaoConsDT_PRODUCAO: TDateTimeField;
    QOrdemProducaoConsCOD_USUARIO: TIntegerField;
    QOrdemProducaoConsIND_SITUACAO: TStringField;
    QREstoque_Producaoqt_producao: TIntegerField;
    QRFormula_Pedido: TOracleDataSet1;
    QRFormula_PedidoDESC_PRODUTO: TStringField;
    QRFormula_Pedidoqt_estoque: TIntegerField;
    QEtiqueta: TOracleDataSet1;
    QEtiquetaETIQUETA1: TStringField;
    QEtiquetaETIQUETA2: TStringField;
    QEtiquetaETIQUETA3: TStringField;
    QEtiquetaETIQUETA4: TStringField;
    QEtiquetaETIQUETA5: TStringField;
    QEtiquetadesc_produto1: TStringField;
    QEtiquetadesc_produto2: TStringField;
    QEtiquetadesc_produto3: TStringField;
    QEtiquetadesc_produto4: TStringField;
    QEtiquetadesc_produto5: TStringField;
    QREtiquetaProdAcabado: TOracleDataSet1;
    QRFormula_Pedidoqt_ordem: TIntegerField;
    QREtiquetaVolumes: TOracleDataSet1;
    QREtiquetaVolumesCOD_ETIQUETA: TStringField;
    QREtiquetaVolumesdesc_produto: TStringField;
    QRFormula_Pedidoqt_maximo: TIntegerField;
    QRFormula_Pedidoqt_minimo: TIntegerField;
    QRFormula_Pedidoqt_producao: TIntegerField;
    QRFormula_PedidoCOD_PRODUTO: TFloatField;
    QRFormula_PedidoQT_COMPROMETIDO: TFloatField;
    QOrdemProducao_CabDESC_TIPO_ORDEM: TStringField;
    QProduto_Comprometido: TOracleDataSet1;
    QProduto_ComprometidoCOD_PRODUTO: TIntegerField;
    QProduto_ComprometidoQT_COMPROMETIDO: TFloatField;
    QREstoque_ProducaoCOD_COMPONENTE: TIntegerField;
    QREstoque_ProducaoDESC_PRODUTO: TStringField;
    QREstoque_ProducaoQT_COMPROMETIDO: TIntegerField;
    QREstoque_ProducaoQT_QUANTIDADE: TFloatField;
    QREstoque_ProducaoQT_MINIMO: TFloatField;
    QREstoque_ProducaoQT_MAXIMO: TFloatField;
    QREstoque_Producaoqt_ordem: TFloatField;
    QREtiquetaProdAcabadoCOD_PRODUTO: TIntegerField;
    QREtiquetaProdAcabadoDESC_PRODUTO: TStringField;
    QREtiquetaProdAcabadoQT_MAXIMO: TFloatField;
    QREtiquetaProdAcabadoNUM_VOLUMES: TFloatField;
    QOrdemProducao_CabDT_PERIODO_I: TDateTimeField;
    QOrdemProducao_CabDT_PERIODO_F: TDateTimeField;
    QRComponenteProducao1: TOracleDataSet1;
    QRComponenteProducao1COD_ORDEM_PRODUCAO_CAB: TIntegerField;
    QRComponenteProducao1COD_ORDEM_PRODUCAO_ITEM: TIntegerField;
    QRComponenteProducao1COMPONENTE: TIntegerField;
    QRComponenteProducao1DESC_PRODUTO: TStringField;
    QRComponenteProducao1QT_QUANTIDADE: TIntegerField;
    QRComponenteProducao1COD_PRODUTO: TIntegerField;
    QRComponenteProducao1desc_produto_acabado: TStringField;
    QOrdemProducao_ItemQT_ORIGINAL: TIntegerField;
    QOrdemProducaoConsDESC_PRODUTO: TStringField;
    QREstoque_ProducaoCOD_PRODUTO: TIntegerField;
    QOrdemProducao_ItemCOD_FORMULA: TIntegerField;
    QRComponenteProducao1COD_FORMULA: TIntegerField;
    QREstoque_ProducaoCOD_FORMULA: TIntegerField;
    procedure QREstoque_ProducaoCalcFields(DataSet: TDataSet);
    procedure QOrdemProducao_ItemCalcFields(DataSet: TDataSet);
    procedure QRFormula_PedidoCalcFields(DataSet: TDataSet);
    procedure QRComponenteProducao1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOrdemProducao: TDMOrdemProducao;

implementation

uses UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TDMOrdemProducao.QREstoque_ProducaoCalcFields(DataSet: TDataSet);
var
wProduto :integer;
begin
  wProduto := QREstoque_ProducaoCOD_COMPONENTE.Value;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' Then
  Begin
    QREstoque_Producaoqt_Producao.Text := '0' + DMOracle.BuscaNome('SELECT sum(QT_QUANTIDADE) FROM TB_ORDEM_PRODUCAO_ITEM, TB_ORDEM_PRODUCAO_CAB',
                                    'TB_ORDEM_PRODUCAO_CAB.COD_ORDEM_PRODUCAO_CAB = TB_ORDEM_PRODUCAO_ITEM.COD_ORDEM_PRODUCAO_CAB'+
                                    ' AND TB_ORDEM_PRODUCAO_CAB.IND_SITUACAO =' + CHR(39)+'2' + CHR(39) +
                                    ' AND TB_ORDEM_PRODUCAO_ITEM.COD_PRODUTO =' + IntToStr(wProduto) +
                                    ' AND TB_ORDEM_PRODUCAO_ITEM.COD_LOTE = 310');
    If QREstoque_ProducaoQT_QUANTIDADE.Value + QREstoque_Producaoqt_producao.Value + QREstoque_ProducaoQT_MAXIMO.Value
       - QREstoque_ProducaoQT_COMPROMETIDO.Value < QREstoque_ProducaoQT_MINIMO.Value then
      QREstoque_Producaoqt_ordem.Value := (QREstoque_ProducaoQT_MAXIMO.Value + QREstoque_ProducaoQT_MAXIMO.Value)
    else
    if QREstoque_ProducaoQT_QUANTIDADE.Value + QREstoque_Producaoqt_producao.Value - QREstoque_ProducaoQT_COMPROMETIDO.Value < QREstoque_ProducaoQT_MINIMO.Value then
      QREstoque_Producaoqt_ordem.Value := QREstoque_ProducaoQT_MAXIMO.Value
    else
      QREstoque_Producaoqt_ordem.Value := 0;
  end
  else
  Begin
    QREstoque_Producaoqt_Producao.Text := '0' + DMOracle.BuscaNome('SELECT sum(QT_QUANTIDADE) FROM TB_ORDEM_PRODUCAO_ITEM, TB_ORDEM_PRODUCAO_CAB',
                                    'TB_ORDEM_PRODUCAO_CAB.COD_ORDEM_PRODUCAO_CAB = TB_ORDEM_PRODUCAO_ITEM.COD_ORDEM_PRODUCAO_CAB'+
                                    ' AND TB_ORDEM_PRODUCAO_CAB.IND_SITUACAO =' + CHR(39)+'2' + CHR(39) +
                                    ' AND TB_ORDEM_PRODUCAO_ITEM.COD_PRODUTO =' + IntToStr(wProduto));
    If QREstoque_ProducaoQT_QUANTIDADE.Value + QREstoque_Producaoqt_producao.Value + QREstoque_ProducaoQT_MAXIMO.Value
       - QREstoque_ProducaoQT_COMPROMETIDO.Value < QREstoque_ProducaoQT_MINIMO.Value then
      QREstoque_Producaoqt_ordem.Value := (QREstoque_ProducaoQT_MAXIMO.Value + QREstoque_ProducaoQT_MAXIMO.Value)
    else
    if QREstoque_ProducaoQT_QUANTIDADE.Value + QREstoque_Producaoqt_producao.Value - QREstoque_ProducaoQT_COMPROMETIDO.Value < QREstoque_ProducaoQT_MINIMO.Value then
      QREstoque_Producaoqt_ordem.Value := QREstoque_ProducaoQT_MAXIMO.Value
    else
      QREstoque_Producaoqt_ordem.Value := 0;   
  end;
end;

procedure TDMOrdemProducao.QOrdemProducao_ItemCalcFields(
  DataSet: TDataSet);
begin
  QOrdemProducao_Itemdesc_produto.value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                  'COD_PRODUTO ='+FloatToStr(QOrdemProducao_ItemCod_Produto.Value));
  QOrdemProducao_Itemdesc_lote.value := DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO',
                  'COD_LOTE_TIPO ='+FloatToStr(QOrdemProducao_ItemCod_Lote.Value));
end;

procedure TDMOrdemProducao.QRFormula_PedidoCalcFields(DataSet: TDataSet);
var
wproduto :integer;
begin

  wProduto := StrToInt(QRFormula_PedidoCOD_PRODUTO.Text);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' Then
  Begin
    QRFormula_Pedidoqt_estoque.value := StrToInt(DMOracle.BuscaNome('SELECT NVL(QT_QUANTIDADE,0) FROM TB_ESTOQUE',
                                       'COD_PRODUTO ='+FloatToStr(QRFormula_PedidoCod_Produto.Value) + ' AND COD_LOTE_TIPO = 18'));

    QRFormula_Pedidoqt_minimo.Text := DMOracle.BuscaNome('SELECT NVL(QT_MINIMO,0) FROM TB_ESTOQUE','COD_PRODUTO =' +
                                      IntToStr(wProduto) + ' AND COD_LOTE_TIPO = 18');

    QRFormula_Pedidoqt_maximo.Text := DMOracle.BuscaNome('SELECT NVL(QT_MAXIMO,0) FROM TB_ESTOQUE','COD_PRODUTO =' +
                                      IntToStr(wProduto) + ' AND COD_LOTE_TIPO = 18');

    QRFormula_Pedidoqt_Producao.Text := '0' + DMOracle.BuscaNome('SELECT SUM(NVL(QT_QUANTIDADE,0)) FROM TB_ORDEM_PRODUCAO_ITEM, TB_ORDEM_PRODUCAO_CAB',
                                    'TB_ORDEM_PRODUCAO_CAB.COD_ORDEM_PRODUCAO_CAB = TB_ORDEM_PRODUCAO_ITEM.COD_ORDEM_PRODUCAO_CAB'+
                                    ' AND TB_ORDEM_PRODUCAO_CAB.IND_SITUACAO =' + CHR(39)+'2' + CHR(39) +
                                    ' AND TB_ORDEM_PRODUCAO_ITEM.COD_PRODUTO =' + IntToStr(wProduto));

    If QRFormula_Pedidoqt_estoque.Value + QRFormula_Pedidoqt_producao.Value + QRFormula_Pedidoqt_maximo.Value
       - QRFormula_Pedidoqt_comprometido.Value < QRFormula_Pedidoqt_minimo.Value then
      QRFormula_Pedidoqt_ordem.Value := QRFormula_Pedidoqt_maximo.Value + QRFormula_Pedidoqt_maximo.Value
    else
    if QRFormula_Pedidoqt_estoque.Value + QRFormula_Pedidoqt_producao.Value
       - QRFormula_Pedidoqt_comprometido.Value < QRFormula_Pedidoqt_minimo.Value then
      QRFormula_Pedidoqt_ordem.Value := QRFormula_Pedidoqt_maximo.Value
    else
    If QRFormula_Pedidoqt_estoque.Value + QRFormula_Pedidoqt_producao.Value + QRFormula_Pedidoqt_maximo.Value
       + QRFormula_Pedidoqt_maximo.Value - QRFormula_Pedidoqt_comprometido.Value < QRFormula_Pedidoqt_minimo.Value then
      QRFormula_Pedidoqt_ordem.Value := QRFormula_Pedidoqt_maximo.Value + QRFormula_Pedidoqt_maximo.Value + QRFormula_Pedidoqt_maximo.Value
    else
      If QRFormula_Pedidoqt_estoque.Value + QRFormula_Pedidoqt_producao.Value + QRFormula_Pedidoqt_maximo.Value
       + QRFormula_Pedidoqt_maximo.Value + QRFormula_Pedidoqt_maximo.Value
       - QRFormula_Pedidoqt_comprometido.Value < QRFormula_Pedidoqt_minimo.Value then
      QRFormula_Pedidoqt_ordem.Value := QRFormula_Pedidoqt_maximo.Value + QRFormula_Pedidoqt_maximo.Value
                                      + QRFormula_Pedidoqt_maximo.Value + QRFormula_Pedidoqt_maximo.Value
    else
      QRFormula_Pedidoqt_ordem.Value := 0;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'LUNASA' Then
  Begin
      QRFormula_Pedidoqt_estoque.value := StrToInt(DMOracle.BuscaNome('SELECT NVL(QT_QUANTIDADE,0) FROM TB_ESTOQUE',
                                       'COD_PRODUTO ='+QRFormula_PedidoCod_Produto.Text));

    QRFormula_Pedidoqt_minimo.Text := DMOracle.BuscaNome('SELECT NVL(QT_MINIMO,0) FROM TB_ESTOQUE','COD_PRODUTO =' +
                                      IntToStr(wProduto));

    QRFormula_Pedidoqt_maximo.Text := DMOracle.BuscaNome('SELECT NVL(QT_MAXIMO,0) FROM TB_ESTOQUE','COD_PRODUTO =' +
                                      IntToStr(wProduto));

    QRFormula_Pedidoqt_Producao.Text := '0' + DMOracle.BuscaNome('SELECT SUM(NVL(QT_QUANTIDADE,0)) FROM TB_ORDEM_PRODUCAO_ITEM, TB_ORDEM_PRODUCAO_CAB',
                                    'TB_ORDEM_PRODUCAO_CAB.COD_ORDEM_PRODUCAO_CAB = TB_ORDEM_PRODUCAO_ITEM.COD_ORDEM_PRODUCAO_CAB'+
                                    ' AND TB_ORDEM_PRODUCAO_CAB.IND_SITUACAO =' + CHR(39)+'2' + CHR(39) +
                                    ' AND TB_ORDEM_PRODUCAO_ITEM.COD_PRODUTO =' + IntToStr(wProduto));

    QRFormula_Pedidoqt_ordem.Value := StrToInt(QRFormula_Pedidoqt_comprometido.Text);
  end;
end;

procedure TDMOrdemProducao.QRComponenteProducao1CalcFields(
  DataSet: TDataSet);
begin
  QRComponenteProducao1desc_produto_acabado.Value := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                                                     'COD_PRODUTO = '+ QRComponenteProducao1COD_PRODUTO.Text);
end;

end.
