unit UCatalogo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, Mask, DB;

type
  TFCatalogo = class(TForm)
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    DBGProdutos: TDBGrid;
    DBGSelecao: TDBGrid;
    btnLimpar: TBitBtn;
    btnAdicionar: TBitBtn;
    btnAdicionarTodos: TBitBtn;
    btnLimparTodos: TBitBtn;
    LblCodigo: TLabel;
    MeCodigo: TMaskEdit;
    Label1: TLabel;
    MEDescricao: TMaskEdit;
    MeNCM: TMaskEdit;
    Label2: TLabel;
    LblClasse: TLabel;
    MENrClasse: TMaskEdit;
    MEnrSubClasse: TMaskEdit;
    LblSubClasse: TLabel;
    SBClasse: TSpeedButton;
    BtProcurar: TBitBtn;
    LblTipo: TLabel;
    DSProduto: TDataSource;
    MEMarca: TMaskEdit;
    SBMarca: TSpeedButton;
    DSCatalgoProduto: TDataSource;
    GroupBox1: TGroupBox;
    CBMostrarPreco: TCheckBox;
    Label3: TLabel;
    SBLote: TSpeedButton;
    MELote: TMaskEdit;
    RGPreco: TRadioGroup;
    RGOrdem: TRadioGroup;
    procedure BtProcurarClick(Sender: TObject);
    procedure MEDescricaoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGProdutosDblClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnLimparTodosClick(Sender: TObject);
    procedure btnAdicionarTodosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGSelecaoDblClick(Sender: TObject);
    procedure SBClasseClick(Sender: TObject);
    procedure SBMarcaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBLoteClick(Sender: TObject);
    procedure RGOrdemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCatalogo: TFCatalogo;

implementation

  uses UOracle_cl, UParamSistema_cl, UBiblioteca, UProduto_cl, UProdutoCons, UClasse_cl, UMarca_cl, UMarcaCons, UClasseCons, URCatalogo,
  UTipoLoteCons, UTipoLote_cl;

{$R *.dfm}

procedure TFCatalogo.BtProcurarClick(Sender: TObject);
begin
  with DMProduto do
  begin
    QCatalogoProdutoCons .Close;
    if MeCodigo.Text <> '' then
      QCatalogoProdutoCons.setVariable('COD_PRODUTO',StrToInt(MeCodigo.Text))
    else
      QCatalogoProdutoCons.setVariable('COD_PRODUTO',NULL);
    if MeDescricao.Text <> '' then
      QCatalogoProdutoCons.setVariable('DESCRICAO',MEDescricao.Text+'%')
    else
      QCatalogoProdutoCons.setVariable('DESCRICAO',NULL);
    if MeNCM.Text <> '' then
      QCatalogoProdutoCons.setVariable('NCM',StrToInt(MeNCM.Text))
    else
      QCatalogoProdutoCons.setVariable('NCM',NULL);
    if MENrClasse.Text <> '' then
      QCatalogoProdutoCons.setVariable('CLASSE',StrToInt(MENrClasse.Text))
    else
      QCatalogoProdutoCons.setVariable('CLASSE',NULL);
    if MEnrSubClasse.Text <> '' then
      QCatalogoProdutoCons.setVariable('SUB_CLASSE',StrToInt(MEnrSubClasse.Text))
    else
      QCatalogoProdutoCons.setVariable('SUB_CLASSE',NULL);
    if MEMarca.Text <> '' then
      QCatalogoProdutoCons.setVariable('MARCA',StrToInt(MEMarca.Text))
    else
      QCatalogoProdutoCons.setVariable('MARCA',NULL);
    if MELote.Text <> '' then
      QCatalogoProdutoCons.setVariable('COD_LOTE_TIPO',StrToInt(MELote.Text))
    else
      QCatalogoProdutoCons.setVariable('COD_LOTE_TIPO',NULL);

    if RGPreco.ItemIndex = 0 then
    begin
      DBGProdutos.Columns[2].Visible := false;
      QCatalogoProdutoCons.setVariable('TIPO_PRECO','PRODUTO');
    end
    else
    begin
      DBGProdutos.Columns[2].Visible := true;
      QCatalogoProdutoCons.setVariable('TIPO_PRECO','LOTE');
    end;
    QCatalogoProdutoCons.Open;
  end;
end;

procedure TFCatalogo.MEDescricaoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    BtProcurarClick(Sender);
end;

procedure TFCatalogo.DBGProdutosDblClick(Sender: TObject);
begin
  btnAdicionarClick(Sender);
end;

procedure TFCatalogo.btnAdicionarClick(Sender: TObject);
var
  wCodFound : Boolean;
