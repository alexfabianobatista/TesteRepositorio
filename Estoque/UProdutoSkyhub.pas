unit UProdutoSkyhub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBPanel, DBCtrls, UFmProduto, Grids, DBGrids, Math,
  Jpeg, SHELLAPI, Clipbrd, StrUtils, UCarregando2, UBiblioteca, UFmFilial;

type
  TFProdutoSkyhub = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TSImagens: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    DsVariacao: TDataSource;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    DBGrid4: TDBGrid;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    GroupBox7: TGroupBox;
    Label7: TLabel;
    DBEAltura: TDBEdit;
    Label8: TLabel;
    DBELargura: TDBEdit;
    Label9: TLabel;
    DBComprimento: TDBEdit;
    Ajuda1: TMenuItem;
    Boaspraticasdecadastro1: TMenuItem;
    Produtoderivado1: TMenuItem;
    Memo7: TMemo;
    LbEspVoltagem: TLabel;
    Memo9: TMemo;
    TreeView1: TTreeView;
    LbCategoria1: TListBox;
    LbCategoria2: TListBox;
    LbCategoria3: TListBox;
    LbCategoria4: TListBox;
    DBPanel1: TDBPanel;
    Memo8: TMemo;
    Label41: TLabel;
    DBEPeso: TDBEdit;
    Opes1: TMenuItem;
    Conexodeprodutos1: TMenuItem;
    DBCEspVoltagem: TDBComboBox;
    Adicionarafiladesincronizao1: TMenuItem;
    Atualizarcategorias1: TMenuItem;
    TabSheet6: TTabSheet;
    GroupBox9: TGroupBox;
    Label42: TLabel;
    DBEdit6: TDBEdit;
    Memo1: TMemo;
    DsProdutoSkyhubUrl: TDataSource;
    GroupBox10: TGroupBox;
    BtnVisitar1: TBitBtn;
    BtnVisitar2: TBitBtn;
    BtnVisitar3: TBitBtn;
    BtnVisitar4: TBitBtn;
    DBELinkMLivre: TDBEdit;
    DBELinkShoptime: TDBEdit;
    DBELinkSubmarino: TDBEdit;
    DBELinkAmericanas: TDBEdit;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    DBEEspAlimentacao: TDBPanel;
    DBEEspAparelhosCompativeis: TDBPanel;
    DBEEspConteudoDaEmbalagem: TDBPanel;
    DBEEspCor: TDBPanel;
    DBEEspDataDeLancamentoNoMercado: TDBPanel;
    DBEEspDimensoesProduto: TDBPanel;
    DBEEspFabricante: TDBPanel;
    DBEEspGarantiaDoFornecedor: TDBPanel;
    DBEEspMaisInformacoes: TDBPanel;
    DBEEspMaterialComposicao: TDBPanel;
    DBEEspModelo: TDBPanel;
    DBEEspPesoLiqEmbalagem: TDBPanel;
    DBEEspPesoLiqProduto: TDBPanel;
    DBEEspRecursosFuncionalidades: TDBPanel;
    DBEEspReferenciaDoModelo: TDBPanel;
    DBEEspSAC: TDBPanel;
    DBEEspTamanho: TDBPanel;
    DBEEspVideo: TDBPanel;
    Label2: TLabel;
    DBEProdutoDerivado: TDBEdit;
    Memo3: TMemo;
    EDProdutoDerivado: TEdit;
    BtProdutoDerivado: TBitBtn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    DBEProduto: TDBEdit;
    BtProduto: TBitBtn;
    sbInfosProduto: TSpeedButton;
    DBETitulo: TDBEdit;
    Label4: TLabel;
    Memo4: TMemo;
    Label20: TLabel;
    DBEMarca: TDBEdit;
    DBRadioGroup4: TDBRadioGroup;
    LbEspManual: TLabel;
    DBEEspManual: TDBComboBox;
    PNImagem1: TPanel;
    Memo2: TMemo;
    PNImagemFundo1: TPanel;
    IMImagem1: TImage;
    BtnImagem1: TBitBtn;
    PNImagem2: TPanel;
    PNImagemFundo2: TPanel;
    IMImagem2: TImage;
    BtnImagem2: TBitBtn;
    PNImagem3: TPanel;
    PNImagemFundo3: TPanel;
    IMImagem3: TImage;
    BtnImagem3: TBitBtn;
    PNImagem4: TPanel;
    PNImagemFundo4: TPanel;
    IMImagem4: TImage;
    BtnImagem4: TBitBtn;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem2: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem3: TMenuItem;
    PopupMenu4: TPopupMenu;
    MenuItem4: TMenuItem;
    LbCategoria5: TListBox;
    DBTSituacao: TDBText;
    DsProdutoSincronizacao: TDataSource;
    Sincronizaes1: TMenuItem;
    DBMDescricao: TDBMemo;
    DBEdit7: TDBEdit;
    procedure DBPCodigoProdutoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure DBPProdutoDerivadoDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure BtProdutoDerivadoClick(Sender: TObject);
    procedure DBEProdutoChange(Sender: TObject);
    procedure DBEProdutoDerivadoChange(Sender: TObject);
    procedure Boaspraticasdecadastro1Click(Sender: TObject);
    procedure Produtoderivado1Click(Sender: TObject);
    procedure BtnTestarLink1Click(Sender: TObject);
    procedure BtnTestarLink2Click(Sender: TObject);
    procedure BtnTestarLink3Click(Sender: TObject);
    procedure BtnTestarLink4Click(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure SelecionaItemPorListbox(Level : Integer);
    procedure LbCategoria1Click(Sender: TObject);
    procedure LbCategoria2Click(Sender: TObject);
    procedure LbCategoria3Click(Sender: TObject);
    procedure DBPanel1CodigoChange(Sender: TObject);
    procedure CriaStringCategorias;
    procedure BtnColaLink1Click(Sender: TObject);
    procedure BtnColaLink2Click(Sender: TObject);
    procedure BtnColaLink3Click(Sender: TObject);
    procedure BtnColaLink4Click(Sender: TObject);
    function URLEncode(s: string): string;
    procedure Conexodeprodutos1Click(Sender: TObject);
    procedure sbInfosProdutoClick(Sender: TObject);
    procedure SelecionaCodigoCategoria();
    procedure Adicionarafiladesincronizao1Click(Sender: TObject);
    procedure Atualizarcategorias1Click(Sender: TObject);
    procedure CarregaCategorias();
    procedure BtnVisitar2Click(Sender: TObject);
    procedure BtnVisitar3Click(Sender: TObject);
    procedure BtnVisitar4Click(Sender: TObject);
    function AtualizaUrls(Loja : String): String;
    procedure SBConfirmarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure BtnImagem1Click(Sender: TObject);
    procedure CarregaImagemSelecionada(IMImagem : TImage; Blob : TBlobField);
    procedure BtnImagem2Click(Sender: TObject);
    procedure BtnImagem3Click(Sender: TObject);
    procedure BtnImagem4Click(Sender: TObject);
    procedure BlobParaImagem(Blob : TBlobField; IMImagem : TImage);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);   
    procedure TentaCarregarUmaImagem(Blob: TBlobField; Link: string ; Destino: TImage);
    procedure LbCategoria4Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BtnVisitar1Click(Sender: TObject);
    procedure Sincronizaes1Click(Sender: TObject);    
    procedure AtualizaImagem(Imagem: TImage; Painel : TPanel; Valor : string);
  private
    FCarregando: TFCarregando2;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoSkyhub: TFProdutoSkyhub; 
  DescricaoCategorias: TStringArray;
  IdCategorias: TStringArray;

