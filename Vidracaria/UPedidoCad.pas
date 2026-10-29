unit UPedidoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, ActiveX, ComObj,
  DBDirceu, variants, UFmHistorico, jpeg, ExtDlgs, ActnList, ShellAPI,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFPedidoCad = class(TFTCadSimples)
    PCPedido: TPageControl;
    TabSheet1: TTabSheet;
    TSItem: TTabSheet;
    Label1: TLabel;
    DBECodPedido: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    BtConsFilial: TBitBtn;
    BtConsCadastro: TBitBtn;
    BtConsOperacao: TBitBtn;
    BtConsVendedor: TBitBtn;
    Label13: TLabel;
    DBEdit19: TDBEdit;
    Label16: TLabel;
    DBEdit20: TDBEdit;
    Label17: TLabel;
    DBEdit21: TDBEdit;
    Label18: TLabel;
    DBEdit22: TDBEdit;
    Label19: TLabel;
    DBEdit23: TDBEdit;
    Label20: TLabel;
    DBEdit24: TDBEdit;
    Label21: TLabel;
    DBEdit25: TDBEdit;
    Label22: TLabel;
    DBEQtdCancelado: TDBEdit;
    Label23: TLabel;
    DBEdit27: TDBEdit;
    Label24: TLabel;
    DBEdit28: TDBEdit;
    BtConsProduto: TBitBtn;
    BtConsTributacao: TBitBtn;
    DBGItemPedido: TDBGrid;
    Label25: TLabel;
    DBEdit32: TDBEdit;
    PedidosAbertos1: TMenuItem;
    Outros1: TMenuItem;
    CancelaQtdePedido1: TMenuItem;
    Produto1: TMenuItem;
    SBEmbarque: TSpeedButton;
    Embarques1: TMenuItem;
    Espelho1: TMenuItem;
    PedidosCancelados1: TMenuItem;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Pedidosnoperiodo1: TMenuItem;
    AcompanhamentoPedidos1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PedidosAbertoscomPreoMdio1: TMenuItem;
    Label27: TLabel;
    DBEdit26: TDBEdit;
    PedidosAbertosporVencimento1: TMenuItem;
    DBRGTipoPagamento: TDBRadioGroup;
    OracleNavigator1: TOracleNavigator;
    PosioPedidosCEstoque1: TMenuItem;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    DBEdit34: TDBEdit;
    Label29: TLabel;
    DBEdit35: TDBEdit;
    BtConsLote: TBitBtn;
    BitBtn1: TBitBtn;
    OramentoviaWord1: TMenuItem;
    SaveDialog1: TSaveDialog;
    PedidoscomNotaFiscal1: TMenuItem;
    DBGrid2: TDBGrid;
    Label32: TLabel;
    DBGrid1: TDBGrid;
    Label31: TLabel;
    DBEdit38: TDBEdit;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    Label33: TLabel;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    DBEdit39: TDBEdit;
    Label37: TLabel;
    DBEdit40: TDBEdit;
    BtConsPrazo: TBitBtn;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit41: TDBEdit;
    SpeedButton1: TSpeedButton;
    LblFormaCompra: TLabel;
    LblAutoriza: TLabel;
    Label35: TLabel;
    DBEdit43: TDBEdit;
    DBDirceu5: TDBDirceu;
    DBDirceu6: TDBDirceu;
    Label77: TLabel;
    Label78: TLabel;
    DBEdit44: TDBEdit;
    Label36: TLabel;
    DBEdit45: TDBEdit;
    Label38: TLabel;
    DBEdit46: TDBEdit;
    Label39: TLabel;
    DBEdit47: TDBEdit;
    Label40: TLabel;
    DBEdit48: TDBEdit;
    PedidosComValor1: TMenuItem;
    PedidosComCusto1: TMenuItem;
    Comisso1: TMenuItem;
    Label26: TLabel;
    DBEdit33: TDBEdit;
    Label41: TLabel;
    DBEdit49: TDBEdit;
    Label42: TLabel;
    DBEdit50: TDBEdit;
    Label43: TLabel;
    DBEdit51: TDBEdit;
    BtConsMensagem: TBitBtn;
    DBDirceu4: TDBDirceu;
    DBDirceu7: TDBDirceu;
    BtConsDepartamento: TBitBtn;
    Label44: TLabel;
    DBEdit52: TDBEdit;
    BtConsBanco: TBitBtn;
    DBDirceu8: TDBDirceu;
    DBDirceu9: TDBDirceu;
    DBDirceu10: TDBDirceu;
    DBDirceu11: TDBDirceu;
    DBDirceu12: TDBDirceu;
    BaixaEstoque1: TMenuItem;
    VoltaBaixaEstoque1: TMenuItem;
    CancelamentoTotaldoPedido1: TMenuItem;
    DBRadioGroup3: TDBRadioGroup;
    Label45: TLabel;
    DBEdit13: TDBEdit;
    BtImpItemPed: TBitBtn;
    PedidosporRepresentante1: TMenuItem;
    Label46: TLabel;
    DBEdit16: TDBEdit;
    DBRGPrecoTabela: TDBRadioGroup;
    AcompanhamentoPedidoPFornecedor1: TMenuItem;
    Label47: TLabel;
    DBEdit17: TDBEdit;
    BtConsCultura: TBitBtn;
    TsMateriais: TTabSheet;
    GBUsuariosQueLiberaram: TGroupBox;
    Label49: TLabel;
    DBEdit36: TDBEdit;
    Label50: TLabel;
    DBEdit42: TDBEdit;
    Label51: TLabel;
    DBEdit53: TDBEdit;
    Label52: TLabel;
    DBEdit54: TDBEdit;
    Label53: TLabel;
    BtConsOrigem: TBitBtn;
    Label54: TLabel;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    SBConsMotivo: TSpeedButton;
    Label55: TLabel;
    MostraoCdigodoEmbarque1: TMenuItem;
    LblSituacao: TLabel;
    PedidosporSupervisor1: TMenuItem;
    DBEdit57: TDBEdit;
    Label34: TLabel;
    DBEdit18: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    Label66: TLabel;
    Label67: TLabel;
    DBComboBox4: TDBComboBox;
    DBComboBox5: TDBComboBox;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    SBIncluiImagem: TSpeedButton;
    Label64: TLabel;
    MECaminhoImagem: TMaskEdit;
    btnProcurar: TBitBtn;
    SBExcluiImagem: TSpeedButton;
    ExportarPeaspOptyWay1: TMenuItem;
    BitBtn2: TBitBtn;
    DBComboBox6: TDBComboBox;
    Label12: TLabel;
    BitBtn3: TBitBtn;
    VoltarExportaoOptyWay1: TMenuItem;
    ImprimeEtiquetasdoPedido1: TMenuItem;
    DBGrid3: TDBGrid;
    SBVisualizar: TSpeedButton;
    N4: TMenuItem;
    EspelhoporProduto1: TMenuItem;
    RelatriodeProduo1: TMenuItem;
    BaixaManualdePedidos1: TMenuItem;
    ImprimeEtiquetaAvulsa1: TMenuItem;
    PedidosFaturadosNoEmbarcados1: TMenuItem;
    AlteraPreoPedido1: TMenuItem;
    PedidosAbertos2: TMenuItem;
    SBAnaliseCredito: TSpeedButton;
    ODImagem: TOpenDialog;
    DBEdit12: TDBEdit;
    Label30: TLabel;
    QuebrasnaProduo1: TMenuItem;
    Label48: TLabel;
    DBEdit37: TDBEdit;
    Label65: TLabel;
    DBEdit65: TDBEdit;
    Marcarpeasexportao1: TMenuItem;
    VincularPeasPedidos1: TMenuItem;
    Label68: TLabel;
    DBEdit66: TDBEdit;
    procedure FormActivate(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure BtConsOperacaoClick(Sender: TObject);
    procedure BtConsVendedorClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtConsProdutoClick(Sender: TObject);
    procedure BtConsLoteClick(Sender: TObject);
    procedure BtConsTributacaoClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure PedidosAbertos1Click(Sender: TObject);
    procedure CancelaQtdePedido1Click(Sender: TObject);
    procedure DBEQtdCanceladoExit(Sender: TObject);
    procedure Produto1Click(Sender: TObject);
    procedure SBEmbarqueClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure Espelho1Click(Sender: TObject);
    procedure PedidosCancelados1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Pedidosnoperiodo1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure AcompanhamentoPedidos1Click(Sender: TObject);
    procedure PedidosAbertoscomPreoMdio1Click(Sender: TObject);
    procedure PedidosAbertosporVencimento1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PosioPedidosCEstoque1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure OramentoviaWord1Click(Sender: TObject);
    function GetOrCreateObject(const ClassName: string): IDispatch;
    procedure DBEdit5Exit(Sender: TObject);
    procedure PedidoscomNotaFiscal1Click(Sender: TObject);
    procedure DBEdit21Change(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure BtConsPrazoClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure BtCopiaClick(Sender: TObject);
    procedure BtConsCulturaClick(Sender: TObject);
    procedure DBRGTipoPagamentoClick(Sender: TObject);
    procedure PedidosComValor1Click(Sender: TObject);
    procedure PedidosComCusto1Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure BtConsDepartamentoClick(Sender: TObject);
    procedure BtConsBancoClick(Sender: TObject);
    procedure BaixaEstoque1Click(Sender: TObject);
    procedure VoltaBaixaEstoque1Click(Sender: TObject);
    procedure CancelamentoTotaldoPedido1Click(Sender: TObject);
    procedure BtImpItemPedClick(Sender: TObject);
    procedure PedidosporRepresentante1Click(Sender: TObject);
    procedure DBEdit16Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AcompanhamentoPedidoPFornecedor1Click(Sender: TObject);
    procedure DBEdit40Change(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure BtConsOrigemClick(Sender: TObject);
    procedure SBConsMotivoClick(Sender: TObject);
    procedure MostraoCdigodoEmbarque1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure PedidosporSupervisor1Click(Sender: TObject);
    procedure DBEdit57Exit(Sender: TObject);
    procedure DBEdit58Exit(Sender: TObject);
    procedure DBEdit59Exit(Sender: TObject);
    procedure SBIncluiImagemClick(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure SBExcluiImagemClick(Sender: TObject);
    procedure ExportarPeaspOptyWay1Click(Sender: TObject);
    procedure DBEdit6Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBEdit58Enter(Sender: TObject);
    procedure VoltarExportaoOptyWay1Click(Sender: TObject);
    procedure ImprimeEtiquetasdoPedido1Click(Sender: TObject);
    procedure SBVisualizarClick(Sender: TObject);
    procedure EspelhoporProduto1Click(Sender: TObject);
    procedure BaixaManualdePedidos1Click(Sender: TObject);
    procedure RelatriodeProduo1Click(Sender: TObject);
    procedure ImprimeEtiquetaAvulsa1Click(Sender: TObject);
    procedure Contar(ms: longint);
    procedure PedidosFaturadosNoEmbarcados1Click(Sender: TObject);
    procedure DBEdit15Exit(Sender: TObject);
    procedure AlteraPreoPedido1Click(Sender: TObject);
    procedure PedidosAbertos2Click(Sender: TObject);
    procedure SBAnaliseCreditoClick(Sender: TObject);
    procedure DBEdit27Exit(Sender: TObject);
    procedure QuebrasnaProduo1Click(Sender: TObject);
    procedure Marcarpeasexportao1Click(Sender: TObject);
    procedure VincularPeasPedidos1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure JumpTo(const aAdress: string);
  end;

var
  FPedidoCad: TFPedidoCad;
  newWord: Variant;
  wAlturaAnterior,wDescontoAnterior: string;

implementation

uses UPedido_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UOperacaoCons, UOperacao_cl, UVendedorCons, UVendedor_cl, UOracle_cl,
  UProdutoCons, UProduto_cl, UTipoLoteCons, UTipoLote_cl, UTributacaoCons,
  UTributacao_cl, UPedidoCons, UPedidoParam, URPedido_Aberto,
  URPedido_Produto, UEmbarqueCad, URPedido_Espelho, USequencia_cl,
  UPedidoCancela, URPedido_Cancelado, UFRPedidoPeriodo,
  URPedidoAcomp, URPedido_Preco_Medio, URPedAberto_Venc, URPedidoEstoque,
  UParamSistema_cl, URPedido_BaseTroca, UBiblioteca, URPedidosComNota,
  URelatorioVenda_cl, UEstoque_cl, UPrazoVencimentoCons,
  UPrazoVencimento_cl, UNotaSaidaCad, UNotaSaida_cl, UTela_cl, UUsuario_cl,
  UCulturaCons, UCultura_cl, URPedidoValor, URPedidoCusto, URPedidoComissao,
  UMensagemCons, UDepartamentoCons, UMensagem_cl, UDepartamento_cl,
  UBancosCons, UBancoAgencia_cl, URPedidoRepresentante, UContaCorrenteCons,
  URPedidosFornecedor, UEstadoCons, UEstado_cl, UMotivoCons, UMotivo_cl,
  URPedidoSupervisor, USenha, UHistorico_cl, UPlanilha_cl, URReciboCaixa,
  UFFuncionarioCons
  , UFuncionario_cl, UExportaOptyWay, Math, UExportar, UPedidoBaixaManual,
  UVidracariaParam, UVidracaria_cl, URProducaoSetor, URPedidoMaterial,
  UPedidoMaterialParam, URPedFaturadoNaoEmbarcado, URPedidoAberto,
  URQuebraProducao, UMarcarPecas, UVinculaPecasPedido, URPedidoOrcamento;

{$R *.DFM}

function A_Set_Darkness(darkness: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_CreatePrn(selection: integer; FileName: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Print_Out(width, height, copies, amount: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text(x, y, ori, font, typee, hor_factor, ver_factor: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Barcode(x, y, ori: integer; typee: char; narrow, width, height: integer; mode: char; numeric: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Prn_Text_TrueType(x, y, FSize: integer; FType: pchar; Fspin, FWeight, FItalic, FUnline, FStrikeOut: integer; id_name, data: pchar; mem_mode: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Get_Graphic(x, y, mem_mode: integer; format: char; filename: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Box(mode, x, y, width, height, top, side: integer): integer; stdcall; external 'WINPPLA.DLL';
function A_Draw_Line(mode, x, y, width, height: integer): integer; stdcall; external 'WINPPLA.DLL';
procedure A_ClosePrn(); stdcall; external 'WINPPLA.DLL';
function A_Load_Graphic(x, y: integer; data: pchar): integer; stdcall; external 'WINPPLA.DLL';
function A_Clear_Memory(): integer; stdcall; external 'WINPPLA.DLL';

function RMaskCGC_CPF(wCgc1: string; Zeros: Integer): string;
var S: string;
  x: integer;
begin

  for x := 1 to length(wCgc1) do
    if wCgc1[x] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'] then
      S := S + wCgc1[x];

  while Length(S) < Zeros do
    S := '0' + S;

  Result := S;
end;

procedure TFPedidoCad.FormActivate(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    QPedido.Open;
    QPedidoItem.Open;
    QSomaPedido.Open;
    QQuantidadePedido.open;
    wDtEmissao_Ant := Date;
  end;
  TsMateriais.TabVisible := False;
  if FPedidoCons <> nil then
    FPedidocons.BtConsCadastro.Enabled := True;

  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERFOZ') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO') then
  begin

    Label36.Visible := True;
    Label38.Visible := True;
    Label39.Visible := True;
    DBEdit17.Visible := False;
    Label47.Visible := False;
    BtConsCultura.Visible := False;
    TsMateriais.TabVisible := True;
    Label15.Caption := 'Dados da Etiqueta (15 caracteres)';
    if PCPedido.ActivePageIndex = 0 then
      DBEdit5.SetFocus;
    Label18.Visible := False;
    DBEdit22.Visible := False;
    DBDirceu3.Visible := False;
    DBDirceu3.Enabled := False;
    DBEdit22.TabStop := False;
    DBEdit15.TabOrder := 12;
    BtConsTributacao.Visible := False;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERFOZ') then
  begin
    DBEdit10.TabOrder := 13;
    DBEdit9.TabOrder := 14;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERFOZ') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ') then
  begin
    DBGrid2.Visible := false;
    label32.Visible := false;
    DBGItemPedido.Top := 220;
    DBGItemPedido.Height := 300;
    DBGItemPedido.Width := 630;
    DbEdit28.TabStop := False;
    DbEdit22.TabStop := False;
    BtConsLote.TabStop := False;
    DBEdit17.Visible := False;
    DBEdit45.Visible := False;
    DBEdit46.Visible := False;
    DBEdit47.Visible := False;

    Label47.Visible := False;
    Label36.Visible := False;
    Label38.Visible := False;
    Label39.Visible := False;

    BtConsCultura.Visible := False;
    Label34.Visible := True;
    DbEdit18.Visible := True;
    SBConsMotivo.Visible := False;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERFOZ') or
    (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED') then
  begin
    DBGrid1.Visible := false;
  end;
  if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO') or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERFOZ')Then
  Begin
    DBEdit47.Visible := True;
    Label39.Visible := True;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'VETRO' Then
  Begin
    BtCopia.Visible := false;
  end;
end;

procedure TFPedidoCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFPedidoCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
  begin
    DMPedido.QPedidoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
    DBEdit5Exit(Self);
  end;
end;

procedure TFPedidoCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOk then
    DMPedido.QpedidoCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
  DBEdit3Exit(Self);
end;

procedure TFPedidoCad.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

procedure TFPedidoCad.SBConfirmarClick(Sender: TObject);
var wOperacao, wOperacao1, wOperacao2, wNota_Fiscal, wNada: string;
  wValor_CC, wValor_Outros: Real;
  wDia, wMes, wAno: Word;
begin
  wDescontoAnterior := '0';
  DmUsuario.Checar_Filial_Usuario(DMPedido.QPedidoCOD_FILIAL.Text, 'VENDA');
  if DMPedido.DSPedidoItem.State in [DsInsert, DsEdit] then
    DMPedido.DSPedidoItem.Dataset.Post;

  if DSPrimario.State in [DsEdit] then //Modificado 24/11/06  Marlon
  begin //Nao estava alterando o Motivo
    DMPedido.DSPedidoItem.Edit;
    DMPedido.DSPedidoItem.DataSet.Post;
  end;

  if DMPedido.QPedidoCod_Vendedor.Text <> '' then
    if (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + DMpedido.QPedidoCod_Vendedor.Text)) <> 'ATIVO' then
      raise Exception.Create('Vendedor Inativo');
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk', DMpedido.QPedidoCod_Cadastro.Value);
  DMCadastro.QCadastro.Open;

  wValor_cc := 0;

  if DBRGTipoPagamento.ItemIndex <> 0 then // forma e pagamento <> de a vista
    DMCadastro.ValidaCredito(DMpedido.QPedidoCod_Cadastro.Value, DMpedido.QSomaPedidoSTOTAL_PEDIDO.Value + wValor_cc);
  if DMPedido.QPedidoNum_Pedido.Value = 0 then
    DMPedido.QPedidoNum_Pedido.Value := DMSequencia.Sequencia(DMPedido.QPedidoCod_Filial.Value, 'PEDIDO');

  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFPedidoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
  begin
    if DMPedido.DsPedidoItem.State in [DsInsert, DsEdit] then
      DMPedido.QPedidoItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value
    else
    begin
      DMPedido.QPedidoItem.Edit;
      DMPedido.QPedidoItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
    end;
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
      DMPedido.QPedidoItemNUM_FABRICANTE.Value := DMProduto.QProdutoConsNum_Fabricante.Value;
    DBEdit59Exit(self);
  end;
end;

procedure TFPedidoCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DMPedido.QPedidoItemCod_Produto.Value);
  if FTipoLoteCons.ShowModal = mrOk then
    if DMPedido.DsPedidoItem.State in [DsInsert, DsEdit] then
      DMPedido.QPedidoItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value
    else
    begin
      DMPedido.QPedidoItem.Edit;
      DMPedido.QPedidoItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
    end;
end;

procedure TFPedidoCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = MrOk then
    if DMPedido.DsPedidoItem.State in [DsInsert, DsEdit] then
      DMPedido.QPedidoItemCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value
    else
    begin
      DMPedido.QPedidoItem.Edit;
      DMPedido.QPedidoItemCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
    end
end;

procedure TFPedidoCad.SBConsultaClick(Sender: TObject);
var
  wPedidoItem: string;
begin
  inherited;
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.pTela_Chamou := 'PEDIDO'; // Para colocar funcionar a seguranca por Filial
  if FPedidoCons.ShowModal = mrOk then
    with DMPedido do
    begin
      QPedido.Close;
      QPedido.SetVariable('PK', QPedidoConsCod_Pedido_Cab.Value);
      QPedido.Open;
      wPedidoItem := DMOracle.BuscaNome('SELECT COD_PEDIDO_ITEM FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB =' + QPedidoConsCOD_PEDIDO_CAB.Text);
      QMateriais.CLose;
      QMateriais.SetVariable('COD_PEDIDO_ITEM', StrToInt(wPedidoItem));
      QMateriais.Open;
    end;
end;

procedure TFPedidoCad.PedidosAbertos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME0Filial.Text), 'VENDA');
      QRPedAberto.Close;
      QRPedAberto.SetVariable('DATA_I', FPedidoParam.ME0DataI.Text);
      QRPedAberto.SetVariable('DATA_F', FPedidoParam.ME0DataF.Text);
      if Trim(FPedidoParam.ME0DtEntregaI.Text) <> '' then
        QRPedAberto.SetVariable('DT_ENTREGA_I', FPedidoParam.ME0DtEntregaI.Text)
      else
        QRPedAberto.SetVariable('DT_ENTREGA_I', NULL);

      if Trim(FPedidoParam.ME0DtEntregaF.Text) <> '' then
        QRPedAberto.SetVariable('DT_ENTREGA_F', FPedidoParam.ME0DtentregaF.Text)
      else
        QRPedAberto.SetVariable('DT_ENTREGA_F', NULL);

      if Trim(FPedidoParam.ME0Filial.Text) = '' then
        QRPedAberto.SetVariable('FILIAL', Null)
      else
        QRPedAberto.SetVariable('FILIAL', FPedidoParam.ME0Filial.Text);
      if Trim(FPedidoParam.ME0Cadastro.Text) = '' then
        QRPedAberto.SetVariable('CADASTRO', Null)
      else
        QRPedAberto.SetVariable('CADASTRO', FPedidoParam.ME0Cadastro.Text);

      if Trim(FPedidoParam.ME0Produto.Text) = '' then
        QRPedAberto.SetVariable('PRODUTO', Null)
      else
        QRPedAberto.SetVariable('PRODUTO', FPedidoParam.ME0Produto.Text);
      if Trim(FPedidoParam.ME0Vendedor.Text) = '' then
        QRPedAberto.SetVariable('VENDEDOR', Null)
      else
        QRPedAberto.SetVariable('VENDEDOR', FPedidoParam.ME0Vendedor.Text);

      if Trim(FPedidoParam.ME0Classe.Text) = '' then
        QRPedAberto.SetVariable('CLASSE', Null)
      else
        QRPedAberto.SetVariable('CLASSE', FPedidoParam.ME0Classe.Text);
      if (Trim(FPedidoParam.ME0SubClasse.Text) = '') or (Trim(FPedidoParam.ME0SubClasse.Text) = '0') then
        QRPedAberto.SetVariable('SUB_CLASSE', Null)
      else
        QRPedAberto.SetVariable('SUB_CLASSE', FPedidoParam.ME0SubClasse.Text);

      if Trim(FPedidoParam.ME0Operacao1.Text) <> '' then
        QRPedAberto.SetVariable('COD_OPERACAO1', Trim(FPedidoParam.ME0Operacao1.Text))
      Else
        QRPedAberto.SetVariable('COD_OPERACAO1', NULL);
      if Trim(FPedidoParam.ME0Regiao.Text) <> '' then
        QRPedAberto.SetVariable('REGIAO', Trim(FPedidoParam.ME0Regiao.Text))
      Else
        QRPedAberto.SetVariable('REGIAO', NULL);
      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0: QRPedAberto.SetVariable('TIPO_PAGTO', Null);
        1: QRPedAberto.SetVariable('TIPO_PAGTO', 'A VISTA');
        2: QRPedAberto.SetVariable('TIPO_PAGTO', 'A PRAZO');
        3: QRPedAberto.SetVariable('TIPO_PAGTO', 'OUTROS');
      end; // Case

      QRPedAberto.SQL[QRPedAberto.SQL.count - 1] := '';
      case FPedidoParam.CB0Ordem.ItemIndex of
        0: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
        1: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_ENTREGA, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
        2: QRPedAberto.SQL.Add('ORDER BY TB_CADASTRO.NOME, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
        3: QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_ITEM.COD_PRODUTO, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
      else
        raise Exception.Create('Nenhuma ordem selecionada!');
      end; // Case

      QRPedAberto.Open;
      if FRPedido_Aberto = nil then
        FRPedido_Aberto := TFRPedido_Aberto.Create(Application);
      FRpedido_Aberto.QRLTitulo.Caption := 'Pedido em Aberto (' + FPedidoParam.ME0DataI.text + ' - ' + FPedidoParam.ME0DataF.Text + ')';  

      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Todos';
        1: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Vista';
        2: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Prazo';
        3: FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Outros';
      end;  

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Aberto.QRPrimario.Preview
      else
        FRPedido_Aberto.QRPrimario.Print;
      QRPedAberto.Close; 
    end;
end;

procedure TFPedidoCad.CancelaQtdePedido1Click(Sender: TObject);
begin
  inherited;
  if FPedidoCancela = nil then
    FPedidoCancela := TFPedidoCancela.Create(Application);
  FPedidoCancela.ShowModal;

end;

procedure TFPedidoCad.DBEQtdCanceladoExit(Sender: TObject);
begin
  inherited;
  DBEQtdCancelado.ReadOnly := True;
  DBEQtdCancelado.ParentColor := True;
end;

procedure TFPedidoCad.Produto1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[1].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME1Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME1DataI.Text) = '') or (Trim(FPedidoParam.ME1DataF.Text) = '') then
        raise Exception.Create('É necessário informar um período');

      QRPedProduto.Close;
      QRPedProduto.SetVariable('DATA_I', FPedidoParam.ME1DataI.Text);
      QRPedProduto.SetVariable('DATA_F', FPedidoParam.ME1DataF.Text);

      if Trim(FPedidoParam.ME1Filial.Text) = '' then
        QRPedProduto.SetVariable('FILIAL', Null)
      else
        QRPedProduto.SetVariable('FILIAL', FPedidoParam.ME1Filial.Text);
      if Trim(FPedidoParam.ME1Cadastro.Text) = '' then
        QRPedProduto.SetVariable('CADASTRO', Null)
      else
        QRPedProduto.SetVariable('CADASTRO', FPedidoParam.ME1Cadastro.Text);
      if Trim(FPedidoParam.ME1Produto.Text) = '' then
        QRPedProduto.SetVariable('PRODUTO', Null)
      else
        QRPedProduto.SetVariable('PRODUTO', FPedidoParam.ME1Produto.Text);
      if Trim(FPedidoParam.ME1Vendedor.Text) = '' then
        QRPedProduto.SetVariable('VENDEDOR', Null)
      else
        QRPedProduto.SetVariable('VENDEDOR', FPedidoParam.ME1Vendedor.Text);
      if Trim(FPedidoParam.Me1Cultura.Text) = '' then
        QRPedProduto.SetVariable('COD_CULTURA', Null)
      else
        QRPedProduto.SetVariable('COD_CULTURA', FPedidoParam.Me1Cultura.Text);
      if Trim(FPedidoParam.ME1Classe.Text) = '' then
        QRPedProduto.SetVariable('CLASSE', Null)
      else
        QRPedProduto.SetVariable('CLASSE', FPedidoParam.ME1Classe.Text);
      if (Trim(FPedidoParam.ME1SubClasse.Text) = '') or (Trim(FPedidoParam.ME1SubClasse.Text) = '0') then
        QRPedProduto.SetVariable('SUB_CLASSE', Null)
      else
        QRPedProduto.SetVariable('SUB_CLASSE', FPedidoParam.ME1SubClasse.Text);
      if Trim(FPedidoParam.ME1Lote.Text) = '' then
        QRPedProduto.SetVariable('LOTE', Null)
      else
        QRPedProduto.SetVariable('LOTE', FPedidoParam.ME1Lote.Text);
      if FPedidoParam.RGSituacao.ItemIndex = 1 then
        QRPedProduto.SetVariable('SITUACAO', '1')
      else
        QRPedProduto.SetVariable('SITUACAO', null);

      case FPedidoParam.Rg1TipoPagto.ItemIndex of
        0: QRPedProduto.SetVariable('TIPO_PAGTO', Null);
        1: QRPedProduto.SetVariable('TIPO_PAGTO', 'A VISTA');
        2: QRPedProduto.SetVariable('TIPO_PAGTO', 'A PRAZO');
        3: QRPedProduto.SetVariable('TIPO_PAGTO', 'OUTROS');
      end; // Case
      QRPedProduto.SQL[QRPedProduto.SQL.count - 1] := '';
      if FPedidoParam.RGOrdem.ItemIndex = 0 then
        QRPedProduto.SQL.add('cod_produto')
      else
        QRPedProduto.SQL.add('Desc_Produto');

      QRPedProduto.Open;
      if FRPedido_Produto = nil then
        FRPedido_Produto := TFRPedido_Produto.Create(Application);
      FRPedido_Produto.QRLTitulo.Caption := 'Pedidos por Produto (' + FPedidoParam.ME1DataI.text + ' - ' + FPedidoParam.ME1DataF.Text + ')';
      FRPedido_Produto.QRLFilial.Caption := 'Filial: ' + FPedidoParam.ED1Filial.Text + ' Classe:' +
        FPedidoParam.ME1Classe.Text + ' ' + FPedidoParam.Ed1Classe.Text +
        ' Lote:' + FPedidoParam.ME1Lote.Text + ' ' + FPedidoParam.Ed1Lote.Text;

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Produto.QRPrimario.Preview
      else
        FRPedido_Produto.QRPrimario.Print;
      QRPedProduto.Close;
    end;
end;

procedure TFPedidoCad.SBEmbarqueClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCad = nil then
    FEmbarqueCad := TFEmbarqueCad.Create(Application);
  FEmbarqueCad.ShowModal;
end;

procedure TFPedidoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBEmbarque.Enabled := DMPedido.QPedido.State = dsBrowse;
  BtConsProduto.Enabled := DSPrimario.State <> dsBrowse;
  BtConsLote.Enabled := DSPrimario.State <> dsBrowse;
  BtConsTributacao.Enabled := DSPrimario.State <> dsBrowse;
  BtConsCadastro.Enabled := DSPrimario.State <> dsBrowse;
  BtConsCultura.Enabled := DSPrimario.State <> dsBrowse;
  BtConsFilial.Enabled := DSPrimario.State <> dsBrowse;
  BtConsOperacao.Enabled := DSPrimario.State <> dsBrowse;
  BtConsVendedor.Enabled := DSPrimario.State <> dsBrowse;
  BtConsPrazo.Enabled := DSPrimario.State <> dsBrowse;
  Bitbtn1.Enabled := DSPrimario.State <> dsBrowse;
  BtConsMensagem.Enabled := DSPrimario.State <> dsBrowse;
  BtConsDepartamento.Enabled := DSPrimario.State <> dsBrowse;
  BtConsBanco.Enabled := DSPrimario.State <> dsBrowse;
  BtConsOrigem.Enabled := DSPrimario.State <> dsBrowse;
  SBConsMotivo.Enabled := DSPrimario.State <> dsBrowse;
end;

procedure TFPedidoCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  DMPedido.ExcluiPedido;
end;

procedure TFPedidoCad.Espelho1Click(Sender: TObject);
var wLinhas: Integer;
begin
  inherited;
 { if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
  Begin
    if DMPedido.QPedidoCOD_PEDIDO_CAB.Value = 0 then
      raise Exception.Create('Selecione um Pedido!');
    if FRPedidoMaterial = nil then
      FRPedidoMaterial := TFRPedidoMaterial.Create(Application);

    DmVidracaria.QRPedidoMaterial.Close;
    DmVidracaria.QRPedidoMaterial.SetVariable('PEDIDOS', DMPedido.QPedidoCOD_PEDIDO_CAB.Text);
    DmVidracaria.QRPedidoMaterial.Open;

    if DmVidracaria.QRPedidoMaterial.RecordCount >= 9 then
      FRPedidoMaterial.QRPrimario.Height := 1056
    else
      FRPedidoMaterial.QRPrimario.Height := 522;
    FRPedidoMaterial.QRPrimario.Preview;

    DmVidracaria.QRPedidoMaterial.Close;
  end  
  else   
  begin
    if DMPedido.QPedidoCOD_PEDIDO_CAB.Value = 0 then
      raise Exception.Create('Selecione um Pedido!');
    if FRPedido_Espelho = nil then
      FRPedido_Espelho := TFRPedido_Espelho.Create(Application);
    DMPedido.QRPedido.Open;
    wLinhas := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCod_Pedido_Cab.Text));
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' then
    Begin
      if wLinhas >= 8 then
        FRPedido_Espelho.QRPrimario.Height := 1056
      else
        FRPedido_Espelho.QRPrimario.Height := 522;
    end
    else
    Begin
      if wLinhas >= 9 then
        FRPedido_Espelho.QRPrimario.Height := 1056
      else
        FRPedido_Espelho.QRPrimario.Height := 1056;
    end;

    FRPedido_Espelho.QRPrimario.Preview;
    DMPedido.QRPedido.Close;
  end;}
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Value = 0 then
    raise Exception.Create('Selecione um Pedido!');
  if FRPedidoOrcamento = nil then
    FRPedidoOrcamento := TFRPedidoOrcamento.Create(Application);
  DMPedido.QRPedido.Open;
  wLinhas := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCod_Pedido_Cab.Text));
  if wLinhas >= 9 then
    FRPedidoOrcamento.QRPrimario.Height := 1056
  else
    FRPedidoOrcamento.QRPrimario.Height := 1056;
  FRPedidoOrcamento.QRPrimario.Preview;
  DMPedido.QRPedido.Close;
end;

procedure TFPedidoCad.PedidosCancelados1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[2].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME2Filial.Text), 'VENDA');
      QRPedido_Cancelado.Close;
      QRPedido_Cancelado.SetVariable('DATA_I', FPedidoParam.ME2DataI.Text);
      QRPedido_Cancelado.SetVariable('DATA_F', FPedidoParam.ME2DataF.Text);

      if Trim(FPedidoParam.ME2Filial.Text) = '' then
        QRPedido_Cancelado.SetVariable('FILIAL', Null)
      else
        QRPedido_Cancelado.SetVariable('FILIAL', FPedidoParam.ME2Filial.Text);
      if Trim(FPedidoParam.ME2Cadastro.Text) = '' then
        QRPedido_Cancelado.SetVariable('CADASTRO', Null)
      else
        QRPedido_Cancelado.SetVariable('CADASTRO', FPedidoParam.ME2Cadastro.Text);
      if Trim(FPedidoParam.ME2Produto.Text) = '' then
        QRPedido_Cancelado.SetVariable('PRODUTO', Null)
      else
        QRPedido_Cancelado.SetVariable('PRODUTO', FPedidoParam.ME2Produto.Text);
      if Trim(FPedidoParam.ME2Vendedor.Text) = '' then
        QRPedido_Cancelado.SetVariable('VENDEDOR', Null)
      else
        QRPedido_Cancelado.SetVariable('VENDEDOR', FPedidoParam.ME2Vendedor.Text);
      QRPedido_Cancelado.Open;
      if FRPedido_Cancelado = nil then
        FRPedido_Cancelado := TFRPedido_Cancelado.Create(Application);
      FRPedido_Cancelado.QRLTitulo.Caption := 'Pedidos Cancelados (' + FPedidoParam.ME2DataI.text + ' - ' + FPedidoParam.ME2DataF.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Cancelado.QRPrimario.Preview
      else
        FRPedido_Cancelado.QRPrimario.Print;
      QRPedido_Cancelado.Close;
    end;

