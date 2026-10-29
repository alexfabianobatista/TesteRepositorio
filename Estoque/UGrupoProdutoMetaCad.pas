unit UGrupoProdutoMetaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, Grids, DBGrids, UFmProduto, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFGrupoProdutoMetaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DSItens: TDataSource;
    GroupBox1: TGroupBox;
    DBGItens: TDBGrid;
    BtExcluiItem: TBitBtn;
    Panel2: TPanel;
    FmProduto1: TFmProduto;
    BtAdicionaItem: TBitBtn;
    GruposdeProdutos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure BtAdicionaItemClick(Sender: TObject);
    procedure BtExcluiItemClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBConsultaClick(Sender: TObject);
    procedure GruposdeProdutos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGrupoProdutoMetaCad: TFGrupoProdutoMetaCad;

implementation

uses UGrupoProdutoMeta_cl, UProduto_cl, UProdutoCons, UOracle_cl,
  UGrupoProdutoMetaCons, UGrupoProdutoMetaParam, URGrupoProdutoMeta,
  UFmGrupoProdutoMeta;

{$R *.dfm}

procedure TFGrupoProdutoMetaCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMGrupoProdutoMeta.QGrupoProdutoMeta.Close;
  DMGrupoProdutoMeta.QGrupoProdutoMeta.Open;
end;

procedure TFGrupoProdutoMetaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  BtAdicionaItem.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
  BtExcluiItem.Enabled := (DSPrimario.State in [DsEdit, DsInsert]);
end;

procedure TFGrupoProdutoMetaCad.BtAdicionaItemClick(Sender: TObject);
begin
  inherited;
  if Trim(FmProduto1.MeProduto.Text) = '' then
    Exit;
//    Raise Exception.Create('Produto não informado');
  with DMGrupoProdutoMeta do
  begin

    DMProduto.QProduto.Close();
    DMProduto.QProduto.SetVariable('PK',strToInt(trim(FmProduto1.MeProduto.Text)));
    DMProduto.QProduto.Open();

    QGrupoProdutoMetaItem.Append;
    QGrupoProdutoMetaItemCOD_PRODUTO.Value := DMProduto.QProdutoCOD_PRODUTO.Value;
    QGrupoProdutoMetaItemdesc_produto.Value := DMProduto.QProdutoDESC_PRODUTO.Value;
    QGrupoProdutoMetaItem.Post;
  end;
  FmProduto1.MeProduto.Clear();
end;

procedure TFGrupoProdutoMetaCad.BtExcluiItemClick(Sender: TObject);
begin
  inherited;
  DMGrupoProdutoMeta.QGrupoProdutoMetaItem.Delete;
end;

procedure TFGrupoProdutoMetaCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFGrupoProdutoMetaCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Rollback;
  SBRefresh.Click;
end;

procedure TFGrupoProdutoMetaCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  FmProduto1.BtProduto.Enabled := (DSPrimario.State in [dsEdit, dsInsert]);
end;

procedure TFGrupoProdutoMetaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FGrupoProdutoMetaCons = Nil then
    FGrupoProdutoMetaCons := TFGrupoProdutoMetaCons.Create(Application);
  if FGrupoProdutoMetaCons.ShowModal = MrOk then
  begin
    MELocaliza.Text := DMGrupoProdutoMeta.QGrupoProdutoMetaConsCOD_GRUPO_PRODUTO_META.Text;
    MELocalizaExit(sender);
  end;
end;

procedure TFGrupoProdutoMetaCad.GruposdeProdutos1Click(Sender: TObject);
begin
  inherited;
  if FGrupoProdutoMetaParam = nil then
    FGrupoProdutoMetaParam := TFGrupoProdutoMetaParam.Create(Application);
  FGrupoProdutoMetaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FGrupoProdutoMetaParam.ShowModal = mrok then
    with DMGrupoProdutoMeta do
    begin
      QRGrupoProdutoMeta.Close;
      if Trim(FGrupoProdutoMetaParam.Fm0Produto.MeProduto.Text) <> '' then
        QRGrupoProdutoMeta.SetVariable('PRODUTO', Trim(FGrupoProdutoMetaParam.Fm0Produto.MeProduto.Text))
      else
        QRGrupoProdutoMeta.SetVariable('PRODUTO', null);
      if Trim(FGrupoProdutoMetaParam.Fm0GrupoProdutoMeta.MeGrupoProdutoMeta.Text) <> '' then
        QRGrupoProdutoMeta.SetVariable('GRUPO_PRODUTO_META', Trim(FGrupoProdutoMetaParam.Fm0GrupoProdutoMeta.MeGrupoProdutoMeta.Text))
      else
        QRGrupoProdutoMeta.SetVariable('GRUPO_PRODUTO_META', null);
      QRGrupoProdutoMeta.Open;

      if FRGrupoProdutoMeta = nil then
        FRGrupoProdutoMeta := TFRGrupoProdutoMeta.Create(Application);
      FRGrupoProdutoMeta.QRLProduto.Caption := FGrupoProdutoMetaParam.Fm0Produto.EdProduto.Text;
      FRGrupoProdutoMeta.QRLGrupo.Caption := FGrupoProdutoMetaParam.Fm0GrupoProdutoMeta.EdGrupoProdutoMeta.Text;
      if FGrupoProdutoMetaParam.RGPreview.ItemIndex = 0 then
        FRGrupoProdutoMeta.QRPrimario.Preview
      else
        FRGrupoProdutoMeta.QRPrimario.Print;

      QRGrupoProdutoMeta.Close;
    end;
end;

end.