implementation

uses UProdutoSkyhub_cl, UProduto_cl, UProdutoCons, UProdutoSkyhubCons, UOracle_cl, UTela_cl, UFuncao_cl,
    UProdutoSkyhubParam, UProdutoParam, UParamSistema_cl, UNotasMarketplace_cl, URConexaoProdutoSkyhub,
    UCarregaImagem, URSincronizacaoSkyhub;

{$R *.dfm}

procedure TFProdutoSkyhub.DBPCodigoProdutoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFProdutoSkyhub.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FProdutoSkyhubCons = nil then
    FProdutoSkyhubCons := TFProdutoSkyhubCons.Create(Application);
  if FProdutoSkyhubCons.ShowModal = MrOk then
  begin
    MeLocaliza.Text := DMProdutoSkyhub.QProdutoSkyhubConsCOD_PRODUTO_SKYHUB.Text;
    MELocalizaExit(Sender);
  end;
end;

procedure TFProdutoSkyhub.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Value := DMProduto.QProdutoConsCod_Produto.Value;
    PageControl1.ActivePageIndex := 0;
    sbInfosProdutoClick(Self);
    DBETitulo.SetFocus;
  end;
end;

procedure TFProdutoSkyhub.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DsInsert] then
  begin
    if DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text = '' then
      BtProdutoClick(Sender);

    LbCategoria1.Selected[0] := True;
    LbCategoria1Click(Sender);
  end;

  if DSPrimario.State in [DsInsert, DsEdit] then
    Opes1.Enabled := False
  else
    Opes1.Enabled := True;

  sbInfosProduto.Enabled := DSPrimario.State in [DsInsert, DsEdit];

  BtnImagem1.Enabled := DSPrimario.State in [DsInsert, DsEdit];
  BtnImagem2.Enabled := DSPrimario.State in [DsInsert, DsEdit];
  BtnImagem3.Enabled := DSPrimario.State in [DsInsert, DsEdit];
  BtnImagem4.Enabled := DSPrimario.State in [DsInsert, DsEdit];

  PopupMenu1.AutoPopup := DSPrimario.State in [DsInsert, DsEdit];
  PopupMenu2.AutoPopup := DSPrimario.State in [DsInsert, DsEdit];
  PopupMenu3.AutoPopup := DSPrimario.State in [DsInsert, DsEdit];
  PopupMenu4.AutoPopup := DSPrimario.State in [DsInsert, DsEdit];

  LbCategoria1.Enabled :=   DSPrimario.State in [DsInsert, DsEdit];
  LbCategoria2.Enabled :=   DSPrimario.State in [DsInsert, DsEdit];
  LbCategoria3.Enabled :=   DSPrimario.State in [DsInsert, DsEdit];
  LbCategoria4.Enabled :=   DSPrimario.State in [DsInsert, DsEdit];
  LbCategoria5.Enabled :=   DSPrimario.State in [DsInsert, DsEdit];
  
  DBEEspAlimentacao.Enabled :=                DSPrimario.State in [DsInsert, DsEdit];
  DBEEspAparelhosCompativeis.Enabled :=       DSPrimario.State in [DsInsert, DsEdit];
  DBEEspConteudoDaEmbalagem.Enabled :=        DSPrimario.State in [DsInsert, DsEdit];
  DBEEspCor.Enabled :=                        DSPrimario.State in [DsInsert, DsEdit];
  DBEEspDataDeLancamentoNoMercado.Enabled :=  DSPrimario.State in [DsInsert, DsEdit];
  DBEEspDimensoesProduto.Enabled :=           DSPrimario.State in [DsInsert, DsEdit];
  DBEEspFabricante.Enabled :=                 DSPrimario.State in [DsInsert, DsEdit];
  DBEEspGarantiaDoFornecedor.Enabled :=       DSPrimario.State in [DsInsert];
  DBEEspMaisInformacoes.Enabled :=            DSPrimario.State in [DsInsert, DsEdit];
  DBEEspManual.Enabled :=                     DSPrimario.State in [DsInsert, DsEdit];
  DBEEspMaterialComposicao.Enabled :=         DSPrimario.State in [DsInsert, DsEdit];
  DBEEspModelo.Enabled :=                     DSPrimario.State in [DsInsert, DsEdit];
  DBEEspPesoLiqEmbalagem.Enabled :=           DSPrimario.State in [DsInsert, DsEdit];
  DBEEspPesoLiqProduto.Enabled :=             DSPrimario.State in [DsInsert, DsEdit];
  DBEEspRecursosFuncionalidades.Enabled :=    DSPrimario.State in [DsInsert, DsEdit];
  DBEEspReferenciaDoModelo.Enabled :=         DSPrimario.State in [DsInsert, DsEdit];
  DBEEspSAC.Enabled :=                        DSPrimario.State in [DsInsert, DsEdit];
  DBEEspTamanho.Enabled :=                    DSPrimario.State in [DsInsert, DsEdit];
  DBEEspVideo.Enabled :=                      DSPrimario.State in [DsInsert, DsEdit];
  DBEEspVideo.Enabled :=                      DSPrimario.State in [DsInsert, DsEdit];
  DBCEspVoltagem.Enabled :=                   DSPrimario.State in [DsInsert, DsEdit];

  with DMProdutoSkyhub do
  begin
    if PageControl1.ActivePage = TSImagens then
    begin
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_1, QProdutoSkyhubDESC_LINK_IMAGEM_1.Value, IMImagem1);
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_2, QProdutoSkyhubDESC_LINK_IMAGEM_2.Value, IMImagem2);
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_3, QProdutoSkyhubDESC_LINK_IMAGEM_3.Value, IMImagem3);
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_4, QProdutoSkyhubDESC_LINK_IMAGEM_4.Value, IMImagem4);
      
      AtualizaImagem(IMImagem1, PNImagemFundo1, QProdutoSkyhubDESC_LINK_IMAGEM_1.Value);
      AtualizaImagem(IMImagem2, PNImagemFundo2, QProdutoSkyhubDESC_LINK_IMAGEM_2.Value);
      AtualizaImagem(IMImagem3, PNImagemFundo3, QProdutoSkyhubDESC_LINK_IMAGEM_3.Value);
      AtualizaImagem(IMImagem4, PNImagemFundo4, QProdutoSkyhubDESC_LINK_IMAGEM_4.Value);
    end;
  end;

  if DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO_SKYHUB.Value > 0 then
    DBTSituacao.Font.Color := StringToColor(DMProdutoSkyhub.QProdutoSkyhubdesc_cor_situacao.Value);
end;

procedure TFProdutoSkyhub.BlobParaImagem(Blob : TBlobField; IMImagem : TImage);
var
  wStream: TStream;
  wJpeg: TJpegImage;