end;

procedure TFPedidoCad.FormKeyPress(Sender: TObject; var Key: Char);
var
  wLargura, wAltura, wProduto, wTipo, wEspecificacao: string;
begin
  inherited;

  if Key = Chr(43) then
  begin
    wlargura := DBEdit59.Text;
    wAltura := DBEdit58.Text;
    wProduto := DBEdit21.Text;
    wTipo := DBComboBox1.Field.AsString;
    wEspecificacao := DBComboBox6.Field.AsString;
    if DMPedido.QPedido.State = dsEdit then
      DMPedido.QPedidoItem.Edit;
    DMPedido.QPedidoItem.Post;
    DMPedido.QPedidoItem.Insert;
    DBEdit21.Text := wProduto;
    DBEdit59.SetFocus;
    DBEdit59.Text := wlargura;
    DBEdit58.Text := wAltura;
    DBComboBox1.Field.AsString := wTipo;
    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' Then
      DBComboBox1.Field.AsString := 'MOVEL';
    DBComboBox6.Field.AsString := wEspecificacao;
    DBEdit59.SelStart;
    DBEdit59.SelLength := 6;
  end;
  {If Key = Chr(43) Then
  Begin
      OracleNavigator1.BtnClick(NbInsert);
      DbEdit21.SetFocus;
  End; }
  if Key = Chr(45) then
  begin
    OracleNavigator1.BtnClick(NbDelete);
    DbEdit21.SetFocus;
  end;

