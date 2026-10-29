unit UNotaFrenteCaixa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, ToolWin, jpeg, ActnList, variants,
  DBPanel, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, ComObj,
  IdHTTP, UFmEstado, CustomDialog, ActiveX, DateUtils;

type
  TFNotaFrenteCaixa = class(TFTCadSimples)
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    SBConfNota: TSpeedButton;
    PGNota: TPageControl;
    TSNota: TTabSheet;
    TSItens: TTabSheet;
    Label10: TLabel;
    Label11: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    LblFormaCompra: TLabel;
    Label64: TLabel;
    Label2: TLabel;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBECliente: TDBEdit;
    BtConsCadastro: TBitBtn;
    DBECodOperacao: TDBEdit;
    BtConsOperacao: TBitBtn;
    DBEdit3: TDBEdit;
    DBEdit8: TDBEdit;
    BtConsVendedor: TBitBtn;
    DBECod_Nota: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBEDepartamento: TDBEdit;
    BtConsDepartamento: TBitBtn;
    DBEdit5: TDBEdit;
    BtConsCadastroParceiro: TBitBtn;
    DBDirceu2: TDBDirceu;
    GroupBox1: TGroupBox;
    DBRGCondPagto: TDBRadioGroup;
    Panel2: TPanel;
    BtConsProduto: TBitBtn;
    BitBtn1: TBitBtn;
    DBEdit17: TDBEdit;
    DBText2: TDBText;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DSNotaItem: TDataSource;
    ImgProduto: TImage;
    lblImagemNaoDisponivel: TLabel;
    Bevel1: TBevel;
    lblProduto: TLabel;
    lblPreco: TLabel;
    LblAutoriza: TLabel;
    Label1: TLabel;
    lblUsuario: TLabel;
    Label4: TLabel;
    DBEdit7: TDBEdit;
    BtCondicao: TBitBtn;
    Label5: TLabel;
    DBEdit13: TDBEdit;
    DBDirceu3: TDBDirceu;
    lblRamo: TLabel;
    Opes1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    CancelaNota1: TMenuItem;
    LblSituacao: TLabel;
    Label7: TLabel;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit16: TDBEdit;
    MeCodBarra: TMaskEdit;
    LCodBarra: TLabel;
    DbGridEstoque: TDBGrid;
    DsEstoqueItemNF: TDataSource;
    LClique: TLabel;
    PnImagemFull: TGroupBox;
    IImagemFull: TImage;
    Panel3: TPanel;
    Label14: TLabel;
    DBEdit18: TDBEdit;
    Label16: TLabel;
    DBEdit20: TDBEdit;
    DbObra: TDBPanel;
    DbDespesas: TDBEdit;
    LblDespesas: TLabel;
    btSerieCons: TBitBtn;
    DBPanel1: TDBPanel;
    lblModelo: TLabel;
    EmissoCpia1: TMenuItem;
    ransaesGerenciaisTEF1: TMenuItem;
    DBCodNotaCab: TDBEdit;
    DBDirceu4: TDBDirceu;
    N2: TMenuItem;
    InutilizaodeNumerao1: TMenuItem;
    EnviarviaEmail1: TMenuItem;
    ReemitirDanfe1: TMenuItem;
    Reconsultar1: TMenuItem;
    Exportar1: TMenuItem;
    ExportarNotasPorPerodo1: TMenuItem;
    VerRetornodeEnvio1: TMenuItem;
    EmitirCartadeCorreoEletrnica1: TMenuItem;
    SaveDialogExportaNFes: TSaveDialog;
    LBFormasPagamentoNFCe: TLabel;
    DBLBFormasPagamentoNFCe: TDBLookupListBox;
    Label20: TLabel;
    DBText1: TDBText;
    Label21: TLabel;
    DBText3: TDBText;
    N1RelaodeNotas1: TMenuItem;
    N2MapadeVendas1: TMenuItem;
    LBTipoCartao: TLabel;
    DBTSitSefaz: TDBText;
    DBText9: TDBText;
    VoltarCancelamento1: TMenuItem;
    N31: TMenuItem;
    VendasporOperaoProduto1: TMenuItem;
    ResumoNotasPorOperacao1: TMenuItem;
    N6Resumodenotas1: TMenuItem;
    LblCodNotaCab: TLabel;
    TabSheet1: TTabSheet;
    GroupBox4: TGroupBox;
    SBDocInserir: TSpeedButton;
    SBDocRemover: TSpeedButton;
    DBGDocOriginario: TDBGrid;
    DsNotaReferenciada: TDataSource;
    N3: TMenuItem;
    ReimprimirCupomTEFemMemria1: TMenuItem;
    DsValeProduto: TDataSource;
    DBEdit23: TDBEdit;
    Label23: TLabel;
    Label22: TLabel;
    DBText10: TDBText;
    PCCabecaclho: TPageControl;
    TSGeral: TTabSheet;
    TSFrete: TTabSheet;
    DBEdit4: TDBEdit;
    DBEdit1: TDBEdit;
    Label97: TLabel;
    Label98: TLabel;
    Label26: TLabel;
    DBEdit92: TDBEdit;
    DBEdit93: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit43: TDBEdit;
    Label37: TLabel;
    DBEdit44: TDBEdit;
    BtConsTransportador: TBitBtn;
    DBEdit24: TDBEdit;
    Label24: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit27: TDBEdit;
    Label27: TLabel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBCBTipoCartao: TDBComboBox;
    DBEChaveAcesso: TDBEdit;
    SBChaveAcesso: TSpeedButton;
    Label47: TLabel;
    TSFrenteCaixa: TTabSheet;
    Label25: TLabel;
    Label29: TLabel;
    DBGrid1: TDBGrid;
    Label18: TLabel;
    MECodBarras2: TMaskEdit;
    LDescProduto: TLabel;
    BitBtn2: TBitBtn;
    Label28: TLabel;
    SpeedButton1: TSpeedButton;
    ppAtalhos: TPopupMenu;
    Cadastrarcomprovantedeentrega1: TMenuItem;
    Imprimirnotafiscal1: TMenuItem;
    Emitircartadecorreo1: TMenuItem;
    Abrirgaveta1: TMenuItem;
    BtAbreGaveta: TButton;
    TSVales: TTabSheet;
    GBValeCompras: TGroupBox;
    btIncluir: TSpeedButton;
    btExcluir: TSpeedButton;
    Label30: TLabel;
    DBGValeCompras: TDBGrid;
    MeCodValeProduto: TMaskEdit;
    BtBuscarValeProduto: TBitBtn;
    Label31: TLabel;
    DBText11: TDBText;
    Label32: TLabel;
    DBText12: TDBText;
    acConfirmarNota: TAction;
    N7OramentoWord1: TMenuItem;
    DBTValTotalMAvenida: TDBText;
    Label35: TLabel;
    DBText13: TDBText;
    N8EspelhodaNota1: TMenuItem;
    LbCodCartao: TLabel;
    DBECodCartao: TDBText;
    Label36: TLabel;
    DBText14: TDBText;
    Label38: TLabel;
    DBText15: TDBText;
    procedure FormActivate(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsVendedorClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure DBECod_NotaChange(Sender: TObject);
    procedure SBConfNotaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBImprimeNFConsClick(Sender: TObject);
    procedure DBRGCondPagtoChange(Sender: TObject);
    procedure DBEClienteExit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BtConsCadastroParceiroClick(Sender: TObject);
    procedure SBComprovanteEntregaClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBEdit17Change(Sender: TObject);
    procedure AtualizarImagemProduto;
    procedure BtCondicaoClick(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure CancelaNota1Click(Sender: TObject);
    procedure DBEClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PGNotaChange(Sender: TObject);
    procedure DBECodOperacaoExit(Sender: TObject);
    procedure MeCodBarraExit(Sender: TObject);
    procedure MeCodBarraEnter(Sender: TObject);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure ImgProdutoClick(Sender: TObject);
    procedure IImagemFullClick(Sender: TObject);
    procedure DbObraDefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBEdit11Exit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure DBPanel1CodigoExit(Sender: TObject);
    procedure MECodBarras2Exit(Sender: TObject);
    procedure EmissoCpia1Click(Sender: TObject);
    procedure ransaesGerenciaisTEF1Click(Sender: TObject);
    procedure Nu(Sender: TObject);
    procedure InutilizaodeNumerao1Click(Sender: TObject);
    procedure EnviarviaEmail1Click(Sender: TObject);
    procedure ReemitirDanfe1Click(Sender: TObject);
    procedure Reconsultar1Click(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure ExportarNotasPorPerodo1Click(Sender: TObject);
    procedure VerRetornodeEnvio1Click(Sender: TObject);
    procedure EmitirCartadeCorreoEletrnica1Click(Sender: TObject);
    procedure SBCartaCorrecaoClick(Sender: TObject);
    procedure DBPanel1CodigoChange(Sender: TObject);
    procedure N1RelaodeNotas1Click(Sender: TObject);
    procedure N2MapadeVendas1Click(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DBText9MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBCodNotaCabChange(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure VendasporOperaoProduto1Click(Sender: TObject);
    procedure ResumoNotasPorOperacao1Click(Sender: TObject);
    procedure N6Resumodenotas1Click(Sender: TObject);
    procedure BtBuscarValeProdutoClick(Sender: TObject);
    procedure MeCodValeProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBRefreshClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBDocInserirClick(Sender: TObject);
    procedure SBDocRemoverClick(Sender: TObject);
    procedure ReimprimirCupomTEFemMemria1Click(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure MeCodValeProdutoEnter(Sender: TObject);
    procedure MeCodValeProdutoExit(Sender: TObject);
    procedure BtConsTransportadorClick(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBChaveAcessoClick(Sender: TObject);
    procedure MECodBarras2Change(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Exit(Sender: TObject);
    procedure MECodBarras2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodBarras2ExitNormal;
    procedure MECodBarras2ExitCasaCarnes;
    procedure MECodBarras2ExitRauber;
    procedure MECodBarras2ExitRAUBERNovaBalanca;
    procedure MECodBarras2ExitJasol;
    procedure MECodBarras2ExitFERRAGEM;
    procedure MECodBarras2ExitRETIFOZ;
    procedure MECodBarras2ExitSCALA;
    procedure MECodBarras2ExitHPPECAS;
    procedure MECodBarras2ExitQuerencia;
    procedure MECodBarras2ExitCHAPEUP;
    procedure MECodBarras2ExitLACARNES;
    procedure MECodBarras2ExitMAVENIDA;
    procedure MECodBarras2ExitAGROCAMPO;
    procedure MECodBarras2ExitCASADOPEIXE;
    procedure MECodBarras2ExitFRACTA;
    procedure MECodBarras2ExitEMBEMA;
    procedure MEcodBarras2ExitCASADOPAO;
    procedure MECodBarras2ExitITALIA;
    procedure MECodBarras2ExitCASADOPAOFLORENCA;
    procedure MECodBarras2ExitLUCILUCI;
    procedure MECodBarras2ExitPRAIASMI;
    procedure MECodBarras2ExitBRASIL;
    procedure MECodBarras2ExitDUST;
    procedure MECodBarras2ExitFINESTRA;
    procedure MECodBarras2ExitDGUST;
    procedure MECodBarras2ExitRENATOAUTO;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Abrirgaveta1Click(Sender: TObject);
    procedure BtAbreGavetaClick(Sender: TObject);
    procedure acConfirmarNotaExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure N7OramentoWord1Click(Sender: TObject);
    function GetOrCreateObject(const ClassName: string): IDispatch;
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8EspelhodaNota1Click(Sender: TObject);
    procedure ValidaEstoque(Sender: TObject);
    procedure MECodBarras2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    wVendaSimples: Boolean;
    wModulo: string;
    procedure VendaSimples;
    procedure TrataValeProduto(TipoVale:String);
  public
    { Public declarations }
  end;

var
  FNotaFrenteCaixa: TFNotaFrenteCaixa;
  ValUn: Real;
  newWord: Variant;

implementation

uses UCadastroCons, UOperacaoCons, UCadastro_cl, UBiblioteca,
  UOperacao_cl, UVendedorCons, UOracle_cl, UVendedor_cl, UNotaSaidaCons,
  UProdutoCons, UProduto_cl, UNotaConsum_Confirma, UNotaImpressao,
  UNotaSaida_cl, UUsuario_cl, UNotaConsumidorNome, USerie_cl,
  UParamSistema_cl, UDepartamentoCons, UDepartamento_cl,
  UNotaComprovanteEntrega, UPrazoVencimentoCons, UPrazoVencimento_cl,
  UNotaSaidaCad, UContasReceberCons, UImpressoraFiscal, UEstoque_cl,
  UObra_cl, UObraCons, UVendaSimples, USerieCons, UNfe_cl,
  UNfEletronicaLoteCons, UTef, UExportarNotasParam, StrUtils, UCartaCorrecaoEletronica,
  URelatoriovenda_cl, UNotaEntradaParam, URNotasES_Relacao, UNotaSaidaParam,
  URNota_MapaVendaRes, URNota_MapaVenda, UBibVenda, UFilial_cl,
  URNotasNaoAutorizadas, URecibo_Dos, ULivroFiscalCad, URResumoNotas,
  UValeProdutoCons, UNotaEntradaCons, UNotaEntrada_cl,
  UImpDadosXMLNFe, UTMenuPrincipal, UDevolucaoTroca_cl, UEstadoCons,
  UNotaConsumidor, UnotaFrenteCaixaConfirma, UNFCeParam,
  UDevolucaoCarregaItens, UInformaBancoPix,LePortaCom;

{$R *.DFM}

procedure TFNotaFrenteCaixa.FormActivate(Sender: TObject);
begin
  inherited;

  with DMNotaSaida do
  begin
    QNotaSaida.Open;
    QItemNF.Open;
    QNotaReferenciada.Open;
    QValeProdutoTroca.Open;
  end;
  LblUsuario.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  if (DMParamSistema.CodEmpresa = 'ARISTIDES') Or (DMParamSistema.CodEmpresa = 'BEGNINI') Or (DMParamSistema.CodEmpresa = 'CONSTRUIR') Then
  begin
    Label2.Visible := False;
    BtConsCadastroParceiro.Visible := False;
    DbEdit5.Visible := False;
    Label64.Visible := False;
    DbeDepartamento.Visible := False;
    BtConsDepartamento.Visible := False;
    DbEdit7.Visible := True;
    Label4.Visible := True;
    BtCondicao.Visible := True;
    DbEdit7.Left := 112;
    Label4.Left := 112;
    DBCBTipoCartao.Left := 195;
    LBTipoCartao.Left := 195;
    DBCBTipoCartao.Top := DbEdit7.Top;
    LBTipoCartao.Top := Label4.Top;
    LBFormasPagamentoNFCe.Left := 300;
    DBLBFormasPagamentoNFCe.Left := 300;
    DBLBFormasPagamentoNFCe.Width := 145;
    BtCondicao.Left := 163;
    DbRgCondPagto.Visible := False;
    Label5.Visible := True;
    DbEdit13.Visible := True;
    DBEdit14.Visible := True;
    Label7.Visible := True;
    DBEdit16.Visible := True;
    Label13.Visible := True;
    if DMParamSistema.CodEmpresa = 'ARISTIDES' then
      DBECodOperacao.TabStop := false;
  end
  else

  if (DMParamSistema.CodEmpresa = 'BEGNINI') then
  begin
    DbRgCondPagto.Visible := True;
    DbRgCondPagto.Left := 192;
    DbRgCondPagto.Width := 380;
    BitBtn1.Width := 81;
    BitBtn1.Left := 576;
  end;
  if DMParamSistema.CodEmpresa = 'MINIMART' then
  begin
    FNotaConsumidor.TSNota.TabVisible := False;
    DbGrid1.Columns[3].ReadOnly := True;
  end;

  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') and (DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value = 'COLABORADOR') then
  begin
    DBGrid1.Columns[3].Width := 650;
    SBCancelar.Visible := false;
  end;

  if DMParamSistema.CodEmpresa = 'SRTERRA' then
    DbObra.Visible := True;
  if pos('NFC',DMParamSistema.CodEmpresa) > 0 then
  begin
    DBLBFormasPagamentoNFCe.Visible := True;
    LBFormasPagamentoNFCe.Visible := True;
    DBRGCondPagto.Visible := False;
    DBDirceu4.Visible := False;
  end;
{  if (DMParamSistema.CodEmpresa = 'MAVENIDA') or (DMParamSistema.CodEmpresa = 'NFCE-DOCES') or
     (DMParamSistema.CodEmpresa = 'LACARNES') or (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') then //Adicinado para a Junior Doces 20/09/2021 - Alex. cod_suporte: 3721.
  begin// Habilitado para ser visivel para todos os clientes. Alex 09/01/2026}
  DBTValTotalMAvenida.Visible := True;

  MeCodValeProduto.Clear;
  PGNota.ActivePage := TSFrenteCaixa;
  //if ((DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA')) and (DMUsuario.pTipoFuncionario <> 'VENDEDOR') then
  if (DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM') and (DMUsuario.pTipoFuncionario <> 'VENDEDOR') then
    MELocaliza.SetFocus
  else
    MECodBarras2.SetFocus;
  if DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM' then
  begin
    LbCodCartao.Visible := True;
    DBECodCartao.Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'AGROCAMPO') and (not DMUsuario.Privilegiado) then
  begin
    DBGrid1.Columns[5].ReadOnly := True;
  end;
end;

procedure TFNotaFrenteCaixa.ValidaEstoque(Sender: TObject);
var
 wQtdEstoque: real;
begin
   wQtdEstoque := strtofloat(DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO = ' + Chr(39) + DMNotaSaida.QItemNFCOD_PRODUTO.Text + Chr(39)));
   if (wQtdEstoque < DMNotaSaida.QItemNFQT_QUANTIDADE.Value) then
   begin
     DBGrid1.SetFocus;
     //DBGrid1.SelectedIndex := 1;
     Raise Exception.Create('A quantidade informada  para o produto: ' + Chr(39) + DMNotaSaida.QItemNFCOD_PRODUTO.Text + Chr(39) +
                            ' é maior que a quantidade do estoque! Estoque atual = ' + floattostr(wQtdEstoque));
     DBGrid1.SelectedIndex := 2;
   end;
end;

procedure TFNotaFrenteCaixa.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEClienteExit(Self);
//  DBECliente.SetFocus;
  DbEdit8.Setfocus;
end;

procedure TFNotaFrenteCaixa.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
  DBECodOperacao.SetFocus;
end;

procedure TFNotaFrenteCaixa.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  DBEdit8.SetFocus;
end;

procedure TFNotaFrenteCaixa.SBConfirmarClick(Sender: TObject);
//Var wFormaPagto : String;
begin
   // Nome da tela que está usando o datamodule para validar a mensagem
   DMNotaSaida.sFormularioUsado := TForm(Self).Name;
  //  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contábil');
  if DBEdit8.Text <> '' then // Codigo do vendedor
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DBEdit8.Text) <> 'ATIVO' then
      raise Exception.Create('Vendedor Inativo');
{Copiado para cá do FNotaSaidaCad. Alex 30/09/2025.}
  if DMNotaSaida.QItemNF.RecordCount = 0 then
    raise Exception.Create('Insira os itens da nota antes de confirmá-la.');
  if Trim(DBECodOperacao.Text) = '' then
  begin
    DBECodOperacao.SetFocus;
    raise Exception.Create('Informe a operação');
  end;
  //with DMOperacao do
//  begin
//    QOperacao.Close;
//    QOperacao.SetVariable('Pk', Trim(DBECodOperacao.Text));
//    QOperacao.Open;
//
//
//    if (QOperacaoIND_EMITE.Text = 'P') and                      //Não deixa salvar operação de pedido
//       (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '99') then         //com série fiscal Adriel 17/09/2015
//      raise Exception.Create('É necessário usar de série de pedidos ou '+  //pedido por Rubens Kreuz
//                             'colocar operação de nota fiscal.');
//    if (QOperacaoIND_OBRIGA_VALE_PRODUTO.Value = 'S') and
//       (DMNotaSaida.QValeProdutoTroca.RecordCount = 0) then
//    begin
//      MessageDlg('Para efetuar uma venda relacionada a uma troca é preciso informar o Vale Compras.', mtError,
//          [mbOk], 0);
//      MeCodValeProduto.SetFocus; 
//      Abort;
//    end;
//  end;
  DMNotaSaida.QValeProdutoTroca.Refresh;
  inherited;

  if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') then
    ValidaEstoque(Sender);

  DMOracle.DBCemapa.Commit;

  
  SBConfNotaClick(Sender);

  FNotaSaidaCons.wRetornoCondicional := False;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
  LDescProduto.Caption := '.';
  PGNota.ActivePageIndex := 3;
  if (DMParamSistema.CodEmpresa <> 'FERRAGMED') or
     ((DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM') and (DMUsuario.pTipoFuncionario = 'VENDEDOR')) then
    MECodBarras2.SetFocus;
end;

procedure TFNotaFrenteCaixa.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);

  if ((DMParamSistema.CodEmpresa = 'COZER') or
     (DMParamSistema.CodEmpresa = 'PROPE') or
     (DMParamSistema.CodEmpresa = 'RUDI') or
     (DMParamSistema.CodEmpresa = 'ARISTIDES') or
     (DMParamSistema.CodEmpresa = 'QUERENCIA') or
     (DMParamSistema.CodEmpresa = 'JASOL') or
     (DMParamSistema.CodEmpresa = 'MODASUL')or
     (DMParamSistema.CodEmpresa = 'DONNA') or
     (DMParamSistema.CodEmpresa = 'DUST') or
     (DMParamSistema.CodEmpresa = 'BORGES') or
     (DMParamSistema.CodEmpresa = 'BORGES2') or
     (DMParamSistema.CodEmpresa = 'NFCE-SHADA')or
     (DMParamSistema.CodEmpresa = 'PILILICOS') ) then
    FNotaSaidaCons.BtnRetorno.Visible := True
  else
    FNotaSaidaCons.BtnRetorno.Visible := False;

  if FNotaSaidaCons.ShowModal = MrOk then
    with DMNotaSaida do
    begin
      QNotaSaida.Close;
      QNotaSaida.SetVariable('PK', QNotaSaidaConsCod_Nota_Cab.Value);
      QNotaSaida.Open;
      QValeProdutoTroca.Refresh;
      //      QNotaSaida.Edit;
      //      if DMUsuario.CodVendedorPadrao > 0 Then
      //        QNotaSaidaCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;
      //      if DMUsuario.CodOperacaoPadrao > 0 Then
      //        QNotaSaidaCod_Operacao.Value := DMUsuario.CodOperacaoPadrao;
      //      if DMUsuario.CodSeriePadrao <> '' Then
      //        QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
      //      if QNotaSaidaNum_Nota.Text = '' then
      //        QNotaSaidaNum_Nota.Value := 0;

      if FNotaSaidaCons.wRetornoCondicional then
      begin
        if QNotaSaidaIND_SITUACAO.Value = '2' then
          FNotaSaidaCad.VoltaConfirmao1Click(Self);

        PGNota.ActivePage := TSFrenteCaixa;
//        MeCodBarra.Visible := True;
//        LCodBarra.Visible := True;
//        MeCodBarra.SetFocus;

        SBAlterar.Click;
        DMNotaSaida.pMudancaOperacaoManual := false;
        QNotaSaidaCOD_OPERACAO.Value := DMUsuario.CodOperacaoPadrao;
        //não estava fazendo dev. de condicional no frente de caixa, ajustei para fazer. //01/04/2021 - Junior.
        QNotaSaidaCOD_SERIE.Value := DMUsuario.CodSeriePadrao; //utilizado para mudar serie e modelo e consequentemente mudar o numero da nota.
        QNotaSaidaCOD_SERIE_MODELO.Value := DMUsuario.CodSerieModeloPadrao;

        DMNotaSaida.pMudancaOperacaoManual := false;
        DBECodOperacaoExit(Self);
        QNotaSaidaDt_Emissao.Value := DMOracle.DataServ;
        QNotaSaidaDt_Recebimento.Value := DMOracle.DataServ;
        QNotaSaidaCOD_PRAZO_VENCIMENTO.Text := '';
        if ((DMParamSistema.CodEmpresa <> 'COZER') and (DMParamSistema.CodEmpresa <> 'PROPE'))  then
          QNotaSaidaNUM_NOTA.Value := 0;
        Application.CreateForm(TFDevolucaoCarregaItens, FDevolucaoCarregaItens);
        if (DMParamSistema.CodEmpresa = 'MODASUL') or
           (DMParamSistema.CodEmpresa = 'JASOL') or
           (DMParamSistema.CodEmpresa = 'DONNA') or
           (DMParamSistema.CodEmpresa = 'NFCE-SHADA') or
           (DMParamSistema.CodEmpresa = 'PILILICOS') then
          FDevolucaoCarregaItens.MECodigoBarras.Visible := true;
        if FDevolucaoCarregaItens.carrega(QNotaSaidaCOD_NOTA_CAB.Value) = MrOK then
        begin     
          if FDevolucaoCarregaItens.countSelecionados = 0 then
          begin
            SBCancelarClick(Self);
            SBExcluirClick(Self);
          end
          else
          begin
            QItemNF.DisableControls;
            FDevolucaoCarregaItens.CdItensDevolucao.First;
            while not FDevolucaoCarregaItens.CdItensDevolucao.Eof do
            begin
              if FDevolucaoCarregaItens.CdItensDevolucaoIND_MARCADO.Value = 'N' then
              begin
                QItemNF.Locate('COD_NOTA_ITEM',FDevolucaoCarregaItens.CdItensDevolucaoCOD_NOTA_ITEM.Value,[]);
                QItemNF.EnableControls;
                QItemNF.Delete;
                QItemNF.DisableControls;
              end
              else if FDevolucaoCarregaItens.CdItensDevolucaoIND_MODIFICADO.Value = 'S' then
              begin
                QItemNF.Locate('COD_NOTA_ITEM',FDevolucaoCarregaItens.CdItensDevolucaoCOD_NOTA_ITEM.Value,[]);
                QItemNF.EnableControls;
                QItemNF.Edit;
                QItemNFQT_QUANTIDADE.Value := FDevolucaoCarregaItens.CdItensDevolucaoQT_QUANTIDADE.Value;
                QItemNF.Post;
                QItemNF.DisableControls;
              end;
              FDevolucaoCarregaItens.CdItensDevolucao.Next;
            end;
            QItemNF.EnableControls;
          end;
        end;
      end;
    end;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaFrenteCaixa.BtConsProdutoClick(Sender: TObject);
var
  wValVarejo: String;
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if DMParamSistema.CodEmpresa = 'FERRAGMED' then
    FProdutoCons.METexto.SelectAll;
  if FProdutoCons.ShowModal = mrOk then
  begin
    with DMNotasaida do
    begin
      if (DMParamSistema.CodEmpresa = 'LACARNES') and (DMProduto.QProdutoConsIND_ENVIA_BALANCA.Text = 'SIM') then
      begin
        MECodBarras2.Text := DMProduto.QProdutoConsDESC_COD_BARRA.Text;
        MECodBarras2Exit(Sender);
      end
      else
      begin
        if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
          if StrToFloat(DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO ='+DMProduto.QProdutoConsCOD_PRODUTO.Text)) <= 0 Then
            Raise Exception.Create('Produto sem estoque');
        DMNotaSaida.QItemNF.First;
        wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + DMProduto.QProdutoConsCOD_PRODUTO.Text);
        if (wValVarejo = '') or (wValVarejo = '0') then
            MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        LDescProduto.Caption := DMProduto.QProdutoConsDESC_PRODUTO.Text; //DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+DMProduto.QProdutoConsCOD_PRODUTO.Text);
        QItemNFCOD_PRODUTO.Value := StrToInt(DMProduto.QProdutoConsCOD_PRODUTO.Text);

        QItemNF.Post;
        end;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.DBECod_NotaChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    QSomaVales.Close;
    QSomaVales.Open;
    QSomaItemNota.Close;
    QSomaItemNota.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
    QSomaItemNota.Open;
  end;
end;

procedure TFNotaFrenteCaixa.TrataValeProduto(TipoVale: String);
var
  wValeProdutoAux, wDiferenca: Real;
begin
  with DMDevolucaoTroca do
  begin
    QValeProdutoValida.Close;
    QValeProdutoValida.ClearVariables;
    QValeProdutoValida.SetVariable('TIPO_VALE', TipoVale);
    QValeProdutoValida.SetVariable('COD_NOTA_CAB_TROCA', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    QValeProdutoValida.Open;
    wDiferenca := DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.QNotaSaidaVal_AVista.Value -
      DMNotaSaida.pValorValeCompras;

    while not QValeProdutoValida.Eof do
    begin
      if wDiferenca > 0 then
      begin
        wDiferenca := wDiferenca - QValeProdutoValidaVAL_VALE_PRODUTO.Value;
        wValeProdutoAux := bib.ift(wDiferenca <= 0, QValeProdutoValidaVAL_VALE_PRODUTO.Value + wDiferenca,
            QValeProdutoValidaVAL_VALE_PRODUTO.Value);
        if TipoVale = 'VALE-COMPRAS' then
        begin
          DMNotaSaida.pValorValeCompras := DMNotaSaida.pValorValeCompras + wValeProdutoAux;
          DMNotaSaida.pValorNovoValeCompras := DMNotaSaida.pValorNovoValeCompras +
              bib.ift(wDiferenca >= 0,0,Abs(wDiferenca));
        end
        else
        begin
          DMNotaSaida.pValorValePresente := DMNotaSaida.pValorValePresente + wValeProdutoAux;
          DMNotaSaida.pValorNovoValePresente := DMNotaSaida.pValorNovoValePresente +
              bib.ift(wDiferenca >= 0,0,Abs(wDiferenca));
        end;
        //if wValeProdutoAux > 0 then
        //  DMNotaSaida.pValesProdutos.Add(FloatToStr(wValeProdutoAux));
      end
      else
        if TipoVale = 'VALE-COMPRAS' then
          DMNotaSaida.pValorNovoValeCompras := DMNotaSaida.pValorNovoValeCompras +
              QValeProdutoValidaVAL_VALE_PRODUTO.Value
        else
          DMNotaSaida.pValorNovoValePresente := DMNotaSaida.pValorNovoValePresente +
          QValeProdutoValidaVAL_VALE_PRODUTO.Value;
      QValeProdutoValida.Next;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.SBConfNotaClick(Sender: TObject);
var
  wEntrada, wDecimal: Real;
  wValDesconto, wQtdEstoque: string; // para utilizar no inputquery
  wModalResult: Integer;
begin
  inherited;
  FNotaImpressao := TFNotaImpressao.Create;
  try
{Copiado para cá do FNotaSaidaCad. Alex 30/09/2025.}
    if DMNotaSaida.QItemNF.RecordCount = 0 then
      raise Exception.Create('Insira os itens da nota antes de confirmá-la.');
    if DMParamSistema.CodEmpresa = 'BAZAR' then
    begin
      if FNFCeParam = nil then
        FNFCeParam := TFNFCeParam.Create(Application);
      DMNotaSaida.QNotaNomeCons.Close;
      DMNotaSaida.QNotaNomeCons.Open;
      DMNotaSaida.QNotaNomeCons.First;
      while not DMNotaSaida.QNotaNomeCons.Eof do
      begin
        FNFCeParam.leCGCCPF.Items.Add(DMNotaSaida.QNotaNomeConsDESC_CGC_CPF.Value);
        DMNotaSaida.QNotaNomeCons.Next;
      end;
      DMNotaSaida.QNotaNome.Close;
      DMNotaSaida.QNotaNome.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
      DMNotaSaida.QNotaNome.Open;
      FNFCeParam.leCGCCPF.Text := DMNotaSaida.QNotaNomeDESC_CGC_CPF.Value;
      FNFCeParam.leNome.Text := DMNotaSaida.QNotaNomeNOME.Value;
      FNFCeParam.PGRelatorio.Pages[0].TabVisible := true;
      wModalResult := FNFCeParam.ShowModal;
      if wModalResult = mrOk then
      begin
        if DMNotaSaida.QNotaNome.Eof then
          DMNotaSaida.QNotaNome.Insert
        else
          DMNotaSaida.QNotaNome.Edit;
        DMNotaSaida.QNotaNomeCOD_NOTA_CAB.Value   := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
        DMNotaSaida.QNotaNomeNOME.Value           := Trim(FNFCeParam.leNome.Text);
        DMNotaSaida.QNotaNomeDESC_CGC_CPF.Value   := Trim(FNFCeParam.leCGCCPF.Text);
        DMNotaSaida.QNotaNome.Post;
        DMOracle.DBCemapa.Commit;
      end
      else
      begin
        if not DMNotaSaida.QNotaNome.Eof then
        begin
          DMNotaSaida.QNotaNome.Delete;
          DMOracle.DBCemapa.Commit;
        end;
        if (wModalResult = mrAbort) OR (wModalResult = mrCancel) then
          Abort;
      end;
    end;
    DMNotaSaida.QPagamento.Close;
    DMNotaSaida.QPagamento.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    DMNotaSaida.QPagamento.Open;
    DMNotaSaida.pValorValeCompras := 0;
    DMNotaSaida.pValorNovoValeCompras := 0;
    DMNotaSaida.pValorValePresente := 0;
    DMNotaSaida.pValorNovoValePresente := 0;

    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
    begin
     // DMNfe.SetaNfe(DMNotaSaida.QNFE_EmiteDESC_CHAVE_ACESSO.Value,True);
     //(StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) not in [100, 149])
      if (pos('NFC', DMParamSistema.CodEmpresa) > 0) then
      begin
        VoltaConfirmao1Click(Self);
      end
      else
        raise Exception.Create('Nota já confirmada!');
    end;
    if FNotaConsum_Confirma = nil then
      FNotaConsum_Confirma := TFNotaConsum_Confirma.Create(Application);

    //CHAMAR NOVA TELA
    if FNotaFrenteCaixaConfirma = nil then
      FNotaFrenteCaixaConfirma := TFNotaFrenteCaixaConfirma.Create(Application);

    FNotaFrenteCaixaConfirma.FmCadastro1.MeCadastro.Text := DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text;
    if (DMParamSistema.CodEmpresa = 'FERRAGMED') and (DMUsuario.pTipoFuncionario = 'SUPERVISOR') then
    begin
      FNotaFrenteCaixaConfirma.FmOperacao1.MeOperacao.Text := '17';
      FNotaFrenteCaixaConfirma.FmOperacao1Exit(Sender);
    end
    else
      FNotaFrenteCaixaConfirma.FmOperacao1.MeOperacao.Text := DMNotaSaida.QNotaSaidaCOD_OPERACAO.Text;

    if (DMParamSistema.CodEmpresa = 'PERON') then
      FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao)
    else if (DMParamSistema.CodEmpresa = 'QUERENCIA') and (DMUsuario.pTipoFuncionario = 'SUPERVISOR') and (DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Value = 1) then
      FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text := IntToStr(DMUsuario.CodVendedorPadrao)
    else
      FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text := DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Text;

    if (DMParamSistema.CodEmpresa = 'DONNA') then
      FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text := ''
    else
    begin
    if ((DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'QUERENCIA') or
        (DMParamSistema.CodEmpresa = 'AGROCAMPO') or (DMParamSistema.CodEmpresa =  'SOLDAR')   or
        (DMParamSistema.CodEmpresa = 'DONABENTA') or (DMParamSistema.CodEmpresa = 'FERRAGENS') or
        (DMParamSistema.CodEmpresa = 'KAISER')) and
        (DMUsuario.pTipoFuncionario = 'VENDEDOR') and (DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Value = DMUsuario.CodVendedorPadrao) then
      FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.Text := '';
    end;
    FNotaFrenteCaixaConfirma.MEValorDesconto.Text := FormatFloat('#,##0.00',DMNotaSaida.QNotaSaidaVAL_DESCONTO.Value);
    FNotaFrenteCaixaConfirma.MeEntrada.Text := FormatFloat('#,##0.00',DMNotaSaida.QNotaSaidaVAL_AVISTA.Value);
    FNotaFrenteCaixaConfirma.Memo1.Text := DMNotaSaida.QNotaSaidaOBS.Value;
    FNotaFrenteCaixaConfirma.RGTipoPgto.ItemIndex := DBRGCondPagto.ItemIndex;
    FNotaFrenteCaixaConfirma.EdVenda.Text := FloatToStr(DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente);

    IF DMParamSistema.CodEmpresa <> 'FERRAGMED' then
    Begin
      FNotaFrenteCaixaConfirma.FmCadastro1.MeCadastro.OnExit(Sender);
      FNotaFrenteCaixaConfirma.FmOperacao1.MeOperacao.OnExit(Sender);
      FNotaFrenteCaixaConfirma.FmVendedor1.MeVendedor.OnExit(Sender);
    end;
    //

    if DMNotaSaida.QNotaSaidaVal_AVista.Text <> '' then
       FNotaConsum_Confirma.MeEntrada.Text := DMNotaSaida.QNotaSaidaVal_AVista.Text
    else
       FNotaConsum_Confirma.MeEntrada.Text := '0';
    FNotaConsum_Confirma.MeValorDesconto.Text := DMNotaSaida.QNotaSaidaVAL_DESCONTO.Text;
    wEntrada := 0; // para descontar a entrada efetuada no calculo automatico do sistema ARISTIDES

    DMNotaSaida.QSomaItemNota.Refresh;
    //DMNotaSaida.pValesProdutos := TStringList.Create;
    TrataValeProduto('VALE-COMPRAS');
    // Tratamento do Vale-presente
    TrataValeProduto('VALE-PRESENTE');
    DMNotaSaida.QSomaItemNota.Refresh;
    DMNotaSaida.QSomaVales.Close;
    DMNotaSaida.QSomaVales.Open;
    if (DMParamSistema.CodEmpresa = 'FERRAGMED') then
    begin
      DMNotaSaida.QItemNF.Last;
      ValidaEstoque(sender);
    end;

    DMNotaSaida.pConfirmando := True;
    if DMNotaSaida.QNotaSaidaCod_Vendedor.Text = '' then
      raise exception.Create('Preencher Código Vendedor')
    else
      FNotaConsum_Confirma.MeVendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DMNotaSaida.QNotaSaidaCod_Vendedor.Text, True);

    //    FNotaConsum_Confirma.MeEntrada.Text := MeEntrada.Text;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') Or
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CONSTRUIR') then
    begin
      FNotaConsum_Confirma.MeCadastro.Text := FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value);
      FNotaConsum_Confirma.EdTotalNF.Text := FloatToStr(DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                                        DMNotaSaida.QNotaSaidaVal_AVista.Value-
                                        DMNotaSaida.pValorValeCompras -
                                        DMNotaSaida.pValorValePresente);
      FNotaConsum_Confirma.EdVenda.Text := FloatToStr(DMNotaSaida.QSomaItemNotasval_total_nota.Value - DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente);// - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text));
      if DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2' then
        DMCadastro.ValidaCredito(DmNotaSaida.QNotaSaidaCod_Cadastro.Value, DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                    DMNotaSaida.QNotaSaidaVal_AVista.Value);
      FNotaConsum_Confirma.MeDepartamento.Text := IntToStr(DMusuario.CodDepartamentoUsuario);
      FNotaConsum_Confirma.MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadeUsuario);
      FNotaConsum_Confirma.MePrazo.Text := DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text;
      if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') Then
        if (Trim(FNotaConsum_Confirma.MePrazo.Text) = '1') or
           (Trim(FNotaConsum_Confirma.MePrazo.Text) = '2') or
           (Trim(FNotaConsum_Confirma.MePrazo.Text) = '3') then
          FNotaConsum_Confirma.MeFinalidade.Text := '3'
        else
          FNotaConsum_Confirma.MeFinalidade.Text := '2';
      FNotaConsum_Confirma.LBContaReceber.Clear;
      if DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2' then
      begin
        FNotaConsum_Confirma.MePrazoExit(Self);
        FNotaConsum_Confirma.PCConfirma.Pages[0].TabVisible := False;
        FNotaConsum_Confirma.PCConfirma.Pages[1].TabVisible := True;
        FNotaConsum_Confirma.ShowModal;
      end
      else
        FNotaConsum_Confirma.Finaliza;
    end
      else
       //FNotaConsum_Confirma.ShowModal;
         FNotaFrenteCaixaConfirma.ShowModal;
    DMNotaSaida.pConfirmando := False;
    SBRefreshClick(Self); // para atualizar os dados na tela
  except
    DMNotaSaida.pConfirmando := False;
    raise;
  end;
  //if (DMParamSistema.CodEmpresa = 'FERRAGMED') and (DMUsuario.pTipoFuncionario <> 'VENDEDOR') then
  if (DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Value = 'SIM') and (DMUsuario.pTipoFuncionario <> 'VENDEDOR') then
    MELocaliza.SetFocus;
end;

procedure TFNotaFrenteCaixa.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if SBConfirmar.Enabled then
  begin
    acConfirmarNota.ShortCut := 0;
    Confirmar1.ShortCut := 115;
  end
  else
  begin
    acConfirmarNota.ShortCut := 115;
    Confirmar1.ShortCut := 0;
  end;
  SBConfNota.Enabled := DMNotaSaida.QNotaSaida.State = dsBrowse;
{  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')     and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'INSIDE')    and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'KREUZ')     and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOMBELLI')  and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES')    then
    SBImprimeNFCons.Enabled := SBConfNota.Enabled;  }
  BtConsCadastro.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsOperacao.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsVendedor.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsDepartamento.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  BtConsCadastroParceiro.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  DBCBTipoCartao.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  GBValeCompras.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
  //SBImprimeNFCons.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse; //18-03-2013 - Junior. Não deixa habilitado o SBImprimeNFCons quando a nota estiver confirmada.
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '1' then
    LblSituacao.Caption := 'DIGITADA';
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
    LblSituacao.Caption := 'CONFIRMADA';
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' then
    LblSituacao.Caption := 'CANCELADA';
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '4' then
    LblSituacao.Caption := 'DENEGADA';
  //BtBuscarValeProduto.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];
  //GBValeCompras.Enabled := DSPrimario.DataSet.State in [dsEdit, dsInsert];  
end;

procedure TFNotaFrenteCaixa.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  if MessageDlg('Apagar esta nota?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    if (not DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.Value);
      DMFilial.QFilial.Open;

      DMNfe.SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, True);
      if ((StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_DFE_NAO_PODE_SER_EXCLUIDO) or
          (StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) = 301) or
          (StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) = 302)) and
         (DMNfe.QNfeIND_AMBIENTE_NFE.Value = 1) then
      begin
        MessageDlg('Essa nota está registrada na SEFAZ.' + #13 + #10 +
          'Não é permitida a sua exclusão.', mtWarning, [mbOK], 0);
        Exit;
      end;
    end;
    DMNotaSaida.ExcluiNota;
  end;
  MeCodValeProduto.Clear;
  LDescProduto.Caption := '.';
end;

procedure TFNotaFrenteCaixa.SBCancelarClick(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Cancel;
  end;
  LblFormaCompra.Caption := '';
  LblAutoriza.Caption := '';
  lblRamo.Caption := '';
  LDescProduto.Caption := '.';
  FNotaSaidaCons.wRetornoCondicional := False;
  inherited;
  DMNotaSaida.QValeProdutoTroca.Refresh;
end;

procedure TFNotaFrenteCaixa.SBImprimeNFConsClick(Sender: TObject);
begin
  inherited;
{  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')     and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'INSIDE')    and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'KREUZ')     and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOMBELLI')  and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES')    then
  begin
    if (DMNotaSaida.QNotaSaidaInd_Situacao.Value       <> '2')      and
       (DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value <> '4')      then
      raise Exception.Create('Somente Notas Confirmadas Para Emitir Cópia de Nota');
    //    If DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Operacao.Value)) = 'F' Then
    //       Raise Exception.Create('Somente é Permitido Está Operação Com Nota Fiscal');
  end;
}  if FNotaConsumidorNome = nil then
    FNotaConsumidorNome := TFNotaConsumidorNome.Create(Application);
  if FNotaConsumidorNome.ShowModal = mrOk then
  begin
    with DMNotaSaida do
    begin
{      if ((DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
          (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'COZER')     and
          (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'INSIDE')    and
          (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'BORGES')    and
          (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOMBELLI')  and
          (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'KREUZ'))    and
          (DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2') then // somente para notas confirmadas que muda
      begin
        pNotaNome := True; // este campo testa na query QNotaCab // before post // before edit
        if (Trim(FNotaConsumidorNome.MeCadastro.Text) <> '') or
           (Trim(FNotaConsumidorNome.MeOperacao.Text) <> '') then
        begin
          QNotaSaida.Edit;
          if (Trim(FNotaConsumidorNome.MeCadastro.Text) <> '') then
            QNotaSaidaCod_Cadastro.Value := StrToInt(Trim(FNotaConsumidorNome.MeCadastro.Text));
          if (Trim(FNotaConsumidorNome.MeOperacao.Text) <> '') then
            QNotaSaidaCod_Operacao.Value := StrToInt(trim(FNotaConsumidorNome.MeOperacao.Text));
          if (Trim(FNotaConsumidorNome.MeSerie.Text) <> '') then
            QNotaSaidaCod_Serie.Value := Trim(FNotaConsumidorNome.MeSerie.Text);
          if (Trim(FNotaConsumidorNome.MeNumero.Text) = '') then
            QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(QNotaSaidaCod_Filial.Value, QNotaSaidaCod_Serie.Value)
          else
            QNotaSaidaNum_Nota.Value := StrToInt(Trim(FNotaConsumidorNome.MeNumero.Text));
          QNotaSaida.Post;
          DMOracle.DBCemapa.Commit;
        end;
        pNotaNome := False; // este campo testa na query QNotaCab // before post // before edit
      end;    }
      if (Trim(FNotaConsumidorNome.EdCadastro.Text) <> '') and
        ((DMParamSistema.CodEmpresa = 'BORGES') or (Trim(FNotaConsumidorNome.MeCadastro.Text) = '')) then
      begin
        QNotaNome.Close;
        QNotaNome.SetVariable('PK', QNotaSaidaCod_Nota_Cab.Value);
        QNotaNome.Open;
        if QNotaNome.Eof then
          QNotaNome.Insert
        else
          QNotaNome.Edit;
        QNotaNomeCOD_NOTA_CAB.Value   := QNotaSaidaCOD_NOTA_CAB.Value;
        QNotaNomeNOME.Value           := Trim(FNotaConsumidorNome.EdCadastro.Text);
        QNotaNomeDESC_ENDERECO.Value  := Trim(FNotaConsumidorNome.MeEndereco.Text);
        QNotaNomeDESC_CGC_CPF.Value   := Trim(FNotaConsumidorNome.MeCgc_Cpf.Text);
        QNotaNomeDESC_INSCRICAO.Value := Trim(FNotaConsumidorNome.MeInscricao.Text);
        QNotaNomeDESC_CIDADE.Value    := Trim(FNotaConsumidorNome.edCidade.Text);
        QNotaNomeDESC_ESTADO.Value    := Trim(FNotaConsumidorNome.edEstado.Text);
        QNotaNomeDESC_CEP.Value       := Trim(FNotaConsumidorNome.edCEP.Text);
        if QNotaSaida.State = DsInsert then
        begin
          QNotaSaida.Post;
          QNotaSaida.Edit;
        end;
        QNotaNome.Post;
      end;
    end;
    //Descomentado desta linha até o final para impressão da nota do Consumidor. 14-fev-2012
    if (DMParamSistema.CodEmpresa <> 'ARISTIDES') and
       (DMParamSistema.CodEmpresa <> 'COZER')     and
       (DMParamSistema.CodEmpresa <> 'PROPE')     and
       (DMParamSistema.CodEmpresa <> 'INSIDE')    and
       (DMParamSistema.CodEmpresa <> 'DISPART')   and
       (DMParamSistema.CodEmpresa <> 'KREUZ')     and
       (DMParamSistema.CodEmpresa <> 'MOMBELLI')  and
       (DMParamSistema.CodEmpresa <> 'BORGES')    then
    begin
      if DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.Commit;
      if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
        if (DMOperacao.QOperacaoInd_Cupom_Fiscal.Value = 'S') and (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '65') then
        begin
          if FImpressoraFiscal = nil then
            FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
          FimpressoraFiscal.EmiteCF_Yanco(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
        end
        else
          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value);
    end;
  end;
end;

procedure TFNotaFrenteCaixa.DBRGCondPagtoChange(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BEGNINI' then
    if DBRGCondPagto.ItemIndex = 0 then
      DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Clear;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BRASIL' then
  begin
    if (DMOracle.DBCemapa.InTransaction) and (DMNotaSaida.QNotaSaida.State in [dsInsert, dsEdit]) then
    begin
      with DMNotaSaida do
      begin
        if DBRGCondPagto.ItemIndex = 0 then // a vista
          if DMUsuario.CodSeriePadrao <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
        if DBRGCondPagto.ItemIndex = 1 then // a prazo
          if DMUsuario.CodSeriePrazo <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePrazo;

        if DBRGCondPagto.ItemIndex = 2 then // conta corrente
          if DMUsuario.CodSerieCC <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSerieCC;

        if DBRGCondPagto.ItemIndex = 3 then // cartao de credito
        begin
          if DMUsuario.CodSerieCartao <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSerieCartao;
        end;
      end;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.DBEClienteExit(Sender: TObject);
var
  wAux, wData_Cadastro: string;
begin
  inherited;
  if (DMOracle.BuscaNome('SELECT DT_CANCELAMENTO FROM TB_CADASTRO',
    'TB_CADASTRO.COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value))) <> '' then
    raise Exception.Create('Cliente com Cadastro Encerrado!');
  if Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text) <> '' then
  begin
    If DMParamSistema.QParamSistemaNUM_DIAS_RENOVA_CADASTRO.Value <> 0 Then
     Begin
       wData_Cadastro := DMOracle.BuscaNome('SELECT DT_ALTERACAO FROM TB_CADASTRO','COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCod_Cadastro.Text);
       If wData_Cadastro = '' Then
          Raise exception.Create('Realizar atualização de cadastro');
       If StrToDate(wData_Cadastro) < DmOracle.DataServ - DMParamSistema.QParamSistemaNUM_DIAS_RENOVA_CADASTRO.Value Then
          Raise exception.Create('Realizar atualização de cadastro');
     End;
    LblAutoriza.Caption := 'Autorizado:' + DMOracle.BuscaNome('SELECT NOME_CONTATO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
    LblAutoriza.Caption := LblAutoriza.Caption + '-' + DMOracle.BuscaNome('SELECT NOME_CONTATO2 FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
    LblFormaCompra.Caption := DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
    LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc ' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
    LblAutoriza.Caption := LblAutoriza.Caption + ' Oper:' + DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
    wAux := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_RECEBER_CAB ',
      ' IND_SITUACAO<>' + Chr(39) + 'BAIXA TOTAL' + Chr(39) +
      ' AND COD_CADASTRO = ' + Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text));
    if ((wAux <> '') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CEREAIS')   and
                         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'FERRAGENS') and
                         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'EXECUTIVA')) then
//      and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ARISTIDES')) then  Iraci pediu para deixar a mensagem de titulos
      if MessageDLG('Cliente Possui Titulos R$ ' + wAux, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if FContasReceberCons = nil then
          FContasReceberCons := TFContasReceberCons.Create(Application);
        FContasReceberCons.MecodCliente.Text := DmNotaSaida.QNotaSaidaCod_Cadastro.Text;
        FContasReceberCons.BtProcurarClick(Self);
        FContasReceberCons.ShowModal;
      end;
  end
  else
  begin
    lblRamo.Caption := '';
    LblAutoriza.Caption := '';
    LblFormaCompra.Caption := '';
  end;
end;

procedure TFNotaFrenteCaixa.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(17);
end;

procedure TFNotaFrenteCaixa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMNotaSaida do
  begin
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
    QNotaReferenciada.Close;
    QValeProdutoTroca.Close;
  end;
  Action := CaFree;
  FNotaFrenteCaixa := nil;
end;

procedure TFNotaFrenteCaixa.DBGrid1ColExit(Sender: TObject);
var wCodigo, wDescProduto: string;
    wNumFabricante, wQtdEstoque : string;
  ClickedOK: Boolean;
begin
  inherited;
    if DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE' then
      if DMNotaSaida.QItemNFNum_Fabricante.Text <> '' then
      begin
        wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + Chr(39) + DMNotaSaida.QItemNFNum_Fabricante.Text + Chr(39));
        if wCodigo <> '' then
          DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);
      end;
    if (DbGrid1.SelectedField.FieldName = 'COD_PRODUTO') or
      (DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE') then
    begin
      if (DMNotaSaida.QItemNFCod_Produto.Text <> '') then
      begin
         wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + Chr(39) + FloatToStr(DMNotaSaida.QItemNFCod_Produto.Value) + Chr(39));
      if wCodigo = '' then
        raise Exception.Create('Produto Não Cadastrado!');

      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VILCAR') and
         (DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE') and
         ((wCodigo = '745') or (wCodigo = '746')) then
      begin
        ClickedOK := InputQuery('Produto', 'Descrição Produto', wDescProduto);
        if ClickedOK then
          DMNotaSaida.QItemNFDESC_Complemento.Value := wDescProduto;
      end;

      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CASATINTAS') or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES')) and (wCodigo = '20000') then
      begin
        ClickedOK := InputQuery('Produto', 'Descrição Produto', wDescProduto);
        if ClickedOK then
          DMNotaSaida.QItemNFDESC_Complemento.Value := wDescProduto;
      end;

      DMEstoque.QEstoqueCons.Close;
      DMEstoque.QEstoqueCons.SetVariable('Filial', Null);
      DMEstoque.QEstoqueCons.SetVariable('Produto', Null);
      DMEstoque.QEstoqueCons.SetVariable('Tipo_Lote', Null);
      DMEstoque.QEstoqueCons.SetVariable('Cod_Produto', wCodigo);
      DMEstoque.QEstoqueCons.Open;
    end;
    end;
    if (DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO') then
      if ValUn <> DMNotaSaida.QItemNFVAL_UNITARIO.Value then
        DMNotaSaida.QItemNFVAL_UNITARIO_TABELA.Value := DMProduto.PrecoVenda(DMNotaSaida.QItemNFCod_Produto.Value, DMNotaSaida.QNotaSaidaCod_Cadastro.Text,'F',DMNotaSaida.QItemNFCod_Lote_Tipo.Value);


    if (DBGrid1.Columns.Grid.SelectedIndex = 0) then
      LDescProduto.Caption := DMOracle.FastSelect('DESC_PRODUTO'
        , 'TB_PRODUTO', 'COD_PRODUTO = ' + DMNotaSaida.QItemNFCOD_PRODUTO.Text);
    if ((not DMNotaSaida.QItemNFCOD_PRODUTO.IsNull) and (DMNotaSaida.QItemNF.State = dsEdit)) and ((DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO') or (DbGrid1.SelectedField.FieldName = 'QT_QUANTIDADE')) then
    begin
      DMNotaSaida.QItemNF.Post;
      DMNotaSaida.QItemNF.Edit;
    end;
    if ( (DMParamSistema.CodEmpresa = 'MAVENIDA')   or (DMParamSistema.CodEmpresa = 'LACARNES')   or (DMParamSistema.CodEmpresa = 'NFCE-PAOC')  or
         (DMParamSistema.CodEmpresa = 'NFCE-POLAC') or (DMParamSistema.CodEmpresa = 'BRASIL')     or (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') or
         (DMParamSistema.CodEmpresa = 'NFCE-PIVA')  or (DMParamSistema.CodEmpresa = 'FINESTRA')   or (DMParamSistema.CodEmpresa = 'CONSTRUMED') or
         (DMParamSistema.CodEmpresa = 'NFCE-DGUST') or (dmparamsistema.CodEmpresa = 'NFCE-LOCKS') or (DMParamSistema.CodEmpresa = 'SCALA')      or
         (DMParamSistema.CodEmpresa = 'RENATOAUTO') or (DMParamSistema.CodEmpresa = 'ACIME') )
       and (DbGrid1.SelectedField.FieldName = 'QT_QUANTIDADE') then
    begin
      DBGrid1.SelectedIndex := 5;
      exit;
    end;

    if ( ((DMParamSistema.CodEmpresa = 'FERRAGENS') or (DMParamSistema.CodEmpresa = 'LACARNES') or (DMParamSistema.CodEmpresa = 'FINESTRA') or
          (DMParamSistema.CodEmpresa = 'NFCE-DGUST')  ) and
       ((DbGrid1.SelectedField.FieldName = 'VAL_DESCONTO') or
        (DbGrid1.SelectedField.FieldName = 'val_total_com_desconto') or
        (DbGrid1.SelectedField.FieldName = 'VAL_TOTAL'))) or
        //((DMParamSistema.CodEmpresa = 'RETIFOZ') and
        ( ((DMParamSistema.CodEmpresa = 'MAVENIDA') or (DMParamSistema.CodEmpresa = 'NFCE-PAOC') or (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') ) and
         (DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO')) or
        ((DMParamSistema.CodEmpresa <> 'LACARNES')  and
         (DMParamSistema.CodEmpresa <> 'FERRAGENS') and
         (DMParamSistema.CodEmpresa <> 'FINESTRA') and
         (DMParamSistema.CodEmpresa <> 'NFCE-DGUST') ) then
      MECodBarras2.SetFocus;
//Adicionado validação pois na Agrovale estava ficando produto sem informar o valor unitário. Alex 17/05/2022
    if (DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO') then
    begin
      if (DMNotaSaida.QItemNFVAL_UNITARIO.Value = 0) then
      begin
        ShowMessage('Favor informar um valor para o produto');
        DBGrid1.SetFocus;
        DBGrid1.SelectedIndex := 4;
      end;
    end;
//Solicitado por Everton da Ferragem Medianeira para que quando a quantidade informada seja maior que a quantidade do estoque não permita continuar. Alex 05/10/2022.
//Cod_suporte: 5941
    if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') then
      ValidaEstoque(sender);

    if (DMParamSistema.CodEmpresa = 'PIXIXE_FAB') then
      DBGrid1.SelectedIndex := 2;

    if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') or (DMParamSistema.CodEmpresa = 'HPPECAS') then
      DMNotaSaida.DescontoItemFrenteCaixa(DMNotaSaida.QItemNFVAL_UNITARIO.Text,True) ;
end;

procedure TFNotaFrenteCaixa.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if ( (DMParamSistema.CodEmpresa = 'MAVENIDA')   or (DMParamSistema.CodEmpresa = 'LACARNES') or (DMParamSistema.CodEmpresa = 'NFCE-PAOC')  or
       (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') or (DMParamSistema.CodEmpresa = 'FINESTRA') or (DMParamSistema.CodEmpresa = 'NFCE-DGUST') or
       (DMParamSistema.CodEmpresa = 'ACIME')  ) and (key = #13) then
  //if (DMParamSistema.CodEmpresa = 'RETIFOZ') and (key = #13) then
  begin
    key := #0;
    TDBGrid(Sender).Perform(WM_KeyDown,VK_Tab,0)
  end
  else
    if (key = #13) and (Dbgrid1.Columns.Grid.SelectedIndex = 0) then
      Dbgrid1.Columns.Grid.SelectedIndex := 1;

  if (key = #13) and ((not DMNotaSaida.QItemNFCOD_PRODUTO.IsNull) and (DMNotaSaida.QItemNF.State = dsEdit)) and
                    ((DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO') or (DbGrid1.SelectedField.FieldName = 'QT_QUANTIDADE')) then
    begin
      DMNotaSaida.QItemNF.Post;
      if DMParamSistema.CodEmpresa <> 'BAZAR' then
        DMNotaSaida.QItemNF.Edit
      else
        MECodBarras2.SetFocus;
    end;
end;

procedure TFNotaFrenteCaixa.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ' then
    if (DMNotaSaida.QItemNfCod_Produto.Value = 0) or (DMNotaSaida.QItemNfCod_Produto.Text = '') then
      Dbgrid1.Columns.Grid.SelectedIndex := 0;
end;

procedure TFNotaFrenteCaixa.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFNotaFrenteCaixa.BtConsCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaFrenteCaixa.SBComprovanteEntregaClick(Sender: TObject);
begin
  inherited;
  if (Trim(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) <> '') and
     (Trim(DMNotaSaida.QNotaSaidaInd_Situacao.Text) = '2') then
  begin
    if FNotaComprovanteEntrega = nil then
      FNotaComprovanteEntrega := TFNotaComprovanteEntrega.Create(Application);
    FNotaComprovanteEntrega.showModal;
  end
  else
    raise Exception.Create('Informe uma nota confirmada para gerar o Comprovante de Entrega');

end;

procedure TFNotaFrenteCaixa.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PGNota.ActivePage := TSItens;
  PGNotaChange(Self);
end;

procedure TFNotaFrenteCaixa.FormCreate(Sender: TObject);
begin
  Buscador.Limpa;
  Buscador.Adiciona('NOME', 'TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  Buscador.Buscar;
  StBLongHint.SimpleText := 'Usuário:' +  Buscador.Proximo + ' (' + IntToStr(DMUsuario.CodUsuarioCorrente) + ')';
  StBLongHint.Repaint;

  wVendaSimples := False;

  inherited;
  if (DMParamSistema.CodEmpresa = 'CONSTRUIR') then
  begin
    DBRGCondPagto.Items.Clear;
    DBRGCondPagto.Items.add('A Vista');
    DBRGCondPagto.Items.add('A Prazo');
  end;
  if (DMParamSistema.CodEmpresa = 'FOGOES') then
  begin
    DBRGCondPagto.Items.Clear;
    DBRGCondPagto.Items.add('A Vista');
    DBRGCondPagto.Items.add('A Prazo');
    DBRGCondPagto.Items.add('Outros');
    DBRGCondPagto.Items.add('Cartão');
  end;
  if (DMParamSistema.CodEmpresa = 'DINGLIS') then
  begin
    DBRGCondPagto.Columns := 3;
    DBRGCondPagto.Items.Clear;
    DBRGCondPagto.Items.add('A Vista');
    DBRGCondPagto.Items.add('A Prazo');
    DBRGCondPagto.Items.add('Cartão/Cheque');
  end;
  if (DMParamSistema.CodEmpresa = 'RUDI') then
  begin
    MeCodBarra.Visible := True;
    LCodBarra.Visible := True;
    Label2.Visible := False;
    DBEdit5.Visible := False;
    BtConsCadastroParceiro.Visible := False;
    Label64.Visible := False;
    DBEDepartamento.Visible := False;
    BtConsDepartamento.Visible := False;
    DBRGCondPagto.Items.Clear;
    DBRGCondPagto.Items.add('A Vista');
    DBRGCondPagto.Items.add('A Prazo');
    DBRGCondPagto.Items.add('Cartão Débito');
    DBRGCondPagto.Items.add('Cartão Crédito');
  end
  else
  begin
    MeCodBarra.Visible := False;
    LCodBarra.Visible := False;
  end;
 // PGNota.ActivePage := TSFrenteCaixa; //comentado marcos 28/04/17

  if (DMParamSistema.CodEmpresa = 'ARISTIDES') Or (DMParamSistema.CodEmpresa = 'BEGNINI') Or
     (DMParamSistema.CodEmpresa = 'CONSTRUIR') Then
  begin
    DbGrid1.Columns.Items[8].Visible := False;
    DbGrid1.Columns.Items[9].Visible := False;
    DbGridEstoque.Visible := False;
    ImgProduto.Visible := False;
    Bevel1.Visible := False;
    lblImagemNaoDisponivel.Visible := False;
    LClique.Visible := False;
    BtConsCadastro.TabStop := false;
  end;
  {if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VILCAR') then
  begin
    DBGrid1.Columns[1].Visible := False;
  end;}

  if (DMParamSistema.CodEmpresa = 'ARISTIDES') then
    DMNotaSaida.QItemNFVAL_UNITARIO.DisplayFormat := '#,###0.00';

  if (DMParamSistema.CodEmpresa = 'UNIFORME') or (DMParamSistema.CodEmpresa = 'NUTRIPET') or (DMParamSistema.CodEmpresa = 'ITATIBA')  then
  begin
    DbGridEstoque.Columns[3].Visible := DMUsuario.Privilegiado;
  end;

  if (DMParamSistema.CodEmpresa = 'DINIZ') then
  begin
    DbGrid1.Columns.Items[7].Index := 3;
    DbGrid1.Columns.Items[1].Index := 6;
  end;
  if (DMParamSistema.CodEmpresa <> 'DINIZ') and (DMParamSistema.CodEmpresa <> 'GERALPECAS') and (DMParamSistema.CodEmpresa <> 'CEIFAGRIL')  and
     (DMParamSistema.CodEmpresa <> 'VILCAR') and {JUNIOR 22-04-2013} (DMParamSistema.CodEmpresa <> 'FOGOES') then //JUNIOR 13-06-2013
 //    DbGrid1.Columns[0].Free; //:= False;

  If (DMParamSistema.CodEmpresa = 'KREUZ') Then
  begin
    LblDespesas.Visible := True;
    DbDespesas.Visible := True;
    LblDespesas.Top := 304;
    DbDespesas.Top := 320;
  end;
  if (DMParamSistema.CodEmpresa = 'BARRAUS') then
  begin
    DbGridEstoque.Columns[3].Visible := False;
  end;

  if (DMParamSistema.CodEmpresa = 'QUERENCIA') and (DMUsuario.Privilegiado = False) then
  begin
    DBGrid1.Columns.Items[3].ReadOnly := True;
    DBGrid1.Columns.Items[4].ReadOnly := True;
    DBGrid1.Columns.Items[5].ReadOnly := True;
  end;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PAULINHO' then
  begin
    DBGrid1.Columns.Items[5].Visible := false; // Valor do desconto
    DBGrid1.Columns.Items[6].Visible := true;  // Valor total com desconto
    DBGrid1.Columns.Items[7].Visible := false; // Valor total
    DBGrid1.Columns.Items[8].Visible := true; // Valor unitário com desconto
    DBGrid1.Columns.Items[8].Index := 5;
  end
  else
    DBGrid1.Columns.Items[8].Visible := false;
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    DBGrid1.Columns.Items[1].Visible := True;
    DBGrid1.Columns.Items[1].Width   := 165;
    DBGrid1.Columns.Items[3].Width   := 550;
    DBGrid1.Columns.Items[4].Visible := True;
    DBGrid1.Columns.Items[4].Width   := 48;
  end;
  if (DMParamSistema.CodEmpresa = 'OSARE') or (DMParamSistema.CodEmpresa = 'DUST') or (DMParamSistema.CodEmpresa = 'PIXIXE_FAB') then
  begin
    DBGrid1.Columns.Items[4].Visible := True;
  end;
  if (DMParamSistema.CodEmpresa = 'SCALA') or (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
  begin
    DBGrid1.Columns.Items[1].Visible := True;
    DBGrid1.Columns.Items[1].Width   := 145;
  end;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);

end;

procedure TFNotaFrenteCaixa.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_NUM_NOTA_INCLUSAO.Value = 'SIM' then
  begin
    if DMNotaSaida.QNotaSaidaNum_Nota.Value = 0 then
          DMNotaSaida.QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(DMNotaSaida.QNotaSaidaCod_Filial.Value, DMNotaSaida.QNotaSaidaCod_Serie.Value,
            DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value, True);
  end;
  DBCBTipoCartao.Visible := False;

  PGNota.ActivePage := TSFrenteCaixa;

  MECodBarras2.SetFocus;

  if DMParamSistema.QparamSistemaCod_Empresa.Value = 'MINIMART' then
    PGNota.ActivePage := TSItens;

  FNotaSaidaCons.wRetornoCondicional := False;
  MeCodValeProduto.Clear;
  VendaSimples;
end;

procedure TFNotaFrenteCaixa.DBEdit17Change(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QItemNFnome_produto.Value <> '' then
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then //aqui problema do moinho do oracle 10, problema do campo LOB da imagem. quando for resolvido o problema no moinho esse if pode ser removido.
      AtualizarImagemProduto;
end;

procedure TFNotaFrenteCaixa.AtualizarImagemProduto;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  lblProduto.Caption := DMNotaSaida.QItemNFnome_produto.Value;
  lblPreco.Caption := formatFloat('#,##0.00', DMNotaSaida.QItemNFVAL_UNITARIO.value);

  DMNotaSaida.QImagemProduto.close;
  DMNotaSaida.QImagemProduto.SetVariable('COD_PRODUTO', DMNotaSaida.QItemNFCOD_PRODUTO.AsInteger);
  DMNotaSaida.QImagemProduto.open;

  // transferindo a fotografia para o objeto TStream
  b := DMNotaSaida.QImagemProduto.CreateBlobStream(DMNotaSaida.QImagemProdutoIMG_IMAGEM, bmRead);

  // se o registro não possui fotografia então apagaremos a imagem
  // atual dentro do TImage, senão vai parecer que a fotografia seguinte
  // será igual a anterior
  if b.Size > 0 then
  begin
    // aqui ta o problema, como recuperar o jpeg do banco
    // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
    // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      jpg.SaveToFile('c:\salvoumesmo.jpg');
      imgProduto.Picture.Assign(Jpg);
      IImagemFull.Picture.Assign(Jpg);
      imgProduto.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgProduto.Picture.Assign(nil);
    IImagemFull.Picture.Assign(nil);
    imgProduto.Visible := false;
  end;

  lblImagemNaoDisponivel.Visible := not imgProduto.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFNotaFrenteCaixa.BtCondicaoClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;
    DBEdit7Exit(Self);
  end;
end;

procedure TFNotaFrenteCaixa.DBEdit7Exit(Sender: TObject);
var wPrazo: String;
begin
  inherited;
  If Trim(DbEdit7.Text) <> '' Then
     DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '2'
  Else
     DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1';
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES'  Then
   Begin
     if Trim(DbEdit7.Text) = '1' then
       DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1';
     if (Trim(DbEdit7.Text) = '13') or
        (Trim(DbEdit7.Text) = '14') then
       DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1'; // foi solicitado pela andressa para colocar a vista
     // se for tef deve ser a vista
     if Trim(DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text) <> '' then
     begin
       wPrazo := UpperCase(Trim(DMOracle.FastSelect('DESC_PRAZO_VENCIMENTO','TB_PRAZO_VENCIMENTO',
            'COD_PRAZO_VENCIMENTO = ' +
            DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Text)));
       if Pos('CARTAO',wPrazo) > 0 then
       begin
         LBTipoCartao.Visible := True;
         DBCBTipoCartao.Visible := True;
         DBCBTipoCartao.SetFocus;
         DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '4';
         if DMNotaSaida.QNotaSaidaIND_MODALIDADE_CARTAO.Value = '' then
           DMNotaSaida.QNotaSaidaIND_MODALIDADE_CARTAO.Value := 'TEF Crédito';
       end
       else
       begin
         LBTipoCartao.Visible := False;
         DBCBTipoCartao.Visible := False;
         DMNotaSaida.QNotaSaidaIND_MODALIDADE_CARTAO.AsVariant := null;
       end;
     end;
   End; 
end;

procedure TFNotaFrenteCaixa.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VoltaConfirmao1Click(Self);
end;

procedure TFNotaFrenteCaixa.CancelaNota1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.CancelarNota1Click(Self);
end;

procedure TFNotaFrenteCaixa.DBEClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 123 then //123 = F12
    BtConsCadastro.Click;
end;

procedure TFNotaFrenteCaixa.PGNotaChange(Sender: TObject);
begin
  inherited;
  if PgNota.ActivePage = TsItens then
  begin
    DBGrid1.SelectedIndex := 0;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RUDI') then
    begin
      PGNota.ActivePage := TSItens;
      MeCodBarra.SetFocus;
    end
    else
    begin
      if (DMParamSistema.CodEmpresa = 'CONSTRUIR') or (DMParamSistema.CodEmpresa = 'COZER') or
         (DMParamSistema.CodEmpresa = 'DINGLIS') or (DMParamSistema.CodEmpresa = 'NFCE-ANJO') or
         (DMParamSistema.CodEmpresa = 'PAPELARIA') or (DMParamSistema.CodEmpresa = 'NFCE-DEB') or
         (DMParamSistema.CodEmpresa = 'NFCE-BAHIA') or (DMParamSistema.CodEmpresa = 'BIKEBOX') or
         (DMParamSistema.CodEmpresa = 'PROPE') Then
        MECodBarras2.SetFocus
      else
        DBGrid1.SetFocus;
    end;
    with DMNotaSaida do
      if (QNotaSaidaCOD_OPERACAO.Text <> '') and (QNotaSaidaIND_SITUACAO.Value = '1') then
        if DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO',
         'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), True) = 'D' then
          FNotaSaidaCad.BtNotaCompra_ConsClick(Self);
  end;  
end;

procedure TFNotaFrenteCaixa.DBECodOperacaoExit(Sender: TObject);
var
  wOperacao: string;
begin
  inherited;
  if Trim(DBECodOperacao.Text) <> '' then
    with DMNotaSaida do
    begin
      if DMOracle.FastSelect('IND_TIPO_OPERACAO', 'TB_OPERACAO', 'COD_OPERACAO = ' + DBECodOperacao.Text) <> 'S' then
      begin
        DMNotaSaida.QNotaSaidaCOD_OPERACAO.Clear;
        DBECodOperacao.SetFocus;
        raise Exception.Create('A operação informada não é de saida.');
      end;
      wOperacao := DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_OPERACAO', 'COD_OPERACAO = ' + QNotaSaidaCod_Operacao.Text, True);
      if wOperacao <> '' then
      begin
        QNotaSaidaCOD_SERIE.Text := wOperacao;
      end;
    end;
end;

procedure TFNotaFrenteCaixa.MeCodBarraExit(Sender: TObject);
var wInseriu: Boolean;
  wCodBarras: string;
  wProduto, wLote: Integer;
begin
  inherited;
  wInseriu := False;

  if Trim(MeCodBarra.Text) = '' then
    Exit;

  wCodBarras := MeCodBarra.Text;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PIVA' then
  begin
    wProduto := StrToInt(copy(Trim(MeCodBarra.Text), 1, 6));
    wLote := StrToInt(copy(Trim(MeCodBarra.Text), 7,2));
  end
  else
  begin
    wProduto := StrToInt(Trim(MeCodBarra.Text));
    wLote := 1;
  end;

  if ((wProduto = 0) or (DMOracle.FastSelect('COUNT(*)', 'TB_PRODUTO', 'COD_PRODUTO = ' + IntToStr(wProduto)) = '0')) then
  begin
    MessageDlg('Produto inexistente.', mtError, [mbOK], 0);
    Exit;
  end;

  if FNotaSaidaCons.wRetornoCondicional then
  begin
    DMNotaSaida.QItemNF.First;
    while not DMNotaSaida.QItemNF.Eof do
    begin
      if ((Trunc(DMNotaSaida.QItemNFCOD_PRODUTO.AsInteger) = wProduto) and (Trunc(DMNotaSaida.QItemNFCOD_LOTE_TIPO.AsInteger) = wLote)) then
      begin
        if DMNotaSaida.QItemNFQT_QUANTIDADE.Value > 1 then
        begin
          DMNotaSaida.QItemNF.Edit;
          DMNotaSaida.QItemNFQT_QUANTIDADE.Value := DMNotaSaida.QItemNFQT_QUANTIDADE.Value - 1;
          if DMNotaSaida.QItemNFVAL_UNITARIO.IsNull then
            DMNotaSaida.QItemNFVAL_UNITARIO.Value := 0;
          DMNotaSaida.QItemNF.Post;
          DMNotaSaida.QItemNF.First;
        end
        else
          DMNotaSaida.QItemNF.Delete;
        Break;
      end;
      DMNotaSaida.QItemNF.Next;
    end;
  end
  else
  begin
    DMNotaSaida.QItemNF.First;
    while not DMNotaSaida.QItemNF.Eof do
    begin
      if ((Trunc(DMNotaSaida.QItemNFCOD_PRODUTO.AsInteger) = wProduto) and (Trunc(DMNotaSaida.QItemNFCOD_LOTE_TIPO.AsInteger) = wLote)) then
      begin
        wInseriu := True;

        DMNotaSaida.QItemNF.Edit;
        DMNotaSaida.QItemNFQT_QUANTIDADE.Value := DMNotaSaida.QItemNFQT_QUANTIDADE.Value + 1;
        if DMNotaSaida.QItemNFVAL_UNITARIO.IsNull then
          DMNotaSaida.QItemNFVAL_UNITARIO.Value := 0;
        DMNotaSaida.QItemNF.Post;

        Break;
      end;
      DMNotaSaida.QItemNF.Next;
    end;

    if (not (wInseriu)) then
    begin
      DMNotaSaida.QItemNF.Append;
      DMNotaSaida.QItemNFCOD_PRODUTO.Value := wProduto;
      DMNotaSaida.QItemNFCOD_LOTE_TIPO.Value := wLote;
      if DMNotaSaida.QItemNFVAL_UNITARIO.IsNull then
        DMNotaSaida.QItemNFVAL_UNITARIO.Value := 0;
      DMNotaSaida.QItemNF.Post;
    end;
  end;

  MeCodBarra.Clear;
  MeCodBarra.SetFocus;
end;

procedure TFNotaFrenteCaixa.MeCodBarraEnter(Sender: TObject);
begin
  inherited;
  MeCodBarra.SelectAll;
end;

procedure TFNotaFrenteCaixa.DBGrid1ColEnter(Sender: TObject);
var
  dbg: TDBGrid;
  col: TColumn;
  wCodigo: string;
begin
  inherited;
  dbg := Sender as TDBGrid;
  col := dbg.Columns.Items[dbg.SelectedIndex];
  if col.FieldName = 'VAL_UNITARIO' then
    ValUn := DMNotaSaida.QItemNFVAL_UNITARIO.Value;
end;

procedure TFNotaFrenteCaixa.ImgProdutoClick(Sender: TObject);
begin
  inherited;
  PnImagemFull.BringToFront;
  PnImagemFull.Visible := True;
end;

procedure TFNotaFrenteCaixa.IImagemFullClick(Sender: TObject);
begin
  inherited;
  PnImagemFull.SendToBack;
  PnImagemFull.Visible := False;
end;

procedure TFNotaFrenteCaixa.DbObraDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FObraCons;
  Classe := TFObraCons;
end;

procedure TFNotaFrenteCaixa.VendaSimples;
begin
  if DMParamSistema.QParamSistemaIND_VENDA_SIMPLES.Value <> 'S' then
    Exit;

  if FVendaSimples = nil then
    FVendaSimples := TFVendaSimples.Create(Application);
  if FVendaSimples.ShowModal = MrOK then
  begin
    with DMNotaSaida do
    begin
      CdVendaSimples.First;
      QNotaSaidaCOD_CADASTRO.Value := CdVendaSimplesCOD_CADASTRO.Value;
      if (CdVendaSimplesCOD_PRAZO_VENCIMENTO.Value <> 0) then
      begin
        QNotaSaidaCOD_PRAZO_VENCIMENTO.Value := CdVendaSimplesCOD_PRAZO_VENCIMENTO.Value;
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
      end
      else
        QNotaSaidaIND_CONDICAO_PAGTO.Value := '1';
      QNotaSaida.Post;
      QNotaSaida.Edit;

      CdVendaSimplesItem.Filtered := False;
      CdVendaSimplesItem.Filter := 'QT_QUANTIDADE IS NOT NULL';
      CdVendaSimplesItem.Filtered := True;
      CdVendaSimplesItem.First;
      while not CdVendaSimplesItem.Eof do
      begin
        QItemNF.Append;
        QItemNFCOD_PRODUTO.Value := CdVendaSimplesItemCOD_PRODUTO.Value;
        QItemNFQT_QUANTIDADE.Value := CdVendaSimplesItemQT_QUANTIDADE.Value;
        QItemNFVAL_UNITARIO.Value := CdVendaSimplesItemVAL_UNITARIO.Value;
        QItemNF.Post;

        CdVendaSimplesItem.Next;
      end;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.DBEdit11Exit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ') then
   Begin
     If (DMNotaSaida.QNotaSaidaCod_Serie.Value = 'PE') Or
        (DMNotaSaida.QNotaSaidaCod_Serie.Value = '1')  Then
        DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '2';
     If DMNotaSaida.QNotaSaidaCod_Serie.Value = 'CUP' Then
        DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := '2D';

     If DMNotaSaida.QNotaSaidaCod_Serie.Value = '1' Then
        DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := '55';
   End;     
end;

procedure TFNotaFrenteCaixa.btSerieConsClick(Sender: TObject);
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
     DBPanel1.OnCodigoExit(self);
    end;
  end;
end;

procedure TFNotaFrenteCaixa.DBPanel1CodigoExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaFrenteCaixa.MECodBarras2Exit(Sender: TObject);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'CASACARNES' then
    MECodBarras2ExitCasaCarnes
  else if DMParamSistema.CodEmpresa = 'NFCE-RAUBE' then
    //MECodBarras2ExitRAUBER //21/07/2020
    MECodBarras2ExitRAUBERNovaBalanca
  else if DMParamSistema.CodEmpresa = 'QUERENCIA' then //Passou a trabalhar com etiqueta de balança. Suporte(12983) - Junior 21/08/2019
    MECodBarras2ExitQuerencia
  else if DMParamSistema.CodEmpresa = 'JASOL' then
    MECodBarras2ExitJasol
  else if DMParamSistema.CodEmpresa = 'FERRAGMED' then
    MECodBarras2ExitFERRAGEM
  else if (DMParamSistema.CodEmpresa = 'RETIFOZ') then
    MECodBarras2ExitRETIFOZ                                                      
  else if DMParamSistema.CodEmpresa = 'CHAPEUP' then
    MECodBarras2ExitCHAPEUP
  else if DMParamSistema.CodEmpresa = 'LACARNES' then
    MECodBarras2ExitLaCarnes
  else if (DMParamSistema.CodEmpresa = 'MAVENIDA') then
    MECodBarras2ExitMAVENIDA
  else if DMParamSistema.CodEmpresa = 'AGROCAMPO' then
    MECodBarras2ExitAGROCAMPO
  else if (DMParamSistema.CodEmpresa = 'CASAPEIXE') or (DMParamSistema.CodEmpresa = 'NFCE-CASAP') then
    MECodBarras2ExitCASADOPEIXE
  else if (DMParamSistema.CodEmpresa = 'HPPECAS') then
    MECodBarras2ExitHPPECAS                           
  else if (DMParamSistema.CodEmpresa = 'FRACTA') then
    MECodBarras2ExitFRACTA
  else if (DMParamSistema.CodEmpresa = 'EMBGARCIA') or (DMParamSistema.CodEmpresa = 'EMBVAL') or (DMParamSistema.CodEmpresa = 'EMBFOZ') then
    MECodBarras2ExitEMBEMA
  else if (DMParamSistema.CodEmpresa = 'NFCE-PAOC') then
    MEcodBarras2ExitCASADOPAO
  else if (DMParamSistema.CodEmpresa = 'NFCE-ITALI') then
    MECodBarras2ExitITALIA
  else if (DMParamSistema.CodEmpresa = 'NFCE-LOCKS') then
    MECodBarras2ExitCASADOPAOFLORENCA
  else if (DMParamSistema.CodEmpresa = 'LUCILUCI') then
    MECodBarras2ExitLUCILUCI
  else if (DMParamSistema.CodEmpresa = 'PRAIASMI') then
    MECodBarras2ExitPRAIASMI
  else if (DMParamSistema.CodEmpresa = 'BRASIL') then
    MECodBarras2ExitBRASIL
  else if (DMParamSistema.CodEmpresa = 'DUST') then
    MECodBarras2ExitDUST
  else if (DMParamSistema.CodEmpresa = 'FINESTRA') then
    MECodBarras2ExitFINESTRA
  else if (DMParamSistema.CodEmpresa = 'NFCE-DGUST') then
    MECodBarras2ExitDGUST
  else if (DMParamSistema.CodEmpresa = 'SCALA') then
    MECodBarras2ExitSCALA
  else if (DMParamSistema.CodEmpresa = 'RENATOAUTO') then
    MECodBarras2ExitSCALA
  else
    MECodBarras2ExitNormal;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitNormal;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wSender, Sender: TObject;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') and (Length(MECodBarras2.Text) = 8) then
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(copy(MECodBarras2.Text,1,6))))
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NFCE-BAHIA') and (Length(MECodBarras2.Text) = 13) then
      begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,2,6))));
        wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/1000;
        wLote := '1';
      end
      else
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE')  then
      begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,1,6))));
        if Length(MECodBarras2.Text) = 8 then
          wLote := Copy(MECodBarras2.Text,7,2)
        else
          wLote := '1';
      end
      else
      Begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));
        wLote := '1';
      end;
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') then
          QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        if (DMParamSistema.CodEmpresa = 'DONABENTA') then
          ValidaEstoque(wSender);

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;

  end
  else
  begin
    if (DMParamSistema.CodEmpresa = 'FERRAGENS') or (DMParamSistema.CodEmpresa = 'NFCE-POLAC') or (DMParamSistema.CodEmpresa = 'BRASIL') or
       (DMParamSistema.CodEmpresa = 'NFCE-DOGAO') or (DMParamSistema.CodEmpresa = 'NFCE-PIVA') or (DMParamSistema.CodEmpresa = 'CONSTRUMED') then
    begin
      DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
      DBGrid1.SetFocus;
    end;
  end;
//  MECodBarras2.SetFocus;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitBRASIL;
var wCodProduto, wLote :String;
    wAchou, ClickedOK : boolean;
    wPeso: Double;
    wValVarejo, wInfAdicional: String;
    wSender, Sender: TObject;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));
      wLote := '1';
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    with DMNotasaida do
    begin
      QItemNF.First;
      wAchou := false;
      while (not QItemNF.Eof) and (not wAchou) do
      begin
        if ((QItemNFCOD_PRODUTO.Value = StrToInt(wCodProduto)) and (QItemNFCOD_LOTE_TIPO.Value = StrToInt(wLote)))then
        begin
          QItemNF.Edit;
          if wPeso > 0 then
            QItemNFQT_QUANTIDADE.Value := QItemNFQT_QUANTIDADE.Value + wPeso
          else
          QItemNFQT_QUANTIDADE.Value := QItemNFQT_QUANTIDADE.Value + 1;
          QItemNF.Post;
          wAchou := true;
        end
        else
          QItemNF.Next;
      end;
      if not wAchou then
      begin
        if DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto) = '' then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNF.Post;
    end;
    MECodBarras2.SetFocus;
  end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitPRAIASMI;
var wCodProduto, wLote :String;
    wAchou, ClickedOK : boolean;
    wPeso: Double;
    wValVarejo, wInfAdicional: String;
    wSender, Sender: TObject;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));
      wLote := '1';
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
      DMNotaSaida.QItemNF.First;
      wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
       if (wValVarejo = '') or (wValVarejo = '0') then
         MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
       if DMNotaSaida.QItemNF.State = dsInsert then
         QItemNF.Edit
       else
         QItemNF.Insert;
       QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
       ClickedOK := InputQuery('Observação', 'Observação do Produto', wInfAdicional);
       if ClickedOK then
         QItemNFDESC_INF_ADICIONAL.Value := wInfAdicional;
       QItemNF.Post;
       MECodBarras2.SetFocus;
    end;
  end
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitLUCILUCI;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wSender, Sender: TObject;
begin
  inherited;

  if (DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 1) then
    wLote := '1'
  else
    wLote := '2';

  if trim(MECodBarras2.Text) <> '' then
  begin
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') and (Length(MECodBarras2.Text) = 8) then
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(copy(MECodBarras2.Text,1,6))))
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'NFCE-BAHIA') and (Length(MECodBarras2.Text) = 13) then
      begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,2,6))));
        wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/1000;
        wLote := '1';
      end
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitEMBEMA;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    with DMNotasaida do
    begin
      QItemNF.First;
      wAchou := false;
      while (not QItemNF.Eof) and (not wAchou) do
      begin
        if QItemNFCOD_PRODUTO.Value = StrToInt(wCodProduto) then
        begin
          QItemNF.Edit;
          QItemNFQT_QUANTIDADE.Value := QItemNFQT_QUANTIDADE.Value + 1;
          QItemNF.Post;
          wAchou := true;
        end
        else
          QItemNF.Next;
      end;
      if not wAchou then
      begin
        if DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto) = '' then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNF.Post;
      end;
    end;
    MECodBarras2.SetFocus;
  end;

