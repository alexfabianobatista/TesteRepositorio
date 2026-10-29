unit UMenuEstoque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuEstoque = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Classe1: TMenuItem;
    Tributao1: TMenuItem;
    Produtos1: TMenuItem;
    TripodeLote1: TMenuItem;
    Preos1: TMenuItem;
    ImplantaodeEstoque1: TMenuItem;
    ConsultaAvanadadeEstoque1: TMenuItem;
    AtualizaodeEstoquePNotas1: TMenuItem;
    PosiodeCompraseVendas1: TMenuItem;
    N1: TMenuItem;
    Saidaprodutosporpedido1: TMenuItem;
    Produtosporfornecedor1: TMenuItem;
    CadastroComissoPorClasse1: TMenuItem;
    CadastroOrigemProduo1: TMenuItem;
    CadastrodeProduo1: TMenuItem;
    CadastrodePreoPocket1: TMenuItem;
    CadastrodeMarca1: TMenuItem;
    Parametrosppreodevenda1: TMenuItem;
    CadastroPreosPauta1: TMenuItem;
    CadastroInventrioMensal1: TMenuItem;
    ListadeServio1: TMenuItem;
    GneroProduto1: TMenuItem;
    CadastroPesagemProduo1: TMenuItem;
    CadastrodeGrupodeProduto1: TMenuItem;
    CadastroSubstituioTributriaporProdutos1: TMenuItem;
    CadastroPreoPorLote1: TMenuItem;
    PreoPrazoVendedor1: TMenuItem;
    CadastrodeNcm1: TMenuItem;
    CadastrodeNcmsemSimilarNacionalResoluoCAMEX1: TMenuItem;
    CadastrodeTabeladePreo1: TMenuItem;
    ProdutoSkyhub1: TMenuItem;
    CadastroCdigoANP1: TMenuItem;
    CadastroCdigoNBS1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Classe1Click(Sender: TObject);
    procedure Tributao1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure TripodeLote1Click(Sender: TObject);
    procedure Preos1Click(Sender: TObject);
    procedure ImplantaodeEstoque1Click(Sender: TObject);
    procedure ConsultaAvanadadeEstoque1Click(Sender: TObject);
    procedure AtualizaodeEstoquePNotas1Click(Sender: TObject);
    procedure PosiodeCompraseVendas1Click(Sender: TObject);
    procedure Saidaprodutosporpedido1Click(Sender: TObject);
    procedure Produtosporfornecedor1Click(Sender: TObject);
    procedure CadastroComissoPorClasse1Click(Sender: TObject);
    procedure CadastroOrigemProduo1Click(Sender: TObject);
    procedure CadastrodeProduo1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CadastrodePreoPocket1Click(Sender: TObject);
    procedure CadastrodeMarca1Click(Sender: TObject);
    procedure Parametrosppreodevenda1Click(Sender: TObject);
    procedure CadastroPreosPauta1Click(Sender: TObject);
    procedure CadastroInventrioMensal1Click(Sender: TObject);
    procedure ListadeServio1Click(Sender: TObject);
    procedure GneroProduto1Click(Sender: TObject);
    procedure CadastroPesagemProduo1Click(Sender: TObject);
    procedure CadastrodeGrupodeProduto1Click(Sender: TObject);
    procedure CadastroSubstituioTributriaporProdutos1Click(
      Sender: TObject);
    procedure CadastroPreoPorLote1Click(Sender: TObject);
    procedure PreoPrazoVendedor1Click(Sender: TObject);
    procedure CadastrodeNcm1Click(Sender: TObject);
    procedure CadastrodeNcmsemSimilarNacionalResoluoCAMEX1Click(
      Sender: TObject);
    procedure CadastrodeTabeladePreo1Click(Sender: TObject);
    procedure Provisorio1Click(Sender: TObject);
    procedure ProdutoSkyhub1Click(Sender: TObject);
    procedure CadastroCdigoANP1Click(Sender: TObject);
    procedure CadastroCdigoNBS1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuEstoque: TFMenuEstoque;

implementation