begin
  if Blob.BlobSize > 0 then
  begin
    wStream := DMProdutoSkyhub.QProdutoSkyhub.CreateBlobStream(Blob, bmRead);
    wJpeg := TJpegImage.Create;
    wJpeg.LoadFromStream(wStream);
    IMImagem.Picture.Assign(wJpeg);
    wJpeg.Free;
    wStream.Destroy;
  end
  else
    IMImagem.Picture.Assign(nil);
end;

procedure TFProdutoSkyhub.FormCreate(Sender: TObject);
begin
  inherited;
  DMTela.VerificaTela('ESTOQUE', 'Cadastro de Produtos Marketplace', 'FProdutoSkyhub');

  PageControl1.ActivePageIndex := 0;
  Bib.addControleCharCase(DBETitulo, Self.Name);
  Bib.addControleCharCase(DBEMarca, Self.Name);
  
  Bib.addControleCharCase(DBEEspAlimentacao, Self.Name);
  Bib.addControleCharCase(DBEEspAparelhosCompativeis,Self.Name);
  Bib.addControleCharCase(DBEEspConteudoDaEmbalagem, Self.Name);
  Bib.addControleCharCase(DBEEspCor, Self.Name);
  Bib.addControleCharCase(DBEEspDataDeLancamentoNoMercado, Self.Name);
  Bib.addControleCharCase(DBEEspDimensoesProduto,Self.Name);
  Bib.addControleCharCase(DBEEspFabricante,Self.Name);
  Bib.addControleCharCase(DBEEspGarantiaDoFornecedor,Self.Name);
  Bib.addControleCharCase(DBEEspMaisInformacoes, Self.Name);
  Bib.addControleCharCase(DBEEspManual,Self.Name);
  Bib.addControleCharCase(DBEEspMaterialComposicao,Self.Name);
  Bib.addControleCharCase(DBEEspModelo,Self.Name);
  Bib.addControleCharCase(DBEEspPesoLiqEmbalagem,Self.Name);
  Bib.addControleCharCase(DBEEspPesoLiqProduto,Self.Name);
  Bib.addControleCharCase(DBEEspRecursosFuncionalidades, Self.Name);
  Bib.addControleCharCase(DBEEspReferenciaDoModelo,Self.Name);
  Bib.addControleCharCase(DBEEspSAC, Self.Name);
  Bib.addControleCharCase(DBEEspTamanho, Self.Name);
  Bib.addControleCharCase(DBEEspVideo, Self.Name);

  Bib.addControleCharCase(DBELinkAmericanas, Self.Name);
  Bib.addControleCharCase(DBELinkSubmarino, Self.Name);
  Bib.addControleCharCase(DBELinkShoptime, Self.Name);
  Bib.addControleCharCase(DBELinkMLivre, Self.Name);

  CarregaCategorias;

  if FCarregando = nil then
    FCarregando := TFCarregando2.Create(Application);
  
  DMProdutoSkyhub.QProdutoSkyhub.Open;

  TabSheet5.TabVisible := False;
end;

procedure TFProdutoSkyhub.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    on E: Exception do
    begin
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TFProdutoSkyhub.DBPProdutoDerivadoDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FProdutoCons;
  Classe := TFProdutoCons;
end;

procedure TFProdutoSkyhub.BtProdutoDerivadoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DBEProdutoDerivado.Text := DMProduto.QProdutoConsCod_Produto.Text;
  end;
end;

procedure TFProdutoSkyhub.DBEProdutoChange(Sender: TObject);
begin
  inherited;
{  if DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text <> '' then
    EDProduto.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO','COD_PRODUTO = ' + DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text)
  else
    EDProduto.Text := '';
}    
end;

procedure TFProdutoSkyhub.DBEProdutoDerivadoChange(Sender: TObject);
begin
  inherited;
  if DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO_SKYHUB_PAI.Text <> '' then
    EDProdutoDerivado.Text := DMOracle.FastSelect('DESC_PRODUTO','TB_PRODUTO_SKYHUB','COD_PRODUTO_SKYHUB = ' + DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO_SKYHUB.Text)
  else
    EDProdutoDerivado.Text := '';
end;

procedure TFProdutoSkyhub.Boaspraticasdecadastro1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'https://ajuda.skyhub.com.br/hc/pt-br/article_attachments/115012577426/b2w_moduloI_v4.pdf', nil, nil, 0);
end;

procedure TFProdutoSkyhub.Produtoderivado1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', 'https://ajuda.skyhub.com.br/hc/pt-br/articles/360000889863-Produtos-com-varia%C3%A7%C3%A3o-e-suas-particularidades', nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnTestarLink1Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_1.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnTestarLink2Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_2.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnTestarLink3Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_3.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnTestarLink4Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_4.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.SelecionaItemPorListbox(Level : Integer);
var
  CurItem : TTreeNode;
begin
  inherited;
  CurItem := TreeView1.Items.GetFirstNode;

  if Level >= 0 then
  begin
    if LbCategoria1.ItemIndex > -1 then
    begin
      while CurItem.Text <> LbCategoria1.Items[LbCategoria1.ItemIndex] do
      begin
        CurItem := CurItem.getNextSibling;
      end;
    end
    else
      Exit;
  end;

  if Level >= 1 then
  begin 
    CurItem := CurItem.GetNext;
    if LbCategoria2.ItemIndex > -1 then
    begin
      while CurItem.Text <> LbCategoria2.Items[LbCategoria2.ItemIndex] do
      begin
        CurItem := CurItem.getNextSibling;
      end;
    end
    else
      Exit;
  end;

  if Level >= 2 then
  begin
    CurItem := CurItem.GetNext;
    if LbCategoria3.ItemIndex > -1 then
    begin
      while CurItem.Text <> LbCategoria3.Items[LbCategoria3.ItemIndex] do
      begin
        CurItem := CurItem.getNextSibling;
      end;
    end
    else
      Exit;
  end;

  if Level >= 3 then
  begin
    CurItem := CurItem.GetNext;
    if LbCategoria4.ItemIndex > -1 then
    begin
      while CurItem.Text <> LbCategoria4.Items[LbCategoria4.ItemIndex] do
      begin
        CurItem := CurItem.getNextSibling;
      end;
    end
    else
      Exit;
  end;

  CurItem.Selected := True;
end; 

procedure TFProdutoSkyhub.DBPanel1CodigoChange(Sender: TObject);
var
  i : Integer;
  Categorias: TStringArray;
begin
  inherited;
  i := 0;
  Categorias := Bib.Split2(' > ', DMProdutoSkyhub.QProdutoSkyhubDESC_CATEGORIA.Text);

  for i := 0 to Length(Categorias)-1 do
  begin
    case i of
      0:
        begin
          LbCategoria1.ItemIndex := LbCategoria1.Items.IndexOf(Categorias[i]);
          if not (DSPrimario.State in [DsInsert, DsEdit]) then
            LbCategoria1Click(Sender);
        end;
      1:
        begin
          LbCategoria2.ItemIndex := LbCategoria2.Items.IndexOf(Categorias[i]);
          if not (DSPrimario.State in [dsInsert, dsEdit]) then
            LbCategoria2Click(Sender);
        end;
      2:
        begin
          LbCategoria3.ItemIndex := LbCategoria3.Items.IndexOf(Categorias[i]); 
          if not (DSPrimario.State in [dsInsert, dsEdit]) then
            LbCategoria3Click(Sender);
        end;
      3:
        begin
          LbCategoria4.ItemIndex := LbCategoria4.Items.IndexOf(Categorias[i]);
          if not (DSPrimario.State in [dsInsert, dsEdit]) then
            LbCategoria4Click(Sender);
        end;
      4:
        begin
          LbCategoria5.ItemIndex := LbCategoria5.Items.IndexOf(Categorias[i]);
        end;
    end;
  end;

  SelecionaCodigoCategoria();
