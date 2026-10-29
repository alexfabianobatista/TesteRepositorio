unit UNotaSaidaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, QuickRpt, DBTables, DBDirceu, OracleData, OraTeste, variants,
  ActnList, DBPanel, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFNotaSaidaCad = class(TFTCadSimples)
    PCNota: TPageControl;
    TSCabecalho: TTabSheet;
    TabSheet2: TTabSheet;
    PCCabecalho: TPageControl;
    TSGeral: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    DBECodNota: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBECliente: TDBEdit;
    Label9: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    BtConsCadastro: TBitBtn;
    BtConsFilial: TBitBtn;
    BtConsVendedor: TBitBtn;
    BtConsOperacao: TBitBtn;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    BtConsMensagem: TBitBtn;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label24: TLabel;
    DBEdit24: TDBEdit;
    BtConsTransportador: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Label13: TLabel;
    DBEdit25: TDBEdit;
    Label25: TLabel;
    DBEdit37: TDBEdit;
    DBNavigator1: TDBNavigator;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    BtConsTributacao: TBitBtn;
    BtConsLote: TBitBtn;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit57: TDBEdit;
    DBEComissao: TDBEdit;
    DBEDesconto: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    BtConsProduto: TBitBtn;
    Label56: TLabel;
    DBEdit65: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    BtImpPed: TBitBtn;
    TSBaixaPedido: TTabSheet;
    GBBaixaPed: TGroupBox;
    DBGrid3: TDBGrid;
    BtCancelaBaixaOC: TBitBtn;
    GroupBox2: TGroupBox;
    Label29: TLabel;
    Label41: TLabel;
    BtBaixaOC: TBitBtn;
    MEQtBaixarOC: TMaskEdit;
    MENumPedidoBaixar: TMaskEdit;
    BtConsOCAberto: TBitBtn;
    GroupBox3: TGroupBox;
    Label42: TLabel;
    Label32: TLabel;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBNavigator2: TDBNavigator;
    DBEdit40: TDBEdit;
    BtImpItemPed: TBitBtn;
    DSItemNF: TDataSource;
    DBGrid1: TDBGrid;
    Operaes1: TMenuItem;
    ConfirmarNota1: TMenuItem;
    CancelarNota1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    VoltaCancelamento1: TMenuItem;
    RelaodeNotas1: TMenuItem;
    Conferncia1: TMenuItem;
    Futura1: TMenuItem;
    MovEstoque1: TMenuItem;
    Emisso1: TMenuItem;
    DBRadioGroup2: TDBRadioGroup;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label30: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
    GroupBox6: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    BtConsTributacaoFrete: TBitBtn;
    Comisses1: TMenuItem;
    MapadeVendas1: TMenuItem;
    VendedoreCondPgto1: TMenuItem;
    MovMercadoria1: TMenuItem;
    ClientessemCompras1: TMenuItem;
    VendasporOperacao1: TMenuItem;
    MovportipodeDocumento1: TMenuItem;
    VendasporClasse1: TMenuItem;
    VendasporClasseeCondPagto1: TMenuItem;
    MovEstoqueES1: TMenuItem;
    PrazosdeVenda1: TMenuItem;
    VendedorPreoMdio1: TMenuItem;
    QRGVendedorCMedio: TQRCompositeReport;
    Secretaria1: TMenuItem;
    VendedorQuota1: TMenuItem;
    Inadimplncia1: TMenuItem;
    ContaCorrente1: TMenuItem;
    Label37: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    SBGeraContaCorrente: TSpeedButton;
    Label38: TLabel;
    DBEdit35: TDBEdit;
    Label40: TLabel;
    DBEdit46: TDBEdit;
    BitBtn1: TBitBtn;
    Label57: TLabel;
    DBEdit48: TDBEdit;
    DBDirceu1: TDBDirceu;
    SBImprimeCupomFiscal: TSpeedButton;
    SBConsultaFrete: TSpeedButton;
    Label59: TLabel;
    DBEdit49: TDBEdit;
    PMapaVendasPVendedorPagtoClasse1: TMenuItem;
    QContaCorrenteAberto1: TMenuItem;
    RRecibodeComisso1: TMenuItem;
    SRelatrioVendasComCheque1: TMenuItem;
    TRelatrioMaioresClientes1: TMenuItem;
    VResumoProdutosPorCliente1: TMenuItem;
    Label62: TLabel;
    DBEComissao_Nota: TDBEdit;
    XFuturaEmprstimoConsignaoDepsitoPNota1: TMenuItem;
    ZRelatrioHistricoCliente1: TMenuItem;
    QuantVendidaporItensporVendedor1: TMenuItem;
    Vendasporvendedorregio1: TMenuItem;
    Itensvendidosnoperiodo1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BtImpItemNota: TBitBtn;
    VendasPVendedorClasseFornecedor1: TMenuItem;
    Clientescomcompranoperiodo1: TMenuItem;
    Label64: TLabel;
    DBEdit53: TDBEdit;
    DBDirceu12: TDBDirceu;
    BtConsDepartamento: TBitBtn;
    EtiquetaspItensdaNF1: TMenuItem;
    Label65: TLabel;
    DBEdit56: TDBEdit;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    NotasContaCorrente1: TMenuItem;
    Label68: TLabel;
    DBEdit67: TDBEdit;
    Label69: TLabel;
    DBMemo1: TDBMemo;
    BitBtn2: TBitBtn;
    Label70: TLabel;
    SBCartaCorrecao: TSpeedButton;
    DBDirceu4: TDBDirceu;
    Label73: TLabel;
    DBEdit70: TDBEdit;
    Label74: TLabel;
    DBEdit71: TDBEdit;
    LblSituacao: TLabel;
    VendedorCliente1: TMenuItem;
    VendaCustoVendedorClasse1: TMenuItem;
    N3: TMenuItem;
    LanarQtChegada1: TMenuItem;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    DBEdit74: TDBEdit;
    Label80: TLabel;
    DBEdit75: TDBEdit;
    LblFormaCompra: TLabel;
    LblAutoriza: TLabel;
    AcompanhamentodeMeta1: TMenuItem;
    Label81: TLabel;
    DBEdit77: TDBEdit;
    Label82: TLabel;
    DBEdit78: TDBEdit;
    Label83: TLabel;
    DBEdit79: TDBEdit;
    Label84: TLabel;
    DBComboBox1: TDBComboBox;
    BtPrazo: TBitBtn;
    TotaldeVenda1: TMenuItem;
    btSerieCons: TBitBtn;
    lblModelo: TLabel;
    DBECod_Serie_Modelo: TDBEdit;
    Label39: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsVendedorClick(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsTributacaoFreteClick(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtImpPedClick(Sender: TObject);
    procedure BtConsOCAbertoClick(Sender: TObject);
    procedure BtBaixaOCClick(Sender: TObject);
    procedure BtCancelaBaixaOCClick(Sender: TObject);
    procedure BtImpItemPedClick(Sender: TObject);
    procedure DSItemNFStateChange(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure PCNotaChange(Sender: TObject);
    procedure ConfirmarNota1Click(Sender: TObject);
    procedure DBECodNotaChange(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure CancelarNota1Click(Sender: TObject);
    procedure VoltaCancelamento1Click(Sender: TObject);
    procedure RelaodeNotas1Click(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure Futura1Click(Sender: TObject);
    procedure MovEstoque1Click(Sender: TObject);
    procedure Emisso1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure Comisses1Click(Sender: TObject);
    procedure MapadeVendas1Click(Sender: TObject);
    procedure VendedoreCondPgto1Click(Sender: TObject);
    procedure MovMercadoria1Click(Sender: TObject);
    procedure ClientessemCompras1Click(Sender: TObject);
    procedure VendasporOperacao1Click(Sender: TObject);
    procedure MovportipodeDocumento1Click(Sender: TObject);
    procedure VendasporClasse1Click(Sender: TObject);
    procedure VendasporClasseeCondPagto1Click(Sender: TObject);
    procedure MovEstoqueES1Click(Sender: TObject);
    procedure PrazosdeVenda1Click(Sender: TObject);
    procedure VendedorPreoMdio1Click(Sender: TObject);
    procedure QRGVendedorCMedioAddReports(Sender: TObject);
    procedure Secretaria1Click(Sender: TObject);
    procedure VendedorQuota1Click(Sender: TObject);
    procedure Inadimplncia1Click(Sender: TObject);
    procedure ContaCorrente1Click(Sender: TObject);
    procedure SBGeraContaCorrenteClick(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBImprimeCupomFiscalClick(Sender: TObject);
    procedure SBConsultaFreteClick(Sender: TObject);
    procedure TSBaixaPedidoEnter(Sender: TObject);
    procedure TSBaixaPedidoExit(Sender: TObject);
    procedure PMapaVendasPVendedorPagtoClasse1Click(Sender: TObject);
    procedure QContaCorrenteAberto1Click(Sender: TObject);
    procedure RRecibodeComisso1Click(Sender: TObject);
    procedure SRelatrioVendasComCheque1Click(Sender: TObject);
    procedure TRelatrioMaioresClientes1Click(Sender: TObject);
    procedure VResumoProdutosPorCliente1Click(Sender: TObject);
    procedure XFuturaEmprstimoConsignaoDepsitoPNota1Click(Sender: TObject);
    procedure ZRelatrioHistricoCliente1Click(Sender: TObject);
    procedure DBEClienteExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QuantVendidaporItensporVendedor1Click(Sender: TObject);
    procedure Vendasporvendedorregio1Click(Sender: TObject);
    procedure Itensvendidosnoperiodo1Click(Sender: TObject);
    procedure DBEdit14Exit(Sender: TObject);
    procedure DBEdit16Exit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure BtImpItemNotaClick(Sender: TObject);
    procedure VendasPVendedorClasseFornecedor1Click(Sender: TObject);
    procedure DBEdit62Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Clientescomcompranoperiodo1Click(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure EtiquetaspItensdaNF1Click(Sender: TObject);
    procedure NotasContaCorrente1Click(Sender: TObject);
    procedure BtConsVendedorPreClick(Sender: TObject);
    procedure DBEdit31Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SBCartaCorrecaoClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure VendedorCliente1Click(Sender: TObject);
    procedure BtOrdemCarregamentoClick(Sender: TObject);
    procedure DBEdit62KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit63KeyPress(Sender: TObject; var Key: Char);
    procedure MELocalizaChange(Sender: TObject);
    procedure VendaCustoVendedorClasse1Click(Sender: TObject);
    procedure LanarQtChegada1Click(Sender: TObject);
    procedure DBEClienteChange(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure AcompanhamentodeMeta1Click(Sender: TObject);
    procedure BtPrazoClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure TotaldeVenda1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure DBECod_Serie_ModeloExit(Sender: TObject);
    procedure DBEdit11Exit(Sender: TObject);

  private
    procedure MsgAutoriza;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaSaidaCad: TFNotaSaidaCad;

implementation

uses UNotaSaida_cl, UCadastroCons, UFilialCons, UVendedorCons, UCadastro_cl,
  UFilial_cl, UVendedor_cl, UTransporte_cl, UProdutoCons, UProduto_cl,
  UTipoLoteCons, UTipoLote_cl, UTributacaoCons, UTributacao_cl, UOracle_cl,
  UOperacaoCons, UOperacao_cl, UMensagemCons, UMensagem_cl, UNotaSaidaCons,
  UPedidoCons, UPedido_cl, UPedido_ConsAberto, UNotaSaida_Confirma,
  UNotaSaida_Cancela, UNotaEntradaParam, UNotaEntrada_cl, URNotasES_Relacao,
  URNotasES_Conferencia, URNotasES_Futura, URNotasES_MovEstoque,
  URNota_Pedido, UNotaSaidaParam,
  URNota_Comissao, URNota_MapaVenda, URNota_MapaVendaRes,
  URNota_VendedorPgto, URNota_MovMercadoria, URNota_ClienteSemCompra,
  URNota_Operacao, URNota_TipoDocumento, URNota_Classe, URNota_ClassePgto,
  URNota_EntradaSaida, URNota_ComissaoCliente, URNota_PrazoVenda,
  URNota_VendedorCMedio, URNota_VendedorCMedio2, URNota_Secretaria,
  URNota_Secretaria2, URNota_QuotaVend, URNota_QuotaVend3,
  URNota_Inadimplencia, URNota_ContaCorrente, URNota_Claspar,
  UNota_ContaCorrente,UNotaImpressao, UParamSistema_cl, UImpFiscal,
  UConhecimentoCons, URVendedorClasse, URContaCorrente2, URReciboComissao,
  URNota_ComCheque, URMaioresClientes, URMaioresClientesVend,
  URNota_ClassePgtoVend, ULotesClaspar, URResumoCliente, URNota_VendaFutura,
  UrVendaHistorico, UNotaSaidaVendasVendedor, URNotaVendasVndRegiao,
  URNotaVendProdPeriodo, URTitulos, URVendasVendClasse, URelatorioVenda_cl,
  UImpressoraFiscal, URClienteComCompra, UDepartamentoCons,
  UBiblioteca, UDepartamento_cl, URNotaContaCorrente, UNotaCorrecao,
  UUsuario_cl, UNotaCorrecao_cl, URVendaVendedorCliente,
  UOrdemCarregamentoCons, UOrdemCarregamento_cl, URVendaVendedorClasse,
  UQtChegada, UNotaComprovanteEntrega, URComprovanteEntrega,
  URAcompanhaMeta, UPrazoVencimento_cl, UPrazoVencimentoCons, URTotalVenda,
  UFmFilial, USerieCons, USerie_cl;

{$R *.DFM}

procedure TFNotaSaidaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  begin
    QNotaSaida.Open;
    QSomaItemNota.Open;
    QItemNF.Open;
  End;
  DMTransporte.QTransporteAll.Open;
  PCNota.ActivePage := TSCabecalho;
  PCCabecalho.ActivePage := TSGeral;
  If (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '7') Or
     (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = 'A') Then
  Begin
    DBEComissao.ReadOnly := False;
    DBEComissao.TabStop := True;
    DBEComissao.ParentColor := False;
    DBEComissao.Color := clWindow;
  End;
  If (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = '9') Or
     (DMParamSistema.QParamSistemaInd_Tipo_Comissao.Value = 'A') Then
  Begin
    DBEComissao_Nota.ReadOnly := False;
    DBEComissao_Nota.TabStop := True;
    DBEComissao_Nota.ParentColor := False;
    DBEComissao_Nota.Color := clWindow;
  End;
end;

procedure TFNotaSaidaCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QNotaSaidaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
    If DmCadastro.QCadastroConsDt_Cancelamento.Text <> '' then
      Raise Exception.Create('Cliente com Cadastro Encerrado!');
    If FPedidoCons = Nil then
      FPedidoCons := TFPedidoCons.Create(Application);
    FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
    FPedidoCons.MEDataI.Text := DateToStr(Date-180);
    FPedidoCons.BtProcurarClick(Self);
    If DMPedido.QPedidoConsCod_Pedido_Cab.Value > 0  then
    Begin
      FPedidoCons.METexto.Enabled := False;
      FPedidoCons.BtConsCadastro.Enabled := False;
      BtImpPedClick(Self);
      FPedidoCons.METexto.Enabled := True;
    End;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB' Then
    Begin
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMNotaSaida.QNotaSaidaCod_Cadastro.Value);
      DMCadastro.QCadastro.Open;
      If DMCadastro.QCadastroDesc_Obs.Value <> '' Then
         MessageDlg(DMCadastro.QCadastroDesc_Obs.Text + Chr(13)  +
                    DMCadastro.QCadastroDesc_Obs1.Text + Chr(13) +
                    DMCadastro.QCadastroDesc_Obs2.Text, mtInformation,[mbOk], 0);
    End;
    MsgAutoriza;  // mostra na tela as pessoas autorizadas
  End;
end;

procedure TFNotaSaidaCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFNotaSaidaCad.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

procedure TFNotaSaidaCad.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
  End;
end;

procedure TFNotaSaidaCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DmNotaSaida.QItemNfCod_Produto.Value);
  If FTipoLoteCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
  End;
end;

procedure TFNotaSaidaCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
  Begin
    DMNotaSaida.QItemNF.Edit;
    DMNotaSaida.QItemNFCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
  End;
end;

procedure TFNotaSaidaCad.SBConfirmarClick(Sender: TObject);
Var wDespesas : Real;
    wParc : Integer;
begin
  wDespesas := 0;
  If DMNotaSaida.QItemNF.State <> dsBrowse Then
     DMNotaSaida.QItemNF.Post;
  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
     Raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contabil');
  If DBEdit8.Text <> '' Then  // Codigo do vendedor
   Begin
     If DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+DBEdit8.Text) <> 'ATIVO' Then
        Raise Exception.Create('Vendedor Inativo')
   End
  Else
    Raise Exception.Create('Preencher Código Vendedor');
  With DMOperacao Do
   Begin
     QOperacao.Close;
     QOperacao.SetVariable('PK',Trim(DBEdit6.Text));
     QOperacao.Open;
     If QOperacaoIND_FISICA_JURIDICA.Value <> 'T' Then
        If DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO','COD_CADASTRO = '+DBECliente.Text) <> QOperacaoIND_FISICA_JURIDICA.Value Then
         Raise Exception.Create('Operação Inválida - Quanto a Opção Física/Jurídica');
     If QOperacaoIND_TIPO_PAGAMENTO.Value <> 'T' Then
      Begin
        If (DBRadioGroup2.ItemIndex = 0) And (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'V') Then
           Raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
        If (DBRadioGroup2.ItemIndex = 1) And (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'P') Then
           Raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
        If (DBRadioGroup2.ItemIndex = 2) And (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'O') Then
           Raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
      End;
   End;
  With  DMNotaSaida do
  Begin
    Try
      pGravando := True;
      QItemNF.AutoCalcFields := False;
      QSomaItemNota.AutoCalcFields := False;
      QItemNF.DisableControls;
      QItemNF.DisableControls;
      QItemNF.First;            // retirado pelo césar no dia 05/02/2001
      While not QItemNF.Eof do // incluido 11/06/99
       Begin
         QItemNF.Edit;
//        CalculaItem;
//        CalculaICM;
         QItemNF.Post;
         QItemNF.Next;
      End;
{     If Trim(DBEdit79.Text) <> '' Then
      Begin
        DMPrazoVencimento.QPrazoVencimento.Close;
        DMPrazoVencimento.QPrazoVencimento.SetVariable('Pk',Trim(DBEdit79.Text));
        DMPrazoVencimento.QPrazoVencimento.Open;
        If Trim(DBComboBox1.Text) <> Null Then
         Begin
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia1.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia1.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia1.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia2.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia2.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia2.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia3.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia3.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia3.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia4.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia4.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia4.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia5.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia5.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia5.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia6.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia6.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia6.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) = DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia7.Value)
              And (DMPrazoVencimento.QPrazoVencimentoPerc_Carencia7.Value > 0) Then
              wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia7.Value;
           If (StrtoInt(Trim(DBComboBox1.Text)) >= 1) And (StrtoInt(Trim(DBComboBox1.Text)) <= 9) Then
            Begin
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia1.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia1.Value;
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia2.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia2.Value;
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia3.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia3.Value;
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia4.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia4.Value;
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia5.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia5.Value;
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia6.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia6.Value;
              If DMPrazoVencimento.QPrazoVencimentoNum_Dias_Carencia7.Value = 9 Then
                 wDespesas := QSomaItemNotaSVal_Total_Nota.Value *  DMPrazoVencimento.QPrazoVencimentoPerc_Carencia7.Value;
            End;
         End;
      End;
      wParc := DMPrazoVencimento.QPrazoVencimentoNum_Parcelas.Value;
      If QNotaSaidaVal_AVista.Value > 0 Then
         Inc(wParc);
      If wDespesas > 0 Then
         QNotaSaidaVal_Despesas.Value := wDespesas * wParc - QSomaItemNotaSVal_Total_Nota.Value  // faz o post no final da rotina
      Else
         QNotaSaidaVal_Despesas.Value := 0;
}      QItemNF.EnableControls;
      QSomaItemNota.AutoCalcFields := True;
      pGravando := False;
    Except
      QSomaItemNota.AutoCalcFields := True;
      pGravando := False;
      QItemNF.EnableControls;
      QItemNF.EnableControls;
      Raise;
    End;
  End;
  inherited;
  DMNotaSaida.QItemNF.EnableControls;
  DMOracle.DBCemapa.Commit;
end;

procedure TFNotaSaidaCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaSaidaCad.BtConsTributacaoFreteClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Tributacao_Frete.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
end;

procedure TFNotaSaidaCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_MENSAGEM.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;
end;

procedure TFNotaSaidaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := False;  // digitacao manual de valores de icms
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',QNotaSaidaConsCod_Nota_Cab.Value);
    QNotaSaida.Open;
  End;
end;

procedure TFNotaSaidaCad.BtImpPedClick(Sender: TObject);
Var wTipoNota : String;
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  If FPedidoCons.ShowModal = mrOk then
  Begin
    With DMPedido do
    Begin
      QPedido.Close;
      QPedido.SetVariable('PK',QPedidoConsCOD_PEDIDO_CAB.Value);
      QPedido.Open;
      QSomaPedido.Close;
      QSomaPedido.SetVariable('COD_PEDIDO_CAB',QPedidoConsCOD_PEDIDO_CAB.Value);
      QSomaPedido.Open;
      DMCadastro.ValidaCredito(DMpedido.QPedidoCod_Cadastro.Value,DMpedido.QSomaPedidoSTOTAL_PEDIDO.Value);

      With DMNotaSaida do
      Begin
        QNotaSaidaCOD_FILIAL.Value := QPedidoCOD_FILIAL.Value;
        QNotaSaidaCOD_OPERACAO.Value := QPedidoCOD_OPERACAO.Value;
        QNotaSaidaCOD_CADASTRO.Value := QPedidoCOD_CADASTRO.Value;
        QNotaSaidaPERC_COMISSAO.Value := QPedidoPERC_COMISSAO.Value;
        QNotaSaidaVAL_DESCONTO.Value := QPedidoVAL_DESCONTO.Value;
        if QPedidoCOD_VENDEDOR.Text <> '' then
          QNotaSaidaCOD_VENDEDOR.Text := QPedidoCOD_VENDEDOR.Text;
        iF DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ZADIMEL' Then
           QNotaSaidaOBS.Text := QPedidoDESC_OBSERVACAO.Text;
        QNotaSaidaOBS_COMPLEMENTO.Text := QPedidoDESC_COMPLEMENTO_OBS.Text;
        wTipoNota := DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QPedidoCOD_OPERACAO.Value));
        If wTipoNota = 'F' Then // Nota Fiscal
           QNotaSaidaCOD_SERIE.Value := DMParamSistema.QParamSistemaCOD_SERIE_NOTA.Value
        else
           QNotaSaidaCOD_SERIE.Value := DMParamSistema.QParamSistemaCOD_SERIE_PEDIDO.Value;
        QNotaSaidaIND_TIPO_FRETE.Value := QPedidoIND_TIPO_FRETE.Value;
        QNotaSaidaVAL_AVISTA.Value := QPedidoVAL_ENTRADA.Value;
        QNotaSaidaCOD_PRAZO_VENCIMENTO.Value := QPedidoCOD_PRAZO_VENCIMENTO.Value;
        QNotaSaidaNUM_DIAS_CARENCIA.Value := QPedidoNUM_PALM.Value;
        If QPedidoIND_TIPO_PAGAMENTO.Value = 'A VISTA' Then
           QNotaSaidaIND_CONDICAO_PAGTO.Value := '1'
        Else
           QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
      End;
    End;
  End;
  FPedidoCons.METexto.Enabled := True;
end;

procedure TFNotaSaidaCad.BtConsOCAbertoClick(Sender: TObject);
begin
  inherited;
  If FPedido_ConsAberto = Nil then
    FPedido_ConsAberto := TFPedido_ConsAberto.Create(Application);
  With FPedido_ConsAberto do
  Begin
    METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
    MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
    MEProduto.Text := DMNotaSaida.QItemNFCod_Produto.Text;
    METexto.Enabled := False;
    MEFilial.Enabled := False;
    MEProduto.Enabled := False;
    BtConsCadastro.Enabled := False;
    BtConsFilial.Enabled := False;
    BtConsProduto.Enabled := False;
  End;
  If FPedido_ConsAberto.ShowModal = mrOk then
    MENumPedidoBaixar.Text := DMPedido.QPedidoAbertoCod_Pedido_Item.Text;
  FPedido_ConsAberto := Nil;
end;

procedure TFNotaSaidaCad.BtBaixaOCClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    If QNotaSaidaInd_Situacao.Value > '1' Then //Digitada
      Raise Exception.Create('Nota já Confirmada ou Cancelada!');
    Try
      QAtuBaixaPed.Open;
      QAtuBaixaPed.Insert;
      QAtuBaixaPedCod_Nota_Item.Value := QItemNFCod_Nota_Item.Value;
      QAtuBaixaPedCod_Pedido_Item.Value := StrToInt(Trim(MENumPedidoBaixar.Text));
      QAtuBaixaPedQt_Baixa.Value := StrToFloat(MEQtBaixarOC.Text);
      QAtuBaixaPed.Post;
      QBaixasPed.Close;
      QBaixasPed.Open;
    Except
      If QAtuBaixaPed.State = dsInsert then
        QAtuBaixaPed.Cancel;
      Raise;
    End;
    MENumPedidoBaixar.Text := '';
    MEQtBaixarOC.Text := '';
    QAtuBaixaPed.Close;
  End;
end;

procedure TFNotaSaidaCad.BtCancelaBaixaOCClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    If QNotaSaidaInd_Situacao.Value > '1' Then //Digitada
      Raise Exception.Create('Nota já Confirmada ou Cancelada!');

    QAtuBaixaPed.Close;
    QAtuBaixaPed.Open;
    QAtuBaixaPed.First;
    While not QAtuBaixaPed.Eof do
    Begin
      If QAtuBaixaPedCod_Pedido_Item.Value = QBaixasPedCod_Pedido_Item.Value then
        QAtuBaixaPed.Delete;
      QAtuBaixaPed.Next;
    End;
    QBaixasPed.Close;
    QBaixasPed.Open;
    If DMOracle.DBCemapa.InTransaction Then
       DMOracle.DBCemapa.Commit;
  End;
end;

procedure TFNotaSaidaCad.BtImpItemPedClick(Sender: TObject);
Var wCodItemNF : Integer;
    wQt_Item_nota : Real;
    wCodAuxiliar,wIpi : String;
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMNotaSaida.QNotaSaidaCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  If FPedidoCons.ShowModal = mrOk then
  Begin
    With DMPedido do
    Begin
      DMNotaSaida.QBaixasPed.Close;
      QPedido.Close;
      QPedido.SetVariable('PK',QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      QPedidoItem.Open;
      QPedidoItem.First;
      DMNotaSaida.pTrazPedido := True;
      While not QPedidoItem.Eof do
        With DMNotaSaida do
        Begin
          If (QPedidoItemQt_Pedido.Value > (QPedidoItemQt_Atendido.Value+QPedidoItemQt_Cancelado.Value)) Or
             (FPedidoCons.RgQtZero.ItemIndex = 0)  then
          Begin
            QItemNF.Insert;
            QItemNFQt_Quantidade.Value := QPedidoItemQt_Pedido.Value-QPedidoItemQt_Atendido.Value-QPedidoItemQt_Cancelado.Value;
            If FPedidoCons.RGCodigoAuxiliar.ItemIndex = 1 Then
             Begin
               QItemNFCod_Produto.Value := QPedidoItemCod_Produto.Value;
               QItemNFVal_Unitario.Value := QPedidoItemVal_Unitario.Value;
               If QItemNFQt_Quantidade.Value > 0 Then
                  QItemNFVal_Total.Value := QPedidoItemVal_Unitario.Value*QItemNFQt_Quantidade.Value
               Else
                  QItemNFVal_Total.Value := QPedidoItemVal_Unitario.Value;
             end
            else
             Begin
               wCodAuxiliar := DMOracle.BuscaNome('SELECT COD_PRODUTO_B FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value));
               If wCodAuxiliar <> '' Then
                  QItemNFCod_Produto.Value := StrToFloat(wCodAuxiliar)
               Else
                  QItemNFCod_Produto.Value := QPedidoItemCod_Produto.Value;
               QItemNFVal_Unitario.Value := QPedidoItemVal_Unitario.Value / 2;
               QItemNFVal_Total.Value := (QPedidoItemVal_Unitario.Value*QItemNFQt_Quantidade.Value) / 2;
             end;
            QItemNFCod_Lote_Tipo.Value := QPedidoItemCod_Lote_Tipo.Value;
            QItemNFCod_Tributacao.Value := QPedidoItemCod_Tributacao.Value;
            QItemNFPerc_Desconto.Value := QPedidoItemPerc_Desconto.Value;
            QItemNFPerc_Comissao.Value := QPedidoItemPerc_Comissao.Value;
            wIpi := DMOracle.BuscaNome('SELECT PERC_IPI FROM TB_PRODUTO','COD_PRODUTO = '+QItemNFCod_Produto.Text);
            If wIpi <> '' Then
               QItemNFPerc_Ipi.Value := StrToFloat(wIpi);
            wCodItemNF := QItemNFCod_Nota_Item.Value;
            wQt_Item_nota := QItemNFQt_Quantidade.Value;
            QItemNF.Post;
            QAtuBaixaPed.Open;
            QAtuBaixaPed.Insert;
            QAtuBaixaPedCod_Nota_Item.Value := wCodItemNF;
            QAtuBaixaPedCod_Pedido_Item.Value := QPedidoItemCod_Pedido_Item.Value;
            QAtuBaixaPedQt_Baixa.Value := wQt_Item_nota;
            QAtuBaixaPed.Post;
            QAtuBaixaPed.Close;
            QAtuDtFatura_Ped.Close;
            QAtuDtFatura_Ped.SetVariable('COD_PEDIDO_CAB',QPedidoItemCod_Pedido_Cab.Value);
            QAtuDtFatura_Ped.Open;
            QAtuDtFatura_Ped.Edit;
            QAtuDtFatura_PedDt_Faturamento.Value := DMOracle.DataServ;
            QAtuDtFatura_Ped.Post;
            QAtuDtFatura_Ped.Close;
            // Itens de Pedidos atualizados nos eventos da query
          End;
          QPedidoItem.Next;
        End;
        With DMNotaSaida do
        Begin
          QAtuBaixaPed.Close;
          QItemNF.Close;
          QPedidoItem.Close;
          QItemNF.Open;
          QAtuBaixaPed.Open;
          QPedidoItem.Open;
        End;
      QPedido.Close;
      QPedidoItem.Close;
     End;
  End;
  DMNotaSaida.pTrazPedido := False;
  FPedidoCons.METexto.Enabled := True;
  FPedidoCons.BtConsCadastro.Enabled := True;
  FPedidoCons.MEFilial.Enabled := True;
  FPedidoCons.BtConsFilial.Enabled := True;
end;

procedure TFNotaSaidaCad.DSItemNFStateChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    BtImpItemPed.Enabled := (QNotaSaida.State = dsEdit) and (QItemNF.State = dsBrowse);
    BtImpItemNota.Enabled := (QNotaSaida.State = dsEdit) and (QItemNF.State = dsBrowse);
    BtConsLote.Enabled := QNotaSaida.State = dsEdit;
    BtConsProduto.Enabled := QNotaSaida.State = dsEdit;
    BtConsTributacao.Enabled := QNotaSaida.State = dsEdit;
  End;
end;

procedure TFNotaSaidaCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    // ** Pedidos ***
    GBBaixaPed.Enabled := (QNotaSaida.State = dsBrowse) and (QNotaSaidaInd_Situacao.Value <> '2');
    BtConsOCAberto.Enabled := GBBaixaPed.Enabled;
    BtBaixaOC.Enabled := GBBaixaPed.Enabled;
    BtCancelaBaixaOC.Enabled := GBBaixaPed.Enabled;
    // ******
    BtImpPed.Enabled := QNotaSaida.State in [dsEdit,dsInsert];
    SBConsultaFrete.Enabled := Not BtImpPed.Enabled;
    SBImprimeCupomFiscal.Enabled := SBConsultaFrete.Enabled;
    SBGeraContaCorrente.Enabled := SBConsultaFrete.Enabled;
    SBCartaCorrecao.Enabled := SBGeraContaCorrente.Enabled;
    BtImpItemPed.Enabled := (QNotaSaida.State in [dsEdit,dsInsert]) and (QItemNF.State = dsBrowse);
    BtImpItemNota.Enabled := (QNotaSaida.State in [dsEdit,dsInsert]) and (QItemNF.State = dsBrowse);
    BtConsLote.Enabled :=    BtImpPed.Enabled;
    BtConsTributacao.Enabled := BtImpPed.Enabled;
    BtConsCadastro.Enabled := BtImpPed.Enabled;
    BtConsOperacao.Enabled := BtImpPed.Enabled;
    BtConsMensagem.Enabled := BtImpPed.Enabled;
    BtConsDepartamento.Enabled := BtImpPed.Enabled;
    BtConsVendedor.Enabled := BtImpPed.Enabled;
    BtConsFilial.Enabled := BtImpPed.Enabled;
    BtConsVendedor.Enabled := BtImpPed.Enabled;
    BtConsProduto.Enabled := btImpPed.Enabled;
    MMCadSimples.Items[2].Enabled := DSPrimario.DataSet.State = dsBrowse;
    If QNotaSaidaInd_Situacao.Value = '1' Then
       LblSituacao.Caption := 'DIGITADA';
    If QNotaSaidaInd_Situacao.Value = '2' Then
       LblSituacao.Caption := 'CONFIRMADA';
    If QNotaSaidaInd_Situacao.Value = '3' Then
       LblSituacao.Caption := 'CANCELADA';

  End;
end;

procedure TFNotaSaidaCad.PCNotaChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    If PCNota.ActivePage = TSBaixaPedido then
    Begin
      QBaixasPed.Open;
    End
    Else
    Begin
      QBaixasPed.Close;
    End;
  End;
end;

procedure TFNotaSaidaCad.ConfirmarNota1Click(Sender: TObject);
begin
  inherited;
  Try
    DMNotaSaida.QNotaSaida.Close;  // esta fechando para verificar se nao tem outro terminal que esta confirmando a mesma nota
    DMNotaSaida.QNotaSaida.Open;
    DMNotaSaida.QSomaItemNota.AutoCalcfields := False;
    DMNotaSaida.QItemNF.AutoCalcfields := False;
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
       Raise Exception.Create('Nota Fiscal já confirmada!');
    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
       Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
    if FNotaSaida_Confirma = nil then
       FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
    DMNotaSaida.ChecaNota;
    FNotaSaida_Confirma.pAtivado := False;
    DMNotaSaida.pConfirmando := True;
    FNotaSaida_Confirma.ShowModal;
    DMNotaSaida.QSomaItemNota.AutoCalcfields := False;
    DMNotaSaida.QItemNF.AutoCalcfields := False;
    DMNotaSaida.pConfirmando := False;
    FNotaSaida_Confirma.pAtivado := False;
    DMNotaSaida.QItemNF.EnableControls;
    DMNotaSaida.QNotaSaida.EnableControls;
    SBRefreshClick(Self);
  Except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    Raise;
  End;
  FNotaSaida_Confirma.Free;
  FNotaSaida_Confirma:=Nil;
end;

procedure TFNotaSaidaCad.DBECodNotaChange(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    MMCadSimples.Items[2].Items[0].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[1].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QNotaSaidaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[3].Enabled := QNotaSaidaInd_Situacao.Value = '3';
    QSomaItemNota.Close;
    QSomaItemNota.Open;
  End;
end;

procedure TFNotaSaidaCad.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value Then
     ShowMessage('Não é Permitido Voltar Confirmação - Fechamento Contabil')
  else
   begin
      Try
        DMNotaSaida.QNotaSaida.DisableControls;
        DMNotaSaida.QItemNF.DisableControls;
        DMNotaSaida.VoltaConfirmacao;
        DMNotaSaida.QNotaSaida.EnableControls;
        DMNotaSaida.QItemNF.EnableControls;
        DMOracle.Audit( TOracleDataset1 (DSPrimario.Dataset ), 'Volta Confirmacao' );

        If (DMNotaSaida.QNotaSaidaVAL_AVISTA.Value >= 0.01)          and
          (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '2')  Then
         If (DMOperacao.QOperacaoIND_EMITE_RECIBO_ENTRADA.Value = 'S') Then
            if MessageDlg('Deseja emitir recibo de Cancelamento de Entrada?',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            begin
              if(FNotaSaida_Confirma = nil) then
                FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(nil);
              FNotaSaida_Confirma.EmiteReciboVoltaEntrada40Col;
            end;
      except
        DMNotaSaida.QNotaSaida.EnableControls;
        DMNotaSaida.QItemNF.EnableControls;
        raise;
      end;
   End;
  SBRefreshClick(Self);   
end;

procedure TFNotaSaidaCad.CancelarNota1Click(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' Then
     Raise Exception.Create('Não é possivel cancelar uma Nota confirmada!');
  If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
     Raise Exception.Create('Esta Nota Fiscal já está cancelada!');
  If DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA','COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)) <> '' Then
     raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
  If FNotaSaida_Cancela = Nil then
     FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);
  if FNotaSaida_Cancela.ShowModal = MrOk then
  begin
    If DMOperacao.QOperacao.Eof Then
     Begin
       DMOperacao.QOperacao.Close;
       DMOperacao.QOperacao.Setvariable('Pk',DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value);
       DMOperacao.QOperacao.Open;
     End;
    if DMOperacao.QOperacaoIND_CUPOM_FISCAL.Value = 'S' then
    begin
      if FImpressoraFiscal = nil then
        FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
      if DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL' then
        FImpressoraFiscal.Y8000ECF('1E')
      else
      begin
        iRetorno := Bematech_FI_CancelaCupom();
        FImpressoraFiscal.Analisa_iRetorno();
        FImpressoraFiscal.Retorno_Impressora();
      end;
    end;
  end;
  SBRefreshClick(Self);
end;

procedure TFNotaSaidaCad.VoltaCancelamento1Click(Sender: TObject);
begin
  inherited;
  DMNotaSaida.VoltaCancelamento;
end;

procedure TFNotaSaidaCad.RelaodeNotas1Click(Sender: TObject);
begin
  inherited;
  If FNotaEntradaParam = Nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[0].TabVisible := True;
  If FNotaEntradaParam.ShowModal = MrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text),'VENDA');
    QRelacao.Close;
    If Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text) = '' then
      QRelacao.SetVariable('FILIAL',Null)
    Else
      QRelacao.SetVariable('FILIAL',FNotaEntradaParam.FmFilial1.MeFilial.Text);

    QRelacao.SetVariable('ENTRADA_SAIDA','S');
    QRelacao.SetVariable('DATA_I',FNotaEntradaParam.ME0DataI.Text);
    QRelacao.SetVariable('DATA_F',FNotaEntradaParam.ME0DataF.Text);

    Case FNotaEntradaParam.RG0TipoNota.ItemIndex of
      0 : QRelacao.SetVariable('SITUACAO',Null);
      1 : QRelacao.SetVariable('SITUACAO','1');
      2 : QRelacao.SetVariable('SITUACAO','2');
      3 : QRelacao.SetVariable('SITUACAO','3');
    End;
    If Trim(FNotaEntradaParam.FmCadastro1.MeCadastro.Text)= ''   then
       QRelacao.SetVariable('CADASTRO',Null)
    Else
       QRelacao.SetVariable('CADASTRO',FNotaEntradaParam.FmCadastro1.MeCadastro.Text);

    If Trim(FNotaEntradaParam.FmVendedor1.MeVendedor.Text)= ''   then
      QRelacao.SetVariable('VENDEDOR',Null)
    Else
      QRelacao.SetVariable('VENDEDOR',FNotaEntradaParam.FmVendedor1.MeVendedor.Text);

    if Trim(FNotaEntradaParam.ME1Operacao.Text) <> '' then
    begin
      QRelacao.SetVariable('OPERACAO', ' TB_NOTA_CAB.COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaEntradaParam.ME1Operacao.Text))+')');
    end
    else
      QRelacao.SetVariable('OPERACAO', '1=1');

    {If Trim(FNotaEntradaParam.FmOperacao1.MeOperacao.Text)= ''   then
      QRelacao.SetVariable('OPERACAO',Null)
    Else
      QRelacao.SetVariable('OPERACAO',FNotaEntradaParam.FmOperacao1.MeOperacao.Text);}

    //If Trim(FNotaEntradaParam.FmEstado1.MeEstado.Text)= ''   then
    //  QRelacao.SetVariable('COD_ESTADO',Null)
    //Else
    //  QRelacao.SetVariable('COD_ESTADO',FNotaEntradaParam.FmEstado1.MeEstado.Text);

     QRelacao.SQL.Strings[QRelacao.SQL.Count - 1] := '';
      case FNotaEntradaParam.CB0Ordem.ItemIndex of
        0: QRelacao.SQL.Add('ORDER BY NOME');
        1: QRelacao.SQL.Add('ORDER BY DT_RECEBIMENTO, NUM_NOTA');
        2: QRelacao.SQL.Add('ORDER BY NUM_NOTA');
        3: QRelacao.SQL.Add('ORDER BY DT_EMISSAO, NUM_NOTA');
      else
        raise Exception.Create('Nenhuma Ordem Selecionada!');
      end; // Case
 
    QRelacao.Open;
    If FRNotasES_Relacao = Nil then
      FRNotasES_Relacao := TFRNotasES_Relacao.Create(Application);
    FRNotasES_Relacao.QRLTitulo.Caption := 'Relação de Notas de Saida de '+ FNotaEntradaParam.ME0DataI.Text  + ' ate ' +FNotaEntradaParam.ME0DataF.Text;
    FRNotasES_Relacao.QRLFilial.Caption := 'Filial:' +Trim(FNotaEntradaParam.FmFilial1.MeFilial.Text) + ' - ' + FNotaEntradaParam.FmFilial1.EdFilial.Text;
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
      FRNotasES_Relacao.QRPrimario.Preview
    Else
      FRNotasES_Relacao.QRPrimario.Print;
    QRelacao.Close;
    QRelacao.SQL[QRelacao.SQL.Count-1]:='';  // elimina a última Linha da SQL
  End;