uses UClasseCad, UTela_cl, UTributacaoCad, UProdutoCad, UTipoLote, UPrecos,
  UEstoqueCad, UEstoqueACons, UAtualizaEstoqueNotas,
  UFEstoquePosCompraVenda, UFEstoqueSaidaProduto, UFProdutoFornecedor,
  UComissaoClasse_Cad, UOrigemProducaoCad,
  UImplantaProducaoCad, UParamSistema_cl, UProducaoCad, UPrecoPocket_Cad,
  UMarcaCad, UAtualizaPrecoCad, UPauta_Icms_Cad, UInventarioMes_Cad,
  UGeneroProdutoCad, UListaServicoCad, UPesagemProducao,
  UGrupoProdutoMetaCad, UProdutoSubstTrib, UPrecoLote_Cad, UPrecoPrazoVendedorCad,
  UNcmCad, UNcmSemSimilarNacCad, UTabelaPrecoCad, UCatalogo,
  UProdutoSkyhub, UAnpCad, UNbsCad;

{$R *.DFM}

procedure TFMenuEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  FMenuEstoque.pModulo := 'ESTOQUE';
end;

procedure TFMenuEstoque.Classe1Click(Sender: TObject);
begin
  inherited;
  if FClasseCad = nil then {Caso o form não estiver criado}
    FClasseCad := TFClasseCad.Create(Application); {então cria-se}
  DMTela.VerificaTela(pModulo, FClasseCad.Caption, FClasseCad.Name);
  FClasseCad.ShowModal;
end;

procedure TFMenuEstoque.Tributao1Click(Sender: TObject);
begin
  inherited;
  if FTributacaoCad = nil then
    FTributacaoCad := TFTributacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTributacaoCad.Caption, FTributacaoCad.Name);
  FTributacaoCad.ShowModal;
end;

procedure TFMenuEstoque.Produtos1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCad = nil then
    FProdutoCad := TFProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FProdutoCad.Caption, FProdutoCad.Name);
  FProdutoCad.ShowModal;
end;

procedure TFMenuEstoque.TripodeLote1Click(Sender: TObject);
begin
  inherited;
  if FTipoLoteCad = nil then
    FTipoLoteCad := TFTipoLoteCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTipoLoteCad.Caption, FTipoLoteCad.Name);
  FTipoLoteCad.ShowModal;
end;

procedure TFMenuEstoque.Preos1Click(Sender: TObject);
begin
  inherited;
  if FPrecoCad = nil then
    FPrecoCad := TFPrecoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FPrecoCad.Caption, FPrecoCad.Name);
  //DMTela.VerificaTela(pModulo,FPrecoCad.Caption);
  FPrecoCad.ShowModal;
end;

procedure TFMenuEstoque.ImplantaodeEstoque1Click(Sender: TObject);
begin
  inherited;
  if FImplantacaoCad = nil then
    FImplantacaoCad := TFImplantacaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FImplantacaoCad.Caption, FImplantacaoCad.Name);
  FImplantacaoCad.ShowModal;
end;

procedure TFMenuEstoque.ConsultaAvanadadeEstoque1Click(Sender: TObject);
begin
  inherited;
  if FEstoqueACons = nil then
    FEstoqueACons := TFEstoqueACons.Create(Application);
  DMTela.VerificaTela(pModulo, FEstoqueACons.Caption, FEstoqueACons.Name);
  FEstoqueACons.ShowModal;
end;

procedure TFMenuEstoque.AtualizaodeEstoquePNotas1Click(Sender: TObject);
begin
  inherited;
  if FAtualizaEstoqueNotas = nil then
    FAtualizaEstoqueNotas := TFAtualizaEstoqueNotas.Create(Application);
  DMTela.VerificaTela(pModulo, FAtualizaEstoqueNotas.Caption, FAtualizaEstoqueNotas.Name);
  FAtualizaEstoqueNotas.ShowModal;
end;

procedure TFMenuEstoque.PosiodeCompraseVendas1Click(Sender: TObject);
begin
  inherited;
  if FEstoquePCompraVenda = nil then
    FEstoquePCompraVenda := TFEstoquePCompraVenda.Create(Application);
  DMTela.VerificaTela(pModulo, FEstoquePCompraVenda.Caption, FEstoquePCompraVenda.Name);
  FEstoquePCompraVenda.ShowModal;
end;

procedure TFMenuEstoque.Saidaprodutosporpedido1Click(Sender: TObject);
begin
  inherited;
  if FEstoqueSaidaProduto = nil then
    FEstoqueSaidaProduto := TFEstoqueSaidaProduto.Create(Application);
  DMTela.VerificaTela(pModulo, FEstoqueSaidaProduto.Caption, FEstoqueSaidaProduto.Name);
  FEstoqueSaidaProduto.ShowModal;
end;

procedure TFMenuEstoque.Produtosporfornecedor1Click(Sender: TObject);
begin
  inherited;
  if FProdutoFornecedor = nil then
    FProdutoFornecedor := TFProdutoFornecedor.Create(Application);
  DMTela.VerificaTela(pModulo, FProdutoFornecedor.Caption, FProdutoFornecedor.Name);
  FProdutoFornecedor.ShowModal;
