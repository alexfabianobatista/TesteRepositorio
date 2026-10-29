{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE ON}
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_CAST ON}
unit UNotaConsumidor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, DBDirceu, ToolWin, jpeg, ActnList, variants,
  DBPanel, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, UFmEstado, CustomDialog, DateUtils;

type
  TFNotaConsumidor = class(TFTCadSimples)
    GroupBox5: TGroupBox;
    Label12: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit30: TDBEdit;
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
    DBESerie: TDBEdit;
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
    DBRGCondicaoPagamento: TDBRadioGroup;
    Panel2: TPanel;
    BtConsProduto: TBitBtn;
    DBGrid1: TDBGrid;
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
    LValDesconto: TLabel;
    DBEValDesconto: TDBEdit;
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
    DBPModelo: TDBPanel;
    lblModelo: TLabel;
    MECodBarras2: TMaskEdit;
    Label18: TLabel;
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
    DBEdit21: TDBEdit;
    Label21: TLabel;
    DBText3: TDBText;
    DBEdit22: TDBEdit;
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
    GBValeCompras: TGroupBox;
    btIncluir: TSpeedButton;
    btExcluir: TSpeedButton;
    DBGValeCompras: TDBGrid;
    MeCodValeProduto: TMaskEdit;
    Label60: TLabel;
    BtBuscarValeProduto: TBitBtn;
    DsValeProduto: TDataSource;
    DBEdit23: TDBEdit;
    Label23: TLabel;
    Label22: TLabel;
    DBText10: TDBText;
    DBEdit6: TDBEdit;
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
    SpeedButton1: TSpeedButton;
    ppAtalhos: TPopupMenu;
    Comprovantedeentrega1: TMenuItem;
    Imprimirnotafiscal1: TMenuItem;
    Emitircartadecorreo1: TMenuItem;
    DBENum_NFSe: TDBEdit;
    CBIndPresenca: TComboBox;
    Label71: TLabel;
    TabSheet2: TTabSheet;
    DBMemo1: TDBMemo;
    BtMensagem: TBitBtn;
    Label69: TLabel;
    Label70: TLabel;
    DBRFinalidadeNFe: TDBRadioGroup;
    DBEValDespesas: TDBEdit;
    LValDespesas: TLabel;
    Label13: TLabel;
    DBText11: TDBText;
    N7InformaesdeVendas1: TMenuItem;
    DBCBIndPromocao: TDBCheckBox;
    LblTecnico: TLabel;
    DBETecnico: TDBEdit;
    BtnTecnico: TBitBtn;
    LanamentoCarto1: TMenuItem;
    BtAbreGaveta: TButton;
    TSContaReceber: TTabSheet;
    DBGrid2: TDBGrid;
    btnEnviaBoletoApi: TButton;
    btnImprimirBoletoApi: TButton;
    btnEnviarBoletoEmail: TButton;
    BtConsFilial: TBitBtn;
    N8EspelhodaNota1: TMenuItem;
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
    procedure DBRGCondicaoPagamentoChange(Sender: TObject);
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
    procedure DBESerieExit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    procedure DBPModeloCodigoExit(Sender: TObject);
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
    procedure DBPModeloCodigoChange(Sender: TObject);
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
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBECodOperacaoChange(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure tmiInformacaoCadClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N7InformaesdeVendas1Click(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MECodBarras2ExitJasol;
    procedure MECodBarras2ExitCASADOPEIXE;
    procedure MECodBarras2Normal;
    procedure MECodBarras2DINGLIS;
    procedure BtnTecnicoClick(Sender: TObject);
    procedure LanamentoCarto1Click(Sender: TObject);
    procedure BtAbreGavetaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEnviaBoletoApiClick(Sender: TObject);
    procedure btnImprimirBoletoApiClick(Sender: TObject);
    procedure btnEnviarBoletoEmailClick(Sender: TObject);
    procedure PCCabecaclhoChange(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure N8EspelhodaNota1Click(Sender: TObject);

  private
    { Private declarations }
    wVendaSimples: Boolean;
    wModulo: string;
    procedure VendaSimples;
    procedure TrataValeProduto(TipoVale:String);

    //PARA GERAR OS BOLETOS VIA API
    procedure GeraBoletoApi;
    procedure ImprimeBoletoApi;
    procedure EnviarEmailBoletoApi;

  public
    { Public declarations }
  end;

var
  FNotaConsumidor: TFNotaConsumidor;
  ValUn: Real;

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
  UImpDadosXMLNFe, UTMenuPrincipal, UDevolucaoTroca_cl, UEstadoCons, UInfoCadastro,
  UInformacaoVendaParam, URInformacaoVenda, UFmDatas, URInformacaoVenda2,
  UDevolucaoCarregaItens,ULancamentoCartaoCad, UInformaBancoPix,
  //para API de boletos
  BoletoAPI.BoletoFactory,
  BoletoApi.Interfaces, UFilialCons;

{$R *.DFM}

procedure TFNotaConsumidor.FormActivate(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.CodEmpresa = 'PAULINHO') or (DMParamSistema.CodEmpresa = 'ARISTIDES') or (DMParamSistema.CodEmpresa = 'NFCE-TROPI') then
    FNotaConsumidor.WindowState := wsMaximized;

  if (DMParamSistema.CodEmpresa = 'NFCE-DOCES') and (DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Value = 'COLABORADOR') then
    SBCancelar.Visible := False;

  with DMNotaSaida do
  begin
    QNotaSaida.Open;
    QItemNF.Open;
    QNotaReferenciada.Open;
    QValeProdutoTroca.Open;
    QContaReceber.Open;
  end;
  PGNota.ActivePage := TSNota;
  PCCabecaclho.ActivePage := TSGeral;
  LblUsuario.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
  if DMParamSistema.CodEmpresa = 'CASAFILTRO' then
  begin
    LblTecnico.Visible := True;
    DBETecnico.Visible := True;
    BtnTecnico.Visible := True;
    LblTecnico.Left := 454;
    DBETecnico.Left := 453;
    BtnTecnico.Left := 511;
  end;
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
    DBRGCondicaoPagamento.Visible := False;
    Label5.Visible := True;
    DbEdit13.Visible := True;
    DBEdit14.Visible := True;
    Label7.Visible := True;
    DBEValDespesas.Visible := False;
    LValDespesas.Visible := False;
    if DMParamSistema.CodEmpresa = 'ARISTIDES' then
    begin
      DBECodOperacao.TabStop := false;
      DBDirceu4.Visible := False;
      DBCBIndPromocao.Visible := True;
    end;
  end
  else

  if (DMParamSistema.CodEmpresa = 'BEGNINI') then
  begin
    DBRGCondicaoPagamento.Visible := True;
    DBRGCondicaoPagamento.Left := 192;
    DBRGCondicaoPagamento.Width := 380;
    BitBtn1.Width := 81;
    BitBtn1.Left := 576;
  end;
  if DMParamSistema.CodEmpresa = 'MINIMART' then
  begin
    FNotaConsumidor.TSNota.TabVisible := False;
    DbGrid1.Columns[3].ReadOnly := True;
  end;
  if (DMParamSistema.CodEmpresa = 'SRTERRA') Or (DMParamSistema.CodEmpresa = 'DEOLA') then
    DbObra.Visible := True;
  if pos('NFC',DMParamSistema.CodEmpresa) > 0 then
  begin
    DBLBFormasPagamentoNFCe.Visible := True;
    LBFormasPagamentoNFCe.Visible := True;
    DBRGCondicaoPagamento.Visible := False;
    DBDirceu4.Visible := False;
  end;
  MeCodValeProduto.Clear;
end;

procedure TFNotaConsumidor.BtConsCadastroClick(Sender: TObject);
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

procedure TFNotaConsumidor.BtConsOperacaoClick(Sender: TObject);
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

procedure TFNotaConsumidor.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  DBEdit8.SetFocus;
end;

procedure TFNotaConsumidor.SBConfirmarClick(Sender: TObject);
//Var wFormaPagto : String;
var Ctrl: TWinControl;
begin
  Panel1.SetFocus;
  //with DMNotaSaida do
//    if ((CBIndPresenca.ItemIndex <> 0) and (CBIndPresenca.ItemIndex <> 5)) then
//      QNotaSaidaIND_INTERMEDIADOR.Value := '0';
  //Ctrl := ActiveControl; ActiveControl := nil; PostMessage(TWinControl(Ctrl).Handle, WM_SETFOCUS, 0, 0); TWinControl(Ctrl).SetFocus;
  //  DmUsuario.Checar_Filial_Usuario( Trim(DMNotaSaida.QNotaSaidaCOD_FILIAL.Text),'VENDA');
  if DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaSaida.QNotaSaidaDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Lançar Esta Nota - Fechamento Contábil');
  DMNotaSaida.QNotaSaidaIND_PRESENCA.Value := Bib.ift(CBIndPresenca.ItemIndex < 6,CBIndPresenca.ItemIndex,9);
  if DBEdit8.Text <> '' then // Codigo do vendedor
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DBEdit8.Text) <> 'ATIVO' then
      raise Exception.Create('Vendedor Inativo');
  if Trim(DBECodOperacao.Text) = '' then
  begin
    DBECodOperacao.SetFocus;
    raise Exception.Create('Informe a operação');
  end;
  //Suporte:1541 - Não permitir salvar diferente da condição de pgto da operacao. (Ex. CD não pode gerar contas a receber). Junior 07/12/2020.
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('Pk', StrToInt('0'+Trim(DBECodOperacao.Text)));
    QOperacao.Open;
    if (DMParamSistema.CodEmpresa = 'OSARE') and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'T') then
    begin
      if (DBRGCondicaoPagamento.ItemIndex = 0) and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'V') then
        raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
      if (DBRGCondicaoPagamento.ItemIndex = 1) and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'P') then
        raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
      if (DBRGCondicaoPagamento.ItemIndex = 2) and (QOperacaoIND_TIPO_PAGAMENTO.Value <> 'O') then
        raise Exception.Create('Condição de Pagamento Diferente da Condição Permitida No Cadastro de Operação');
    end;
  end; //DmOperacao

  if DMNotaSaida.QNotaSaidaIND_PRESENCA.Value = 5 then
    raise Exception.Create('É preciso referenciar uma nota quando for "5 - Operação presencial, fora do estabelecimento".');
  with DMOperacao do
  begin
    QOperacao.Close;
    QOperacao.SetVariable('Pk', Trim(DBECodOperacao.Text));
    QOperacao.Open;

    if (QOperacaoIND_EMITE.Text = 'P') and                      //Não deixa salvar operação de pedido
       (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '99') then         //com série fiscal Adriel 17/09/2015
      raise Exception.Create('É necessário usar de série de pedidos ou '+  //pedido por Rubens Kreuz
                             'colocar operação de nota fiscal.');
    if (QOperacaoIND_OBRIGA_VALE_PRODUTO.Value = 'S') and
       (DMNotaSaida.QValeProdutoTroca.RecordCount = 0) then
    begin
      MessageDlg('Para efetuar uma venda relacionada a uma troca é preciso informar o Vale Compras.', mtError,
          [mbOk], 0);
      MeCodValeProduto.SetFocus;
      Abort;
    end;
  end;
  DMNotaSaida.QValeProdutoTroca.Refresh;
  inherited;
  //Informa quilometragem nas informações adicionais da nf-e quando existir
  with DMNotaSaida do
  begin
    QNotaSaida.Edit;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOMBELLI' then
    begin
      if Trim(DBEdit18.Text) <> '' then
        QNotaSaidaDESC_OBS_CORPO_NOTA.Value := 'KM: ' + Trim(DBEdit18.Text) + '\n' +
                                               'Valor Base Substituicao: '+ FormatFloat('#0.00',QSomaItemNotaSVAL_TOTAL.Value) + ' - ' +
                                               'Valor Icms Substituicao: '+ FormatFloat('#0.00',QSomaItemNotaSVAL_TOTAL.Value * 0.12)
      else
        QNotaSaidaDESC_OBS_CORPO_NOTA.Value := 'Valor Base Substituicao: '+ FormatFloat('#0.00',QSomaItemNotaSVAL_TOTAL.Value) + ' - ' +
                                               'Valor Icms Substituicao: '+ FormatFloat('#0.00',QSomaItemNotaSVAL_TOTAL.Value * 0.12);
    end;
    QNotaSaida.Post;
  end;

  DMOracle.DBCemapa.Commit;

  // if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CEREAIS' then  comentado por marcos 11/09/08
   //  If (DMNotaSaida.QNotaSaidaCod_Cadastro.Value = DMUsuario.CodClientePadrao) And
        //((DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '1') And       //Retirado a pedido do Ederli .. disse que fazem venda a prazo para cliente padrao
  //       (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value <> '4') then
  //   Begin
  //     DMNotaSaida.QNotaSaida.Edit;
  //     Raise Exception.Create('Condição Pagamento Inválida, Para Este Cliente!');
  //   End;
{Copiado para cá do FNotaSaidaCad. Alex 30/09/2025.}
  if DMNotaSaida.QItemNF.RecordCount = 0 then
    raise Exception.Create('Insira os itens da nota antes de confirmá-la.');

  SBConfNotaClick(Self);

  FNotaSaidaCons.wRetornoCondicional := False;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaConsumidor.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);

  if ((DMParamsistema.CodEmpresa = 'COZER') or
     (DMParamsistema.CodEmpresa = 'PROPE') or
     (DMParamsistema.CodEmpresa = 'RUDI') or
     (DMParamsistema.CodEmpresa = 'MODASUL') or
     (DMParamsistema.CodEmpresa = 'SOLDAR') or
     (DMParamsistema.CodEmpresa = 'DONNA') or
     (DMParamSistema.CodEmpresa = 'DUST') or
     (DMParamSistema.CodEmpresa = 'BORGES') or
     (DMParamSistema.CodEmpresa = 'BORGES2') ) then
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

        PGNota.ActivePage := TSItens;