end;

procedure TFProdutoSkyhub.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
var
  CurItem : TTreeNode;
begin
  inherited;
  CurItem := Node.getFirstChild;

  case TreeView1.Selected.Level of
    0:
    begin
      LbCategoria2.Items.Clear;
      LbCategoria3.Items.Clear;
      LbCategoria4.Items.Clear;
      LbCategoria5.Items.Clear;
    end;
    1:
    begin
      LbCategoria3.Items.Clear;
      LbCategoria4.Items.Clear;
      LbCategoria5.Items.Clear;
    end;
    2:
    begin
      LbCategoria4.Items.Clear;
      LbCategoria5.Items.Clear;
    end;
    3:
    begin
      LbCategoria5.Items.Clear;
    end;
  end;

  while CurItem <> nil do
  begin
    case TreeView1.Selected.Level of
      0:
      begin
        LbCategoria2.Items.Add(CurItem.Text);
      end;
      1:
      begin
        LbCategoria3.Items.Add(CurItem.Text);
      end;
      2:
      begin
        LbCategoria4.Items.Add(CurItem.Text);
      end;
      3:
      begin
        LbCategoria5.Items.Add(CurItem.Text);
      end;
    end;
    CurItem := CurItem.getNextSibling;
  end;
end;

procedure TFProdutoSkyhub.LbCategoria1Click(Sender: TObject);
begin
  inherited;
  SelecionaItemPorListbox(0);
end;

procedure TFProdutoSkyhub.LbCategoria2Click(Sender: TObject);
begin
  inherited;
  SelecionaItemPorListbox(1);
end;

procedure TFProdutoSkyhub.LbCategoria3Click(Sender: TObject);
begin
  inherited;
  SelecionaItemPorListbox(2);
end;

procedure TFProdutoSkyhub.CriaStringCategorias;
begin
  if DSPrimario.State in [DsInsert, DsEdit] then
  begin
    with DMProdutoSkyhub do
    begin
      QProdutoSkyhubDESC_CATEGORIA.Value := LbCategoria1.Items[LbCategoria1.ItemIndex];
      if LbCategoria2.ItemIndex > -1 then
        QProdutoSkyhubDESC_CATEGORIA.Value := QProdutoSkyhubDESC_CATEGORIA.Value + ' > ' +
                                              LbCategoria2.Items[LbCategoria2.ItemIndex];
      if LbCategoria3.ItemIndex > -1 then
        QProdutoSkyhubDESC_CATEGORIA.Value := QProdutoSkyhubDESC_CATEGORIA.Value + ' > ' +
                                              LbCategoria3.Items[LbCategoria3.ItemIndex];
      if LbCategoria4.ItemIndex > -1 then
        QProdutoSkyhubDESC_CATEGORIA.Value := QProdutoSkyhubDESC_CATEGORIA.Value + ' > ' +
                                              LbCategoria4.Items[LbCategoria4.ItemIndex];
      if LbCategoria5.ItemIndex > -1 then
        QProdutoSkyhubDESC_CATEGORIA.Value := QProdutoSkyhubDESC_CATEGORIA.Value + ' > ' +
                                              LbCategoria5.Items[LbCategoria5.ItemIndex];
    end;
  end;
end;

procedure TFProdutoSkyhub.BtnColaLink1Click(Sender: TObject);
begin
  inherited;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_1.Value := Clipboard.AsText;
end;

procedure TFProdutoSkyhub.BtnColaLink2Click(Sender: TObject);
begin
  inherited;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_2.Value := Clipboard.AsText;
end;

procedure TFProdutoSkyhub.BtnColaLink3Click(Sender: TObject);
begin
  inherited;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_3.Value := Clipboard.AsText;
end;

procedure TFProdutoSkyhub.BtnColaLink4Click(Sender: TObject);
begin
  inherited;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_4.Value := Clipboard.AsText;
end;

function TFProdutoSkyhub.URLEncode(s: string): string;
var
  wAux : string;
begin
  wAux := StringReplace(s,' ','+',[rfReplaceAll]);
  Result := wAux;
end;

procedure TFProdutoSkyhub.Conexodeprodutos1Click(Sender: TObject);
begin
  inherited;
  if FProdutoSkyhubParam = nil then
    FProdutoSkyhubParam := TFProdutoSkyhubParam.Create(Application);
  FProdutoSkyhubParam.PGRelatorio.Pages[1].TabVisible := true;

  if FProdutoSkyhubParam.Showmodal = mrOk then
  begin
    if FProdutoSkyhubParam.Rg1Status.ItemIndex = -1 then
      raise Exception.Create('Status inválido.');

    with DMProdutoSkyhub do
    begin
      QRConexaoProdutoSkyhub.Close;

      case FProdutoSkyhubParam.Rg1Status.ItemIndex of
        0: QRConexaoProdutoSkyhub.SetVariable('CONEXAO','1=1');
        1: QRConexaoProdutoSkyhub.SetVariable('CONEXAO','DESC_CONEXAO_SKYHUB='+ QuotedStr('linked') + ' OR DESC_CONEXAO_ML=' + QuotedStr('active'));
        2: QRConexaoProdutoSkyhub.SetVariable('CONEXAO','DESC_CONEXAO_SKYHUB='+ QuotedStr('declined') + ' OR DESC_CONEXAO_ML=' + QuotedStr('disabled'));
      end;

      QRConexaoProdutoSkyhub.Open;

      if FRConexaoProdutoSkyhub = nil then
        FRConexaoProdutoSkyhub := TFRConexaoProdutoSkyhub.Create(Application);

      FRConexaoProdutoSkyhub.QRLEmpresa.Caption := 'Empresa: ' + DMParamSistema.QParamSistemaDESC_EMPRESA.Text;
      FRConexaoProdutoSkyhub.QRLTitulo.Caption := 'Relatório de conexões de produto skyhub';

      case FProdutoSkyhubParam.Rg1Status.ItemIndex of
        0: FRConexaoProdutoSkyhub.QRLConexoes.Caption := 'Status: Todos';
        1: FRConexaoProdutoSkyhub.QRLConexoes.Caption := 'Status: Conectados';
        3: FRConexaoProdutoSkyhub.QRLConexoes.Caption := 'Status: Desconectado';
      end;

      if FProdutoSkyhubParam.RGPreview.ItemIndex = 0 then
        FRConexaoProdutoSkyhub.QRPrimario.Preview
      else
        FRConexaoProdutoSkyhub.QRPrimario.Print;
    end;
  end;
end;