end;

procedure TFMenuEstoque.CadastroComissoPorClasse1Click(Sender: TObject);
begin
  inherited;
  if FComissaoClasse_Cad = nil then
    FComissaoClasse_Cad := TFComissaoClasse_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FComissaoClasse_Cad.Caption, FComissaoClasse_Cad.Name);
  FComissaoClasse_Cad.ShowModal;
end;

procedure TFMenuEstoque.CadastroOrigemProduo1Click(Sender: TObject);
begin
  inherited;
  if FOrigemProducaoCad = nil then
    FOrigemProducaoCad := TFOrigemProducaoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FOrigemProducaoCad.Caption, FOrigemProducaoCad.Name);
  FOrigemProducaoCad.ShowModal;
end;

procedure TFMenuEstoque.CadastrodeProduo1Click(Sender: TObject);
begin
  inherited;
  if FProducaoEstoqueCad = nil then
    FProducaoEstoqueCad := TFProducaoEstoqueCad.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoEstoqueCad.Caption, FProducaoEstoqueCad.Name);
  FProducaoEstoqueCad.ShowModal;
end;

procedure TFMenuEstoque.FormActivate(Sender: TObject);
begin
  inherited;
//  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
//     MMCadSimples.Items[0].Items[5].Visible := False;
  //MMCadSimples.Items[0].Items[4].Visible := false;
  MMCadSimples.Items[0].Items[7].Visible := false;
  MMCadSimples.Items[0].Items[8].Visible := false;
  //MMCadSimples.Items[0].Items[9].Visible := true;
  MMCadSimples.Items[0].Items[11].Visible := False;
  MMCadSimples.Items[0].Items[12].Visible := False;
  MMCadSimples.Items[0].Items[13].Visible := False;
  MMCadSimples.Items[0].Items[14].Visible := False;
  MMCadSimples.Items[0].Items[15].Visible := False;
  MMCadSimples.Items[0].Items[16].Visible := False;
  MMCadSimples.Items[0].Items[18].Visible := False;
  MMCadSimples.Items[0].Items[22].Visible := False;
end;

procedure TFMenuEstoque.CadastrodePreoPocket1Click(Sender: TObject);
begin
  inherited;
  if FPrecoPocket_Cad = nil then
    FPrecoPocket_Cad := TFPrecoPocket_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FPrecoPocket_Cad.Caption, FPrecoPocket_Cad.Name);
  FPrecoPocket_Cad.ShowModal;

end;

procedure TFMenuEstoque.CadastrodeMarca1Click(Sender: TObject);
begin
  inherited;
  if FMarca_Cad = nil then
    FMarca_Cad := TFMarca_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FMarca_Cad.Caption, FMarca_Cad.Name);
  FMarca_Cad.ShowModal;
end;

procedure TFMenuEstoque.Parametrosppreodevenda1Click(Sender: TObject);
begin
  inherited;
  if FAtualiza_PrecoCad = nil then
    FAtualiza_PrecoCad := TFAtualiza_PrecoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FAtualiza_PrecoCad.Caption, FAtualiza_PrecoCad.Name);
  FAtualiza_PrecoCad.ShowModal;

end;

procedure TFMenuEstoque.CadastroPreosPauta1Click(Sender: TObject);
begin
  inherited;
  if FPauta_Icms_Cad = nil then
    FPauta_Icms_Cad := TFPauta_Icms_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FPauta_Icms_Cad.Caption, FPauta_Icms_Cad.Name);
  FPauta_Icms_Cad.ShowModal;

end;

procedure TFMenuEstoque.CadastroInventrioMensal1Click(Sender: TObject);
begin
  inherited;
  if FInventarioMes_Cad = nil then
    FInventarioMes_Cad := TFInventarioMes_Cad.Create(Application);
  DMTela.VerificaTela(pModulo, FInventarioMes_Cad.Caption, FInventarioMes_Cad.Name);
  FInventarioMes_Cad.ShowModal;
end;

procedure TFMenuEstoque.ListadeServio1Click(Sender: TObject);
begin
  inherited;
  if FListaServicoCad = nil then
    FListaServicoCad := TFListaServicoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FListaServicoCad.Caption, FListaServicoCad.Name);
  FListaServicoCad.ShowModal;
end;