end;

procedure TFNotaSaidaCad.Conferncia1Click(Sender: TObject);
begin
  inherited;
  if FNotaEntradaParam = Nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[1].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text),'VENDA');
    QConferencia.Close;
    QConferencia.SetVariable('ENTRADA_SAIDA','S');
    If Trim(FNotaEntradaParam.ME1DataI.Text) <> '' Then
      QConferencia.SetVariable('DATA_I',FNotaEntradaParam.ME1DataI.Text);
    If Trim(FNotaEntradaParam.ME1DataF.Text) <> '' Then
      QConferencia.SetVariable('DATA_F',FNotaEntradaParam.ME1DataF.Text);

    if Trim(FNotaEntradaParam.FmFilial2.MeFilial.Text) = '' then
      QConferencia.SetVariable('FILIAL',Null)
    else
      QConferencia.SetVariable('FILIAL',FNotaEntradaParam.FmFilial2.MeFilial.Text);

    if Trim(FNotaEntradaParam.FmCadastro2.MeCadastro.Text) = '' then
      QConferencia.SetVariable('CADASTRO',Null)
    else
      QConferencia.SetVariable('CADASTRO',FNotaEntradaParam.FmCadastro2.MeCadastro.Text);

    if Trim(FNotaEntradaParam.FmOperacao2.MeOperacao.Text) = '' then
      QConferencia.SetVariable('OPERACAO',Null)
    else
      QConferencia.SetVariable('OPERACAO',FNotaEntradaParam.FmOperacao2.MeOperacao.Text);

    QConferencia.Open;
    QConfItem.Close;
    QConfItem.Open;
    QConfContaPagar.Close;
    QConfContaPagar.Open;
    DMNotaEntrada.QImposto.Close;
    DMNotaEntrada.QImposto.Master := QConferencia;
    DMNotaEntrada.QImposto.MasterFields := 'COD_NOTA_CAB';
    DMNotaEntrada.QImposto.Open;
    if FRNotasES_Conferencia = nil then
       FRNotasES_Conferencia := TFRNotasES_Conferencia.Create(Application);
    FRNotasES_Conferencia.QRLTitulo.Caption := 'Rel. de Conferência de Notas de Saida';
    FRNotasES_Conferencia.pValTotal := 0;
    FRNotasES_Conferencia.pValIPITotal := 0;
    if FNotaEntradaParam.RGPreview.ItemIndex = 0 then
       FRNotasES_Conferencia.QRPrimario.Preview
    else
       FRNotasES_Conferencia.QRPrimario.Print;
    QConferencia.Close;
    QConfItem.Close;
    QConfItem.Open;
    QConfContaPagar.Close;
    DMNotaEntrada.QImposto.Close;
    DMNotaEntrada.QImposto.MasterFields := '';
  end;
end;

