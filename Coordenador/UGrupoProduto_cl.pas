unit UGrupoProduto_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMGrupoProduto = class(TDataModule)
    QGrupoProduto_Cad: TOracleDataSet1;
    QGrupoProduto_CadCOD_GRUPO_PRODUTO: TIntegerField;
    QGrupoProduto_CadDESC_GRUPO_PRODUTO: TStringField;
    QGrupoProdutoItem_Cad: TOracleDataSet1;
    QGrupoProduto_Cons: TOracleDataSet1;
    QGrupoProduto_ConsCOD_GRUPO_PRODUTO: TIntegerField;
    QGrupoProduto_ConsDESC_GRUPO_PRODUTO: TStringField;
    QGrupoProdutoItem_Caddesc_classe: TStringField;
    QGrupoProdutoItem_CadCOD_GRUPO_PRODUTO_ITEM: TIntegerField;
    QGrupoProdutoItem_CadCOD_GRUPO_PRODUTO: TIntegerField;
    QGrupoProdutoItem_CadQT_META_KG: TIntegerField;
    QGrupoProdutoItem_CadVAL_META_PRECO_MEDIO: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_KG1: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_KG2: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_KG3: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_KG4: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_PRECO1: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_PRECO2: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_PRECO3: TFloatField;
    QGrupoProdutoItem_CadNOTA_FAIXA_PRECO4: TFloatField;
    QGrupoProdutoItem_CadCOD_CLASSE: TIntegerField;
    QGrupoProdutoItem_CadVAL_FAIXA_DE1: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_ATE1: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_DE2: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_ATE2: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_DE3: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_ATE3: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_DE4: TFloatField;
    QGrupoProdutoItem_CadVAL_FAIXA_ATE4: TFloatField;
    QRGrupoMapa: TOracleDataSet1;
    QGrupoProdutoItem_CadCOD_VENDEDOR: TIntegerField;
    QGrupoProdutoItem_Cadnome_vendedor: TStringField;
    QRGrupoMapaCOD_CLASSE: TFloatField;
    QRGrupoMapaDESC_CLASSE: TStringField;
    QRGrupoMapaDESC_GRUPO_PRODUTO: TStringField;
    QRGrupoMapaQT_META_KG: TFloatField;
    QRGrupoMapaVAL_META_PRECO_MEDIO: TFloatField;
    QRGrupoMapaNOTA_FAIXA_KG1: TFloatField;
    QRGrupoMapaNOTA_FAIXA_KG2: TFloatField;
    QRGrupoMapaNOTA_FAIXA_KG3: TFloatField;
    QRGrupoMapaNOTA_FAIXA_KG4: TFloatField;
    QRGrupoMapaNOTA_FAIXA_PRECO1: TFloatField;
    QRGrupoMapaNOTA_FAIXA_PRECO2: TFloatField;
    QRGrupoMapaNOTA_FAIXA_PRECO3: TFloatField;
    QRGrupoMapaNOTA_FAIXA_PRECO4: TFloatField;
    QRGrupoMapaVAL_FAIXA_DE1: TFloatField;
    QRGrupoMapaVAL_FAIXA_ATE1: TFloatField;
    QRGrupoMapaVAL_FAIXA_DE2: TFloatField;
    QRGrupoMapaVAL_FAIXA_ATE2: TFloatField;
    QRGrupoMapaVAL_FAIXA_DE3: TFloatField;
    QRGrupoMapaVAL_FAIXA_ATE3: TFloatField;
    QRGrupoMapaVAL_FAIXA_DE4: TFloatField;
    QRGrupoMapaVAL_FAIXA_ATE4: TFloatField;
    QRGrupoMapaSVAL_TOTAL: TFloatField;
    QRGrupoMapaSQT_QUANTIDADE: TFloatField;
    QRGrupoMapaSQT_KILOS: TFloatField;
    QRGrupoMapaVAL_MEDIA: TFloatField;
    QRGrupoProduto: TOracleDataSet1;
    QRGrupoProdutoCOD_GRUPO_PRODUTO_ITEM: TIntegerField;
    QRGrupoProdutoCOD_GRUPO_PRODUTO: TIntegerField;
    QRGrupoProdutoDESC_GRUPO_PRODUTO: TStringField;
    QRGrupoProdutoQT_META_KG: TIntegerField;
    QRGrupoProdutoVAL_META_PRECO_MEDIO: TFloatField;
    QRGrupoProdutoVAL_FAIXA_DE1: TFloatField;
    QRGrupoProdutoVAL_FAIXA_ATE1: TFloatField;
    QRGrupoProdutoVAL_FAIXA_DE2: TFloatField;
    QRGrupoProdutoVAL_FAIXA_ATE2: TFloatField;
    QRGrupoProdutoVAL_FAIXA_DE3: TFloatField;
    QRGrupoProdutoVAL_FAIXA_ATE3: TFloatField;
    QRGrupoProdutoVAL_FAIXA_DE4: TFloatField;
    QRGrupoProdutoVAL_FAIXA_ATE4: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_KG1: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_KG2: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_KG3: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_KG4: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_PRECO1: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_PRECO2: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_PRECO3: TFloatField;
    QRGrupoProdutoNOTA_FAIXA_PRECO4: TFloatField;
    QRGrupoProdutoDESC_CLASSE: TStringField;
    QRGrupoProdutoNOME: TStringField;
    QRGrupoMapaCOD_REPRESENTANTE: TFloatField;
    QRGrupoMapaNOME: TStringField;
    QrValoresPremio: TOracleDataSet1;
    QRepresentante_Meta: TOracleDataSet1;
    QRepresentante_MetaNUM_BONUS_QUALIDADE: TFloatField;
    QRepresentante_MetaVAL_PREMIO: TFloatField;
    QRepresentante_MetaPERC_INADIMPLENCIA: TFloatField;
    QRInadimplencia: TOracleDataSet1;
    QRInadimplenciaCOD_SUPERVISOR: TFloatField;
    QRInadimplenciaSVAL_VENDA: TFloatField;
    QRInadimplenciaSVAL_RECEBER: TFloatField;
    QrValoresPremioCOD_REPRESENTANTE: TFloatField;
    QrValoresPremioNOME: TStringField;
    QrValoresPremioCOD_CLASSE: TFloatField;
    QrValoresPremioDESC_CLASSE: TStringField;
    QrValoresPremioDESC_GRUPO_PRODUTO: TStringField;
    QrValoresPremioQT_META_KG: TFloatField;
    QrValoresPremioVAL_META_PRECO_MEDIO: TFloatField;
    QrValoresPremioNOTA_FAIXA_KG1: TFloatField;
    QrValoresPremioNOTA_FAIXA_KG2: TFloatField;
    QrValoresPremioNOTA_FAIXA_KG3: TFloatField;
    QrValoresPremioNOTA_FAIXA_KG4: TFloatField;
    QrValoresPremioNOTA_FAIXA_PRECO1: TFloatField;
    QrValoresPremioNOTA_FAIXA_PRECO2: TFloatField;
    QrValoresPremioNOTA_FAIXA_PRECO3: TFloatField;
    QrValoresPremioNOTA_FAIXA_PRECO4: TFloatField;
    QrValoresPremioVAL_FAIXA_DE1: TFloatField;
    QrValoresPremioVAL_FAIXA_ATE1: TFloatField;
    QrValoresPremioVAL_FAIXA_DE2: TFloatField;
    QrValoresPremioVAL_FAIXA_ATE2: TFloatField;
    QrValoresPremioVAL_FAIXA_DE3: TFloatField;
    QrValoresPremioVAL_FAIXA_ATE3: TFloatField;
    QrValoresPremioVAL_FAIXA_DE4: TFloatField;
    QrValoresPremioVAL_FAIXA_ATE4: TFloatField;
    QrValoresPremioSVAL_TOTAL: TFloatField;
    QrValoresPremioSQT_QUANTIDADE: TFloatField;
    QrValoresPremioSQT_KILOS: TFloatField;
    QrValoresPremioVAL_MEDIA: TFloatField;
    QrValoresPremioCOD_GRUPO_PRODUTO: TFloatField;
    QRepresentante_MetaCOD_PREMIO_VENDEDOR: TIntegerField;
    QRepresentante_MetaCOD_VENDEDOR: TIntegerField;
    QRepresentante_MetaNUM_ANO: TIntegerField;
    QRepresentante_MetaNUM_MES: TIntegerField;
    QRepresentante_MetaNOTA_DE1: TFloatField;
    QRepresentante_MetaNOTA_ATE1: TFloatField;
    QRepresentante_MetaPERC_PREMIO1: TFloatField;
    QRepresentante_MetaNOTA_DE2: TFloatField;
    QRepresentante_MetaNOTA_ATE2: TFloatField;
    QRepresentante_MetaPERC_PREMIO2: TFloatField;
    QRepresentante_MetaNOTA_DE3: TFloatField;
    QRepresentante_MetaNOTA_ATE3: TFloatField;
    QRepresentante_MetaPERC_PREMIO3: TFloatField;
    QRepresentante_MetaNOTA_DE4: TFloatField;
    QRepresentante_MetaNOTA_ATE4: TFloatField;
    QRepresentante_MetaPERC_PREMIO4: TFloatField;
    QRepresentante_MetaNOTA_DE5: TFloatField;
    QRepresentante_MetaNOTA_ATE5: TFloatField;
    QRepresentante_MetaPERC_PREMIO5: TFloatField;
    QRepresentante_MetaNOTA_DE6: TFloatField;
    QRepresentante_MetaNOTA_ATE6: TFloatField;
    QRepresentante_MetaPERC_PREMIO6: TFloatField;
    QRepresentante_MetaNOTA_DE7: TFloatField;
    QRepresentante_MetaNOTA_ATE7: TFloatField;
    QRepresentante_MetaPERC_PREMIO7: TFloatField;
    QRepresentante_MetaNOTA_DE8: TFloatField;
    QRepresentante_MetaNOTA_ATE8: TFloatField;
    QRepresentante_MetaPERC_PREMIO8: TFloatField;
    QRepresentante_MetaNOTA_DE9: TFloatField;
    QRepresentante_MetaNOTA_ATE9: TFloatField;
    QRepresentante_MetaPERC_PREMIO9: TFloatField;
    QRepresentante_MetaNOTA_DE10: TFloatField;
    QRepresentante_MetaNOTA_ATE10: TFloatField;
    QRepresentante_MetaPERC_PREMIO10: TFloatField;
    QRepresentante_MetaNOTA_ACIMA: TFloatField;
    QRepresentante_MetaPERC_PREMIO_ACIMA: TFloatField;
    QPremio_Representante: TOracleDataSet1;
    QPremio_RepresentanteCOD_COORDENADOR: TIntegerField;
    QPremio_RepresentanteCOD_CLASSE: TIntegerField;
    QPremio_RepresentanteCOD_GRUPO_PRODUTO: TIntegerField;
    QPremio_RepresentanteQT_META_KG: TFloatField;
    QPremio_RepresentanteQT_REALIZADO_KG: TFloatField;
    QPremio_RepresentanteVL_META_PRECO: TFloatField;
    QPremio_RepresentanteVL_REALIZADO_PRECO: TFloatField;
    QPremio_RepresentanteNUM_NOTA_KG: TFloatField;
    QPremio_RepresentanteNUM_NOTA_PRECO: TFloatField;
    QPremio_RepresentanteVL_PREMIO_PROFISSIONAL: TFloatField;
    QPremio_RepresentanteNUM_NOTA_BONUS: TFloatField;
    QPremio_RepresentanteNUM_NOTA_INADIMPLENCIA: TFloatField;
    QPremio_RepresentantePERC_GANHO: TFloatField;
    QPremio_RepresentanteNOME: TStringField;
    QPremio_RepresentanteDESC_CLASSE: TStringField;
    QPremio_RepresentanteDESC_GRUPO_PRODUTO: TStringField;
    QPremio_RepresentanteVL_PREMIO: TFloatField;
    QPremio_RepresentanteNUM_FAIXA_KG_DE: TFloatField;
    QPremio_RepresentanteNUM_FAIXA_KG_ATE: TFloatField;
    QPremio_RepresentanteNUM_FAIXA_PRECO_DE: TFloatField;
    QPremio_RepresentanteNUM_FAIXA_PRECO_ATE: TFloatField;
    QGrupoProduto_CadCOD_GRUPO: TIntegerField;
    QGrupoProduto_CadNUM_ANO: TIntegerField;
    QGrupoProduto_CadNUM_MES: TIntegerField;
    QGrupoProduto_Origem: TOracleDataSet1;
    QGrupoProduto_OrigemCOD_GRUPO_PRODUTO: TIntegerField;
    QGrupoProduto_OrigemDESC_GRUPO_PRODUTO: TStringField;
    QGrupoProduto_OrigemCOD_GRUPO: TIntegerField;
    QGrupoProduto_OrigemNUM_ANO: TIntegerField;
    QGrupoProduto_OrigemNUM_MES: TIntegerField;
    QGrupoProdutoItem_Origem: TOracleDataSet1;
    QGrupoProdutoItem_OrigemCOD_GRUPO_PRODUTO_ITEM: TIntegerField;
    QGrupoProdutoItem_OrigemCOD_GRUPO_PRODUTO: TIntegerField;
    QGrupoProdutoItem_OrigemQT_META_KG: TIntegerField;
    QGrupoProdutoItem_OrigemVAL_META_PRECO_MEDIO: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_KG1: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_KG2: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_KG3: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_KG4: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO1: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO2: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO3: TFloatField;
    QGrupoProdutoItem_OrigemNOTA_FAIXA_PRECO4: TFloatField;
    QGrupoProdutoItem_OrigemCOD_CLASSE: TIntegerField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_DE1: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_ATE1: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_DE2: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_ATE2: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_DE3: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_ATE3: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_DE4: TFloatField;
    QGrupoProdutoItem_OrigemVAL_FAIXA_ATE4: TFloatField;
    QGrupoProdutoItem_OrigemCOD_VENDEDOR: TIntegerField;
    procedure QGrupoProdutoItem_CadCalcFields(DataSet: TDataSet);
    procedure QGrupoProdutoItem_CadAfterInsert(DataSet: TDataSet);
    procedure QGrupoProdutoItem_CadBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGrupoProduto: TDMGrupoProduto;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMGrupoProduto.QGrupoProdutoItem_CadCalcFields(
  DataSet: TDataSet);