procedure TFProdutoSkyhub.sbInfosProdutoClick(Sender: TObject);
begin
  inherited;
  if (Trim(DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text) <> '') and
     (DSPrimario.State in [DsInsert, DsEdit]) then
  begin
    with DMProduto do
    begin
      QProdutoParaProdutoSkyhub.Close;
      QProdutoParaProdutoSkyhub.SetVariable('COD_PRODUTO', DBEProduto.Text);
      QProdutoParaProdutoSkyhub.Open;
      if QProdutoParaProdutoSkyhub.RecordCount > 0 then
      begin
        DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Value := Ceil(QProdutoParaProdutoSkyhubCOD_PRODUTO.Value);
        DMProdutoSkyhub.QProdutoSkyhubDESC_PRODUTO.Value := AnsiLowerCase(QProdutoParaProdutoSkyhubDESC_PRODUTO.Value);
        DMProdutoSkyhub.QProdutoSkyhubDESC_INFORMACOES_ADICIONAIS.Value := AnsiLowerCase(QProdutoParaProdutoSkyhubDESC_OBSERVACAO.Value);
        DMProdutoSkyhub.QProdutoSkyhubDESC_MARCA.Value := AnsiLowerCase(QProdutoParaProdutoSkyhubDESC_MARCA.Value);
        DMProdutoSkyhub.QProdutoSkyhubVAL_PESO.Value := QProdutoParaProdutoSkyhubNUM_PESO_BRUTO.Value;
        DMProdutoSkyhub.QProdutoSkyhubVal_Altura.Text := QProdutoParaProdutoSkyhubVal_Altura.Text;
        DMProdutoSkyhub.QProdutoSkyhubVal_Largura.Text := QProdutoParaProdutoSkyhubVal_Largura.Text;
        DMProdutoSkyhub.QProdutoSkyhubVal_Comprimento.Text := QProdutoParaProdutoSkyhubVal_Comprimento.Text;
        DMProdutoSkyhub.QProdutoSkyhubESP_PESOLIQDAEMBALAGEMCPRODUTO.Text := QProdutoParaProdutoSkyhubNum_Peso_Bruto.Text;
        DMProdutoSkyhub.QProdutoSkyhubESP_PESOLIQDOPRODUTO.Text := QProdutoParaProdutoSkyhubNum_Peso_Liquido.Text;
        DMProdutoSkyhub.QProdutoSkyhubESP_FABRICANTE.Text := AnsiLowerCase(QProdutoParaProdutoSkyhubDESC_MARCA.Value);
        DMProdutoSkyhub.QProdutoSkyhubESP_DIMENSOESPRODUTO.Text := QProdutoParaProdutoSkyhubVal_Altura.Text + 'X' +
                                                                   QProdutoParaProdutoSkyhubVal_Largura.Text + 'X' +
                                                                   QProdutoParaProdutoSkyhubVal_Comprimento.Text;
      end;
    end;
  end;
end;

procedure TFProdutoSkyhub.SelecionaCodigoCategoria();
var
  i : Integer;
  Categorias : TStringArray;
begin
  if DMProdutoSkyhub.QProdutoSkyhubDESC_CATEGORIA.Value <> '' then
  begin
    for i := 0 to Length(IdCategorias)-1 do
    begin
      Categorias := Bib.Split2('###', Utf8ToAnsi(IdCategorias[i]));

      if Categorias[1] = DMProdutoSkyhub.QProdutoSkyhubDESC_CATEGORIA.Value then
      begin
        DMProdutoSkyhub.QProdutoSkyhubCOD_CATEGORIA_ML.Value := Categorias[0];
      end;
    end;
  end;
end;

procedure TFProdutoSkyhub.Adicionarafiladesincronizao1Click(
  Sender: TObject);
var
  wSql : String;
begin
  inherited;
  if DMProdutoSkyhub.QProdutoSkyhub.RecordCount > 0 then
  begin
    wSql := 'INSERT INTO TB_SINCRONIZACAO_SKYHUB ' +
            '(COD_SINCRONIZACAO_SKYHUB, TIPO_ACAO, COD_PRODUTO, DT_REGISTRO)' +
            ' VALUES (' +
            'SQSINCRONIZACAO_SKYHUB.NEXTVAL' + ',' +
            QuotedStr('PUT') + ',' +
            QuotedStr(DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text) + ',' +
            QuotedStr(DateToStr(Now)) +
            ')';
    DMOracle.ExecutaSql(wSql);
    MessageDlg('Adicionado!', mtConfirmation, [mbOK], 0);
  end;
end;

procedure TFProdutoSkyhub.Atualizarcategorias1Click(Sender: TObject); 
var
  MyFile: TFileStream;
  fileName : string;
begin
  inherited;
  if Dialogs.MessageDlg('O arquivo de categorias será atualizado, isto pode levar algum tempo. Deseja continuar?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    try
      FCarregando.ModoAmpliado;
      FCarregando.Show;
      FCarregando.Detalhe('Aguardando requisição...');

      if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
        raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.');

      LbCategoria1.Items.Clear;
      LbCategoria2.Items.Clear;
      LbCategoria3.Items.Clear;
      LbCategoria4.Items.Clear;
      LbCategoria5.Items.Clear;

      fileName := ExtractFilePath(Application.ExeName) + '\' + 'CategoriasSkyhub.txt';
      MyFile := TFileStream.Create(Trim(fileName), fmCreate);

      IdHTTP1.Request.ContentType := 'application/octet-stream';
      IdHTTP1.Get(URLEncode(Trim(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text) +
                          '/Api/SincronizarMLivre/DownloadArquivoCategorias'), MyFile);
      IdHTTP1.Disconnect;

      FCarregando.ModoCompacto;
      FCarregando.Progresso(50);
      FCarregando.Detalhe('Processando os dados...');

      MyFile.Free;
      CarregaCategorias;

      FCarregando.Progresso(100);

      SBRefreshClick(Sender);
      FCarregando.Close;
    except
      on E: EIdHTTPProtocolException do
      begin
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MyFile.Free;
        MessageDlg('Erro: ' + UTF8Decode(E.ErrorMessage), mtError, [mbOK], 0);
      end;
      on E: Exception do
      begin
        IdHTTP1.Disconnect;
        FCarregando.Close;
        MyFile.Free;
        MessageDlg('Erro ao conectar com o servidor: ' + E.Message, mtError, [mbOK], 0);
      end;
    end;
  end;
end;

procedure TFProdutoSkyhub.CarregaCategorias();
const
  MAX_LINHAS = 50000;
var
  i: integer;
  wRLine : String;
  CurItem: TTreeNode;
  RootNode, ChildNode1, ChildNode2, ChildNode3, ChildNode4 : TTreeNode;
  wFileCategorias : TextFile;
begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'CategoriasSkyhub.txt') then
  begin
    AssignFile(wFileCategorias, ExtractFilePath(Application.ExeName) + 'CategoriasSkyhub.txt');
    Reset(wFileCategorias);

    i := 0;
    ReadLn(wFileCategorias, wRLine);
    while not (wRLine = '#===#') do
    begin
      SetLength(DescricaoCategorias, i+1);
      DescricaoCategorias[i] := wRLine;
      ReadLn(wFileCategorias, wRLine);
      Inc(i);
      if i > MAX_LINHAS then
        Raise Exception.Create('O arquivo de categorias atingiu seu limite.');
    end;

    i := 0;
    ReadLn(wFileCategorias, wRLine);
    while not Eof(wFileCategorias) do
    begin
      SetLength(IdCategorias, i+1);
      IdCategorias[i] := wRLine;
      ReadLn(wFileCategorias, wRLine);
      Inc(i);
      if i > MAX_LINHAS then
        Raise Exception.Create('O arquivo de categorias atingiu seu limite.');
    end;

    CloseFile(wFileCategorias);

    TreeView1.Items.Clear;

    for i := 0 to Length(DescricaoCategorias) -1 do
    begin
      case Bib.OcorrenciasDeCaracter(DescricaoCategorias[i], '>') of
        2: RootNode := TreeView1.Items.Add(nil, Utf8ToAnsi(StringReplace(DescricaoCategorias[i],'>','',[rfReplaceAll])));
        4: ChildNode1 := TreeView1.Items.AddChild(RootNode, Utf8ToAnsi(StringReplace(DescricaoCategorias[i],'>','',[rfReplaceAll])));
        6: ChildNode2 := TreeView1.Items.AddChild(ChildNode1, Utf8ToAnsi(StringReplace(DescricaoCategorias[i],'>','',[rfReplaceAll])));
        8: ChildNode3 := TreeView1.Items.AddChild(ChildNode2, Utf8ToAnsi(StringReplace(DescricaoCategorias[i],'>','',[rfReplaceAll])));
        10: ChildNode4 := TreeView1.Items.AddChild(ChildNode3, Utf8ToAnsi(StringReplace(DescricaoCategorias[i],'>','',[rfReplaceAll])));
      end;
    end;

    TreeView1.Refresh;

    CurItem := TreeView1.Items.GetFirstNode;
    while CurItem <> nil do
    begin
      LbCategoria1.Items.Add(CurItem.Text);
      CurItem := CurItem.getNextSibling;
    end;
  end
  else
    MessageDlg('Arquivo de categorias não encontrado. Selecione o menu: Opções > Atualizar Categorias', mtWarning, [mbOK], 0);