procedure TFNotaSaidaCad.Futura1Click(Sender: TObject);
Var wNomeRelatorio : String;
begin
  inherited;
  If FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[2].TabVisible := True;
  If FNotaEntradaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    //Frames-----------------
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text),'VENDA');
    QRFutura.Close;
    QRFutura.Sql.Clear;
    QRFutura.Sql.Add('SELECT Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,');
    QRFutura.Sql.Add('Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.DESC_PRODUTO,Tb_nota_cab.NUM_NOTA,');
    QRFutura.Sql.Add('Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,Tb_nota_cab.COD_SERIE,Tb_cadastro.NOME,TB_NOTA_ITEM.COD_LOTE_TIPO,');
    QRFutura.Sql.Add('Tb_nota_item.VAL_UNITARIO  ');
    QRFutura.Sql.Add('FROM TB_NOTA_ITEM,TB_NOTA_CAB,TB_NOTA_AUX,TB_PRODUTO,TB_CADASTRO ');
    QRFutura.Sql.Add(' WHERE Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM AND ');
    QRFutura.Sql.Add(' Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ');
    QRFutura.Sql.Add(' Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO  AND ');
    QRFutura.Sql.Add(' Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO  AND ');
    QRFutura.Sql.Add(' QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ');
    Case FNotaEntradaParam.CB2TipoFutura.ItemIndex of
       0 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'COM_FUT' + Chr(39));
             wNomeRelatorio := 'Rel. Notas de Compra Futura';
           End;
       1 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'VEN_FUT' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Venda Futura';
           End;
       2 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_FOR' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
           End;
       3 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'EMP_CLI' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
           End;
       4 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_FOR' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
           End;
       5 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'CON_CLI' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
           End;
       6 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_EMP' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
           End;
       7 : Begin
             QRFutura.Sql.Add('Tb_nota_aux.IND_TIPO = ' + Chr(39) + 'DEP_OUT' + chr(39));
             wNomeRelatorio := 'Rel. Notas de Deposito Outras Empresas';
           End;
       Else
         Raise Exception.Create('Nenhum tipo de Futura selecionado!');
    End;
    //Frames---------------------------------------------------------
    If Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text));
    If Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text));
    If Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text));
    If Trim(FNotaEntradaParam.FmLote3.MeLote.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaEntradaParam.FmLote3.MeLote.Text));
    If Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text) <> '' then
       QRFutura.Sql.Add(' And TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text));
    //--------------------------------------------------------------
    If Trim(FNotaEntradaParam.ME2DataI.Text) <> '' Then
       QRFutura.Sql.Add(' And Tb_nota_cab.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaEntradaParam.ME2DataI.Text) + chr(39));
    If Trim(FNotaEntradaParam.ME2DataF.Text) <> '' Then
       QRFutura.Sql.Add(' And Tb_nota_cab.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaEntradaParam.ME2DataF.Text) + chr(39));

    QRFutura.Open;

    If FRNotasES_Futura = Nil then
      FRNotasES_Futura := TFRNotasES_Futura.Create(Application);
    //Cabeçalho Relatório-------------------------------------------
    FRNotasES_Futura.QRLTitulo.Caption   := wNomeRelatorio;
    FRNotasES_Futura.QRLFilial.Caption   := 'Filial:'  +Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text)     + ' - '  + FNotaEntradaParam.FmFilial3.EdFilial.Text;
    FRNotasES_Futura.QRLVendedor.Caption := 'Vendedor:'+Trim(FNotaEntradaParam.FmVendedor3.EdVendedor.Text) + ' De ' + FNotaEntradaParam.ME2DataI.Text + ' Até ' + FNotaEntradaParam.ME2DataF.Text;
    //--------------------------------------------------------------
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
       FRNotasES_Futura.QRPrimario.Preview
    Else
       FRNotasES_Futura.QRPrimario.Print;

    QRFutura.Close;
  End;
end;

procedure TFNotaSaidaCad.MovEstoque1Click(Sender: TObject);
Var
  wstrS : String;
begin
  inherited;
  If FNotaEntradaParam = Nil then
    FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[3].TabVisible := True;
  If FNotaEntradaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    //Frames-----------------------
    DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text),'VENDA');
    QRMovEstoque.Close;
    QRMovEstoque.SetVariable('DATA_I',FNotaEntradaParam.ME3DataI.Text);
    QRMovEstoque.SetVariable('DATA_F',FNotaEntradaParam.ME3DataF.Text);

    If Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) = '' then
      QRMovEstoque.SetVariable('FILIAL',Null)
    Else
      QRMovEstoque.SetVariable('FILIAL',FNotaEntradaParam.FmFilial4.MeFilial.Text);

    If Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) = '' then
      QRMovEstoque.SetVariable('CADASTRO',Null)
    Else
      QRMovEstoque.SetVariable('CADASTRO',FNotaEntradaParam.FmCadastro4.MeCadastro.Text);

    if Trim(FNotaEntradaParam.Fm3Classe.MeClasse.Text) = '' then
      QRMovEstoque.SetVariable('CLASSE',Null)
    else
      QRMovEstoque.SetVariable('CLASSE',FNotaEntradaParam.Fm3Classe.MeClasse.Text);

    //If Trim(FNotaEntradaParam.ME3CadastroParceiro.Text) = '' then
    //  QRMovEstoque.SetVariable('CADASTRO_PARCEIRO',Null)
    //Else
    //  QRMovEstoque.SetVariable('CADASTRO_PARCEIRO',FNotaEntradaParam.ME3CadastroParceiro.Text);

    If Trim(FNotaEntradaParam.FmProduto4.MeProduto.Text) = '' then
      QRMovEstoque.SetVariable('PRODUTO',Null)
    Else
      QRMovEstoque.SetVariable('PRODUTO',FNotaEntradaParam.FmProduto4.MeProduto.Text);

    If Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) = '' then
      QRMovEstoque.SetVariable('VENDEDOR',Null)
    Else
      QRMovEstoque.SetVariable('VENDEDOR',FNotaEntradaParam.FmVendedor4.MeVendedor.Text);

    If Trim(FNotaEntradaParam.FmOperacao4.MeOperacao.Text) = '' then
     Begin
       QRMovEstoque.SetVariable('COD_OPERACAO',Null);
       QRMovEstoque.SetVariable('IND_ESTOQUE','S');
     End
    Else
     Begin
       QRMovEstoque.SetVariable('COD_OPERACAO',Trim(FNotaEntradaParam.FmOperacao4.MeOperacao.Text));
       QRMovEstoque.SetVariable('IND_ESTOQUE',Null);
     End;

    If Trim(FNotaEntradaParam.FmLote4.MeLote.Text) = '' then
      QRMovEstoque.SetVariable('LOTE',Null)
    Else
      QRMovEstoque.SetVariable('LOTE',FNotaEntradaParam.FmLote4.MeLote.Text);

    Case FNotaEntradaParam.RG3Tipo.ItemIndex of
      0 : QRMovEstoque.SetVariable('TIPO_NOTA','E');
      1 : QRMovEstoque.SetVariable('TIPO_NOTA','S');
      2 : QRMovEstoque.SetVariable('TIPO_NOTA',Null);
    End; // Case
    Case FNotaEntradaParam.RG3TipoProduto.ItemIndex of
      0 : QRMovEstoque.SetVariable('TIPO_PRODUTO','INDUSTRIAL');
      1 : QRMovEstoque.SetVariable('TIPO_PRODUTO','COMERCIAL');
      2 : QRMovEstoque.SetVariable('TIPO_PRODUTO',Null);
    End; // Case
    Case FNotaEntradaParam.CB3Ordem.ItemIndex of
     -1 : QRMovEstoque.SQL.Add('ORDER BY COD_PRODUTO,DT_EMISSAO');
      0 : QRMovEstoque.SQL.Add('ORDER BY COD_PRODUTO,DT_EMISSAO');
      1 : QRMovEstoque.SQL.Add('ORDER BY DT_RECEBIMENTO');
      2 : QRMovEstoque.SQL.Add('ORDER BY DESC_PRODUTO,DT_EMISSAO');
      3 : QRMovEstoque.SQL.Add('ORDER BY COD_OPERACAO,DT_EMISSAO');
    End; // Case
    QRMovEstoque.Open;

    If FRNotasES_MovEstoque = Nil then
      FRNotasES_MovEstoque := TFRNotasES_MovEstoque.Create(Application);
    wstrS := 'Cliente: Todos - ';
    If Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) <> '' then
      wstrS := 'Cliente: ' + Trim(FNotaEntradaParam.FmCadastro4.MeCadastro.Text) + ' ' + FNotaEntradaParam.FmCadastro4.EdCadastro.Text;
    wstrS := wstrS + ' De ' + FNotaEntradaParam.ME3DataI.Text + ' Até ' + FNotaEntradaParam.ME3DataF.Text;
    FRNotasES_MovEstoque.QrlCadastro.Caption := wstrS;
    If(Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text)<>'')Then
      FRNotasES_MovEstoque.QrlFilial.Caption := 'Filial: ' + Trim(FNotaEntradaParam.FmFilial4.MeFilial.Text) + ' ' + FNotaEntradaParam.FmFilial4.EdFilial.Text
    Else
      FRNotasES_MovEstoque.QrlFilial.Caption := 'Filial: Todas';
    wstrS := '';
    //If Trim(FNotaEntradaParam.ME3CadastroParceiro.Text) <> '' then
    //  wstrS := 'Parceiro: '+Trim(FNotaEntradaParam.ME3CadastroParceiro.Text)+ ' - '+
    //           DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(FNotaEntradaParam.ME3CadastroParceiro.Text))
    //else
    //   wstrS :='Parceiro: Todos';
    If Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) <> '' then
      wstrS := wstrS + ' - Vendedor: ' + Trim(FNotaEntradaParam.FmVendedor4.MeVendedor.Text) + ' ' + Trim(FNotaEntradaParam.FmVendedor4.EdVendedor.Text)
    Else
      wstrS := wstrS + ' - Vendedor: Todos';
    FRNotasES_MovEstoque.QRLParceiro.Caption := wstrS;
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
      FRNotasES_MovEstoque.QRPrimario.Preview
    Else
      FRNotasES_MovEstoque.QRPrimario.Print;
    QRMovEstoque.SQL[QRMovEstoque.SQL.Count-1]:='';  // elimina a última Linha da SQL
    QRMovEstoque.Close;
  End;
end;

procedure TFNotaSaidaCad.Emisso1Click(Sender: TObject);
begin
  inherited;
  FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
End;

procedure TFNotaSaidaCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'FAVILLE') And
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ZADIMEL') Then
  Begin
    DBRadioGroup2.ItemIndex := 1;
    BtConsCadastroClick(Self);
  end
  Else
    DbeCliente.SetFocus;
end;

procedure TFNotaSaidaCad.Comisses1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME0Filial.Text),'VENDA');
    QRComissao.Close;
    QRComissao.SetVariable('DATA_I',FNotaSaidaParam.ME0DataI.Text);
    QRComissao.SetVariable('DATA_F',FNotaSaidaParam.ME0DataF.Text);
    if Trim(FNotaSaidaParam.ME0Filial.Text)= ''   then
      QRComissao.SetVariable('FILIAL',Null)
    else
      QRComissao.SetVariable('FILIAL',FNotaSaidaParam.ME0Filial.Text);
    if Trim(FNotaSaidaParam.ME0Vendedor.Text)= ''   then
      QRComissao.SetVariable('VENDEDOR',Null)
    else
      QRComissao.SetVariable('VENDEDOR',FNotaSaidaParam.ME0Vendedor.Text);
    if Trim(FNotaSaidaParam.Ed0Serie.Text)= ''   then
      QRComissao.SetVariable('SERIE',Null)
    else
      QRComissao.SetVariable('SERIE',Trim(FNotaSaidaParam.Ed0Serie.Text));
    if Trim(FNotaSaidaParam.Ed0Serie1.Text)= ''   then
      QRComissao.SetVariable('SERIE1',Null)
    else
      QRComissao.SetVariable('SERIE1',Trim(FNotaSaidaParam.Ed0Serie1.Text));
    QRComissao.Open;
    if FRNota_Comissao = Nil then
      FRNota_Comissao := TFRNota_Comissao.Create(Application);
    if FNotaSaidaParam.RG0TipoRelatorio.ItemIndex = 0 Then
       FRNota_Comissao.pTipoRelatorio := 'ANALITICO'
    else
       FRNota_Comissao.pTipoRelatorio := 'SINTETICO';
    FRNota_Comissao.QRlTitulo.Caption := 'Comissao de Clientes de ' + FNotaSaidaParam.ME0DataI.Text + ' Ate ' + FNotaSaidaParam.ME0DataF.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_Comissao.QRPrimario.Preview
    else
       FRNota_Comissao.QRPrimario.Print;
    QRComissao.Close;
  end;
  If DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.Commit;
end;

procedure TFNotaSaidaCad.MapadeVendas1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[1].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME1Filial.Text),'VENDA');
    If FNotaSaidaParam.RGTipo.ItemIndex = 1 then  // Analítico
    Begin
      QRMapaVenda.Close;
      QRMapaVenda.SetVariable('DATA_I',FNotaSaidaParam.ME1DataI.Text);
      QRMapaVenda.SetVariable('DATA_F',FNotaSaidaParam.ME1DataF.Text);

      if Trim(FNotaSaidaParam.ME1Filial.Text)= ''   then
         QRMapaVenda.SetVariable('FILIAL',Null)
      else
         QRMapaVenda.SetVariable('FILIAL',Trim(FNotaSaidaParam.ME1Filial.Text));
      if Trim(FNotaSaidaParam.ME1Vendedor.Text)= ''   then
        QRMapaVenda.SetVariable('VENDEDOR',Null)
      else
        QRMapaVenda.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.ME1Vendedor.Text));
      if Trim(FNotaSaidaParam.ME1VendedorPreposto.Text)= ''   then
        QRMapaVenda.SetVariable('VENDEDOR_PREPOSTO',Null)
      else
        QRMapaVenda.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.ME1VendedorPreposto.Text));
      if Trim(FNotaSaidaParam.ME1Produto.Text)= ''   then
        QRMapaVenda.SetVariable('COD_PRODUTO',Null)
      else
        QRMapaVenda.SetVariable('COD_PRODUTO',Trim(FNotaSaidaParam.ME1Produto.Text));
      if Trim(FNotaSaidaParam.ME1Fornecedor.Text)= ''   then
        QRMapaVenda.SetVariable('FORNECEDOR',Null)
      else
        QRMapaVenda.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.ME1Fornecedor.Text));
      if Trim(FNotaSaidaParam.Me1Operacao.Text) <> '' then
      begin
        QRMapaVenda.SetVariable('OPERACAO',Null);
        QRMapaVenda.SetVariable('COD_OPERACAO',Trim(FNotaSaidaParam.Me1Operacao.Text));
      end
      else
      begin
        QRMapaVenda.SetVariable('OPERACAO','V');
        QRMapaVenda.SetVariable('COD_OPERACAO',Null);
      end;
      Case FNotaSaidaParam.RgProducao.ItemIndex of
        0 : QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO','PROPRIA');
        1 : QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO','TERCEIROS');
        2 : QRMapaVenda.SetVariable('IND_TIPO_PRODUCAO',Null);
      End;
      Case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
        0 : QRMapaVenda.SetVariable('TIPO_PAGTO','1');
        1 : QRMapaVenda.SetVariable('TIPO_PAGTO','2');
        2 : QRMapaVenda.SetVariable('TIPO_PAGTO','3');
        3 : QRMapaVenda.SetVariable('TIPO_PAGTO',Null);
      End;

      QRMapaVenda.Open;
      If FRNota_MapaVenda = Nil then
        FRNota_MapaVenda := TFRNota_MapaVenda.Create(Application);
      FRNota_MapaVenda.QRLTitulo.Caption := 'Mapa de Vendas de '+FNotaSaidaParam.ME1DataI.Text+' até '+FNotaSaidaParam.ME1DataF.Text;
      if Trim(FNotaSaidaParam.Ed1Vendedor.Text) <> '' Then
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Vendedor: '+FNotaSaidaParam.Ed1Vendedor.Text+' '
      else
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := 'Vendedor: Todos  ';
      If Trim(FNotaSaidaParam.ED1Fornecedor.Text) <> '' Then
         FRNota_MapaVenda.QRLFornecedor.Caption := 'Fornecedor: '+FNotaSaidaParam.ED1Fornecedor.Text+' '
      Else
         FRNota_MapaVenda.QRLFornecedor.Caption := 'Fornecedor: Todos ';
      if Trim(FNotaSaidaParam.Ed1Operacao.Text) <> '' Then
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := FRNota_MapaVenda.QRLVendedor_Oper.Caption + 'Operacao: '+FNotaSaidaParam.Ed1Operacao.Text+' '
      else
         FRNota_MapaVenda.QRLVendedor_Oper.Caption := FRNota_MapaVenda.QRLVendedor_Oper.Caption + 'Operacao: Todas Vendas  ';
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
         FRNota_MapaVenda.QRPrimario.Preview
      else
         FRNota_MapaVenda.QRPrimario.Print;
      QRMapaVenda.Close;
    end
    else // **** Resumido
    begin
      QRMapaVendaRes.Close;
      QRMapaVendaRes.SetVariable('DATA_I',FNotaSaidaParam.ME1DataI.Text);
      QRMapaVendaRes.SetVariable('DATA_F',FNotaSaidaParam.ME1DataF.Text);

      If Trim(FNotaSaidaParam.ME1Filial.Text)= ''   then
        QRMapaVendaRes.SetVariable('FILIAL',Null)
      Else
        QRMapaVendaRes.SetVariable('FILIAL',FNotaSaidaParam.ME1Filial.Text);

      If Trim(FNotaSaidaParam.ME1Vendedor.Text)= ''   then
        QRMapaVendaRes.SetVariable('VENDEDOR',Null)
      Else
        QRMapaVendaRes.SetVariable('VENDEDOR',FNotaSaidaParam.ME1Vendedor.Text);
      If Trim(FNotaSaidaParam.ME1VendedorPreposto.Text)= ''   then
        QRMapaVendaRes.SetVariable('VENDEDOR_PREPOSTO',Null)
      Else
        QRMapaVendaRes.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME1VendedorPreposto.Text);
      if Trim(FNotaSaidaParam.ME1Produto.Text)= ''   then
        QRMapaVendaRes.SetVariable('COD_PRODUTO',Null)
      else
        QRMapaVendaRes.SetVariable('COD_PRODUTO',FNotaSaidaParam.ME1Produto.Text);
      if Trim(FNotaSaidaParam.ME1Fornecedor.Text)= ''   then
        QRMapaVendaRes.SetVariable('FORNECEDOR',Null)
      else
        QRMapaVendaRes.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.ME1Fornecedor.Text));
      If Trim(FNotaSaidaParam.Me1Operacao.Text) <> '' then
       Begin
        QRMapaVendaRes.SetVariable('OPERACAO',Null);
        QRMapaVendaRes.SetVariable('COD_OPERACAO',FNotaSaidaParam.Me1Operacao.Text);
       end
      else
      begin
        QRMapaVendaRes.SetVariable('OPERACAO','V');
        QRMapaVendaRes.SetVariable('COD_OPERACAO',Null);
      end;
      Case FNotaSaidaParam.RgProducao.ItemIndex of
        0 : QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO','PROPRIA');
        1 : QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO','TERCEIROS');
        2 : QRMapaVendaRes.SetVariable('IND_TIPO_PRODUCAO',Null);
      End;
      Case FNotaSaidaParam.Rg1TipoPagto.ItemIndex of
        0 : QRMapaVendaRes.SetVariable('TIPO_PAGTO','1');
        1 : QRMapaVendaRes.SetVariable('TIPO_PAGTO','2');
        2 : QRMapaVendaRes.SetVariable('TIPO_PAGTO','3');
        3 : QRMapaVendaRes.SetVariable('TIPO_PAGTO',Null);
      End;

      QRMapaVendaRes.Open;
      if FRNota_MapaVendaRes = Nil then
        FRNota_MapaVendaRes := TFRNota_MapaVendaRes.Create(Application);
      FRNota_MapaVendaRes.QRLTitulo.Caption := 'Mapa de Vendas de '+FNotaSaidaParam.ME1DataI.Text+' até '+FNotaSaidaParam.ME1DataF.Text;
      if Trim(FNotaSaidaParam.Ed1Vendedor.Text) <> '' Then
         FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := 'Vendedor: '+FNotaSaidaParam.Ed1Vendedor.Text+' '
      else
         FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := 'Vendedor: Todos  ';
      If Trim(FNotaSaidaParam.Ed1Operacao.Text) <> '' Then
         FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := FRNota_MapaVendaRes.QRLVendedor_Oper.Caption + 'Operacao: '+FNotaSaidaParam.Ed1Operacao.Text+' '
      Else
         FRNota_MapaVendaRes.QRLVendedor_Oper.Caption := FRNota_MapaVendaRes.QRLVendedor_Oper.Caption + 'Operacao: Todas Vendas  ';
      If Trim(FNotaSaidaParam.ED1Fornecedor.Text) <> '' Then
         FRNota_MapaVendaRes.QRLFornecedor.Caption := 'Fornecedor: '+FNotaSaidaParam.ED1Fornecedor.Text+' '
      Else
         FRNota_MapaVendaRes.QRLFornecedor.Caption := 'Fornecedor: Todos ';
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRNota_MapaVendaRes.QRPrimario.Preview
      else
        FRNota_MapaVendaRes.QRPrimario.Print;
      QRMapaVendaRes.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.VendedoreCondPgto1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[2].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME2Filial.Text),'VENDA');
    QRVendedorPgto.Close;
    QRVendedorPgto.SetVariable('DATA_I',FNotaSaidaParam.ME2DataI.Text);
    QRVendedorPgto.SetVariable('DATA_F',FNotaSaidaParam.ME2DataF.Text);

    If Trim(FNotaSaidaParam.ME2Filial.Text)= ''   then
      QRVendedorPgto.SetVariable('FILIAL',Null)
    Else
      QRVendedorPgto.SetVariable('FILIAL',FNotaSaidaParam.ME2Filial.Text);

    If Trim(FNotaSaidaParam.ME2Vendedor.Text)= ''   then
      QRVendedorPgto.SetVariable('VENDEDOR',Null)
    Else
      QRVendedorPgto.SetVariable('VENDEDOR',FNotaSaidaParam.ME2Vendedor.Text);
    If Trim(FNotaSaidaParam.ME2VendedorPreposto.Text)= ''   then
      QRVendedorPgto.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendedorPgto.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME2VendedorPreposto.Text);
    QRVendedorPgto.Open;
    If FRNota_VendedorPgto = Nil then
      FRNota_VendedorPgto := TFRNota_VendedorPgto.Create(Application);
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_VendedorPgto.QRPrimario.Preview
    Else
       FRNota_VendedorPgto.QRPrimario.Print;
    QRVendedorPgto.Close;
  End;
end;