//        MeCodBarra.Visible := True;
//        LCodBarra.Visible := True;
//        MeCodBarra.SetFocus;

        SBAlterar.Click;
        DMNotaSaida.pMudancaOperacaoManual := false;
        QNotaSaidaCOD_OPERACAO.Value := DMUsuario.CodOperacaoPadrao;
        DMNotaSaida.pMudancaOperacaoManual := false;
        DBECodOperacaoExit(Self);
        QNotaSaidaDt_Emissao.Value := DMOracle.DataServ;
        QNotaSaidaDt_Recebimento.Value := DMOracle.DataServ;
        QNotaSaidaCOD_PRAZO_VENCIMENTO.Text := '';
        if ((DMParamsistema.CodEmpresa <> 'COZER') and (DMParamsistema.CodEmpresa <> 'PROPE')) then
          QNotaSaidaNUM_NOTA.Value := 0;
        Application.CreateForm(TFDevolucaoCarregaItens, FDevolucaoCarregaItens);
        if (DMParamSistema.CodEmpresa = 'MODASUL') or (DMParamSistema.CodEmpresa = 'DONNA') then
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
      CBIndPresenca.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_PRESENCA.Value < 9, DMNotaSaida.QNotaSaidaIND_PRESENCA.Value, 6);
    end;   
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
  PCCabecaclho.ActivePage := TSGeral;
end;

procedure TFNotaConsumidor.BtConsProdutoClick(Sender: TObject);
var wDescontoCliente : String;
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QItemNF.Edit;
    If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') or
       (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES') Then
       DMNotaSaida.QItemNFCOD_LOTE_TIPO.Value := DMEstoque.QEstoqueConsCod_Lote_Tipo.Value;
    DMNotaSaida.QItemNFCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
    if DMParamSistema.CodEmpresa = 'PAULINHO' then //puxar desconto do cliente na nota ao consumidor. Paulinho. Junior 20/12/2019
    begin
      wDescontoCliente := '0' +  DMOracle.BuscaNome('SELECT PERC_DESCONTO2 FROM TB_CADASTRO','COD_CADASTRO='+ DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
      if StrToFloat(wDescontoCliente) > 0 then
      Begin
        DMNotaSaida.QItemNFPERC_DESCONTO.Value := StrTofloat(wDescontoCliente);
      end;
    end;
    lblProduto.Caption
      := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = '
        + DMNotaSaida.QItemNFCOD_PRODUTO.Text);
    DBGrid1.SetFocus;
  end;
end;

procedure TFNotaConsumidor.DBECod_NotaChange(Sender: TObject);
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

procedure TFNotaConsumidor.TrataValeProduto(TipoVale: String);
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

procedure TFNotaConsumidor.SBConfNotaClick(Sender: TObject);
var
  wEntrada, wDecimal: Real;
  wValDesconto, wBancoPadrao: string; // para utilizar no inputquery
begin
  inherited;
  try
    DMNotaSaida.QPagamento.Close;
    DMNotaSaida.QPagamento.SetVariable('COD_NOTA_CAB', DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    DMNotaSaida.QPagamento.Open;
    DMNotaSaida.pValorValeCompras := 0;
    DMNotaSaida.pValorNovoValeCompras := 0;
    DMNotaSaida.pValorValePresente := 0;
    DMNotaSaida.pValorNovoValePresente := 0;

{Copiado para cá do FNotaSaidaCad. Alex 30/09/2025.}
    if DMNotaSaida.QItemNF.RecordCount = 0 then
      raise Exception.Create('Insira os itens da nota antes de confirmá-la.');

    if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
    begin
      if pos('NFC', DMParamSistema.CodEmpresa) > 0 then
      begin
        VoltaConfirmao1Click(Self);
      end
      else
        raise Exception.Create('Nota já confirmada!');
    end;
    //colocado este teste para não permitir emitir nota fiscal de clientes que não estão pagando o sistema - Cesar Angonese
    if DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_FILIAL', 'COD_FILIAL = ' + DMNotaSaida.QNotaSaidaCod_Filial.Text) = 'C' Then
       raise Exception.Create('Cliente com pendência financeira - Favor entrar em contato com Cemapa');

    if FNotaConsum_Confirma = nil then
      FNotaConsum_Confirma := TFNotaConsum_Confirma.Create(Application);
    DMNotaSaida.SetaEmissao(DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Value);
    DMNotaSaida.ChecaNota;
    if DMNotaSaida.QNotaSaidaVal_AVista.Text <> '' then
       FNotaConsum_Confirma.MeEntrada.Text := DMNotaSaida.QNotaSaidaVal_AVista.Text
    else
       FNotaConsum_Confirma.MeEntrada.Text := '0';

    wEntrada := 0; // para descontar a entrada efetuada no calculo automatico do sistema ARISTIDES

    If DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text <> '' then
    begin
      // Tratamento do Vale-compras
      //DMNotaSaida.pValesProdutos := TStringList.Create;
      TrataValeProduto('VALE-COMPRAS');
      DMNotaSaida.QSomaItemNota.Refresh;
      DMPrazoVencimento.QPrazoVencimento.Close;
      DMPrazoVencimento.QPrazoVencimento.SetVariable('Pk', DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value);
      DMPrazoVencimento.QPrazoVencimento.Open;
      If (DMPrazoVencimento.QPrazoVencimentoPERC_DESCONTO.Text <> '') and
         (DMNotaSaida.QNotaSaidaVal_Desconto.Value = 0) Then
//          (DMNotaSaida.QNotaSaidaIND_PROMOCAO.Value = 'NAO')))  then  // retirado pelo césar Promoção somente valido para Aristides
      begin
        dmnotasaida.QNotaSaida.Edit;
        dmnotasaida.QNotaSaidaVAL_DESCONTO.Value := Trunc((DMNotaSaida.QSomaItemNotasval_total_nota.Value -
            DMNotaSaida.pValorValeCompras) * DMPrazoVencimento.QPrazoVencimentoPERC_DESCONTO.Value) / 100;
        dmnotasaida.QNotaSaida.Post;
        //        FNotaConsum_Confirma.MeValorDesconto.Text := FloatToStr(Trunc(DMNotaSaida.QSomaItemNotasval_total_nota.Value * DMPrazoVencimento.QPrazoVencimentoPERC_DESCONTO.Value) / 100);
      end;
      DMNotaSaida.QSomaItemNota.Refresh;
      // Tratamento do Vale-presente
      TrataValeProduto('VALE-PRESENTE');
      if (DMPrazoVencimento.QPrazoVencimentoInd_Entrada.Value = 'SIM') then
         FNotaConsum_Confirma.MeEntrada.Text := FloatToStr(Trunc((DMNotaSaida.QSomaItemNotasVal_total_nota.Value -
                DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente) /
                (DMPrazoVencimento.QPrazoVencimentoNUM_PARCELAS.Value + 1) * 100) / 100);
    end
    else
    begin
      // Tratamento do Vale-compras
      DMNotaSaida.QSomaItemNota.Refresh;
      //DMNotaSaida.pValesProdutos := TStringList.Create;
      TrataValeProduto('VALE-COMPRAS');
      // Tratamento do Vale-presente
      TrataValeProduto('VALE-PRESENTE');
      DMNotaSaida.QSomaItemNota.Refresh;
    end;
    DMNotaSaida.QSomaVales.Close;
    DMNotaSaida.QSomaVales.Open;

    DMNotaSaida.pConfirmando := True;
    if DMNotaSaida.QNotaSaidaCod_Vendedor.Text = '' then
      raise exception.Create('Preencher Código Vendedor')
    else
      FNotaConsum_Confirma.MeVendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DMNotaSaida.QNotaSaidaCod_Vendedor.Text, True);
    //    FNotaConsum_Confirma.MeEntrada.Text := MeEntrada.Text;
    FNotaConsum_Confirma.MEValorDesconto.Text := FormatFloat('#,##0.00', DMNotaSaida.QNotaSaidaVAL_DESCONTO.Value);
{Solicitado para Pampa Brindes trazer automaticamente o código da conta corrente ao finalizar a nota a prazo. Alex 09/10/2024.}
    if (DMParamSistema.CodEmpresa = 'BRINDES') then
    begin
      wBancoPadrao := DMOracle.FastSelect('COD_BANCO_AGENCIA', 'TB_BANCO_AGENCIA', 'IND_BANCO_PADRAO = ' + QuotedStr('SIM'));
      if (wBancoPadrao <> '') then
      begin
        FNotaConsum_Confirma.MeContaCorrente.Text := DMOracle.FastSelect('COD_CONTA_CORRENTE','TB_CONTA_CORRENTE','COD_BANCO_AGENCIA = ' + wBancoPadrao);
        FNotaConsum_Confirma.MeContaCorrenteExit(Self);
      end;
    end;
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'CONSTRUIR') then
    begin

      FNotaConsum_Confirma.MeCadastro.Text := FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value);
      FNotaConsum_Confirma.EdTotalNF.Text := FormatFloat('###,###,##0.00',DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                                        DMNotaSaida.QNotaSaidaVal_AVista.Value -
                                        DMNotaSaida.pValorValeCompras -
                                        DMNotaSaida.pValorValePresente);
      FNotaConsum_Confirma.EdVenda.Text := FormatFloat('###,###,##0.00',DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                                            DMNotaSaida.pValorValeCompras - DMNotaSaida.pValorValePresente);// - StrToFloat(FNotaConsum_Confirma.MeValorDesconto.Text));
      if DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value = '2' then
        DMCadastro.ValidaCredito(DmNotaSaida.QNotaSaidaCod_Cadastro.Value, DMNotaSaida.QSomaItemNotasval_total_nota.Value -
                    DMNotaSaida.QNotaSaidaVal_AVista.Value);
      FNotaConsum_Confirma.MeDepartamento.Text := IntToStr(DMusuario.CodDepartamentoUsuario);
      FNotaConsum_Confirma.MeFinalidade.Text := IntToStr(DMUsuario.CodFinalidadeUsuario);
      FNotaConsum_Confirma.MePrazo.Text := DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Text;
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
       FNotaConsum_Confirma.ShowModal;
    DMNotaSaida.pConfirmando := False;
    SBRefreshClick(Self); // para atualizar os dados na tela
  except
    DMNotaSaida.pConfirmando := False;
    raise;
  end;

  GeraBoletoApi;