end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitLACARNES;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo, wTipoBalanca, wPortaCom, wLePeso: String;
    wCodProduto2 : integer;
    LePorta: TBalanca;
begin
  inherited;
  wTipoBalanca := DMOracle.FastSelect('DESC_TIPO_BALANCA','TB_FILIAL','COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
  wPortaCom    := DMOracle.FastSelect('IND_PORTA_BALANCA','TB_FILIAL','COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
       if (wValVarejo = '') or (wValVarejo = '0') then
         MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);

       if DMNotaSaida.QItemNF.State = dsInsert then
         QItemNF.Edit
       else
         QItemNF.Insert;

       QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
       //inicio bloco
       // Troca de IND_ENVIA_BALANCA para IND_PESAVEL. Jefferson 18/10/2024 Suporte: 9641
       if (DMOracle.FastSelect('IND_PESAVEL','TB_PRODUTO','COD_PRODUTO = ' + wCodProduto) = 'SIM') then
       begin
         if LePorta = nil then
           LePorta := TBalanca.Create;
         LePorta.AbreSerial(StrToInt(copy(wPortaCom,4,1)),9600,8,1,0);
         wLePeso := LePorta.LePesoToledo;
         if (wLepeso = 'IIIII') or (wLepeso = 'SOBRECARGA') or (wLepeso = 'NNNNN') then
         begin
           ShowMessage('*** BALANÇA INSTÁVEL, SOBRECARGA OU NEGATIVO. VERIFIQUE O VISOR ***');
           QItemNF.Cancel;
           MECodBarras2.SetFocus;
         end
         else if (wLePeso = '00,000') then
         begin
           ShowMessage('*** BALANÇA COM PESO ZERO. VERIFIQUE O VISOR ***');
           QItemNF.Cancel;
           MECodBarras2.SetFocus;
         end
         else
         begin
           QItemNFQT_QUANTIDADE.Text := wLePeso;//LePorta.LePesoToledo;
           QItemNF.Post;
           MECodBarras2.SetFocus;
           LePorta.FechaSerial;
         end;
       end//fim do bloco
       else
       begin
         if wPeso > 0 then
           QItemNFQT_QUANTIDADE.Value := wPeso;
         QItemNF.Post;
         MECodBarras2.SetFocus;
       end;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitITALIA;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitCASADOPAOFLORENCA;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,5)))) );
      if wCodProduto = '0' then
        wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,5) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitMAVENIDA;