end;

procedure TFPedidoCad.Pedidosnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[3].TabVisible := True;
  FPedidoParam.ME4Data_I.Text := DateToStr(Date-30);
  FPedidoParam.ME4Data_F.Text := DateToStr(Date);
  if FPedidoParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME4Filial.Text), 'VENDA');
    with DMPedido do
    begin
      if (Trim(FPedidoParam.ME4Data_I.Text) = '') or (Trim(FPedidoParam.ME4Data_F.Text) = '') then
        raise Exception.Create('É necessário informar um período')
      else
      Begin
        QRPedidoPeriodo.SetVariable('DATA_I', FPedidoParam.ME4Data_I.Text);
        QRPedidoPeriodo.SetVariable('DATA_F', FPedidoParam.ME4Data_F.Text);
      end;

      if Trim(FPedidoParam.Me4Entrega_F.Text) <> '' then
        QRPedidoPeriodo.SetVariable('DT_ENTREGA_F', FPedidoParam.Me4Entrega_F.Text)
      else
        QRPedidoPeriodo.SetVariable('DT_ENTREGA_F', NULL);

      if Trim(FPedidoParam.Me4Entrega_I.Text) <> '' then
        QRPedidoPeriodo.SetVariable('DT_ENTREGA_I', FPedidoParam.ME4entrega_I.Text)
      else
        QRPedidoPeriodo.SetVariable('DT_ENTREGA_I', NULL);

      if Trim(FPedidoParam.Me4Filial.Text) = '' then
        QRPedidoPeriodo.SetVariable('FILIAL', Null)
      else
        QRPedidoPeriodo.SetVariable('FILIAL', FPedidoParam.ME4Filial.Text);

      if Trim(FPedidoParam.ME4Cadastro.Text) = '' then
        QRPedidoPeriodo.SetVariable('CADASTRO', Null)
      else
        QRPedidoPeriodo.SetVariable('CADASTRO', FPedidoParam.ME4Cadastro.Text);

      if Trim(FPedidoParam.ME4Origem.Text) = '' then
        QRPedidoPeriodo.SetVariable('COD_ORIGEM', Null)
      else
        QRPedidoPeriodo.SetVariable('COD_ORIGEM', FPedidoParam.ME4Origem.Text);

      case FPedidoParam.Rg4TipoPagamento.ItemIndex of
        0: QRPedidoPeriodo.SetVariable('IND_TIPO_PAGAMENTO', Null);
        1: QRPedidoPeriodo.SetVariable('IND_TIPO_PAGAMENTO', 'A VISTA');
        2: QRPedidoPeriodo.SetVariable('IND_TIPO_PAGAMENTO', 'A PRAZO');
        3: QRPedidoPeriodo.SetVariable('IND_TIPO_PAGAMENTO', 'OUTROS');
      end;  
      QRPedidoPeriodo.Open;
      if FRPedido_Periodo = nil then
        FRPedido_Periodo := TFRPedido_Periodo.Create(Application);
      FRPedido_Periodo.QRLEmpresa.Caption := FPedidoParam.ME4Filial.Text + '-' + FPedidoParam.Ed4Filial.Text;
      FRPedido_Periodo.QRLTitulo.Caption := 'Pedidos no periodo (' + FPedidoParam.ME4Data_I.text + ' - ' + FPedidoParam.ME4Data_F.Text + ')' + '  Origem do Produto : ' + FPedidoParam.ME4Origem.text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Periodo.QRPrimario.Preview
      else
        FRPedido_Periodo.QRPrimario.Print;
      QRPedidoPeriodo.Close;
    end;
  end;
end;

procedure TFPedidoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(14);
end;

procedure TFPedidoCad.AcompanhamentoPedidos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[4].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME5Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME5Data_I.Text) = '') or (Trim(FPedidoParam.ME5Data_F.Text) = '') then
        raise Exception.Create('É necessário informar um período');
      QRPedido_Acomp.Close;
      QRPedido_Acomp.SetVariable('DATA_I', FPedidoParam.ME5Data_I.Text);
      QRPedido_Acomp.SetVariable('DATA_F', FPedidoParam.ME5Data_F.Text);
      if Trim(FPedidoParam.ME5Filial.Text) = '' then
        QRPedido_Acomp.SetVariable('FILIAL', Null)
      else
        QRPedido_Acomp.SetVariable('FILIAL', FPedidoParam.ME5Filial.Text);
      if Trim(FPedidoParam.ME5Vendedor.Text) = '' then
        QRPedido_Acomp.SetVariable('COD_VENDEDOR', Null)
      else
        QRPedido_Acomp.SetVariable('COD_VENDEDOR', FPedidoParam.ME5Vendedor.Text);
      if Trim(FPedidoParam.Me5Cadastro.Text) = '' then
        QRPedido_Acomp.SetVariable('COD_CADASTRO', Null)
      else
        QRPedido_Acomp.SetVariable('COD_CADASTRO', FPedidoParam.Me5Cadastro.Text);
      if Trim(FPedidoParam.Fm5Produto.MeProduto.Text) = '' then
        QRPedido_Acomp.SetVariable('COD_PRODUTO', Null)
      else
        QRPedido_Acomp.SetVariable('COD_PRODUTO', FPedidoParam.Fm5Produto.MeProduto.Text);
      case FPedidoParam.Rg5TipoPagamento.ItemIndex of
        0: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', Null);
        1: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', 'A VISTA');
        2: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', 'A PRAZO');
        3: QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO', 'OUTROS');
      end;
      QRPedido_Acomp.Open;
      if FRPedido_Acomp = nil then
        FRPedido_Acomp := TFRPedido_Acomp.Create(Application);
      FRPedido_Acomp.QRLTitulo.Caption := 'Acompanhamento de Pedidos (' + FPedidoParam.ME5Data_I.text + ' - ' + FPedidoParam.ME5Data_F.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Acomp.QRPrimario.Preview
      else
        FRPedido_Acomp.QRPrimario.Print;
      QRPedido_Acomp.Close;
    end;

end;

procedure TFPedidoCad.PedidosAbertoscomPreoMdio1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[5].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME6Filial.Text), 'VENDA');
      QRPedido_Preco_Medio.Close;

      if Trim(FPedidoParam.ME6Filial.Text) = '' then
        QRPedido_Preco_Medio.SetVariable('FILIAL', Null)
      else
        QRPedido_Preco_Medio.SetVariable('FILIAL', FPedidoParam.ME6Filial.Text);

      if Trim(FPedidoParam.ME6Produto.Text) = '' then
        QRPedido_Preco_Medio.SetVariable('PRODUTO', Null)
      else
        QRPedido_Preco_Medio.SetVariable('PRODUTO', FPedidoParam.ME6Produto.Text);

      if Trim(FPedidoParam.ME6Vendedor.Text) = '' then
        QRPedido_Preco_Medio.SetVariable('VENDEDOR', Null)
      else
        QRPedido_Preco_Medio.SetVariable('VENDEDOR', FPedidoParam.ME6Vendedor.Text);

      if Trim(FPedidoParam.ME6DataI.Text) <> '' then
        QRPedido_Preco_Medio.SetVariable('DATA_I', FPedidoParam.ME6DataI.Text)
      else
        raise exception.Create('Data Inicial não pode ficar em Branco !!');
      if Trim(FPedidoParam.ME6DataF.Text) <> '' then
        QRPedido_Preco_Medio.SetVariable('DATA_F', FPedidoParam.ME6DataF.Text)
      else
        raise exception.Create('Data Final não pode ficar em Branco !!');

      case FPedidoParam.Rg6TipoPagamento.ItemIndex of
        0: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', Null);
        1: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', 'A VISTA');
        2: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', 'A PRAZO');
        3: QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO', 'OUTROS');
      end;
      QRPedido_Preco_Medio.Open;
      if FRPedido_Preco_Medio = nil then
        FRPedido_Preco_Medio := TFRPedido_Preco_Medio.Create(Application);
      FRPedido_Preco_Medio.QRLTitulo.Caption := 'Pedidos Abertos com Preço Médio(' + FPedidoParam.ME6DataI.text + ' - ' + FPedidoParam.ME6DataF.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Preco_Medio.QRPrimario.Preview
      else
        FRPedido_Preco_Medio.QRPrimario.Print;
      QRPedido_Preco_Medio.Close;
    end;

end;

procedure TFPedidoCad.PedidosAbertosporVencimento1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[6].TabVisible := True;

  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME7Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME7DataI.Text) = '') or (Trim(FPedidoParam.ME7DataF.Text) = '') then
        raise Exception.Create('É necessário informar um período');

      QRPedAberto_Venc.Close;
      if Trim(FPedidoParam.ME7Filial.Text) = '' then
        QRPedAberto_Venc.SetVariable('FILIAL', Null)
      else
        QRPedAberto_Venc.SetVariable('FILIAL', FPedidoParam.ME7Filial.Text);

      if Trim(FPedidoParam.ME7Cadastro.Text) = '' then
        QRPedAberto_Venc.SetVariable('CADASTRO', Null)
      else
        QRPedAberto_Venc.SetVariable('CADASTRO', FPedidoParam.ME7Cadastro.Text);

      if Trim(FPedidoParam.ME7Produto.Text) = '' then
        QRPedAberto_Venc.SetVariable('PRODUTO', Null)
      else
        QRPedAberto_Venc.SetVariable('PRODUTO', FPedidoParam.ME7Produto.Text);

      QRPedAberto_Venc.SetVariable('DATA_I', FPedidoParam.ME7DataI.Text);
      QRPedAberto_Venc.SetVariable('DATA_F', FPedidoParam.ME7DataF.Text);

      QRPedAberto_Venc.Open;
      if FRPedAberto_Venc = nil then
        FRPedAberto_Venc := TFRPedAberto_Venc.Create(Application);
      FRPedAberto_Venc.QRLTitulo.Caption := 'Pedidos Abertos por Vencimento (' + FPedidoParam.ME7DataI.text + ' - ' + FPedidoParam.ME7DataF.Text + ')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedAberto_Venc.QRPrimario.Preview
      else
        FRPedAberto_Venc.QRPrimario.Print;
      QRPedAberto_Venc.Close;
    end;

end;

procedure TFPedidoCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DMPedido do
  begin
    QPedido.Close;
    QPedidoItem.Close;
    QSomaPedido.Close;
    QUltimosPedidos_Itens.Close;
  end;
  DMEstoque.QEstoqueCons.Close;
  Action := CaFree;
  FPedidoCad := nil;
end;

procedure TFPedidoCad.PosioPedidosCEstoque1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[7].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME8Filial.Text), 'VENDA');
      if (Trim(FPedidoParam.ME8Data_I.Text) = '') or (Trim(FPedidoParam.ME8Data_F.Text) = '') then
        raise Exception.Create('É necessário informar um período');
      QRPedidoEstoque.Close;
      QRPedidoEstoque.SetVariable('DATA_I', FPedidoParam.ME8Data_I.Text);
      QRPedidoEstoque.SetVariable('DATA_F', FPedidoParam.ME8Data_F.Text);
      if Trim(FPedidoParam.ME8Filial.Text) = '' then
      begin
        QRPedidoEstoque.SetVariable('FILIAL', Null);
        DMPedido.pFilial := 0; // para usar no calcfields
      end
      else
      begin
        QRPedidoEstoque.SetVariable('FILIAL', FPedidoParam.ME8Filial.Text);
        DMPedido.pFilial := StrToInt(Trim(FPedidoParam.ME8Filial.Text)); // para usar no calcfields
      end;
      if Trim(FPedidoParam.ME8Cultura.Text) = '' then
        QRPedidoEstoque.SetVariable('CULTURA', Null)
      else
        QRPedidoEstoque.SetVariable('CULTURA', FPedidoParam.ME8Cultura.Text);
      if Trim(FPedidoParam.ME8Cadastro.Text) = '' then
        QRPedidoEstoque.SetVariable('CADASTRO', Null)
      else
        QRPedidoEstoque.SetVariable('CADASTRO', FPedidoParam.ME8Cadastro.Text);
      if Trim(FPedidoParam.ME8Produto.Text) = '' then
        QRPedidoEstoque.SetVariable('PRODUTO', Null)
      else
        QRPedidoEstoque.SetVariable('PRODUTO', FPedidoParam.ME8Produto.Text);
      if Trim(FPedidoParam.ME8Vendedor.Text) = '' then
        QRPedidoEstoque.SetVariable('VENDEDOR', Null)
      else
        QRPedidoEstoque.SetVariable('VENDEDOR', FPedidoParam.ME8Vendedor.Text);
      if Trim(FPedidoParam.ME8Classe.Text) = '' then
        QRPedidoEstoque.SetVariable('CLASSE', Null)
      else
        QRPedidoEstoque.SetVariable('CLASSE', FPedidoParam.ME8Classe.Text);
      if (Trim(FPedidoParam.ME8SubClasse.Text) = '') or (Trim(FPedidoParam.ME8SubClasse.Text) = '0') then
        QRPedidoEstoque.SetVariable('SUB_CLASSE', Null)
      else
        QRPedidoEstoque.SetVariable('SUB_CLASSE', FPedidoParam.ME8SubClasse.Text);
      QRPedidoEstoque.SQL[QRPedidoEstoque.SQL.count - 1] := '';
      if FPedidoParam.Rg8Ordem.ItemIndex = 0 then
        QRPedidoEstoque.Sql.Add('Order By Cod_Produto')
      else
        QRPedidoEstoque.Sql.Add('Order By Desc_Produto');
      QRPedidoEstoque.Open;
      if FRPedidoEstoque = nil then
        FRPedidoEstoque := tFRPedidoEstoque.Create(Application);
      FRPedidoEstoque.QRLTitulo.Caption := 'Pedidos por Produto (' + FPedidoParam.ME8Data_I.text + ' - ' + FPedidoParam.ME8Data_F.Text + ')';
      FRPedidoEstoque.QRLFilial.Caption := 'Filial:' + FPedidoParam.Ed8Filial.Text;
      if Trim(FPedidoParam.ME8Cultura.Text) <> '' then
        FRPedidoEstoque.QRLFilial.Caption := FRPedidoEstoque.QRLFilial.Caption + ' Cultura:' + FPedidoParam.Ed8Cultura.Text;

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoEstoque.QRPrimario.Preview
      else
        FRPedidoEstoque.QRPrimario.Print;
      QRPedidoEstoque.Close;
    end;