end;

procedure TFNotaConsumidor.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
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
  //SBImprimeNFCons.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse; //18-03-2013 - Junior. Não deixa habilitado o SBImprimeNFCons quando a nota estiver confirmada.
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '1' then
    LblSituacao.Caption := 'DIGITADA';
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '2' then
    LblSituacao.Caption := 'CONFIRMADA';
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' then
    LblSituacao.Caption := 'CANCELADA';
  if DMNotaSaida.QNotaSaidaInd_Situacao.Value = '4' then
    LblSituacao.Caption := 'DENEGADA';
  GBValeCompras.Enabled := DMNotaSaida.QNotaSaida.State <> dsBrowse;
end;

procedure TFNotaConsumidor.SBExcluirClick(Sender: TObject);
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
end;

procedure TFNotaConsumidor.SBCancelarClick(Sender: TObject);
begin
  with DMNotaSaida do
  begin
    if QItemNF.State in [dsEdit, dsInsert] then
      QItemNF.Cancel;
  end;
  LblFormaCompra.Caption := '';
  LblAutoriza.Caption := '';
  lblRamo.Caption := '';
  FNotaSaidaCons.wRetornoCondicional := False;
  inherited;
  DMNotaSaida.QValeProdutoTroca.Refresh;
end;

procedure TFNotaConsumidor.SBImprimeNFConsClick(Sender: TObject);
var wCodCRCab : Integer;
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
        if DMParamSistema.CodEmpresa = 'REFRISM' then
        begin
          wCodCRCab := StrToInt('0'+DMOracle.FastSelect('COD_NOTA_CAB','TB_CONTA_RECEBER_CAB','COD_NOTA_CAB = ' + QNotaSaidaCOD_NOTA_CAB.Text));
          if IntToStr(wCodCRCab) <> '' then
            DMOracle.ExecutaSql('UPDATE TB_CONTA_RECEBER_CAB SET DESC_OBSERVACAO = DESC_OBSERVACAO ||' + QuotedStr('-'+FNotaConsumidorNome.EdCadastro.Text) +
                                ' WHERE COD_NOTA_CAB = ' + FloatToStr(QNotaSaidaCOD_NOTA_CAB.Value), False);
        end;

        
        if QNotaSaida.State = DsInsert then
        begin
          QNotaSaida.Post;
          QNotaSaida.Edit;
        end;
        QNotaNome.Post;
      end;
    end;
    SBRefreshClick(Sender);
    //Descomentado desta linha até o final para impressão da nota do Consumidor. 14-fev-2012
    if (DMParamsistema.CodEmpresa <> 'COZER')   and
       (DMParamsistema.CodEmpresa <> 'PROPE')   and
       (DMParamsistema.CodEmpresa <> 'INSIDE')  and
       (DMParamsistema.CodEmpresa <> 'KREUZ')   and
       (DMParamsistema.CodEmpresa <> 'BORGES')  then
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