var wCodProduto :string;
    wAchou, ClickedOK: boolean;
    wPeso: Double;
    wValVarejo, wCodBarras, wValorProduto, wTipoBalanca, wPortaCom, wLePeso: String;
    wCodProduto2 : integer;
    LePorta: TBalanca;
begin
  inherited;
  wTipoBalanca := DMOracle.FastSelect('DESC_TIPO_BALANCA','TB_FILIAL','COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
  wPortaCom    := DMOracle.FastSelect('IND_PORTA_BALANCA','TB_FILIAL','COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodBarras := Copy(MECodBarras2.Text,1,7) + '000000';
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
//      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,1,7)+'000000'))) );
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(wCodBarras));
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       if DMNotaSaida.QItemNF.State = dsInsert then
         QItemNF.Edit
       else
         QItemNF.Insert;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
       QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
       if (wValVarejo = '') or (wValVarejo = '0') then
       begin
         ClickedOK := InputQuery('Valor', 'Valor do Produto', wValorProduto);
         if ClickedOK then
           QItemNFVAL_UNITARIO.Value := StrToFloat(wValorProduto);
          //MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
       end;
       if (DMOracle.FastSelect('IND_ENVIA_BALANCA','TB_PRODUTO','COD_PRODUTO = ' + wCodProduto) = 'SIM') then
       begin
         if LePorta = nil then
           LePorta := TBalanca.Create;
         LePorta.AbreSerial(StrToInt(copy(wPortaCom,4,1)),9600,8,1,0);
         wLePeso := LePorta.LePesoToledo;
         if (wLepeso = 'IIIII') or (wLepeso = 'SOBRECARGA') or (wLepeso = 'NNNNN') then
         begin
           ShowMessage('*** BALANÇA INSTÁVEL, SOBRECARGA OU NEGATIVO. VERIFIQUE O VISOR ***');
           QItemNF.Cancel;
           MECodBarras2.SetFocus;
         end
         else if (wLePeso = '00,000') then
         begin
           ShowMessage('*** BALANÇA COM PESO ZERO. VERIFIQUE O VISOR ***');
           QItemNF.Cancel;
           MECodBarras2.SetFocus;
         end
         else
         begin
           QItemNFQT_QUANTIDADE.Text := wLePeso;//LePorta.LePesoToledo;
           QItemNF.Post;
           MECodBarras2.SetFocus;
           LePorta.FechaSerial;
         end;
       end
       else
       begin
         if wPeso > 0 then
           QItemNFQT_QUANTIDADE.Value := wPeso;
         QItemNF.Post;
         MECodBarras2.SetFocus;
       end;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitCasaCarnes;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
    //  wCodProduto2 := StrToInt(Copy(MECodBarras2.Text,1,4));
    //  wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(wCodProduto2)) );
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitQuerencia;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitCHAPEUP;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      if wCodProduto = '0' then                                                                 
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;


procedure TFNotaFrenteCaixa.MECodBarras2ExitJasol;
var wCodProduto :string;
    wAchou: boolean;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13)  then //ETIQUETAS DO SISTEMA ANTIGO DA JASOL.
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,3,8)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    {with DMNotasaida do
    begin
      DMNotaSaida.QItemNF.First;
      //Alterado para procurar se já existe o produto e adicionar a qtde, para funcionar a devolução por leitor de cód. Barras. Junior 03/08/2021
      wAchou := false; //
      while (not QItemNF.Eof) and (not wAchou) do
      begin
        if (QItemNFCOD_PRODUTO.Value = StrToInt(wCodProduto))then
        begin
          QItemNF.Edit;
          QItemNFQT_QUANTIDADE.Value := QItemNFQT_QUANTIDADE.Value + 1;
          QItemNF.Post;
          wAchou := true;
        end
        else
          QItemNF.Next;
      end;
      if not wAchou then
      begin
        if DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto) = '' then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;
        QItemNF.Post;
      end; }
      with DMNotasaida do
      begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNF.Post;
        MECodBarras2.SetFocus;
      end;
      MECodBarras2.SetFocus;
{       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
       if (wValVarejo = '') or (wValVarejo = '0') then
         MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
       if DMNotaSaida.QItemNF.State = dsInsert then
         QItemNF.Edit
       else
         QItemNF.Insert;

       QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
       if wPeso > 0 then
         QItemNFQT_QUANTIDADE.Value := wPeso;

       QItemNF.Post;
       MECodBarras2.SetFocus;
    end;}
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitFERRAGEM;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo NUM_FABRICANTE. Soliticao MARCOS. Cleber 10/04/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'NUM_FABRICANTE = ' + QuotedStr(trim(MECodBarras2.Text)));
      wLote := '1';
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    if DMParamSistema.CodEmpresa = 'FERRAGMED' then
        if StrToFloat(DMOracle.BuscaNome('SELECT QT_QUANTIDADE FROM TB_ESTOQUE','COD_PRODUTO ='+wCodProduto)) <= 0 Then
          Raise Exception.Create('Produto sem estoque');
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'OSARE') then
          QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitRETIFOZ;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