end;

procedure TFPedidoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFPedidoCad.OramentoviaWord1Click(Sender: TObject);
var
  table, Document, Range: Variant;
  wTotalPedido, wTotalProdutos, wTotalCusto: real;
  wCont: Integer;
  wCodProduto: string;
begin
  wTotalCusto := 0;
  wTotalPedido := 0;
  wTotalProdutos := 0;
  wCont := 1;
  if Trim(DBECodPedido.Text) = '' then
    raise exception.Create('É necessario que um pedido seja selecionado!');

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DBEdit2.Text);
    QFilial.Open;
  end;
  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK', DBEdit5.Text);
    QCadastro.Open;
  end;

  NewWord := GetOrCreateObject('Word.Application');
  NewWord.Visible := True;
  NewWord.Documents.Add;
  // Obtem documento e paragrafo
  Document := NewWord.Documents.Item(1);
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(1).Range;
  Range.Text := '---  O R Ç A M E N T O  ---';
  //Range.Font := 'Arial';
  Range.Bold := 1;
  Range.Font.Size := 16;
  Document.Paragraphs.Item(1).Alignment := '1';

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(3).Range;
  Range.Text := 'FILIAL  : ' + DMFilial.QFilialDesc_Filial.Text;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(4).Range;
  Range.Text := 'ENDEREÇO: ' + DMFilial.QFilialDESC_ENDERECO.Text + ' ' +
    DMFilial.QFilialDESC_CIDADE.Text + ' TELEFONE : ' + DMFilial.QFilialDESC_TELEFONE.Text; ;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(6).Range;
  Range.Text := 'CADASTRO: ' + DBedit5.Text + '-' + DMCadastro.QCadastroNome.Text;
  Document.Paragraphs.Item(6).Alignment := '0';

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(7).Range;
  Range.Text := 'ENDEREÇO: ' + DMCadastro.QCadastroDESC_ENDERECO.Value;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(8).Range;
  Range.Text := 'CIDADE  : ' + Trim(DMCadastro.QCadastroDESC_CIDADE.Value) + '-' + 'UF: ' +
    Trim(DMCadastro.QCadastroCOD_ESTADO.Value) + '   CEP : ' +
    Trim(DMCadastro.QCadastroDESC_CEP.Value) +
    '    TELEFONE: ' + DMCadastro.QCadastroDESC_TELEFONE.Value;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(10).Range;
  Range.Text := 'VENDEDOR: ' + DBEdit4.Text + '-' + DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR', 'COD_VENDEDOR = ' + FloatToStr(DMPedido.QPedidoCod_Vendedor.Value));

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(12).Range;
  Range.Text := 'Nº. PEDIDO: ' + DBEdit6.Text + '             DATA EMISSÃO: ' + DBEdit8.Text +
    '          VENCIMENTO: ' + DBEdit26.Text;
  Range.Bold := 1;
  Range.Font.Size := 10;

  Document.Paragraphs.Add;
  Range.Bold := 0;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(16).Range;
  Range.Text := 'OBSERVAÇÃO : ' + DMPedido.QPedidoDESC_OBSERVACAO.Value;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(17).Range;
  Range.Text := DMPedido.QPedidoDESC_COMPLEMENTO_OBS.Value;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(18).Range;
  Range.Text := DMPedido.QPedidoDESC_COMPLEMENTO_OBS2.Value;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(22).Range;
  Range.Text := DMFilial.QFilialDESC_CIDADE.Value + ', ' + Copy(DateToStr(Date), 1, 2) + ' de ' +
    Bib.NomeMes(StrToInt(Copy(DateToStr(Date), 4, 2))) + ' ' + Copy(DateToStr(Date), 7, 4);
  Document.Paragraphs.Item(22).Alignment := '1';

  Range := Document.Paragraphs.Item(14).Range;
  table := Document.Tables.Add(Range, 1, 6); // novoDoc.Tables.Add(Selection.Range, 3, 5)
  table.Cell(1, 1).Width := '0.90';
  table.Cell(1, 2).Width := '1.61';
  table.Cell(1, 3).Width := '1.39';
  table.Cell(1, 4).Width := '8.31';
  table.Cell(1, 5).Width := '1.71';
//  table.Cell(1,6).Width:= '1.51';
  table.Cell(1, 6).Width := '1.89';
  table.Cell(1, 1).Range.Text := 'Item';
  table.Cell(1, 2).Range.Text := 'Código';
  table.Cell(1, 3).Range.Text := 'Quant.';
  table.Cell(1, 4).Range.Text := 'Descrição Produto/Serviço';
  table.Cell(1, 5).Range.Text := 'Unitário';
//  table.Cell(1,6).Range.Text:='% Desc.    ';
  table.Cell(1, 6).Range.Text := 'Total';
  //table.Font.Bold = True
  table.Rows.Add;
  DMPedido.QPedidoItem.First;
  while not DMPedido.QPedidoItem.eof do
  begin
    with DMPedido do
    begin
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARZ' then
      begin
        table.Cell(QPedidoItem.RecNo + 1, 1).Range.Text := Bib.NumToTexto(wCont, 0, 3);
      end;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
        table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := QPedidoItemNUM_FABRICANTE.Value
      else
        table.Cell(QPedidoItem.RecNo + 1, 2).Range.Text := Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value, 0, 10);
      table.Cell(QPedidoItem.RecNo + 1, 3).Range.Text := Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value, 0, 6);
      table.Cell(QPedidoItem.RecNo + 1, 4).Range.Text := Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo + 1, 5).Range.Text := Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100), 2, 8);
//      if QPedidoItemPERC_DESCONTO.Value > 0 then
//         table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
      table.Cell(QPedidoItem.RecNo + 1, 6).Range.Text := Bib.NumToTexto(QPedidoItemValor_total.Value, 2, 10);
      wTotalProdutos := wTotalProdutos + QPedidoItemValor_total.Value;
      if QPedidoItemPERC_DESCONTO.Value > 0 then
        wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
      else
        wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
      wCont := wCont + 1;
      QPedidoItem.Next;
    end;
    table.Rows.Add;
  end;

  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo + 3, 4).Range.Text :=
    'TOTAL DO(S) PRODUTO(S) .........: ';

  table.Cell(DMPedido.QPedidoItem.RecNo + 3, 6).Range.Text :=
    Bib.NumToTexto(wTotalProdutos, 2, 10);

  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo + 4, 4).Range.Text :=
    'DESCONTO ...............................: ';

  table.Cell(DMPedido.QPedidoItem.RecNo + 4, 6).Range.Text :=
    Bib.NumToTexto(DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);

  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo + 5, 4).Range.Text :=
    'TOTAL DO PEDIDO ..............................: ';

  table.Cell(DMPedido.QPedidoItem.RecNo + 5, 6).Range.Text :=
    Bib.NumToTexto(wTotalPedido - DMPedido.QPedidoVAL_DESCONTO.Value, 2, 10);

  Range.Bold := 0;
  Range.Font.Size := 10;

  DMCadastro.QCadastro.Close;
  DMFilial.QFilial.Close;

  //-----------------lista de produtos em estoque
  DMPedido.QPedidoItem.First;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Range.Text := 'Relação Produtos Em Estoque';
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Range.Text := '------------------------------------';
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Range.Text := 'Código      Produto                                        Custo         Quantidade';
  Document.Paragraphs.Add;
  with DMPedido do
  begin
    while not DMPedido.QPedidoItem.Eof do
    begin
      QPedidoEstoque.Close;
      QPedidoEstoque.SetVariable('COD_PRODUTO', QPedidoItemCOD_PRODUTO.Value);
      QPedidoEstoque.Open;
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
        wCodProduto := QPedidoItemNUM_FABRICANTE.Text
      else
        wCodProduto := QPedidoItemCOD_PRODUTO.Text;

      Range.Text := Bib.FormataTexto(wCodProduto, 14) + ' |  ' + Bib.FormataTexto(Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + FloatToStr(QPedidoItemCod_Produto.Value))), 30)
        + ' |  ' + Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueVL_ULTIMO_CUSTO.Value, 2, 8), 10) + ' |  ' + Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueQT_QUANTIDADE.Value, 0, 10), 10);
      QPedidoItem.Next;
    end;
  end;
end;

function TFPedidoCad.GetOrCreateObject(const ClassName: string): IDispatch;
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

procedure TFPedidoCad.DBEdit5Exit(Sender: TObject);
var wPedido, wCgc, wCgc1: string;
  I: Integer;