procedure TFNotaConsumidor.DBRGCondicaoPagamentoChange(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BEGNINI' then
    if DBRGCondicaoPagamento.ItemIndex = 0 then
      DMNotaSaida.QNotaSaidaCOD_PRAZO_VENCIMENTO.Clear;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BRASIL' then
  begin
    if (DMOracle.DBCemapa.InTransaction) and (DMNotaSaida.QNotaSaida.State in [dsInsert, dsEdit]) then
    begin
      with DMNotaSaida do
      begin
        if DBRGCondicaoPagamento.ItemIndex = 0 then // a vista
          if DMUsuario.CodSeriePadrao <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePadrao;
        if DBRGCondicaoPagamento.ItemIndex = 1 then // a prazo
          if DMUsuario.CodSeriePrazo <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSeriePrazo;

        if DBRGCondicaoPagamento.ItemIndex = 2 then // conta corrente
          if DMUsuario.CodSerieCC <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSerieCC;

        if DBRGCondicaoPagamento.ItemIndex = 3 then // cartao de credito
        begin
          if DMUsuario.CodSerieCartao <> '' then
            QNotaSaidaCod_Serie.Value := DMUsuario.CodSerieCartao;
        end;
      end;
    end;
  end;
end;

procedure TFNotaConsumidor.DBEClienteExit(Sender: TObject);
var
  wAux, wData_Cadastro: string;
  wVale: string;
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
    if ((wAux <> '') and (DMParamSistema.CodEmpresa <> 'CEREAIS')   and
                         (DMParamSistema.CodEmpresa <> 'FERRAGENS') and
                         (DMParamSistema.CodEmpresa <> 'GRAUBER') and
                         (DMParamSistema.CodEmpresa <> 'NFCE-FRADE') and
                         (pos('NFC',DMParamSistema.CodEmpresa) = 0)) then // Adicionado NFCE Cod. Suporte = 8501 03/01/2024 Pedro e Alex
      if MessageDLG('Cliente Possui Titulos R$ ' + wAux, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        if FContasReceberCons = nil then
          FContasReceberCons := TFContasReceberCons.Create(Application);
        FContasReceberCons.MecodCliente.Text := DmNotaSaida.QNotaSaidaCod_Cadastro.Text;
        FContasReceberCons.BtProcurarClick(Self);
        FContasReceberCons.ShowModal;
      end;                             {VALE}
      if (DMParamSistema.CodEmpresa <> 'OSARE') then
      begin
        wVale := DMOracle.BuscaNome('SELECT COD_VALE_PRODUTO FROM TB_VALE_PRODUTO ','COD_NOTA_CAB_TROCA IS NULL AND DESC_TIPO_VALE = ''VALE-COMPRAS'' ' +
                 ' AND COD_CADASTRO = ' + Trim(DmNotaSaida.QNotaSaidaCod_Cadastro.Text)); //verifica se existe vale. Solicitado Osare. Suporte(13321). - junior 09/09/2019
        if wVale <> '' then
          ShowMessage('Cliente possui VALE');
      end;
  end
  else
  begin
    lblRamo.Caption := '';
    LblAutoriza.Caption := '';
    LblFormaCompra.Caption := '';
  end;
end;

procedure TFNotaConsumidor.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(17);
end;

procedure TFNotaConsumidor.FormClose(Sender: TObject;
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
  FNotaConsumidor := nil;
end;

procedure TFNotaConsumidor.DBGrid1ColExit(Sender: TObject);
var wCodigo, wDescProduto: string;
    wNumFabricante : string;
  ClickedOK: Boolean;
  wDescontoCliente : String;
begin
  inherited;
  wCodigo := '';

  // Produto não informado
  if (Trim(DMNotaSaida.QItemNFNum_Fabricante.Text) = '') and
    (DMNotaSaida.QItemNFCod_Produto.Value = 0) then
    exit;

  //  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then   // RETIRADO PELO CESAR DIA 07/01/2010
    if DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE' then
      if DMNotaSaida.QItemNFNum_Fabricante.Text <> '' then
      begin
        if Trim(DMNotaSaida.QItemNFNum_Fabricante.Text) <> '' then
          wCodigo := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + Chr(39) + DMNotaSaida.QItemNFNum_Fabricante.Text + Chr(39));
        if wCodigo <> '' then
          DMNotaSaida.QItemNfCod_Produto.Value := StrToInt(wCodigo);
      end;
    if (DbGrid1.SelectedField.FieldName = 'COD_PRODUTO') or
      (DbGrid1.SelectedField.FieldName = 'NUM_FABRICANTE') then
    begin
      if (DMNotaSaida.QItemNFCod_Produto.Text <> '') then
      begin
        if DMNotaSaida.QItemNFCod_Produto.Value > 0 then
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

      if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CASATINTAS') and
         (wCodigo = '20000') then
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

    if (DBGrid1.Columns.Grid.SelectedIndex = 0) or (DBGrid1.Columns.Grid.SelectedIndex = 1) then
      lblProduto.Caption := DMOracle.FastSelect('DESC_PRODUTO'
        , 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodigo);
    if DMParamSistema.CodEmpresa = 'PAULINHO' then //puxar desconto do cliente na nota ao consumidor. Paulinho. Junior 20/12/2019
    begin
      wDescontoCliente := '0' +  DMOracle.BuscaNome('SELECT PERC_DESCONTO2 FROM TB_CADASTRO','COD_CADASTRO='+ DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
      if StrToFloat(wDescontoCliente) > 0 then
      Begin
        DMNotaSaida.QItemNFPERC_DESCONTO.Value := StrTofloat(wDescontoCliente);
      end;
    end;
    if (DMParamSistema.CodEmpresa = 'PAULINHO') and (DMNotaSaida.QItemNF.State in [dsInsert,dsEdit]) then
    begin
      if (DbGrid1.SelectedField.FieldName = 'COD_PRODUTO') or (DbGrid1.SelectedField.FieldName = 'QT_QUANTIDADE') or
         (DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO') or (DbGrid1.SelectedField.FieldName = 'PERC_DESCONTO') or
         (DbGrid1.SelectedField.FieldName = 'VAL_UNITARIO_COM_DESCONTO') then
      begin
        DMNotaSaida.QItemNF.Post;
        DMNotaSaida.QItemNF.Edit;
      end;
    end;

end;

procedure TFNotaConsumidor.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (key = #13) and (Dbgrid1.Columns.Grid.SelectedIndex = 0) then
    Dbgrid1.Columns.Grid.SelectedIndex := 1;
end;

procedure TFNotaConsumidor.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  {if DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ' then
    if (DMNotaSaida.QItemNfCod_Produto.Value = 0) or (DMNotaSaida.QItemNfCod_Produto.Text = '') then
      Dbgrid1.Columns.Grid.SelectedIndex := 1;}
   if (DMParamSistema.CodEmpresa = 'GERALPECAS') or (DMParamSistema.CodEmpresa = 'VILCAR')  then
   begin
     if (DMNotaSaida.QItemNfCod_Produto.Value = 0) or (DMNotaSaida.QItemNfCod_Produto.Text = '') then
       Dbgrid1.Columns.Grid.SelectedIndex := 0;
   end
   else
   begin
     if (DMNotaSaida.QItemNfCod_Produto.Value = 0) or (DMNotaSaida.QItemNfCod_Produto.Text = '') then
       Dbgrid1.Columns.Grid.SelectedIndex := 1;
   end;
end;

procedure TFNotaConsumidor.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFNotaConsumidor.BtConsCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFNotaConsumidor.SBComprovanteEntregaClick(Sender: TObject);
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

procedure TFNotaConsumidor.BitBtn1Click(Sender: TObject);
begin
  inherited;
  PGNota.ActivePage := TSItens;
  PGNotaChange(Self);
end;

procedure TFNotaConsumidor.FormCreate(Sender: TObject);
var i : integer;
begin
  wVendaSimples := False;

  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONSTRUIR') then
  begin
    DBRGCondicaoPagamento.Items.Clear;
    DBRGCondicaoPagamento.Items.add('A Vista');
    DBRGCondicaoPagamento.Items.add('A Prazo');
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RETIFOZ') then
  begin
    DBRGCondicaoPagamento.Items.Clear;
    DBRGCondicaoPagamento.Items.add('A Vista');
    DBRGCondicaoPagamento.Items.add('A Prazo');
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'FOGOES') then
  begin
    DBRGCondicaoPagamento.Items.Clear;
    DBRGCondicaoPagamento.Items.add('A Vista');
    DBRGCondicaoPagamento.Items.add('A Prazo');
    DBRGCondicaoPagamento.Items.add('Outros');
    DBRGCondicaoPagamento.Items.add('Cartão');
  end;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RUDI') then
  begin
    MeCodBarra.Visible := True;
    LCodBarra.Visible := True;
    Label2.Visible := False;
    DBEdit5.Visible := False;
    BtConsCadastroParceiro.Visible := False;
    Label64.Visible := False;
    DBEDepartamento.Visible := False;
    BtConsDepartamento.Visible := False;
    DBRGCondicaoPagamento.Items.Clear;
    DBRGCondicaoPagamento.Items.add('A Vista');
    DBRGCondicaoPagamento.Items.add('A Prazo');
    DBRGCondicaoPagamento.Items.add('Cartão Débito');
    DBRGCondicaoPagamento.Items.add('Cartão Crédito');
  end
  else
  begin
    MeCodBarra.Visible := False;
    LCodBarra.Visible := False;
  end;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') or
     (DMParamSistema.CodEmpresa = 'DONABENTA') then
  begin
    DBRGCondicaoPagamento.Items[2] := 'C/C';
    DBRGCondicaoPagamento.Controls[2].Enabled := False;
  end;
  PGNota.ActivePage := TSNota;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'BEGNINI')   Or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CONSTRUIR') Then
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
  
  if (DMParamSistema.CodEmpresa = 'UNIFORME') or (DMParamSistema.CodEmpresa = 'NUTRIVET') or (DMParamSistema.CodEmpresa = 'ITATIBA')  or
     (DMParamSistema.CodEmpresa = 'DINGLIS') or (DMParamSistema.CodEmpresa = 'NUTRIPET') then
  begin
    DbGridEstoque.Columns[3].Visible := DMUsuario.Privilegiado;
  end;

  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ') then
  begin
    DbGrid1.Columns.Items[7].Index := 3;
    DbGrid1.Columns.Items[1].Index := 6;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'DINIZ')      and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GERALPECAS') and
     (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'CEIFAGRIL')  and
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'VILCAR')     and  //JUNIOR 22-04-2013
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'REFRISM') then //JUNIOR 13-06-2013
  begin
    DbGrid1.Columns[0].Visible := False;
  end;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ') Then
  begin
    LblDespesas.Visible := True;
    DbDespesas.Visible := True;
    LblDespesas.Top := 304;
    DbDespesas.Top := 320;
  end;
  if FNotaSaidaCons = nil then
    FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  MMCadSimples.Items[1][7].Enabled := (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ARISTIDES');
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'PAULINHO' then
  begin   //Aumentar a fonte do grid. Solicitado por Paulinho. Junior 20/12/2019
    for i := 0 to DBGrid1.Columns.Count - 2 do
    begin
      DBGrid1.Columns[i].Font.Size := 11;
      DBGrid1.Columns[i].Title.Font.Size := 11;
    end;
    DBGrid1.Columns.Items[3].ReadOnly := True; //Não alterar o vlr unitário.
    DBGrid1.Columns.Items[3].Width := 80;
    DBGrid1.Columns.Items[2].width := 430;
    DBGrid1.Columns.Items[6].Visible := true;
    DBGrid1.Columns.Items[7].Visible := false;
    DBGrid1.Columns.Items[15].Visible := true; // Valor unitário com desconto
    DBGrid1.Columns.Items[5].Visible := false; // Valor do desconto
    DBGrid1.Columns.Items[15].Index := 6;
  end
  else
  begin
    DBGrid1.Columns.Items[15].Visible := false;
    DBGrid1.Columns.Items[5].Visible := true;
  end;
  if (DMParamSistema.CodEmpresa = 'GRAUBER') then //Junior 03/04/2026.
  begin
    DBGrid1.Columns.Items[1].Width := 90; //Quantidade
    DBGrid1.Columns.Items[2].Width := 270; //Descrição
    DBGrid1.Columns.Items[3].width := 90; //Valor Unitário
    DBGrid1.Columns.Items[6].Width := 130; //Valor total
  end;
  if (DMParamSistema.CodEmpresa = 'CEREAIS') then
  begin //Solicitação Silvanio Código/qtde/descrição. Junior 13/08/2026
    DBGrid1.Columns.Items[3].Index := 2;
  end;
  if DMParamSistema.QParamSistemaIND_CONTROLE_CARTAO.Value = 'S' then
    MMCadSimples.Items[2].Items[15].Enabled := True;
end;

procedure TFNotaConsumidor.SBIncluirClick(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QparamSistemaCod_Empresa.Value = 'NFCE-SEDAM' then
    DBRadioGroup1.ItemIndex := 1;

  if DMParamSistema.QParamSistemaIND_NUM_NOTA_INCLUSAO.Value = 'SIM' then  //deixar igual o frente de caixa para pegar a numeração.
  begin
    if DMNotaSaida.QNotaSaidaNum_Nota.Value = 0 then
          DMNotaSaida.QNotaSaidaNum_Nota.Value := DMSerie.NumeroSerie(DMNotaSaida.QNotaSaidaCod_Filial.Value, DMNotaSaida.QNotaSaidaCod_Serie.Value,
            DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value, True);
  end;
  DBCBTipoCartao.Visible := False;
  if (pos('NFC',DMParamSistema.CodEmpresa) > 0) and (DMParamSistema.CodEmpresa <> 'NFCE-TROPI') then
  begin
    PGNota.ActivePage := TSItens;
    if (DMParamSistema.CodEmpresa = 'NFCE-ANJO') or (DMParamSistema.CodEmpresa = 'NFCE-BAHIA') or
       (DMParamSistema.CodEmpresa = 'NFCE-DOCES')or (DMParamSistema.CodEmpresa = 'NFCE-CASAP') then //Para Anjo Gabriel sempre Setar o Foco para o código de barras. Junior - 10/10/2015
      MECodBarras2.SetFocus
    else
      DBGrid1.SetFocus;
  end
  else
  begin
    if DMParamSistema.QparamSistemaCod_Empresa.Value = 'MINIMART' then
      PGNota.ActivePage := TSItens
    else
    begin
      PGNota.ActivePage := TSNota;
      DBECliente.SetFocus;
    end;
  end;
  if DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' then
    DMNotaSaida.QNotaSaidaPERC_COMISSAO.Value := 0.01;

  FNotaSaidaCons.wRetornoCondicional := False;
  MeCodValeProduto.Clear;
  VendaSimples;
  CBIndPresenca.ItemIndex := 1;
end;

procedure TFNotaConsumidor.DBEdit17Change(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.QItemNFnome_produto.Value <> '' then
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then //aqui problema do moinho do oracle 10, problema do campo LOB da imagem. quando for resolvido o problema no moinho esse if pode ser removido.
      AtualizarImagemProduto;
end;

procedure TFNotaConsumidor.AtualizarImagemProduto;
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

procedure TFNotaConsumidor.BtCondicaoClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = mrOk then
  begin
    DMNotaSaida.QNotaSaidaCod_Prazo_Vencimento.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;
    //DBEdit7Change(Self);
  end;
end;

procedure TFNotaConsumidor.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VoltaConfirmao1Click(Self);
end;

procedure TFNotaConsumidor.CancelaNota1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.CancelarNota1Click(Self);
end;

procedure TFNotaConsumidor.DBEClienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 123 then //123 = F12
    BtConsCadastro.Click;
end;

procedure TFNotaConsumidor.PGNotaChange(Sender: TObject);
begin
  inherited;
  if PgNota.ActivePage = TsItens then
  begin
    if (DMParamSistema.CodEmpresa = 'GERALPECAS') or (DMParamSistema.CodEmpresa = 'VILCAR') then
      DBGrid1.SelectedIndex := 0
    else
      DBGrid1.SelectedIndex := 1;
    if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'RUDI') then
    begin
      PGNota.ActivePage := TSItens;
      MeCodBarra.SetFocus;
    end
    else
    begin
      if (DMParamSistema.CodEmpresa  = 'CONSTRUIR') or (DMParamSistema.CodEmpresa  = 'COZER')     or
         (DMParamSistema.CodEmpresa  = 'DINGLIS')   or (DMParamSistema.CodEmpresa  = 'NFCE-ANJO') or
         (DMParamSistema.CodEmpresa  = 'PAPELARIA') or (DMParamSistema.CodEmpresa  = 'NFCE-DEB')  or
         (DMParamSistema.CodEmpresa  = 'NFCE-BAHIA')or (DMParamSistema.CodEmpresa  = 'BIKEBOX')   or
         (DMParamSistema.CodEmpresa  = 'NFCE-DOCES')or (DMParamSistema.CodEmpresa  = 'FLORES') or
         (DMParamSistema.CodEmpresa  = 'MODASUL')   or (DMParamSistema.CodEmpresa  = 'NFCE-CASAP') or
         (DMParamSistema.CodEmpresa  = 'PROPE')  Then
        MECodBarras2.SetFocus
      else
      begin
        DBGrid1.SetFocus;
      end;
    end;
    with DMNotaSaida do
      if (QNotaSaidaCOD_OPERACAO.Text <> '') and (QNotaSaidaIND_SITUACAO.Value = '1') then
        if DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO',
         'COD_OPERACAO = ' + FloatToStr(QNotaSaidaCod_Operacao.Value), True) = 'D' then
          FNotaSaidaCad.BtNotaCompra_ConsClick(Self);
  end;
end;

procedure TFNotaConsumidor.DBECodOperacaoExit(Sender: TObject);
var
  wOperacao: string;
  wModelo: string;
begin
  inherited;
  if (Trim(DBECodOperacao.Text) = '') Then  // quando não informado o codigo de operação não executa está procedure
    Exit;
  DMOperacao.QOperacao.Close;
  DMOperacao.QOperacao.SetVariable('PK',Trim(DBECodOperacao.Text));
  DMOperacao.QOperacao.Open;
  if DMOperacao.QOperacaoIND_TIPO_OPERACAO.Value <> 'S' then
  begin
    DMNotaSaida.QNotaSaidaCOD_OPERACAO.Clear;
    DBECodOperacao.SetFocus;
    raise Exception.Create('A operação informada não é de saida.');
  end;
  //Alterar Série e Modelo quando alterar a operacao. Junior - 04/07/2018

  if (DMOperacao.QOperacaoCOD_SERIE.Value <> '')  then//or (DMOperacao.QOperacaoCOD_SERIE_MODELO.Value <> '') then
  begin
    DMNotaSaida.QNotaSaidaCOD_SERIE.Text := DMOperacao.QOperacaoCOD_SERIE.Value;
    DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Text := DMOperacao.QOperacaoCOD_SERIE_MODELO.Value;
  end
  else if (not(DMNotaSaida.pMudancaOperacaoManual) and (DMParamSistema.CodEmpresa <> 'COZER')  and
              (DMParamSistema.CodEmpresa <> 'PROPE')) then //Bruna pediu para nao mudar serie e modelo. Vanessa 26/09/2019
  begin
    DMNotaSaida.QNotaSaidaCOD_SERIE.Text := DMUsuario.CodSeriePadrao;
    DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Text := DMUsuario.CodSerieModeloPadrao;
  end;
  DMNotaSaida.pMudancaOperacaoManual := true;
  if (DMParamSistema.CodEmpresa = 'FERRAGMED') or
      (DMParamSistema.CodEmpresa = 'DONABENTA') then
    if DMOperacao.QOperacaoIND_COMPRAS.Value = 'D' then
      DBRGCondicaoPagamento.Controls[2].Enabled := True
    else
      DBRGCondicaoPagamento.Controls[2].Enabled := False;
end;

procedure TFNotaConsumidor.MeCodBarraExit(Sender: TObject);
var wInseriu: Boolean;
  wCodBarras: string;
  wProduto, wLote: Integer;
begin
  inherited;
  wInseriu := False;

  if Trim(MeCodBarra.Text) = '' then
    Exit;

  wCodBarras := MeCodBarra.Text;
  wProduto := StrToInt(Trim(MeCodBarra.Text));
  wLote := 1;

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

procedure TFNotaConsumidor.MeCodBarraEnter(Sender: TObject);
begin
  inherited;
  MeCodBarra.SelectAll;
end;

procedure TFNotaConsumidor.DBGrid1ColEnter(Sender: TObject);
var
  dbg: TDBGrid;
  col: TColumn;
  wCodigo: string;
begin
  inherited;
  dbg := Sender as TDBGrid;
  col := dbg.Columns.Items[dbg.SelectedIndex];
  if (col.FieldName = 'VAL_UNITARIO') then
  //  ValUn := DMNotaSaida.QItemNFVAL_UNITARIO.Value;
  if (DMParamSistema.CodEmpresa = 'PAULINHO') and (col.FieldName = 'PERC_DESCONTO') then
    DMNotaSaida.QItemNFVAL_UNITARIO_COM_DESCONTO.Clear;
end;

procedure TFNotaConsumidor.ImgProdutoClick(Sender: TObject);
begin
  inherited;
  PnImagemFull.BringToFront;
  PnImagemFull.Visible := True;
end;

procedure TFNotaConsumidor.IImagemFullClick(Sender: TObject);
begin
  inherited;
  PnImagemFull.SendToBack;
  PnImagemFull.Visible := False;
end;

procedure TFNotaConsumidor.DbObraDefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FObraCons;
  Classe := TFObraCons;
end;

procedure TFNotaConsumidor.VendaSimples;
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

procedure TFNotaConsumidor.DBESerieExit(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'KREUZ') then
   Begin
     If (DMNotaSaida.QNotaSaidaCod_Serie.Value = 'PE') Or
        (DMNotaSaida.QNotaSaidaCod_Serie.Value = '1')  Then
        DMNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '2';
     If DMNotaSaida.QNotaSaidaCod_Serie.Value = 'CUP' Then
        DBPModelo.DBEdit.Text := '2D';

     If DMNotaSaida.QNotaSaidaCod_Serie.Value = '1' Then
     begin
        if DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '55' then
          DMNotaSaida.QNotaSaidaNUM_NOTA.Value := 0;
        DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value := '55';
     end;
   End;     
end;

procedure TFNotaConsumidor.btSerieConsClick(Sender: TObject);
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
     DBPModelo.OnCodigoExit(self);
    end;
  end;
end;

procedure TFNotaConsumidor.DBPModeloCodigoExit(Sender: TObject);
begin
  inherited;
  bib.setModelo(DMNotaSaida.QNotaSaida, lblModelo);
end;

procedure TFNotaConsumidor.MECodBarras2ExitJasol;
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

procedure TFNotaConsumidor.MECodBarras2Normal;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    if ((DMParamSistema.CodEmpresa= 'OSARE') or (DMParamSistema.CodEmpresa = 'PIXIXE') or
        (DMParamSistema.CodEmpresa = 'MODASUL') or (DMParamSistema.CodEmpresa = 'DINGLIS')) and (Length(MECodBarras2.Text) = 8) then
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
      if (DMParamSistema.CodEmpresa = 'OSARE') or (DMParamSistema.CodEmpresa = 'PIXIXE') OR
         (DMParamSistema.CodEmpresa = 'MODASUL') or (DMParamSistema.CodEmpresa = 'DINGLIS')   then
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
        if (DMParamSistema.CodEmpresa= 'OSARE') or (DMParamSistema.CodEmpresa = 'PIXIXE') or
           (DMParamSistema.CodEmpresa = 'MODASUL') or (DMParamSistema.CodEmpresa = 'DINGLIS') then
          QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
      end;
    end;
    MECodBarras2.SetFocus;
  end;

end;

procedure TFNotaConsumidor.MECodBarras2DINGLIS;
var wCodProduto, wLote :String;
    wAchou: boolean;
    wPeso: Double;
begin
  inherited;
  wLote := '1';
  if trim(MECodBarras2.Text) <> '' then
  begin
    if (DMParamSistema.CodEmpresa = 'DINGLIS') and (Length(MECodBarras2.Text) = 8) then
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(copy(MECodBarras2.Text,1,6))))
    else
      wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(trim(MECodBarras2.Text)));
    if wCodProduto = '' then  //caso não tiver codigo de barra, pegar pelo cod_produto. Soliticao MARCOS. Junior 10/03/2015.
    begin
      if (Length(MECodBarras2.Text) = 8) then
      begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,1,6))));
        wLote := Copy(MECodBarras2.Text,7,2);
      end
      else
      begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,1,7))));
        wLote := '1';
      end;
      {if (DMParamSistema.CodEmpresa = 'DINGLIS')   then
      begin
        wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = ' + QuotedStr(trim(Copy(MECodBarras2.Text,1,6))));
        if Length(MECodBarras2.Text) = 8 then
          wLote := Copy(MECodBarras2.Text,7,2)
        else
          wLote := '1';
      end}
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
        if (DMParamSistema.CodEmpresa= 'OSARE') or (DMParamSistema.CodEmpresa = 'PIXIXE') or
           (DMParamSistema.CodEmpresa = 'MODASUL') or (DMParamSistema.CodEmpresa = 'DINGLIS') then
          QItemNFCOD_LOTE_TIPO.Value := StrToInt(wLote);
        if wPeso > 0 then
          QItemNFQT_QUANTIDADE.Value := wPeso;

        QItemNF.Post;
      end;
    end;
    MECodBarras2.SetFocus;
  end;