begin
  inherited;
  wLote := '2';
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'NUM_FABRICANTE = ' + QuotedStr(trim(MECodBarras2.Text)));
{    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo NUM_FABRICANTE. Soliticao MARCOS. Cleber 10/04/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'NUM_FABRICANTE = ' + QuotedStr(trim(MECodBarras2.Text)));
      wLote := '1';
    end;}
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
        QItemNF.Post;
        DBGrid1.SelectedIndex := 2;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitSCALA;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodigoInt: Integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    wLote := '1';
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'NUM_FABRICANTE = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then
    begin
      if TryStrToInt(Trim(MECodBarras2.Text), wCodigoInt) then
      begin
         wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + IntToStr(wCodigoInt)); //QuotedStr(trim(MECodBarras2.Text)));
         wLote := '1';
      end;
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNF.Post;
        MECodBarras2.SetFocus;
//        DBGrid1.SelectedIndex := 2;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
   
end;


procedure TFNotaFrenteCaixa.MECodBarras2ExitHPPECAS;
var wCodProduto, wLote :String;
    wAchou, ClickedOK : boolean;
    wPeso: Double;
    wValVarejo, wInfAdicional: String;
    wSender, Sender: TObject;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));
      wLote := '1';
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
      DMNotaSaida.QItemNF.First;
      wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
       if (wValVarejo = '') or (wValVarejo = '0') then
         MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
       if DMNotaSaida.QItemNF.State = dsInsert then
         QItemNF.Edit
       else
         QItemNF.Insert;
       QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
       ClickedOK := InputQuery('Observação', 'Observação do Produto', wInfAdicional);
       if ClickedOK then
         QItemNFDESC_INF_ADICIONAL.Value := wInfAdicional;
       QItemNF.Post;
       MECodBarras2.SetFocus;
    end;
  end
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitRAUBER;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,2) = '20')then //2 21/07/2020 mudou a balança
    begin
    //wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(wCodProduto2)) );
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,1,1)))) );
    wValVarejo := Copy(MECodBarras2.Text,7,5);
        wPeso := StrToFloat(Copy(MECodBarras2.Text,7,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;

end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitRAUBERNovaBalanca;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,2) = '20')then //2 21/07/2020 mudou a balança
    begin