procedure TFNotaSaidaCad.MovMercadoria1Click(Sender: TObject);
Var
  wstrS : String;
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[3].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME3Filial.Text),'VENDA');
    QRMovMercadoria.Close;
    QRMovMercadoria.SetVariable('DATA_I',FNotaSaidaParam.ME3DataI.Text);
    QRMovMercadoria.SetVariable('DATA_F',FNotaSaidaParam.ME3DataF.Text);

    If Trim(FNotaSaidaParam.ME3Filial.Text)= ''   then
      QRMovMercadoria.SetVariable('FILIAL',Null)
    Else
      QRMovMercadoria.SetVariable('FILIAL',FNotaSaidaParam.ME3Filial.Text);

    If Trim(FNotaSaidaParam.ME3Cadastro.Text)= ''   then
      QRMovMercadoria.SetVariable('CADASTRO',Null)
    Else
      QRMovMercadoria.SetVariable('CADASTRO',FNotaSaidaParam.ME3Cadastro.Text);

    If Trim(FNotaSaidaParam.ME3Operacao.Text)= ''   then
      QRMovMercadoria.SetVariable('OPERACAO',Null)
    Else
      QRMovMercadoria.SetVariable('OPERACAO',FNotaSaidaParam.ME3Operacao.Text);
    If Trim(FNotaSaidaParam.ME3Produto.Text)= ''   then
      QRMovMercadoria.SetVariable('COD_PRODUTO',Null)
    Else
      QRMovMercadoria.SetVariable('COD_PRODUTO',FNotaSaidaParam.ME3Produto.Text);
    if Trim(FNotaSaidaParam.ME3Fornecedor.Text)= ''   then
      QRMovMercadoria.SetVariable('FORNECEDOR',Null)
    else
      QRMovMercadoria.SetVariable('FORNECEDOR',Trim(FNotaSaidaParam.ME3Fornecedor.Text));
    if Trim(FNotaSaidaParam.ME3Vendedor.Text)= ''   then
      QRMovMercadoria.SetVariable('VENDEDOR',Null)
    else
      QRMovMercadoria.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.ME3Vendedor.Text));

    Case FNotaSaidaParam.Rg3TipoNota.ItemIndex of
       0 : QRMovMercadoria.SetVariable('ENTRADA_SAIDA','E');
       1 : QRMovMercadoria.SetVariable('ENTRADA_SAIDA','S');
       2 : QRMovMercadoria.SetVariable('ENTRADA_SAIDA',Null);
    End;
    Case FNotaSaidaParam.RG3CondicaoPagto.ItemIndex of
       0 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO','1');
       1 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO','2');
       2 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO','3');
       3 : QRMovMercadoria.SetVariable('CONDICAO_PAGTO',Null);
    End;
    QRMovMercadoria.SQL[QRMovMercadoria.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.Rg3Ordem.ItemIndex of
      0:QRMovMercadoria.SQL.Add('ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.NUM_NOTA');
      1:QRMovMercadoria.SQL.Add('ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.DT_EMISSAO');
    End;
    QRMovMercadoria.Open;
    If FRNota_MovMercadoria = Nil then
      FRNota_MovMercadoria := TFRNota_MovMercadoria.Create(Application);
    wstrS := '';
    If(Trim(FNotaSaidaParam.ME3Filial.Text)<>'')Then
      wstrS := 'Filial: ' + Trim(FNotaSaidaParam.ME3Filial.Text)+' '+Trim(FNotaSaidaParam.Ed3Filial.Text)
    Else
      wstrS := 'Filial: Todas';
    wstrS := wstrS + ' De '+FNotaSaidaParam.ME3DataI.Text+' Até '+FNotaSaidaParam.ME3DataF.Text;
    FRNota_MovMercadoria.QRLPeriodo.Caption := wstrS;
    wstrS := '';
    If(Trim(FNotaSaidaParam.ME3Fornecedor.Text)<>'')Then
      wstrS := 'Fornecedor: ' + Trim(FNotaSaidaParam.ME3Fornecedor.Text) + ' ' + Trim(FNotaSaidaParam.Ed3Fornecedor.Text)
    Else
      wstrS := 'Fornecedor: Todos';
    If(FNotaSaidaParam.ME3Vendedor.Text <> '')Then
      wstrS := wstrS + ' - Vendedor: ' + Trim(FNotaSaidaParam.ME3Vendedor.Text) + ' ' + Trim(FNotaSaidaParam.Ed3Vendedor.Text)
    Else
      wstrS := wstrS + 'Vendedor: Todos';
    FRNota_MovMercadoria.QrlFornecedor.Caption := wstrS;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_MovMercadoria.QRPrimario.Preview
    Else
      FRNota_MovMercadoria.QRPrimario.Print;
    QRMovMercadoria.Close;
  End;
end;

procedure TFNotaSaidaCad.ClientessemCompras1Click(Sender: TObject);
var
  wSql: String;
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[4].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.Me4Filial.Text),'VENDA');
    QRClienteSemCompra.Close;
    QRClienteSemCompra.SetVariable('DATA_I',Date-StrToFloat(FNotaSaidaParam.ME4Dias.Text));
    QRClienteSemCompra.SetVariable('DATA_F',Date);
    If Trim(FNotaSaidaParam.Me4Filial.Text)= ''   then
      QRClienteSemCompra.SetVariable('FILIAL',Null)
    Else
      QRClienteSemCompra.SetVariable('FILIAL',FNotaSaidaParam.Me4Filial.Text);
    If Trim(FNotaSaidaParam.Me4Cod_Vendedor.Text)= ''   then
      QRClienteSemCompra.SetVariable('COD_VENDEDOR',Null)
    Else
      QRClienteSemCompra.SetVariable('COD_VENDEDOR',FNotaSaidaParam.Me4Cod_Vendedor.Text);
    If Trim(FNotaSaidaParam.Me4TipoCadastro.Text)= ''   then
      QRClienteSemCompra.SetVariable('TIPO_CADASTRO',Null)
    Else
      QRClienteSemCompra.SetVariable('TIPO_CADASTRO',FNotaSaidaParam.Me4TipoCadastro.Text);
    If Trim(FNotaSaidaParam.Me4ClassCadastro.Text)= ''   then
      QRClienteSemCompra.SetVariable('CLASS_CADASTRO',Null)
    Else
      QRClienteSemCompra.SetVariable('CLASS_CADASTRO',FNotaSaidaParam.Me4ClassCadastro.Text);
    If Trim(FNotaSaidaParam.Me4Classe.Text)= ''   then
      QRClienteSemCompra.SetVariable('COD_CLASSE',Null)
    Else
      QRClienteSemCompra.SetVariable('COD_CLASSE',FNotaSaidaParam.Me4Classe.Text);
    If Trim(FNotaSaidaParam.Me4Cidade.Text)= ''   then
      QRClienteSemCompra.SetVariable('CIDADE',Null)
    Else
      QRClienteSemCompra.SetVariable('CIDADE',FNotaSaidaParam.Me4Cidade.Text);
    QRClienteSemCompra.Open;

    case(FNotaSaidaParam.RG4Cadastro.ItemIndex) of
      0:
      wSql:= 'SELECT Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO, '    +
             '  Tb_cadastro.NUM_CGC_CPF, Tb_cadastro.DESC_CIDADE, Tb_cadastro.COD_ESTADO, '     +
             '  Tb_cadastro.DESC_TELEFONE,Tb_cadastro.Cod_Cidade '                              +
             'FROM'                                                                             +
             '  TB_CADASTRO '                                                                   +
             ' WHERE '                                                                          +
             ' (:CLASS_CADASTRO IS NULL OR :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'   +
             ' AND (:COD_VENDEDOR IS NULL OR :COD_VENDEDOR = TB_CADASTRO.COD_VENDEDOR)'         +
             ' AND (:TIPO_CADASTRO IS NULL OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'  +
             ' AND (:CIDADE IS NULL OR TB_CADASTRO.COD_CIDADE = :CIDADE)'                       +
             ' AND cod_cadastro NOT in'                                                         +
             ' (SELECT distinct TB_NOTA_CAB.COD_CADASTRO FROM'                                  +
             ' TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO'                                             +
             ' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_ITEM'                     +
             ' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND'                       +
             ' TB_NOTA_CAB.IND_SITUACAO = '+CHR(39)+'2'+CHR(39)+' AND (:FILIAL IS NULL OR'      +
             ' TB_NOTA_CAB.COD_FILIAL = :FILIAL) AND (:COD_CLASSE IS NULL  OR '                 +
             ' TB_PRODUTO.COD_CLASSE = :COD_CLASSE) AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I ' +
             ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F )'                                     +
             ' AND (TB_CADASTRO.DT_CANCELAMENTO IS NULL) AND (TB_CADASTRO.COD_MOTIVO IS NULL)';

      1:
      wSql:= 'SELECT Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO, '    +
             '  Tb_cadastro.NUM_CGC_CPF, Tb_cadastro.DESC_CIDADE, Tb_cadastro.COD_ESTADO, '     +
             '  Tb_cadastro.DESC_TELEFONE,Tb_cadastro.Cod_Cidade  '                             +
             'FROM'                                                                             +
             '  TB_CADASTRO '                                                                   +
             ' WHERE '                                                                          +
             ' (:CLASS_CADASTRO IS NULL OR :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'   +
             ' AND (:COD_VENDEDOR IS NULL OR :COD_VENDEDOR = TB_CADASTRO.COD_VENDEDOR)'         +
             ' AND (:TIPO_CADASTRO IS NULL OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'  +
             ' AND (:CIDADE IS NULL OR TB_CADASTRO.COD_CIDADE = :CIDADE)'                       +
             ' AND cod_cadastro NOT in'                                                         +
             ' (SELECT distinct TB_NOTA_CAB.COD_CADASTRO FROM'                                  +
             ' TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO'                                             +
             ' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_ITEM'                     +
             ' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND'                       +
             ' TB_NOTA_CAB.IND_SITUACAO = '+CHR(39)+'2'+CHR(39)+' AND (:FILIAL IS NULL OR'      +
             ' TB_NOTA_CAB.COD_FILIAL = :FILIAL) AND (:COD_CLASSE IS NULL  OR '                 +
             ' TB_PRODUTO.COD_CLASSE = :COD_CLASSE) AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I ' +
             ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F )'                                     +
             ' AND NOT(TB_CADASTRO.DT_CANCELAMENTO IS NULL) OR NOT(TB_CADASTRO.COD_MOTIVO IS NULL)';

      2:
      wSql:= 'SELECT Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME,Tb_cadastro.DESC_ENDERECO, '    +
             '  Tb_cadastro.NUM_CGC_CPF, Tb_cadastro.DESC_CIDADE, Tb_cadastro.COD_ESTADO, '     +
             '  Tb_cadastro.DESC_TELEFONE,Tb_cadastro.Cod_Cidade '                              +
             'FROM'                                                                             +
             '  TB_CADASTRO '                                                                   +
             ' WHERE '                                                                          +
             ' (:CLASS_CADASTRO IS NULL OR :CLASS_CADASTRO = TB_CADASTRO.COD_CLASS_CADASTRO)'   +
             ' AND (:COD_VENDEDOR IS NULL OR :COD_VENDEDOR = TB_CADASTRO.COD_VENDEDOR)'         +
             ' AND (:TIPO_CADASTRO IS NULL OR :TIPO_CADASTRO = TB_CADASTRO.COD_TIPO_CADASTRO)'  +
             ' AND (:CIDADE IS NULL OR TB_CADASTRO.COD_CIDADE = :CIDADE)'                       +
             ' AND cod_cadastro NOT in'                                                         +
             ' (SELECT distinct TB_NOTA_CAB.COD_CADASTRO FROM'                                  +
             ' TB_NOTA_CAB,TB_NOTA_ITEM,TB_PRODUTO'                                             +
             ' WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_NOTA_ITEM.COD_NOTA_ITEM'                     +
             ' AND TB_NOTA_ITEM.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO AND'                       +
             ' TB_NOTA_CAB.IND_SITUACAO = '+CHR(39)+'2'+CHR(39)+' AND (:FILIAL IS NULL OR'      +
             ' TB_NOTA_CAB.COD_FILIAL = :FILIAL) AND (:COD_CLASSE IS NULL  OR '                 +
             ' TB_PRODUTO.COD_CLASSE = :COD_CLASSE) AND TB_NOTA_CAB.DT_RECEBIMENTO >= :DATA_I ' +
             ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= :DATA_F )';
    end;
    QRClienteSemCompra.SQL.Clear;
    QRClienteSemCompra.SQL.Add(wSql);

    If FRNota_ClienteSemCompra = Nil then
       FRNota_ClienteSemCompra := TFRNota_ClienteSemCompra.Create(Application);
    FRNota_ClienteSemCompra.QRLTitulo.Caption := 'Clientes que não compra a '+FNotaSaidaParam.ME4Dias.Text+' dias '+DateToStr(Date);
    FRNota_ClienteSemCompra.QRLVendedor.Caption := 'Vendedor:'+FNotaSaidaParam.Ed4Vendedor.Text+' Classe:'+FNotaSaidaParam.Ed4Classe.Text;
    FRNota_ClienteSemCompra.QRLTipoCadastro.Caption := 'Tipo de Cadastro :'+FNotaSaidaParam.Ed4TipoCadastro.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ClienteSemCompra.QRPrimario.Preview
    Else
      FRNota_ClienteSemCompra.QRPrimario.Print;
    QRClienteSemCompra.Close;
  End;
end;

procedure TFNotaSaidaCad.VendasporOperacao1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[5].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME5Filial.Text),'VENDA');
    QRVendaOperacao.Close;
    QRVendaOperacao.SetVariable('DATA_I',FNotaSaidaParam.ME5DataI.Text);
    QRVendaOperacao.SetVariable('DATA_F',FNotaSaidaParam.ME5DataF.Text);

    If Trim(FNotaSaidaParam.ME5Filial.Text)= ''   then
      QRVendaOperacao.SetVariable('FILIAL',Null)
    Else
      QRVendaOperacao.SetVariable('FILIAL',FNotaSaidaParam.ME5Filial.Text);

    If Trim(FNotaSaidaParam.ME5Vendedor.Text)= ''   then
      QRVendaOperacao.SetVariable('VENDEDOR',Null)
    Else
      QRVendaOperacao.SetVariable('VENDEDOR',FNotaSaidaParam.ME5Vendedor.Text);

    If Trim(FNotaSaidaParam.ME5VendedorPreposto.Text)= ''   then
      QRVendaOperacao.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendaOperacao.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME5VendedorPreposto.Text);

    If Trim(FNotaSaidaParam.ME5Operacao.Text)= ''   then
      QRVendaOperacao.SetVariable('OPERACAO',Null)
    Else
      QRVendaOperacao.SetVariable('OPERACAO',FNotaSaidaParam.ME5Operacao.Text);
    QRVendaOperacao.Open;
    If FRNota_Operacao = Nil then
      FRNota_Operacao := TFRNota_Operacao.Create(Application);

    FRNota_Operacao.QRLTitulo.Caption := 'Vendas por Operacao de '+ FNotaSaidaParam.ME5DataI.Text+' até '+FNotaSaidaParam.ME5DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_Operacao.QRPrimario.Preview
    Else
      FRNota_Operacao.QRPrimario.Print;
    QRVendaOperacao.Close;
  End;
end;

procedure TFNotaSaidaCad.MovportipodeDocumento1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[6].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME6Filial.Text),'VENDA');
    QRTipoDocumento.Close;
    QRTipoDocumento.SetVariable('DATA_I',FNotaSaidaParam.ME6DataI.Text);
    QRTipoDocumento.SetVariable('DATA_F',FNotaSaidaParam.ME6DataF.Text);

    If Trim(FNotaSaidaParam.ME6Filial.Text)= ''   then
      QRTipoDocumento.SetVariable('FILIAL',Null)
    Else
      QRTipoDocumento.SetVariable('FILIAL',FNotaSaidaParam.ME6Filial.Text);

    If Trim(FNotaSaidaParam.ME6Serie.Text)= ''   then
      QRTipoDocumento.SetVariable('SERIE',Null)
    Else
      QRTipoDocumento.SetVariable('SERIE',FNotaSaidaParam.ME6Serie.Text);
    QRTipoDocumento.Open;
    If FRNota_TipoDocumento = Nil then
      FRNota_TipoDocumento := TFRNota_TipoDocumento.Create(Application);

    FRNota_TipoDocumento.QRLTitulo.Caption := 'Mov. de Produtos por tipo de Documento de '+ FNotaSaidaParam.ME6DataI.Text+' até '+FNotaSaidaParam.ME6DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_TipoDocumento.QRPrimario.Preview
    Else
      FRNota_TipoDocumento.QRPrimario.Print;
    QRTipoDocumento.Close;
  End;
end;

procedure TFNotaSaidaCad.VendasporClasse1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[7].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME7Filial.Text),'VENDA');
    QRVendaClasse.Close;
    QRVendaClasse.SetVariable('DATA_I',FNotaSaidaParam.ME7DataI.Text);
    QRVendaClasse.SetVariable('DATA_F',FNotaSaidaParam.ME7DataF.Text);

    If Trim(FNotaSaidaParam.ME7Filial.Text)= ''   then
      QRVendaClasse.SetVariable('FILIAL',Null)
    Else
      QRVendaClasse.SetVariable('FILIAL',FNotaSaidaParam.ME7Filial.Text);

    If Trim(FNotaSaidaParam.ME7Classe.Text)= ''   then
      QRVendaClasse.SetVariable('CLASSE',Null)
    Else
      QRVendaClasse.SetVariable('CLASSE',FNotaSaidaParam.ME7Classe.Text);

    If Trim(FNotaSaidaParam.ME7Operacao.Text)= ''   then
      QRVendaClasse.SetVariable('OPERACAO',Null)
    Else
      QRVendaClasse.SetVariable('OPERACAO',FNotaSaidaParam.ME7Operacao.Text);

    If ( Trim(FNotaSaidaParam.ME7SubClasse.Text)= '' )
       or (Trim(FNotaSaidaParam.ME7SubClasse.Text)= '0')  then
      QRVendaClasse.SetVariable('SUB_CLASSE',Null)
    Else
      QRVendaClasse.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME7SubClasse.Text);

    If Trim(FNotaSaidaParam.ME7Vendedor.Text)= ''   then
      QRVendaClasse.SetVariable('VENDEDOR',Null)
    Else
      QRVendaClasse.SetVariable('VENDEDOR',FNotaSaidaParam.ME7Vendedor.Text);

    If Trim(FNotaSaidaParam.ME7Fabricante.Text)= ''   then
      QRVendaClasse.SetVariable('FABRICANTE',Null)
    Else
      QRVendaClasse.SetVariable('FABRICANTE',FNotaSaidaParam.ME7Fabricante.Text);

    QRVendaClasse.SQL[QRVendaClasse.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.CB7Ordem.ItemIndex of
      0:QRVendaClasse.SQL.Add('GROUP BY Tb_classe.DESC_CLASSE,Tb_produto.COD_PRODUTO,Tb_classe.NUM_CLASSE,Tb_classe.NUM_SUBCLASSE,Tb_produto.DESC_PRODUTO ORDER BY TB_CLASSE.NUM_CLASSE');
      1:QRVendaClasse.SQL.Add('GROUP BY Tb_classe.DESC_CLASSE,Tb_produto.DESC_PRODUTO,Tb_produto.COD_PRODUTO,Tb_classe.NUM_CLASSE,Tb_classe.NUM_SUBCLASSE ORDER BY TB_CLASSE.NUM_CLASSE');
    End;

    QRVendaClasse.Open;
    If FRNota_Classe = Nil then
      FRNota_Classe := TFRNota_Classe.Create(Application);
    FRNota_Classe.QRLTitulo.Caption := 'Vendas por classe e sub-classe de '+ FNotaSaidaParam.ME7DataI.Text+' até '+FNotaSaidaParam.ME7DataF.Text;
    FRNota_Classe.QRLFilial.Caption := FNotaSaidaParam.Ed7Filial.Text;
    if FNotaSaidaParam.RG7Tipo.ItemIndex = 1 then
    Begin
      FRNota_Classe.QRBand3.Enabled := False;
      FRNota_Classe.QRLabel7.Enabled := False;
      FRNota_Classe.QRGClasse.Expression := 'QRVendaClasse.NUM_CLASSE';
      FRNota_Classe.QRDBText4.Enabled := False;
      FRNota_Classe.QRDBText5.Enabled := False;
    end
    else
    Begin
      FRNota_Classe.QRBand3.Enabled := True;
      FRNota_Classe.QRLabel7.Enabled := True;
      FRNota_Classe.QRGClasse.Expression := 'QRVendaClasse.NUM_CLASSE+QRVendaClasse.NUM_SUBCLASSE';
      FRNota_Classe.QRDBText4.Enabled := True;
      FRNota_Classe.QRDBText5.Enabled := True;
    end;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_Classe.QRPrimario.Preview
    Else
      FRNota_Classe.QRPrimario.Print;
    QRVendaClasse.Close;
  End;
end;

procedure TFNotaSaidaCad.VendasporClasseeCondPagto1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[8].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME8Filial.Text),'VENDA');
    QRClassePgto.Close;
    QRClassePgtoVend.Close;
    QRClassePgto.SetVariable('DATA_I',FNotaSaidaParam.ME8DataI.Text);
    QRClassePgto.SetVariable('DATA_F',FNotaSaidaParam.ME8DataF.Text);
    QRClassePgtoVend.SetVariable('DATA_I',FNotaSaidaParam.ME8DataI.Text);
    QRClassePgtoVend.SetVariable('DATA_F',FNotaSaidaParam.ME8DataF.Text);

    If Trim(FNotaSaidaParam.ME8Filial.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('FILIAL',Null);
      QRClassePgtoVend.SetVariable('FILIAL',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('FILIAL',FNotaSaidaParam.ME8Filial.Text);
      QRClassePgtoVend.SetVariable('FILIAL',FNotaSaidaParam.ME8Filial.Text)
    end;

    If Trim(FNotaSaidaParam.ME8Classe.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('CLASSE',Null);
      QRClassePgtoVend.SetVariable('CLASSE',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('CLASSE',FNotaSaidaParam.ME8Classe.Text);
      QRClassePgtoVend.SetVariable('CLASSE',FNotaSaidaParam.ME8Classe.Text)
    End;

    If ( Trim(FNotaSaidaParam.ME8SubClasse.Text)= '' )
       or (Trim(FNotaSaidaParam.ME8SubClasse.Text)= '0')  then
    Begin
      QRClassePgto.SetVariable('SUB_CLASSE',Null);
      QRClassePgtoVend.SetVariable('SUB_CLASSE',Null)
    End
    Else
    Begin
      QRClassePgto.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME8SubClasse.Text);
      QRClassePgtoVend.SetVariable('SUB_CLASSE',FNotaSaidaParam.ME8SubClasse.Text)
    End;

    If Trim(FNotaSaidaParam.ME8Vendedor.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('VENDEDOR',Null);
      QRClassePgtoVend.SetVariable('VENDEDOR',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('VENDEDOR',FNotaSaidaParam.ME8Vendedor.Text);
      QRClassePgtoVend.SetVariable('VENDEDOR',FNotaSaidaParam.ME8Vendedor.Text)
    End;

    If Trim(FNotaSaidaParam.ME8VendedorPreposto.Text)= ''   then
    Begin
      QRClassePgto.SetVariable('VENDEDOR_PREPOSTO',Null);
      QRClassePgtoVend.SetVariable('VENDEDOR_PREPOSTO',Null)
    end
    Else
    Begin
      QRClassePgto.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME8VendedorPreposto.Text);
      QRClassePgtoVend.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME8VendedorPreposto.Text)
    End;

    QRClassePgto.Open;
    QRClassePgtoVend.Open;
    If FRNota_ClassePgto = Nil then
      FRNota_ClassePgto := TFRNota_ClassePgto.Create(Application);

    If FRNota_ClassePgtoVend = Nil then
      FRNota_ClassePgtoVend := TFRNota_ClassePgtoVend.Create(Application);

    FRNota_ClassePgto.QRLTitulo.Caption := 'Vendas por classe e Tipo de Pagamento '+ FNotaSaidaParam.ME8DataI.Text+' até '+FNotaSaidaParam.ME8DataF.Text;
    FRNota_ClassePgtoVend.QRLTitulo.Caption := 'Vendas por classe e Tipo de Pagamento '+ FNotaSaidaParam.ME8DataI.Text+' até '+FNotaSaidaParam.ME8DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ClassePgtoVend.QRCompositeReport1.Preview
    Else
      FRNota_ClassePgtoVend.QRCompositeReport1.Print;
    QRClassePgto.Close;
    QRClassePgtoVend.Close;
  End;
end;

procedure TFNotaSaidaCad.MovEstoqueES1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[9].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario(Trim(FNotaSaidaParam.ME9Filial.Text),'VENDA');
    QRMovEntradaSaida.Close;
    QRMovEntradaSaida.SetVariable('DATA_I',FNotaSaidaParam.ME9DataI.Text);
    QRMovEntradaSaida.SetVariable('DATA_F',FNotaSaidaParam.ME9DataF.Text);
    pFilial := 0;  // serve para calcular o estoque do produto para o relatorio  quando zeros soma o estoque de todas filiais
    If Trim(FNotaSaidaParam.ME9Filial.Text)= ''   then
      QRMovEntradaSaida.SetVariable('FILIAL',Null)
    Else
      Begin
        QRMovEntradaSaida.SetVariable('FILIAL',FNotaSaidaParam.ME9Filial.Text);
        pFilial := StrToInt(Trim(FNotaSaidaParam.ME9Filial.Text));
      End;

    If Trim(FNotaSaidaParam.ME9Produto.Text)= ''   then
      QRMovEntradaSaida.SetVariable('PRODUTO',Null)
    Else
      QRMovEntradaSaida.SetVariable('PRODUTO',FNotaSaidaParam.ME9Produto.Text);

    If Trim(FNotaSaidaParam.ME9Lote.Text)= ''   then
      QRMovEntradaSaida.SetVariable('LOTE',Null)
    Else
      QRMovEntradaSaida.SetVariable('LOTE',FNotaSaidaParam.ME9Lote.Text);

    If Trim(FNotaSaidaParam.ME9Operacao.Text)= ''   then
      QRMovEntradaSaida.SetVariable('OPERACAO',Null)
    Else
      QRMovEntradaSaida.SetVariable('OPERACAO',FNotaSaidaParam.ME9Operacao.Text);

{aqui foi descomentado}
    If Trim(FNotaSaidaParam.ME9Operacao1.Text)= ''   then
      QRMovEntradaSaida.SetVariable('OPERACAO1',Null)
    Else
     QRMovEntradaSaida.SetVariable('OPERACAO1',FNotaSaidaParam.ME9Operacao1.Text);
//------
    QRMovEntradaSaida.SQL[QRMovEntradaSaida.SQL.Count-1]:='';  // elimina a última Linha da SQL
    If FNotaSaidaParam.Rg9Ordem.ItemIndex = 0 Then
       QRMovEntradaSaida.Sql.Add('GROUP BY TB_PRODUTO.COD_PRODUTO,TB_PRODUTO.DESC_PRODUTO,TB_LOTE_TIPO.DESC_LOTE,TB_LOTE_TIPO.COD_LOTE_TIPO ORDER BY TB_PRODUTO.COD_PRODUTO')
    Else
       QRMovEntradaSaida.Sql.Add('GROUP BY TB_PRODUTO.DESC_PRODUTO,TB_PRODUTO.COD_PRODUTO,TB_LOTE_TIPO.DESC_LOTE,TB_LOTE_TIPO.COD_LOTE_TIPO ORDER BY TB_PRODUTO.DESC_PRODUTO');
    QRMovEntradaSaida.Open;
    If FRNota_EntradaSaida = Nil then
      FRNota_EntradaSaida := TFRNota_EntradaSaida.Create(Application);
    FRNota_EntradaSaida.QRLTitulo.Caption := 'Movimentação de Estoque '+ FNotaSaidaParam.ME9DataI.Text+' até '+FNotaSaidaParam.ME9DataF.Text;
    FRNota_EntradaSaida.QRLFilial.Caption := 'Filial:'+Trim(FNotaSaidaParam.ME9Filial.Text)+' - '+Trim(FNotaSaidaParam.Ed9Filial.Text);
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_EntradaSaida.QRPrimario.Preview
    Else
      FRNota_EntradaSaida.QRPrimario.Print;
    QRMovEntradaSaida.Close;
  End;
end;

procedure TFNotaSaidaCad.PrazosdeVenda1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[11].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME11Filial.Text),'VENDA');
    QRPrazoVenda.Close;
    QRPrazoVenda.SetVariable('DATA_I',FNotaSaidaParam.ME11DataI.Text);
    QRPrazoVenda.SetVariable('DATA_F',FNotaSaidaParam.ME11DataF.Text);
    QRPrazoVenda.SetVariable('PRAZO1',FNotaSaidaParam.ME11Prazo1.Text);
    QRPrazoVenda.SetVariable('PRAZO2',FNotaSaidaParam.ME11Prazo2.Text);
    QRPrazoVenda.SetVariable('PRAZO3',FNotaSaidaParam.ME11Prazo3.Text);
    QRPrazoVenda.SetVariable('PRAZO4',FNotaSaidaParam.ME11Prazo4.Text);
    QRPrazoVenda.SetVariable('PRAZO5',FNotaSaidaParam.ME11Prazo4.Text);
    QRPrazoVenda.SetVariable('PRAZO6',FNotaSaidaParam.ME11Prazo4.Text);
    If Trim(FNotaSaidaParam.ME11Filial.Text)= ''   then
      QRPrazoVenda.SetVariable('FILIAL',Null)
    Else
      QRPrazoVenda.SetVariable('FILIAL',FNotaSaidaParam.ME11Filial.Text);
    QRPrazoVenda.Open;
    If FRNota_PrazoVenda = Nil then
      FRNota_PrazoVenda := TFRNota_PrazoVenda.Create(Application);
    FRNota_PrazoVenda.QRLTitulo.Caption := 'Vendas por Prazo de '+ FNotaSaidaParam.ME11DataI.Text+' até '+FNotaSaidaParam.ME11DataF.Text;
    FRNota_PrazoVenda.QRLPrazo1.Caption := 'Até '+FNotaSaidaParam.ME11Prazo1.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo2.Caption := 'Até '+FNotaSaidaParam.ME11Prazo2.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo3.Caption := 'Até '+FNotaSaidaParam.ME11Prazo3.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo4.Caption := 'Até '+FNotaSaidaParam.ME11Prazo4.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo5.Caption := 'Até '+FNotaSaidaParam.ME11Prazo5.Text+'d.';
    FRNota_PrazoVenda.QRLPrazo6.Caption := 'Até '+FNotaSaidaParam.ME11Prazo6.Text+'d.';
    FRNota_PrazoVenda.QRLLongoPrazo.Caption := '+ de '+FNotaSaidaParam.ME11Prazo4.Text+'d.';

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_PrazoVenda.QRPrimario.Preview
    Else
      FRNota_PrazoVenda.QRPrimario.Print;
    QRPrazoVenda.Close;
  End;
end;

procedure TFNotaSaidaCad.VendedorPreoMdio1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[12].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME12Filial.Text),'VENDA');
    QRVendedorCMedio.Close;
    QRVendedorCMedio.SetVariable('DATA_I',FNotaSaidaParam.ME12DataI.Text);
    QRVendedorCMedio.SetVariable('DATA_F',FNotaSaidaParam.ME12DataF.Text);


    If Trim(FNotaSaidaParam.ME12Filial.Text)= ''   then
      QRVendedorCMedio.SetVariable('FILIAL',Null)
    Else
      QRVendedorCMedio.SetVariable('FILIAL',FNotaSaidaParam.ME12Filial.Text);

    If Trim(FNotaSaidaParam.ME12Vendedor.Text)= ''   then
      QRVendedorCMedio.SetVariable('VENDEDOR',Null)
    Else
      QRVendedorCMedio.SetVariable('VENDEDOR',FNotaSaidaParam.ME12Vendedor.Text);
    If Trim(FNotaSaidaParam.ME12Cadastro.Text)= ''   then
      QRVendedorCMedio.SetVariable('COD_CADASTRO',Null)
    Else
      QRVendedorCMedio.SetVariable('COD_CADASTRO',FNotaSaidaParam.ME12Cadastro.Text);

    If Trim(FNotaSaidaParam.ME12Operacao.Text)= ''   then
      QRVendedorCMedio.SetVariable('OPERACAO',Null)
    Else
      QRVendedorCMedio.SetVariable('OPERACAO',FNotaSaidaParam.ME12Operacao.Text);
    QRVendedorCMedio.Open;

    If FRNota_VendedorCMedio = Nil then
      FRNota_VendedorCMedio := TFRNota_VendedorCMedio.Create(Application);

    FRNota_VendedorCMedio.QRLTitulo.Caption := 'Vendas por Vendedor/Custo Médio de '+ FNotaSaidaParam.ME12DataI.Text+' até '+FNotaSaidaParam.ME12DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_VendedorCMedio.QRPrimario.Preview
    Else
      FRNota_VendedorCMedio.QRPrimario.Print;
   QRVendedorCMedio.Close;
  End;