procedure TFMenuEstoque.GneroProduto1Click(Sender: TObject);
begin
  inherited;
  if FGeneroProdutoCad = nil then
    FGeneroProdutoCad := TFGeneroProdutoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FGeneroProdutoCad.Caption, FGeneroProdutoCad.Name);
  FGeneroProdutoCad.ShowModal;

end;

procedure TFMenuEstoque.CadastroPesagemProduo1Click(Sender: TObject);
begin
  inherited;
  if FPesagemProducao = nil then
    FPesagemProducao := TFPesagemProducao.Create(Application);
  DMTela.VerificaTela(pModulo, FPesagemProducao.Caption, FPesagemProducao.Name);
  FPesagemProducao.ShowModal;
end;

procedure TFMenuEstoque.CadastrodeGrupodeProduto1Click(Sender: TObject);
begin
  inherited;
  if FGrupoProdutoMetaCad = nil then
    FGrupoProdutoMetaCad := TFGrupoProdutoMetaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FGrupoProdutoMetaCad.Caption, FGrupoProdutoMetaCad.Name);
  FGrupoProdutoMetaCad.ShowModal;
end;

procedure TFMenuEstoque.CadastroSubstituioTributriaporProdutos1Click(
  Sender: TObject);
begin
  inherited;
  if FProdutoSubstTrib = nil then
    FProdutoSubstTrib := TFProdutoSubstTrib.Create(Application);
  DMTela.VerificaTela(pModulo, FProdutoSubstTrib.Caption, FProdutoSubstTrib.Name);
  FProdutoSubstTrib.ShowModal();
end;

procedure TFMenuEstoque.CadastroPreoPorLote1Click(Sender: TObject);
begin
  inherited;
  if FPrecoLote_Cad = nil then {Caso o form não estiver criado}
    FPrecoLote_Cad := TFPrecoLote_Cad.Create(Application); {então cria-se}
  DMTela.VerificaTela(pModulo, FPrecoLote_Cad.Caption, FPrecoLote_Cad.Name);
  FPrecoLote_Cad.ShowModal;

end;

procedure TFMenuEstoque.PreoPrazoVendedor1Click(Sender: TObject);
begin
  inherited;
  if FPrecoPrazoVendedorCad = nil then
    FPrecoPrazoVendedorCad := TFPrecoPrazoVendedorCad.Create(Application);
  FPrecoPrazoVendedorCad.ShowModal;
end;

procedure TFMenuEstoque.CadastrodeNcm1Click(Sender: TObject);
begin
  inherited;
  if FNcmCad = nil then
    FNcmCad := TFNcmCad.Create(Application);
  DMTela.VerificaTela(pModulo, FNcmCad.Caption, FNcmCad.Name);
  FNcmCad.ShowModal;
end;

procedure TFMenuEstoque.CadastrodeNcmsemSimilarNacionalResoluoCAMEX1Click(
  Sender: TObject);
begin
  inherited;
  if FNcmSemSimilarNacCad = Nil then
    FNcmSemSimilarNacCad := TFNcmSemSimilarNacCad.Create(Application);
  DMTela.VerificaTela(pModulo, FNcmSemSimilarNacCad.Caption,
    FNcmSemSimilarNacCad.Name);
  FNcmSemSimilarNacCad.ShowModal;
end;

procedure TFMenuEstoque.CadastrodeTabeladePreo1Click(Sender: TObject);
begin
  inherited;
    if FTabelaPrecoCad = nil then
    FTabelaPrecoCad := TFTabelaPrecoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FTabelaPrecoCad.Caption, FTabelaPrecoCad.Name);
  FTabelaPrecoCad.ShowModal;
end;

procedure TFMenuEstoque.Provisorio1Click(Sender: TObject);
begin
  inherited;
  if FCatalogo = nil then
    FCatalogo := TFCatalogo.Create(Application);
    FCatalogo.ShowModal;
end;

procedure TFMenuEstoque.ProdutoSkyhub1Click(Sender: TObject);
begin
  inherited;
  if FProdutoSkyhub = nil then
    FProdutoSkyhub := TFProdutoSkyhub.Create(Application);
    FProdutoSkyhub.ShowModal;
end;

procedure TFMenuEstoque.CadastroCdigoANP1Click(Sender: TObject);
begin
  inherited;
  if FAnpCad = nil then
    FAnpCad := TFAnpCad.Create(Application);
  FAnpCad.ShowModal;
end;

procedure TFMenuEstoque.CadastroCdigoNBS1Click(Sender: TObject);
begin
  inherited;
  if FNbsCad = nil then
    FNbsCad := TFNbsCad.Create(Application);
  FNbsCad.ShowModal;
end;

end.