begin
  inherited;
  if Trim(DMPedido.QPedidoCod_Cadastro.Text) <> '' then
  begin
    if (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') then
    begin
      LblFormaCompra.Caption := DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
      LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc ' + DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
      LblAutoriza.Caption := 'Autorizado:' + DMOracle.BuscaNome('SELECT NOME_CONTATO FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
      LblAutoriza.Caption := LblAutoriza.Caption + '-' + DMOracle.BuscaNome('SELECT NOME_CONTATO2 FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
      LblAutoriza.Caption := LblAutoriza.Caption + ' Oper:' + DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
    end;
    DMPedido.QPedidoCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') then
    begin
      if (DMPedido.QPedidoCod_Departamento.Value = 12) then
        if DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO', 'COD_CADASTRO = ' + DMpedido.QPedidoCod_Cadastro.Text) = 'PR' then
          DMPedido.QPedidoCod_Mensagem.Value := 3
        else
          DMPedido.QPedidoCod_Mensagem.Value := 8;
      if DMPedido.QPedidoCOD_FILIAL.Value = 9 then
        DMPedido.QPedidoCod_Mensagem.Value := 49;
    end;
  end
  else
  begin
    LblAutoriza.Caption := '';
    LblFormaCompra.Caption := '';
  end;
  if (((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') OR (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ')) AND (DMPedido.QPedidoCOD_CADASTRO.Text <> '')
       and (DMPedido.QPedido.State in [DsEdit, DsInsert])) then
  Begin
    with DMPedido do
    Begin
      DMPedido.QAnaliseCredito.Close;
      DMPedido.QAnaliseCredito.SetVariable('CADASTRO',DMPedido.QPedidoCOD_CADASTRO.Text);
      DMPedido.QAnaliseCredito.Open;
      DMPedido.QAnaliseCredito1.Close;
      DMPedido.QAnaliseCredito1.SetVariable('CADASTRO',DMPedido.QPedidoCOD_CADASTRO.Text);
      DMPedido.QAnaliseCredito1.Open;

      if ((QAnaliseCreditoVAL_TITULO.Value + QAnaliseCredito1VAL_CHEQUE.Value + QAnaliseCreditoVAL_PEDIDO.Value  >
          QAnaliseCreditoVAL_LIMITE.Value + QAnaliseCredito1VAL_CREDITO.Value) or
          (DMPedido.QAnaliseCreditoVAL_LIMITE.Value = 0)) then
      Begin
        DBEdit5.SetFocus;
        Raise Exception.Create('Limite Insuficiente para novos Pedidos!'+#13+
        'Contas a Receber R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_TITULO.Value)+#13+
        'Cheques                R$'+ FormatFloat('#,##0.00',QAnaliseCredito1VAL_CHEQUE.Value)+#13+
        'Pedidos Abertos   R$'+ FormatFloat('#,##0.00',(QAnaliseCreditoval_pedido.Value + QAnaliseCreditoVAL_ACRESCIMO.Value))+#13+
        'Créditos                 R$'+ FormatFloat('#,##0.00',QAnaliseCredito1VAL_CREDITO.Value)+#13+
        'Limite                    R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_LIMITE.Value)+#13+
        'Saldo                    R$'+FormatFloat('#,##0.00',(QAnaliseCreditoVAL_LIMITE.Value+QAnaliseCredito1VAL_CREDITO.Value)-
                        (QAnaliseCreditoVAL_TITULO.Value+QAnaliseCredito1VAL_CHEQUE.Value+QAnaliseCreditoval_pedido.Value+ QAnaliseCreditoVAL_ACRESCIMO.Value)));
      end
      else
        ShowMessage('Contas a Receber R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_TITULO.Value)+#13+
        'Cheques                R$'+ FormatFloat('#,##0.00',QAnaliseCredito1VAL_CHEQUE.Value)+#13+
        'Pedidos Abertos   R$'+ FormatFloat('#,##0.00',(QAnaliseCreditoval_pedido.Value + QAnaliseCreditoVAL_ACRESCIMO.Value))+#13+
        'Créditos                R$'+FormatFloat('#,##0.00',QanaliseCredito1VAL_CREDITO.Value)+#13+
        'Limite                    R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_LIMITE.Value)+#13+
        'Saldo                    R$'+FormatFloat('#,##0.00',(QAnaliseCreditoVAL_LIMITE.Value+QAnaliseCredito1VAL_CREDITO.Value)-
                        (QAnaliseCreditoVAL_TITULO.Value+QAnaliseCredito1VAL_CHEQUE.Value+QAnaliseCreditoval_pedido.Value+ QAnaliseCreditoVAL_ACRESCIMO.Value)));
    end;
  end;
end;

procedure TFPedidoCad.PedidoscomNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[8].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FPedidoParam.ME34Filial.Text), 'VENDA');
      QRPedidoComNota.Close;
      if Trim(FPedidoParam.ME34Filial.Text) = '' then
        QRPedidoComNota.SetVariable('COD_FILIAL', Null)
      else
        QRPedidoComNota.SetVariable('COD_FILIAL', trim(FPedidoParam.ME34Filial.Text));

      if Trim(FPedidoParam.ME34Cadastro.Text) = '' then
        QRPedidoComNota.SetVariable('COD_CADASTRO', Null)
      else
        QRPedidoComNota.SetVariable('COD_CADASTRO', trim(FPedidoParam.ME34Cadastro.Text));

      if Trim(FPedidoParam.ME34Vendedor.Text) = '' then
        QRPedidoComNota.SetVariable('COD_VENDEDOR', Null)
      else
        QRPedidoComNota.SetVariable('COD_VENDEDOR', trim(FPedidoParam.ME34Vendedor.Text));

      if Trim(FPedidoParam.ME34DT_Emissao_I.Text) <> '' then
        QRPedidoComNota.SetVariable('DT_EMISSAO_I', trim(FPedidoParam.ME34DT_Emissao_I.Text));

      if Trim(FPedidoParam.ME34DT_Emissao_F.Text) <> '' then
        QRPedidoComNota.SetVariable('DT_EMISSAO_F', trim(FPedidoParam.ME34DT_Emissao_F.Text));

      if Trim(FPedidoParam.ME34Motivo.Text) = '' then
        QRPedidoComNota.SetVariable('MOTIVO', Null)
      else
        QRPedidoComNota.SetVariable('MOTIVO', Trim(FPedidoParam.ME34Motivo.Text));

      if Trim(FPedidoParam.ME34Operacao1.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO1', Trim(FPedidoParam.ME34Operacao1.Text));
      if Trim(FPedidoParam.ME34Operacao2.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO2', Trim(FPedidoParam.ME34Operacao2.Text));
      if Trim(FPedidoParam.ME34Operacao3.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO3', Trim(FPedidoParam.ME34Operacao3.Text));
      if Trim(FPedidoParam.ME34Operacao4.Text) <> '' then
        QRPedidoComNota.SetVariable('COD_OPERACAO4', Trim(FPedidoParam.ME34Operacao4.Text));

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
      begin
        QRPedidoComNota.SQL.Add('ORDER BY DESC_MOTIVO, COD_PEDIDO_CAB');
      end;

      QRPedidoComNota.Open;
      if FRPedidoComNota = nil then
        FRPedidoComNota := TFRPedidoComNota.Create(Application);

      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
      begin
        FRPedidoComNota.QRGroup1.Enabled := true;
        QRPedidoComNota.SQL[QRPedidoComNota.SQL.Count - 1] := '';
      end;
      FRPedidoComNota.QRLFilial.Caption := FPedidoParam.ME34Filial.Text + ' ' + FPedidoParam.Ed34Filial.Text;
      FRPedidoComNota.QRLCliente.Caption := FPedidoParam.ME34Cadastro.Text + ' ' + FPedidoParam.Ed34Cadastro.Text;
      FRPedidoComNota.QRLVendedor.Caption := FPedidoParam.ME34Vendedor.Text + ' ' + FPedidoParam.Ed34Vendedor.Text;
      FRPedidoComNota.QRLMotivo.Caption := 'Motivo: ' + FPedidoParam.Ed34Motivo.Text + '  Operações: '
        + FPedidoParam.Me34Operacao1.Text + ', ' + FPedidoParam.Me34Operacao2.Text + ', '
        + FPedidoParam.Me34Operacao3.Text + ', ' + FPedidoParam.Me34Operacao4.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoComNota.QRPrimario.Preview
      else
        FRPedidoComNota.QRPrimario.Print;
      QRPedidoComNota.Close;
    end;
end;

procedure TFPedidoCad.DBEdit21Change(Sender: TObject);
begin
  inherited;
  if (DMParamSistema.QParamSistemaCod_empresa.Value <> 'TEMPERMED') and
    (DMParamSistema.QParamSistemaCod_empresa.Value <> 'VETRO') and
    (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'TEMPERFOZ') AND
    (DMParamSistema.QParamSistemaCod_empresa.Value <> 'MOINHO') then
  begin
    if (DbEdit21.Text <> '') and (DMPedido.QpedidoCod_Cadastro.Text <> '') then
    begin
      DMPedido.QUltimosPedidos_Itens.Close;
      DMPedido.QUltimosPedidos_Itens.SetVariable('Cadastro', DMPedido.QpedidoCod_Cadastro.Value);
      DMPedido.QUltimosPedidos_Itens.SetVariable('Produto', DBEdit21.Text);
      DMPedido.QUltimosPedidos_Itens.Open;
    end;
    if (DbEdit21.Text <> '') then
    begin
      DMEstoque.QEstoqueCons.Close;
      DMEstoque.QEstoqueCons.SetVariable('Filial', Null);
      DMEstoque.QEstoqueCons.SetVariable('Produto', Null);
      DMEstoque.QEstoqueCons.SetVariable('Tipo_Lote', Null);
      DMEstoque.QEstoqueCons.SetVariable('Cod_Produto', DbEdit21.Text);
      DMEstoque.QEstoqueCons.Open;
    end;
  end;
end;

procedure TFPedidoCad.SBCancelarClick(Sender: TObject);
begin
  DMPedido.QPedidoItem.Cancel;
  inherited;

end;

procedure TFPedidoCad.BtConsPrazoClick(Sender: TObject);
begin
  inherited;
  if FPrazoVencimentoCons = nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  if FPrazoVencimentoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Prazo_Vencimento.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;

end;

procedure TFPedidoCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  if DMpedido.QPedidoCod_Operacao.Text <> '' then
  begin
    DMOperacao.QOperacao.Close;
    DMOperacao.QOperacao.SetVariable('Pk',DMPedido.QPedidoCod_Operacao.Value);
    DMOperacao.QOperacao.Open;
    If DMOperacao.QOperacao.Eof Then
      Raise Exception.Create('Operação Não Cadastrada');
    if DMOperacao.QOperacaoIND_LIBERADO.Value <> 'S' then // cadastro de operacao esta sendo aberto no on validate da query
    begin
     DbEdit3.SetFocus;
     raise Exception.Create('Operação Não Liberada Para Uso');
    end;

    if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') then
    begin
      if DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'V' then
        DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A VISTA';
      if DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'P' then
        DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
      if DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'O' then
        DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'OUTROS';
    end;
    DMPedido.QPedidoCOD_MENSAGEM.Text := DMOperacao.QOperacaoCod_Mensagem.Text;
  end;
end;

procedure TFPedidoCad.SpeedButton1Click(Sender: TObject);
var wRetorno, wNotaCab: string;
begin
  inherited;
  wRetorno := DMOracle.BuscaNome('SELECT COD_NOTA_ITEM FROM TB_BAIXA_PEDIDO', 'COD_PEDIDO_ITEM = ' + DMPedido.QPedidoItemCod_Pedido_Item.Text);
  if wRetorno <> '' then
  begin
    wNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_ITEM', 'COD_NOTA_ITEM = ' + wRetorno);
    if FNotaSaidaCad = nil then
      FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
    DMNotaSaida.QNotaSaida.Close;
    DMNotaSaida.QNotaSaida.SetVariable('PK', wNotaCab);
    DMTela.VerificaTela('VENDA', FNotaSaidaCad.Caption, FNotaSaidaCad.Name);
    FNotaSaidaCad.ShowModal;
  end;
end;

procedure TFPedidoCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if DMPedido.DSPedidoItem.State = DsInsert then
    DBEdit21.SetFocus;
end;

procedure TFPedidoCad.BtCopiaClick(Sender: TObject);
var wVlCampo: array[0..350, 0..300] of string;
  wCont: Integer;
  wRegistro, i: Integer;
begin
  with DMPedido do
  begin
    wRegistro := -1;
    DSPedidoItem.DataSet.first;
    while not (DSPedidoItem.DataSet.eof) do
    begin
      wRegistro := wRegistro + 1;
      for wCont := 0 to DSPedidoItem.DataSet.FieldCount - 1 do
      begin
        if DSPedidoItem.Dataset.Fields[wCont].Text = '0,00%' then
          wVlCampo[wCont, wRegistro] := DSPedidoItem.Dataset.Fields[wCont].Text;
        wVlCampo[wCont, wRegistro] := Bib.LimpaString(DSPedidoItem.Dataset.Fields[wCont].Text, '%');
      end;
      DSPedidoItem.DataSet.next;
    end;

    inherited;

    for i := 0 to wRegistro do
    begin
      DSPedidoItem.DataSet.Insert;
      for wCont := 0 to DSPedidoItem.DataSet.FieldCount - 1 do
        if (DSPedidoItem.DataSet.Fields[wCont].Text = '') or (DSPedidoItem.DataSet.Fields[wCont].Text = '0')
          or (DSPedidoItem.DataSet.Fields[wCont].Text = '0,00') or (DSPedidoItem.DataSet.Fields[wCont].Text = '0,00%') then
          DSPedidoItem.DataSet.Fields[wCont].Text := wVlCampo[wCont, i];
      DSPedidoItem.DataSet.Post;
    end;
  end;
end;

procedure TFPedidoCad.BtConsCulturaClick(Sender: TObject);
begin
  inherited;
  if FCulturaCons = nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  if FCulturaCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;
end;

procedure TFPedidoCad.DBRGTipoPagamentoClick(Sender: TObject);
begin
  inherited;
  DBEdit5.SetFocus;
end;

procedure TFPedidoCad.PedidosComValor1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[9].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoValor.Close;
      if Trim(FPedidoParam.Me9Filial.Text) <> '' then
        QRPedidoValor.SetVariable('FILIAL', Trim(FPedidoParam.Me9Filial.Text))
      else
        QRPedidoValor.SetVariable('FILIAL', null);
      if Trim(FPedidoParam.Me9Cadastro.Text) = '' then
        QRPedidoValor.SetVariable('CADASTRO', Null)
      else
        QRPedidoValor.SetVariable('CADASTRO', Trim(FPedidoParam.Me9Cadastro.Text));
      if (FPedidoParam.Me9DtInicial.Text = '') or (FPedidoParam.Me9DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidoValor.SetVariable('DT_INICIAL', trim(FPedidoParam.ME9DtInicial.Text));
      QRPedidoValor.SetVariable('DT_FINAL', trim(FPedidoParam.ME9DtFinal.Text));
      case FPedidoParam.Rg9Situacao.ItemIndex of
        0: QRPedidoValor.SetVariable('IND_BAIXADO', Null);
        1: QRPedidoValor.SetVariable('IND_BAIXADO', 'A');
        2: QRPedidoValor.SetVariable('IND_BAIXADO', 'B');
      end;

      QRPedidoValor.Open;
      if FrPedidoValor = nil then
        FrPedidoValor := TFrPedidoValor.Create(Application);
      FRPedidoValor.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME9DtInicial.Text + ' até ' + FPedidoParam.ME9DtFinal.Text;
      FRPedidoValor.QRLFilial.Caption := 'Filial:' + FPedidoParam.ME9Filial.Text + '' + FPedidoParam.Ed9Filial.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoValor.QRPrimario.Preview
      else
        FrPedidoValor.QRPrimario.Print;
      QRPedidoValor.Close;
    end;

end;

procedure TFPedidoCad.PedidosComCusto1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[10].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoCusto.Close;
      if Trim(FPedidoParam.Me10Filial.Text) <> '' then
        QRPedidoCusto.SetVariable('FILIAL', Trim(FPedidoParam.Me10Filial.Text))
      else
        QRPedidoCusto.SetVariable('FILIAL', null);

      if (FPedidoParam.Me10Dt_Inicial.Text = '') or (FPedidoParam.Me10Dt_Final.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidoCusto.SetVariable('DT_INICIAL', trim(FPedidoParam.ME10Dt_Inicial.Text));
      QRPedidoCusto.SetVariable('DT_FINAL', trim(FPedidoParam.ME10Dt_Final.Text));

      QRPedidoCusto.Open;
      if FrPedidoCusto = nil then
        FrPedidoCusto := TFrPedidoCusto.Create(Application);
      FRPedidoCusto.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME10Dt_Inicial.Text + ' até ' + FPedidoParam.ME10Dt_Final.Text;
      FRPedidoCusto.QRLFilial.Caption := 'Filial:' + FPedidoParam.ME10Filial.Text + '' + FPedidoParam.Ed10Filial.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoCusto.QRPrimario.Preview
      else
        FrPedidoCusto.QRPrimario.Print;
      QRPedidoCusto.Close;
    end;
end;

procedure TFPedidoCad.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[11].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRComissaoPed.Close;
      if Trim(FPedidoParam.ME11Data_I.Text) = '' then
        raise Exception.Create('Data inicial deve ser Informada');
      if Trim(FPedidoParam.ME11Data_F.Text) = '' then
        FPedidoParam.ME11Data_F.Text := DateToStr(Date);
      QRComissaoPed.SetVariable('DATA_I', FPedidoParam.ME11Data_I.Text);
      QRComissaoPed.SetVariable('DATA_F', FPedidoParam.ME11Data_F.Text);
      if Trim(FPedidoParam.ME11Filial.Text) = '' then
        QRComissaoPed.SetVariable('FILIAL', Null)
      else
        QRComissaoPed.SetVariable('FILIAL', FPedidoParam.ME11Filial.Text);
      if Trim(FPedidoParam.ME11Vendedor.Text) = '' then
        QRComissaoPed.SetVariable('VENDEDOR', Null)
      else
        QRComissaoPed.SetVariable('VENDEDOR', FPedidoParam.ME11Vendedor.Text);
      if FPedidoParam.RG11TipoPagamento.ItemIndex = 0 then
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', 'A VISTA')
      else if FPedidoParam.RG11TipoPagamento.ItemIndex = 1 then
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', 'A PRAZO')
      else if FPedidoParam.RG11TipoPagamento.ItemIndex = 2 then
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', 'OUTROS')
      else
        QRComissaoPed.SetVariable('IND_TIPO_PAGTO', NULL);
      QRComissaoPed.Open;
      if FRPedidoComissao = nil then
        FRPedidoComissao := TFRPedidoComissao.Create(Application);
      if FPedidoParam.RG11TipoRelatorio.ItemIndex = 0 then
        FRPedidoComissao.pTipo := 'ANALITICO'
      else
        FRPedidoComissao.pTipo := 'SINTETICO';
      FRPedidoComissao.QRLTitulo.Caption := 'Comissão de Vendedores de ' + FPedidoParam.ME11Data_I.Text + ' Ate ' + FPedidoParam.ME11Data_F.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoComissao.QRPrimario.Preview
      else
        FRPedidoComissao.QRPrimario.Print;
      QRComissaoPed.Close;
    end;
end;

procedure TFPedidoCad.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;

end;

procedure TFPedidoCad.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFPedidoCad.BtConsBancoClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.showModal = mrOk then
  begin
    DMPedido.QPedidoCod_Banco_Agencia.Value := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value;
    DMPedido.QPedidoCod_Conta_Corrente.Value := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  end;
end;

procedure TFPedidoCad.BaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    if QPedidoInd_Estoque.Value = 'SIM' then
      raise Exception.Create('Este Pedido Já Foi Atualizado Estoque');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        while not QPedidoItem.Eof do
        begin
          DmEstoque.Atualiza_Estoque(QPedidoCod_Operacao.Value, QPedidoCod_Filial.Value, QPedidoItemCod_Produto.Value, 1,
            (QPedidoItemQt_Pedido.Value * -1), 0, Date, Date);
          QPedidoItem.Next;
        end;
        QPedido.Edit;
        QPedidoInd_Estoque.Value := 'SIM';
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        raise;
      end;
    end
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  end;
end;

procedure TFPedidoCad.VoltaBaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  with DMPedido do
  begin
    if QPedidoInd_Estoque.Value <> 'SIM' then
      raise Exception.Create('Este Pedido Não Foi Atualizado Estoque');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      try
        DMOracle.DBCemapa.StartTransaction;
        while not QPedidoItem.Eof do
        begin
          DmEstoque.Atualiza_Estoque(QPedidoCod_Operacao.Value, QPedidoCod_Filial.Value, QPedidoItemCod_Produto.Value, 1,
            (QPedidoItemQt_Pedido.Value), 0, Date, Date);
          QPedidoItem.Next;
        end;
        QPedido.Edit;
        QPedidoInd_Estoque.Value := 'NAO';
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        raise;
      end;
    end
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  end;
end;

procedure TFPedidoCad.CancelamentoTotaldoPedido1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja cancelar o pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    with DMPedido do
    begin
      if QPedidoInd_Situacao.Value = '2' then
        raise Exception.Create('Este Pedido Já Foi Cancelado');
      QPedidoItem.First;
      if QPedidoItem.recordCount > 0 then
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QPedido_Cancelado.Open;
          QPedido.Edit;
          while not QPedidoItem.Eof do
          begin
            QPedidoItem.Edit;
            QPedidoItemQt_Cancelado.Value := QPedidoItemQt_Pedido.Value - QPedidoItemQt_Atendido.Value;
            QPedidoItem.Post;
            QPedido_Cancelado.Insert;
            QPedido_CanceladoCod_Pedido_Item.Value := QPedidoItemCod_Pedido_Item.Value;
            QPedido_CanceladoDt_Cancelamento.Value := DMOracle.DataServ;
            QPedido_CanceladoQt_Cancelado.Value := QPedidoItemQt_Cancelado.Value;
            QPedido_CanceladoCod_Usuario.Value := DmUsuario.CodUsuarioCorrente;
            QPedido_CanceladoCod_Motivo.Value := 1;
            QPedido_Cancelado.Post;
            QPedidoItem.Next;
          end;
          QPedidoInd_Situacao.Value := '2';
          QPedido.Post;
          DmOracle.DBCemapa.Commit;
        except
          DmOracle.DBCemapa.Rollback;
          QPedidoItem.Cancel;
          raise;
        end;
      end
      else
        raise exception.Create('Selecionar Pedido Para Cancelar');
    end;

end;

procedure TFPedidoCad.BtImpItemPedClick(Sender: TObject);
begin
  inherited;
  if FPedidoCons = nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMPedido.QPedidoCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMPedido.QPedidoCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  if FPedidoCons.ShowModal = mrOk then
    with DMPedido do
    begin
      QPedidoItemCons.Close;
      QPedidoItemCons.SetVariable('Cod_Pedido_Cab', QPedidoConsCod_Pedido_Cab.Value);
      QPedidoItemCons.Open;
      while not QPedidoItemCons.Eof do
      begin
        QPedidoItem.Insert;
        QPedidoItemCOD_PRODUTO.Value := QPedidoItemConsCOD_PRODUTO.Value;
        QPedidoItemCOD_TRIBUTACAO.Value := QPedidoItemConsCOD_TRIBUTACAO.Value;
        QPedidoItemQT_PEDIDO.Value := QPedidoItemConsQT_PEDIDO.Value;
        QPedidoItemVAL_UNITARIO.Value := QPedidoItemConsVAL_UNITARIO.Value;
        QPedidoItemPERC_DESCONTO.Value := QPedidoItemConsPERC_DESCONTO.Value;
        QPedidoItemCOD_LOTE_TIPO.Value := QPedidoItemConsCOD_LOTE_TIPO.Value;
        QPedidoItemPERC_COMISSAO.Value := QPedidoItemConsPERC_COMISSAO.Value;
        QPedidoItemQT_EMBALAGEM.Value := QPedidoItemConsQT_EMBALAGEM.Value;
        if QPedidoItemConsQT_QUANTIDADE_AUX.Text <> '' then
          QPedidoItemQT_QUANTIDADE_AUX.Value := QPedidoItemConsQT_QUANTIDADE_AUX.Value;
        if QPedidoItemConsCOD_PRODUTO_AUX.Text <> '' then
          QPedidoItemCOD_PRODUTO_AUX.Value := QPedidoItemConsCOD_PRODUTO_AUX.Value;
        QPedidoItemPERC_DESCONTO1.Value := QPedidoItemConsPERC_DESCONTO1.Value;
        QPedidoItemPERC_DESCONTO2.Value := QPedidoItemConsPERC_DESCONTO2.Value;
        QPedidoItemPERC_ACRESCIMO.Value := QPedidoItemConsPERC_ACRESCIMO.Value;
        QPedidoItem.Post;
        QPedidoItemCons.Next;
      end;
    end;
end;

procedure TFPedidoCad.PedidosporRepresentante1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[12].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoRepresentante.Close;
      if Trim(FPedidoParam.Me12Filial.Text) <> '' then
        QRPedidoRepresentante.SetVariable('FILIAL', Trim(FPedidoParam.Me12Filial.Text))
      else
        QRPedidoRepresentante.SetVariable('FILIAL', null);

      if Trim(FPedidoParam.ME12Vendedor.Text) = '' then
        QRPedidoRepresentante.SetVariable('VENDEDOR', Null)
      else
        QRPedidoRepresentante.SetVariable('VENDEDOR', FPedidoParam.ME12Vendedor.Text);

      if Trim(FPedidoParam.ME12Supervisor.Text) = '' then
        QRPedidoRepresentante.SetVariable('SUPERVISOR', Null)
      else
        QRPedidoRepresentante.SetVariable('SUPERVISOR', FPedidoParam.ME12Supervisor.Text);
      if Trim(FPedidoParam.Me12Classe.Text) = '' then
        QRPedidoRepresentante.SetVariable('NUM_CLASSE', Null)
      else
        QRPedidoRepresentante.SetVariable('NUM_CLASSE', FPedidoParam.Me12Classe.Text);
      if Trim(FPedidoParam.Me12SubClasse.Text) = '' then
        QRPedidoRepresentante.SetVariable('NUM_SUBCLASSE', Null)
      else
        QRPedidoRepresentante.SetVariable('NUM_SUBCLASSE', FPedidoParam.Me12SubClasse.Text);

      if (FPedidoParam.Me12DtInicial.Text = '') or (FPedidoParam.Me12DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidoRepresentante.SetVariable('DT_INICIAL', trim(FPedidoParam.ME12DtInicial.Text));
      QRPedidoRepresentante.SetVariable('DT_FINAL', trim(FPedidoParam.ME12DtFinal.Text));

      QRPedidoRepresentante.Open;
      if FrPedidoRepresentante = nil then
        FrPedidoRepresentante := TFrPedidoRepresentante.Create(Application);
      FrPedidoRepresentante.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME12DtInicial.Text + ' até ' + FPedidoParam.ME12DtFinal.Text;
      FrPedidoRepresentante.QRLFilial.Caption := 'Filial:' + FPedidoParam.ME12Filial.Text + '' + FPedidoParam.Ed12Filial.Text;
      FrPedidoRepresentante.QRLVendedor.Caption := 'Vendedor:' + FPedidoParam.ME12Vendedor.Text + '' + FPedidoParam.Ed12Vendedor.Text;
      FrPedidoRepresentante.QRLSupervisor.Caption := 'Supervisor:' + FPedidoParam.ME12Supervisor.Text + '' + FPedidoParam.Ed12Supervisor.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoRepresentante.QRPrimario.Preview
      else
        FrPedidoRepresentante.QRPrimario.Print;
      QRPedidoRepresentante.Close;
    end;
end;

procedure TFPedidoCad.DBEdit16Change(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit16.Text) <> '' then
    DMPedido.QPedidoCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(DBEdit16.Text))
  else
    DMPedido.QPedidoCod_Banco_Agencia.Text := '';

end;

procedure TFPedidoCad.FormCreate(Sender: TObject);
var
  wAux: string;
begin
  inherited;
  GBUsuariosQueLiberaram.Visible := false;
  PCPedido.ActivePageIndex := 0;

  if DMOracle.BuscaNome('SELECT VAL_SEQUENCIA FROM TB_SEQUENCIA', 'NOME_SEQUENCIA=''NUM_SERIE''') = '' then
  begin
    try
      DMOracle.DBCemapa.StartTransaction;
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_SEQUENCIA(NOME_SEQUENCIA,COD_FILIAL,VAL_SEQUENCIA) VALUES(''NUM_SERIE'',1,1)');
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
      raise Exception.Create('A Sequência `NUM_SERIE` não foi criada!');
    end;
  end;
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ')) Then
  begin
    SBAnaliseCredito.Enabled := True;
    SBAnaliseCredito.Visible := True;
  end;

end;

procedure TFPedidoCad.AcompanhamentoPedidoPFornecedor1Click(
  Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[13].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidosFornecedor.Close;
      if Trim(FPedidoParam.Me13Filial.Text) <> '' then
        QRPedidosFornecedor.SetVariable('COD_FILIAL', Trim(FPedidoParam.Me13Filial.Text))
      else
        QRPedidosFornecedor.SetVariable('COD_FILIAL', null);

      if Trim(FPedidoParam.Me13Vendedor.Text) = '' then
        QRPedidosFornecedor.SetVariable('COD_VENDEDOR', Null)
      else
        QRPedidosFornecedor.SetVariable('COD_VENDEDOR', FPedidoParam.Me13Vendedor.Text);

      if Trim(FPedidoParam.Me13Classe.Text) = '' then
        QRPedidosFornecedor.SetVariable('NUM_CLASSE', Null)
      else
        QRPedidosFornecedor.SetVariable('NUM_CLASSE', FPedidoParam.Me13Classe.Text);

      if (FPedidoParam.Me13DtInicial.Text = '') or (FPedidoParam.Me13DtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data')
      else
        QRPedidosFornecedor.SetVariable('DT_INICIAL', trim(FPedidoParam.Me13DtInicial.Text));
      QRPedidosFornecedor.SetVariable('DT_FINAL', trim(FPedidoParam.Me13DtFinal.Text));

      QRPedidosFornecedor.Open;
      if FRPedidosFornecedor = nil then
        FRPedidosFornecedor := TFRPedidosFornecedor.Create(Application);
      FRPedidosFornecedor.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.Me13DtInicial.Text + ' até ' + FPedidoParam.Me13DtFinal.Text;
      FRPedidosFornecedor.QRLPeriodo.Caption := FRPedidosFornecedor.QRLPeriodo.Caption + ' Classe:' + FPedidoParam.Ed13Classe.Text;
      FRPedidosFornecedor.QRLFilial.Caption := 'Filial:' + FPedidoParam.Me13Filial.Text + ' ' + FPedidoParam.Ed13Filial.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidosFornecedor.QRPrimario.Preview
      else
        FRPedidosFornecedor.QRPrimario.Print;
      QRPedidosFornecedor.Close;
    end;

end;

procedure TFPedidoCad.DBEdit40Change(Sender: TObject);
begin
  inherited;
  if DBEdit40.Text <> '' then
    DMpedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
end;

procedure TFPedidoCad.DBEdit6Change(Sender: TObject);
begin
  inherited;
  if DMPedido.QpedidoCOD_PEDIDO_CAB.Text <> '' then
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
    begin
     // DMPedido.QMostraMateriais.close;
     // DMPedido.QmostraMateriais.SetVariable('COD_PEDIDO_CAB',StrToInt(DMPedido.QPedidoCOD_PEDIDO_CAB.Text));
    //  DMPedido.QMostraMateriais.Open;
    end;
  end;
end;

procedure TFPedidoCad.BtConsOrigemClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Origem.Value := DMEstado.QEstadoConsCod_Estado.Value;
end;

procedure TFPedidoCad.SBConsMotivoClick(Sender: TObject);
begin
  inherited;
  if FMotivoCons = nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  if FMotivoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Motivo.Value := DMMotivo.QMotivoConsCod_Motivo.Value;
end;

procedure TFPedidoCad.MostraoCdigodoEmbarque1Click(Sender: TObject);
var wCodigo, wCodigo1, wCodigo2, wCodigo3: string;
begin
  inherited;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Text <> '' then
  begin
    wCodigo := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text);

    if wCodigo <> '' then
      wCodigo1 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text
        + ' AND COD_EMBARQUE <> ' + wCodigo);
    if wCodigo1 <> '' then
      wCodigo2 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text
        + ' AND COD_EMBARQUE <> ' + wCodigo
        + ' AND COD_EMBARQUE <> ' + wCodigo1);
    if wCodigo2 <> '' then
      wCodigo3 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM', 'COD_PEDIDO_CAB = ' + DMPedido.QPedidoCOD_PEDIDO_CAB.Text
        + ' AND COD_EMBARQUE <> ' + wCodigo
        + ' AND COD_EMBARQUE <> ' + wCodigo1
        + ' AND COD_EMBARQUE <> ' + wCodigo2);

    if wCodigo <> '' then
      ShowMessage('Pedido Está No Embarque Código ' + wCodigo + ', ' + wCodigo1 + ', ' + wCodigo2 + ', ' + wCodigo3)
    else
      ShowMessage('Pedido Não Está Em Nenhum Embarque ');
  end;
  ShowMessage('Selecione um Pedido!');
end;

procedure TFPedidoCad.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if DMPedido.QPedidoInd_Situacao.Value = '2' then
    LblSituacao.Caption := 'CANCELADO'
  else
    LblSituacao.Caption := '';
end;

procedure TFPedidoCad.PedidosporSupervisor1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[14].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoSupervisor.Close;
      if Trim(FPedidoParam.Me14CodFilial.Text) <> '' then
        QRPedidoSupervisor.SetVariable('FILIAL', Trim(FPedidoParam.Me14CodFilial.Text))
      else
        QRPedidoSupervisor.SetVariable('FILIAL', null);
      if Trim(FPedidoParam.Me14CodClasse.Text) <> '' then
        QRPedidoSupervisor.SetVariable('NUM_CLASSE', Trim(FPedidoParam.Me14CodClasse.Text))
      else
        QRPedidoSupervisor.SetVariable('NUM_CLASSE', null);
      if Trim(FPedidoParam.Me14SubClasse.Text) <> '' then
        QRPedidoSupervisor.SetVariable('NUM_SUBCLASSE', Trim(FPedidoParam.Me14SubClasse.Text))
      else
        QRPedidoSupervisor.SetVariable('NUM_SUBCLASSE', null);

      QRPedidoSupervisor.SetVariable('DT_INICIAL', Trim(FPedidoParam.Me14Data_I.Text));
      QRPedidoSupervisor.SetVariable('DT_FINAL', Trim(FPedidoParam.Me14Data_F.Text));

      QRPedidoSupervisor.open;

      if FRPedidoSupervisor = nil then
        FRPedidoSupervisor := TFRPedidoSupervisor.Create(Application);
      FRPedidoSupervisor.QRLFilial.Caption := 'FILIAL ' + Trim(FPedidoParam.Me14CodFilial.Text) + ' ' + Trim(FPedidoParam.Ed14DescFilial.Text);
      FrPedidoSupervisor.QRLPeriodo.Caption := 'Período: ' + FPedidoParam.ME14Data_I.Text + ' até ' + FPedidoParam.ME14Data_F.Text;
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedidoSupervisor.QRPrimario.Preview
      else
        FRPedidoSupervisor.QRPrimario.Print;
      QRPedidoSupervisor.Close;

    end;
end;

procedure TFPedidoCad.DBEdit57Exit(Sender: TObject);
begin
  inherited;
  if Trim(DBEdit57.Text) <> '' then
  begin
    DMPedido.QPedidoItemCod_Produto.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO', 'NUM_FABRICANTE = ' + chr(39) + Trim(DBEdit57.Text) + chr(39));
//      := DbEdit21.Text;
  end;
end;

procedure TFPedidoCad.DBEdit58Exit(Sender: TObject);
var
  wValCliente,wEstado, wProduto: string;
  wQtde, wPesoAltura, wPesoLargura : real;
begin
  inherited;
  wValCliente := '';
  wProduto := DBedit21.Text;
  if ((DBEdit58.Text <> '') and (DBEdit59.Text <> '')) then
  begin
    if DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO='+wProduto)='KIT' then
    Begin
      wPesoAltura := StrToFloat(DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MIN FROM TB_PRODUTO','COD_PRODUTO='+wProduto));
      wPesoLargura := StrToFloat(DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MAX FROM TB_PRODUTO','COD_PRODUTO='+wProduto));
      wQtde := ((wPesoAltura * StrToFLoat(DBEdit58.Text)) + (wPesoLargura * StrToFloat(DBEdit59.Text)));
      DMPedido.QPedidoItemQT_PEDIDO.Value := wQtde/1000;
    end
    else
    Begin
      //DMPedido.QPedidoItemQT_PEDIDO.Value := StrToFloat(DBEdit58.Text) * StrToFloat(DBEdit59.Text) ;
      DMPedido.QPedidoItemQT_PEDIDO.Value := RoundTo((StrToFloat(DBEdit58.Text) / 1000) * (StrToFloat(DBEdit59.Text) / 1000), -4);//StrToFloat(DBEdit58.Text)/1000 * StrToFloat(DBEdit59.Text)/1000 ;
      {DMPedido.QPedidoItemQT_PEDIDO.Value := (Bib.ArredondamentoTemper((StrToFloat(DBEdit58.Text) / 100), 2) * Bib.ArredondamentoTemper((StrToFLoat(DBEdit59.Text) / 100), 2));
      DMPedido.QMateriaisQT_ACABAMENTO.Value := StrToFloat(DBEdit58.Text) * 2 + StrToFloat(DBEdit59.Text) * 2;}
    end;
  end;
  if DBEdit21.Text <> '' then
    wValCliente := DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR',
      'COD_PRODUTO=' + DBEdit21.Text + ' AND COD_CADASTRO =' + DBEdit5.Text);
  if wValCliente <> '' then
    DMPedido.QPedidoItemVAL_UNITARIO.Value := StrToFloat(wValCliente)
  else
    if DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO=' + DBEdit21.Text) <> '' then
      DMPedido.QPedidoItemVAL_UNITARIO.Text := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO=' + DBEdit21.Text)
    else
      DMPedido.QPedidoItemVAL_UNITARIO.Value := 0.01;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
  Begin
    wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO='+DMPedido.QPedidoCOD_CADASTRO.Text);
    if wEstado = 'SC' then
      DMPedido.QPedidoItemVAL_UNITARIO.Text := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO', 'COD_PRODUTO=' + DBEdit21.Text);
  end;
end;

procedure TFPedidoCad.DBEdit59Exit(Sender: TObject);
var
  wValCliente,westado, wProduto: string;
  wQtde, wPesoAltura, wPesoLargura : real;

begin
  inherited;
  wValCliente := '';
  wProduto := DBedit21.Text;
  if ((DBEdit58.Text <> '') and (DBEdit59.Text <> '')) then
  begin
    if DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO='+wProduto)='KIT' then
    Begin
      wPesoAltura := StrToFloat(DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MIN FROM TB_PRODUTO','COD_PRODUTO='+wProduto));
      wPesoLargura := StrToFloat(DMOracle.BuscaNome('SELECT QT_PESO_CAIXA_MAX FROM TB_PRODUTO','COD_PRODUTO='+wProduto));
      wQtde := ((wPesoAltura * StrToFLoat(DBEdit58.Text)) + (wPesoLargura * StrToFloat(DBEdit59.Text)));
      DMPedido.QPedidoItemQT_PEDIDO.Value := wQtde/1000;
      wAlturaAnterior := Trim(DBEdit58.Text);
    end
    else
    Begin
      DMPedido.QPedidoItemQT_PEDIDO.Value := (Bib.ArredondamentoTemper((StrToFloat(DBEdit58.Text) / 100), 2) * Bib.ArredondamentoTemper((StrToFLoat(DBEdit59.Text) / 100), 2));
      DMPedido.QMateriaisQT_ACABAMENTO.Value := StrToFloat(DBEdit58.Text) * 2 + StrToFloat(DBEdit59.Text) * 2;
      wAlturaAnterior := Trim(DBEdit58.Text);
    end;
  end;
  if DBEdit21.Text <> '' then
    wValCliente := DMOracle.BuscaNome('SELECT VAL_PRODUTO FROM TB_PRODUTO_FORNECEDOR',
      'COD_PRODUTO=' + DBEdit21.Text + ' AND COD_CADASTRO =' + DBEdit5.Text);
  if wValCliente <> '' then
    DMPedido.QPedidoItemVAL_UNITARIO.Value := StrToFloat(wValCliente)
  else
    if DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO=' + DBEdit21.Text) <> '' then
      DMPedido.QPedidoItemVAL_UNITARIO.Text := DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO', 'COD_PRODUTO=' + DBEdit21.Text)
    else
      DMPedido.QPedidoItemVAL_UNITARIO.Value := 0.01;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
  Begin
    wEstado := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO='+DMPedido.QPedidoCOD_CADASTRO.Text);
    if wEstado = 'SC' then
      DMPedido.QPedidoItemVAL_UNITARIO.Text := DMOracle.BuscaNome('SELECT VAL_ATACADO FROM TB_PRODUTO', 'COD_PRODUTO=' + DBEdit21.Text);
  end;
end;

procedure TFPedidoCad.SBIncluiImagemClick(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Value = 0 then
    raise Exception.Create('Selecione um Pedido!');
  with DMPedido do
  begin
    QImagemPedido.Open;
    QImagemPedido.Insert;
    QImagemPedidoCOD_PEDIDO_CAB.Value := QPedidoCOD_PEDIDO_CAB.Value;
    QImagemPedidoDESC_CAMINHO.Value := MECaminhoImagem.Text;
    QImagemPedido.Post;
    QImagemPedido.Close;
    QImagemPedido.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Value);
    QImagemPedido.Open;
    MECaminhoImagem.Text := '';
  end;
end;

procedure TFPedidoCad.btnProcurarClick(Sender: TObject);
var
  wCaminho: string;
begin
  inherited;
  if ODImagem.Execute then
  begin
    wCaminho := ODImagem.FileName;
    MECaminhoImagem.Text := Copy(wCaminho, 1, 60);
  end;
end;

procedure TFPedidoCad.SBExcluiImagemClick(Sender: TObject);
begin
  inherited;
  if messageDlg('Deseja realmente excluir essa imagem?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMPedido.QImagemPedido.Delete;
end;

procedure TFPedidoCad.ExportarPeaspOptyWay1Click(Sender: TObject);
begin
  inherited;
  if FExportar = nil then
    FExportar := TFExportar.Create(Application);
  FExportar.ShowModal;
end;

procedure TFPedidoCad.DBEdit6Enter(Sender: TObject);
begin
  inherited;
  DBEdit5.SetFocus;
end;

procedure TFPedidoCad.BitBtn2Click(Sender: TObject);
var
  wLargura, wAltura, wProduto: string;
begin
  inherited;
  DBComboBox5.SetFocus;

end;

procedure TFPedidoCad.DBEdit58Enter(Sender: TObject);
begin
  inherited;
  DBEdit58.Text := wAlturaAnterior;
  if wDescontoAnterior = '' then
    DBEdit27.Text := '0'
  else
    dbedit27.Text := wDescontoAnterior;
  DBEdit58.SelStart;
  DBEdit58.SelLength := 6;
end;

procedure TFPedidoCad.VoltarExportaoOptyWay1Click(Sender: TObject);
var ret: string;
begin
  inherited;
  InputQuery('', 'Pedido: ', ret);
  if ret <> '' then
    if MessageDlg('Confirma? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET IND_EXPORTADO = ' + QuotedStr('N') + ' WHERE COD_PEDIDO = ' + ret);
//      DMOracle.ExecutaSql('DELETE FROM TB_ACOMPANHAMENTO_PEDIDO WHERE COD_PEDIDO_CAB = ' + ret);
      DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO = ' + QuotedStr('N') + ', IND_CORTE =' + QuotedStr('N') + ', IND_USINAGEM = ' + QuotedStr('N') + ', IND_MARCACAO = ' + QuotedStr('N') + ', IND_FORNO = ' + QuotedStr('N') + ', IND_EMBARQUE = ' + QuotedStr('N') + ' WHERE COD_PEDIDO_CAB = ' + ret);
    end;
end;

procedure TFPedidoCad.ImprimeEtiquetasdoPedido1Click(Sender: TObject);
var
  F: TextFile;
  wBarra, wObs, wPosicao: string;
  wTotalPeca: integer;
begin
  inherited;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Value = 0 then
    raise Exception.Create('Selecione um Pedido!');
    //  rotina para impressora zebra tlp2844
  with DMPedido do
  begin
    QEtiquetaOpty.Close;
    QEtiquetaOpty.SetVariable('COD_PEDIDO_CAB', QPedidoCOD_PEDIDO_CAB.Text);
    QEtiquetaOpty.Open;
    QEtiquetaOpty.First;

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' Then
    Begin
      while not QEtiquetaOpty.Eof do
      begin
        if QEtiquetaOptyDESC_ESPECIFICACAO.Value = 'DIREITO' then
          wPosicao := 'D'
        else
        if QEtiquetaOptyDESC_ESPECIFICACAO.Value = 'ESQUERDO' then
          wPosicao := 'E'
        else
          wPosicao := '';
        if QEtiquetaOptyIND_TIPO.Text = 'FIXO' then
          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_MARCACAO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
       // if QEtiquetaOptyDESC_SERVICO.Text = 'SEM TEMPERA' then
       //   DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_FORNO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);

        DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
        wBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyCOD_PECA.Text))) +
          '99' +
          FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyNUM_SERIE.Text))) + '0';

        wObs := Trim(QEtiquetaOptyDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaOptyDESC_ACABAMENTO.Text) + ' ' +
          Trim(QEtiquetaOptyDESC_CANTO.Text) + ' ' + Trim(QEtiquetaOptyDESC_FORMA.Text);

        AssignFile(F, 'LPT1');
        Rewrite(F);
        writeLN(F, 'N');
        writeLN(F, 'Q4,0,0');
        writeLN(F, 'A430,5,0,2,2,3,N,"' + QEtiquetaOptyCOD_PEDIDO_CAB.Text + '"');
        if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO') and (QEtiquetaOptyDESC_COMPLEMENTO.Text <> '')
             and (QEtiquetaOptyDESC_UNIDADE.Text <> 'KIT')) Then
          writeLN(F, 'A30,35,0,3,3,3,N,"VETRO"')
        else
          writeLN(F, 'A30,35,0,3,3,3,N,"RO"');
        //writeLN(F, 'A430,55,0,2,2,3,N,"' + pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) + copy(QEtiquetaOptyIND_TIPO.Text, 1, 1)) + '"');
        writeLN(F, 'A430,55,0,2,2,3,N,"' + pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6)) + '"');
        writeLN(F, 'A580,55,0,3,3,3,N,"' + pchar(copy(QEtiquetaOptyIND_TIPO.Text, 1, 1)) + '"');
        writeLN(F, 'A10,150,0,3,2,3,N,"' + pchar(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 8) + '-' + COPY(QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text, 1, 14)) + '"');
        writeLN(F, 'B100,210,0,1,4,4,90,B,"' + wBarra + '"');
        If QEtiquetaOptyDESC_COMPLEMENTO.Text <> '' then
        Begin
          writeLN(F, 'A10,340,0,3,2,3,N,"' + QEtiquetaOptyDESC_COMPLEMENTO.Text + wPosicao + '"');
          writeLN(F, 'A300,340,0,3,2,3,N,"' + pchar(QEtiquetaOptyVAL_LARGURA.Text + ' x ' + QEtiquetaOptyVAL_ALTURA.Text) + '"');
        end
        else
        Begin
          writeLN(F, 'A10,340,0,3,2,3,N,"' + QEtiquetaOptyQT_PEDIDO.Text+'-'+QEtiquetaOptyDESC_COD_BARRA.Text + '"');
          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CORTE = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_USINAGEM = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_MARCACAO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_FORNO = ''N'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
        end;
        writeLN(F, 'A10,385,0,2,1,3,N,"' + pchar(Trim(wObs)) + '"');
        writeLN(F, 'A30,447,0,3,1,3,N,"' + pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)) + '"');
        writeLN(F, 'A200,447,0,3,1,3,N,"' + QEtiquetaOptynum_ordem_item.Text + '/' + QEtiquetaOptynum_total_itens.Text + '"');
        if QEtiquetaOptyIND_REPOSICAO.Text = 'S' then
          writeLN(F, 'A290,447,0,3,1,3,N,"' + pchar('R' + QEtiquetaOptyQT_REPOSICAO.Text) + '"');
        writeLN(F, 'A460,447,0,3,1,3,N,"' + pchar(DateToStr(QEtiquetaOptyDT_ENTREGA.Value)) + '"');

        writeLN(F, 'P1');
        CloseFile(F);
        contar(1000);
        QEtiquetaOpty.Next;
      end;
    end
    else
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERFOZ' Then
    Begin
      while not QEtiquetaOpty.Eof do
      Begin
        if QEtiquetaOptyIND_TIPO_PRODUTO.Text = 'INDUSTRIAL' Then
        begin
          if QEtiquetaOptyIND_TIPO.Text = 'FIXO' then
            DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_MARCACAO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
         // if QEtiquetaOptyDESC_SERVICO.Text = 'SEM TEMPERA' then
         //   DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_FORNO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);

          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          wBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyCOD_PECA.Text))) +
            '99' +
            FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyNUM_SERIE.Text)));

          wObs := Trim(QEtiquetaOptyDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaOptyDESC_ACABAMENTO.Text) + ' ' +
            Trim(QEtiquetaOptyDESC_CANTO.Text) + ' ' + Trim(QEtiquetaOptyDESC_FORMA.Text);

          Contar(750);
          A_CreatePrn(1, 'ppla.txt');
          A_Set_Darkness(12);
          A_Prn_Text(320, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptynum_ordem_item.Text + '/' + QEtiquetaOptynum_total_itens.Text));
          if QEtiquetaOptyQT_REPOSICAO.Value > 0 then
            A_Prn_Text(250, 018, 3, 3, 0, 1, 1, 'n', 2, pchar('R' + QEtiquetaOptyQT_REPOSICAO.Text));
          A_Prn_Text(250, 40, 3, 2, 0, 2, 2, 'n', 2, pchar('TEMPERFOZ'));
          A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
          A_Prn_Text(100, 60, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
          A_Prn_Text(100, 80, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyIND_TIPO.Text));
          A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text, 1, 25)));
          A_Prn_Text(310, 130, 3, 2, 0, 2, 1, 'n', 2, pchar(Trim(wObs)));
          if QEtiquetaDESC_ESPECIFICACAO.Value = 'USINAGEM' then
            A_Prn_Text(40, 110, 3, 4, 0, 1, 1, 'n', 2, pchar('CE'));
          If QEtiquetaOptyIND_TIPO_PRODUTO.Text = 'INDUSTRIAL' Then
            A_Prn_Text(250, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyVAL_LARGURA.Text + ' x ' + QEtiquetaOptyVAL_ALTURA.Text))
          else
            A_Prn_Text(250, 190, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaDESC_PRODUTO.Text));
          A_Prn_Text(90, 180, 3, 4, 0, 1, 1, 'n', 2, pchar(FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyCOD_PECA.Text)))));
          A_Prn_Text(90, 200, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaOptyDT_EMISSAO.Value)));
          A_Prn_Barcode(250, 250, 3, 'B', 0, 7, 40, 'N', 1, pchar(wBarra));
          A_Prn_Text(310, 250, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)));
          A_Print_Out(1, 1, 1, 1);
          A_ClosePrn;
          QEtiquetaOpty.Next;
        end
        else
        Begin
          wBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyCOD_PECA.Text))) +
                       '99' + FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyNUM_SERIE.Text)));

          Sleep(250);
          A_CreatePrn(1, 'ppla.txt');
          A_Set_Darkness(12);
          A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptynum_ordem_item.Text + '/' + QEtiquetaOptynum_total_itens.Text));
          A_Prn_Text(290, 55, 3, 2, 0, 3, 3, 'n', 2, pchar('TEMPERFOZ'));
          A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
          A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyCOD_PECA.Text));
          A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text, 1, 25)));
          A_Prn_Barcode(300, 170, 3, 'B', 0, 7, 40, 'N', 1, pchar(wBarra));
          A_Prn_Text(295, 200, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyDESC_PRODUTO.Text));
          A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)));
          A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaOptyDT_EMISSAO.Value)));
          A_Print_Out(1, 1, 1, 1);
          A_ClosePrn;
          QEtiquetaOpty.Next;
        end;
      end;
    end;
    //--INICIO--
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TOPGLASS' then
    begin
      {wBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyCOD_PECA.Text))) +
                       '99' + FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyNUM_SERIE.Text)));}

      Sleep(250);
      A_CreatePrn(1, 'ppla.txt');
      A_Set_Darkness(12);
      A_Prn_Text(290, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyDESC_PRODUTO.Text));
      A_Prn_Text(290, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO.Text));
      A_Prn_Text(290, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyDESC_COMPLEMENTO_2.Text));
      A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', DmOracle.DataServ)));
      A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyNOME.Text));
      A_Prn_Barcode(300, 170, 3, 'B', 0, 7, 40, 'N', 1, pchar(QEtiquetaOptyDESC_COD_BARRA.Text));
      A_Print_Out(1, 1, 1, 1);
      A_ClosePrn;
      QEtiquetaOpty.Next;
      //-- FIM --
      //A_Prn_Text(310, 018, 3, 3, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptynum_ordem_item.Text + '/' + QEtiquetaOptynum_total_itens.Text));
      //A_Prn_Text(290, 55, 3, 2, 0, 3, 3, 'n', 2, pchar('TOPGLASS'));
      //A_Prn_Text(115, 40, 3, 2, 0, 3, 3, 'n', 2, pchar(QEtiquetaOptyCOD_PEDIDO_CAB.Text));
      //A_Prn_Text(100, 75, 3, 2, 0, 2, 2, 'n', 2, pchar(QEtiquetaOptyCOD_PECA.Text));
      //A_Prn_Text(310, 110, 3, 4, 0, 1, 1, 'n', 2, pchar(Copy(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 14) + '-' + QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text, 1, 25)));
      //A_Prn_Barcode(300, 170, 3, 'B', 0, 7, 40, 'N', 1, pchar(wBarra));
      //A_Prn_Text(295, 200, 3, 4, 0, 1, 1, 'n', 2, pchar(QEtiquetaOptyDESC_PRODUTO.Text));
      //A_Prn_Text(310, 240, 3, 2, 0, 2, 3, 'n', 2, pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)));
      //A_Prn_Text(90, 240, 3, 3, 0, 1, 1, 'n', 2, pchar(FormatDateTime('dd/MM/yyyy', QEtiquetaOptyDT_EMISSAO.Value)));
      //A_Print_Out(1, 1, 1, 1);
      //A_ClosePrn;
      //QEtiquetaOpty.Next;
    end;
  end;