//      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +  QuotedStr(copy(MecodBarras2.Text,2,4)));
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +  QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      //      wValVarejo := Copy(MECodBarras2.Text,7,5);
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5)); // StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
      wPeso := wPeso/1000;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitAGROCAMPO;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then //2 21/07/2020 mudou a balança
    begin
//      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +  QuotedStr(copy(MecodBarras2.Text,2,4)));
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +  QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,5)))) );
      //      wValVarejo := Copy(MECodBarras2.Text,7,5);
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5)); // StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
      wPeso := wPeso/1000;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitCASADOPEIXE;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := QuotedStr(Copy(MECodBarras2.Text,2,6));
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + wCodProduto); //QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,6)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,6) +' não corresponde a nenhum produto cadastrado.');
      end;
        wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ 1000;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
//    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitFRACTA;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then //2 21/07/2020 mudou a balança
    begin
//      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +  QuotedStr(copy(MecodBarras2.Text,2,4)));
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' +  QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      {wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5)); // StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
      wPeso := wPeso/1000;}
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitCASADOPAO;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,4)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    {if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));}

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitDUST;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wValVarejo: String;
    wSender, Sender: TObject;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 8) then
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(copy(MECodBarras2.Text,1,6))))
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,1,6))));
      if Length(MECodBarras2.Text) = 8 then
      begin
        wLote := Copy(MECodBarras2.Text,7,2);
        if wLote = '00' then
          wLote := '1';
      end
      else
        wLote := '1';
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitFINESTRA;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,6)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitDGUST;
var wCodProduto :string;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodProduto2 : integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (Length(MECodBarras2.Text) = 13) and (copy(MECodBarras2.Text,1,1) = '2')then
    begin
      wCodProduto := '0'+DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(IntToStr(StrToInt(Copy(MECodBarras2.Text,2,6)))) );
      if wCodProduto = '0' then
      begin
        MECodBarras2.SetFocus;
        raise Exception.Create('O código de barra informado: '+ Copy(MECodBarras2.Text,2,4) +' não corresponde a nenhum produto cadastrado.');
      end;
      wPeso := StrToFloat(Copy(MECodBarras2.Text,8,5))/ StrToFloat(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto))/100;
    end
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(MECodBarras2.Text)));

    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;

        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
        MECodBarras2.SetFocus;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaFrenteCaixa.EmissoCpia1Click(Sender: TObject);