end;

function TFProdutoSkyhub.AtualizaUrls(Loja: String): String;
var
  lResponse : TStringStream;
  wCodMpAux : string;
begin
  try
    lResponse := TStringStream.Create('');
    IdHTTP1.Request.ContentType := 'application/json';

    if Loja = 'MLivre' then
    begin
      wCodMpAux := URLEncode(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text +
                          '/Api/SincronizarMLivre/AtualizarURLs?' +
                          'codFilial=' + Trim(FProdutoSkyhubParam.FmFilial2.MeFilial.Text) +
                          '&codProduto=' + DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text);
    end
    else if Loja = 'Skyhub' then
    begin
      wCodMpAux := URLEncode(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text +
                          '/Api/SincronizarSkyhub/AtualizarURLs?' +
                          'codFilial=' + Trim(FProdutoSkyhubParam.FmFilial2.MeFilial.Text) +
                          '&codProduto=' + DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Text);
    end;

    IdHTTP1.Get(wCodMpAux, lResponse);
    IdHTTP1.Disconnect;

    lResponse.Position := 0;

    Result := '';
  except
    on E: EIdHTTPProtocolException do
    begin
      IdHTTP1.Disconnect;
      Result := UTF8Decode(E.ErrorMessage);
    end;
    on E: Exception do
    begin
      IdHTTP1.Disconnect;
      Result := E.Message;
    end;
  end;
end;

procedure TFProdutoSkyhub.BtnVisitar1Click(Sender: TObject);
begin
  inherited;
  if DMProdutoSkyhub.QProdutoSkyhubUrlURL_AMERICANAS.Text <> '' then
    ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubUrlURL_AMERICANAS.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnVisitar2Click(Sender: TObject);
begin
  inherited;
  if DMProdutoSkyhub.QProdutoSkyhubUrlURL_SUBMARINO.Text <> '' then
    ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubUrlURL_SUBMARINO.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnVisitar3Click(Sender: TObject);
begin
  inherited;
  if DMProdutoSkyhub.QProdutoSkyhubUrlURL_SHOPTIME.Text <> '' then
  ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubUrlURL_SHOPTIME.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.BtnVisitar4Click(Sender: TObject);
begin
  inherited; 
  if DMProdutoSkyhub.QProdutoSkyhubUrlURL_MLIVRE.Text <> '' then
  ShellExecute(Application.Handle, 'open', PAnsiChar(DMProdutoSkyhub.QProdutoSkyhubUrlURL_MLIVRE.Text), nil, nil, 0);
end;

procedure TFProdutoSkyhub.SBConfirmarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if DSPrimario.State in [DsInsert, DsEdit] then
  begin
    if DMProdutoSkyhub.QProdutoSkyhubCOD_PRODUTO.Value = 0 then
    begin
      PageControl1.ActivePage := TabSheet1;
      DBEProduto.SetFocus;
      raise Exception.Create('Selecione o produto do sistema que corresponde a este produto marketplace.');
    end;

    if (Length(DBETitulo.Text) < 10) or
       (Length(DBETitulo.Text) > 100)then
    begin
      PageControl1.ActivePage := TabSheet1;
      DBETitulo.SetFocus;
      raise Exception.Create('O título do produto deve ter entre 10 e 100 carácteres.');
    end;

    if (Length(DBEMarca.Text) < 2) or
       (Length(DBEMarca.Text) > 20)then
    begin
      PageControl1.ActivePage := TabSheet1;
      DBEMarca.SetFocus;
      raise Exception.Create('A marca do produto deve ter entre 2 e 20 carácteres.');
    end;

    if (Length(DBMDescricao.Text) < 10) then
    begin
      PageControl1.ActivePage := TabSheet1;
      DBMDescricao.SetFocus;
      raise Exception.Create('A descrição do produto deve conter no mínimo 10 carácteres.');
    end;

    if (DBEAltura.Text = '') or
       (DBELargura.Text = '') or
       (DBComprimento.Text = '') or
       (DBEPeso.Text = '') then
    begin
      PageControl1.ActivePage := TabSheet1;
      DBEAltura.SetFocus;
      raise Exception.Create('Preencha corretamente as dimensões da embalagem.');
    end;

    with DMProdutoSkyhub do
    begin
      if (QProdutoSkyhubDESC_LINK_IMAGEM_1.Value = '') and
         (QProdutoSkyhubDESC_LINK_IMAGEM_2.Value = '') and
         (QProdutoSkyhubDESC_LINK_IMAGEM_3.Value = '') and
         (QProdutoSkyhubDESC_LINK_IMAGEM_4.Value = '') and
         (QProdutoSkyhubIMAGEM_1.BlobSize = 0) and
         (QProdutoSkyhubIMAGEM_2.BlobSize = 0) and
         (QProdutoSkyhubIMAGEM_3.BlobSize = 0) and
         (QProdutoSkyhubIMAGEM_4.BlobSize = 0) then
      begin
        PageControl1.ActivePage := TSImagens;
        raise Exception.Create('Preencha ao menos uma imagem do seu produto.');
      end;
    end;

    if (LbCategoria1.ItemIndex = -1) or
       (LbCategoria2.ItemIndex = -1) then
    begin
      PageControl1.ActivePage := TabSheet3;
      raise Exception.Create('Você precisa selecionar a categoria que melhor se adéque com seu produto.');
    end;
    
    CriaStringCategorias;
  end;
end;

procedure TFProdutoSkyhub.FormResize(Sender: TObject);
var
  proporcao : Double;
  espacamento : Integer;