end;

procedure TFPedidoCad.Contar(ms: longint);
var OTempo: LongInt;
begin
  OTempo := GetTickCount + ms;
  while GetTickCount < OTempo do Application.ProcessMessages;
end;

procedure TFPedidoCad.SBVisualizarClick(Sender: TObject);
var
  wCaminho: string;
begin
  inherited;
  wCaminho := DMPedido.QImagemPedidoDESC_CAMINHO.Text;
  JumpTo(wCaminho);
end;

procedure TFPedidoCad.JumpTo(const aAdress: string);
var
  buffer: string;
begin
  buffer := aAdress;
  //ShellExecute(Application.Handle, nil, PChar(buffer), nil, nil, SW_SHOWNORMAL);
  ShellExecute(handle,'open', PChar(buffer), '','',SW_SHOWNORMAL);
end;

procedure TFPedidoCad.EspelhoporProduto1Click(Sender: TObject);
begin
  inherited;
//  if FExportaOptyWay = nil then
//    FExportaOptyWay := TFExportaOptyWay.Create(Application);
//  FExportaOptyWay.ShowModal;
  if FPedidoMaterialParam = nil then
    FPedidoMaterialParam := TFPedidoMaterialParam.Create(Application);
  FPedidoMaterialParam.ShowModal;