var
  wLote: Integer;
  wNome_Recibo, Modelo,wResult: string;
begin
  inherited;
  FNotaImpressao := TFNotaImpressao.Create;
  if DMParamSistema.QParamSistemaIND_CONFIRMA_EMISSAO.Value = 'S' then // não solicita uma confirmação para imprimir
    if MessageDlg('Deseja emitir a NOTA/PEDIDO Nº ' + DMNotaSaida.QNotaSaidaNUM_NOTA.AsString + ' ?', mtConfirmation, [mbYes, mbNo], 0) = MrNo then // caso nao for imprimir sai da procedure
      Exit;
  Modelo := DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value;
  if (Modelo <> '55') and (Modelo <> '98') and (Modelo <> '65') then
    FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)
  else
  begin
    wResult := DMOracle.BuscaNome('SELECT ID_LOTE FROM TB_NF_ELETRONICA','COD_NOTA_CAB = '+DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text);
    if wResult = '' then
      wLote := 0
    else
      wLote := StrToInt(wResult);
    if not DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull then
      with DMNfe do
      begin
        SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, True);
        if QNfeind_aprovado.Value or QNfeind_cancelado.Value then
        begin
          if FNfEletronicaLoteCons = nil then
            FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
          FNfEletronicaLoteCons.CarregaNota(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
          FNfEletronicaLoteCons.Foco := nfDanfe;
          FNfEletronicaLoteCons.ShowModal;
          Exit;
        end;
        if not QNfeind_denegado.Value then
        begin
          FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value,'',wLote,true); 
        end
        else
        begin
          MessageDlg('Nota denegada. Não será gerada cópia.', mtInformation, [mbOK], 0);
          Exit;
        end;
      end
    else
      FNotaImpressao.EmiteNF(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value,'',wLote,true);
    if (DMNotaSaida.QNotaSaidaVal_AVista.Value > 0) and
       (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES') then
    begin
      DMNfe.SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value,true);
      if (StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO) or
       (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value = '2D') then
      begin
        wNome_Recibo := DMCadastro.QCadastroNome.Value;
        FRecibo_Dos.EmiteRecibo_DOS(wNome_Recibo, 'ENTRADA', DMNotaSaida.QNotaSaidaDt_Emissao.Value,
          DMNotaSaida.QNotaSaidaDt_Emissao.Value, DMNotaSaida.QNotaSaidaVal_AVista.Value, 0, 0, 0,'','','','');
      end;
    end;
  end;
  if (DMParamSistema.CodEmpresa = 'MEDIBENS') then
    DMOracle.DBCemapa.Commit;
   FNotaImpressao.Free;
  SBRefreshClick(Sender);
end;

procedure TFNotaFrenteCaixa.ransaesGerenciaisTEF1Click(Sender: TObject);
begin
  inherited;
//**************************************************************************
  //rotina do TEF
  if FTef = nil then
    FTef := TFTef.Create(Application);
  FTEF.ValorTransacao := 0;
  FTEF.Modalidade := 110;
  FTEF.btIniciaTef.Visible := true;
  FTEF.Comprovantes := TStringList.Create;
  FTEF.lbMensagem.Caption := '';
  //FTEF.PrimeiraInicializacao := True;
  FTEF.ShowModal;
     //fim da rotina do tef
//**************************************************************************

end;

procedure TFNotaFrenteCaixa.Nu(Sender: TObject);
begin
  inherited;
  //Não deixar editar o valor unitario dos produtos para a Cozer. Vanessa 05/10/2013
  if ((DMParamSistema.CodEmpresa = 'COZER') or (DMParamSistema.CodEmpresa = 'PROPE')) then
   begin
    DBGrid1.Columns[3].ReadOnly := true;
   end;
end;

procedure TFNotaFrenteCaixa.InutilizaodeNumerao1Click(Sender: TObject);
begin
  inherited;
  DMNfe.InutilizaNumeracaoNfe;
end;