end;

procedure TFNotaSaidaCad.QRGVendedorCMedioAddReports(Sender: TObject);
begin
  inherited;
  QRGVendedorCMedio.Reports.Add(FRNota_VendedorCMedio.QRPrimario);
  QRGVendedorCMedio.Reports.Add(FRNota_VendedorCMedio2.QRPrimario);
end;

procedure TFNotaSaidaCad.Secretaria1Click(Sender: TObject);
Var wClasse_I,wClasse_F : String;
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[13].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME13Filial.Text),'VENDA');
    QRSecretaria.Close;
    QRSecretaria.SetVariable('DATA_I_PRI','01/01/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_PRI','31/03/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_I_SEG','01/04/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_SEG','30/06/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_I_TER','01/07/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_TER','30/09/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_I_QUA','01/10/'+Trim(FNotaSaidaParam.ME13ANO.Text));
    QRSecretaria.SetVariable('DATA_F_QUA','31/12/'+Trim(FNotaSaidaParam.ME13ANO.Text));

    wClasse_I :=  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13ClasseI.Text)) +
                  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13SubClasseI.Text));

    wClasse_F :=  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13ClasseF.Text)) +
                  FormatFloat('000',StrToFloat(FNotaSaidaParam.ME13SubClasseF.Text));

    If Trim(FNotaSaidaParam.ME13Filial.Text)= ''   then
      QRSecretaria.SetVariable('FILIAL',Null)
    Else
      QRSecretaria.SetVariable('FILIAL',FNotaSaidaParam.ME13Filial.Text);

    If Trim(FNotaSaidaParam.ME13ClasseI.Text)= '' then
      QRSecretaria.SetVariable('CLASSE_I',Null)
    Else
      QRSecretaria.SetVariable('CLASSE_I',wClasse_I);

    if Trim(FNotaSaidaParam.ME13ClasseF.Text)= '' then
      QRSecretaria.SetVariable('CLASSE_F',Null)
    Else
      QRSecretaria.SetVariable('CLASSE_F',wClasse_F);

    QRSecretaria.Open;
    If FRNota_Secretaria = Nil then
      FRNota_Secretaria := TFRNota_Secretaria.Create(Application);

    FRNota_Secretaria.QRLFilial.Caption := FNotaSaidaParam.Ed13Filial.Text;
    FRNota_Secretaria.QRLMunicipio.Caption := DMOracle.BuscaNome('SELECT DESC_CIDADE FROM TB_FILIAL','COD_FILIAL = '+Trim(FNotaSaidaParam.ME13Filial.Text));;
    FRNota_Secretaria.QRLAno.Caption := FNotaSaidaParam.Me13Ano.Text;
    FRNota_Secretaria.QRLResponsavel.Caption := FNotaSaidaParam.Ed13NomeResponsavel.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_Secretaria.QRPrimario.Preview
    else
       FRNota_Secretaria.QRPrimario.Preview;
    QRSecretaria.Close;
  End;
end;

procedure TFNotaSaidaCad.VendedorQuota1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[12].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME12Filial.Text),'VENDA');
    QRVendedorCMedio2.Close;
    QRVendedorCMedio2.SetVariable('DATA_I',FNotaSaidaParam.ME12DataI.Text);
    QRVendedorCMedio2.SetVariable('DATA_F',FNotaSaidaParam.ME12DataF.Text);

    If Trim(FNotaSaidaParam.ME12Filial.Text)= ''   then
      QRVendedorCMedio2.SetVariable('FILIAL',Null)
    Else
      QRVendedorCMedio2.SetVariable('FILIAL',FNotaSaidaParam.ME12Filial.Text);

    If Trim(FNotaSaidaParam.ME12Vendedor.Text)= ''   then
      QRVendedorCMedio2.SetVariable('VENDEDOR',Null)
    Else
      QRVendedorCMedio2.SetVariable('VENDEDOR',FNotaSaidaParam.ME12Vendedor.Text);
    If Trim(FNotaSaidaParam.ME12Cadastro.Text)= ''   then
      QRVendedorCMedio2.SetVariable('COD_CADASTRO',Null)
    Else
      QRVendedorCMedio2.SetVariable('COD_CADASTRO',FNotaSaidaParam.ME12Cadastro.Text);

    If Trim(FNotaSaidaParam.ME12Operacao.Text)= ''   then
      QRVendedorCMedio2.SetVariable('OPERACAO',Null)
    Else
      QRVendedorCMedio2.SetVariable('OPERACAO',FNotaSaidaParam.ME12Operacao.Text);

    QRVendedorCMedio2.Open;

    If FRNota_VendedorCMedio2 = Nil then
      FRNota_VendedorCMedio2 := TFRNota_VendedorCMedio2.Create(Application);

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_VendedorCMedio2.QRPrimario.Preview
    Else
      FRNota_VendedorCMedio2.QRPrimario.Print;
   QRVendedorCMedio2.Close;
  End;
end;

procedure TFNotaSaidaCad.Inadimplncia1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[15].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME15Filial.Text),'VENDA');
    QRInadimplencia.Close;
    If Trim(FNotaSaidaParam.ME15DataI.Text) <> '' Then
      QRInadimplencia.SetVariable('DATA_I',FNotaSaidaParam.ME15DataI.Text);
    If Trim(FNotaSaidaParam.ME15DataF.Text) <> '' Then
      QRInadimplencia.SetVariable('DATA_F',FNotaSaidaParam.ME15DataF.Text);
    if Trim(FNotaSaidaParam.ME15Filial.Text)= ''   then
      QRInadimplencia.SetVariable('FILIAL',Null)
    else
      QRInadimplencia.SetVariable('FILIAL',FNotaSaidaParam.ME15Filial.Text);
    if Trim(FNotaSaidaParam.ME15Vendedor.Text)= ''   then
      QRInadimplencia.SetVariable('VENDEDOR',Null)
    else
      QRInadimplencia.SetVariable('VENDEDOR',FNotaSaidaParam.ME15Vendedor.Text);
    if Trim(FNotaSaidaParam.ME15VendedorPreposto.Text)= ''   then
      QRInadimplencia.SetVariable('VENDEDOR_PREPOSTO',Null)
    else
      QRInadimplencia.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME15VendedorPreposto.Text);
    Case FNotaSaidaParam.Rg15Situacao.ItemIndex Of
      0 : QRInadimplencia.SetVariable('IND_SITUACAO',Null);
      1 : QRInadimplencia.SetVariable('IND_SITUACAO','ATIVO');
      2 : QRInadimplencia.SetVariable('IND_SITUACAO','INATIVO');
    End;
    QRInadimplencia.SQL[QRInadimplencia.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.Rg15Ordem.ItemIndex of
      0:QRInadimplencia.SQL.Add('ORDER BY NOME_VENDEDOR');
      1:QRInadimplencia.SQL.Add('ORDER BY COD_VENDEDOR');
    End;
    QRInadimplencia.Open;
    If FRNota_Inadimplencia = Nil then
      FRNota_Inadimplencia := TFRNota_Inadimplencia.Create(Application);
    FRNota_Inadimplencia.QRLTitulo.Caption := 'Mapa de Inadimplência de '+ FNotaSaidaParam.ME15DataI.Text+' até '+FNotaSaidaParam.ME15DataF.Text;

    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRNota_Inadimplencia.QRPrimario.Preview
    else
       FRNota_Inadimplencia.QRPrimario.Print;
    QRInadimplencia.Close;
  end;
end;

procedure TFNotaSaidaCad.ContaCorrente1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[16].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME16Filial.Text),'VENDA');
    If FRNota_ContaCorrente = Nil then
      FRNota_ContaCorrente := TFRNota_ContaCorrente.Create(Application);
    QRContaCorrente.Close;
    QRContaCorrente.Sql.Clear;
    QRContaCorrente.Sql.Add('SELECT Tb_Nota_Cab.Cod_Nota_Cab, Tb_nota_cab.DT_EMISSAO, Tb_nota_cab.NUM_NOTA,');
    QRContaCorrente.Sql.Add(' Tb_nota_cab.COD_SERIE, Tb_cadastro.COD_CADASTRO, Tb_cadastro.NOME AS NOME_CADASTRO, ');
    QRContaCorrente.Sql.Add(' TB_NOTA_CAB.VAL_AVISTA,TB_VENDEDOR.NOME AS NOME_VENDEDOR FROM TB_NOTA_CAB,TB_CADASTRO,TB_OPERACAO,TB_VENDEDOR WHERE ');
    QRContaCorrente.Sql.Add(' TB_OPERACAO.COD_OPERACAO = TB_NOTA_CAB.COD_OPERACAO ');
    QRContaCorrente.Sql.Add(' AND Tb_cadastro.COD_CADASTRO = Tb_nota_cab.COD_CADASTRO ');
    QRContaCorrente.Sql.Add(' AND Tb_nota_cab.COD_VENDEDOR = Tb_vendedor.COD_VENDEDOR(+) ');
    QRContaCorrente.Sql.Add(' AND TB_OPERACAO.IND_VENDAS = ' + CHR(39) + 'V' + CHR(39));
    QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_SITUACAO = 2 ');
    If Trim(FNotaSaidaParam.ME16Filial.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME16Filial.Text));
    If Trim(FNotaSaidaParam.ME16Cadastro.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME16Cadastro.Text));

    Case FNotaSaidaParam.RGTipoPagto.ItemIndex of
      0 :
        Begin
         QRContaCorrente.Sql.Add(' AND ((TB_NOTA_CAB.IND_CONDICAO_PAGTO = 1 ) OR (TB_NOTA_CAB.VAL_AVISTA > 0))');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas a Vista de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
         If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO'
         Then
            QRContaCorrente.Sql.Add(' AND TB_OPERACAO.COD_HISTORICO_CAIXA = 1');
        End;
      1 :
        Begin
         QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = 2 ');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas a Prazo de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
      2 :
        Begin
         QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = 3 ');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Conta  Corrente de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
      3 :
        Begin
         QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = 4 ');
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Cartão de Crédito '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
      4 :
        Begin
         FRNota_ContaCorrente.QRLTitulo.Caption := 'Vendas Todas de '+ FNotaSaidaParam.ME16DataI.Text+' até '+FNotaSaidaParam.ME16DataF.Text;
        End;
    End;
    If Trim(FNotaSaidaParam.ME16Vendedor.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.ME16Vendedor.Text));
    If Trim(FNotaSaidaParam.ME16Departamento.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.COD_DEPARTAMENTO = ' + Trim(FNotaSaidaParam.ME16Departamento.Text));
    If Trim(FNotaSaidaParam.ME16Historico.Text) <> ''   then
       QRContaCorrente.Sql.Add(' AND TB_OPERACAO.COD_HISTORICO_CAIXA = ' + Trim(FNotaSaidaParam.ME16Historico.Text));
    If Trim(FNotaSaidaParam.ME16DataI.Text) <> '' Then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME16DataI.Text) + Chr(39));
    If Trim(FNotaSaidaParam.ME16DataF.Text) <> '' Then
       QRContaCorrente.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME16DataF.Text) + Chr(39));
    pTipoPagto := FNotaSaidaParam.RGTipoPagto.ItemIndex;  // utilizado no calcfields da query
    If FNotaSaidaParam.Rg16Ordem.ItemIndex = 0 Then
       QRContaCorrente.Sql.Add(' Order By Tb_cadastro.COD_CADASTRO')
    Else
       QRContaCorrente.Sql.Add(' Order By Tb_nota_cab.NUM_NOTA');

    QRContaCorrente.Open;
    FRNota_ContaCorrente.QRLHistorico.Caption := 'Filial:' + FNotaSaidaParam.Ed16Filial.Text + ' - ' +FNotaSaidaParam.Ed16Historico.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ContaCorrente.QRPrimario.Preview
    Else
      FRNota_ContaCorrente.QRPrimario.Print;
    QRContaCorrente.Close;
  End;
end;

procedure TFNotaSaidaCad.SBGeraContaCorrenteClick(Sender: TObject);
begin
  inherited;
  Try
    DMNotaSaida.QNotaSaida.DisableControls;
    DMNotaSaida.QItemNF.DisableControls;
    If FNota_ContaCorrente = Nil then
       FNota_ContaCorrente := TFNota_ContaCorrente.Create(Application);
    FNota_Contacorrente.ShowModal;
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
  Except
    DMNotaSaida.QNotaSaida.EnableControls;
    DMNotaSaida.QItemNF.EnableControls;
    Raise;
  End;
end;

procedure TFNotaSaidaCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  If MessageDlg('Apagar esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMNotaSaida.ExcluiNota;
end;

procedure TFNotaSaidaCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao_CF.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
end;

procedure TFNotaSaidaCad.SBCancelarClick(Sender: TObject);
begin
  With DMNotaSaida do
  Begin
    If QItemNF.State in [dsEdit,dsInsert] then
      QItemNF.Cancel;
  End;
  inherited;
end;

procedure TFNotaSaidaCad.SBImprimeCupomFiscalClick(Sender: TObject);
begin
  inherited;  if Trim(DBECodNota.Text) = '' then
  begin
    MessageDlg('Primeiro selecione a nota fiscal!',mtInformation,[mbOk],0);
    Exit;
  end  
  else
  begin
    if FImpressoraFiscal = nil then
       FImpressoraFiscal:= TFImpressoraFiscal.Create(Application);
    if FImpressoraFiscal.EmiteCF_Yanco(DBECodNota.Text) = False then
       MessageDlg('Erro na tentativa de imprimir cupom fiscal!',mtInformation,[mbOk],0);
    FImpressoraFiscal.ShowModal;   
  end;
end;

procedure TFNotaSaidaCad.SBConsultaFreteClick(Sender: TObject);
begin
  inherited;
  If FConhecimentoCons = Nil then
    FConhecimentoCons := TFConhecimentoCons.Create(Application);
  If FConhecimentoCons.ShowModal = mrOk then
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QNotaSaida.SetVariable('PK',DMNotaEntrada.QConhecimentoConsCod_Nota_Cab.Value);
    QNotaSaida.Open;
  End;
end;

procedure TFNotaSaidaCad.TSBaixaPedidoEnter(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QBaixasPed.Open;
  End;
end;

procedure TFNotaSaidaCad.TSBaixaPedidoExit(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QBaixasPed.Close;
  End;
end;

procedure TFNotaSaidaCad.PMapaVendasPVendedorPagtoClasse1Click(
  Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[18].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME18Filial.Text),'VENDA');
    QRVendClasse.Close;
    QRVendClasse.SetVariable('DATA_I',FNotaSaidaParam.ME18DataI.Text);
    QRVendClasse.SetVariable('DATA_F',FNotaSaidaParam.ME18DataF.Text);

    If Trim(FNotaSaidaParam.ME18Filial.Text)= ''   then
      QRVendClasse.SetVariable('FILIAL',Null)
    Else
      QRVendClasse.SetVariable('FILIAL',FNotaSaidaParam.ME18Filial.Text);

    If Trim(FNotaSaidaParam.ME18Vendedor.Text)= ''   then
      QRVendClasse.SetVariable('VENDEDOR',Null)
    Else
      QRVendClasse.SetVariable('VENDEDOR',FNotaSaidaParam.ME18Vendedor.Text);

    If Trim(FNotaSaidaParam.ME18VendedorPreposto.Text)= ''   then
      QRVendClasse.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendClasse.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME18VendedorPreposto.Text);

    QRVendClasse.Open;
    If FRVendedorClasse = Nil then
      FRVendedorClasse := TFRVendedorClasse.Create(Application);
    FRVendedorClasse.QRLTitulo.Caption := 'Mapa de Vendas P/Vendedor/Classe/Cond Pagto '+ FNotaSaidaParam.ME18DataI.Text+' até '+FNotaSaidaParam.ME18DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRVendedorClasse.QRPrimario.Preview
    Else
      FRVendedorClasse.QRPrimario.Print;
    QRVendClasse.Close;
  End;

end;

procedure TFNotaSaidaCad.QContaCorrenteAberto1Click(Sender: TObject);
Var wSql : String;
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[19].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME19CodFilial.Text),'VENDA');
    QRContaCorrente2.Close;
    QRContaCorrente2.Sql.Clear;
    wSql := 'SELECT SUM(SVAL_TOTAL) AS SVAL_TOTAL,COD_CADASTRO,COD_FILIAL,DESC_FILIAL,NOME ';
    wSql := wSql + 'FROM (SELECT SUM(Tb_nota_item.VAL_TOTAL-Tb_nota_item.VAL_DESCONTO) SVAL_TOTAL, ';
    wSql := wSql + 'TB_NOTA_CAB.COD_CADASTRO,TB_FILIAL.COD_FILIAL,TB_FILIAL.DESC_FILIAL,TB_CADASTRO.NOME ';
    wSql := wSql + 'FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_FILIAL WHERE ';
    wSql := wSql + 'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ';
    wSql := wSql + 'TB_CADASTRO.COD_CADASTRO = TB_NOTA_CAB.COD_CADASTRO  AND ';
    wSql := wSql + 'TB_NOTA_CAB.COD_FILIAL = TB_FILIAL.COD_FILIAL AND ';
    wSql := wSql + 'TB_NOTA_CAB.IND_SITUACAO = ' + chr(39) + '2' + chr(39) + ' AND ';
    wSql := wSql + 'TB_NOTA_CAB.IND_CONDICAO_PAGTO = 3 ';
    wSql := wSql + ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ';
    If Trim(FNotaSaidaParam.ME19CodFilial.Text) <> ''   then
      wSql := wSql + ' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME19CodFilial.Text);
    If Trim(FNotaSaidaParam.ME19CodCadastro.Text) <> ''   then
      wSql := wSql + ' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME19CodCadastro.Text);
    If Trim(FNotaSaidaParam.ME19DtInicial.Text) <> '' Then
      wSql := wSql + ' And TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME19DtInicial.Text) + chr(39);
    If Trim(FNotaSaidaParam.ME19DtFinal.Text) <> '' Then
      wSql := wSql + ' And TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME19DtFinal.Text) + chr(39);
    wSql := wSql + ' GROUP BY TB_NOTA_CAB.COD_CADASTRO,TB_FILIAL.COD_FILIAL,TB_FILIAL.DESC_FILIAL,TB_CADASTRO.NOME ';
    If Trim(FNotaSaidaParam.ME19Valor.Text) <> ''   then
       wSql := wSql + ' ) WHERE SVAL_TOTAL < ' + (FNotaSaidaParam.ME19Valor.Text)
    Else
       wSql := wSql + ' )';
    wSql := wSql + ' GROUP BY COD_CADASTRO,COD_FILIAL,DESC_FILIAL,NOME ORDER BY NOME';
    QRContaCorrente2.Sql.Add(wSql);
    QRContaCorrente2.Open;
    If FRContaCorrente2 = Nil then
      FRContaCorrente2 := TFRContaCorrente2.Create(Application);
    FRContaCorrente2.QRLTitulo.Caption := 'Conta Corrente de '+ FNotaSaidaParam.ME19DtInicial.Text+' até '+FNotaSaidaParam.ME19DtFinal.Text + ' Valor Menor Que:'+FNotaSaidaParam.ME19Valor.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRContaCorrente2.QRPrimario.Preview
    Else
      FRContaCorrente2.QRPrimario.Print;
    QRContaCorrente2.Close;
  End;