begin
  wCodFound := False;

  with DMProduto do
  begin
    CDSCatalogoProduto.Open;
    CDSCatalogoProduto.First;
    while not CDSCatalogoProduto.Eof do
    begin
      if CDSCatalogoProdutoCOD_PRODUTO.Text = QCatalogoProdutoConsCOD_PRODUTO.Text then
        wCodFound := True;
      CDSCatalogoProduto.Next;
    end;

    if not wCodFound then
    begin
      CDSCatalogoProduto.Open;
      CDSCatalogoProduto.First;
      CDSCatalogoProduto.Insert;
      CDSCatalogoProdutoCOD_PRODUTO.Text := QCatalogoProdutoConsCOD_PRODUTO.Text;
      CDSCatalogoProdutoDESCRICAO.Text := QCatalogoProdutoConsDESC_PRODUTO.Text;
      CDSCatalogoProdutoMARCA.Text := QCatalogoProdutoConsCOD_MARCA.Text;
      CDSCatalogoProdutoPRECO.Value := QCatalogoProdutoConsVAL_VAREJO.Value;
      CDSCatalogoProdutoIMAGEM.Value := QCatalogoProdutoConsIMG_IMAGEM.Value;
      CDSCatalogoProdutoCOMPLEMENTO.Text := QCatalogoProdutoConsDESC_COMPLEMENTO.Text;
      CDSCatalogoProdutoNUM_FABRICANTE.Text := QCatalogoProdutoConsNUM_FABRICANTE.Text;
      CDSCatalogoProduto.Post;
    end;
  end;
end;

procedure TFCatalogo.btnLimparClick(Sender: TObject);
begin
  with DMProduto do
  begin
    if not CDSCatalogoProduto.EoF then
    begin
      CDSCatalogoProduto.Open;
      CDSCatalogoProduto.Delete;
    end;
      CDSCatalogoProduto.Open;
  end;
end;

procedure TFCatalogo.btnLimparTodosClick(Sender: TObject);
begin
  with DMProduto do
  begin
    if not CDSCatalogoProduto.EoF then
    begin
      CDSCatalogoProduto.Open;
      CDSCatalogoProduto.First;
      while not CDSCatalogoProduto.Eof do
      begin
        CDSCatalogoProduto.Delete;
      end;
      CDSCatalogoProduto.Close;
    end;
  end;
end;

procedure TFCatalogo.btnAdicionarTodosClick(Sender: TObject);
begin
  btnLimparTodosClick(Sender);

  with DMProduto do
  begin
    QCatalogoProdutoCons.First;
    while not QCatalogoProdutoCons.Eof do
    begin
      CDSCatalogoProduto.Open;
      CDSCatalogoProduto.Insert;
      CDSCatalogoProdutoCOD_PRODUTO.Text := QCatalogoProdutoConsCOD_PRODUTO.Text;
      CDSCatalogoProdutoDESCRICAO.Text := QCatalogoProdutoConsDESC_PRODUTO.Text;
      CDSCatalogoProdutoMARCA.Text := QCatalogoProdutoConsCOD_MARCA.Text;
      CDSCatalogoProdutoPRECO.Value := QCatalogoProdutoConsVAL_VAREJO.Value;
      CDSCatalogoProdutoIMAGEM.Value := QCatalogoProdutoConsIMG_IMAGEM.Value;
      CDSCatalogoProdutoCOMPLEMENTO.Text := QCatalogoProdutoConsDESC_COMPLEMENTO.Text;
      CDSCatalogoProdutoNUM_FABRICANTE.Text := QCatalogoProdutoConsNUM_FABRICANTE.Text;
      CDSCatalogoProduto.Post;
      QCatalogoProdutoCons.Next;
    end;
  end;
end;

procedure TFCatalogo.FormShow(Sender: TObject);
begin
  MEDescricao.SetFocus;
end;

procedure TFCatalogo.DBGSelecaoDblClick(Sender: TObject);
begin
  btnLimparClick(Sender);
end;

procedure TFCatalogo.SBClasseClick(Sender: TObject);
begin
  if FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  if FClasseCons.ShowModal = MrOk then
  begin
    with DMClasse do
    begin
      MENrClasse.Text := QClasseConsNUM_CLASSE.Text;
      MENrSubClasse.Text := QClasseConsNUM_SUBCLASSE.Text;
    end;
  end;
end;

procedure TFCatalogo.SBMarcaClick(Sender: TObject);
begin
  if FMarca_Cons = Nil then
    FMarca_Cons := TFMarca_Cons.Create(Application);
  if FMarca_Cons.ShowModal = MrOk then
  begin
    with DMMarca do
    begin
      MEMarca.Text := QMarcaConsCOD_MARCA.Text;
    end;
  end;