begin
  inherited; 
  proporcao := 0.245;
  espacamento := 10;
  
  PNImagem1.Width := Round(GroupBox3.Width*proporcao)-espacamento*2;
  PNImagem2.Width := Round(GroupBox3.Width*proporcao)-espacamento*2;
  PNImagem3.Width := Round(GroupBox3.Width*proporcao)-espacamento*2;
  PNImagem4.Width := Round(GroupBox3.Width*proporcao)-espacamento*2;

  PNImagem1.Left := espacamento*2;
  PNImagem2.Left := PNImagem1.Width+PNImagem1.Left+espacamento*2;
  PNImagem3.Left := PNImagem2.Width+PNImagem2.Left+espacamento*2;
  PNImagem4.Left := PNImagem3.Width+PNImagem3.Left+espacamento*2;

  proporcao := 0.194;
  espacamento := 6;
  
  LbCategoria1.Width := Round(GroupBox4.Width*proporcao)-espacamento*2;
  LbCategoria2.Width := Round(GroupBox4.Width*proporcao)-espacamento*2;
  LbCategoria3.Width := Round(GroupBox4.Width*proporcao)-espacamento*2;
  LbCategoria4.Width := Round(GroupBox4.Width*proporcao)-espacamento*2;
  LbCategoria5.Width := Round(GroupBox4.Width*proporcao)-espacamento*2;

  LbCategoria1.Left := espacamento*4;
  LbCategoria2.Left := LbCategoria1.Width+LbCategoria1.Left+espacamento*2;
  LbCategoria3.Left := LbCategoria2.Width+LbCategoria2.Left+espacamento*2;
  LbCategoria4.Left := LbCategoria3.Width+LbCategoria3.Left+espacamento*2;
  LbCategoria5.Left := LbCategoria4.Width+LbCategoria4.Left+espacamento*2;
  
  proporcao := 0.245;
  espacamento := 5;

  DBEEspAlimentacao.Width := Round(GroupBox5.Width*proporcao)-espacamento*4;
  DBEEspAparelhosCompativeis.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspConteudoDaEmbalagem.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspCor.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;

  DBEEspDataDeLancamentoNoMercado.Width := Round(GroupBox5.Width*proporcao)-espacamento*4;
  DBEEspDimensoesProduto.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspFabricante.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspGarantiaDoFornecedor.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;

  DBEEspMaisInformacoes.Width := Round(GroupBox5.Width*proporcao)-espacamento*4;
  DBEEspManual.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspMaterialComposicao.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspModelo.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;

  DBEEspPesoLiqEmbalagem.Width := Round(GroupBox5.Width*proporcao)-espacamento*4;
  DBEEspPesoLiqProduto.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspRecursosFuncionalidades.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspReferenciaDoModelo.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;

  DBEEspSAC.Width := Round(GroupBox5.Width*proporcao)-espacamento*4;
  DBEEspTamanho.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBEEspVideo.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;
  DBCEspVoltagem.Width := Round(GroupBox5.Width*proporcao)-espacamento*2;

  DBEEspAlimentacao.Left := espacamento*4;
  DBEEspAparelhosCompativeis.Left := DBEEspAlimentacao.Width+DBEEspAlimentacao.Left+espacamento*2;
  DBEEspConteudoDaEmbalagem.Left := DBEEspAparelhosCompativeis.Width+DBEEspAparelhosCompativeis.Left+espacamento*2;
  DBEEspCor.Left := DBEEspConteudoDaEmbalagem.Width+DBEEspConteudoDaEmbalagem.Left+espacamento*2;

  DBEEspDataDeLancamentoNoMercado.Left := espacamento*4;
  DBEEspDimensoesProduto.Left := DBEEspMaisInformacoes.Width+DBEEspMaisInformacoes.Left+espacamento*2;
  DBEEspFabricante.Left := DBEEspDimensoesProduto.Width+DBEEspDimensoesProduto.Left+espacamento*2;
  DBEEspGarantiaDoFornecedor.Left := DBEEspFabricante.Width+DBEEspFabricante.Left+espacamento*2;

  DBEEspMaisInformacoes.Left := espacamento*4;
  DBEEspManual.Left := DBEEspMaisInformacoes.Width+DBEEspMaisInformacoes.Left+espacamento*2;
  LbEspManual.Left := DBEEspMaisInformacoes.Width+DBEEspMaisInformacoes.Left+espacamento*2;
  DBEEspMaterialComposicao.Left := DBEEspManual.Width+DBEEspManual.Left+espacamento*2;
  DBEEspModelo.Left := DBEEspMaterialComposicao.Width+DBEEspMaterialComposicao.Left+espacamento*2;

  DBEEspPesoLiqEmbalagem.Left := espacamento*4;
  DBEEspPesoLiqProduto.Left := DBEEspPesoLiqEmbalagem.Width+DBEEspPesoLiqEmbalagem.Left+espacamento*2;
  DBEEspRecursosFuncionalidades.Left := DBEEspPesoLiqProduto.Width+DBEEspPesoLiqProduto.Left+espacamento*2;
  DBEEspReferenciaDoModelo.Left := DBEEspRecursosFuncionalidades.Width+DBEEspRecursosFuncionalidades.Left+espacamento*2;

  DBEEspSAC.Left := espacamento*4;
  DBEEspTamanho.Left := DBEEspSAC.Width+DBEEspSAC.Left+espacamento*2;
  DBEEspVideo.Left := DBEEspTamanho.Width+DBEEspTamanho.Left+espacamento*2;
  DBCEspVoltagem.Left := DBEEspVideo.Width+DBEEspVideo.Left+espacamento*2;
  LbEspVoltagem.Left := DBEEspVideo.Width+DBEEspVideo.Left+espacamento*2;
end;

procedure TFProdutoSkyhub.BtnImagem1Click(Sender: TObject);
begin
  inherited;
  CarregaImagemSelecionada(IMImagem1, DMProdutoSkyhub.QProdutoSkyhubIMAGEM_1);
end;

procedure TFProdutoSkyhub.BtnImagem2Click(Sender: TObject);
begin
  inherited;
  CarregaImagemSelecionada(IMImagem2, DMProdutoSkyhub.QProdutoSkyhubIMAGEM_2);
end;

procedure TFProdutoSkyhub.BtnImagem3Click(Sender: TObject);
begin
  inherited;
  CarregaImagemSelecionada(IMImagem3, DMProdutoSkyhub.QProdutoSkyhubIMAGEM_3);
end;

procedure TFProdutoSkyhub.BtnImagem4Click(Sender: TObject);
begin
  inherited;
  CarregaImagemSelecionada(IMImagem4, DMProdutoSkyhub.QProdutoSkyhubIMAGEM_4);
end;

procedure TFProdutoSkyhub.CarregaImagemSelecionada(IMImagem : TImage; Blob : TBlobField);
var
  wJpeg: TJPEGImage;
  wStream : TMemoryStream;