end;

procedure TFNotaSaidaCad.RRecibodeComisso1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[20].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  begin
   With DMRelatorio_Venda do
   Begin
      DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.Me20CodFilial.Text),'VENDA');
      QRReciboComissao.Close;
      QRReciboComissao.SetVariable('DATA_I',FNotaSaidaParam.ME20DtInicial.Text);
      QRReciboComissao.SetVariable('DATA_F',FNotaSaidaParam.ME20DtFinal.Text);
      If Trim(FNotaSaidaParam.ME20CodFilial.Text)= ''   then
        QRReciboComissao.SetVariable('FILIAL',Null)
      Else
        QRReciboComissao.SetVariable('FILIAL',Trim(FNotaSaidaParam.Me20CodFilial.Text));
      If Trim(FNotaSaidaParam.Me20CodVendedor.Text)= ''   then
        QRReciboComissao.SetVariable('VENDEDOR',Null)
      Else
        QRReciboComissao.SetVariable('VENDEDOR',Trim(FNotaSaidaParam.Me20CodVendedor.Text));
      If Trim(FNotaSaidaParam.Me20VendedorPreposto.Text)= ''   then
        QRReciboComissao.SetVariable('VENDEDOR_PREPOSTO',Null)
      Else
        QRReciboComissao.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.Me20VendedorPreposto.Text));
      if Trim(FNotaSaidaParam.Ed20Serie.Text) = ''   then
        QRReciboComissao.SetVariable('SERIE',Null)
      else
        QRReciboComissao.SetVariable('SERIE',Trim(FNotaSaidaParam.Ed20Serie.Text));
      if Trim(FNotaSaidaParam.Ed20Serie1.Text) = ''   then
        QRReciboComissao.SetVariable('SERIE1',Null)
      else
        QRReciboComissao.SetVariable('SERIE1',Trim(FNotaSaidaParam.Ed20Serie1.Text));
      QRReciboComissao.Open;
      If FReciboComissao = Nil then
        FReciboComissao := TFReciboComissao.Create(Application);
      FReciboComissao.QRLHistorico.Caption := FNotaSaidaParam.Me20Historico.Text;
      FReciboComissao.QRLData.Caption := FormatDateTime('dd", de" mmmm "de" yyyy"."',StrToDate(FNotaSaidaParam.Me20DtFinal.Text));
      If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FReciboComissao.QRPrimario.Preview
      Else
        FReciboComissao.QRPrimario.Print;
      QRReciboComissao.Close;
    End;
  End;
End;

procedure TFNotaSaidaCad.SRelatrioVendasComCheque1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[11].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME11Filial.Text),'VENDA');
    QRNota_ComCheque.Close;
    QRNota_ComCheque.SetVariable('DATA_I',FNotaSaidaParam.ME11DataI.Text);
    QRNota_ComCheque.SetVariable('DATA_F',FNotaSaidaParam.ME11DataF.Text);

    QRNota_ComCheque.SetVariable('PRAZO1',FNotaSaidaParam.ME11Prazo1.Text);
    QRNota_ComCheque.SetVariable('PRAZO2',FNotaSaidaParam.ME11Prazo2.Text);
    QRNota_ComCheque.SetVariable('PRAZO3',FNotaSaidaParam.ME11Prazo3.Text);
    QRNota_ComCheque.SetVariable('PRAZO4',FNotaSaidaParam.ME11Prazo4.Text);

    If Trim(FNotaSaidaParam.ME11Filial.Text)= ''   then
      QRNota_ComCheque.SetVariable('FILIAL',Null)
    Else
      QRNota_ComCheque.SetVariable('FILIAL',FNotaSaidaParam.ME11Filial.Text);
    QRNota_ComCheque.Open;
    If FRNota_ComCheque = Nil then
      FRNota_ComCheque := TFRNota_ComCheque.Create(Application);

    FRNota_ComCheque.QRLTitulo.Caption := 'Vendas Com Cheques de '+ FNotaSaidaParam.ME11DataI.Text+' até '+FNotaSaidaParam.ME11DataF.Text;
    FRNota_ComCheque.QRLPrazo1.Caption := 'Até '+FNotaSaidaParam.ME11Prazo1.Text+'d.';
    FRNota_ComCheque.QRLPrazo2.Caption := 'Até '+FNotaSaidaParam.ME11Prazo2.Text+'d.';
    FRNota_ComCheque.QRLPrazo3.Caption := 'Até '+FNotaSaidaParam.ME11Prazo3.Text+'d.';
    FRNota_ComCheque.QRLPrazo4.Caption := 'Até '+FNotaSaidaParam.ME11Prazo4.Text+'d.';
    FRNota_ComCheque.QRLLongoPrazo.Caption := '+ de '+FNotaSaidaParam.ME11Prazo4.Text+'d.';

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNota_ComCheque.QRPrimario.Preview
    Else
      FRNota_ComCheque.QRPrimario.Print;
    QRNota_ComCheque.Close;
  End;

end;

procedure TFNotaSaidaCad.TRelatrioMaioresClientes1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[21].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME21Filial.Text),'VENDA');
    QRMaioresClientes.Close;
    QRMaioresClientesVend.Close;
    QRMaioresClientes.SetVariable('DATA_I',FNotaSaidaParam.ME21DataI.Text);
    QRMaioresClientes.SetVariable('DATA_F',FNotaSaidaParam.ME21DataF.Text);
    QRMaioresClientesVend.SetVariable('DATA_I',FNotaSaidaParam.ME21DataI.Text);
    QRMaioresClientesVend.SetVariable('DATA_F',FNotaSaidaParam.ME21DataF.Text);
    If Trim(FNotaSaidaParam.ME21Filial.Text)= ''   then
    Begin
      QRMaioresClientes.SetVariable('FILIAL',Null);
      QRMaioresClientesVend.SetVariable('FILIAL',Null)
    end
    Else
    Begin
      QRMaioresClientes.SetVariable('FILIAL',FNotaSaidaParam.ME21Filial.Text);
      QRMaioresClientesVend.SetVariable('FILIAL',FNotaSaidaParam.ME21Filial.Text)
    End;

    If Trim(FNotaSaidaParam.ME21Vendedor.Text)= ''   then
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR',Null);
      QRMaioresClientesVend.SetVariable('VENDEDOR',Null)
    End
    Else
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR',FNotaSaidaParam.ME21Vendedor.Text);
      QRMaioresClientesVend.SetVariable('VENDEDOR',FNotaSaidaParam.ME21Vendedor.Text)
    End;

    If Trim(FNotaSaidaParam.ME21VendedorPreposto.Text)= ''   then
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR_PREPOSTO',Null);
      QRMaioresClientesVend.SetVariable('VENDEDOR_PREPOSTO',Null)
    End
    Else
    Begin
      QRMaioresClientes.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME21VendedorPreposto.Text);
      QRMaioresClientesVend.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME21VendedorPreposto.Text)
    End;

    If FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex] = 'TODOS'   then
      Begin
        QRMaioresClientes.SetVariable('TIPO_PRODUTO',Null);
        QRMaioresClientesVend.SetVariable('TIPO_PRODUTO',Null)
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('TIPO_PRODUTO',FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex]);
        QRMaioresClientesVend.SetVariable('TIPO_PRODUTO',FNotaSaidaParam.CB21TipoProduto.Items[FNotaSaidaParam.CB21TipoProduto.ItemIndex])
      End;
    If Trim(FNotaSaidaParam.Me21TipoCadastro.Text) = ''   then
      Begin
        QRMaioresClientes.SetVariable('TIPO_CADASTRO',Null);
        QRMaioresClientesVend.SetVariable('TIPO_CADASTRO',Null);
      End
    Else
      Begin
        QRMaioresClientes.SetVariable('TIPO_CADASTRO',Trim(FNotaSaidaParam.Me21TipoCadastro.Text));
        QRMaioresClientesVend.SetVariable('TIPO_CADASTRO',Trim(FNotaSaidaParam.Me21TipoCadastro.Text));
      End;
    QRMaioresClientes.SQL[QRMaioresClientes.SQL.Count-1]:='';          // elimina a última Linha da SQL
    QRMaioresClientesVend.SQL[QRMaioresClientesVend.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case FNotaSaidaParam.RG21Tipo.ItemIndex of
      0 :
        Begin
          QRMaioresClientes.SQL.Add('Order By sVal_Total Desc');
          QRMaioresClientesVend.SQL.Add('ORDER BY COD_VENDEDOR, SVAL_TOTAL DESC');
        End;
      1 :
        Begin
          QRMaioresClientes.SQL.Add('Order By sQt_Quantidade Desc');
          QRMaioresClientesVend.SQL.Add('ORDER BY COD_VENDEDOR, sQt_Quantidade Desc');
        End;
    End;
    QRMaioresClientes.Open;
    QRMaioresClientesVend.Open;
    If FRMaioresClientes = Nil then
      FRMaioresClientes := TFRMaioresClientes.Create(Application);
    FRMaioresClientes.QRLTitulo.Caption := 'Relacao de Maiores Clientes de '+ FNotaSaidaParam.ME21DataI.Text+' até '+FNotaSaidaParam.ME21DataF.Text;
    If FRMaioresClientesVend = Nil then
      FRMaioresClientesVend := TFRMaioresClientesVend.Create(Application);
    FRMaioresClientesVend.QRLTitulo.Caption := 'Relação de Maiores Clientes de '+ FNotaSaidaParam.ME21DataI.Text+' até '+FNotaSaidaParam.ME21DataF.Text;

    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRMaioresClientes.QRCompositeReport1.Preview
     //QRGVendedorCMedio.Preview
    Else
      FRMaioresClientes.QRCompositeReport1.Print;

    QRMaioresClientes.Close;
    QRMaioresClientesVend.Close;
  End;

end;

procedure TFNotaSaidaCad.VResumoProdutosPorCliente1Click(Sender: TObject);
Var wSql : String;
begin
  inherited;
  if FNotaSaidaParam = Nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[23].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME23Filial.Text),'VENDA');
    QRResumoCliente.Close;
    QRResumoCliente.Sql.Clear;
    wsql := 'SELECT STIPO,COD_PRODUTO,DESC_PRODUTO,COD_CADASTRO,NOMECADASTRO,FONECADASTRO,COD_VENDEDOR,NUM_NOTA,DT_EMISSAO,DT_MES,';
    wSql := wSql + 'Sum(SQT_QUANTIDADE) as SQT_QUANTIDADE,Sum(SVAL_TOTAL) as SVAL_TOTAL FROM ( ';

    wSql := wSql + 'SELECT ' + CHR(39) + ' MOVIMENTO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO, Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
    wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) DT_MES,Sum(Tb_nota_item.QT_QUANTIDADE) as SQT_QUANTIDADE,';
    wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL) as SVAL_TOTAL FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO ';
    wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ';
    wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'S' + CHR(39);
    wSql := wSql + ' AND TB_OPERACAO.IND_BONIFICACAO <> ' + CHR(39) + 'S' + CHR(39);
    if Trim(FNotaSaidaParam.ME23Vendedor.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.ME23Vendedor.Text);
    if Trim(FNotaSaidaParam.ME23Filial.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME23Filial.Text);
    if Trim(FNotaSaidaParam.ME23Operacao.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.ME23Operacao.Text);
    if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
    if Trim(FNotaSaidaParam.ME23Produto.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.ME23Produto.Text);
    if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
    if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);

    wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO, ';
    wSql := wSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+'))  UNION ALL ';
    wSql := wSql + 'SELECT ' + CHR(39) + ' MOVIMENTO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO, Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
    wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) DT_MES,Sum(Tb_nota_item.QT_QUANTIDADE) * (-1) as SQT_QUANTIDADE,';
    wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL) * (-1) as SVAL_TOTAL FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO ';
    wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ';
    wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = ' + CHR(39) + 'E' + CHR(39);
    wSql := wSql + ' AND TB_OPERACAO.IND_VENDAS = ' + CHR(39) + 'D' + CHR(39);
    if Trim(FNotaSaidaParam.ME23Vendedor.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.ME23Vendedor.Text);
    if Trim(FNotaSaidaParam.ME23Filial.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME23Filial.Text);
    if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
    if Trim(FNotaSaidaParam.ME23Produto.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.ME23Produto.Text);
    if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
    if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);

    wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO, ';
    wSql := wSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+'))  UNION ALL ';

    wSql := wSql + 'SELECT ' + CHR(39) + 'BONIFICAÇÃO' + CHR(39) + ' AS STIPO,Tb_nota_item.COD_PRODUTO, Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO,';
    wSql := wSql + 'Tb_cadastro.NOME AS NOMECADASTRO,Tb_cadastro.DESC_TELEFONE AS FONECADASTRO,Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) DT_MES,Sum(Tb_nota_item.QT_QUANTIDADE) as SQT_QUANTIDADE,';
    wSql := wSql + 'Sum(Tb_nota_item.VAL_TOTAL) as SVAL_TOTAL FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO,TB_OPERACAO,TB_PRODUTO ';
    wSql := wSql + 'WHERE (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ';
    wSql := wSql + ' AND (Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ';
    wSql := wSql + ' AND (Tb_nota_cab.COD_OPERACAO = Tb_operacao.COD_OPERACAO) ';
    wSql := wSql + ' AND TB_NOTA_CAB.IND_SITUACAO = 2 ';
    wSql := wSql + ' AND TB_OPERACAO.IND_BONIFICACAO = ' + CHR(39) + 'S' + CHR(39);
    if Trim(FNotaSaidaParam.ME23Vendedor.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaSaidaParam.ME23Vendedor.Text);
    if Trim(FNotaSaidaParam.ME23Filial.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME23Filial.Text);
    if Trim(FNotaSaidaParam.ME23Operacao.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_OPERACAO = ' + Trim(FNotaSaidaParam.ME23Operacao.Text);
    if Trim(FNotaSaidaParam.ME23Cadastro.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME23Cadastro.Text);
    if Trim(FNotaSaidaParam.ME23Produto.Text) <> ''   then
       wSql := wSql + ' AND TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaSaidaParam.ME23Produto.Text);
    if Trim(FNotaSaidaParam.ME23DataI.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataI.Text) + Chr(39);
    if Trim(FNotaSaidaParam.ME23DataF.Text) <> '' Then
       wSql := wSql + ' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + Chr(39) + Trim(FNotaSaidaParam.ME23DataF.Text) + Chr(39);
    wSql := wSql + ' GROUP BY Tb_nota_item.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_cadastro.COD_CADASTRO, ';
    wSql := wSql + ' Tb_cadastro.NOME, Tb_cadastro.DESC_TELEFONE, Tb_nota_cab.COD_VENDEDOR,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.DT_EMISSAO,TO_NUMBER(TO_CHAR(Tb_Nota_Cab.DT_EMISSAO,'+CHR(39)+'MM'+CHR(39)+')) ';
    wSql := wSql + ') GROUP BY STIPO,COD_PRODUTO,DESC_PRODUTO,COD_CADASTRO,NOMECADASTRO,FONECADASTRO,COD_VENDEDOR,NUM_NOTA,DT_EMISSAO,DT_MES ';
    wSql := wSql + ' ORDER BY COD_VENDEDOR, NOMECADASTRO,DT_MES,STIPO ';
    QRResumoCliente.Sql.Add(wSql);
    QRResumoCliente.Open;
    if FRResumoCliente = nil then
       FRResumoCliente := TFRResumoCliente.Create(Application);

    FRResumoCliente.QRLTitulo.Caption := 'Resumo Operação por Cliente de '+ FNotaSaidaParam.ME23DataI.Text+' até '+FNotaSaidaParam.ME23DataF.Text;
    FRResumoCliente.QRLFilial.Caption := 'Filial: '+ FNotaSaidaParam.Ed23Filial.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRResumoCliente.QRPrimario.Preview
    else
      FRResumoCliente.QRPrimario.Print;
    QRResumoCliente.Close;
  end;
end;

procedure TFNotaSaidaCad.XFuturaEmprstimoConsignaoDepsitoPNota1Click(
  Sender: TObject);
var wNomeRelatorio,wSql:String;
begin
  inherited;
  if FNotaEntradaParam = Nil then
     FNotaEntradaParam := TFNotaEntradaParam.Create(Application);
  FNotaEntradaParam.PGRelatorio.Pages[2].TabVisible := True;
  if FNotaEntradaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    //Frames---------------------------------
    DmUsuario.Checar_Filial_Usuario(Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text),'VENDA');
    QRFutura_Cliente.Close;
    QRFutura_Cliente.Sql.Clear;
    wSql := 'SELECT Tb_nota_aux.QT_ATENDIDO,Tb_nota_aux.QT_CANCELADO,Tb_nota_aux.QT_DEVOLVIDO,';
    wSql := wSql + 'Tb_nota_aux.QT_NOTA_ITEM,Tb_nota_aux.IND_TIPO,Tb_produto.COD_PRODUTO,Tb_produto.DESC_PRODUTO,Tb_produto.IND_TIPO_PRODUTO,Tb_produto.NUM_EMBALAGEM,';
    wSql := wSql + 'Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,';
    wSql := wSql + 'TB_LOTE_TIPO.DESC_LOTE,Tb_nota_cab.DT_EMISSAO,Tb_nota_item.COD_LOTE_TIPO,Tb_nota_item.VAL_TOTAL sVal_Total,';
    wSql := wSql + 'Tb_nota_item.VAL_UNITARIO FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_NOTA_AUX,TB_PRODUTO,TB_CADASTRO,TB_LOTE_TIPO ';
    wSql := wSql + 'WHERE TB_LOTE_TIPO.COD_LOTE_TIPO = TB_NOTA_ITEM.COD_LOTE_TIPO AND ';
    wSql := wSql + 'Tb_nota_item.COD_NOTA_ITEM = Tb_nota_aux.COD_NOTA_ITEM AND ';
    wSql := wSql + 'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB AND ';
    wSql := wSql + 'Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO AND ';
    wSql := wSql + 'Tb_nota_item.COD_PRODUTO = Tb_produto.COD_PRODUTO AND ';
    wSql := wSql + 'QT_NOTA_ITEM > (QT_ATENDIDO+QT_CANCELADO+QT_DEVOLVIDO) AND ';
    Case FNotaEntradaParam.CB2TipoFutura.ItemIndex of
       0 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'COM_FUT' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Compra Futura';
           End;
       1 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'VEN_FUT' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Venda Futura';
           End;
       2 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'EMP_FOR' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Empréstimo de Fornecedor';
           End;
       3 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'EMP_CLI' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Empréstimo a Cliente';
           End;
       4 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'CON_FOR' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Consignação de Fornecedor';
           End;
       5 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'CON_CLI' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Consignação a Cliente';
           End;
       6 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'DEP_EMP' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Deposito na Empresa';
           End;
       7 : Begin
             wSql := wSql + 'Tb_nota_aux.IND_TIPO = ' + CHR(39) + 'DEP_OUT' + CHR(39);
             wNomeRelatorio := 'Rel. Notas de Deposito em Outras Empresas';
           End;
       Else
         Raise Exception.Create('Nenhum tipo de Futura selecionado!');
    End;

    //Frames----------------------------------------------
    If Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaEntradaParam.FmCadastro3.MeCadastro.Text);
    If Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_ITEM.COD_PRODUTO = ' + Trim(FNotaEntradaParam.FmProduto3.MeProduto.Text);
    If Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text);
    If Trim(FNotaEntradaParam.FmLote3.MeLote.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_ITEM.COD_LOTE_TIPO = ' + Trim(FNotaEntradaParam.FmLote3.MeLote.Text);
    If Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text) <> '' then
       wSql := wSql + ' And TB_NOTA_CAB.COD_VENDEDOR = ' + Trim(FNotaEntradaParam.FmVendedor3.MeVendedor.Text);
    //----------------------------------------------------
    If Trim(FNotaEntradaParam.ME2DataI.Text) <> '' Then
       wSql := wSql + ' And Tb_nota_cab.DT_RECEBIMENTO >= ' + CHR(39) + Trim(FNotaEntradaParam.ME2DataI.Text) + chr(39);
    If Trim(FNotaEntradaParam.ME2DataF.Text) <> '' Then
       wSql := wSql + ' And Tb_nota_cab.DT_RECEBIMENTO <= ' + CHR(39) + Trim(FNotaEntradaParam.ME2DataF.Text) + chr(39);
    wSql := wSql + ' ORDER BY Tb_cadastro.NOME,Tb_cadastro.COD_CADASTRO,Tb_nota_cab.NUM_NOTA ';
    QRFutura_Cliente.SQL.Add(wSql);

    QRFutura_Cliente.Open;

    If FRNota_VendaFutura = Nil then
      FRNota_VendaFutura := TFRNota_VendaFutura.Create(Application);
    //Cabecalho Relatório---------------------------------
    FRNota_VendaFutura.QRLTitulo.Caption   := wNomeRelatorio;
    FRNota_VendaFutura.QRLFilial.Caption   := 'Filial:'  +Trim(FNotaEntradaParam.FmFilial3.MeFilial.Text)    +' - '      +FNotaEntradaParam.FmFilial3.EdFilial.Text;
    FRNota_VendaFutura.QRLVendedor.Caption := 'Vendedor:'+Trim(FNotaEntradaParam.FmVendedor3.EdVendedor.Text)+ ' De '    +FNotaEntradaParam.ME2DataI.Text + ' Até ' + FNotaEntradaParam.ME2DataF.Text;
    //----------------------------------------------------
    If FNotaEntradaParam.RGPreview.ItemIndex = 0 then
      FRNota_VendaFutura.QRPrimario.Preview
    Else
      FRNota_VendaFutura.QRPrimario.Print;
    QRFutura_Cliente.Close;
  End;