end;

procedure TFCatalogo.BitBtn1Click(Sender: TObject);
begin
  with DMProduto do
  begin
    CDSCatalogoProduto.Open;
    CDSCatalogoProduto.First;
    CDSRCatalogoProduto.EmptyDataSet;
    while not CDSCatalogoProduto.Eof do
    begin
      if not CDSCatalogoProduto.Eof then
      begin
        CDSRCatalogoProduto.Append;
        CDSRCatalogoProdutoCOD_PRODUTO_1.Text := CDSCatalogoProdutoCOD_PRODUTO.Text;
        CDSRCatalogoProdutoPRECO_1.Value := CDSCatalogoProdutoPRECO.Value;
        CDSRCatalogoProdutoIMAGEM_1.Value := CDSCatalogoProdutoIMAGEM.Value;
        CDSRCatalogoProdutoDESCRICAO_1.Text := CDSCatalogoProdutoDESCRICAO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_1.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSRCatalogoProdutoDESC_OBS_1.Text := CDSCatalogoProdutoCOMPLEMENTO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_1.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSCatalogoProduto.Next;
      end;
      if not CDSCatalogoProduto.Eof then
      begin
        CDSRCatalogoProdutoCOD_PRODUTO_2.Text := CDSCatalogoProdutoCOD_PRODUTO.Text;
        CDSRCatalogoProdutoPRECO_2.Value := CDSCatalogoProdutoPRECO.Value;
        CDSRCatalogoProdutoIMAGEM_2.Value := CDSCatalogoProdutoIMAGEM.Value;
        CDSRCatalogoProdutoDESCRICAO_2.Text := CDSCatalogoProdutoDESCRICAO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_2.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSRCatalogoProdutoDESC_OBS_2.Text := CDSCatalogoProdutoCOMPLEMENTO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_2.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSCatalogoProduto.Next;
      end;
      if not CDSCatalogoProduto.Eof then
      begin
        CDSRCatalogoProdutoCOD_PRODUTO_3.Text := CDSCatalogoProdutoCOD_PRODUTO.Text;
        CDSRCatalogoProdutoPRECO_3.Value := CDSCatalogoProdutoPRECO.Value;
        CDSRCatalogoProdutoIMAGEM_3.Value := CDSCatalogoProdutoIMAGEM.Value;
        CDSRCatalogoProdutoDESCRICAO_3.Text := CDSCatalogoProdutoDESCRICAO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_3.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSRCatalogoProdutoDESC_OBS_3.Text := CDSCatalogoProdutoCOMPLEMENTO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_3.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSCatalogoProduto.Next;
      end;
      if not CDSCatalogoProduto.Eof then
      begin
        CDSRCatalogoProdutoCOD_PRODUTO_4.Text := CDSCatalogoProdutoCOD_PRODUTO.Text;
        CDSRCatalogoProdutoPRECO_4.Value := CDSCatalogoProdutoPRECO.Value;
        CDSRCatalogoProdutoIMAGEM_4.Value := CDSCatalogoProdutoIMAGEM.Value;
        CDSRCatalogoProdutoDESCRICAO_4.Text := CDSCatalogoProdutoDESCRICAO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_4.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSRCatalogoProdutoDESC_OBS_4.Text := CDSCatalogoProdutoCOMPLEMENTO.Text;
        CDSRCatalogoProdutoNUM_FABRICANTE_4.Text := CDSCatalogoProdutoNUM_FABRICANTE.Text;
        CDSCatalogoProduto.Next;
      end;
    end;

    CDSCatalogoProduto.First;
  end;

  if FRCatalogo = nil then
    FRCatalogo := TFRCatalogo.Create(Application);
  FRCatalogo.MostraPreco := CBMostrarPreco.Checked;
  FRCatalogo.QRPrimario.Preview;
  DMProduto.CDSRCatalogoProduto.EmptyDataSet;
  FRCatalogo.Free;
  FRcatalogo := nil;
end;

procedure TFCatalogo.SBLoteClick(Sender: TObject);
begin
  if FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = MrOk then
  begin
    with DMTipoLote do
    begin
      MELote.Text := QTipoLoteConsCOD_LOTE_TIPO.Text;
    end;
  end;
end;

procedure TFCatalogo.RGOrdemClick(Sender: TObject);
begin
  with DMProduto do
  begin
    CDSCatalogoProduto.Close;
    if RGOrdem.ItemIndex = 0 then
      CDSCatalogoProduto.IndexFieldNames:='COD_PRODUTO'
    else
      CDSCatalogoProduto.IndexFieldNames:='DESCRICAO';
    CDSCatalogoProduto.Open;
  end;
end;

end.