begin
  if FCarregaImagem = nil then
    FCarregaImagem := TFCarregaImagem.Create(Application);

  if DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text = '' then
    raise Exception.Create('Endereço de host não configurado em parâmetros do sistema.');

  FCarregaImagem.LinkIntermediario := Trim(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text) +
                                      '/Api/Variados/LinkParaJpeg?linkImagem=';
  FCarregaImagem.CBItem.ItemIndex := 0;
  FCarregaImagem.IMImagem.Picture := nil;
  FCarregaImagem.BtnOk.Enabled := False;
  FCarregaImagem.ShowModal;
  
  if FCarregaImagem.ModalResult = mrOk then
  begin
    if FCarregaImagem.CBItem.ItemIndex in [1,2,3] then
    begin
      IMImagem.Picture := FCarregaImagem.IMImagem.Picture;
      wStream := TMemoryStream.Create;
      wJpeg := TJPEGImage.Create;
      wJpeg.Assign(IMImagem.Picture);

      wJpeg.SaveToStream(wStream);
      Blob.LoadFromStream(wStream);

      wJpeg.Free;
      wStream.Destroy;
    end;
  end;
end;

procedure TFProdutoSkyhub.MenuItem1Click(Sender: TObject);
begin
  inherited;
  IMImagem1.Picture := nil;
  DMProdutoSkyhub.QProdutoSkyhubIMAGEM_1.Clear;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_1.Clear;
  PNImagemFundo1.Caption := 'Sem imagem';
end;

procedure TFProdutoSkyhub.MenuItem2Click(Sender: TObject);
begin
  inherited;
  IMImagem2.Picture := nil;
  DMProdutoSkyhub.QProdutoSkyhubIMAGEM_2.Clear;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_2.Clear;  
  PNImagemFundo2.Caption := 'Sem imagem';
end;

procedure TFProdutoSkyhub.MenuItem3Click(Sender: TObject);
begin
  inherited;
  IMImagem3.Picture := nil;
  DMProdutoSkyhub.QProdutoSkyhubIMAGEM_3.Clear;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_3.Clear; 
  PNImagemFundo3.Caption := 'Sem imagem';
end;

procedure TFProdutoSkyhub.MenuItem4Click(Sender: TObject);
begin
  inherited;
  IMImagem4.Picture := nil;
  DMProdutoSkyhub.QProdutoSkyhubIMAGEM_4.Clear;
  DMProdutoSkyhub.QProdutoSkyhubDESC_LINK_IMAGEM_4.Clear;  
  PNImagemFundo4.Caption := 'Sem imagem';
end;

procedure TFProdutoSkyhub.TentaCarregarUmaImagem(Blob: TBlobField; Link: string ; Destino: TImage);
begin
  if Blob.BlobSize > 0 then
    BlobParaImagem(Blob, Destino)
  else if Link <> '' then
  begin
    if FCarregaImagem = nil then
      FCarregaImagem := TFCarregaImagem.Create(Application);

    FCarregaImagem.LinkIntermediario := Trim(DMParamSistema.QParamSistemaDESC_HOST_SERVER_API.Text) +
                                            '/Api/Variados/LinkParaJpeg?linkImagem=';
    try
      FCarregaImagem.GetImageByUrl(Link, Destino.Picture);
    except end;
  end
  else
    Destino.Picture := nil;
end;

procedure TFProdutoSkyhub.LbCategoria4Click(Sender: TObject);
begin
  inherited;
  SelecionaItemPorListbox(3);
end;


procedure TFProdutoSkyhub.PageControl1Change(Sender: TObject);
begin
  inherited;
  with DMProdutoSkyhub do
  begin
    if PageControl1.ActivePage = TSImagens then
    begin
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_1, QProdutoSkyhubDESC_LINK_IMAGEM_1.Value, IMImagem1);
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_2, QProdutoSkyhubDESC_LINK_IMAGEM_2.Value, IMImagem2);
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_3, QProdutoSkyhubDESC_LINK_IMAGEM_3.Value, IMImagem3);
      TentaCarregarUmaImagem(QProdutoSkyhubIMAGEM_4, QProdutoSkyhubDESC_LINK_IMAGEM_4.Value, IMImagem4);

      AtualizaImagem(IMImagem1, PNImagemFundo1, QProdutoSkyhubDESC_LINK_IMAGEM_1.Value);
      AtualizaImagem(IMImagem2, PNImagemFundo2, QProdutoSkyhubDESC_LINK_IMAGEM_2.Value);
      AtualizaImagem(IMImagem3, PNImagemFundo3, QProdutoSkyhubDESC_LINK_IMAGEM_3.Value);
      AtualizaImagem(IMImagem4, PNImagemFundo4, QProdutoSkyhubDESC_LINK_IMAGEM_4.Value);
    end;
  end;
end;

procedure TFProdutoSkyhub.Sincronizaes1Click(Sender: TObject);
begin
  inherited;
  if FProdutoSkyhubParam = nil then
    FProdutoSkyhubParam := TFProdutoSkyhubParam.Create(Application);
  FProdutoSkyhubParam.PGRelatorio.Pages[3].TabVisible := true;

  if FProdutoSkyhubParam.Showmodal = mrOk then
  begin
    if ((Trim(FProdutoSkyhubParam.Me3DtInicial.Text) = '') or (Trim(FProdutoSkyhubParam.Me3DtFinal.Text) = '')) then
      raise Exception.Create('É necessário informar o período.');

    with DMProdutoSkyhub do
    begin
      QRSincronizacoes.Close;

      if Trim(FProdutoSkyhubParam.ME3CodProduto.Text) <> '' then
        QRSincronizacoes.SetVariable('COD_PRODUTO_SKYHUB', StrToInt(Trim(FProdutoSkyhubParam.ME3CodProduto.Text)))
      else
        QRSincronizacoes.SetVariable('COD_PRODUTO_SKYHUB', Null);

      QRSincronizacoes.SetVariable('DT_INICIO', StrToDate(Trim(FProdutoSkyhubParam.Me3DtInicial.Text)));
      QRSincronizacoes.SetVariable('DT_FIM', StrToDate(Trim(FProdutoSkyhubParam.Me3DtFinal.Text)));

      QRSincronizacoes.Open;

      if QRSincronizacoes.RecordCount > 0 then
      begin
        if FRSincronizacaoSkyhub = nil then
          FRSincronizacaoSkyhub := TFRSincronizacaoSkyhub.Create(Application);

        FRSincronizacaoSkyhub.QRLEmpresa.Caption := 'Empresa: ' + DMParamSistema.QParamSistemaDESC_EMPRESA.Text;
        FRSincronizacaoSkyhub.QRLTitulo.Caption := 'Relatório de sincronizações de produtos em Marketplaces';
        FRSincronizacaoSkyhub.QRLProduto.Caption := 'Produto: ' + FProdutoSkyhubParam.ED3Produto.Text;

        if FProdutoSkyhubParam.RGPreview.ItemIndex = 0 then
          FRSincronizacaoSkyhub.QRPrimario.Preview
        else
          FRSincronizacaoSkyhub.QRPrimario.Print;
      end
      else
        ShowMessage('Não foram encontrados registros para o relatório.');
    end;
  end;
end;

procedure TFProdutoSkyhub.AtualizaImagem(Imagem: TImage; Painel : TPanel; Valor : string);
begin
  if Valor = '' then
    Painel.Caption := 'Sem imagem'
  else if Assigned(Imagem.Picture) then
    Painel.Caption := ''
  else
    Painel.Caption := Valor;
end;

end.