end;

procedure TFNotaConsumidor.MECodBarras2Exit(Sender: TObject);
begin
  if DMParamSistema.CodEmpresa = 'JASOL' then
    MECodBarras2ExitJasol
  else if DMParamSistema.CodEmpresa = 'NFCE-CASAP' then //Suporte(861). Leitura cod. barras balança. - Junior 09/09/2020.
    MECodBarras2ExitCASADOPEIXE
  else if DMParamSistema.CodEmpresa = 'CASAPEIXE' then
    MECodBarras2ExitCASADOPEIXE
  else if (DMParamSistema.CodEmpresa = 'DINGLIS') then
    MeCodBarras2DINGLIS
  else
    MECodBarras2Normal;
end;

procedure TFNotaConsumidor.EmissoCpia1Click(Sender: TObject);
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
  {  if (DMNotaSaida.QNotaSaidaVal_AVista.Value > 0) and
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
    end;  }  // RETIRADO PELO CESAR
  end;
//  if (DMParamSistema.CodEmpresa = 'MEDIBENS') then
//    DMOracle.DBCemapa.Commit;
  FNotaImpressao.Free;
  SBRefreshClick(Self);
end;

procedure TFNotaConsumidor.ransaesGerenciaisTEF1Click(Sender: TObject);
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

procedure TFNotaConsumidor.Nu(Sender: TObject);
begin
  inherited;
  //Não deixar editar o valor unitario dos produtos para a Cozer. Vanessa 05/10/2013
  if ((DMParamSistema.CodEmpresa = 'COZER') or (DMParamSistema.CodEmpresa = 'PROPE')) then
   begin
    DBGrid1.Columns[3].ReadOnly := true;
   end;
end;

procedure TFNotaConsumidor.InutilizaodeNumerao1Click(Sender: TObject);
begin
  inherited;
  DMNfe.InutilizaNumeracaoNfe;
end;

procedure TFNotaConsumidor.EnviarviaEmail1Click(Sender: TObject);
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

procedure TFNotaConsumidor.ReemitirDanfe1Click(Sender: TObject);
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

procedure TFNotaConsumidor.Reconsultar1Click(Sender: TObject);
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

procedure TFNotaConsumidor.Exportar1Click(Sender: TObject);
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

procedure TFNotaConsumidor.ExportarNotasPorPerodo1Click(Sender: TObject);
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

procedure TFNotaConsumidor.VerRetornodeEnvio1Click(Sender: TObject);
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

procedure TFNotaConsumidor.EmitirCartadeCorreoEletrnica1Click(
  Sender: TObject);
begin
  inherited;
  SBCartaCorrecaoClick(self);
end;

procedure TFNotaConsumidor.SBCartaCorrecaoClick(Sender: TObject);
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