begin
  QGrupoProdutoItem_CadDesc_Classe.Value := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(QGrupoProdutoItem_CadCod_Classe.Value));
  QGrupoProdutoItem_CadNome_Vendedor.Value := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(QGrupoProdutoItem_CadCod_Vendedor.Value));
end;

procedure TDMGrupoProduto.QGrupoProdutoItem_CadAfterInsert(
  DataSet: TDataSet);
begin
  QGrupoProdutoItem_CadCod_Grupo_Produto.Value := QGrupoProduto_CadCod_Grupo_Produto.Value;
  QGrupoProdutoItem_CadVAL_FAIXA_DE1.Value := 90;
  QGrupoProdutoItem_CadVAL_FAIXA_ATE1.Value := 92.5;
  QGrupoProdutoItem_CadVAL_FAIXA_DE2.Value := 92.6;
  QGrupoProdutoItem_CadVAL_FAIXA_ATE2.Value := 95;
  QGrupoProdutoItem_CadVAL_FAIXA_DE3.Value := 95.1;
  QGrupoProdutoItem_CadVAL_FAIXA_ATE3.Value := 97.5;
  QGrupoProdutoItem_CadVAL_FAIXA_DE4.Value := 97.6;
  QGrupoProdutoItem_CadVAL_FAIXA_ATE4.Value := 100;

end;

procedure TDMGrupoProduto.QGrupoProdutoItem_CadBeforePost(
  DataSet: TDataSet);
begin
  if QGrupoProdutoItem_CadQT_META_KG.Text = ''  then
    raise Exception.Create('Meta deve ser maior que 0(zero)!')
  else
    if QGrupoProdutoItem_CadQT_META_KG.Value <= 0 then
      raise Exception.Create('Meta deve ser maior que 0(zero)!');

end;

end.