end;

procedure TFNotaSaidaCad.ZRelatrioHistricoCliente1Click(Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[24].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME24Filial.Text),'VENDA');
    QRVendaHistorico.Close;
    QRReceberHistorico.Close;
    QRReceber_Titulos.Close;
    QRVendaHistorico.Sql.Clear;
    QRVendaHistorico.Sql.Add('SELECT Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_nota_cab.IND_CONDICAO_PAGTO,');
    QRVendaHistorico.Sql.Add('Tb_nota_cab.COD_NOTA_CAB,Tb_nota_cab.DT_EMISSAO,Tb_cadastro.NOME,');
    QRVendaHistorico.Sql.Add('sum(Tb_nota_item.VAL_TOTAL - Tb_nota_item.VAL_DESCONTO + Tb_nota_item.VAL_DESPESAS) as val_total ');
    QRVendaHistorico.Sql.Add(' FROM TB_NOTA_CAB,TB_NOTA_ITEM,TB_CADASTRO WHERE ');
    QRVendaHistorico.Sql.Add(' (Tb_nota_cab.COD_NOTA_CAB = Tb_nota_item.COD_NOTA_CAB) ');
    QRVendaHistorico.Sql.Add(' AND (Tb_nota_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
    If Trim(FNotaSaidaParam.ME24Filial.Text) <> ''   then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME24Filial.Text));
    If Trim(FNotaSaidaParam.ME24Cadastro.Text) <> ''   then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME24Cadastro.Text));
    If Trim(FNotaSaidaParam.ME24DataI.Text) <> '' Then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataI.Text) + chr(39));
    If Trim(FNotaSaidaParam.ME24DataF.Text) <> '' Then
       QRVendaHistorico.Sql.Add(' AND TB_NOTA_CAB.DT_RECEBIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataF.Text) + chr(39));
    QRVendaHistorico.Sql.Add(' GROUP BY Tb_nota_cab.COD_CADASTRO,Tb_nota_cab.NUM_NOTA,Tb_nota_cab.COD_SERIE,Tb_nota_cab.IND_CONDICAO_PAGTO,');
    QRVendaHistorico.Sql.Add(' Tb_nota_cab.COD_NOTA_CAB,Tb_nota_cab.DT_EMISSAO,Tb_cadastro.NOME ORDER BY NOME,COD_CADASTRO,DT_EMISSAO ');
    QRReceber_Titulos.Sql.Clear;
    QRReceber_Titulos.Sql.Add('SELECT Tb_conta_receber_cab.COD_FINALIDADE,Tb_conta_receber_cab.COD_FILIAL,Tb_conta_receber_cab.NUM_TITULO,Tb_conta_receber_cab.NUM_PARCELA,');
    QRReceber_Titulos.Sql.Add('Tb_conta_receber_cab.DESC_TIPO_DOCUMENTO,Tb_conta_receber_cab.DT_VENCIMENTO,Tb_conta_receber_cab.DT_EMISSAO,Tb_conta_receber_cab.VAL_TITULO,');
    QRReceber_Titulos.Sql.Add('Tb_conta_receber_cab.IND_SITUACAO,Tb_conta_receber_cab.COD_CADASTRO,Tb_cadastro.NOME FROM TB_CONTA_RECEBER_CAB,TB_CADASTRO ');
    QRReceber_Titulos.Sql.Add(' WHERE (Tb_conta_receber_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) ');
    QRReceber_Titulos.Sql.Add(' AND (Tb_conta_receber_cab.COD_NOTA_CAB IS NULL) ');
    If Trim(FNotaSaidaParam.ME24Filial.Text) <> ''   then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.COD_FILIAL = ' + Trim(FNotaSaidaParam.ME23Filial.Text));
    If Trim(FNotaSaidaParam.ME24Cadastro.Text) <> ''   then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.COD_CADASTRO = ' + Trim(FNotaSaidaParam.ME24Cadastro.Text));
    If Trim(FNotaSaidaParam.ME24DataI.Text) <> '' Then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO >= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataI.Text) + chr(39));
    If Trim(FNotaSaidaParam.ME24DataF.Text) <> '' Then
       QRReceber_Titulos.Sql.Add(' AND Tb_conta_receber_cab.DT_VENCIMENTO <= ' + chr(39) + Trim(FNotaSaidaParam.ME24DataF.Text) + chr(39));

    QRVendaHistorico.Open;
    QRReceberHistorico.Open;
    QRReceber_Titulos.Open;
    If FRVendaHistorico = Nil then
      FRVendaHistorico := TFRVendaHistorico.Create(Application);
    If FRTitulos = Nil then
      FRTitulos := TFRTitulos.Create(Application);
    FRVendaHistorico.QRLTitulo.Caption := 'Historico de Vendas Por Cliente de '+ FNotaSaidaParam.ME24DataI.Text+' até '+FNotaSaidaParam.ME24DataF.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendaHistorico.QRCompositeReport1.Preview
//      FRVendaHistorico.QRPrimario.Preview
    Else
       FRVendaHistorico.QRCompositeReport1.Print;
//      FRVendaHistorico.QRPrimario.Print;
    QRVendaHistorico.Close;
    QRReceberHistorico.Close;
  End;
end;

procedure TFNotaSaidaCad.DBEClienteExit(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMNotaSaida.QNotaSaidaCod_Cadastro.Text;
  FPedidoCons.MEDataI.Text := DateToStr(Date-180);
  FPedidoCons.BtProcurarClick(Self);
  If not DMPedido.QPedidoCons.Eof  Then
  Begin
    BtImpPedClick(Self);
    FPedidoCons.METexto.Enabled := True;  
  End;

  MsgAutoriza;  //mostra na tela as pessoas autorizadas a comprar

  DBEdit11.SetFocus;
end;

procedure TFNotaSaidaCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = Chr(43) Then
  Begin
      DbNavigator1.BtnClick(NbInsert);
      DbEdit54.SetFocus;
  End;
  If Key = Chr(45) Then
  Begin
      DbNavigator1.BtnClick(NbDelete);
      DbEdit54.SetFocus;
  End;

end;

procedure TFNotaSaidaCad.QuantVendidaporItensporVendedor1Click(
  Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[25].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME25Filial.Text),'VENDA');
    QRVendasPorVendedor.close;
    QRVendasPorVendedor.SetVariable('DATA_I',FNotaSaidaParam.ME25DataI.Text);
    QRVendasPorVendedor.SetVariable('DATA_F',FNotaSaidaParam.ME25DataF.Text);

    If Trim(FNotaSaidaParam.ME25Filial.Text)= ''   then
       QRVendasPorVendedor.SetVariable('FILIAL',Null)
    Else
       QRVendasPorVendedor.SetVariable('FILIAL',FNotaSaidaParam.ME25Filial.Text);

    If Trim(FNotaSaidaParam.ME25Vendedor.Text)= ''   then
       QRVendasPorVendedor.SetVariable('VENDEDOR',Null)
    Else
       QRVendasPorVendedor.SetVariable('VENDEDOR',FNotaSaidaParam.ME25Vendedor.Text);

     If Trim(FNotaSaidaParam.ME25VendedorPreposto.Text)= ''   then
       QRVendasPorVendedor.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
       QRVendasPorVendedor.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME25VendedorPreposto.Text);

    QRVendasPorVendedor.Open;
    If FRVendasPorVendedor = Nil then
       FRVendasPorVendedor := TFRVendasPorVendedor.Create(Application);
    FRVendasPorVendedor.QRLTitulo.Caption := 'Quantidade Vendida por Vendedor '+FNotaSaidaParam.ME25DataI.Text+' até '+FNotaSaidaParam.ME25DataF.Text;
    FRVendasPorVendedor.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.Ed25Filial.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendasPorVendedor.QRPrimario.Preview
    Else
       FRVendasPorVendedor.QRPrimario.Print;
    QRVendasPorVendedor.Close;
  end
end;

procedure TFNotaSaidaCad.Vendasporvendedorregio1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[26].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME26Filial.Text),'VENDA');
    QRVendasVndRegiao.close;
    QRVendasVndRegiao.SetVariable('DATA_I',FNotaSaidaParam.ME26DataI.Text);
    QRVendasVndRegiao.SetVariable('DATA_F',FNotaSaidaParam.ME26DataF.Text);
    if Trim(FNotaSaidaParam.ME26Filial.Text) = ''   then
       QRVendasVndRegiao.SetVariable('FILIAL',Null)
    else
       QRVendasVndRegiao.SetVariable('FILIAL',FNotaSaidaParam.ME26Filial.Text);
    if Trim(FNotaSaidaParam.ME26Vendedor.Text) = ''   then
       QRVendasVndRegiao.SetVariable('VENDEDOR',Null)
    else
       QRVendasVndRegiao.SetVariable('VENDEDOR',FNotaSaidaParam.ME26Vendedor.Text);
    if Trim(FNotaSaidaParam.ME26VendedorPreposto.Text) = ''   then
       QRVendasVndRegiao.SetVariable('VENDEDOR_PREPOSTO',Null)
    else
       QRVendasVndRegiao.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME26VendedorPreposto.Text);
    if Trim(FNotaSaidaParam.ME26Regiao.Text) = ''   then
       QRVendasVndRegiao.SetVariable('REGIAO',Null)
    else
       QRVendasVndRegiao.SetVariable('REGIAO',FNotaSaidaParam.ME26Regiao.Text);
    if Trim(FNotaSaidaParam.Me26Produto.Text) = ''   then
       QRVendasVndRegiao.SetVariable('COD_PRODUTO',Null)
    else
       QRVendasVndRegiao.SetVariable('COD_PRODUTO',FNotaSaidaParam.Me26Produto.Text);
    QRVendasVndRegiao.Open;
    if FRVendasVndRegiao = nil then
       FRVendasVndRegiao := TFRVendasVndRegiao.Create(Application);
    FRVendasVndRegiao.QRLTitulo.Caption := 'Vendas por Vendedor e Região '+FNotaSaidaParam.ME26DataI.Text+' até '+FNotaSaidaParam.ME26DataF.Text;
    FRVendasVndRegiao.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.Ed26Filial.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendasVndRegiao.QRPrimario.Preview
    Else
       FRVendasVndRegiao.QRPrimario.Print;
    QRVendasVndRegiao.Close;
  end

end;

procedure TFNotaSaidaCad.Itensvendidosnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[27].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  with DMRelatorio_Venda do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME27Filial.Text),'VENDA');
    QRVendProdPeriodo.Close;
    QRVendProdPeriodo.SetVariable('DATA_I',FNotaSaidaParam.ME27DataI.Text);
    QRVendProdPeriodo.SetVariable('DATA_F',FNotaSaidaParam.ME27DataF.Text);

    if Trim(FNotaSaidaParam.ME27Filial.Text)= '' then
       QRVendProdPeriodo.SetVariable('FILIAL',Null)
    else
       QRVendProdPeriodo.SetVariable('FILIAL',FNotaSaidaParam.ME27Filial.Text);

    if Trim(FNotaSaidaParam.ME27ClasseI.Text) = '' then
    begin
       MessageDlg('É necessario informar CLASSE!',mtInformation,[mbOK],0);
       Exit;
    end
    else
       QRVendProdPeriodo.SetVariable('CLASSE_I',FNotaSaidaParam.ME27ClasseI.Text);

    if Trim(FNotaSaidaParam.ME27ClasseF.Text) = '' then
    begin
       MessageDlg('É necessario informar CLASSE!',mtInformation,[mbOK],0);
       Exit;
    end
    else
      QRVendProdPeriodo.SetVariable('CLASSE_F',FNotaSaidaParam.ME27ClasseF.Text);

    if FNotaSaidaParam.RG27CompraVenda.ItemIndex = 0 then
    begin
      QRVendProdPeriodo.SetVariable('IND_COMPRAS',Null);
      QRVendProdPeriodo.SetVariable('IND_VENDAS','V');
    end
    else
    begin
      QRVendProdPeriodo.SetVariable('IND_VENDAS',Null);
      QRVendProdPeriodo.SetVariable('IND_COMPRAS','C');
    end;
    if Trim(FNotaSaidaParam.ME27Produto.Text)= '' then
       QRVendProdPeriodo.SetVariable('PRODUTO',Null)
    else
       QRVendProdPeriodo.SetVariable('PRODUTO',FNotaSaidaParam.ME27Produto.Text);
    if Trim(FNotaSaidaParam.ME27Vendedor.Text)= '' then
       QRVendProdPeriodo.SetVariable('VENDEDOR',Null)
    else
       QRVendProdPeriodo.SetVariable('VENDEDOR',FNotaSaidaParam.ME27Vendedor.Text);
    QRVendProdPeriodo.Open;

    if FRVendProdPeriodo = nil then
       FRVendProdPeriodo := TFRVendProdPeriodo.Create(Application);

    // Titulo do relatório
    if FNotaSaidaParam.RG27CompraVenda.ItemIndex = 0 then
       FRVendProdPeriodo.QRLTitulo.Caption := 'Venda(s) de Produto(s) no periodo '+FNotaSaidaParam.ME27DataI.Text+' até '+FNotaSaidaParam.ME27DataF.Text
    else
       FRVendProdPeriodo.QRLTitulo.Caption := 'Compra(s) de Produto(s) no periodo '+FNotaSaidaParam.ME27DataI.Text+' até '+FNotaSaidaParam.ME27DataF.Text;

    FRVendProdPeriodo.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.Ed27Filial.Text;

    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
       FRVendProdPeriodo.QRPrimario.Preview
    else
       FRVendProdPeriodo.QRPrimario.Print;

    FRVendProdPeriodo.Close;
  end

end;

procedure TFNotaSaidaCad.DBEdit14Exit(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaDt_Emissao.Value < Date then
     ShowMessage ('Data de Emissão Menor que Data Atual!');

end;

procedure TFNotaSaidaCad.DBEdit16Exit(Sender: TObject);
begin
  inherited;
  If DMNotaSaida.QNotaSaidaDt_Recebimento.Value < Date then
     ShowMessage ('Data de Saída Menor que Data Atual!');

end;

procedure TFNotaSaidaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(15);
end;

procedure TFNotaSaidaCad.BtImpItemNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
  Begin
    With DMNotaSaida do
    Begin
      QItemNfCons.Close;
      QItemNfCons.SetVariable('COD_NOTA_CAB',QNotaSaidaConsCod_Nota_Cab.Value);
      QItemNfCons.Open;
      QItemNfCons.First;
      DMNotaSaida.pTrazPedido := True;
      While not QItemNfCons.Eof do
        With DMNotaSaida do
        Begin
          QItemNF.Insert;
          QItemNFCod_Produto.Value := QItemNfConsCod_Produto.Value;
          QItemNFVal_Unitario.Value := QItemNfConsVal_Unitario.Value - (QItemNfConsVal_Desconto.Value / QItemNfConsQt_Quantidade.Value);
          QItemNFQt_Quantidade.Value := QItemNfConsQt_Quantidade.Value;
//          QItemNFVal_Desconto.Value := QItemNfConsVal_Desconto.Value;
          QItemNFCod_Tributacao.Value := QItemNfConsCod_Tributacao.Value;
          QItemNFPerc_Comissao.Value := QItemNfConsPerc_Comissao.Value;
          // Itens de Ordem de Compra atualizados nos eventos da query
          QItemNfCons.Next;
        End;
        QItemNfCons.Close;
        DMNotaSaida.pTrazPedido := False;
    End;
  End;

end;

procedure TFNotaSaidaCad.VendasPVendedorClasseFornecedor1Click(
  Sender: TObject);
begin
  inherited;
  If FNotaSaidaParam = Nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[29].TabVisible := True;
  If FNotaSaidaParam.ShowModal = mrOk then
  With DMRelatorio_Venda do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.ME29Filial.Text),'VENDA');
    QRVendaVendClasse.Close;
    QRVendaVendClasse.SetVariable('DATA_I',FNotaSaidaParam.ME29DataI.Text);
    QRVendaVendClasse.SetVariable('DATA_F',FNotaSaidaParam.ME29DataF.Text);
    If Trim(FNotaSaidaParam.ME29Filial.Text)= ''   then
      QRVendaVendClasse.SetVariable('FILIAL',Null)
    Else
      QRVendaVendClasse.SetVariable('FILIAL',FNotaSaidaParam.ME29Filial.Text);
    If Trim(FNotaSaidaParam.ME29Vendedor.Text)= ''   then
      QRVendaVendClasse.SetVariable('VENDEDOR',Null)
    Else
      QRVendaVendClasse.SetVariable('VENDEDOR',FNotaSaidaParam.ME29Vendedor.Text);
    If Trim(FNotaSaidaParam.ME29VendedorPreposto.Text)= ''   then
      QRVendaVendClasse.SetVariable('VENDEDOR_PREPOSTO',Null)
    Else
      QRVendaVendClasse.SetVariable('VENDEDOR_PREPOSTO',FNotaSaidaParam.ME29VendedorPreposto.Text);
    If Trim(FNotaSaidaParam.ME29ClasseI.Text)= ''   then
      QRVendaVendClasse.SetVariable('CLASSEI',Null)
    Else
      QRVendaVendClasse.SetVariable('CLASSEI',FNotaSaidaParam.ME29ClasseI.Text);
    If Trim(FNotaSaidaParam.ME29SubClasse.Text)= ''   then
      QRVendaVendClasse.SetVariable('SUBCLASSE',Null)
    Else
      QRVendaVendClasse.SetVariable('SUBCLASSE',FNotaSaidaParam.ME29SubClasse.Text);
    If Trim(FNotaSaidaParam.ME29Produto.Text)= ''   then
      QRVendaVendClasse.SetVariable('PRODUTO',Null)
    Else
      QRVendaVendClasse.SetVariable('PRODUTO',FNotaSaidaParam.ME29Produto.Text);
    QRVendaVendClasse.Open;
    If FrVendasVendClasse = Nil then
      FrVendasVendClasse := TFrVendasVendClasse.Create(Application);
    FrVendasVendClasse.QRLTitulo.Caption := 'Vendas por Fornecedor/Classe e Vendedor de '+ FNotaSaidaParam.ME29DataI.Text+' até '+FNotaSaidaParam.ME29DataF.Text;
    FrVendasVendClasse.QRLFilial.Caption := 'Filial:'+FNotaSaidaParam.Ed29Filial.Text;
    If FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FrVendasVendClasse.QRPrimario.Preview
    Else
      FrVendasVendClasse.QRPrimario.Print;
    QRVendaVendClasse.Close;
  End;

end;

