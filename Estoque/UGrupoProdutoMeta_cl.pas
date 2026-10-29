unit UGrupoProdutoMeta_cl;

interface

uses
  SysUtils, Classes, DB, OracleData, OraTeste;

type
  TDMGrupoProdutoMeta = class(TDataModule)
    QGrupoProdutoMeta: TOracleDataSet1;
    QGrupoProdutoMetaCOD_GRUPO_PRODUTO_META: TIntegerField;
    QGrupoProdutoMetaDESC_GRUPO_PRODUTO_META: TStringField;
    QGrupoProdutoMetaItem: TOracleDataSet1;
    QGrupoProdutoMetaItemCOD_GRUPO_PRODUTO_META_ITEM: TIntegerField;
    QGrupoProdutoMetaItemCOD_GRUPO_PRODUTO_META: TIntegerField;
    QGrupoProdutoMetaItemCOD_PRODUTO: TFloatField;
    QGrupoProdutoMetaItemdesc_produto: TStringField;
    QGrupoProdutoMetaCons: TOracleDataSet1;
    QGrupoProdutoMetaConsCOD_GRUPO_PRODUTO_META: TIntegerField;
    QGrupoProdutoMetaConsDESC_GRUPO_PRODUTO_META: TStringField;
    QRGrupoProdutoMeta: TOracleDataSet1;
    QRGrupoProdutoMetaCOD_GRUPO_PRODUTO_META: TIntegerField;
    QRGrupoProdutoMetaDESC_GRUPO_PRODUTO_META: TStringField;
    QRGrupoProdutoMetaCOD_PRODUTO: TFloatField;
    QRGrupoProdutoMetaDESC_PRODUTO: TStringField;
    procedure QGrupoProdutoMetaAfterOpen(DataSet: TDataSet);
    procedure QGrupoProdutoMetaItemCalcFields(DataSet: TDataSet);
    procedure QGrupoProdutoMetaItemBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMGrupoProdutoMeta: TDMGrupoProdutoMeta;

implementation

uses UOracle_cl;

{$R *.dfm}

procedure TDMGrupoProdutoMeta.QGrupoProdutoMetaAfterOpen(
  DataSet: TDataSet);
begin
  QGrupoProdutoMetaItem.Close;
  QGrupoProdutoMetaItem.Open;
end;

procedure TDMGrupoProdutoMeta.QGrupoProdutoMetaItemCalcFields(
  DataSet: TDataSet);
begin
  if QGrupoProdutoMetaItemCOD_PRODUTO.Value > 0 then
    QGrupoProdutoMetaItemdesc_produto.Value := DMOracle.
        BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' +
        QGrupoProdutoMetaItemCOD_PRODUTO.Text, True)
  else
    QGrupoProdutoMetaItemdesc_produto.Value := '';
end;

procedure TDMGrupoProdutoMeta.QGrupoProdutoMetaItemBeforeInsert(
  DataSet: TDataSet);
begin
  if QGrupoProdutoMeta.State = DsInsert then
  begin
    QGrupoProdutoMeta.Post;
    QGrupoProdutoMeta.Edit;
  end;
end;

end.