end;

procedure TFPedidoCad.BaixaManualdePedidos1Click(Sender: TObject);
begin
  inherited;
  if FPedidoBaixaManual = nil then
    FPedidoBaixaManual := TFPedidoBaixaManual.Create(Application);
  FPedidoBaixaManual.ShowModal;
end;

procedure TFPedidoCad.RelatriodeProduo1Click(Sender: TObject);
var
  wDataHoraIni, wDataHoraFin: string;
begin
  inherited;
  if FVidracariaParam = nil then
    FVidracariaParam := TFVidracariaParam.Create(Application);
  FVidracariaParam.PGRelatorio.Pages[0].TabVisible := True;
  if FVidracariaParam.ShowModal = mrOk then
  begin
    if FVidracariaParam.CbSetor1.ItemIndex = -1 then
    begin
      MessageDlg('Informe um setor.', mtError, [mbOK], 0);
      FVidracariaParam.CbSetor1.SetFocus;
      Exit;
    end;

    wDataHoraIni := FVidracariaParam.MeDataIni1.Text + ' ' + FVidracariaParam.MeHoraIni1.Text + ':00';
    wDataHoraFin := FVidracariaParam.MeDataFin1.Text + ' ' + FVidracariaParam.MeHoraFin1.Text + ':00';

    DmVidracaria.QRProducao.Close;
    DmVidracaria.QRProducao.SetVariable('SUBST', '  WHERE CAST(TB_ACOMPANHAMENTO_PEDIDO.DT_' + FVidracariaParam.CbSetor1.Text + ' AS TIMESTAMP) BETWEEN CAST(' + QuotedStr(wDataHoraIni) + ' AS TIMESTAMP) AND CAST(' + QuotedStr(wDataHoraFin) + ' AS TIMESTAMP) ');
    If FVidracariaParam.CbSetor1.Text = 'GERAL' Then
      DmVidracaria.QRProducao.SetVariable('DESC_TIPO', '')
    else
      DmVidracaria.QRProducao.SetVariable('DESC_TIPO', FVidracariaParam.CbSetor1.Text);
    DmVidracaria.QRProducao.SetVariable('DATA_INI', wDataHoraIni);
    DmVidracaria.QRProducao.SetVariable('DATA_FIN', wDataHoraFin);
    DmVidracaria.QRProducao.Open;

    if FRProducaoSetor = nil then
      FRProducaoSetor := TFRProducaoSetor.Create(Application);
    FRProducaoSetor.LSetor.Caption := FVidracariaParam.CbSetor1.Text;
    FRProducaoSetor.LData.Caption := wDataHoraIni + ' a ' + wDataHoraFin;
    if FVidracariaParam.RGPreview.ItemIndex = 0 then
      FRProducaoSetor.QRPrimario.Preview
    else
      FRProducaoSetor.QRPrimario.Print;

    DmVidracaria.QRProducao.Close;
  end;
end;