procedure TFNotaSaidaCad.DBEdit62Exit(Sender: TObject);
Var wPercICM : Real;
begin
  inherited;
  If Trim(DMNotaSaida.QItemNFCod_Tributacao.Text) <> '' then
  Begin
    wPercICM := StrToFloat( DMOracle.BuscaNome('SELECT PERC_ALIQUOTA FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+FloatToStr(DMNotaSaida.QItemNFCod_Tributacao.Value) ));
    DMNotaSaida.QItemNFVal_ICM.Value := DMNotaSaida.QItemNFVal_ICM_Base.Value*wPercICM/100;
  End;
end;

procedure TFNotaSaidaCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DMNotaSaida do
  Begin
    QNotaSaida.Close;
    QItemNF.Close;
    QSomaItemNota.Close;
    QContaReceber.Close;
    QContaReceberMov.Close;
    QEstoqueBaixa.Close;
    QCaixa.Close;
    QBaixaAux.Close;
    QNotaAux.Close;
    QNotaAuxItNf.Close;
  End;
  Action := CaFree;
  FNotaSaidaCad := Nil;
end;

procedure TFNotaSaidaCad.Clientescomcompranoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
     FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[31].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
     DmUsuario.Checar_Filial_Usuario( Trim(FNotaSaidaParam.MECodFilial31.Text),'VENDA');
     if (Trim(FNotaSaidaParam.MEDataI31.Text) = '') or (Trim(FNotaSaidaParam.MEDataF31.Text) = '') then
        raise exception.Create('É necessario informar periodo para relatório.');
     with DMRelatorio_Venda do
     begin
       QRClienteComCompra.Close;
       if Trim(FNotaSaidaParam.MECodFilial31.Text) = '' then
          QRClienteComCompra.SetVariable('COD_FILIAL',Null)
       else
          QRClienteComCompra.SetVariable('COD_FILIAL',Trim(FNotaSaidaParam.MECodFilial31.Text));

       if Trim(FNotaSaidaParam.MECodVendedor31.Text) = '' then
          QRClienteComCompra.SetVariable('COD_VENDEDOR',Null)
       else
          QRClienteComCompra.SetVariable('COD_VENDEDOR',Trim(FNotaSaidaParam.MECodVendedor31.Text));

       If Trim(FNotaSaidaParam.ME31TipoCadastro.Text)= ''   then
         QRClienteComCompra.SetVariable('TIPO_CADASTRO',Null)
       Else
         QRClienteComCompra.SetVariable('TIPO_CADASTRO',FNotaSaidaParam.ME31TipoCadastro.Text);

       if Trim(FNotaSaidaParam.ME31VendedorPREPOSTO.Text) = '' then
          QRClienteComCompra.SetVariable('VENDEDOR_PREPOSTO',Null)
       else
          QRClienteComCompra.SetVariable('VENDEDOR_PREPOSTO',Trim(FNotaSaidaParam.ME31VendedorPREPOSTO.Text));

       QRClienteComCompra.SetVariable('DT_EMISSAO_I',FNotaSaidaParam.MEDataI31.Text);
       QRClienteComCompra.SetVariable('DT_EMISSAO_F',FNotaSaidaParam.MEDataF31.Text);
       If Trim(FNotaSaidaParam.MeCodClasse31.Text)= ''   then
         QRClienteComCompra.SetVariable('COD_CLASSE',Null)
       Else
         QRClienteComCompra.SetVariable('COD_CLASSE',Trim(FNotaSaidaParam.MeCodClasse31.Text));
       QRClienteComCompra.Open;
       if FRClienteComCompra = nil then
          FRClienteComCompra:= TFRClienteComCompra.Create(Application);
       FRClienteComCompra.QRLTitulo.Caption := 'CLIENTES COM COMPRA NO PERIODO DE : '+
                                               FNotaSaidaParam.MEDataI31.Text+' A '+
                                               FNotaSaidaParam.MEDataF31.Text;
       if Trim(FNotaSaidaParam.MECodVendedor31.Text) = '' then
          FRClienteComCompra.QRLVendedor.Caption := 'VENDEDOR: TODOS'
       else
          FRClienteComCompra.QRLVendedor.Caption := 'VENDEDOR: '+Trim(FNotaSaidaParam.MECodVendedor31.Text)+' - '+
                                                    FNotaSaidaParam.EdVendedorNome31.Text;
       if Trim(FNotaSaidaParam.MECodClasse31.Text) = '' then
          FRClienteComCompra.QRLClasse.Caption := 'CLASSE: TODAS'
       else
          FRClienteComCompra.QRLClasse.Caption := ('CLASSE: '+Trim(FNotaSaidaParam.EDDescricaoClasse31.Text));
       FRClienteComCompra.QRLTipoCadastro.Caption := 'Tipo Cadastro : '+ Trim(FNotaSaidaParam.Ed31TipoCadastro.Text);
       if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
          FRClienteComCompra.QRPrimario.Preview
       else
          FRClienteComCompra.QRPrimario.Print;
       QRClienteComCompra.Close;
     end;
  end;
end;

procedure TFNotaSaidaCad.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFNotaSaidaCad.EtiquetaspItensdaNF1Click(Sender: TObject);
var wCont : Byte;
    wLpt_Nota: String;
    wNrEtiquetas: integer;
begin
  inherited;
  if FNotaSaidaParam = nil then
     FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[32].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    if (Trim(FNotaSaidaParam.EdNF32I.Text) = '') or (Trim(FNotaSaidaParam.EdNF32F.Text) = '') then
       raise exception.Create('Deve ser informada nota inicio/final primeiro!');

    with DMRelatorio_Venda do
    begin
      QREtiq_ItemsNF.Close;
      QREtiq_ItemsNF.SetVariable('NUM_NOTA_I',FNotaSaidaParam.EdNF32I.Text);
      QREtiq_ItemsNF.SetVariable('NUM_NOTA_F',FNotaSaidaParam.EdNF32F.Text);
      QREtiq_ItemsNF.Open;
      if QREtiq_ItemsNF.RecordCount = 0 then
         raise exception.Create('Nota(s) fiscal(is) não encontrada(s)!');

      wCont:= 1; // Inicializa valor da variavel.

      // Inicializa impressora.
      // wLpt_Nota:= DMOracle.BuscaNome('SELECT DESC_LPT_NOTA FROM TB_PARAM_SISTEMA','COD_FILIAL = '+DBEdit2.Text)
      wLpt_Nota:= 'LPT1';
      if Imp = nil then
         Imp := TImp.Create;
      if Trim(wLpt_Nota) = 'LPT1' then
         Imp.AbreImpressora
      else
         if Trim(wLpt_Nota) = 'LPT2' then
            Imp.AbreImpressora_Lpt2
         else
            Imp.AbreImpressora_Com2;

      //Imp.ConfiguraImpressora('CONDENSADO_ON','SEXTOS',66);
      Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);

      QREtiq_ItemsNF.First;
      while not QREtiq_ItemsNF.Eof do
      begin

        wNrEtiquetas:= StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text);

        while wNrEtiquetas > 0 do
        begin
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFnome.Value));
          inc(wCont);
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFDESC_PRODUTO.Value));
          inc(wCont);
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFNUM_NOTA.Text));
          inc(wCont);
          wCont:=wCont+6;
          Dec(wNrEtiquetas);
        end;
        QREtiq_ItemsNF.Next;
      end;

      Imp.SaltaPagina;
      //Imp.ConfiguraImpressora('CONDENSADO_OFF','SEXTOS',66);
      Imp.FechaImpressora;

      // Não apague hoje.
       {
          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFnome.Value));

          if wNrEtiquetas < StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) then
             Imp.WriteXY( 12.2,wCont,Trim(QREtiq_ItemsNFnome.Value));

           wCont:=wCont+1; // Pula para próxima linha

          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFDESC_PRODUTO.Value));

          if wNrEtiquetas < StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) then
             Imp.WriteXY( 12.2,wCont,Trim(QREtiq_ItemsNFDESC_PRODUTO.Value));

          wCont:=wCont+1; // Pula para próxima linha

          Imp.WriteXY( 0.5,wCont,Trim(QREtiq_ItemsNFNUM_NOTA.Text));

          if wNrEtiquetas < StrToInt(QREtiq_ItemsNFQT_QUANTIDADE.Text) then
             Imp.WriteXY( 12.2,wCont,Trim(QREtiq_ItemsNFNUM_NOTA.Text));

          wCont:=wCont+7; // Pula linha(s).
          Inc(i);

          wNrEtiquetas:=wNrEtiquetas+2;

          if wNrEtiquetas >= QREtiq_ItemsNFQT_QUANTIDADE.Value then
             i:= 999999;  // Sai do while.
       }

    end;
  end;
end;

procedure TFNotaSaidaCad.NotasContaCorrente1Click(Sender: TObject);
var
  wParametro :string;
begin
  inherited;
  if FNotaSaidaParam = Nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[33].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      if (trim(FNotaSaidaParam.MEDT_Recebimento_I.text)<>'') and (trim(FNotaSaidaParam.MEDT_Recebimento_F.text)<>'') and (trim(FNotaSaidaParam.EDNumNota.text)<>'') then
      begin
        wParametro:= DMOracle.BuscaNome('SELECT COD_NOTA_CONTA_CORRENTE FROM TB_NOTA_CAB','NUM_NOTA = '+Trim(FNotaSaidaParam.EdNumNota.text)+' and TB_Nota_Cab.DT_Recebimento >= '+chr(39)+FNotaSaidaParam.MEDT_Recebimento_I.text+chr(39)+' and TB_Nota_Cab.DT_Recebimento <= '+chr(39)+FNotaSaidaParam.MEDT_Recebimento_F.text+chr(39));
        If wParametro <> '' Then
         Begin
           QRNotaContaCorrente.close;
           QRNotaContaCorrente.setVariable('COD_NOTA_CONTA_CORRENTE',wParametro);
           QRNotaContaCorrente.open;
           If FRNotaContaCorrente = Nil then
              FRNotaContaCorrente:= TFRNotaContaCorrente.Create(Application);
           FRNotaContaCorrente.QRPrimario.Preview;
         End
        else
           ShowMessage('Esta Nota Não Foi Atendida Neste Período');
      end
      else
        showmessage('Todos os campos devem ser Preenchidos!');
    end;
  end;
end;

procedure TFNotaSaidaCad.BtConsVendedorPreClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor_Preposto.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;

end;

procedure TFNotaSaidaCad.DBEdit31Change(Sender: TObject);
begin
  inherited;
  If DbEdit31.Text <> '' Then
  Begin
    With DMTributacao do
    Begin
      QTributacao.Close;
      QTributacao.SetVariable('PK',DbEdit31.Text);
      QTributacao.Open;
      DMNotaSaida.QNotaSaidaVAL_ICM_BASE_FRETE.Value := (DMNotaSaida.QNotaSaidaVal_Frete.Value*QTributacaoPerc_Tributado.Value/100);
      DMNotaSaida.QNotaSaidaVAL_ICM_FRETE.Value := (DMNotaSaida.QNotaSaidaVal_Frete.Value*QTributacaoPerc_Tributado.Value/100)
                                                    *QTributacaoPerc_Aliquota.Value/100;
    End;
  End;
end;

procedure TFNotaSaidaCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaDESC_OBS_CORPO_NOTA.Value := DMMensagem.QMensagemConsDesc_Mensagem.Value+ ' '+
                                                       DMMensagem.QMensagemConsDesc_Complemento.Value+ ' '+
                                                       DMMensagem.QMensagemConsDesc_Complemento1.Value+ ' '+
                                                       DMMensagem.QMensagemConsDesc_Complemento2.Value+ ' '+
                                                       DMMensagem.QMensagemConsDesc_Complemento3.Value;
end;

procedure TFNotaSaidaCad.SBCartaCorrecaoClick(Sender: TObject);
begin
  inherited;
  If (DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value = 0)Then
    raise Exception.Create('É necessário escolher uma nota para gerar uma Carta Corretiva');
  If FNotaCorrecao = Nil Then
    FNotaCorrecao := TFNotaCorrecao.Create(application);
  DMNotaCorrecao.pCodNota := DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value;
  DMNotaCorrecao.pCodConhecimento := 0;
  FNotaCorrecao.ShowModal;
end;

procedure TFNotaSaidaCad.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaSaidaCad.VendedorCliente1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
  Begin
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.ME34DtInicio.Text := DateToStr(Date);
    FNotaSaidaParam.ME34DtFinal.Text := DateToStr(Date);
  End;
  FNotaSaidaParam.PGRelatorio.Pages[34].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRVendaVendedorCliente.Close;
      if(trim(FNotaSaidaParam.ME34DtInicio.text)<>'') AND (trim(FNotaSaidaParam.ME34DtFinal.text)<>'')then
      Begin
        QRVendaVendedorCliente.setVariable('DT_INICIO',trim(FNotaSaidaParam.ME34DtInicio.text));
        QRVendaVendedorCliente.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME34DtFinal.text));
      End
      else
        showmessage('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME34CodFilial.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('FILIAL',trim(FNotaSaidaParam.ME34CodFilial.text))
      Else
        QRVendaVendedorCliente.setVariable('FILIAL',null);

      If(Trim(FNotaSaidaParam.ME34CodVendedor.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('VENDEDOR',trim(FNotaSaidaParam.ME34CodVendedor.text))
      Else
        QRVendaVendedorCliente.setVariable('VENDEDOR',null);

      If(Trim(FNotaSaidaParam.ME34CodClasse.Text) <> '')Then
        QRVendaVendedorCliente.setVariable('CLASSE',trim(FNotaSaidaParam.ME34CodClasse.text))
      Else
        QRVendaVendedorCliente.setVariable('CLASSE',null);
      If FNotaSaidaParam.Rg34Cancelado_Sim_Nao.ItemIndex = 0 Then
        QRVendaVendedorCliente.setVariable('CANCELADO_SIM_NAO',null)
      ELSE
        QRVendaVendedorCliente.setVariable('CANCELADO_SIM_NAO','NAO');
      QRVendaVendedorCliente.Open;
      If FRVendaVendedorCliente = Nil Then
         FRVendaVendedorCliente := TFRVendaVendedorCliente.Create(Application);
      FRVendaVendedorCliente.QRLTitulo.Caption :=  'Vendas por Vendedor/Cliente no Período de ' + FNotaSaidaParam.ME34DtInicio.text + ' até ' + FNotaSaidaParam.ME34DtFinal.text;
      FRVendaVendedorCliente.QRLbFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed34Filial.Text;
      FRVendaVendedorCliente.QRLbClasse.Caption := 'Classe: ' + FNotaSaidaParam.Ed34Classe.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendaVendedorCliente.QRPrimario.Preview
      else
        FRVendaVendedorCliente.QRPrimario.Print;
      QRVendaVendedorCliente.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtOrdemCarregamentoClick(Sender: TObject);
begin
  inherited;
  If FOrdemCarregamentoCons = Nil then
    FOrdemCarregamentoCons := TFOrdemCarregamentoCons.Create(Application);
  If FOrdemCarregamentoCons.ShowModal = mrOk then
    If DMOrdemCarregamento.QOrdemCarregamentoConsInd_Situacao.Value = 'B' Then
       Raise Exception.Create('Ordem de Carregamento Já foi Utilizada em Outra Nota Fiscal')
    Else
     Begin
       With DMOrdemCarregamento do
       Begin
         DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_cab.Value := QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value;
         QOrdemCarregamentoCab.Close;
         QOrdemCarregamentoCab.SetVariable('Pk',QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value);
         QOrdemCarregamentoCab.Open;
         QOrdemCarregamentoItem.Close;
         QOrdemCarregamentoItem.Open;
         If QOrdemCarregamentoItemInd_Tipo_Frete.Value = 'CIF' Then
          Begin
            DMNotaSaida.QNotaSaidaVal_Pedagio.Value := QOrdemCarregamentoItemVal_Pedagio.Value;
            DMNotaSaida.QNotaSaidaVAL_FRETE_TON.Value := QOrdemCarregamentoItemVal_Frete_Ton.Value;
            DMNotaSaida.QNotaSaidaCod_Transportador.Value := QOrdemCarregamentoItemCod_Motorista.Value;
            DMNotaSaida.QNotaSaidaDesc_Placa.Value := QOrdemCarregamentoItemDesc_Placa_Veiculo.Value;
          End;
       End;
     End;
end;

procedure TFNotaSaidaCad.DBEdit62KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := True;  // digitacao manual de valores de icms
end;

procedure TFNotaSaidaCad.DBEdit63KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := True;  // digitacao manual de valores de icms
end;

procedure TFNotaSaidaCad.MELocalizaChange(Sender: TObject);
begin
  inherited;
  DMNotaSaida.PDigitou_Manual := False;  // digitacao manual de valores de icms COLOQUEI AQUI NO CASO DE FAZER UMA NOTA INFORMANDO O ICMS E DEPOIS CONSULTAR OUTRA NOTA
end;

procedure TFNotaSaidaCad.VendaCustoVendedorClasse1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[35].TabVisible := True;

  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    with DMRelatorio_Venda do
    begin
      QRVendaVendedorClasse.Close;

      if Trim(FNotaSaidaParam.ME35DtInicial.text) = '' then
        Raise Exception.Create('Período deve ser informado');
      if Trim(FNotaSaidaParam.ME35DtFinal.text) = ''then
        FNotaSaidaParam.ME35DtFinal.text := DateToStr(Date);
      if Trim(FNotaSaidaParam.ME35TribFederal.text) = ''then
        Raise Exception.Create('Valor do Tributo Federal deve ser Informado');
      QRVendaVendedorClasse.setVariable('VAL_TRIBUTO',Trim(FNotaSaidaParam.ME35TribFederal.Text));
      QRVendaVendedorClasse.setVariable('DT_INICIAL',Trim(FNotaSaidaParam.ME35DtInicial.Text));
      QRVendaVendedorClasse.setVariable('DT_FINAL',Trim(FNotaSaidaParam.ME35DtFinal.Text));
      if Trim(FNotaSaidaParam.ME35Filial.Text) <> '' then
        QRVendaVendedorClasse.setVariable('FILIAL',Trim(FNotaSaidaParam.ME35Filial.Text))
      else
        QRVendaVendedorClasse.setVariable('FILIAL',NULL);
      if Trim(FNotaSaidaParam.ME35Vendedor.Text) <> '' then
        QRVendaVendedorClasse.setVariable('VENDEDOR',Trim(FNotaSaidaParam.ME35Vendedor.Text))
      else
        QRVendaVendedorClasse.setVariable('VENDEDOR',NULL);
      if Trim(FNotaSaidaParam.ME35Classe.Text) <> '' then
        QRVendaVendedorClasse.setVariable('CLASSE',Trim(FNotaSaidaParam.ME35Classe.text))
      else
        QRVendaVendedorClasse.setVariable('CLASSE',NULL);
      QRVendaVendedorClasse.Open;
      if FRVendaVendedorClasse = nil then
         FRVendaVendedorClasse := TFRVendaVendedorClasse.Create(Application);
      FRVendaVendedorClasse.QRLPeriodo.Caption :=  'Período de ' + FNotaSaidaParam.ME35DtInicial.text + ' até ' + FNotaSaidaParam.ME35DtFinal.text;
      FRVendaVendedorClasse.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Ed35Filial.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRVendaVendedorClasse.QRPrimario.Preview
      else
        FRVendaVendedorClasse.QRPrimario.Print;
      QRVendaVendedorClasse.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.LanarQtChegada1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMNotaSaida.QItemNFCOD_NOTA_ITEM.Text) <> '' then
  begin
    if FQtChegada = nil then
      FQtChegada := TFQtChegada.Create(Application);
    FQtChegada.wNota := 'S';
    FQtChegada.showModal;
  end
  else
    Raise Exception.Create('Informe a nota para lançar a Qt. Chegada');
end;

procedure TFNotaSaidaCad.DBEClienteChange(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(DBECliente.Text) <> '') Then
    DMNotaSaida.MostraMsg(StrToInt(Trim(DBECliente.Text)));

end;

procedure TFNotaSaidaCad.DBEdit6Change(Sender: TObject);
Var wPagto : String;
begin
  inherited;
  If ((DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO')) And
     (Trim(DBEdit6.Text) <> '') Then
    Begin
      wPagto := DMOracle.BuscaNome('SELECT IND_TIPO_PAGAMENTO FROM TB_OPERACAO','COD_OPERACAO = '+DBEdit6.Text);
      If wPagto = 'V' Then
         DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
      If wPagto = 'P' Then
         DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
      If wPagto = 'O' Then
         DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '3';
    End;
end;

procedure TFNotaSaidaCad.MsgAutoriza;
Begin
  If Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text) <> '' Then
   Begin
     LblAutoriza.Caption := 'Autorizado:'+DMOracle.BuscaNome('SELECT NOME_CONTATO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblAutoriza.Caption := LblAutoriza.Caption+'-'+DMOracle.BuscaNome('SELECT NOME_CONTATO2 FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblFormaCompra.Caption := DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc '+DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblAutoriza.Caption := LblAutoriza.Caption+' Oper:'+DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value))
   End
  Else
   Begin
     LblAutoriza.Caption := '';
     LblFormaCompra.Caption := '';
   End;
End;
procedure TFNotaSaidaCad.AcompanhamentodeMeta1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[36].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
      QRAcompanhaMeta.Close;
      if(trim(FNotaSaidaParam.ME36Dt_Inicial.text)<>'') AND (trim(FNotaSaidaParam.ME36Dt_Final.text)<>'')then
      Begin
        QRAcompanhaMeta.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME36Dt_Inicial.text));
        QRAcompanhaMeta.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME36Dt_Final.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME36Filial.Text) <> '')Then
        QRAcompanhaMeta.setVariable('FILIAL',trim(FNotaSaidaParam.ME36Filial.text))
      Else
        QRAcompanhaMeta.setVariable('FILIAL',null);
      pMeta := StrToFloat(FNotaSaidaParam.ME36Meta.Text);
      QRAcompanhaMeta.Open;
      If FRAcompanhaMeta = Nil Then
         FRAcompanhaMeta := TFRAcompanhaMeta.Create(Application);
      FRAcompanhaMeta.QRLPeriodo.Caption :=  'Período: ' + FNotaSaidaParam.ME36Dt_Inicial.text + ' até ' + FNotaSaidaParam.ME36Dt_Final.text;
      FRAcompanhaMeta.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Me36Filial.Text + FNotaSaidaParam.Ed36Filial.Text;
      
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRAcompanhaMeta.QRPrimario.Preview
      else
        FRAcompanhaMeta.QRPrimario.Print;
      QRAcompanhaMeta.Close;
    end;
  end;
end;

procedure TFNotaSaidaCad.BtPrazoClick(Sender: TObject);
begin
  inherited;
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.showModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;

end;

procedure TFNotaSaidaCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
//  DMNotaSaida.QNotaSaidaVal_Despesas.Value := 0;
end;

procedure TFNotaSaidaCad.TotaldeVenda1Click(Sender: TObject);
begin
  inherited;
   if FNotaSaidaParam = nil then
    FNotaSaidaParam:= TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[37].TabVisible := True;
  if FNotaSaidaParam.ShowModal = mrOk then
  begin
    With DMRelatorio_Venda do
    begin
{      QRTotalVenda.Close;
      if(trim(FNotaSaidaParam.ME37DtInicial.text)<>'') AND (trim(FNotaSaidaParam.ME37DtFinal.text)<>'')then
      Begin
        QRTotalVenda.setVariable('DT_INICIAL',trim(FNotaSaidaParam.ME37DtInicial.text));
        QRTotalVenda.setVariable('DT_FINAL',trim(FNotaSaidaParam.ME37DtFinal.text));
      End
      else
        Raise Exception.Create('O Período deve ser Informado!');

      If(Trim(FNotaSaidaParam.ME37Filial.Text) <> '')Then
        QRTotalVenda.setVariable('FILIAL',trim(FNotaSaidaParam.ME37Filial.text))
      Else
        QRTotalVenda.setVariable('FILIAL',null);
      If(Trim(FNotaSaidaParam.ME37Vendedor.Text) <> '')Then
        QRTotalVenda.setVariable('VENDEDOR',trim(FNotaSaidaParam.ME37Vendedor.text))
      Else
        QRTotalVenda.setVariable('VENDEDOR',null);

      QRTotalVenda.Open;
      If FRTotalVenda = Nil Then
         FRTotalVenda := TFRTotalVenda.Create(Application);
      FRTotalVenda.QRLPeriodo.Caption :=  'Período: ' + FNotaSaidaParam.ME37DtInicial.text + ' até ' + FNotaSaidaParam.ME37DtFinal.text;
      FRTotalVenda.QRLFilial.Caption := 'Filial: ' + FNotaSaidaParam.Me37Filial.Text + FNotaSaidaParam.Ed37Filial.Text;
      FRTotalVenda.QRLVendedor.Caption := 'Vendedor: ' + FNotaSaidaParam.Me37Vendedor.Text + FNotaSaidaParam.Ed37Vendedor.Text;
      if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
        FRTotalVenda.QRPrimario.Preview
      else
        FRTotalVenda.QRPrimario.Print;
      QRTotalVenda.Close;    }
    end;
  end;
end;

procedure TFNotaSaidaCad.DBEdit1Exit(Sender: TObject);
//var
//  wOperacao : string;
//  wProduto :Integer;
//  wValor :Real;
begin
  inherited;
{  wProduto :=  StrToint(FNotaSaidaCad.DBEdit54.Text);
  wValor := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO =' + IntToStr(wProduto)));
  wOperacao := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO =' + DBEdit6.Text);
  if ((StrToFloat(FNotaSaidaCad.dbedit1.Text) < wValor) and (wOperacao = 'V')) then
    Begin
      Dbedit1.SetFocus;
      Dbedit1.Text := '';
      Raise Exception.Create('O Preço informado é inferior ao preço de Venda!');
    end; }
end;

procedure TFNotaSaidaCad.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
{var
  wOperacao : string;
  wProduto :Integer;
  wValor :Real; }
begin
  inherited;
 { wProduto :=  StrToint(FNotaSaidaCad.DBEdit54.Text);
  wValor := StrToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO =' + IntToStr(wProduto)));
  wOperacao := DMOracle.BuscaNome('SELECT IND_VENDAS FROM TB_OPERACAO','COD_OPERACAO =' + DBEdit6.Text);
  if ((StrToFloat(FNotaSaidaCad.dbedit1.Text) < wValor) and (wOperacao = 'V')) then
    Begin
      Dbedit1.SetFocus;
      Dbedit1.Text := '';
      Raise Exception.Create('O Preço informado é inferior ao preço de Venda!');
    end; }
end;

procedure TFNotaSaidaCad.FormCreate(Sender: TObject);
begin
  inherited;
  DsPrimario.DataSet := DMNotaSaida.QNotaSaida;
  DSItemNF.DataSet := DMNotaSaida.QItemNF;
end;

procedure TFNotaSaidaCad.btSerieConsClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.METexto.Text := DMNotaSaida.QNotaSaidaCOD_FILIAL.Text;
  FSerieCons.METexto.Enabled := false;
  FSerieCons.BtConsFilial.Enabled := false;
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMNotaSaida, DMSerie do
    begin
      QNotaSaidaCOD_SERIE.Value :=
        QSerieConsCOD_SERIE.Value;
      QNotaSaidaCOD_SERIE_MODELO.Value :=
        QSerieConsCOD_SERIE_MODELO.Value;
      DBECod_Serie_ModeloExit(Self);
    end;
  end;
end;

procedure TFNotaSaidaCad.DBECod_Serie_ModeloExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaSaidaCad.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := bib.verificaSerieModelo(DMNotaSaida.QNotaSaidaCOD_FILIAL.Value,
                                                                   DMNotaSaida.QNotaSaidaCOD_SERIE.Value);
end;

end.