procedure TFNotaFrenteCaixa.EnviarviaEmail1Click(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull then
  begin
    MessageDlg('Por favor, informe uma nota que contenha chave de acesso.', mtError, [mbOK], 0);
    Exit;
  end;
  with DMNotaSaida do
  begin
    if FNfEletronicaLoteCons = nil then
      FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
    FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
    FNfEletronicaLoteCons.Foco := nfEmail;
    FNfEletronicaLoteCons.ShowModal;
  end;
end;

procedure TFNotaFrenteCaixa.ReemitirDanfe1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfDanfe;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaFrenteCaixa.Reconsultar1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfConsulta;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaFrenteCaixa.Exportar1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfExportar;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaFrenteCaixa.ExportarNotasPorPerodo1Click(Sender: TObject);
var
  filial: Integer;
  cadastro: Integer;
  dtInicial, dtFinal: TDateTime;
begin
  inherited;
  if FExportarNotasParam = nil then
    FExportarNotasParam := TFExportarNotasParam.Create(Application);
  if FExportarNotasParam.ShowModal = mrOk then
  begin
    filial := StrToInt(Trim(FExportarNotasParam.FmFilial1.MeFilial.Text));
    if Trim(FExportarNotasParam.FmCadastro1.MeCadastro.Text) = '' then
      cadastro := 0
    else
      cadastro := StrToInt(Trim(FExportarNotasParam.FmCadastro1.MeCadastro.Text));
    FExportarNotasParam.FmDatas1.ChecaDatasInformadas;
    dtInicial := StrToDateTime(FExportarNotasParam.FmDatas1.MeDtInicial.Text);
    dtFinal := StrToDateTime(FExportarNotasParam.FmDatas1.MeDtFinal.Text + ' 23:59:00');
    if (FExportarNotasParam.RDGTipoDoc.ItemIndex = 0 ) then
      SaveDialogExportaNFes.FileName := 'Notas_' + IfThen(filial=0,'','Filial_'+ IntToStr(filial)+ '_') + FormatDateTime('dd-MM-yyyy',dtInicial) + '_'+FormatDateTime('dd-MM-yyyy',dtFinal);
    if (FExportarNotasParam.RDGTipoDoc.ItemIndex = 1 ) then
      SaveDialogExportaNFes.FileName := 'Notas_Servico_' + IfThen(filial=0,'','Filial_'+ IntToStr(filial)+ '_') + FormatDateTime('dd-MM-yyyy',dtInicial) + '_'+FormatDateTime('dd-MM-yyyy',dtFinal);
    if(SaveDialogExportaNFes.Execute) then
      DMNfe.ExportaNFes(filial, cadastro, dtInicial, dtFinal,FExportarNotasParam.ChkSaida.Checked, FExportarNotasParam.ChkEntrada.Checked, FExportarNotasParam.CBEmailXML.Checked, FExportarNotasParam.CBEmailPDF.Checked, FExportarNotasParam.RDGTipoDoc.ItemIndex = 0 , Trim(SaveDialogExportaNFes.FileName + '.zip'));
  end;
end;

procedure TFNotaFrenteCaixa.VerRetornodeEnvio1Click(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
    if (not QNotaSaidaDESC_CHAVE_ACESSO.IsNull) then
    begin
      if FNfEletronicaLoteCons = nil then
        FNfEletronicaLoteCons := TFNfEletronicaLoteCons.Create(Application);
      FNfEletronicaLoteCons.CarregaNota(QNotaSaidaCOD_NOTA_CAB.Value);
      FNfEletronicaLoteCons.Foco := nfRetornoEnvio;
      FNfEletronicaLoteCons.ShowModal;
    end;
end;

procedure TFNotaFrenteCaixa.EmitirCartadeCorreoEletrnica1Click(
  Sender: TObject);
begin
  inherited;
  SBCartaCorrecaoClick(self);
end;

procedure TFNotaFrenteCaixa.SBCartaCorrecaoClick(Sender: TObject);
var
  RetProcessamento: String;
  IdLote: String;
  ChaveAcesso: String;
begin
  inherited;
  if (DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value = 0) then
    raise Exception.Create('É necessário escolher uma nota para emitir uma Carta de Correção Eletrônica.');
  if DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.IsNull then
  begin
    MessageDlg('A nota precisa ter uma chave de acesso. Se for uma NF-e, confirme-a.', mtError, [mbOK], 0);
    Exit;
  end;
  RetProcessamento := '';
  IdLote := '';
  ChaveAcesso := Copy( DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value,4, 44);
  Buscador.Limpa;
  Buscador.Adiciona('DESC_RETORNO_PROCESSAMENTO', 'TB_NF_ELETRONICA', 'DESC_CHAVE_ACESSO = ' + QuotedStr(ChaveAcesso));
  Buscador.Adiciona('ID_LOTE', 'TB_CCE', 'DESC_CHAVE_ACESSO = ' + QuotedStr(ChaveAcesso));
  Buscador.Buscar();
  RetProcessamento := Buscador.Proximo;
  IdLote := Buscador.Proximo;
  Buscador.Fecha;

  if RetProcessamento <> '100' then
  begin
    MessageDlg('A NF-e deve estar confirmada e autorizada pela Sefaz.', mtError, [mbOK], 0);
    Exit;
  end;

  if FCartaCorrecaoEletronica = nil then
    FCartaCorrecaoEletronica := TFCartaCorrecaoEletronica.Create(application);
  FCartaCorrecaoEletronica.pCodNota := DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value;
  if IdLote <> '' then
    FCartaCorrecaoEletronica.pIdLote := StrToFloat(IdLote)
  else
    FCartaCorrecaoEletronica.pIdLote := 0;

  FCartaCorrecaoEletronica.pChaveAcesso := ChaveAcesso;
  FCartaCorrecaoEletronica.ShowModal;
end;

procedure TFNotaFrenteCaixa.DBPanel1CodigoChange(Sender: TObject);
begin
  inherited;
  DBLBFormasPagamentoNFCe.Visible := DBPanel1.DBEdit.Text = '65';
  LBFormasPagamentoNFCe.Visible := DBLBFormasPagamentoNFCe.Visible;
  DBRGCondPagto.Visible := (not DBLBFormasPagamentoNFCe.Visible) and
                           (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
                           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CONSTRUIR');
  DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := Bib.ift((DBPanel1.DBEdit.Text = '65') and
      (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES'),
      '3',DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value);
end;

procedure TFNotaFrenteCaixa.N1RelaodeNotas1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.RelaodeNotas1Click(Self);
end;

procedure TFNotaFrenteCaixa.N2MapadeVendas1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.MapadeVendas1Click(Self);
end;

procedure TFNotaFrenteCaixa.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DBCBTipoCartao.Visible := False; 
end;

procedure TFNotaFrenteCaixa.DBText9MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DBTSitSefaz.Hint :=
    DMNotaSaida.QNotaSaidadesc_situacao_sefaz.Value;
end;

procedure TFNotaFrenteCaixa.DBCodNotaCabChange(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    MMCadSimples.Items[2].Items[0].Enabled := QNotaSaidaInd_Situacao.Value = '2';
    MMCadSimples.Items[2].Items[1].Enabled := QNotaSaidaInd_Situacao.Value = '1';
    MMCadSimples.Items[2].Items[2].Enabled := QNotaSaidaInd_Situacao.Value = '3';
    QSomaVales.Close;
    QSomaVales.Open;
    QSomaItemNota.Close;
    QSomaItemNota.Open;
    DBCBTipoCartao.Visible := QNotaSaidaIND_MODALIDADE_CARTAO.Value <> '';
    LBTipoCartao.Visible := DBCBTipoCartao.Visible;
  end;
end;

procedure TFNotaFrenteCaixa.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VoltaCancelamento1Click(self);
end;

procedure TFNotaFrenteCaixa.N31Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
    FNotaSaidaParam.PGRelatorio.Pages[56].TabVisible := true;
  if FNotaSaidaParam.ShowModal = MrOK then
    with DMRelatorio_Venda do
    begin
    if (trim(FNotaSaidaParam.FmDatas56.MeDtInicial.Text) = '') or (trim(FNotaSaidaParam.FmDatas56.MeDtFinal.Text) = '') then
      raise Exception.Create('Informe um período para a Dt. Emissão.');
    QRNotasNaoAutorizadas.Close;
    QRNotasNaoAutorizadas.SetVariable('DATA_I', FNotaSaidaParam.FmDatas56.MeDtInicial.Text);
    QRNotasNaoAutorizadas.SetVariable('DATA_F', FNotaSaidaParam.FmDatas56.MeDtFinal.Text);
    if trim(FNotaSaidaParam.FmFilial28.MeFilial.Text) <> '' then
      QRNotasNaoAutorizadas.SetVariable('FILIAL', trim(FNotaSaidaParam.FmFilial56.MeFilial.Text))
    else
      DMRelatorio_Venda.QRNotasNaoAutorizadas.SetVariable('FILIAL', NULL);
    if trim(FNotaSaidaParam.FmCadastro56.MeCadastro.Text) <> '' then
      QRNotasNaoAutorizadas.SetVariable('CADASTRO', trim(FNotaSaidaParam.FmCadastro56.MeCadastro.Text))
    else
      QRNotasNaoAutorizadas.SetVariable('CADASTRO', NULL);

    DMRelatorio_Venda.QRNotasNaoAutorizadas.Open;

    if FRNotasNaoAutorizadas = nil then
      FRNotasNaoAutorizadas := TFRNotasNaoAutorizadas.Create(Application);
      FRNotasNaoAutorizadas.QRLTitulo.Caption := 'NOTAS CONFIRMADAS MAS NÃO AUTORIZADAS';
      FRNotasNaoAutorizadas.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Text;
      FRNotasNaoAutorizadas.QRLNomeRel.Caption := 'FRNotasNaoAutorizadas';
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRNotasNaoAutorizadas.QRPrimario.Preview
    else
      FRNotasNaoAutorizadas.QRPrimario.Print;
    DMRelatorio_Venda.QRNotasNaoAutorizadas.Close;
  end;
end;

procedure TFNotaFrenteCaixa.VendasporOperaoProduto1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VendasporOperaoProduto1Click(Self);
end;

procedure TFNotaFrenteCaixa.ResumoNotasPorOperacao1Click(Sender: TObject);
begin
  inherited;
  FLivroFiscalCad.ResumoNotasPorOperacao1Click(Self);
end;

procedure TFNotaFrenteCaixa.N6Resumodenotas1Click(Sender: TObject);
begin
  inherited;

  if FNotaSaidaParam = nil then
    FNotaSaidaParam := TFNotaSaidaParam.Create(Application);
  FNotaSaidaParam.PGRelatorio.Pages[57].TabVisible := true;
  FNotaSaidaParam.FmFilial57.MeFilial.Text := '1';
  if FNotaSaidaParam.ShowModal = MrOK then
    with DMRelatorio_Venda do
    begin
    if (trim(FNotaSaidaParam.FmDatas57.MeDtInicial.Text) = '') or (trim(FNotaSaidaParam.FmDatas57.MeDtFinal.Text) = '') then
      raise Exception.Create('Informe um período para a Dt. Emissão.');
    QRResumoNotas.Close;
     //------DATAS------
    QRResumoNotas.SetVariable('DATA_I', FNotaSaidaParam.FmDatas57.MeDtInicial.Text);
    QRResumoNotas.SetVariable('DATA_F', FNotaSaidaParam.FmDatas57.MeDtFinal.Text);
     //------FILIAL-----
    if trim(FNotaSaidaParam.FmFilial57.MeFilial.Text) = '' then
      raise Exception.Create('Informe a Filial.')
    else
      DMRelatorio_Venda.QRResumoNotas.SetVariable('FILIAL', FNotaSaidaParam.FmFilial57.MeFilial.Text);
     //------OPERAÇÃO--------
    if Trim(FNotaSaidaParam.MEOperacao57.Text) <> '' then
    begin
      QRResumoNotas.SetVariable('OPERACAO', 'COD_OPERACAO IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MEOperacao57.Text))+')');
    end
    else
      QRResumoNotas.SetVariable('OPERACAO', '1=1');
    //------SERIE------------
    if Trim(FNotaSaidaParam.MESerie57.Text) <> '' then
    begin
      QRResumoNotas.SetVariable('SERIE', 'COD_SERIE IN ('+Bib.colocaaspanastring(Trim(FNotaSaidaParam.MESerie57.Text))+')');
    end
    else
      QRResumoNotas.SetVariable('SERIE', '1=1');
    if Trim(FNotaSaidaParam.MEModelo57.Text) <> '' then
      QRResumoNotas.SetVariable('COD_SERIE_MODELO',Trim(FNotaSaidaParam.MEModelo57.Text))
    Else
      QRResumoNotas.SetVariable('COD_SERIE_MODELO',NULL);
    //------ENTRADA/SAIDA--------
    case FNotaSaidaParam.RGEntradaSaida57.ItemIndex of
        0: QRResumoNotas.SetVariable('IND_ENTRADA_SAIDA', 'E');
        1: QRResumoNotas.SetVariable('IND_ENTRADA_SAIDA', 'S');
        2: QRResumoNotas.SetVariable('IND_ENTRADA_SAIDA', NULL);
    end;
    case FNotaSaidaParam.RGRetornoProc57.ItemIndex of
        0: QRResumoNotas.SetVariable('DESC_RETORNO', null);
        1: QRResumoNotas.SetVariable('DESC_RETORNO', 'AUTORIZADA');
        2: QRResumoNotas.SetVariable('DESC_RETORNO', 'INUTILIZADA');
        3: QRResumoNotas.SetVariable('DESC_RETORNO', 'DENEGADA');
        4: QRResumoNotas.SetVariable('DESC_RETORNO', 'NÃO AUTORIZADA');
    end;
    QRResumoNotas.Open;

    if FRResumoNotas = nil then
      FRResumoNotas := TFRResumoNotas.Create(Application);
    FRResumoNotas.QRLTitulo.Caption := 'RESUMO DE NOTAS';
    FRResumoNotas.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Text;
    FRResumoNotas.QRLNomeRel.Caption := 'FRResumoNotas';
    FRResumoNotas.QRLPeriodo.Caption := 'Período: ' + FNotaSaidaParam.FmDatas57.MeDtInicial.Text + ' A ' + FNotaSaidaParam.FmDatas57.MeDtFinal.Text;
    if FNotaSaidaParam.RGPreview.ItemIndex = 0 then
      FRResumoNotas.QRPrimario.Preview
    else
      FRResumoNotas.QRPrimario.Print;

    QRResumoNotas.Close;
  end;

end;

procedure TFNotaFrenteCaixa.BtBuscarValeProdutoClick(Sender: TObject);
begin
  inherited;
  if FValeProdutoCons = nil then
    FValeProdutoCons := TFValeProdutoCons.Create(Application);
  if FValeProdutoCons.ShowModal = mrOk then
    if DMDevolucaoTroca.QValeProdutoConsCOD_VALE_PRODUTO.Text <> '' then
      MeCodValeProduto.Text := DMDevolucaoTroca.QValeProdutoConsCOD_VALE_PRODUTO.Text;
end;

procedure TFNotaFrenteCaixa.MeCodValeProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08,#13,#27,#42] ) then
    key:=#0;
  if Key = #13 then
    btIncluirClick(Self);
end;

procedure TFNotaFrenteCaixa.MELocalizaExit(Sender: TObject);
var
  wCodigo: Integer;
begin
  try
    wCodigo := StrToInt('0'+ Trim(MELocaliza.Text));
  Except
    MELocaliza.Text := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB', 'COD_GUIA_PAGAMENTO = ' + QuotedStr( Trim(MELocaliza.Text)));
  end;
  inherited;
  DMNotaSaida.QValeProdutoTroca.Refresh;
{  if (DMParamSistema.CodEmpresa = 'ALPHA') and (DMUsuario.pTipoFuncionario = 'COLABORADOR') then
  begin
    MECodBarras2.SetFocus;
  end;}
end;

procedure TFNotaFrenteCaixa.SBRefreshClick(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QValeProdutoTroca.Refresh;
end;

procedure TFNotaFrenteCaixa.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMNotaSaida.QNotaSaidaIND_SITUACAO do
    if Value = SIT_NOTA_DIGITADA then
      LblSituacao.Font.Color := clRed
    else if (Value = SIT_NOTA_CONFIRMADA) or (Value = SIT_NOTA_DENEGADA) then
      LblSituacao.Font.Color := clGreen
    else if Value = SIT_NOTA_CANCELADA then
      LblSituacao.Font.Color := clBlue
    else
      LblSituacao.Font.Color := clWindowText;  
end;

procedure TFNotaFrenteCaixa.SBDocInserirClick(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.SBDocInserirClick(Self);
end;

procedure TFNotaFrenteCaixa.SBDocRemoverClick(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.SBDocRemoverClick(Self);
end;

procedure TFNotaFrenteCaixa.ReimprimirCupomTEFemMemria1Click(
  Sender: TObject);
begin
  inherited;
  if not FNotaImpressao.ImprimeComprovantesTEF then
    raise Exception.Create('Não há comprovantes TEF em memória.');
end;

procedure TFNotaFrenteCaixa.btExcluirClick(Sender: TObject);
begin
  inherited;
  with DMNotaSaida do
  begin
    if not QValeProdutoTroca.Eof then
    begin
      if (QValeProdutoTrocaIND_UTILIZADO.Value = 'S') then
      begin
        MessageDlg('Não é possível desvincular um Vale Compras já utilizado.', mtError,
          [mbOk], 0);
        Abort;
      end;
      QValeProdutoTroca.Edit;
      QValeProdutoTrocaCOD_NOTA_CAB_TROCA.Value := 0;
      QValeProdutoTroca.Post;
      QValeProdutoTroca.Refresh;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.btIncluirClick(Sender: TObject);
begin
  inherited;
  with DMNotaSaida, DMDevolucaoTroca do
  begin
    if QNotaSaida.State = dsInsert then
    begin
      QNotaSaida.Post;
      QNotaSaida.Edit;
    end;
    DMNfe.SetaNfe(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value, True); 
    if StrToInt('0' + DMNfe.QNfeSIT_NFE.Value) in SIT_NFE_ACEITO then
    begin
      MessageDlg('Esta nota já está autorizada ou cancelada. Não é possível inserir nem excluir Vales.', mtError,
          [mbOk], 0);
      MeCodValeProduto.Clear;
      Abort;
    end;
    if trim(MeCodValeProduto.Text) <> '' then
    begin

      QValeProdutoValida.Close;
      QValeProdutoValida.ClearVariables;
      QValeProdutoValida.SetVariable('COD_VALE_PRODUTO', trim(MeCodValeProduto.Text));
      QValeProdutoValida.Open;

      if QValeProdutoValida.RecordCount = 0 then
      begin
        MessageDlg('Informe um Vale que exista e esteja disponível.', mtError,
        [mbOk], 0);
        MeCodValeProduto.Clear;
        MeCodValeProduto.SetFocus;
        Abort;
      end
      else
      begin
        if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED') or
           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DONABENTA') then
        begin
          if Date > IncMonth(QValeProdutoValidaDT_EMISSAO.Value, 6) then
          begin
            MessageDlg('Este vale perdeu a validade em ' +
              FormatDateTime('dd/MM/yyyy', IncDay(IncMonth(QValeProdutoValidaDT_EMISSAO.Value, 6), 1)), mtError,
            [mbOk], 0);
            MeCodValeProduto.Clear;
            MeCodValeProduto.SetFocus;
            Abort;
          end;
        end;
        if (QValeProdutoValidaDESC_TIPO_VALE.Value = 'VALE-PRESENTE') AND
           (QValeProdutoValidaIND_SITUACAO_VALE_PRESENTE.Value <> 2) then
        begin
          MessageDlg('Este Vale-presente já foi cancelado ou não foi emitido.', mtError,
            [mbOk], 0);
          MeCodValeProduto.Clear;
          MeCodValeProduto.SetFocus;
          Abort;
        end;
        if not QValeProdutoValidaCOD_NOTA_CAB_TROCA.IsNull and
          (QValeProdutoValidaCOD_NOTA_CAB_TROCA.Value <>
           QNotaSaidaCOD_NOTA_CAB.Value) and
          ((QValeProdutoValidaIND_UTILIZADO.Value = 'S') or
           (QValeProdutoValidaIND_CANCELADO.Value = 'S')) then
        begin
          if (QValeProdutoValidaIND_CANCELADO.Value = 'S') then
            MessageDlg('Este Vale não é mais válido. A nota de devolução foi cancelada.', mtError,
            [mbOk], 0)
          else
            MessageDlg('Este Vale já foi utilizado em outra nota.', mtError,
            [mbOk], 0);
          MeCodValeProduto.Clear;
          MeCodValeProduto.SetFocus;
          Abort;
        end
        else if QValeProdutoValidaCOD_NOTA_CAB_TROCA.Value <>
           QNotaSaidaCOD_NOTA_CAB.Value then
        begin
          QValeProduto.Close;
          QValeProduto.ClearVariables;
          QValeProduto.SetVariable('PK', QValeProdutoValidaCOD_VALE_PRODUTO.Value);
          QValeProduto.Open;

          QValeProduto.Edit;
          QValeProdutoCOD_NOTA_CAB_TROCA.Value := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value;
          QValeProduto.Post;

          QValeProdutoTroca.Refresh;
          QSomaVales.Close;
          QSomaVales.Open;
          MeCodValeProduto.Clear;
          MeCodValeProduto.SetFocus;
        end;
      end;
    end;
  end;
end;

procedure TFNotaFrenteCaixa.MeCodValeProdutoEnter(Sender: TObject);
begin
  inherited;
  Self.Tag := 100;
end;

procedure TFNotaFrenteCaixa.MeCodValeProdutoExit(Sender: TObject);
begin
  inherited;
  Self.Tag := 0;
end;

procedure TFNotaFrenteCaixa.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEdit24Exit(Self);
end;

procedure TFNotaFrenteCaixa.DBEdit24Exit(Sender: TObject);
begin
  inherited;
  if (DMNotaSaida.QNotaSaidaCOD_TRANSPORTADOR.Text <> '') then
    DMNotaSaida.QNotaSaidaDESC_ESPECIE.Value := 'VOLUME'
  else
    DMNotaSaida.QNotaSaidaDESC_ESPECIE.Clear;
  //if (Trim(DBEdit22.Text) <> '') and (Trim(DBEdit43.Text) = '') and
  //  (DMNotaSaida.QNotaSaidaCOD_UF_VEICULO.Value = '') then
  //begin
  //  DMNotaSaida.QNotaSaidaDESC_PLACA.Value :=
  //    DMOracle.BuscaNome('SELECT DESC_PLACA FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit22.Text));
  //  DMNotaSaida.QNotaSaidaCOD_UF_VEICULO.Value :=
  //    DMOracle.BuscaNome('SELECT COD_UF_VEICULO FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit22.Text));
  //end;
end;

procedure TFNotaFrenteCaixa.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFNotaFrenteCaixa.SBChaveAcessoClick(Sender: TObject);
 procedure ChaveManual(Chave: string);
  begin
    if InputQuery('Nova Chave de Acesso', 'Digite a chave:', Chave) then
    begin
      Chave := Bib.LimpaNumero(Chave);
      if Length(Chave) <> 44 then
      begin
        MessageDlg('Chave errada, precisa possuir 44 números.', mtError, [mbOK], 0);
        ChaveManual(Chave);
      end
      else
        DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value := 'NFe' + Chave;
    end;
  end;
begin
  inherited;
  with DMNfe do
  begin
    SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value), True);
    if (QNfeind_aprovado.Value) or (QNfeind_cancelado.Value) or (QNfeind_denegado.Value) then
    begin
      MessageDlg('Esta chave já está autorizada, cancelada ou denegada na SEFAZ.' + #13 + #10 +
        'Não é permitido alterar a chave de uma nota nesta situação.', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  case MessageDlgCustom('Alterar chave de acesso', mtConfirmation,
    [mbYes, mbNo, mbCancel], ['Informar manualmente',
    'Gerar outra chave automaticamente', 'Cancelar'], nil) of
    mrYes:
      ChaveManual(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value);
    mrNo:
      if (MessageDlg('Tem certeza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      begin
        MessageDlg('A Chave de Acesso será apagada, pois, assim, ela será gerada automaticamente na confirmação da nota.', mtInformation, [mbOK], 0);
        DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value := '';
      end;
  end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2Change(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QNotaSaida.State in [DSBrowse] then
  begin
    SBIncluirClick(Sender);
  end;
end;

procedure TFNotaFrenteCaixa.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  if (not DMNotaSaida.QItemNFCOD_PRODUTO.IsNull) then
      LDescProduto.Caption := DMOracle.FastSelect('DESC_PRODUTO'
        , 'TB_PRODUTO', 'COD_PRODUTO = ' + DMNotaSaida.QItemNFCOD_PRODUTO.Text);
end;

procedure TFNotaFrenteCaixa.DBGrid1Exit(Sender: TObject);
begin
  inherited;
  if ((not DMNotaSaida.QItemNFCOD_PRODUTO.IsNull) and (DMNotaSaida.QItemNF.State = dsEdit)) and ((DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO')
        or (DbGrid1.SelectedField.FieldName = 'QT_QUANTIDADE')) then
    begin
      if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'DONABENTA') then
        ValidaEstoque(Sender);
      DMNotaSaida.QItemNF.Post;
      DMNotaSaida.QItemNF.Edit;
      MECodBarras2.SetFocus;
    end;
end;

procedure TFNotaFrenteCaixa.MECodBarras2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then // 123 = F12 - Junior 10/04/2017. Solicitado por Gustavo (Agroferragens JG).
  begin
    if DMNotaSaida.QNotaSaida.State in [DSBrowse] then
    begin
      SBIncluirClick(Sender);
      BtConsProduto.Click;
    end
    else
      BtConsProduto.Click;
  end;
end;

procedure TFNotaFrenteCaixa.SpeedButton1Click(Sender: TObject);
var
  pnt: TPoint;
begin
  if GetCursorPos(pnt) then
    ppAtalhos.Popup(pnt.X, pnt.Y);
end;

procedure TFNotaFrenteCaixa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 120 Then // 120 = F9 - Junior. Abrir gaveta
    BtAbreGavetaClick(Sender);
end;

procedure TFNotaFrenteCaixa.Abrirgaveta1Click(Sender: TObject);
begin
  inherited;
  BtAbreGavetaClick(Sender);
end;

procedure TFNotaFrenteCaixa.BtAbreGavetaClick(Sender: TObject);
var F : TextFile;
    wImpressora : String;
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'NFCE-DOGAO' then
    EmissoCpia1Click(Sender)
  else
  begin
    wImpressora := DMOracle.FastSelect('DESC_IMPRESSORA_DANFE_NFCE','TB_USUARIO','COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente) );
    AssignFile(F,'\\'+copy(wImpressora,3,40));
    Rewrite(F);
    Writeln(F,#027+#112+#000+#010+#100''); //abrir gaveta Epson
    CloseFile(F);
  end;
end;

procedure TFNotaFrenteCaixa.acConfirmarNotaExecute(Sender: TObject);
begin
  inherited;
  if not SBConfirmar.Enabled then
    SBConfNotaClick(Self);
end;

procedure TFNotaFrenteCaixa.Action1Execute(Sender: TObject);
begin
  inherited;
  SBConfNotaClick(Self);
end;

procedure TFNotaFrenteCaixa.N7OramentoWord1Click(Sender: TObject);
var
  table, Document, Range: Variant;
  wTotalPedido, wTotalProdutos, percDesconto: real;
  wCont, wLinha: Integer;
  wCodProduto, wDescPrazo: string;
begin
  //inherited;
   //  wTotalCusto := 0;
  wTotalPedido := 0;
  wTotalProdutos := 0;
  wCont := 1;
  if Trim(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text) = '' then
    raise exception.Create('É necessario que uma venda seja selecionado!');

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_FILIAL.Text);
    QFilial.Open;
  end;
  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
    QCadastro.Open;
  end;
  {if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') and (not DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.IsNull) then
  begin
    percDesconto := StrToFloat('0' + DMOracle.fastSelect('PERC_DESCONTO', 'TB_PRAZO_VENCIMENTO',
      'COD_PRAZO_VENCIMENTO = ' + DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.AsString));
    wDescPrazo := DMOracle.fastSelect('DESC_PRAZO_VENCIMENTO', 'TB_PRAZO_VENCIMENTO',
      'COD_PRAZO_VENCIMENTO = ' + DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.AsString);
  end
  else
    percDesconto := 0;}
  wLinha := 0; //Controlar o paragrafo atual do documento
  NewWord := GetOrCreateObject('Word.Application');
  NewWord.Visible := True;

  NewWord.Documents.Add;
  // Obtem documento e paragrafo
  Document := NewWord.Documents.Item(1);
  if percDesconto > 0.009 then
    Document.PageSetup.LeftMargin := '1,8 cm';
//  Document.Paragraphs.Add;  - Comentado por Djeison para economizar espaço
   if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'SOLDAR') then
   begin
    try
      Inc(wLinha);
      NewWord.Selection.InlineShapes.AddPicture(WideString(ExtractFilePath(Application.ExeName) + '\logo.jpg'));
      Document.Paragraphs.add;
    except
      Dec(wLinha);
    end;
  end;

  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := '---  O R Ç A M E N T O  ---';
  //Range.Font := 'Arial';
  Range.Bold := 1;
  Range.Font.Size := 16;
  Document.Paragraphs.Item(wLinha).Alignment := '1';
  Document.Paragraphs.Item(wLinha).Range.Bold := 0;

//  Document.Paragraphs.Add; Comentado por Djeison
//  Inc(wLinha);
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'REDIESEL') then
    Document.Paragraphs.Item(wLinha).Alignment := '0';
  Document.Paragraphs.Add;
  Inc(wLinha);

  Document.Paragraphs.Item(wLinha).Range.Font.Size := 12;
  Range := Document.Paragraphs.Item(wLinha).Range;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'REDIESEL') then
    Range.Text := DMFilial.QFilialDesc_Filial.Text + ' CNPJ: ' + DMFilial.QFilialNUM_CGC.Text +
                ' Inscrição Estadual ' + DMFilial.QFilialDESC_INSCRICAO.Text;

  Document.Paragraphs.Add;
  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'REDIESEL') then
    Range.Text := 'ENDEREÇO: ' + DMFilial.QFilialDESC_ENDERECO.Text + ' - ' +
      DMFilial.QFilialDESC_CIDADE.Text + ' TELEFONE: ' + DMFilial.QFilialDESC_TELEFONE.Text;

//  Document.Paragraphs.Add;  Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'CADASTRO: ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text + '-' + DMCadastro.QCadastroNome.Text;
  Document.Paragraphs.Item(wLinha).Alignment := '0';

  Document.Paragraphs.Add;
  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'ENDEREÇO: ' + DMCadastro.QCadastroDESC_ENDERECO.Value;

  Document.Paragraphs.Add;
  Inc(wLinha);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'CIDADE  : ' + Trim(DMCadastro.QCadastroDESC_CIDADE.Value) + '-' + 'UF: ' +
    Trim(DMCadastro.QCadastroCOD_ESTADO.Value) + '   CEP : ' +
    Trim(DMCadastro.QCadastroDESC_CEP.Value) +
    '    TELEFONE: ' + DMCadastro.QCadastroDESC_TELEFONE.Value;

//  Document.Paragraphs.Add; Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'VENDEDOR: ' + DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Text + '-' + DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(DMNotaSaida.QNotaSaidaCOD_VENDEDOR.Value));

  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'Cód. Orçamento: ' + DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text + '             DATA EMISSÃO: ' + DMNotaSaida.QNotaSaidaDT_EMISSAO.Text;
  Range.Bold := 1;
  Range.Font.Size := 10;

  Document.Paragraphs.Add;
  Range.Bold := 0;
//  Document.Paragraphs.Add;
//  Document.Paragraphs.Add;  Comentado por Djeison
//  Document.Paragraphs.Add;
  Inc(wLinha, 1);

  Document.Paragraphs.Add;
  Inc(wLinha);
  {if DMPedido.QPedidoDESC_FORMA_PAGAMENTO.Value <> '' then
  begin
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'FORMA DE PAGAMENTO: ' + DMPedido.QPedidoDESC_FORMA_PAGAMENTO.Value;
    Document.Paragraphs.Add;
    Inc(wLinha);
  end;}
  Range := Document.Paragraphs.Item(wLinha).Range;
  {if not DMPedido.QPedidoDT_ENTREGA.IsNull then
  begin
    Range.Text := 'PRAZO DE ENTREGA: ' + FormatDateTime('dd/MM/yyyy', DMPedido.QPedidoDT_ENTREGA.Value);
    Document.Paragraphs.Add;
    Inc(wLinha);
  end;}


  //Observação
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := 'OBSERVAÇÃO : ' + DMNotaSaida.QNotaSaidaOBS.Text;
  //Obs

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Inc(wLinha, 2);
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := DMFilial.QFilialDESC_CIDADE.Value + ', ' + Copy(DateToStr(Date), 1, 2) + ' de ' +
    Bib.NomeMes(StrToInt(Copy(DateToStr(Date), 4, 2))) + ' ' + Copy(DateToStr(Date), 7, 4);
  Document.Paragraphs.Item(11).Alignment := '1';   // Alterado de 22 para 11

  if (DMParamSistema.CodEmpresa <> 'FERRAGMED') and (DMParamSistema.CodEmpresa <> 'SOLDAR') then
  begin
//    Document.Paragraphs.Add;
    Document.Paragraphs.Add;
    Inc(wLinha, 1);
    Range := Document.Paragraphs.Item(wLinha).Range;
    Range.Text := 'DECLARO ESTAR DE ACORDO COM O PRESENTE ORÇAMENTO E CIENTE DO PRAZO DE ENTREGA E PAGAMENTO.';
  end;

//  Document.Paragraphs.Add; Comentado por Djeison
  Document.Paragraphs.Add;
  Inc(wLinha, 1);
  Document.Paragraphs.Item(wLinha).Alignment := '2';
  Range := Document.Paragraphs.Item(wLinha).Range;
  Range.Text := '___/___/______     ________________________________________________';
  Document.Paragraphs.Add;

  Inc(wLinha, 1);
  Document.Paragraphs.Item(wLinha).Alignment := '2';
  Range := Document.Paragraphs.Item(wLinha).Range;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') or (DMParamSistema.CodEmpresa = 'SOLDAR') then
    Range.Text := DMFilial.QFilialDESC_FILIAL.Value
  else
    Range.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(10).Range; // Djeison - Era 14
  if (percDesconto > 0.009) then
  begin
    table := Document.Tables.Add(Range, 1, 8);
    table.Cell(1, 1).Width := '0.5';
  end
  else
  begin
    table := Document.Tables.Add(Range, 1, 7); // novoDoc.Tables.Add(Selection.Range, 3, 5)
    table.Cell(1, 1).Width := '0.95';
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED' then
     table.Cell(1, 1).Width := '1.70';
  table.Cell(1, 2).Width := '1.61';
  //table.Cell(1, 3).Width := '1.30';//1.39
  table.Cell(1, 3).Width := '0.84';//0.84
  table.Cell(1, 4).Width := '8.30';//8.31
  table.Cell(1, 5).Width := '1.30';//1.39
  table.Cell(1, 6).Width := '1.89';
  //  table.Cell(1,6).Width:= '1.51';
  table.Cell(1, 7).Width := '1.89';
  if (percDesconto > 0.009) then
    table.Cell(1, 8).Width := '1.89'
  else
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FERRAGMED') then
       table.Cell(1, 1).Range.Text := 'NCM'
    else
       table.Cell(1, 1).Range.Text := 'Item';
  table.Cell(1, 2).Range.Text := 'Código';
  //table.Cell(1, 3).Range.Text := 'Quant.';
  //table.Cell(1, 3).Range.ParagraphFormat.Alignment := 2;
  table.Cell(1, 3).Range.Text := 'Un';
  table.Cell(1, 4).Range.Text := 'Descrição Produto/Serviço';
  table.Cell(1,4).Range.ParagraphFormat.Alignment := 0;
  if (percDesconto > 0.009) then
  begin
    table.Cell(1, 5).Range.Text := 'Un c\ Desc';
    table.Cell(1,5).Range.ParagraphFormat.Alignment := 2;

    table.Cell(1, 6).Range.Text := 'Unitário';
    table.Cell(1,6).Range.ParagraphFormat.Alignment := 2;
    //  table.Cell(1,6).Range.Text:='% Desc.    ';
    table.Cell(1, 7).Range.Text := 'Total';
    table.Cell(1,7).Range.ParagraphFormat.Alignment := 2;
  end
  else
  begin
    table.Cell(1, 5).Range.Text := 'Quant.';
    table.Cell(1, 5).Range.ParagraphFormat.Alignment := 2;

    table.Cell(1, 6).Range.Text := 'Unitário';
    table.Cell(1,6).Range.ParagraphFormat.Alignment := 2;
    //  table.Cell(1,6).Range.Text:='% Desc.    ';
    table.Cell(1, 7).Range.Text := 'Total';
    table.Cell(1,7).Range.ParagraphFormat.Alignment := 2;
  end;
    //table.Font.Bold = True
   table.Rows.Add;
  //DMPedido.QPedidoItem.First;
  DMNotaSaida.QItemNF.First;
  while not DMNotaSaida.QItemNF.eof do
  begin
    with DMNotaSaida do
    begin
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARZ' then
        table.Cell(QItemNF.RecNo + 1, 1).Range.Text := Bib.NumToTexto(wCont, 0, 3);
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'FERRAGMED' then
        table.Cell(QItemNF.RecNo + 1, 1).Range.Text := Trim(DMOracle.BuscaNome('SELECT NUM_GENERO_NCM FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value)));
      if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ')     Or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'CEIFAGRIL') Or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'KREUZ')     or
         (DMParamSistema.QParamSistemaCOD_EMPRESA.Value  = 'NEOALI'))   And
         (Trim(QItemNFNUM_FABRICANTE.Value) <> '') Then
         table.Cell(QItemNF.RecNo + 1, 2).Range.Text := DMNotaSaida.QItemNFNUM_FABRICANTE.Value
      else
         table.Cell(QItemNF.RecNo + 1, 2).Range.Text := QItemNFCOD_PRODUTO.Value;

      table.Cell(QItemNF.RecNo + 1, 3).Range.Text := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QItemNFCOD_PRODUTO.Value));
      table.Cell(QItemNF.RecNo + 1, 4).Range.Text := QItemNFnome_produto.Value;  //Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ') then
         table.Cell(QItemNF.RecNo + 1, 5).Range.Text := Bib.NumToTexto(QItemNFQT_QUANTIDADE.Value, 2, 6)
      Else
         table.Cell(QItemNF.RecNo + 1, 5).Range.Text := Bib.NumToTexto(QItemNFQT_QUANTIDADE.Value, 0, 6);
      if (percDesconto > 0.009) then
      begin
        table.Cell(QItemNF.RecNo + 1, 6).Range.Text := Bib.NumToTexto(QItemNFVAL_UNITARIO.Value - (QItemNFVAL_UNITARIO.Value * percDesconto / 100), 2, 8);
        table.Cell(QItemNF.RecNo + 1, 7).Range.Text := Bib.NumToTexto(QItemNFVAL_UNITARIO.Value - (QItemNFVAL_UNITARIO.Value * QItemNFPERC_DESCONTO.Value / 100), 2, 8);
        //      if QPedidoItemPERC_DESCONTO.Value > 0 then
        //         table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
        table.Cell(QItemNF.RecNo + 1, 8).Range.Text := Bib.NumToTexto(QItemNFVAL_TOTAL.Value, 2, 10);
        wTotalProdutos := wTotalProdutos + QItemNFVAL_TOTAL.Value;
        if QItemNFPERC_DESCONTO.Value > 0 then
          wTotalPedido := wTotalPedido + ((QItemNFVAL_UNITARIO.Value - (QItemNFVAL_UNITARIO.Value * QItemNFPERC_DESCONTO.Value / 100)) * QItemNFQT_QUANTIDADE.Value)
        else
          wTotalPedido := wTotalPedido + QItemNFVAL_TOTAL.Value;
      end
      else
      begin
        table.Cell(QItemNF.RecNo + 1, 6).Range.Text := Bib.NumToTexto(QItemNFVAL_UNITARIO.Value - (QItemNFVAL_UNITARIO.Value * QItemNFPERC_DESCONTO.Value / 100), 2, 8);
        //      if QPedidoItemPERC_DESCONTO.Value > 0 then
        //         table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
        table.Cell(QItemNF.RecNo + 1, 7).Range.Text := Bib.NumToTexto(QItemNFVAL_TOTAL.Value, 2, 10);
        wTotalProdutos := wTotalProdutos + QItemNFVAL_TOTAL.Value;
        if QItemNFPERC_DESCONTO.Value > 0 then
          wTotalPedido := wTotalPedido + ((QItemNFVAL_UNITARIO.Value - (QItemNFVAL_UNITARIO.Value * QItemNFPERC_DESCONTO.Value / 100)) * QItemNFQT_QUANTIDADE.Value)
        else
          wTotalPedido := wTotalPedido + QItemNFVAL_TOTAL.Value;
      end;
      wCont := wCont + 1;
      QItemNF.Next;
    end;
    table.Rows.Add;
  end;
  
//  table.Rows.Add;
  table.Cell(DMNotaSaida.QItemNF.RecNo + 3, 4).Range.Text :=
    'TOTAL DO(S) PRODUTO(S) .........: ';

  table.Cell(DMNotaSaida.QItemNF.RecNo + 3, 7).Range.Text :=
    Bib.NumToTexto(wTotalProdutos, 2, 10);

  if (percDesconto > 0.009) then
  begin
    table.Rows.Add;
    table.Cell(DMNotaSaida.QItemNF.RecNo + 4, 4).Range.Text :=
      'DESCONTO PARA PAGAMENTO ' + wDescPrazo + ':';
    table.Cell(DMNotaSaida.QItemNF.RecNo + 4, 7).Range.Text :=
      Bib.NumToTexto(wTotalPedido * percDesconto/100 , 2, 10);

    table.Rows.Add;
    table.Cell(DMNotaSaida.QItemNF.RecNo + 5, 4).Range.Text :=
      'TOTAL DO PEDIDO ........................: ';
    table.Cell(DMNotaSaida.QItemNF.RecNo + 5, 7).Range.Text :=
      Bib.NumToTexto(wTotalPedido - wTotalPedido * percDesconto/100, 2, 10);
  end
  else
  begin
    {table.Rows.Add;
    table.Cell(DMNotaSaida.QItemNF.RecNo + 4, 5).Range.Text :=
      'DESCONTO ...................................: ';

    table.Cell(DMNotaSaida.QItemNF.RecNo + 4, 7).Range.Text :=
      Bib.NumToTexto(DMNotaSaida.QNotaSaidaVAL_DESCONTO.Value, 2, 10);
    }
    table.Rows.Add;
    table.Cell(DMNotaSaida.QItemNF.RecNo + 5, 4).Range.Text :=
      'TOTAL DO PEDIDO .......................: ';

    table.Cell(DMNotaSaida.QItemNF.RecNo + 5, 7).Range.Text :=
      Bib.NumToTexto(wTotalPedido - DMNotaSaida.QNotaSaidaVAL_DESCONTO.Value, 2, 10);
  end;
  Range.Bold := 0;
  Range.Font.Size := 10;

  DMCadastro.QCadastro.Close;
  DMFilial.QFilial.Close;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') then
  begin
    Document.Paragraphs.Add;
    NewWord.Selection.InlineShapes.AddPicture(WideString(ExtractFilePath(Application.ExeName) + '\imagens\assinatura.jpeg'),
      False, True, Document.Paragraphs.Item(Document.Paragraphs.Count).Range);
  end;
end;

function TFNotaFrenteCaixa.GetOrCreateObject(const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID(ClassName);
  if Succeeded(GetActiveObject(ClassID, nil, Unknown)) then
    OleCheck(Unknown.QueryInterface(IDispatch, Result))
  else
    Result := CreateOleObject(ClassName);
end;

procedure TFNotaFrenteCaixa.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//Para solicitar senha ao excluir Itens da nota. Solicitado por Tati - Junior Doces. Alex 27/03/2023
  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') and (DMParamSistema.QParamSistemaIND_SENHA_EXCLUSAO_NOTA.Value = 'SIM') and
     (Key = VK_DELETE) then
  begin
    DMNotaSaida.DeletaItem;
    MECodBarras2.SetFocus;
  end
  else
   if Key = VK_DELETE then
     MECodBarras2.SetFocus;
end;

procedure TFNotaFrenteCaixa.N8EspelhodaNota1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.EspelhodaNota1Click(Sender);
end;

procedure TFNotaFrenteCaixa.MECodBarras2KeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
{  if not (Key in ['0'..'9', #8]) then
    Key := #0;}
end;

procedure TFNotaFrenteCaixa.MECodBarras2ExitRENATOAUTO;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
    wValVarejo: String;
    wCodigoInt: Integer;
begin
  inherited;
  if trim(MECodBarras2.Text) <> '' then
  begin
    wLote := '1';
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'NUM_FABRICANTE = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then
    begin
      if TryStrToInt(Trim(MECodBarras2.Text), wCodigoInt) then
      begin
         wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + IntToStr(wCodigoInt)); //QuotedStr(trim(MECodBarras2.Text)));
         wLote := '1';
      end;
    end;
    MECodBarras2.Clear;
    if wCodProduto = '' then
    begin
      MECodBarras2.SetFocus;
      raise Exception.Create('O código informado não corresponde a nenhum produto cadastrado.');
    end;
    LDescProduto.Caption := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO='+wCodProduto);
    with DMNotasaida do
    begin
       DMNotaSaida.QItemNF.First;
       wValVarejo := DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
        if (wValVarejo = '') or (wValVarejo = '0') then
          MessageDlg('Atenção: Produto sem preço cadastrado!', mtWarning, [mbOK], 0);
        if DMNotaSaida.QItemNF.State = dsInsert then
          QItemNF.Edit
        else
          QItemNF.Insert;
        QItemNFCOD_PRODUTO.Value := StrToInt(wCodProduto);
        QItemNF.Post;
        MECodBarras2.SetFocus;
//        DBGrid1.SelectedIndex := 2;
    end;
  end
  else
  begin
    DBGrid1.SelectedIndex := 2; //Foco na QTDE ao entrar no GRID.
    DBGrid1.SetFocus;
  end;
   
end;

end.