procedure TFPedidoCad.ImprimeEtiquetaAvulsa1Click(Sender: TObject);
var
  wPeca, wPedido: integer;
  F: TextFile;
  wBarra, wObs, wNumSerie: string;
  wTotalPeca: integer;
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
  begin
    wPedido := 0;
    wPeca := StrToInt(InputBox('Peça', 'Digite o número da peça: ', ''));
    wNumSerie := DMOracle.BuscaNome('SELECT MAX(NUM_SERIE) FROM TB_MATERIAL','1=1');
    wPedido := StrToInt(DMOracle.BuscaNome('SELECT COD_PEDIDO FROM TB_MATERIAL', 'COD_PECA = ' + IntToStr(wPeca) +
                                            ' AND NUM_SERIE = '+ wNumSerie));


    if wPedido = 0 then
      raise Exception.Create('Selecione um Pedido!');
      //  rotina para impressora zebra tlp2844
    with DMPedido do
    begin
      QEtiquetaOpty.Close;
      QEtiquetaOpty.SetVariable('COD_PEDIDO_CAB', wPedido);
      QEtiquetaOpty.Open;
      QEtiquetaOpty.First;

      while not QEtiquetaOpty.Eof do
      begin
        if IntToStr(wPeca) = QEtiquetaOptyCOD_PECA.Text then
        begin
          if QEtiquetaOptyIND_TIPO.Text = 'FIXO' then
            DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_MARCACAO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);

          DMOracle.ExecutaSql('UPDATE TB_MATERIAL_QUEBRA SET DT_REPOSICAO = CAST(' + QuotedStr(DateToStr(DMOracle.DataHoraServ)) + ' AS TIMESTAMP) WHERE COD_MATERIAL = ' + QEtiquetaOptyCOD_MATERIAL.Text);
          DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO = ''S'' WHERE COD_PEDIDO_ITEM =' + QEtiquetaOptyCOD_PEDIDO_ITEM.Text);
          wBarra := FormatFloat('000000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyCOD_PECA.Text))) +
            '99' +
            FormatFloat('000', StrToInt(Bib.LimpaNumero(QEtiquetaOptyNUM_SERIE.Text))) + '0';

          wObs := Trim(QEtiquetaOptyDESC_SERVICO.Text) + ' ' + Trim(QEtiquetaOptyDESC_ACABAMENTO.Text) + ' ' +
            Trim(QEtiquetaOptyDESC_CANTO.Text) + ' ' + Trim(QEtiquetaOptyDESC_FORMA.Text);

          AssignFile(F, 'LPT1');
          Rewrite(F);
          writeLN(F, 'N');
          writeLN(F, 'Q4,0,0');
          writeLN(F, 'A430,5,0,2,2,3,N,"' + QEtiquetaOptyCOD_PEDIDO_CAB.Text + '"');
          writeLN(F, 'A30,5,0,3,3,3,N,"VETRO"');
          writeLN(F, 'A430,55,0,2,2,3,N,"' + pchar(RMaskCGC_CPF(QEtiquetaOptyCOD_PECA.Text, 6) + copy(QEtiquetaOptyIND_TIPO.Text, 1, 1)) + '"');
          writeLN(F, 'A10,150,0,3,2,3,N,"' + pchar(Copy(QEtiquetaOptyDESC_FANTASIA.Text, 1, 12) + '-' + COPY(QEtiquetaOptyDESC_COMPLEMENTO_OBS.Text, 1, 8)) + '"');
          writeLN(F, 'B100,210,0,1,4,4,90,B,"' + wBarra + '"');
          writeLN(F, 'A10,330,0,3,2,3,N,"' + QEtiquetaOptyDESC_COMPLEMENTO.Text + '"');
          writeLN(F, 'A300,330,0,3,2,3,N,"' + pchar(QEtiquetaOptyVAL_LARGURA.Text + ' x ' + QEtiquetaOptyVAL_ALTURA.Text) + '"');
          writeLN(F, 'A10,385,0,2,1,3,N,"' + pchar(Trim(wObs)) + '"');
          writeLN(F, 'A30,447,0,3,1,3,N,"' + pchar(Copy(QEtiquetaOptyDESC_REGIAO.Text, 1, 3)) + '"');
          writeLN(F, 'A200,447,0,3,1,3,N,"' + QEtiquetaOptynum_ordem_item.Text + '/' + QEtiquetaOptynum_total_itens.Text + '"');
          if QEtiquetaOptyIND_REPOSICAO.Text = 'S' then
            writeLN(F, 'A290,447,0,3,1,3,N,"' + pchar('R' + QEtiquetaOptyQT_REPOSICAO.Text) + '"');
          writeLN(F, 'A460,447,0,3,1,3,N,"' + pchar(DateToStr(QEtiquetaOptyDT_ENTREGA.Value)) + '"');

          writeLN(F, 'P1');
          CloseFile(F);
        end;
        QEtiquetaOpty.Next;
      end;
    end;
  end;
end;

procedure TFPedidoCad.PedidosFaturadosNoEmbarcados1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[16].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  Begin
    QRPedFaturadoNaoEmbarcado.Close;
    if Trim(FPedidoParam.FmCadastro16.MeCadastro.Text) = '' then
      QRPedFaturadoNaoEmbarcado.SetVariable('CADASTRO', Null)
    else
      QRPedFaturadoNaoEmbarcado.SetVariable('CADASTRO', Trim(FPedidoParam.FmCadastro16.MeCadastro.Text));
    if Trim(FPedidoParam.FmRegiao16.MeRegiao.Text) = '' then
      QRPedFaturadoNaoEmbarcado.SetVariable('REGIAO', Null)
    else
      QRPedFaturadoNaoEmbarcado.SetVariable('REGIAO', Trim(FPedidoParam.FmRegiao16.MeRegiao.Text));

    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' then
    Begin
      if (Trim(FPedidoParam.ME16DtInicial.Text) = '') or (Trim(FPedidoParam.ME16DtFinal.Text) = '') then
      Begin
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_I', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_F', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_I', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_F', null);
      end
      else
      Begin
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_I', NULL);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_F', NULL);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_I', FPedidoParam.ME16DtInicial.Text);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_F', FPedidoParam.ME16DtFinal.Text);
      end;
    end
    else
    Begin
      if (Trim(FPedidoParam.ME16DtInicial.Text) = '') or (Trim(FPedidoParam.ME16DtFinal.Text) = '') then
      Begin
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_I', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_F', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_I', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_F', null);
      end
      else
      Begin
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_I', FPedidoParam.ME16DtInicial.Text);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_EMISSAO_F', FPedidoParam.ME16DtFinal.Text);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_I', null);
        QRPedFaturadoNaoEmbarcado.SetVariable('DT_ENTREGA_F', null);
      end;
    end;
    QRPedFaturadoNaoEmbarcado.Open;
  end;
  if FRPedFaturadoNaoEmbarcado = nil then
    FRPedFaturadoNaoEmbarcado := TFRPedFaturadoNaoEmbarcado.Create(Application);

    FRPedFaturadoNaoEmbarcado.QRLParam.Caption := 'Região.:'+FPedidoParam.FMRegiao16.EdRegiao.Text + '  Cliente.:'+FPedidoParam.FMCadastro16.edCadastro.Text;
  FRPedFaturadoNaoEmbarcado.QRPrimario.Preview;
  DMPedido.QRPedFaturadoNaoEmbarcado.Close;  
end;

procedure TFPedidoCad.DBEdit15Exit(Sender: TObject);
var
  wDados : string;
  wDia : String;
begin
  inherited;
  wDados := '';
  wDia := DateToStr(date-10);
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' Then//ISTO NAO DEIXA CADASTRAR PEDIDO COMA MESMA OBS, SE JA TIVER UM LANÇADO NOS ULTIMOS 10 DIAS PARA O MESMO CLIENTE
    wDados := DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','DESC_COMPLEMENTO_OBS Like ' + chr(39) +'%'+ Trim(DBEdit15.Text) + '%' + chr(39)+' AND DT_EMISSAO >='+chr(39)+wDia+chr(39) + ' AND COD_CADASTRO='+DMPedido.QPedidoCOD_CADASTRO.Text);
  if (wDados <> '') and (wDados <> DMPedido.QPedidoCOD_PEDIDO_CAB.Text) then
  Begin
    DBEdit15.SetFocus;
    Raise Exception.Create('Dados da etiqueta repetidos');
  end;
end;

procedure TFPedidoCad.AlteraPreoPedido1Click(Sender: TObject);
var
wValor : Real;
begin
  inherited;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Value = 0 then
      raise Exception.Create('Selecione um Pedido!');
  wValor := StrToFloat(InputBox('Altera Valores do Pedido', 'Digite o novo valor das peças: ', ''));
  if MessageDlg('Confirma Alteração do pedido?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DMOracle.ExecutaSql('UPDATE TB_PEDIDO_ITEM SET VAL_UNITARIO='+chr(39)+FloatToStr(wValor)+chr(39)+' WHERE COD_PEDIDO_CAB='+DMPedido.QPedidoCOD_PEDIDO_CAB.Text);
end;

procedure TFPedidoCad.PedidosAbertos2Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[15].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
    with DMPedido do
    begin
      QRPedidoAberto.Close;
      if Trim(FPedidoParam.FmCadastro15.MeCadastro.Text) = '' then
        QRPedidoAberto.SetVariable('COD_CADASTRO', Null)
      else
        QRPedidoAberto.SetVariable('COD_CADASTRO', Trim(FPedidoParam.FmCadastro15.MeCadastro.Text));
      if Trim(FPedidoParam.FmRegiao15.MeRegiao.Text) = '' then
        QRPedidoAberto.SetVariable('COD_REGIAO', Null)
      else
        QRPedidoAberto.SetVariable('COD_REGIAO', Trim(FPedidoParam.FmRegiao15.MeRegiao.Text));
      if (FPedidoParam.FmDatas15.MeDtInicial.Text = '') or (FPedidoParam.FmDatas15.MeDtFinal.Text = '') then
        raise Exception.create('É Preciso informar a data');
      QRPedidoAberto.SetVariable('DT_ENTREGA_I', trim(FPedidoParam.FmDatas15.MeDtInicial.Text));
      QRPedidoAberto.SetVariable('DT_ENTREGA_F', trim(FPedidoParam.FmDatas15.MeDtFinal.Text));
      case FPedidoParam.Rg15Ponto.ItemIndex of
        0: QRPedidoAberto.SetVariable('PONTO', 'TB_ACOMPANHAMENTO_PEDIDO.IND_CORTE = ''N''');
        1: QRPedidoAberto.SetVariable('PONTO', 'TB_ACOMPANHAMENTO_PEDIDO.IND_MARCACAO = ''N''');
        2: QRPedidoAberto.SetVariable('PONTO', 'TB_ACOMPANHAMENTO_PEDIDO.IND_USINAGEM = ''N''');
        3: QRPedidoAberto.SetVariable('PONTO', 'TB_ACOMPANHAMENTO_PEDIDO.IND_LAVACAO = ''N''');
        4: QRPedidoAberto.SetVariable('PONTO', '1=1');
      end; // Case

      QRPedidoAberto.Open;

      if FrPedidoAberto = nil then
        FrPedidoAberto := TFrPedidoAberto.Create(Application);
      FrPedidoAberto.QRLTitulo.Caption := 'Pedidos Abertos';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FrPedidoAberto.QRPrimario.Preview
      else
        FrPedidoAberto.QRPrimario.Print;
      QRPedidoAberto.Close;
    end;

end;

procedure TFPedidoCad.SBAnaliseCreditoClick(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedidoCOD_CADASTRO.Text <> '' then
  Begin
    with DMPedido do
    Begin
      DMPedido.QAnaliseCredito.Close;
      DMPedido.QAnaliseCredito.SetVariable('CADASTRO',DMPedido.QPedidoCOD_CADASTRO.Text);
      DMPedido.QAnaliseCredito.Open;
      DMPedido.QAnaliseCredito1.Close;
      DMPedido.QAnaliseCredito1.SetVariable('CADASTRO',DMPedido.QPedidoCOD_CADASTRO.Text);
      DMPedido.QAnaliseCredito1.Open;

      if ((QAnaliseCreditoVAL_TITULO.Value + QAnaliseCredito1VAL_CHEQUE.Value + QAnaliseCreditoVAL_PEDIDO.Value  >
          QAnaliseCreditoVAL_LIMITE.Value + QAnaliseCredito1VAL_CREDITO.Value) or
          (DMPedido.QAnaliseCreditoVAL_LIMITE.Value = 0)) then
      Begin
        DBEdit5.SetFocus;
        Raise Exception.Create('Limite Insuficiente para novos Pedidos!'+#13+
        'Contas a Receber R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_TITULO.Value)+#13+
        'Cheques                R$'+ FormatFloat('#,##0.00',QAnaliseCredito1VAL_CHEQUE.Value)+#13+
        'Pedidos Abertos   R$'+ FormatFloat('#,##0.00',(QAnaliseCreditoval_pedido.Value + QAnaliseCreditoVAL_ACRESCIMO.Value))+#13+
        'Créditos                 R$'+ FormatFloat('#,##0.00',QAnaliseCredito1VAL_CREDITO.Value)+#13+
        'Limite                    R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_LIMITE.Value)+#13+
        'Saldo                    R$'+FormatFloat('#,##0.00',(QAnaliseCreditoVAL_LIMITE.Value+QAnaliseCredito1VAL_CREDITO.Value)-
                        (QAnaliseCreditoVAL_TITULO.Value+QAnaliseCredito1VAL_CHEQUE.Value+QAnaliseCreditoval_pedido.Value+ QAnaliseCreditoVAL_ACRESCIMO.Value)));
      end
      else
        ShowMessage('Contas a Receber R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_TITULO.Value)+#13+
        'Cheques                R$'+ FormatFloat('#,##0.00',QAnaliseCredito1VAL_CHEQUE.Value)+#13+
        'Pedidos Abertos   R$'+ FormatFloat('#,##0.00',(QAnaliseCreditoval_pedido.Value + QAnaliseCreditoVAL_ACRESCIMO.Value))+#13+
        'Créditos                R$'+FormatFloat('#,##0.00',QanaliseCredito1VAL_CREDITO.Value)+#13+
        'Limite                    R$'+ FormatFloat('#,##0.00',QAnaliseCreditoVAL_LIMITE.Value)+#13+
        'Saldo                    R$'+FormatFloat('#,##0.00',(QAnaliseCreditoVAL_LIMITE.Value+QAnaliseCredito1VAL_CREDITO.Value)-
                        (QAnaliseCreditoVAL_TITULO.Value+QAnaliseCredito1VAL_CHEQUE.Value+QAnaliseCreditoval_pedido.Value + QAnaliseCreditoVAL_ACRESCIMO.Value)));
    end;
  end
  else
    showMessage('Selecione um pedido do cliente!');
end;

procedure TFPedidoCad.DBEdit27Exit(Sender: TObject);
begin
  inherited;
  if DMPedido.QPedidoItemPERC_DESCONTO.Value <> 0 then
    wDescontoAnterior := copy(DBEdit27.Text,1,4);
end;

procedure TFPedidoCad.QuebrasnaProduo1Click(Sender: TObject);
begin
  inherited;
    if FVidracariaParam = nil then
    FVidracariaParam := TFVidracariaParam.Create(Application);
  FVidracariaParam.PGRelatorio.Pages[1].TabVisible := True;
  if FVidracariaParam.ShowModal = mrOk then
  begin
    if FVidracariaParam.CbSetor2.ItemIndex = -1 then
    begin
      MessageDlg('Informe um setor.', mtError, [mbOK], 0);
      FVidracariaParam.CbSetor2.SetFocus;
      Exit;
    end;

    DmVidracaria.QRQuebra.Close;
    If FVidracariaParam.CbSetor2.Text = 'GERAL' Then
      DmVidracaria.QRQuebra.SetVariable('DESC_TIPO', null)
    else
      DmVidracaria.QRQuebra.SetVariable('DESC_TIPO', FVidracariaParam.CbSetor2.Text);
    if Trim(FVidracariaParam.Me2DtInicial.Text) = '' then
    Begin
      DmVidracaria.QRQuebra.SetVariable('DT_QUEBRA_I', NULL);
      DmVidracaria.QRQuebra.SetVariable('DT_QUEBRA_F', NULL);
    end
    else
    Begin
      DmVidracaria.QRQuebra.SetVariable('DT_QUEBRA_I', Trim(FVidracariaParam.Me2DtInicial.Text));
      DmVidracaria.QRQuebra.SetVariable('DT_QUEBRA_F', Trim(FVidracariaParam.Me2DtFinal.Text));
    end;

    DmVidracaria.QRQuebra.Open;

    if FRQuebraProducao = nil then
      FRQuebraProducao := TFRQuebraProducao.Create(Application);
    FRQuebraProducao.QRLSetor.Caption := 'Setor:'+FVidracariaParam.CbSetor2.Text+ '  '+'Período:'+ FVidracariaParam.Me2DtInicial.Text+' até '+FVidracariaParam.Me2DtFinal.Text;

    if FVidracariaParam.RGPreview.ItemIndex = 0 then
      FRQuebraProducao.QRPrimario.Preview
    else
      FRQuebraProducao.QRPrimario.Print;
    DmVidracaria.QRQuebra.Close;
  end;   
end;

procedure TFPedidoCad.Marcarpeasexportao1Click(Sender: TObject);
begin
  inherited;
  if FMarcarPecas = nil then
    FMarcarPecas := TFMarcarPecas.Create(Application);
  if FMarcarPecas.ShowModal = mrOK then
  begin
    with DmVidracaria do
    begin
      cdsDesenhoExportacao.First;
      while not cdsDesenhoExportacao.Eof do
      begin
        DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET COD_DESENHO_EXPORTACAO = '
          + QuotedStr(cdsDesenhoExportacaoCOD_DESENHO_EXPORTACAO.value)
            + ' WHERE COD_MATERIAL = ' + cdsDesenhoExportacaoCOD_MATERIAL.AsString);
        cdsDesenhoExportacao.Next;
      end;
    end;
  end;
end;

procedure TFPedidoCad.VincularPeasPedidos1Click(Sender: TObject);
begin
  inherited;
   if FVinculaPecasPedido = nil then
    FVinculaPecasPedido := TFVinculaPecasPedido.Create(Application);
  if FVinculaPecasPedido.ShowModal = mrOK then
end;

end.