procedure TFNotaConsumidor.DBPModeloCodigoChange(Sender: TObject);
begin
  inherited;
  DBLBFormasPagamentoNFCe.Visible := DBPModelo.DBEdit.Text = '65';
  LBFormasPagamentoNFCe.Visible := DBLBFormasPagamentoNFCe.Visible;
  DBRGCondicaoPagamento.Visible := (not DBLBFormasPagamentoNFCe.Visible) and
                           (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES') and
                           (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'CONSTRUIR');
  DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := Bib.ift((DBPModelo.DBEdit.Text = '65') and
      (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'ARISTIDES'),
      '3',DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value);

  if (DBPModelo.DBEdit.Text <> DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value) and
     (DMNotaSaida.QNotaSaidaCOD_SERIE_MODELO.Value <> '') and
     (Length(Trim(DBPModelo.DBEdit.Text)) = 2) and
     (DMNfe.QNfeSIT_NFE.Value <> '100') and
     (DMNfe.QNfeSIT_NFE.Value <> '150') and
     (DMNfe.QNfeSIT_NFE.Value <> '149') and
     (DMParamSistema.CodEmpresa <> 'ARZ') then //zerar número da nota quando mudar serie de pedido para serie fiscal. Vanessa  18/04/2017
    dmnotasaida.QNotaSaidaNUM_NOTA.Value := 0;
end;

procedure TFNotaConsumidor.N1RelaodeNotas1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.RelaodeNotas1Click(Self);
end;

procedure TFNotaConsumidor.N2MapadeVendas1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.MapadeVendas1Click(Self);
end;

procedure TFNotaConsumidor.SBAlterarClick(Sender: TObject);
begin
  inherited;
  DBCBTipoCartao.Visible := False;
  DMNfe.SetaNfe(Bib.LimpaNumero(DMNotaSaida.QNotaSaidaDESC_CHAVE_ACESSO.Value));
end;

procedure TFNotaConsumidor.DBText9MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  DBTSitSefaz.Hint :=
    DMNotaSaida.QNotaSaidadesc_situacao_sefaz.Value;
end;

procedure TFNotaConsumidor.DBCodNotaCabChange(Sender: TObject);
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

procedure TFNotaConsumidor.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VoltaCancelamento1Click(self);
end;

procedure TFNotaConsumidor.N31Click(Sender: TObject);
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

procedure TFNotaConsumidor.VendasporOperaoProduto1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.VendasporOperaoProduto1Click(Self);
end;

procedure TFNotaConsumidor.ResumoNotasPorOperacao1Click(Sender: TObject);
begin
  inherited;
  FLivroFiscalCad.ResumoNotasPorOperacao1Click(Self);
end;

procedure TFNotaConsumidor.N6Resumodenotas1Click(Sender: TObject);
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

procedure TFNotaConsumidor.BtBuscarValeProdutoClick(Sender: TObject);
begin
  inherited;
  if FValeProdutoCons = nil then
    FValeProdutoCons := TFValeProdutoCons.Create(Application);
  if FValeProdutoCons.ShowModal = mrOk then
    if DMDevolucaoTroca.QValeProdutoConsCOD_VALE_PRODUTO.Text <> '' then
      MeCodValeProduto.Text := DMDevolucaoTroca.QValeProdutoConsCOD_VALE_PRODUTO.Text;
end;

procedure TFNotaConsumidor.MeCodValeProdutoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not( key in['0'..'9',#08,#13,#27,#42] ) then
    key:=#0;
  if Key = #13 then
    btIncluirClick(Self);
end;

procedure TFNotaConsumidor.MELocalizaExit(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QValeProdutoTroca.Refresh;
  CBIndPresenca.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_PRESENCA.Value < 9, DMNotaSaida.QNotaSaidaIND_PRESENCA.Value, 6);;
end;

procedure TFNotaConsumidor.SBRefreshClick(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QValeProdutoTroca.Refresh;
  CBIndPresenca.ItemIndex := Bib.ift(DMNotaSaida.QNotaSaidaIND_PRESENCA.Value < 9, DMNotaSaida.QNotaSaidaIND_PRESENCA.Value, 6);;
end;

procedure TFNotaConsumidor.DSPrimarioDataChange(Sender: TObject;
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

procedure TFNotaConsumidor.SBDocInserirClick(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.SBDocInserirClick(Self);
end;

procedure TFNotaConsumidor.SBDocRemoverClick(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.SBDocRemoverClick(Self);
end;

procedure TFNotaConsumidor.ReimprimirCupomTEFemMemria1Click(
  Sender: TObject);
begin
  inherited;
  if not FNotaImpressao.ImprimeComprovantesTEF then
    raise Exception.Create('Não há comprovantes TEF em memória.');
end;

procedure TFNotaConsumidor.btExcluirClick(Sender: TObject);
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

procedure TFNotaConsumidor.btIncluirClick(Sender: TObject);
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

procedure TFNotaConsumidor.MeCodValeProdutoEnter(Sender: TObject);
begin
  inherited;
  Self.Tag := 100;
end;

procedure TFNotaConsumidor.MeCodValeProdutoExit(Sender: TObject);
begin
  inherited;
  Self.Tag := 0;
end;

procedure TFNotaConsumidor.BtConsTransportadorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Transportador.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
  DBEdit24Exit(Self);
end;

procedure TFNotaConsumidor.DBEdit24Exit(Sender: TObject);
begin
  inherited;
  if (DMNotaSaida.QNotaSaidaCOD_TRANSPORTADOR.Text <> '') then
    DMNotaSaida.QNotaSaidaDESC_ESPECIE.Value := 'VOLUME'
  else
    DMNotaSaida.QNotaSaidaDESC_ESPECIE.Clear;
  if (Trim(DBEdit22.Text) <> '') and (Trim(DBEdit43.Text) = '') and
    (DMNotaSaida.QNotaSaidaCOD_UF_VEICULO.Value = '') then
  begin
    DMNotaSaida.QNotaSaidaDESC_PLACA.Value :=
      DMOracle.BuscaNome('SELECT DESC_PLACA FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit22.Text));
    DMNotaSaida.QNotaSaidaCOD_UF_VEICULO.Value :=
      DMOracle.BuscaNome('SELECT COD_UF_VEICULO FROM TB_CADASTRO', 'COD_CADASTRO = ' + Trim(DBEdit22.Text));
  end;
end;

procedure TFNotaConsumidor.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FEstadoCons;
  Classe := TFEstadoCons;
end;

procedure TFNotaConsumidor.SBChaveAcessoClick(Sender: TObject);
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

procedure TFNotaConsumidor.SpeedButton1Click(Sender: TObject);
var
  pnt: TPoint;
begin
  if GetCursorPos(pnt) then
    ppAtalhos.Popup(pnt.X, pnt.Y);
end;

procedure TFNotaConsumidor.DBECodOperacaoChange(Sender: TObject);
begin
  inherited;
  if Trim(DBECodOperacao.Text) <> '' then
  begin
    if DMOracle.FastSelect('IND_SERVICO', 'TB_OPERACAO', 'COD_OPERACAO = ' + DBECodOperacao.Text) = 'S' then
    begin
      Label47.Caption := 'Número NFS-e';
      DBENum_NFSe.Visible := true;
      DBEChaveAcesso.Visible := false;
      SBChaveAcesso.Visible := false;
      Label10.Caption := 'Num. Rps';
    end
    else
    begin
      Label47.Caption := 'Chave de Acesso';
      DBENum_NFSe.Visible := false;
      DBEChaveAcesso.Visible := true;
      SBChaveAcesso.Visible := true;
      Label10.Caption := 'Num. Nota';
    end;
  end;
end;

procedure TFNotaConsumidor.BtCopiaClick(Sender: TObject);
begin
  inherited;
  CBIndPresenca.ItemIndex := 1;
end;

procedure TFNotaConsumidor.tmiInformacaoCadClick(Sender: TObject);
var
  b: TStream;
  Jpg: TJpegImage;
begin
  inherited;
  if FInfoCadastro = nil then
    FInfoCadastro := TFInfoCadastro.Create(Application);
  DMCadastro.QInfoCadastro.Close;
  DMCadastro.QInfoCadastro.setVariable('PK',DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text);
  DMCadastro.QInfoCadastro.Open;

  Jpg := nil;
  b := DMCadastro.QInfoCadastro.CreateBlobStream(DMCadastro.QInfoCadastroIMG_IMAGEM, bmRead);
  if b.Size > 0 then
  begin
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      FInfoCadastro.Image1.Picture.Assign(Jpg);
      FInfoCadastro.Image1.visible := true;
    except
    end;
  end
  else
  begin
    FInfoCadastro.Image1.Picture.Assign(nil);
    FInfoCadastro.Image1.Visible := false;
  end;

  //lblImagemNaoCadastrada.Visible := not imgCadastro.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;

  FInfoCadastro.ShowModal;
end;

procedure TFNotaConsumidor.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  b: TStream;
  Jpg: TJpegImage;
begin
  inherited;
  if (Key = 120) and (DMNotaSaida.QNotaSaidaCOD_CADASTRO.Text <> '') then  //F9
  begin
    if FInfoCadastro = nil then
      FInfoCadastro := TFInfoCadastro.Create(Application);
    DMCadastro.QInfoCadastro.Close;
    DMCadastro.QInfoCadastro.setVariable('PK',DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value);
    DMCadastro.QInfoCadastro.Open;

    Jpg := nil;
    b := DMCadastro.QInfoCadastro.CreateBlobStream(DMCadastro.QInfoCadastroIMG_IMAGEM, bmRead);
    if b.Size > 0 then
    begin
      try
        Jpg := TJpegImage.Create;
        Jpg.LoadFromStream(b);
        FInfoCadastro.Image1.Picture.Assign(Jpg);
        FInfoCadastro.Image1.visible := true;
      except
      end;
    end
    else
    begin
      FInfoCadastro.Image1.Picture.Assign(nil);
      FInfoCadastro.Image1.Visible := false;
    end;
    jpg.Free;
    b.Destroy;

    Jpg := nil;
    b := DMCadastro.QInfoCadastro.CreateBlobStream(DMCadastro.QInfoCadastroIMG_ASSINATURA, bmRead);
    if b.Size > 0 then
    begin
      try
        Jpg := TJpegImage.Create;
        Jpg.LoadFromStream(b);
        FInfoCadastro.Image2.Picture.Assign(Jpg);
        FInfoCadastro.Image2.visible := true;
      except
      end;
    end
    else
    begin
      FInfoCadastro.Image2.Picture.Assign(nil);
      FInfoCadastro.Image2.Visible := false;
    end;
    jpg.Free;
    b.Destroy;

    FInfoCadastro.ShowModal;
  end;
end;

procedure TFNotaConsumidor.N7InformaesdeVendas1Click(Sender: TObject);
var i: integer;
  wGeneros, wSaltos, wMateriais, wConfiguracoes, wFiltros: string;
  wLotes: TStringList;
  wLoteInicial: Integer;
begin
  inherited;

  wFiltros := 'Filtros: ';
  if FInformacaoVendaParam = Nil then
    FInformacaoVendaParam := TFInformacaoVendaParam.Create(Application);
  FInformacaoVendaParam.PGRelatorio.Pages[0].TabVisible := true;
  if FInformacaoVendaParam.ShowModal = MrOk then
  begin
    with FInformacaoVendaParam, DMRelatorio_Venda do
    begin

      // Validações
      if Trim(FmDatas1.MeDtInicial.Text) = '' then
      begin
        MessageDlg('Data inicial não informada', mtError, [mbOk], 0);
        abort;
      end;
      if Trim(FmDatas1.MeDtFinal.Text) = '' then
        FmDatas1.MeDtFinal.Text := DateToStr(DMOracle.DataServ);

      if RadioGroup1.ItemIndex = 0 then // Dados agrupados
      begin
        if (Trim(MELoteIni.Text) = '') or (Trim(MELoteFin.Text) = '') then
        begin
          MessageDlg('Intervalo de tamanhos não informado para relatório de dados agrupados'
            , mtError, [mbOk], 0);
          Abort;
        end;
        if (StrToInt(Trim(MELoteFin.Text)) - StrToInt(Trim(MELoteIni.Text))) >= 11 then
        begin
          MessageDlg('Intervalo entre tamanho inicial e final, não pode ser maior do que 11 números'
            + chr(13) + chr(10)
            + 'Ex: De 34 a 44', mtError, [mbOk], 0);
          Abort;
        end;
      end;

//      if cbEstoque.ItemIndex = 2 then // Estoque calculado
//        if MessageDlg('Tipo de estoque calculado gera informações do estoque '
//          + 'considerando os documentos emitidos.'
//          + chr(13) + chr(10)
//          + 'Este procedimento pode demorar vários minutos.'
//          + chr(13) + chr(10)
//          + 'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = MrNo then
//            Abort;

      QRInformacaoVenda.Close;
      QRInformacaoVenda2.Close;

      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_1', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_2', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_3', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_4', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_5', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_6', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_7', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_8', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_9', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_10', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_11', null);
      QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_12', null);

      wGeneros := '';
      wSaltos := '';
      wMateriais := '';
      wConfiguracoes := '';
      // Monta SQLs para variáveis de substituição
      for i := 0 to FInformacaoVendaParam.ComponentCount - 1 do
      begin
        if FInformacaoVendaParam.Components[i].ClassName = 'TCheckBox' then
        begin
          if TCheckBox(FInformacaoVendaParam.Components[i]).Checked then
          begin
            wFiltros := wFiltros + Copy(FInformacaoVendaParam.Components[i].Name, 3
              , Length(FInformacaoVendaParam.Components[i].Name)) + ' ';
            // Tabela Gênero
            if Pos((FInformacaoVendaParam.Components[i].Name + ' '),
              'cbMasculino cbFeminino cbUnissex cbAdulto cbInfantil cbBebe ') > 0 then
            begin
              if wGeneros = '' then
                wGeneros := DMOracle.FastSelect('COD_GENERO_CALCADO'
                  , 'TB_GENERO_CALCADO', 'DESC_GENERO_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))))
              else
                wGeneros := wGeneros + ',' + DMOracle.FastSelect('COD_GENERO_CALCADO'
                  , 'TB_GENERO_CALCADO', 'DESC_GENERO_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))));
            end; // fim Genero
            // Tabela Salto
            if Pos((FinformacaoVendaParam.Components[i].Name + ' '),
              'cbAlto cbFino cbAcrilico cbBaixo cbAnabela cbLatex cbMedio cbFachete cbBorracha '
                + 'cbRasteira cbEncapado cbPVC cbGrosso cbCortica cbTR ') > 0 then
            begin
              if wSaltos = '' then
                wSaltos := DMOracle.FastSelect('COD_SALTO_CALCADO'
                  , 'TB_SALTO_CALCADO', 'DESC_SALTO_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))))
              else
                wSaltos := wSaltos + ',' + DMOracle.FastSelect('COD_SALTO_CALCADO'
                  , 'TB_SALTO_CALCADO', 'DESC_SALTO_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))));
            end; // fim Salto
            // Tabela Material
            if Pos((FinformacaoVendaParam.Components[i].Name + ' '),
              'cbCouro cbVerniz cbCamurca cbSintetico cbLona cbNobuk cbSwed cbTecido cbElastico '
                + 'cbMcrofibra cbGliter cbPlastico ') > 0 then
            begin
              if wMateriais = '' then
                wMateriais := DMOracle.FastSelect('COD_MATERIAL_CALCADO'
                  , 'TB_MATERIAL_CALCADO', 'DESC_MATERIAL_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))))
              else
                wMateriais := wMateriais + ',' + DMOracle.FastSelect('COD_MATERIAL_CALCADO'
                  , 'TB_MATERIAL_CALCADO', 'DESC_MATERIAL_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))));
            end; // fim Material
            // Tabela Config
            if Pos((FinformacaoVendaParam.Components[i].Name + ' '),
              'cbBoneca cbDorsai cbSlipper cbEsportiva cbIate cbSlipon cbCampo cbSuicoSociety '
                + 'cbTiraTornozelo cbSalome cbDedo cbGaspea cb2tiras cbMule cbCoturno '
                + 'cbMontaria cbOpenboot cbAnkleboot cbCanoMedio cbMedioConfig cb2Alcas '
                + 'cbTransversal cbBau cbLargo cbNotebook cbFesta cbClutch cbKit cbIndoorSalao '
                + 'cbTiraX cbOver cbEstreito cbChunky cbSneaker cbOxford cbEscolar cbViagem cb360 '
                + 'cbMangaLonga cbMangaCurta cbTermica cbProtecaoSolar cb2Rodas cb4Rodas cb5Rodas '
                + 'cbBrinde cbEspadrille cbContraforte cbLuz') > 0 then
            begin
              if wConfiguracoes = '' then
                wConfiguracoes := DMOracle.FastSelect('COD_CONFIG_CALCADO'
                  , 'TB_CONFIG_CALCADO', 'DESC_CONFIG_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))))
              else
                wConfiguracoes := wConfiguracoes + ',' + DMOracle.FastSelect('COD_CONFIG_CALCADO'
                  , 'TB_CONFIG_CALCADO', 'DESC_CONFIG_CALCADO LIKE '
                    + QuotedStr(UpperCase(Copy(FInformacaoVendaParam.Components[i].Name, 3
                      , Length(FInformacaoVendaParam.Components[i].Name)))));
            end; // fim Config
          end;
        end;
      end; // for

      if wGeneros <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_GENERO_CALCADO', wGeneros);
        QRInformacaoVenda2.SetVariable('COD_GENERO_CALCADO', wGeneros);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_GENERO_CALCADO', null);
        QRInformacaoVenda2.SetVariable('COD_GENERO_CALCADO', null);
      end;
      if wSaltos <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_SALTO_CALCADO', wSaltos);
        QRInformacaoVenda2.SetVariable('COD_SALTO_CALCADO', wSaltos);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_SALTO_CALCADO', null);
        QRInformacaoVenda2.SetVariable('COD_SALTO_CALCADO', null);
      end;
      if wMateriais <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_MATERIAL_CALCADO', wMateriais);
        QRInformacaoVenda2.SetVariable('COD_MATERIAL_CALCADO', wMateriais)
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_MATERIAL_CALCADO', null);
        QRInformacaoVenda2.SetVariable('COD_MATERIAL_CALCADO', null);
      end;
      if wConfiguracoes <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_CONFIG_CALCADO', wConfiguracoes);
        QRInformacaoVenda2.SetVariable('COD_CONFIG_CALCADO', wConfiguracoes)
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_CONFIG_CALCADO', null);
        QRInformacaoVenda2.SetVariable('COD_CONFIG_CALCADO', null);
      end;

      if RGSolado.ItemIndex > 0 then
      begin
        QRInformacaoVenda.SetVariable('IND_SOLADO',
          UpperCase(
            bib.RemoveAcentos(
              RGSolado.Items[RgSolado.itemIndex]
            )
          )
        );
        QRInformacaoVenda2.SetVariable('IND_SOLADO',
          UpperCase(
            bib.RemoveAcentos(
              RGSolado.Items[RgSolado.itemIndex]
            )
          )
        )
      end
      else
      begin
        QRInformacaoVenda.SetVariable('IND_SOLADO', null);
        QRInformacaoVenda2.SetVariable('IND_SOLADO', null);
      end;
      if QRInformacaoVenda.GetVariable('IND_SOLADO') <> '' then
        wFiltros := wFiltros + ' ' + QRInformacaoVenda.GetVariable('IND_SOLADO');
      if RGBico.ItemIndex > 0 then
      begin
        QRInformacaoVenda.SetVariable('IND_BICO',
          UpperCase(
            bib.RemoveAcentos(
              RGBico.Items[RgBico.itemIndex]
            )
          )
        );
        QRInformacaoVenda2.SetVariable('IND_BICO',
          UpperCase(
            bib.RemoveAcentos(
              RGBico.Items[RgBico.itemIndex]
            )
          )
        )
      end
      else
      begin
        QRInformacaoVenda.SetVariable('IND_BICO', null);
        QRInformacaoVenda2.SetVariable('IND_BICO', null);
      end;
      if QRInformacaoVenda.GetVariable('IND_BICO') <> '' then
        wFiltros := wFiltros + ' ' + QRInformacaoVenda.GetVariable('IND_BICO');
      if RGEnfeite.ItemIndex > 0 then
      begin
        QRInformacaoVenda.SetVariable('IND_ENFEITE',
          UpperCase(
            bib.RemoveAcentos(
              RGEnfeite.Items[RgEnfeite.itemIndex]
            )
          )
        );
        QRInformacaoVenda2.SetVariable('IND_ENFEITE',
          UpperCase(
            bib.RemoveAcentos(
              RGEnfeite.Items[RgEnfeite.itemIndex]
            )
          )
        )
      end
      else
      begin
        QRInformacaoVenda.SetVariable('IND_ENFEITE', null);
        QRInformacaoVenda2.SetVariable('IND_ENFEITE', null);
      end;
      if QRInformacaoVenda.GetVariable('IND_ENFEITE') <> '' then
        wFiltros := wFiltros + ' ' + QRInformacaoVenda.GetVariable('IND_ENFEITE');
      if Trim(FmMarca1.MeMarca.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_MARCA', Trim(FmMarca1.MeMarca.Text));
        QRInformacaoVenda2.SetVariable('COD_MARCA', Trim(FmMarca1.MeMarca.Text));
        wFiltros := wFiltros + ' ' + Trim(FmMarca1.EdMarca.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_MARCA', null);
        QRInformacaoVenda2.SetVariable('COD_MARCA', null);
      end;

      if Trim(FmClasse1.MeClasse.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_CLASSE', Trim(FmClasse1.MeClasse.Text));
        QRInformacaoVenda2.SetVariable('COD_CLASSE', Trim(FmClasse1.MeClasse.Text));
        wFiltros := wFiltros + ' ' + Trim(FmClasse1.EdClasse.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_CLASSE', null);
        QRInformacaoVenda2.SetVariable('COD_CLASSE', null);
      end;
      if Trim(FmLote1.MeLote.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('COD_LOTE_TIPO', Trim(FmLote1.MeLote.Text));
        QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO', Trim(FmLote1.MeLote.Text));
        wFiltros := wFiltros + ' ' + Trim(FmLote1.EdLote.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('COD_LOTE_TIPO', null);
        QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO', null);
      end;
      if Trim(MECor.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('DESC_COR', Copy(Trim(MECor.Text), 1, Length(Trim(MECor.Text))-1));
        QRInformacaoVenda2.SetVariable('DESC_COR', Copy(Trim(MECor.Text), 1, Length(Trim(MECor.Text))-1));
        wFiltros := wFiltros + ' ' + Trim(MECor.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('DESC_COR', null);
        QRInformacaoVenda2.SetVariable('DESC_COR', null);
      end;
      if Trim(MEReferencia.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('DESC_REFERENCIA', MEReferencia.Text);
        QRInformacaoVenda2.SetVariable('DESC_REFERENCIA', MEReferencia.Text);  
        wFiltros := wFiltros + ' ' + Trim(MEReferencia.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('DESC_REFERENCIA', null);
        QRInformacaoVenda2.SetVariable('DESC_REFERENCIA', null);
      end;
      if Trim(METime.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('DESC_TIME', Trim(METime.Text));
        QRInformacaoVenda2.SetVariable('DESC_TIME', Trim(METime.Text));
        wFiltros := wFiltros + ' ' + Trim(METime.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('DESC_TIME', null);
        QRInformacaoVenda2.SetVariable('DESC_TIME', null);
      end;
      if Trim(MEEsporte.Text) <> '' then
      begin
        QRInformacaoVenda.SetVariable('DESC_ESPORTE', Trim(MEEsporte.Text));
        QRInformacaoVenda2.SetVariable('DESC_ESPORTE', Trim(MEEsporte.Text));
        wFiltros := wFiltros + ' ' + Trim(MEEsporte.Text);
      end
      else
      begin
        QRInformacaoVenda.SetVariable('DESC_ESPORTE', null);
        QRInformacaoVenda2.SetVariable('DESC_ESPORTE', null);
      end;
      //QRInformacaoVenda.SetVariable('TRAZ_ESTOQUE', QuotedStr(cbEstoque.Text));
      QRInformacaoVenda.SetVariable('DT_INI', StrToDate(Trim(FmDatas1.MeDtInicial.Text)));
      QRInformacaoVenda2.SetVariable('DT_INI', StrToDate(Trim(FmDatas1.MeDtInicial.Text)));
      QRInformacaoVenda.SetVariable('DT_FIN', StrToDate(Trim(FmDatas1.MeDtFinal.Text)));
      QRInformacaoVenda2.SetVariable('DT_FIN', StrToDate(Trim(FmDatas1.MeDtFinal.Text)));
      QRInformacaoVenda.SetVariable('DOCUMENTO', 'SAIDAS');
      //QRInformacaoVenda.SetVariable('AGRUPA_LOTE', cbAgrupaLote.Text);
      if FInformacaoVendaParam.RadioGroup1.ItemIndex = 0 then
      begin
        QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_INI', Trim(FInformacaoVendaParam.MELoteIni.Text));
        QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_FIN', Trim(FInformacaoVendaParam.MELoteFin.Text));

        // Extrai os lotes da cadeia de lotes informada
        wLotes := TStringList.Create;
        wLoteInicial := StrToInt(Trim(FInformacaoVendaParam.MELoteIni.Text));
        while wLoteInicial <= StrToInt(Trim(FInformacaoVendaParam.MELoteFin.Text)) do
        begin
          wLotes.Add(IntTosTr(wLoteInicial));
          Inc(wLoteInicial);
        end;
        QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_1', 1);
        if wLotes.Count >= 1 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_2', wLotes[0]);
        if wLotes.Count >= 2 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_3', wLotes[1]);
        if wLotes.Count >= 3 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_4', wLotes[2]);
        if wLotes.Count >= 4 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_5', wLotes[3]);
        if wLotes.Count >= 5 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_6', wLotes[4]);
        if wLotes.Count >= 6 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_7', wLotes[5]);
        if wLotes.Count >= 7 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_8', wLotes[6]);
        if wLotes.Count >= 8 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_9', wLotes[7]);
        if wLotes.Count >= 9 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_10', wLotes[8]);
        if wLotes.Count >= 10 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_11', wLotes[9]);
        if wLotes.Count >= 11 then
          QRInformacaoVenda2.SetVariable('COD_LOTE_TIPO_12', wLotes[10]);

        QRInformacaoVenda2.Open;
        if FRInformacaoVenda2 = Nil then
          FRInformacaoVenda2 := TFRInformacaoVenda2.Create(Application);
        FRInformacaoVenda2.QRMemo1.Lines.Add(wFiltros);
        FRInformacaoVenda2.QRLTitulo.Caption := 'INFORMAÇÕES DE PRODUTOS COMPRADOS/VENDIDOS';
        FRInformacaoVenda2.QRLPeriodo.Caption
          := 'PERÍODO DE ' + FmDatas1.MeDtInicial.Text
          + ' ATÉ ' + FmDatas1.MeDtFinal.Text;
        if FInformacaoVendaParam.RGPreview.ItemIndex = 0 then
          FRInformacaoVenda2.QRPrimario.Preview
        else
          FRInformacaoVenda2.QRPrimario.Print;
        FRInformacaoVenda2.Free;
        FRInformacaoVenda2 := nil;
      end
      else
      begin
        QRInformacaoVenda.Open;
        if FRInformacaoVenda = Nil then
          FRInformacaoVenda := TFRInformacaoVenda.Create(Application);
        FRInformacaoVenda.QRMemo1.Lines.Add(wFiltros);
        FRInformacaoVenda.QRLTitulo.Caption := 'INFORMAÇÕES DE PRODUTOS VENDIDOS';
        FRInformacaoVenda.QRLPeriodo.Caption
          := 'PERÍODO DE ' + FmDatas1.MeDtInicial.Text
          + ' ATÉ ' + FmDatas1.MeDtFinal.Text;
        if FInformacaoVendaParam.RGPreview.ItemIndex = 0 then
          FRInformacaoVenda.QRPrimario.Preview
        else
          FRInformacaoVenda.QRPrimario.Print;
        FRInformacaoVenda.Free;
        FRInformacaoVenda := nil;
      end;
    end;
    N7InformaesdeVendas1Click(Self); // Chama novamente a tela de parâmetros
  end;
end;

procedure TFNotaConsumidor.DBEdit7Exit(Sender: TObject);
var wPrazo: String;
begin
  inherited;
  If Trim(DbEdit7.Text) <> '' Then
     DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '2'
  Else
     DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1';
{  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARISTIDES'  Then
   Begin
     if Trim(DbEdit7.Text) = '1' then
       DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1';
     if (Trim(DbEdit7.Text) = '13') or
        (Trim(DbEdit7.Text) = '14') then
       DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '1'; // foi solicitado pela andressa para colocar a vista
     if Trim(DBEdit7.Text) = '22' then
     begin
       DmNotaSaida.QNotaSaidaInd_Condicao_Pagto.Value := '3';
       DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value := 22;
       DBECodOperacaoExit(Self);
     end;
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
   End;  }  // RETIRADO PELO CESAR
end;

procedure TFNotaConsumidor.MECodBarras2ExitCASADOPEIXE;
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

procedure TFNotaConsumidor.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then // 123 = F12 - Junior 10/04/2017. Solicitado por Gustavo (Agroferragens JG).
    BtConsProduto.Click;
{Adicionado para mover o foco para a direita quando pressionar enter. Alex 20/08/2026.}    
  if Key = VK_RETURN then
  begin
    if DBGrid1.SelectedIndex < DBGrid1.Columns.Count - 1 then
      DBGrid1.SelectedIndex := DBGrid1.SelectedIndex + 1;

    Key := 0;
  end;
end;

procedure TFNotaConsumidor.BtnTecnicoClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCOD_TECNICO.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
  DBETecnico.SetFocus;

end;

procedure TFNotaConsumidor.LanamentoCarto1Click(Sender: TObject);
begin
  inherited;
  DMNotaSaida.wLancCartaoIndividual := True;
  if FLancamentoCartao = Nil then
    FLancamentoCartao := TFLancamentoCartao.Create(Application);
  FLancamentoCartao.ShowModal;
end;

procedure TFNotaConsumidor.BtAbreGavetaClick(Sender: TObject);
var F : TextFile;
    wImpressora : String;
begin
  inherited;
  wImpressora := DMOracle.FastSelect('DESC_IMPRESSORA_DANFE_NFCE','TB_USUARIO','COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente) );
  AssignFile(F,'\\'+copy(wImpressora,3,40));
  Rewrite(F);
  Writeln(F,#027+#112+#000+#010+#100''); //abrir gaveta Epson
  CloseFile(F);
end;

procedure TFNotaConsumidor.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 120 Then // 120 = F9 - Junior. Abrir gaveta
    BtAbreGavetaClick(Sender);
end;

procedure TFNotaConsumidor.GeraBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;

    if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);
                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QNotaSaidaCOD_FILIAL.Value,
                                           QNotaSaidaNUM_NOTA.Value,
                                           QNotaSaidaCOD_NOTA_CAB.Value,
                                           QBoletoAPINotaCOD_BANCO.Value,
                                           0,  // SE NOTA, NÃO PRECISA O CONTRATO
                                           TGBNota,   // ESSE O TIPO NOTA
                                           QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                           True, True);  // wEnviaBoletoEmail vem do checkbox da tela FNotaSaida_Confirma

      wBoletoApi.EnviarBoletosApi;
      if not wBoletoApi.GetIndTemRejeicao then
        if (MessageDlg('Deseja imprimir o(s) boleto(s)?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          wBoletoApi.GerarPDF;
        end
    end;
  end;
end;

procedure TFNotaConsumidor.EnviarEmailBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;



    if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);

                    // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QNotaSaidaCOD_FILIAL.Value,
                                           QNotaSaidaNUM_NOTA.Value,
                                           QNotaSaidaCOD_NOTA_CAB.Value,
                                           QBoletoAPINotaCOD_BANCO.Value,
                                           0,  // SE NOTA, NÃO PRECISA O CONTRATO
                                           TGBNota,   // ESSE O TIPO NOTA
                                           QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                           true,false);  // wEnviaBoletoEmail vem do checkbox da tela FNotaSaida_Confirma

      wBoletoApi.EnviaEmailBoletosApi;
    end;
  end;
end;

procedure TFNotaConsumidor.ImprimeBoletoApi;
var
  wBoletoApi: IBoletoApi;
begin

  with DMNotaSaida do
  begin
    QBoletoAPINota.Close;
    QBoletoAPINota.SetVariable('COD_NOTA_CAB', QNotaSaidaCOD_NOTA_CAB.Value);
    QBoletoAPINota.Open;



    if (QBoletoAPINotaIND_API_BOLETO.Value = 'SIM') then
    begin
      QBoletoAPI.Close;
      QBoletoAPI.SetVariable('COD_NOTA', QNotaSaidaCOD_NOTA_CAB.Value);

                   // A FACTORY VAI MONTAR O OBJETO DE ACORDO COM O TIPO PASSADO TTIPOGERABOLETO
      wBoletoApi := TBoletoFactory.RetornaBoletoBanco(QNotaSaidaCOD_FILIAL.Value,
                                           QNotaSaidaNUM_NOTA.Value,
                                           QNotaSaidaCOD_NOTA_CAB.Value,
                                           QBoletoAPINotaCOD_BANCO.Value,
                                           0,  // SE NOTA, NÃO PRECISA O CONTRATO
                                           TGBNota,   // ESSE O TIPO NOTA
                                           QBoletoAPINotaIND_AMBIENTE_API_BOLETO.Value,
                                           false, true);  // wEnviaBoletoEmail vem do checkbox da tela FNotaSaida_Confirma

      wBoletoApi.ImprimirBoletosApi;
    end;
  end;
end;

procedure TFNotaConsumidor.btnEnviaBoletoApiClick(Sender: TObject);
begin
  inherited;
  GeraBoletoApi
end;

procedure TFNotaConsumidor.btnImprimirBoletoApiClick(Sender: TObject);
begin
  inherited;
  ImprimeBoletoAPI
end;

procedure TFNotaConsumidor.btnEnviarBoletoEmailClick(Sender: TObject);
begin
  inherited;
  EnviarEmailBoletoApi
end;

procedure TFNotaConsumidor.PCCabecaclhoChange(Sender: TObject);
begin
  inherited;
  if PCCabecaclho.ActivePage = TSContaReceber then
  begin
    DMNotaSaida.QContaReceber.Close;
    DMNotaSaida.QContaReceber.Open;

    {PARA O BOTÃO DE ENVIO DO BOLETO E REIMPRESSÃO}
    btnEnviaBoletoApi.Enabled := False;
    btnImprimirBoletoApi.Enabled := False;
    btnEnviarBoletoEmail.Enabled := False;
    if DMNotaSaida.QContaReceber.RecordCount > 0 then
    begin
      if (DMNotaSaida.QContaReceberIND_WEB_API.Value = 'S') AND (DMNotaSaida.QContaReceberIND_ENVIADO_BANCO.Value = 'NAO') then
        btnEnviaBoletoApi.Enabled := True;
      if (DMNotaSaida.QContaReceberIND_WEB_API.Value = 'S') AND (DMNotaSaida.QContaReceberIND_ENVIADO_BANCO.Value = 'SIM') then
      begin
        btnImprimirBoletoApi.Enabled := True;
        btnEnviarBoletoEmail.Enabled := True;
      end;
    end;
  end;
end;

procedure TFNotaConsumidor.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMNotaSaida.QNotaSaidaCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
  if (DMParamSistema.CodEmpresa = 'STEIN') or (DMParamSistema.CodEmpresa = 'GRAUBER') then
    DBEdit3Exit(Self);
  DBECodOperacao.Setfocus;
end;

procedure TFNotaConsumidor.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit3.Text);
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' Then
  Begin
    DMNotaSaida.QNotaSaidaCOD_OPERACAO.Value := 46;
    if DMNotaSaida.QNotaSaidaCOD_FILIAL.Value = 2 Then
    Begin
      DMNotaSaida.QItemNF.First;
      While (not DMNotaSaida.QItemNF.Eof) do
      Begin
        DMNotaSaida.QItemNF.Edit;
        DMNotaSaida.QItemNFCOD_TRIBUTACAO.VAlue := 35;
        DMNotaSaida.QItemNF.Post;
        DMNotaSaida.QItemNF.Next;
      end;
    end;
  End;
{Adicionado para a Stein para puxar a série da filial, pois eles emitem nota de produto e o cadastro da filial é sempre o mesmo, mudando apenas a inscrição estadual
por isto foram criados séries diferentes. Alex 25/03/2024
Adicionado CodEmpresa GRauber. Alex 09/04/2026.}
  if (DMParamSistema.CodEmpresa = 'STEIN') or (DMParamSistema.CodEmpresa = 'GRAUBER') then
    DBESerie.Text := DMOracle.FastSelect('COD_SERIE','TB_FILIAL','COD_FILIAL = ' + Trim (DBEdit3.Text) );
end;

procedure TFNotaConsumidor.N8EspelhodaNota1Click(Sender: TObject);
begin
  inherited;
  FNotaSaidaCad.EspelhodaNota1Click(Sender);
end;

end.
