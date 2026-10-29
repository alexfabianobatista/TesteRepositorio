unit UPedidoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, ActiveX, ComObj,
  DBDirceu, variants, UFmHistorico;

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
    Label12: TLabel;
    DBEdit12: TDBEdit;
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
    Label30: TLabel;
    DBEdit37: TDBEdit;
    BitBtn2: TBitBtn;
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
    Label34: TLabel;
    DBEdit18: TDBEdit;
    TsMateriais: TTabSheet;
    DBGrid3: TDBGrid;
    MENumPalm: TMaskEdit;
    Label48: TLabel;
    OracleNavigator2: TOracleNavigator;
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
    TsCustos: TTabSheet;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    SpeedButton2: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    DBEdit61: TDBEdit;
    Label60: TLabel;
    DBEdit62: TDBEdit;
    DBGrid4: TDBGrid;
    OracleNavigator3: TOracleNavigator;
    DSCustoFuncionario: TDataSource;
    SBEmite: TSpeedButton;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    DBEdit63: TDBEdit;
    TsAdiantamentos: TTabSheet;
    FmHistorico: TFmHistorico;
    Label61: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    MeValor: TMaskEdit;
    MEProduto1: TMaskEdit;
    Label69: TLabel;
    Label70: TLabel;
    Label74: TLabel;
    BtLinhaCons: TBitBtn;
    BtProduto2: TBitBtn;
    BtCorBorda: TBitBtn;
    Label72: TLabel;
    MECor1: TMaskEdit;
    MEProduto2: TMaskEdit;
    MELinha: TMaskEdit;
    MECorBorda: TMaskEdit;
    MEProduto3: TMaskEdit;
    MEProduto4: TMaskEdit;
    BtProduto1: TBitBtn;
    Btcor: TBitBtn;
    BtProduto3: TBitBtn;
    BtProduto4: TBitBtn;
    Label71: TLabel;
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
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure OramentoviaWord1Click(Sender: TObject);
    function GetOrCreateObject (const ClassName: string): IDispatch;
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
    procedure DBEdit23Exit(Sender: TObject);
    procedure DBEdit40Change(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure MENumPalmExit(Sender: TObject);
    procedure BtConsOrigemClick(Sender: TObject);
    procedure SBConsMotivoClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure MostraoCdigodoEmbarque1Click(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure PedidosporSupervisor1Click(Sender: TObject);
    procedure DBEdit57Exit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBEmiteClick(Sender: TObject);
    procedure DBEdit63Exit(Sender: TObject);
    procedure DBEdit24Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure PCPedidoChange(Sender: TObject);
    procedure BtLinhaConsClick(Sender: TObject);
    procedure BtProduto2Click(Sender: TObject);
    procedure BtCorBordaClick(Sender: TObject);
    procedure MECorBordaExit(Sender: TObject);
    procedure BtcorClick(Sender: TObject);
    procedure BtProduto1Click(Sender: TObject);
    procedure BtProduto3Click(Sender: TObject);
    procedure BtProduto4Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoCad: TFPedidoCad;
  newWord: Variant;
  
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
  URPedidoSupervisor, UFFuncionarioCons, UFuncionario_cl, USenha,
  UHistorico_cl, UPlanilha_cl, URReciboCaixa, ULinhaProducao_Cons,
  ULinhaProducao_cl;

{$R *.DFM}

procedure TFPedidoCad.FormActivate(Sender: TObject);

begin
  inherited;
  With DMPedido do
  Begin
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ' Then
     Begin
       QPedidoItem.SQL[QPedidoItem.SQL.Count-1]:='';  // elimina a última Linha da SQL
       QPedidoItem.SQL.Add('Order by Cod_Produto');
     End;
    QPedido.Open;
    QPedidoItem.Open;
    QSomaPedido.Open;
    QQuantidadePedido.open;
    wDtEmissao_Ant := Date;
  End;
  TsAdiantamentos.TabVisible := False;
  TsCustos.TabVisible := False;
  TsMateriais.TabVisible := False;
  If FPedidoCons <> Nil then
     FPedidocons.BtConsCadastro.Enabled := True;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
  Begin
     Label12.Caption := 'Prod.Troca';
     DBRGTipoPagamento.Items.Clear;
     DBRGTipoPagamento.Items.Add('A Vista');
     DBRGTipoPagamento.Items.Add('A Prazo');
     DBRGTipoPagamento.Items.Add('Base Troca');
     DBRGTipoPagamento.Items.Add('Reserva');
  End;

  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' Then
   Begin
     DbEdit45.Visible := True;
     DbEdit46.Visible := True;
     DbEdit47.Visible := True;
     Label36.Visible := True;
     Label38.Visible := True;
     Label39.Visible := True;
     DBEdit17.Visible := False;
     Label47.Visible := False;
     BtConsCultura.Visible := False;
     TsMateriais.TabVisible := True;
   End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED') OR
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ARZ')   Then
   Begin
     DBGrid2.Visible := false;
     label32.Visible := false;
     DBGItemPedido.Height:=242;
     DbEdit28.TabStop := False;
     DbEdit22.TabStop := False;
     BtConsLote.TabStop := False;
     BtConsTributacao.Top := 106;
     BtConsTributacao.Left := 476;
     DbEdit22.Top := 105;
     DbEdit22.Left := 423;
     Label18.Top := 89;
     Label18.Left := 425;
     DbDirceu3.Top :=105;
     DbDirceu3.Left := 501;
     DBEdit17.Visible := False;
     Label47.Visible := False;
     BtConsCultura.Visible := False;
     Label34.Visible := True;
     DbEdit18.Visible := True;
   End;
   If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Or
      (DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED') Then
    Begin
     DBGrid1.Visible := false;
    End;
     
   if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
   Begin
     Label53.Visible := True;
     DbEdit54.Visible := True;
     BtConsOrigem.Visible := True;
   end;
   If DMParamSistema.QParamSistemaCod_Empresa.Value = 'CGS' then
   Begin
     Label55.Left := 420;
     DbEdit56.Left := 420;
     SBConsMotivo.Left := 472;
     Label55.Visible := True;
     DbEdit56.Visible := True;
     SBConsMotivo.Visible := True;
   end;
   If DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
   Begin
     DbEdit57.Left := 9;
     DbEdit57.Top := 59;
     DbEdit57.Visible := True;
     DbEdit41.Left := 136;
     DbEdit41.Width := 144;
     BtConsProduto.Left := 106;
     DBEdit17.Visible := False;
     Label47.Visible := False;
     BtConsCultura.Visible := False;
   end;
   if (DMParamSistema.QParamSistemaCod_Empresa.Value = 'PUBLICAR') then
   Begin
     DbEdit18.Visible := True;
     Label34.Visible := True;
     TsCustos.TabVisible := True;
   end;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then
  Begin
     DBRGTipoPagamento.Items.Clear;
     DBRGTipoPagamento.Items.Add('A Vista');
     DBRGTipoPagamento.Items.Add('A Prazo');
     DBRGTipoPagamento.Items.Add('Adiantamento');
     TsAdiantamentos.TabVisible := True;
  End;
end;

procedure TFPedidoCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFPedidoCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
   Begin
     DMPedido.QPedidoCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
     DBEdit5Exit(Self);
   End;
end;

procedure TFPedidoCad.BtConsOperacaoClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  If FOperacaoCons.ShowModal = mrOk then
    DMPedido.QpedidoCod_Operacao.Value := DMOperacao.QOperacaoConsCod_Operacao.Value;
  DBEdit3Exit(Self);  
end;

procedure TFPedidoCad.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Vendedor.Value := DMVendedor.QVendedorConsCod_Vendedor.Value;
end;

procedure TFPedidoCad.SBConfirmarClick(Sender: TObject);
Var wOperacao,wOperacao1,wOperacao2,wNota_Fiscal,wNada : String;
    wValor_CC,wValor_Outros : Real;
    wDia,wMes,wAno : Word;
begin
  DmUsuario.Checar_Filial_Usuario(DMPedido.QPedidoCOD_FILIAL.Text,'VENDA');
  If DMPedido.DSPedidoItem.State In [DsInsert,DsEdit] Then
     DMPedido.DSPedidoItem.Dataset.Post;

  if DSPrimario.State in [DsEdit] then  //Modificado 24/11/06  Marlon
  begin                                 //Nao estava alterando o Motivo
    DMPedido.DSPedidoItem.Edit;
    DMPedido.DSPedidoItem.DataSet.Post;
  end;

  If DMPedido.QPedidoCod_Vendedor.Text <> '' Then
     If (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+DMpedido.QPedidoCod_Vendedor.Text)) <> 'ATIVO' Then
        Raise Exception.Create ('Vendedor Inativo');
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('Pk',DMpedido.QPedidoCod_Cadastro.Value);
  DMCadastro.QCadastro.Open;
  {If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Then
   Begin
     wNota_Fiscal :=DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+DMpedido.QPedidoCod_Operacao.Text);
     If wNota_Fiscal = 'F' Then
      Begin
        If DMCadastro.QCadastroNUM_CGC_CPF.Text = '' Then
           Raise Exception.Create ('Não é Permitido Lançar Pedidos Sem Cnpj/Cpf');
        If (DMCadastro.QCadastroIND_FISICA_JURIDICA.Text = 'F') And (DMPedido.QPedidoCod_Filial.Value <> 4) Then
           Raise Exception.Create ('Não é Permitido Fazer Notas Para Clientes Pessoa Física');
      End;
     If (DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value < 250) And
        (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') And
        (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO') Then
        If DMCadastro.QCadastroIND_LIBERA_BLOQUETO.Value <> 'SIM' Then
           Raise Exception.Create ('Pedidos A Prazo - Somente Valores Maiores Que R$ 250,00');
     If (DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value < 120) And
        (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') And
        (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO') Then
        If DMCadastro.QCadastroIND_LIBERA_BLOQUETO.Value <> 'SIM' Then
           Raise Exception.Create ('Pedidos A Prazo - Somente Valores Maiores Que R$ 120,00');
     If (DBRGTipoPagamento.ItemIndex = 1) and (DBEdit40.Text = '') Then
        Raise Exception.Create ('Preencher Prazo de Pagamento');
     If (DBRGTipoPagamento.ItemIndex = 2) and (DBEdit29.Text = '') Then
        Raise Exception.Create ('Preencher Vencimento do Cheque');


     // se o pedido for brinde ou bonificacao - vai verificar se o vendedor possui verba
     DMOperacao.QOperacao.close;
     DMOperacao.QOperacao.SetVariable('Pk',DMPedido.QPedidoCod_Operacao.Value);
     DMOperacao.QOperacao.Open;
     If (DMOperacao.QOperacaoIND_BONIFICACAO.Value = 'S') Or
        (DMOperacao.QOperacaoIND_BRINDE.Value = 'S') Then
      Begin
        With DMVerbaRepresentante do
        Begin
          DecodeDate(Date,wAno,wMes,wDia);
          QVerbaVendedorCons.Close;
          QVerbaVendedorCons.SetVariable('Ano',wAno);
          QVerbaVendedorCons.SetVariable('Mes',wMes);
          QVerbaVendedorCons.SetVariable('Vendedor',DMPedido.QPedidoCod_Vendedor.Value);
          QVerbaVendedorCons.Open;
          if QVerbaVendedorCons.Eof Then
             Raise Exception.Create('Vendedor não tem verba para este mês - Bonificação/Brindes')
          Else
            Begin
              wValor_Outros := DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value;
              If QVerbaVendedorConsVal_Verba.Value <= QVerbaVendedorConsVal_Utilizado.Value + wValor_Outros Then
                 Raise Exception.Create('Vendedor não tem verba suficiente para este mês - Bonificação/Brindes')
              Else
                Begin
                  QVerbaVendedor.Close;
                  QVerbaVendedor.SetVariable('Num_Ano',wAno);
                  QVerbaVendedor.SetVariable('Num_Mes',wMes);
                  QVerbaVendedor.SetVariable('Cod_Vendedor',DMPedido.QPedidoCod_Vendedor.Value);
                  QVerbaVendedor.SetVariable('Cod_Verba_Representante',QVerbaVendedorConsCod_Verba_Representante.Value);
                  QVerbaVendedor.Open;
                  If not(QVerbaVendedor.Eof) Then
                   Begin
                    wValor_Outros := wValor_Outros + QVerbaVendedorVal_Utilizado.Value;
                    QVerbaVendedor.Edit;
                    QVerbaVendedorVal_Utilizado.Value := wValor_Outros;
                    QVerbaVendedor.Post;
                   End;
                End;
            End;
        End;
      End;
   End; }
   If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
   Begin
     wOperacao :=DMCadastro.QCadastroCOD_OPERACAO_CC.Text;
     wOperacao1 :=DMCadastro.QCadastroCOD_OPERACAO_CC1.Text;
     wOperacao2 :=DMCadastro.QCadastroCOD_OPERACAO_CC2.Text;
     If (wOperacao <> '') or (wOperacao1 <> '') or (wOperacao2 <> '') Then
        If (wOperacao <> DMPedido.QPedidoCod_Operacao.Text) And (wOperacao1 <> DMPedido.QPedidoCod_Operacao.Text) And
           (wOperacao2 <> DMPedido.QPedidoCod_Operacao.Text) Then
          Raise Exception.Create ('Código de Operação Não Permitida para Este Cliente');
   End;
   wValor_cc := 0;
  {If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') And
     (DBRGTipoPagamento.ItemIndex <> 0) Then
   Begin
      wNada := DMOracle.BuscaNome('SELECT SUM(Tb_nota_item.VAL_TOTAL - tb_nota_item.VAL_DESCONTO) FROM TB_NOTA_CAB,TB_NOTA_ITEM ',
         'Tb_nota_item.COD_NOTA_CAB = Tb_nota_cab.COD_NOTA_CAB And COD_CADASTRO = '+ DMpedido.QPedidoCod_Cadastro.Text +
         ' AND TB_NOTA_CAB.IND_SITUACAO = '+ Chr(39) +  '2' + Chr(39) +
         ' AND TB_NOTA_CAB.IND_ENTRADA_SAIDA = '+ Chr(39) +  'S' + Chr(39) +
         ' AND TB_NOTA_CAB.IND_CONDICAO_PAGTO = '+ Chr(39) +  '3' + Chr(39) +
         ' AND TB_NOTA_CAB.COD_NOTA_CONTA_CORRENTE IS NULL ' +
         ' AND TB_NOTA_CAB.COD_FILIAL = ' + DMpedido.QPedidoCod_Filial.Text);
      If wNada <> '' Then
         wValor_cc := StrToFloat(wNada);
   End;}
  If DBRGTipoPagamento.ItemIndex <> 0 Then     // forma e pagamento <> de a vista
    DMCadastro.ValidaCredito(DMpedido.QPedidoCod_Cadastro.Value,DMpedido.QSomaPedidoSTOTAL_PEDIDO.Value+wValor_cc);
  If DMPedido.QPedidoNum_Pedido.Value = 0 then
    DMPedido.QPedidoNum_Pedido.Value := DMSequencia.Sequencia(DMPedido.QPedidoCod_Filial.Value,'PEDIDO');
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFPedidoCad.BtConsProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
   Begin
     If DMPedido.DsPedidoItem.State in [DsInsert,DsEdit] Then
        DMPedido.QPedidoItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value
     Else
      Begin
        DMPedido.QPedidoItem.Edit;
        DMPedido.QPedidoItemCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
      End;
     If DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' then
       DMPedido.QPedidoItemNUM_FABRICANTE.Value := DMProduto.QProdutoConsNum_Fabricante.Value;
   End;
end;

procedure TFPedidoCad.BtConsLoteClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  FTipoLoteCons.MeCodProduto.Text := FloatToStr(DMPedido.QPedidoItemCod_Produto.Value);
  If FTipoLoteCons.ShowModal = mrOk then
     If DMPedido.DsPedidoItem.State in [DsInsert,DsEdit] Then
        DMPedido.QPedidoItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value
     Else
       Begin
        DMPedido.QPedidoItem.Edit;
        DMPedido.QPedidoItemCod_Lote_Tipo.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
       End;
end;

procedure TFPedidoCad.BtConsTributacaoClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = MrOk then
     If DMPedido.DsPedidoItem.State in [DsInsert,DsEdit] Then
        DMPedido.QPedidoItemCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value
     else
      Begin
        DMPedido.QPedidoItem.Edit;
        DMPedido.QPedidoItemCod_Tributacao.Value := DMTributacao.QTributacaoConsCod_Tributacao.Value;
      End
end;

procedure TFPedidoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.pTela_Chamou := 'PEDIDO';  // Para colocar funcionar a seguranca por Filial
  If FPedidoCons.ShowModal = mrOk then
  With DMPedido do
  Begin
    QPedido.Close;
    QPedido.SetVariable('PK',QPedidoConsCod_Pedido_Cab.Value);
    QPedido.Open;
    QCustoFuncionario.Close;
    QCustoFuncionario.SetVariable('COD_PEDIDO_CAB',QPedidoConsCod_Pedido_Cab.Value);
    QCustoFuncionario.open;
  End;
end;

procedure TFPedidoCad.PedidosAbertos1Click(Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[0].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME0Filial.Text),'VENDA');
    QRPedAberto.Close;
    QRPedAberto.SetVariable('DATA_I',FPedidoParam.ME0DataI.Text);
    QRPedAberto.SetVariable('DATA_F',FPedidoParam.ME0DataF.Text);
    If Trim(FPedidoParam.ME0Filial.Text) = '' then
      QRPedAberto.SetVariable('FILIAL',Null)
    Else
      QRPedAberto.SetVariable('FILIAL',FPedidoParam.ME0Filial.Text);
    If Trim(FPedidoParam.ME0Cadastro.Text) = '' then
      QRPedAberto.SetVariable('CADASTRO',Null)
    else
      QRPedAberto.SetVariable('CADASTRO',FPedidoParam.ME0Cadastro.Text);
    If Trim(FPedidoParam.Me0Fornecedor.Text) = '' then
      QRPedAberto.SetVariable('FORNECEDOR',Null)
    else
      QRPedAberto.SetVariable('FORNECEDOR',FPedidoParam.Me0Fornecedor.Text);
    if Trim(FPedidoParam.ME0Produto.Text) = '' then
      QRPedAberto.SetVariable('PRODUTO',Null)
    else
      QRPedAberto.SetVariable('PRODUTO',FPedidoParam.ME0Produto.Text);
    if Trim(FPedidoParam.ME0Vendedor.Text) = '' then
      QRPedAberto.SetVariable('VENDEDOR',Null)
    else
      QRPedAberto.SetVariable('VENDEDOR',FPedidoParam.ME0Vendedor.Text);
    if Trim(FPedidoParam.ME0LoteTipo.Text) = '' then
      QRPedAberto.SetVariable('COD_LOTE',Null)
    else
      QRPedAberto.SetVariable('COD_LOTE',FPedidoParam.ME0LoteTipo.Text);
    if Trim(FPedidoParam.Me0NrInicial.Text) = '' then
      QRPedAberto.SetVariable('NUM_INICIAL',Null)
    else
      QRPedAberto.SetVariable('NUM_INICIAL',FPedidoParam.Me0NrInicial.Text);
    if Trim(FPedidoParam.Me0NrFinal.Text) = '' then
      QRPedAberto.SetVariable('NUM_FINAL',Null)
    else
      QRPedAberto.SetVariable('NUM_FINAL',FPedidoParam.Me0NrFinal.Text);
    if Trim(FPedidoParam.Me0Cultura.Text) = '' then
      QRPedAberto.SetVariable('COD_CULTURA',Null)
    else
      QRPedAberto.SetVariable('COD_CULTURA',FPedidoParam.Me0Cultura.Text);
    if Trim(FPedidoParam.ME0Estado.Text) = '' then
      QRPedAberto.SetVariable('COD_ESTADO',Null)
    else
      QRPedAberto.SetVariable('COD_ESTADO',Trim(FPedidoParam.ME0Estado.Text));
    if Trim(FPedidoParam.ME0Departamento.Text) = '' then
      QRPedAberto.SetVariable('DEPARTAMENTO',Null)
    else
      QRPedAberto.SetVariable('DEPARTAMENTO',Trim(FPedidoParam.ME0Departamento.Text));

    QRPedAberto.SQL[QRPedAberto.SQL.count -1]:='';
    case FPedidoParam.CB0Ordem.ItemIndex of
      0 : QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
      1 : QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_CAB.DT_ENTREGA, TB_PEDIDO_CAB.COD_PEDIDO_CAB, TB_PEDIDO_ITEM.COD_PRODUTO');
      2 : QRPedAberto.SQL.Add('ORDER BY TB_CADASTRO.NOME, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
      3 : QRPedAberto.SQL.Add('ORDER BY TB_PEDIDO_ITEM.COD_PRODUTO, TB_PEDIDO_CAB.DT_EMISSAO, TB_PEDIDO_CAB.COD_PEDIDO_CAB');
    else
       raise Exception.Create('Nenhuma ordem selecionada!');
    end; // Case
    case FPedidoParam.Rg0TipoPagto.ItemIndex of
      0 : QRPedAberto.SetVariable('TIPO_PAGTO',Null);
      1 : QRPedAberto.SetVariable('TIPO_PAGTO','A VISTA');
      2 : QRPedAberto.SetVariable('TIPO_PAGTO','A PRAZO');
      3 : QRPedAberto.SetVariable('TIPO_PAGTO','OUTROS');
    end; // Case
    If Trim(FPedidoParam.ME0Classe.Text) = '' then
      QRPedAberto.SetVariable('CLASSE',Null)
    Else
      QRPedAberto.SetVariable('CLASSE',FPedidoParam.ME0Classe.Text);
    If (Trim(FPedidoParam.ME0SubClasse.Text) = '') or (Trim(FPedidoParam.ME0SubClasse.Text) = '0') then
      QRPedAberto.SetVariable('SUB_CLASSE',Null)
    Else
      QRPedAberto.SetVariable('SUB_CLASSE',FPedidoParam.ME0SubClasse.Text);

    if Trim(FPedidoParam.ME0Origem.Text) = '' then
      QRPedAberto.SetVariable('ORIGEM',Null)
    else
      QRPedAberto.SetVariable('ORIGEM',Trim(FPedidoParam.ME0Origem.Text));
      
    if Trim(FPedidoParam.ME0Motivo.Text) = '' then
      QRPedAberto.SetVariable('MOTIVO',Null)
    else
      QRPedAberto.SetVariable('MOTIVO',Trim(FPedidoParam.ME0Motivo.Text));

    if Trim(FPedidoParam.ME0Operacao1.Text) <> '' then
      QRPedAberto.SetVariable('COD_OPERACAO1',Trim(FPedidoParam.ME0Operacao1.Text));
    if Trim(FPedidoParam.ME0Operacao2.Text) <> '' then
      QRPedAberto.SetVariable('COD_OPERACAO2',Trim(FPedidoParam.ME0Operacao2.Text));
    if Trim(FPedidoParam.ME0Operacao3.Text) <> '' then
      QRPedAberto.SetVariable('COD_OPERACAO3',Trim(FPedidoParam.ME0Operacao3.Text));
    if Trim(FPedidoParam.ME0Operacao4.Text) <> '' then
      QRPedAberto.SetVariable('COD_OPERACAO4',Trim(FPedidoParam.ME0Operacao4.Text));

    QRPedAberto.Open;
    If FRPedido_Aberto = Nil then
       FRPedido_Aberto := TFRPedido_Aberto.Create(Application);
    FRpedido_Aberto.QRLTitulo.Caption := 'Pedido em Aberto ('+FPedidoParam.ME0DataI.text+' - '+FPedidoParam.ME0DataF.Text+')';
    FRpedido_Aberto.QRLEstado.Caption :='Departamento:' + Trim(FPedidoParam.ME0Departamento.Text) +' '+(FPedidoParam.Ed0Departamento.Text)+
                                         ' ' + 'Estado: '+Trim(FPedidoParam.ED0Estado.Text);
    Case FPedidoParam.Rg0TipoPagto.ItemIndex of
      0 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Todos';
      1 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Vista';
      2 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Prazo';
      3 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Outros';
    End; // Case
    If Trim(FPedidoParam.Me0Cultura.Text) <> '' Then
       FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Cultura ' + FPedidoParam.Ed0Cultura.Text;
    If Trim(FPedidoParam.Me0Origem.Text) <> '' Then
      FRpedido_Aberto.QRLOrigem.Caption := 'Origem do Produto :' + FpedidoParam.Me0Origem.Text
    else
      FRpedido_Aberto.QRLOrigem.Caption := 'Origem do Produto : Todas';
    FRpedido_Aberto.QRLMotivo.Caption := 'Motivo: ' + FpedidoParam.ME0Motivo.Text + ' '+FpedidoParam.Ed0Motivo.Text +
                                         '  Operações: '+ FpedidoParam.ME0Operacao1.Text + ', '+ FpedidoParam.ME0Operacao2.Text
                                         + ', '+ FpedidoParam.ME0Operacao3.Text + ', '+ FpedidoParam.ME0Operacao4.Text;

    if FPedidoParam.RGPreview.ItemIndex = 0 then
       FRPedido_Aberto.QRPrimario.Preview
    else
       FRPedido_Aberto.QRPrimario.Print;
    QRPedAberto.Close;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' then
    Begin
      QRPedido_BaseTroca.Close;
      QRPedido_BaseTroca.SetVariable('DATA_I',FPedidoParam.ME0DataI.Text);
      QRPedido_BaseTroca.SetVariable('DATA_F',FPedidoParam.ME0DataF.Text);
      If Trim(FPedidoParam.ME0Filial.Text) = '' then
        QRPedido_BaseTroca.SetVariable('FILIAL',Null)
      Else
        QRPedido_BaseTroca.SetVariable('FILIAL',FPedidoParam.ME0Filial.Text);
      If Trim(FPedidoParam.ME0Cadastro.Text) = '' then
        QRPedido_BaseTroca.SetVariable('CADASTRO',Null)
      else
        QRPedido_BaseTroca.SetVariable('CADASTRO',FPedidoParam.ME0Cadastro.Text);
      If Trim(FPedidoParam.ME0Produto.Text) = '' then
        QRPedido_BaseTroca.SetVariable('PRODUTO',Null)
      else
        QRPedido_BaseTroca.SetVariable('PRODUTO',FPedidoParam.ME0Produto.Text);
      If Trim(FPedidoParam.ME0Vendedor.Text) = '' then
        QRPedido_BaseTroca.SetVariable('VENDEDOR',Null)
      Else
        QRPedido_BaseTroca.SetVariable('VENDEDOR',FPedidoParam.ME0Vendedor.Text);

      if Trim(FPedidoParam.ME0Origem.Text) = '' then
        QRPedido_BaseTroca.SetVariable('ORIGEM',Null)
      else
        QRPedido_BaseTroca.SetVariable('ORIGEM',Trim(FPedidoParam.ME0Origem.Text));
      case FPedidoParam.Rg0TipoPagto.ItemIndex of
        0 : QRPedido_BaseTroca.SetVariable('TIPO_PAGTO',Null);
        1 : QRPedido_BaseTroca.SetVariable('TIPO_PAGTO','A VISTA');
        2 : QRPedido_BaseTroca.SetVariable('TIPO_PAGTO','A PRAZO');
        3 : QRPedido_BaseTroca.SetVariable('TIPO_PAGTO','OUTROS');
      else
         raise Exception.Create('Nenhuma ordem selecionada!');
      end; // Case
      QRPedido_BaseTroca.Open;
      If FRPedido_BaseTroca = Nil then
        Application.CreateForm(TFRPedido_BaseTroca, FRPedido_BaseTroca);
      FRPedido_BaseTroca.QRLTitulo.Caption := 'Pedido em Aberto Base Troca ('+FPedidoParam.ME0DataI.text+' - '+FPedidoParam.ME0DataF.Text+')';
      if FPedidoParam.RGPreview.ItemIndex = 0 then
         FRPedido_BaseTroca.QRPrimario.Preview
      else
         FRPedido_BaseTroca.QRPrimario.Print;
      QRPedido_BaseTroca.Close;
    End;
  End;
end;

procedure TFPedidoCad.CancelaQtdePedido1Click(Sender: TObject);
begin
  inherited;
  If FPedidoCancela = Nil then
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
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[1].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME1Filial.Text),'VENDA');
    If(Trim(FPedidoParam.ME1DataI.Text) = '') OR (Trim(FPedidoParam.ME1DataF.Text) = '') Then
      raise Exception.Create('É necessário informar um período');

    QRPedProduto.Close;
    QRPedProduto.SetVariable('DATA_I',FPedidoParam.ME1DataI.Text);
    QRPedProduto.SetVariable('DATA_F',FPedidoParam.ME1DataF.Text);

    If Trim(FPedidoParam.ME1Filial.Text) = '' then
      QRPedProduto.SetVariable('FILIAL',Null)
    Else
      QRPedProduto.SetVariable('FILIAL',FPedidoParam.ME1Filial.Text);
    If Trim(FPedidoParam.ME1Cadastro.Text) = '' then
      QRPedProduto.SetVariable('CADASTRO',Null)
    Else
      QRPedProduto.SetVariable('CADASTRO',FPedidoParam.ME1Cadastro.Text);
    If Trim(FPedidoParam.ME1Produto.Text) = '' then
      QRPedProduto.SetVariable('PRODUTO',Null)
    Else
      QRPedProduto.SetVariable('PRODUTO',FPedidoParam.ME1Produto.Text);
    If Trim(FPedidoParam.ME1Vendedor.Text) = '' then
      QRPedProduto.SetVariable('VENDEDOR',Null)
    Else
      QRPedProduto.SetVariable('VENDEDOR',FPedidoParam.ME1Vendedor.Text);
    If Trim(FPedidoParam.Me1Cultura.Text) = '' then
      QRPedProduto.SetVariable('COD_CULTURA',Null)
    Else
      QRPedProduto.SetVariable('COD_CULTURA',FPedidoParam.Me1Cultura.Text);
    If Trim(FPedidoParam.ME1Classe.Text) = '' then
      QRPedProduto.SetVariable('CLASSE',Null)
    Else
      QRPedProduto.SetVariable('CLASSE',FPedidoParam.ME1Classe.Text);
    If (Trim(FPedidoParam.ME1SubClasse.Text) = '') or (Trim(FPedidoParam.ME1SubClasse.Text) = '0') then
      QRPedProduto.SetVariable('SUB_CLASSE',Null)
    Else
      QRPedProduto.SetVariable('SUB_CLASSE',FPedidoParam.ME1SubClasse.Text);
    If Trim(FPedidoParam.ME1Lote.Text) = '' then
      QRPedProduto.SetVariable('LOTE',Null)
    Else
      QRPedProduto.SetVariable('LOTE',FPedidoParam.ME1Lote.Text);
    if FPedidoParam.RGSituacao.ItemIndex = 1 then
      QRPedProduto.SetVariable('SITUACAO', '1')
    else
      QRPedProduto.SetVariable('SITUACAO', null);

    case FPedidoParam.Rg1TipoPagto.ItemIndex of
      0 : QRPedProduto.SetVariable('TIPO_PAGTO',Null);
      1 : QRPedProduto.SetVariable('TIPO_PAGTO','A VISTA');
      2 : QRPedProduto.SetVariable('TIPO_PAGTO','A PRAZO');
      3 : QRPedProduto.SetVariable('TIPO_PAGTO','OUTROS');
    end; // Case
    QRPedProduto.SQL[QRPedProduto.SQL.count -1]:='';
    if FPedidoParam.RGOrdem.ItemIndex = 0 then
      QRPedProduto.SQL.add('cod_produto')
    else
      QRPedProduto.SQL.add('Desc_Produto');

    QRPedProduto.Open;
    If FRPedido_Produto = Nil then
      FRPedido_Produto := TFRPedido_Produto.Create(Application);
    FRPedido_Produto.QRLTitulo.Caption := 'Pedidos por Produto ('+FPedidoParam.ME1DataI.text+' - '+FPedidoParam.ME1DataF.Text+')';
    FRPedido_Produto.QRLFilial.Caption := 'Filial: '+FPedidoParam.ED1Filial.Text + ' Classe:' + FPedidoParam.ME1Classe.Text +' '+ FPedidoParam.Ed1Classe.Text;

    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedido_Produto.QRPrimario.Preview
    Else
      FRPedido_Produto.QRPrimario.Print;
    QRPedProduto.Close;
  End;
end;

procedure TFPedidoCad.SBEmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCad = Nil then
    FEmbarqueCad := TFEmbarqueCad.Create(Application);
  FEmbarqueCad.ShowModal;
end;

procedure TFPedidoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SBEmbarque.Enabled := DMPedido.QPedido.State = dsBrowse;
  BtConsProduto.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsLote.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsTributacao.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsCadastro.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsCultura.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsFilial.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsOperacao.Enabled:=DSPrimario.State<>dsBrowse;
  BtConsVendedor.Enabled := DSPrimario.State<>dsBrowse;
  BtConsPrazo.Enabled := DSPrimario.State<>dsBrowse;
  Bitbtn1.Enabled := DSPrimario.State<>dsBrowse;
  Bitbtn2.Enabled := DSPrimario.State<>dsBrowse;
  BtConsMensagem.Enabled := DSPrimario.State<>dsBrowse;
  BtConsDepartamento.Enabled := DSPrimario.State<>dsBrowse;
  BtConsBanco.Enabled := DSPrimario.State<>dsBrowse;
  BtConsOrigem.Enabled:=DSPrimario.State<>dsBrowse;
  SBConsMotivo.Enabled:=DSPrimario.State<>dsBrowse;
end;

procedure TFPedidoCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  DMPedido.ExcluiPedido;
end;

procedure TFPedidoCad.Espelho1Click(Sender: TObject);
Var wLinhas : Integer;
begin
  inherited;
  if FRPedido_Espelho = Nil then
    FRPedido_Espelho := TFRPedido_Espelho.Create(Application);
  DMPedido.QRPedido.Open;
  wLinhas := StrToInt(DMOracle.BuscaNome('SELECT count(*) FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCod_Pedido_Cab.Text));
  If wLinhas >= 9 Then
     FRPedido_Espelho.QRPrimario.Height := 1056
  Else
     FRPedido_Espelho.QRPrimario.Height := 522;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL')  Then
     FRPedido_Espelho.QRPrimario.Height := 1056;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' then
  Begin
    FRPedido_Espelho.QRSubDetail1.Enabled := True;
    DMPedido.QRMaterial.Close;
    DMPedido.QRMaterial.SetVariable('PEDIDO',DMPedido.QPedidoCod_Pedido_Cab.Text);
    DMPedido.QRMaterial.Open;
  end;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'LUNASA' then
  Begin
    FRPedido_Espelho.Qrlabel13.Left := 614;
    FRPedido_Espelho.Qrlabel11.Left := 574;
    FRPedido_Espelho.Qrlabel9.Left := 683;
    FRPedido_Espelho.Qrlabel17.Left := 609;
    FRPedido_Espelho.QrlTOTAL.Left := 658;
    FRPedido_Espelho.Qrlabel28.Enabled := False;
    FRPedido_Espelho.Qrlabel10.Enabled := False;
    FRPedido_Espelho.Qrlabel3.Enabled := False;
    FRPedido_Espelho.QRDBText32.Enabled := False;
    FRPedido_Espelho.QRDBText33.Enabled := False;
    FRPedido_Espelho.QRDBText30.Enabled := False;
    FRPedido_Espelho.QRDBText31.Left := 613;
    FRPedido_Espelho.QRDBText34.Left := 682;
    FRPedido_Espelho.QRDBText11.Left := 555;
    FRPedido_Espelho.QRDBText7.Width := 495;

  End;
  FRPedido_Espelho.QRPrimario.Preview;
  DMPedido.QRPedido.Close;
  DMPedido.QRMaterial.Close;
end;

procedure TFPedidoCad.PedidosCancelados1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[2].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME2Filial.Text),'VENDA');
    QRPedido_Cancelado.Close;
    QRPedido_Cancelado.SetVariable('DATA_I',FPedidoParam.ME2DataI.Text);
    QRPedido_Cancelado.SetVariable('DATA_F',FPedidoParam.ME2DataF.Text);

    if Trim(FPedidoParam.ME2Filial.Text) = '' then
      QRPedido_Cancelado.SetVariable('FILIAL',Null)
    else
      QRPedido_Cancelado.SetVariable('FILIAL',FPedidoParam.ME2Filial.Text);
    if Trim(FPedidoParam.ME2Cadastro.Text) = '' then
      QRPedido_Cancelado.SetVariable('CADASTRO',Null)
    Else
      QRPedido_Cancelado.SetVariable('CADASTRO',FPedidoParam.ME2Cadastro.Text);
    If Trim(FPedidoParam.ME2Produto.Text) = '' then
      QRPedido_Cancelado.SetVariable('PRODUTO',Null)
    Else
      QRPedido_Cancelado.SetVariable('PRODUTO',FPedidoParam.ME2Produto.Text);
    If Trim(FPedidoParam.ME2Vendedor.Text) = '' then
      QRPedido_Cancelado.SetVariable('VENDEDOR',Null)
    Else
      QRPedido_Cancelado.SetVariable('VENDEDOR',FPedidoParam.ME2Vendedor.Text);
    QRPedido_Cancelado.Open;
    If FRPedido_Cancelado = Nil then
      FRPedido_Cancelado := TFRPedido_Cancelado.Create(Application);
    FRPedido_Cancelado.QRLTitulo.Caption := 'Pedidos Cancelados ('+FPedidoParam.ME2DataI.text+' - '+FPedidoParam.ME2DataF.Text+')';
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedido_Cancelado.QRPrimario.Preview
    Else
      FRPedido_Cancelado.QRPrimario.Print;
    QRPedido_Cancelado.Close;
  End;

end;

procedure TFPedidoCad.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If Key = Chr(43) Then
  Begin
      OracleNavigator1.BtnClick(NbInsert);
      DbEdit21.SetFocus;
  End;
  If Key = Chr(45) Then
  Begin
      OracleNavigator1.BtnClick(NbDelete);
      DbEdit21.SetFocus;
  End;

end;

procedure TFPedidoCad.Pedidosnoperiodo1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = Nil then
     FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[3].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME4Filial.Text),'VENDA');
    If ( Trim(FPedidoParam.ME4Data_I.Text) = '') OR (Trim(FPedidoParam.ME4Data_F.Text)='') Then
      raise Exception.Create('É necessário informar um período');
    with DMPedido do
    begin
      QRPedidoPeriodo.Close;
      QRPedidoPeriodo.Sql.Clear;
      QRPedidoPeriodo.Sql.Add('SELECT Tb_pedido_cab.NUM_PEDIDO, Tb_pedido_cab.DT_EMISSAO, Tb_pedido_cab.COD_CADASTRO, Tb_cadastro.NOME,');
      QRPedidoPeriodo.Sql.Add('SUM((QT_PEDIDO*TB_PEDIDO_ITEM.VAL_UNITARIO) -' );
      QRPedidoPeriodo.Sql.Add('((QT_PEDIDO*TB_PEDIDO_ITEM.VAL_UNITARIO) * DECODE(TB_PEDIDO_ITEM.perc_desconto,0,1,TB_PEDIDO_ITEM.perc_desconto)/ 100) - ');
      QRPedidoPeriodo.Sql.Add('((QT_PEDIDO*TB_PEDIDO_ITEM.VAL_UNITARIO) * DECODE(NVL(TB_PEDIDO_ITEM.perc_desconto1,0),0,1,TB_PEDIDO_ITEM.perc_desconto1)/ 100) - ');
      QRPedidoPeriodo.Sql.Add('((QT_PEDIDO*TB_PEDIDO_ITEM.VAL_UNITARIO) * DECODE(NVL(TB_PEDIDO_ITEM.perc_desconto2,0),0,1,TB_PEDIDO_ITEM.perc_desconto2)/ 100) + ');
      QRPedidoPeriodo.Sql.Add('((QT_PEDIDO*TB_PEDIDO_ITEM.VAL_UNITARIO) * DECODE(NVL(TB_PEDIDO_ITEM.perc_acrescimo,0),0,1,TB_PEDIDO_ITEM.perc_acrescimo)/ 100)) AS SVAL_TOTAL ');
      QRPedidoPeriodo.Sql.Add('FROM TB_PEDIDO_CAB Tb_pedido_cab, TB_CADASTRO Tb_cadastro, TB_PEDIDO_ITEM Tb_pedido_item');
      QRPedidoPeriodo.Sql.Add('WHERE (Tb_pedido_cab.COD_CADASTRO = Tb_cadastro.COD_CADASTRO) AND (Tb_pedido_item.COD_PEDIDO_CAB = Tb_pedido_cab.COD_PEDIDO_CAB) ');
      if Trim(FPedidoParam.Me4Cadastro.Text) <> '' then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.COD_FILIAL =  ' + Trim(FPedidoParam.ME4Filial.Text));
      if Trim(FPedidoParam.Me4Cadastro.Text) <> '' then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.COD_CADASTRO =  ' + Trim(FPedidoParam.ME4Cadastro.Text));
      if Trim(FPedidoParam.Me4Origem.Text) <> '' then
        QRPedidoPeriodo.Sql.Add(' And Tb_pedido_item.COD_ORIGEM =  ' + Trim(FPedidoParam.ME4Origem.Text));
      Case FPedidoParam.Rg4TipoPagamento.ItemIndex Of
        1 : QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'A VISTA' + Chr(39));
        2 : QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'A PRAZO' + Chr(39));
        3 : QRPedidoPeriodo.Sql.Add(' And Tb_pedido_cab.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'OUTROS'  + Chr(39));
      End;
      QRPedidoPeriodo.Sql.Add (' AND TB_PEDIDO_CAB.DT_EMISSAO >= ' + chr(39)+ FPedidoParam.ME4Data_I.Text + chr(39));
      QRPedidoPeriodo.Sql.Add (' AND TB_PEDIDO_CAB.DT_EMISSAO <= ' + chr(39)+ FPedidoParam.ME4Data_F.Text + chr(39));
      QRPedidoPeriodo.Sql.Add (' GROUP BY Tb_pedido_cab.NUM_PEDIDO, Tb_pedido_cab.DT_EMISSAO, Tb_pedido_cab.COD_CADASTRO, Tb_cadastro.NOME');
      QRPedidoPeriodo.Open;
      if FRPedido_Periodo = Nil then
        FRPedido_Periodo := TFRPedido_Periodo.Create(Application);
      FRPedido_Periodo.QRLEmpresa.Caption := FPedidoParam.ME4Filial.Text+'-'+FPedidoParam.Ed4Filial.Text;
      FRPedido_Periodo.QRLTitulo.Caption := 'Pedidos no periodo ('+FPedidoParam.ME4Data_I.text+' - '+FPedidoParam.ME4Data_F.Text+')' + '  Origem do Produto : '+ FPedidoParam.ME4Origem.text;
      If FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Periodo.QRPrimario.Preview
      Else
        FRPedido_Periodo.QRPrimario.Print;
      QRPedidoPeriodo.Close;
    end;
  End;
end;

procedure TFPedidoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(14);
end;

procedure TFPedidoCad.AcompanhamentoPedidos1Click(Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[4].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME5Filial.Text),'VENDA');
    If(Trim(FPedidoParam.ME5Data_I.Text) = '') OR (Trim(FPedidoParam.ME5Data_F.Text) = '') Then
      raise Exception.Create('É necessário informar um período');
    QRPedido_Acomp.Close;
    QRPedido_Acomp.SetVariable('DATA_I',FPedidoParam.ME5Data_I.Text);
    QRPedido_Acomp.SetVariable('DATA_F',FPedidoParam.ME5Data_F.Text);
    If Trim(FPedidoParam.ME5Filial.Text) = '' then
      QRPedido_Acomp.SetVariable('FILIAL',Null)
    Else
      QRPedido_Acomp.SetVariable('FILIAL',FPedidoParam.ME5Filial.Text);
    If Trim(FPedidoParam.ME5Vendedor.Text) = '' then
      QRPedido_Acomp.SetVariable('COD_VENDEDOR',Null)
    Else
      QRPedido_Acomp.SetVariable('COD_VENDEDOR',FPedidoParam.ME5Vendedor.Text);
    If Trim(FPedidoParam.Me5Cadastro.Text) = '' then
      QRPedido_Acomp.SetVariable('COD_CADASTRO',Null)
    Else
      QRPedido_Acomp.SetVariable('COD_CADASTRO',FPedidoParam.Me5Cadastro.Text);
    If Trim(FPedidoParam.Fm5Produto.MeProduto.Text) = '' then
      QRPedido_Acomp.SetVariable('COD_PRODUTO',Null)
    Else
      QRPedido_Acomp.SetVariable('COD_PRODUTO',FPedidoParam.Fm5Produto.MeProduto.Text);
    Case FPedidoParam.Rg5TipoPagamento.ItemIndex Of
      0 : QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO',Null);
      1 : QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO','A VISTA');
      2 : QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO','A PRAZO');
      3 : QRPedido_Acomp.SetVariable('IND_TIPO_PAGTO','OUTROS');
    End;
    QRPedido_Acomp.Open;
    If FRPedido_Acomp = Nil then
      FRPedido_Acomp := TFRPedido_Acomp.Create(Application);
    FRPedido_Acomp.QRLTitulo.Caption := 'Acompanhamento de Pedidos ('+FPedidoParam.ME5Data_I.text+' - '+FPedidoParam.ME5Data_F.Text+')';
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedido_Acomp.QRPrimario.Preview
    Else
      FRPedido_Acomp.QRPrimario.Print;
    QRPedido_Acomp.Close;
  End;

end;

procedure TFPedidoCad.PedidosAbertoscomPreoMdio1Click(Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[5].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME6Filial.Text),'VENDA');  
    QRPedido_Preco_Medio.Close;

    If Trim(FPedidoParam.ME6Filial.Text) = '' then
      QRPedido_Preco_Medio.SetVariable('FILIAL',Null)
    Else
      QRPedido_Preco_Medio.SetVariable('FILIAL',FPedidoParam.ME6Filial.Text);

    If Trim(FPedidoParam.ME6Produto.Text) = '' then
      QRPedido_Preco_Medio.SetVariable('PRODUTO',Null)
    Else
      QRPedido_Preco_Medio.SetVariable('PRODUTO',FPedidoParam.ME6Produto.Text);

    If Trim(FPedidoParam.ME6Vendedor.Text) = '' then
      QRPedido_Preco_Medio.SetVariable('VENDEDOR',Null)
    Else
      QRPedido_Preco_Medio.SetVariable('VENDEDOR',FPedidoParam.ME6Vendedor.Text);

    If Trim(FPedidoParam.ME6DataI.Text) <> '' then
      QRPedido_Preco_Medio.SetVariable('DATA_I',FPedidoParam.ME6DataI.Text)
    else
      raise exception.Create('Data Inicial não pode ficar em Branco !!');
    If Trim(FPedidoParam.ME6DataF.Text) <> '' then
      QRPedido_Preco_Medio.SetVariable('DATA_F',FPedidoParam.ME6DataF.Text)
    else
      raise exception.Create('Data Final não pode ficar em Branco !!');

    Case FPedidoParam.Rg6TipoPagamento.ItemIndex Of
      0 : QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO',Null);
      1 : QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO','A VISTA');
      2 : QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO','A PRAZO');
      3 : QRPedido_Preco_Medio.SetVariable('IND_TIPO_PAGTO','OUTROS');
    End;
    QRPedido_Preco_Medio.Open;
    If FRPedido_Preco_Medio = Nil then
      FRPedido_Preco_Medio := TFRPedido_Preco_Medio.Create(Application);
      FRPedido_Preco_Medio.QRLTitulo.Caption := 'Pedidos Abertos com Preço Médio('+FPedidoParam.ME6DataI.text+' - '+FPedidoParam.ME6DataF.Text+')';
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedido_Preco_Medio.QRPrimario.Preview
    Else
      FRPedido_Preco_Medio.QRPrimario.Print;
    QRPedido_Preco_Medio.Close;
  End;

end;

procedure TFPedidoCad.PedidosAbertosporVencimento1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = Nil then
     FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[6].TabVisible := True;

  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME7Filial.Text),'VENDA');
    If(Trim(FPedidoParam.ME7DataI.Text) = '') OR (Trim(FPedidoParam.ME7DataF.Text) = '') Then
      raise Exception.Create('É necessário informar um período');

    QRPedAberto_Venc.Close;
    if Trim(FPedidoParam.ME7Filial.Text) = '' then
      QRPedAberto_Venc.SetVariable('FILIAL',Null)
    else
      QRPedAberto_Venc.SetVariable('FILIAL',FPedidoParam.ME7Filial.Text);

    if Trim(FPedidoParam.ME7Cadastro.Text) = '' then
      QRPedAberto_Venc.SetVariable('CADASTRO',Null)
    else
      QRPedAberto_Venc.SetVariable('CADASTRO',FPedidoParam.ME7Cadastro.Text);

    if Trim(FPedidoParam.ME7Produto.Text) = '' then
      QRPedAberto_Venc.SetVariable('PRODUTO',Null)
    Else
      QRPedAberto_Venc.SetVariable('PRODUTO',FPedidoParam.ME7Produto.Text);

    QRPedAberto_Venc.SetVariable('DATA_I',FPedidoParam.ME7DataI.Text);
    QRPedAberto_Venc.SetVariable('DATA_F',FPedidoParam.ME7DataF.Text);

    QRPedAberto_Venc.Open;
    if FRPedAberto_Venc = Nil then
       FRPedAberto_Venc := TFRPedAberto_Venc.Create(Application);
    FRPedAberto_Venc.QRLTitulo.Caption := 'Pedidos Abertos por Vencimento ('+FPedidoParam.ME7DataI.text+' - '+FPedidoParam.ME7DataF.Text+')';
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
  With DMPedido do
  Begin
    QPedido.Close;
    QPedidoItem.Close;
    QSomaPedido.Close;
    QUltimosPedidos_Itens.Close;
  End;
  DMEstoque.QEstoqueCons.Close;
  Action := CaFree;
  FPedidoCad := Nil;
end;

procedure TFPedidoCad.PosioPedidosCEstoque1Click(Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[7].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME8Filial.Text),'VENDA');
    If(Trim(FPedidoParam.ME8Data_I.Text) = '') OR (Trim(FPedidoParam.ME8Data_F.Text) = '') Then
      raise Exception.Create('É necessário informar um período');
    QRPedidoEstoque.Close;
    QRPedidoEstoque.SetVariable('DATA_I',FPedidoParam.ME8Data_I.Text);
    QRPedidoEstoque.SetVariable('DATA_F',FPedidoParam.ME8Data_F.Text);
    If Trim(FPedidoParam.ME8Filial.Text) = '' then
     Begin
       QRPedidoEstoque.SetVariable('FILIAL',Null);
       DMPedido.pFilial := 0;  // para usar no calcfields
     End
    Else
     Begin
       QRPedidoEstoque.SetVariable('FILIAL',FPedidoParam.ME8Filial.Text);
       DMPedido.pFilial := StrToInt(Trim(FPedidoParam.ME8Filial.Text));  // para usar no calcfields
     End;
    If Trim(FPedidoParam.ME8Cultura.Text) = '' then
       QRPedidoEstoque.SetVariable('CULTURA',Null)
    Else
       QRPedidoEstoque.SetVariable('CULTURA',FPedidoParam.ME8Cultura.Text);
    If Trim(FPedidoParam.ME8Cadastro.Text) = '' then
       QRPedidoEstoque.SetVariable('CADASTRO',Null)
    Else
       QRPedidoEstoque.SetVariable('CADASTRO',FPedidoParam.ME8Cadastro.Text);
    If Trim(FPedidoParam.ME8Produto.Text) = '' then
       QRPedidoEstoque.SetVariable('PRODUTO',Null)
    Else
       QRPedidoEstoque.SetVariable('PRODUTO',FPedidoParam.ME8Produto.Text);
    If Trim(FPedidoParam.ME8Vendedor.Text) = '' then
       QRPedidoEstoque.SetVariable('VENDEDOR',Null)
    Else
       QRPedidoEstoque.SetVariable('VENDEDOR',FPedidoParam.ME8Vendedor.Text);
    If Trim(FPedidoParam.ME8Classe.Text) = '' then
       QRPedidoEstoque.SetVariable('CLASSE',Null)
    Else
       QRPedidoEstoque.SetVariable('CLASSE',FPedidoParam.ME8Classe.Text);
    If (Trim(FPedidoParam.ME8SubClasse.Text) = '') or (Trim(FPedidoParam.ME8SubClasse.Text) = '0') then
       QRPedidoEstoque.SetVariable('SUB_CLASSE',Null)
    Else
       QRPedidoEstoque.SetVariable('SUB_CLASSE',FPedidoParam.ME8SubClasse.Text);
    QRPedidoEstoque.SQL[QRPedidoEstoque.SQL.count -1]:='';
    If FPedidoParam.Rg8Ordem.ItemIndex = 0 Then
       QRPedidoEstoque.Sql.Add('Order By Cod_Produto')
    Else
       QRPedidoEstoque.Sql.Add('Order By Desc_Produto');
    QRPedidoEstoque.Open;
    If FRPedidoEstoque = Nil then
       FRPedidoEstoque := tFRPedidoEstoque.Create(Application);
    FRPedidoEstoque.QRLTitulo.Caption := 'Pedidos por Produto ('+FPedidoParam.ME8Data_I.text+' - '+FPedidoParam.ME8Data_F.Text+')';
    FRPedidoEstoque.QRLFilial.Caption := 'Filial:'+FPedidoParam.Ed8Filial.Text;
    If Trim(FPedidoParam.ME8Cultura.Text) <> '' then
       FRPedidoEstoque.QRLFilial.Caption := FRPedidoEstoque.QRLFilial.Caption + ' Cultura:'+FPedidoParam.Ed8Cultura.Text;

    If FPedidoParam.RGPreview.ItemIndex = 0 then
       FRPedidoEstoque.QRPrimario.Preview
    Else
       FRPedidoEstoque.QRPrimario.Print;
    QRPedidoEstoque.Close;
  End;
end;

procedure TFPedidoCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Produto_Aux.Value := Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFPedidoCad.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Produto.Value := DMProduto.QProdutoConsCod_Produto.Value;
end;

procedure TFPedidoCad.OramentoviaWord1Click(Sender: TObject);
var
  table, Document, Range : Variant;
  wTotalPedido, wTotalProdutos, wTotalCusto : real;
  wCont:Integer;
  wCodProduto : String;
begin
  wTotalCusto := 0;
  wTotalPedido := 0;
  wTotalProdutos := 0;
  wCont:=1;
  if Trim(DBECodPedido.Text) = '' then
     raise exception.Create('É necessario que um pedido seja selecionado!');

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',DBEdit2.Text);
    QFilial.Open;
  end;
  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',DBEdit5.Text);
    QCadastro.Open;
  end;

  NewWord := GetOrCreateObject( 'Word.Application' );
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
  Range.Text := 'FILIAL  : '+DMFilial.QFilialDesc_Filial.Text;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(4).Range;
  Range.Text := 'ENDEREÇO: '+DMFilial.QFilialDESC_ENDERECO.Text+' '+
  DMFilial.QFilialDESC_CIDADE.Text+' TELEFONE : '+DMFilial.QFilialDESC_TELEFONE.Text;;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(6).Range;
  Range.Text := 'CADASTRO: '+DBedit5.Text+'-'+DMCadastro.QCadastroNome.Text;
  Document.Paragraphs.Item(6).Alignment := '0';

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(7).Range;
  Range.Text := 'ENDEREÇO: '+DMCadastro.QCadastroDESC_ENDERECO.Value;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(8).Range;
  Range.Text := 'CIDADE  : '+Trim(DMCadastro.QCadastroDESC_CIDADE.Value)+'-'+'UF: '+
                             Trim(DMCadastro.QCadastroCOD_ESTADO.Value)+'   CEP : '+
                             Trim(DMCadastro.QCadastroDESC_CEP.Value)+
                             '    TELEFONE: '+DMCadastro.QCadastroDESC_TELEFONE.Value;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(10).Range;
  Range.Text := 'VENDEDOR: '+DBEdit4.Text+'-'+DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+FloatToStr(DMPedido.QPedidoCod_Vendedor.Value));

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(12).Range;
  Range.Text := 'Nº. PEDIDO: '+DBEdit6.Text+'             DATA EMISSÃO: '+DBEdit8.Text+
                '          VENCIMENTO: '+DBEdit26.Text;
  Range.Bold := 1;
  Range.Font.Size := 10;

  Document.Paragraphs.Add;
  Range.Bold := 0;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(16).Range;
  Range.Text := 'OBSERVAÇÃO : '+DMPedido.QPedidoDESC_OBSERVACAO.Value;

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
  Range.Text := DMFilial.QFilialDESC_CIDADE.Value+', '+Copy(DateToStr(Date),1,2)+' de '+
  Bib.NomeMes(StrToInt(Copy(DateToStr(Date),4,2)))+' '+Copy(DateToStr(Date),7,4);
  Document.Paragraphs.Item(22).Alignment := '1';

  Range := Document.Paragraphs.Item(14).Range;
  table := Document.Tables.Add(Range,1,6); // novoDoc.Tables.Add(Selection.Range, 3, 5)
  table.Cell(1,1).Width:= '0.90';
  table.Cell(1,2).Width:= '1.61';
  table.Cell(1,3).Width:= '1.39';
  table.Cell(1,4).Width:= '8.31';
  table.Cell(1,5).Width:= '1.71';
//  table.Cell(1,6).Width:= '1.51';
  table.Cell(1,6).Width:= '1.89';
  table.Cell(1,1).Range.Text:='Item';
  table.Cell(1,2).Range.Text:='Código';
  table.Cell(1,3).Range.Text:='Quant.';
  table.Cell(1,4).Range.Text:='Descrição Produto/Serviço';
  table.Cell(1,5).Range.Text:='Unitário';
//  table.Cell(1,6).Range.Text:='% Desc.    ';
  table.Cell(1,6).Range.Text:='Total';
  //table.Font.Bold = True
  table.Rows.Add;
  DMPedido.QPedidoItem.First;
  while not DMPedido.QPedidoItem.eof do
  begin
    With DMPedido Do
    Begin
      if DMParamSistema.QParamSistemaCod_Empresa.Text = 'ARZ' then
      Begin
        table.Cell(QPedidoItem.RecNo+1,1).Range.Text:=Bib.NumToTexto(wCont,0,3);
      end;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
        table.Cell(QPedidoItem.RecNo+1,2).Range.Text:=QPedidoItemNUM_FABRICANTE.Value
      Else
        table.Cell(QPedidoItem.RecNo+1,2).Range.Text:=Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value,0,10);
      table.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
      table.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
//      if QPedidoItemPERC_DESCONTO.Value > 0 then
//         table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
      table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
      wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
      If QPedidoItemPERC_DESCONTO.Value > 0 Then
         wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
      Else
         wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
      wCont:=wCont+1;
      QPedidoItem.Next;
    End;
    table.Rows.Add;
  end;

  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo+3,4).Range.Text:=
        'TOTAL DO(S) PRODUTO(S) .........: ';

  table.Cell(DMPedido.QPedidoItem.RecNo+3,6).Range.Text:=
             Bib.NumToTexto(wTotalProdutos,2,10);

  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo+4,4).Range.Text:=
        'DESCONTO ...............................: ';

  table.Cell(DMPedido.QPedidoItem.RecNo+4,6).Range.Text:=
             Bib.NumToTexto(DMPedido.QPedidoVAL_DESCONTO.Value,2,10);

  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo+5,4).Range.Text:=
        'TOTAL DO PEDIDO ..............................: ';

  table.Cell(DMPedido.QPedidoItem.RecNo+5,6).Range.Text:=
             Bib.NumToTexto(wTotalPedido - DMPedido.QPedidoVAL_DESCONTO.Value,2,10);

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
  Range.Text :='Relação Produtos Em Estoque';
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Range.Text :='------------------------------------';
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
  Range.Text :='Código      Produto                                        Custo         Quantidade';
  Document.Paragraphs.Add;
  With DMPedido Do
  Begin
    while not DMPedido.QPedidoItem.Eof do
    begin
      QPedidoEstoque.Close;
      QPedidoEstoque.SetVariable('COD_PRODUTO',QPedidoItemCOD_PRODUTO.Value);
      QPedidoEstoque.Open;
      Document.Paragraphs.Add;
      Range := Document.Paragraphs.Item(Document.Paragraphs.Count).Range;
      if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DINIZ' then
        wCodProduto:=QPedidoItemNUM_FABRICANTE.Text
      Else
        wCodProduto:=QPedidoItemCOD_PRODUTO.Text;

      Range.Text := Bib.FormataTexto(wCodProduto,14)+' |  '+Bib.FormataTexto(Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value))),30)
      +' |  '+Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueVL_ULTIMO_CUSTO.Value,2,8),10)+' |  '+Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueQT_QUANTIDADE.Value,0,10),10);
      QPedidoItem.Next;
    End;
  end;
end;

function TFPedidoCad.GetOrCreateObject(const ClassName: string): IDispatch;
var
  ClassID: TGUID;
  Unknown: IUnknown;
begin
  ClassID := ProgIDToClassID (ClassName);
  if Succeeded (GetActiveObject (ClassID, nil, Unknown)) then
     OleCheck(Unknown.QueryInterface (IDispatch, Result))
  else
     Result := CreateOleObject (ClassName);
end;

procedure TFPedidoCad.DBEdit5Exit(Sender: TObject);
Var wPedido,wCgc,wCgc1 : String;
    I : Integer;
begin
  inherited;
  If Trim(DMPedido.QPedidoCod_Cadastro.Text) <> '' Then
   Begin
      If (DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO') Then
      Begin
        LblFormaCompra.Caption := DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc '+DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
        LblAutoriza.Caption := 'Autorizado:'+DMOracle.BuscaNome('SELECT NOME_CONTATO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        LblAutoriza.Caption := LblAutoriza.Caption+'-'+DMOracle.BuscaNome('SELECT NOME_CONTATO2 FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
        LblAutoriza.Caption := LblAutoriza.Caption+' Oper:'+DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
      End;
     DMPedido.QPedidoCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
     If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
      Begin
        If (DMPedido.QPedidoCod_Departamento.Value = 12) Then
           If DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text) = 'PR' Then
             DMPedido.QPedidoCod_Mensagem.Value := 3
           Else
             DMPedido.QPedidoCod_Mensagem.Value := 8;
        If DMPedido.QPedidoCOD_FILIAL.Value = 9 Then
           DMPedido.QPedidoCod_Mensagem.Value := 49;
      End;
   End
  else
   Begin
     LblAutoriza.Caption := '';
     LblFormaCompra.Caption := '';
   End;
end;

procedure TFPedidoCad.PedidoscomNotaFiscal1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[8].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FPedidoParam.ME34Filial.Text),'VENDA');
    QRPedidoComNota.Close;
    if Trim(FPedidoParam.ME34Filial.Text) = '' then
      QRPedidoComNota.SetVariable('COD_FILIAL',Null)
    else
      QRPedidoComNota.SetVariable('COD_FILIAL',trim(FPedidoParam.ME34Filial.Text));

    if Trim(FPedidoParam.ME34Cadastro.Text) = '' then
      QRPedidoComNota.SetVariable('COD_CADASTRO',Null)
    Else
      QRPedidoComNota.SetVariable('COD_CADASTRO',trim(FPedidoParam.ME34Cadastro.Text));

    if Trim(FPedidoParam.ME34Vendedor.Text) = '' then
      QRPedidoComNota.SetVariable('COD_VENDEDOR',Null)
    Else
      QRPedidoComNota.SetVariable('COD_VENDEDOR',trim(FPedidoParam.ME34Vendedor.Text));

    if Trim(FPedidoParam.ME34DT_Emissao_I.Text) <> '' then
      QRPedidoComNota.SetVariable('DT_EMISSAO_I',trim(FPedidoParam.ME34DT_Emissao_I.Text));

    if Trim(FPedidoParam.ME34DT_Emissao_F.Text) <> '' then
      QRPedidoComNota.SetVariable('DT_EMISSAO_F',trim(FPedidoParam.ME34DT_Emissao_F.Text));

    if Trim(FPedidoParam.ME34Motivo.Text) = '' then
      QRPedidoComNota.SetVariable('MOTIVO',Null)
    else
      QRPedidoComNota.SetVariable('MOTIVO',Trim(FPedidoParam.ME34Motivo.Text));

    if Trim(FPedidoParam.ME34Operacao1.Text) <> '' then
      QRPedidoComNota.SetVariable('COD_OPERACAO1',Trim(FPedidoParam.ME34Operacao1.Text));
    if Trim(FPedidoParam.ME34Operacao2.Text) <> '' then
      QRPedidoComNota.SetVariable('COD_OPERACAO2',Trim(FPedidoParam.ME34Operacao2.Text));
    if Trim(FPedidoParam.ME34Operacao3.Text) <> '' then
      QRPedidoComNota.SetVariable('COD_OPERACAO3',Trim(FPedidoParam.ME34Operacao3.Text));
    if Trim(FPedidoParam.ME34Operacao4.Text) <> '' then
      QRPedidoComNota.SetVariable('COD_OPERACAO4',Trim(FPedidoParam.ME34Operacao4.Text));

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
    begin
      QRPedidoComNota.SQL.Add('ORDER BY DESC_MOTIVO, COD_PEDIDO_CAB');
    end;

    QRPedidoComNota.Open;
    If FRPedidoComNota = Nil then
      FRPedidoComNota := TFRPedidoComNota.Create(Application);

    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
    begin
      FRPedidoComNota.QRGroup1.Enabled := true;
      QRPedidoComNota.SQL[QRPedidoComNota.SQL.Count - 1] := '';
    end;
    FRPedidoComNota.QRLFilial.Caption:=FPedidoParam.ME34Filial.Text+' '+FPedidoParam.Ed34Filial.Text;
    FRPedidoComNota.QRLCliente.Caption:=FPedidoParam.ME34Cadastro.Text+' '+FPedidoParam.Ed34Cadastro.Text;
    FRPedidoComNota.QRLVendedor.Caption:=FPedidoParam.ME34Vendedor.Text+' '+FPedidoParam.Ed34Vendedor.Text;
    FRPedidoComNota.QRLMotivo.Caption:='Motivo: '+ FPedidoParam.Ed34Motivo.Text+'  Operações: '
                                       +FPedidoParam.Me34Operacao1.Text+', '+FPedidoParam.Me34Operacao2.Text+', '
                                       +FPedidoParam.Me34Operacao3.Text+', '+FPedidoParam.Me34Operacao4.Text;
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedidoComNota.QRPrimario.Preview
    Else
      FRPedidoComNota.QRPrimario.Print;
    QRPedidoComNota.Close;
  end;
end;

procedure TFPedidoCad.DBEdit21Change(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_empresa.Value <> 'TEMPERMED') And
     (DMParamSistema.QParamSistemaCod_empresa.Value <> 'MOINHO') then
  Begin
    If (DbEdit21.Text <> '') And (DMPedido.QpedidoCod_Cadastro.Text <> '') Then
    Begin
      DMPedido.QUltimosPedidos_Itens.Close;
      DMPedido.QUltimosPedidos_Itens.SetVariable('Cadastro',DMPedido.QpedidoCod_Cadastro.Value);
      DMPedido.QUltimosPedidos_Itens.SetVariable('Produto',DBEdit21.Text);
      DMPedido.QUltimosPedidos_Itens.Open;
    End;
    If (DbEdit21.Text <> '') Then
    Begin
      DMEstoque.QEstoqueCons.Close;
      DMEstoque.QEstoqueCons.SetVariable('Filial',Null);
      DMEstoque.QEstoqueCons.SetVariable('Produto',Null);
      DMEstoque.QEstoqueCons.SetVariable('Tipo_Lote',Null);
      DMEstoque.QEstoqueCons.SetVariable('Cod_Produto',DbEdit21.Text);
      DMEstoque.QEstoqueCons.Open;
    End;
  End;
end;

procedure TFPedidoCad.SBCancelarClick(Sender: TObject);
begin
  DMPedido.QPedidoItem.Cancel;
  inherited;

end;

procedure TFPedidoCad.BtConsPrazoClick(Sender: TObject);
begin
  inherited;
  If FPrazoVencimentoCons = Nil then
    FPrazoVencimentoCons := TFPrazoVencimentoCons.Create(Application);
  If FPrazoVencimentoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Prazo_Vencimento.Value := DMPrazoVencimento.QPrazoVencimento_ConsCod_Prazo_Vencimento.Value;

end;

procedure TFPedidoCad.DBEdit3Exit(Sender: TObject);
begin
  inherited;
  If DMpedido.QPedidoCod_Operacao.Text <> '' Then
   Begin
     If DMOperacao.QOperacaoIND_LIBERADO.Value <> 'S' Then  // cadastro de operacao esta sendo aberto no on validate da query
      Begin
       DbEdit3.SetFocus;
       Raise Exception.Create ('Operação Não Liberada Para Uso');
      End;
      If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
      Begin
        If DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'V' Then
           DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A VISTA';
        If DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'P' Then
           DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
        If DMOperacao.QOperacaoIND_TIPO_PAGAMENTO.Value = 'O' Then
           DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'OUTROS';
      End;
    If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
      If Trim(DBEdit51.Text) = '12' Then
       Begin
        If DMOperacao.QOperacaoInd_Bonificacao.Value = 'S' Then
           DMPedido.QPedidoCod_Mensagem.Value := 16;
        If DMOperacao.QOperacaoInd_Troca.Value = 'S' Then
           DMPedido.QPedidoCod_Mensagem.Value := 17;
       End;
   End;
end;

procedure TFPedidoCad.SpeedButton1Click(Sender: TObject);
Var wRetorno,wNotaCab : String;
begin
  inherited;
  wRetorno := DMOracle.BuscaNome('SELECT COD_NOTA_ITEM FROM TB_BAIXA_PEDIDO','COD_PEDIDO_ITEM = '+DMPedido.QPedidoItemCod_Pedido_Item.Text);
  If wRetorno <> '' Then
   Begin
     wNotaCab := DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_ITEM','COD_NOTA_ITEM = '+wRetorno);
     If FNotaSaidaCad = Nil then
        FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
     DMNotaSaida.QNotaSaida.Close;
     DMNotaSaida.QNotaSaida.SetVariable('PK',wNotaCab);
     DMTela.VerificaTela('VENDA',FNotaSaidaCad.Caption,FNotaSaidaCad.Name);
     FNotaSaidaCad.ShowModal;
   End;
end;

procedure TFPedidoCad.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  If DMPedido.DSPedidoItem.State = DsInsert Then
     MELinha.SetFocus;
end;

procedure TFPedidoCad.BtCopiaClick(Sender: TObject);
Var wVlCampo : array[0..350,0..300] of string;
    wCont : Integer;
    wRegistro,i: Integer;
begin
  with DMPedido do
  begin
    wRegistro:=-1;
    DSPedidoItem.DataSet.first;
    while not(DSPedidoItem.DataSet.eof) do
    begin
      wRegistro:=wRegistro+1;
      For wCont := 0 to DSPedidoItem.DataSet.FieldCount -1 do
      Begin
        if DSPedidoItem.Dataset.Fields[wCont].Text = '0,00%' then
           wVlCampo[wCont,wRegistro] := DSPedidoItem.Dataset.Fields[wCont].Text;
        wVlCampo[wCont,wRegistro] := Bib.LimpaString(DSPedidoItem.Dataset.Fields[wCont].Text,'%');
      End;
      DSPedidoItem.DataSet.next;
    End;

    inherited;

    for i:=0 to wRegistro do
    begin
      DSPedidoItem.DataSet.Insert;
      For wCont := 0 to DSPedidoItem.DataSet.FieldCount -1 do
        if (DSPedidoItem.DataSet.Fields[wCont].Text = '')or(DSPedidoItem.DataSet.Fields[wCont].Text = '0')
            or (DSPedidoItem.DataSet.Fields[wCont].Text = '0,00') or (DSPedidoItem.DataSet.Fields[wCont].Text = '0,00%')then
          DSPedidoItem.DataSet.Fields[wCont].Text := wVlCampo[wCont,i];
      DSPedidoItem.DataSet.Post;
    end;
  end;
end;
procedure TFPedidoCad.BtConsCulturaClick(Sender: TObject);
begin
  inherited;
  If FCulturaCons = Nil then
    FCulturaCons := TFCulturaCons.Create(Application);
  If FCulturaCons.ShowModal = mrOk then
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
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[9].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    QRPedidoValor.Close;
    If Trim(FPedidoParam.Me9Filial.Text) <>'' Then
      QRPedidoValor.SetVariable('FILIAL',Trim(FPedidoParam.Me9Filial.Text))
    Else
      QRPedidoValor.SetVariable('FILIAL',null);
    If Trim(FPedidoParam.Me9Cadastro.Text) = '' then
      QRPedidoValor.SetVariable('CADASTRO',Null)
    Else
      QRPedidoValor.SetVariable('CADASTRO',Trim(FPedidoParam.Me9Cadastro.Text));
    If (FPedidoParam.Me9DtInicial.Text = '') or (FPedidoParam.Me9DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar a data')
    else
      QRPedidoValor.SetVariable('DT_INICIAL',trim(FPedidoParam.ME9DtInicial.Text));
      QRPedidoValor.SetVariable('DT_FINAL',trim(FPedidoParam.ME9DtFinal.Text));
    case FPedidoParam.Rg9Situacao.ItemIndex of
      0 : QRPedidoValor.SetVariable('IND_BAIXADO',Null);
      1 : QRPedidoValor.SetVariable('IND_BAIXADO','A');
      2 : QRPedidoValor.SetVariable('IND_BAIXADO','B');
    End;  

    QRPedidoValor.Open;
    If FrPedidoValor = Nil then
      FrPedidoValor := TFrPedidoValor.Create(Application);
    FRPedidoValor.QRLPeriodo.Caption:='Período: '+ FPedidoParam.ME9DtInicial.Text+ ' até ' +FPedidoParam.ME9DtFinal.Text;
    FRPedidoValor.QRLFilial.Caption:='Filial:'+ FPedidoParam.ME9Filial.Text +''+FPedidoParam.Ed9Filial.Text;
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FrPedidoValor.QRPrimario.Preview
    Else
      FrPedidoValor.QRPrimario.Print;
    QRPedidoValor.Close;
  End;

end;

procedure TFPedidoCad.PedidosComCusto1Click(Sender: TObject);
begin
  inherited;
     If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[10].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    QRPedidoCusto.Close;
    If Trim(FPedidoParam.Me10Filial.Text) <>'' Then
      QRPedidoCusto.SetVariable('FILIAL',Trim(FPedidoParam.Me10Filial.Text))
    Else
      QRPedidoCusto.SetVariable('FILIAL',null);

    If (FPedidoParam.Me10Dt_Inicial.Text = '') or (FPedidoParam.Me10Dt_Final.Text = '')  Then
      Raise Exception.create('É Preciso informar a data')
    else
      QRPedidoCusto.SetVariable('DT_INICIAL',trim(FPedidoParam.ME10Dt_Inicial.Text));
      QRPedidoCusto.SetVariable('DT_FINAL',trim(FPedidoParam.ME10Dt_Final.Text));

    QRPedidoCusto.Open;
    If FrPedidoCusto = Nil then
      FrPedidoCusto := TFrPedidoCusto.Create(Application);
      FRPedidoCusto.QRLPeriodo.Caption:='Período: '+ FPedidoParam.ME10Dt_Inicial.Text+ ' até ' +FPedidoParam.ME10Dt_Final.Text;
      FRPedidoCusto.QRLFilial.Caption:='Filial:'+ FPedidoParam.ME10Filial.Text +''+FPedidoParam.Ed10Filial.Text;
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FrPedidoCusto.QRPrimario.Preview
    Else
      FrPedidoCusto.QRPrimario.Print;
    QRPedidoCusto.Close;
  End;
end;

procedure TFPedidoCad.Comisso1Click(Sender: TObject);
begin
  inherited;
  if FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[11].TabVisible := True;
  if FPedidoParam.ShowModal = mrOk then
  with DMPedido do
  begin
    QRComissaoPed.Close;
    if Trim(FPedidoParam.ME11Data_I.Text) = '' then
      Raise Exception.Create('Data inicial deve ser Informada');
    if Trim(FPedidoParam.ME11Data_F.Text) = '' then
      FPedidoParam.ME11Data_F.Text := DateToStr(Date);
    QRComissaoPed.SetVariable('DATA_I',FPedidoParam.ME11Data_I.Text);
    QRComissaoPed.SetVariable('DATA_F',FPedidoParam.ME11Data_F.Text);
    if Trim(FPedidoParam.ME11Filial.Text) = '' then
      QRComissaoPed.SetVariable('FILIAL',Null)
    else
      QRComissaoPed.SetVariable('FILIAL',FPedidoParam.ME11Filial.Text);
    if Trim(FPedidoParam.ME11Vendedor.Text) = '' then
      QRComissaoPed.SetVariable('VENDEDOR',Null)
    else
      QRComissaoPed.SetVariable('VENDEDOR',FPedidoParam.ME11Vendedor.Text);
    if FPedidoParam.RG11TipoPagamento.ItemIndex = 0 then
      QRComissaoPed.SetVariable('IND_TIPO_PAGTO','A VISTA')
    else if FPedidoParam.RG11TipoPagamento.ItemIndex = 1 then
      QRComissaoPed.SetVariable('IND_TIPO_PAGTO','A PRAZO')
    else if FPedidoParam.RG11TipoPagamento.ItemIndex = 2 then
      QRComissaoPed.SetVariable('IND_TIPO_PAGTO','OUTROS')
    else 
      QRComissaoPed.SetVariable('IND_TIPO_PAGTO',NULL);
    QRComissaoPed.Open;
    if FRPedidoComissao = nil then
      FRPedidoComissao := TFRPedidoComissao.Create(Application);
    if FPedidoParam.RG11TipoRelatorio.ItemIndex = 0 Then
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
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Mensagem.Value := DMMensagem.QMensagemConsCod_Mensagem.Value;

end;

procedure TFPedidoCad.BtConsDepartamentoClick(Sender: TObject);
begin
  inherited;
  If FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOk then
    DMPedido.QPedidoCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFPedidoCad.BtConsBancoClick(Sender: TObject);
begin
  inherited;
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
  Begin
    DMPedido.QPedidoCod_Banco_Agencia.Value := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value;
    DMPedido.QPedidoCod_Conta_Corrente.Value := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  End;
End;

procedure TFPedidoCad.BaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  With DMPedido do
  Begin
    If QPedidoInd_Estoque.Value = 'SIM' Then
      Raise Exception.Create ('Este Pedido Já Foi Atualizado Estoque');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QPedidoItem.Eof Do
        Begin
          DmEstoque.Atualiza_Estoque(QPedidoCod_Operacao.Value,QPedidoCod_Filial.Value,QPedidoItemCod_Produto.Value,1,
                                    (QPedidoItemQt_Pedido.Value*-1), 0,Date,Date);
          QPedidoItem.Next;
        End;
        QPedido.Edit;
        QPedidoInd_Estoque.Value := 'SIM';
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      Except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        Raise;
      End;
    End
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  End;
end;

procedure TFPedidoCad.VoltaBaixaEstoque1Click(Sender: TObject);
begin
  inherited;
  With DMPedido do
  Begin
    If QPedidoInd_Estoque.Value <> 'SIM' Then
      Raise Exception.Create ('Este Pedido Não Foi Atualizado Estoque');
    QPedidoItem.First;
    if QPedidoItem.recordCount > 0 then
    begin
      Try
        DMOracle.DBCemapa.StartTransaction;
        While not QPedidoItem.Eof Do
        Begin
          DmEstoque.Atualiza_Estoque(QPedidoCod_Operacao.Value,QPedidoCod_Filial.Value,QPedidoItemCod_Produto.Value,1,
                                    (QPedidoItemQt_Pedido.Value), 0,Date,Date);
          QPedidoItem.Next;
        End;
        QPedido.Edit;
        QPedidoInd_Estoque.Value := 'NAO';
        QPedido.Post;
        DmOracle.DBCemapa.Commit;
      Except
        DmOracle.DBCemapa.Rollback;
        QPedidoItem.Cancel;
        Raise;
      End;
    End
    else
      raise exception.Create('Selecionar Pedido Para Baixar Estoque');
  End;
end;

procedure TFPedidoCad.CancelamentoTotaldoPedido1Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja cancelar o pedido?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    With DMPedido do
    Begin
      If QPedidoInd_Situacao.Value = '2' Then
        Raise Exception.Create ('Este Pedido Já Foi Cancelado');
      QPedidoItem.First;
      if QPedidoItem.recordCount > 0 then
      begin
        Try
          DMOracle.DBCemapa.StartTransaction;
          QPedido_Cancelado.Open;
          QPedido.Edit;
          While not QPedidoItem.Eof Do
          Begin
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
          End;
          QPedidoInd_Situacao.Value := '2';
          QPedido.Post;
          DmOracle.DBCemapa.Commit;
        Except
          DmOracle.DBCemapa.Rollback;
          QPedidoItem.Cancel;
          Raise;
        End;
      End
      else
        raise exception.Create('Selecionar Pedido Para Cancelar');
    End;

end;

procedure TFPedidoCad.BtImpItemPedClick(Sender: TObject);
begin
  inherited;
  If FPedidoCons = Nil then
    FPedidoCons := TFPedidoCons.Create(Application);
  FPedidoCons.METexto.Text := DMPedido.QPedidoCod_Cadastro.Text;
  FPedidoCons.MEFilial.Text := DMPedido.QPedidoCod_Filial.Text;
  FPedidoCons.MEFilial.Enabled := False;
  FPedidoCons.BtConsFilial.Enabled := False;
  FPedidoCons.BtProcurarClick(Self);
  If FPedidoCons.ShowModal = mrOk then
    With DMPedido do
    Begin
      QPedidoItemCons.Close;
      QPedidoItemCons.SetVariable('Cod_Pedido_Cab',QPedidoConsCod_Pedido_Cab.Value);
      QPedidoItemCons.Open;
      While not QPedidoItemCons.Eof do
       Begin
         QPedidoItem.Insert;
         QPedidoItemCOD_PRODUTO.Value := QPedidoItemConsCOD_PRODUTO.Value;
         QPedidoItemCOD_TRIBUTACAO.Value := QPedidoItemConsCOD_TRIBUTACAO.Value;
         QPedidoItemQT_PEDIDO.Value := QPedidoItemConsQT_PEDIDO.Value;
         QPedidoItemVAL_UNITARIO.Value := QPedidoItemConsVAL_UNITARIO.Value;
         QPedidoItemPERC_DESCONTO.Value := QPedidoItemConsPERC_DESCONTO.Value;
         QPedidoItemCOD_LOTE_TIPO.Value := QPedidoItemConsCOD_LOTE_TIPO.Value;
         QPedidoItemPERC_COMISSAO.Value := QPedidoItemConsPERC_COMISSAO.Value;
         QPedidoItemQT_EMBALAGEM.Value := QPedidoItemConsQT_EMBALAGEM.Value;
         If QPedidoItemConsQT_QUANTIDADE_AUX.Text <> '' Then
            QPedidoItemQT_QUANTIDADE_AUX.Value := QPedidoItemConsQT_QUANTIDADE_AUX.Value;
         If QPedidoItemConsCOD_PRODUTO_AUX.Text <> '' Then
            QPedidoItemCOD_PRODUTO_AUX.Value := QPedidoItemConsCOD_PRODUTO_AUX.Value;
         QPedidoItemPERC_DESCONTO1.Value := QPedidoItemConsPERC_DESCONTO1.Value;
         QPedidoItemPERC_DESCONTO2.Value := QPedidoItemConsPERC_DESCONTO2.Value;
         QPedidoItemPERC_ACRESCIMO.Value := QPedidoItemConsPERC_ACRESCIMO.Value;
         QPedidoItem.Post;
         QPedidoItemCons.Next;
       End;
    End;
end;

procedure TFPedidoCad.PedidosporRepresentante1Click(Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[12].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    QRPedidoRepresentante.Close;
    If Trim(FPedidoParam.Me12Filial.Text) <>'' Then
      QRPedidoRepresentante.SetVariable('FILIAL',Trim(FPedidoParam.Me12Filial.Text))
    Else
      QRPedidoRepresentante.SetVariable('FILIAL',null);

    if Trim(FPedidoParam.ME12Vendedor.Text) = '' then
      QRPedidoRepresentante.SetVariable('VENDEDOR',Null)
    else
      QRPedidoRepresentante.SetVariable('VENDEDOR',FPedidoParam.ME12Vendedor.Text);

    if Trim(FPedidoParam.ME12Supervisor.Text) = '' then
      QRPedidoRepresentante.SetVariable('SUPERVISOR',Null)
    else
      QRPedidoRepresentante.SetVariable('SUPERVISOR',FPedidoParam.ME12Supervisor.Text);
    if Trim(FPedidoParam.Me12Classe.Text) = '' then
      QRPedidoRepresentante.SetVariable('NUM_CLASSE',Null)
    else
      QRPedidoRepresentante.SetVariable('NUM_CLASSE',FPedidoParam.Me12Classe.Text);
    if Trim(FPedidoParam.Me12SubClasse.Text) = '' then
      QRPedidoRepresentante.SetVariable('NUM_SUBCLASSE',Null)
    else
      QRPedidoRepresentante.SetVariable('NUM_SUBCLASSE',FPedidoParam.Me12SubClasse.Text);

    If (FPedidoParam.Me12DtInicial.Text = '') or (FPedidoParam.Me12DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar a data')
    else
      QRPedidoRepresentante.SetVariable('DT_INICIAL',trim(FPedidoParam.ME12DtInicial.Text));
      QRPedidoRepresentante.SetVariable('DT_FINAL',trim(FPedidoParam.ME12DtFinal.Text));

    QRPedidoRepresentante.Open;
    If FrPedidoRepresentante = Nil then
      FrPedidoRepresentante := TFrPedidoRepresentante.Create(Application);
    FrPedidoRepresentante.QRLPeriodo.Caption:='Período: '+ FPedidoParam.ME12DtInicial.Text+ ' até ' +FPedidoParam.ME12DtFinal.Text;
    FrPedidoRepresentante.QRLFilial.Caption:='Filial:'+ FPedidoParam.ME12Filial.Text +''+FPedidoParam.Ed12Filial.Text;
    FrPedidoRepresentante.QRLVendedor.Caption:='Vendedor:'+ FPedidoParam.ME12Vendedor.Text +''+FPedidoParam.Ed12Vendedor.Text;
    FrPedidoRepresentante.QRLSupervisor.Caption:='Supervisor:'+ FPedidoParam.ME12Supervisor.Text +''+FPedidoParam.Ed12Supervisor.Text;
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FrPedidoRepresentante.QRPrimario.Preview
    Else
      FrPedidoRepresentante.QRPrimario.Print;
    QRPedidoRepresentante.Close;
  End;
end;

procedure TFPedidoCad.DBEdit16Change(Sender: TObject);
begin
  inherited;
  If Trim(DBEdit16.Text) <> '' Then
    DMPedido.QPedidoCod_Banco_Agencia.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(DBEdit16.Text))
  Else
    DMPedido.QPedidoCod_Banco_Agencia.Text := '';   

end;

procedure TFPedidoCad.FormCreate(Sender: TObject);
begin
  inherited;
  GBUsuariosQueLiberaram.Visible := false;

end;

procedure TFPedidoCad.AcompanhamentoPedidoPFornecedor1Click(
  Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[13].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
    QRPedidosFornecedor.Close;
    If Trim(FPedidoParam.Me13Filial.Text) <>'' Then
      QRPedidosFornecedor.SetVariable('COD_FILIAL',Trim(FPedidoParam.Me13Filial.Text))
    Else
      QRPedidosFornecedor.SetVariable('COD_FILIAL',null);

    if Trim(FPedidoParam.Me13Vendedor.Text) = '' then
      QRPedidosFornecedor.SetVariable('COD_VENDEDOR',Null)
    else
      QRPedidosFornecedor.SetVariable('COD_VENDEDOR',FPedidoParam.Me13Vendedor.Text);

    if Trim(FPedidoParam.Me13Classe.Text) = '' then
      QRPedidosFornecedor.SetVariable('NUM_CLASSE',Null)
    else
      QRPedidosFornecedor.SetVariable('NUM_CLASSE',FPedidoParam.Me13Classe.Text);

    If (FPedidoParam.Me13DtInicial.Text = '') or (FPedidoParam.Me13DtFinal.Text = '')  Then
      Raise Exception.create('É Preciso informar a data')
    else
      QRPedidosFornecedor.SetVariable('DT_INICIAL',trim(FPedidoParam.Me13DtInicial.Text));
      QRPedidosFornecedor.SetVariable('DT_FINAL',trim(FPedidoParam.Me13DtFinal.Text));

    QRPedidosFornecedor.Open;
    If FRPedidosFornecedor = Nil then
      FRPedidosFornecedor := TFRPedidosFornecedor.Create(Application);
    FRPedidosFornecedor.QRLPeriodo.Caption:='Período: '+ FPedidoParam.Me13DtInicial.Text+ ' até ' +FPedidoParam.Me13DtFinal.Text;
    FRPedidosFornecedor.QRLPeriodo.Caption:=FRPedidosFornecedor.QRLPeriodo.Caption + ' Classe:'+FPedidoParam.Ed13Classe.Text;
    FRPedidosFornecedor.QRLFilial.Caption:='Filial:'+ FPedidoParam.Me13Filial.Text +' '+FPedidoParam.Ed13Filial.Text;
    If FPedidoParam.RGPreview.ItemIndex = 0 then
      FRPedidosFornecedor.QRPrimario.Preview
    Else
      FRPedidosFornecedor.QRPrimario.Print;
    QRPedidosFornecedor.Close;
  End;

end;

procedure TFPedidoCad.DBEdit23Exit(Sender: TObject);
Var wClasse : String;
begin
  inherited;
end;

procedure TFPedidoCad.DBEdit40Change(Sender: TObject);
begin
  inherited;
  If DBEdit40.Text <> '' Then
    DMpedido.QPedidoIND_TIPO_PAGAMENTO.Value := 'A PRAZO';
end;

procedure TFPedidoCad.DBEdit6Change(Sender: TObject);
begin
  inherited;
  If DMPedido.QpedidoCOD_PEDIDO_CAB.Text <> '' then
  Begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' then
    Begin
      DMPedido.QMostraMateriais.close;
      DMPedido.QmostraMateriais.SetVariable('COD_PEDIDO_CAB',StrToInt(DMPedido.QPedidoCOD_PEDIDO_CAB.Text));
      DMPedido.QMostraMateriais.Open;
    end;
  end;
end;

procedure TFPedidoCad.MENumPalmExit(Sender: TObject);
begin
  inherited;
  if Trim(MENumPalm.Text) <> '' then
  begin
    MELocaliza.text:=DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','NUM_PALM = '+Trim(MENumPalm.Text));
    MELocaliza.OnExit(self);
  end;
end;

procedure TFPedidoCad.BtConsOrigemClick(Sender: TObject);
begin
  inherited;
  If FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  If FEstadoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Origem.Value := DMEstado.QEstadoConsCod_Estado.Value;
end;

procedure TFPedidoCad.SBConsMotivoClick(Sender: TObject);
begin
  inherited;
  If FMotivoCons = Nil then
    FMotivoCons := TFMotivoCons.Create(Application);
  If FMotivoCons.ShowModal = mrOk then
    DMPedido.QPedidoItemCod_Motivo.Value := DMMotivo.QMotivoConsCod_Motivo.Value;
end;

procedure TFPedidoCad.SBAlterarClick(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then
    If (DMPedido.QPedidoInd_Embarque.Value = 'S') And Not(DMUsuario.Privilegiado) Then
      Raise Exception.Create('Somente usuário privilegiado pode alterar pedido que está no embarque');
  inherited;

end;

procedure TFPedidoCad.MostraoCdigodoEmbarque1Click(Sender: TObject);
Var wCodigo, wCodigo1, wCodigo2, wCodigo3 : String;
begin
  inherited;
  If DMPedido.QPedidoCOD_PEDIDO_CAB.Text <> '' Then
  Begin
   wCodigo:=DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCOD_PEDIDO_CAB.Text);

   if wCodigo <> '' then
     wCodigo1 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCOD_PEDIDO_CAB.Text
                                                                                                   +' AND COD_EMBARQUE <> '+ wCodigo);
   if wCodigo1 <> '' then
     wCodigo2 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCOD_PEDIDO_CAB.Text
                                                                                                   +' AND COD_EMBARQUE <> '+ wCodigo
                                                                                                   +' AND COD_EMBARQUE <> '+ wCodigo1);
   if wCodigo2 <> '' then
     wCodigo3 := DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM','COD_PEDIDO_CAB = '+DMPedido.QPedidoCOD_PEDIDO_CAB.Text
                                                                                                   +' AND COD_EMBARQUE <> '+ wCodigo
                                                                                                   +' AND COD_EMBARQUE <> '+ wCodigo1
                                                                                                   +' AND COD_EMBARQUE <> '+ wCodigo2);

   If wCodigo <> '' Then
      ShowMessage('Pedido Está No Embarque Código '+wCodigo+', '+wCodigo1+', '+wCodigo2+', '+wCodigo3)
   Else
      ShowMessage('Pedido Não Está Em Nenhum Embarque ');
  End;
  ShowMessage('Selecione um Pedido!');
end;

procedure TFPedidoCad.DSPrimarioDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  If DMPedido.QPedidoInd_Situacao.Value = '2' then
     LblSituacao.Caption := 'CANCELADO'
  Else
     LblSituacao.Caption := '';
end;

procedure TFPedidoCad.PedidosporSupervisor1Click(Sender: TObject);
begin
  inherited;
  If FPedidoParam = Nil then
    FPedidoParam := TFPedidoParam.Create(Application);
  FPedidoParam.PGRelatorio.Pages[14].TabVisible := True;
  If FPedidoParam.ShowModal = mrOk then
  With DMPedido do
  Begin
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

    if FRPedidoSupervisor = Nil then
      FRPedidoSupervisor := TFRPedidoSupervisor.Create(Application);
    FRPedidoSupervisor.QRLFilial.Caption := 'FILIAL ' + Trim(FPedidoParam.Me14CodFilial.Text) + ' ' + Trim(FPedidoParam.Ed14DescFilial.Text);
    FrPedidoSupervisor.QRLPeriodo.Caption:='Período: '+ FPedidoParam.ME14Data_I.Text+ ' até ' +FPedidoParam.ME14Data_F.Text;
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
  If Trim(DBEdit57.Text) <> '' Then
   Begin
     DMPedido.QPedidoItemCod_Produto.Text := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+chr(39)+Trim(DBEdit57.Text)+chr(39));
//      := DbEdit21.Text;
   End;
end;

procedure TFPedidoCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.ShowModal = mrOk then
    DMPedido.QCustoFuncionarioCod_Funcionario.Value := DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
end;

procedure TFPedidoCad.SBEmiteClick(Sender: TObject);
var
  table, Document, Range: Variant;
  wTotalPedido, wTotalProdutos, wNumHoras, wTotalHoras : real;
  wCont:Integer;
  wCodProduto : String;
begin
  wNumHoras := 0;
  wTotalPedido := 0;
  wTotalProdutos := 0;
  wTotalHoras := 0;
  wCont:=1;
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Text = '' then
     raise exception.Create('É necessário que um pedido seja selecionado!');

  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK',DBEdit2.Text);
    QFilial.Open;
  end;

  with DMCadastro do
  begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',DBEdit5.Text);
    QCadastro.Open;
  end;

  NewWord := GetOrCreateObject( 'Word.Application' );
  NewWord.Visible := True;
  NewWord.Documents.Add;

  // Obtem documento e paragrafo
  Document := NewWord.Documents.Item(1);
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(1).Range;
  Range.Text := '---  FICHA DE CUSTOS  ---';
  //Range.Font := 'Arial';
  Range.Bold := 1;
  Range.Font.Size := 16;
  Document.Paragraphs.Item(1).Alignment := '1';

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(3).Range;
  Range.Text := 'EMPRESA : '+DBedit5.Text+'-'+DMCadastro.QCadastroNome.Text;
  Range.Bold := 1;
  Document.Paragraphs.Item(3).Alignment := '0';

  Document.Paragraphs.add;
  Document.Paragraphs.add;
  Range := Document.Paragraphs.Item(5).Range;
  Range.text := 'PRODUTO : '+ DMPedido.QPedidoDESC_OBSERVACAO.Text;
  Range.Bold := 1;
  Document.Paragraphs.Item(5).Alignment := '0';

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(8).Range;
  Range.Text := 'Nº. PEDIDO: '+DBEdit6.Text+'             DATA EMISSÃO: '+DBEdit8.Text;
  Range.Bold := 1;
  Range.Font.Size := 10;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range.Bold := 0;
  Range.Font.Size := 10;
  Range := Document.Paragraphs.Item(10).Range;
  table := Document.Tables.Add(Range,1,6); // novoDoc.Tables.Add(Selection.Range, 3, 5)

  table.cell(1,1).Width:= '15';
  table.cell(1,2).Width:= '0';
  table.cell(1,3).Width:= '0';
  table.cell(1,4).Width:= '0';
  table.cell(1,5).Width:= '0';
  table.cell(1,6).Width:= '0';

  table.Cell(1,1).Range.Text:= 'RELAÇÃO DOS MATERIAIS UTILIZADOS';
  table.Cell(1,2).Range.Text:= '';
  table.Cell(1,3).Range.Text:= '';
  table.Cell(1,4).Range.Text:= '';
  table.Cell(1,5).Range.Text:= '';
  table.Cell(1,6).Range.Text:= '';

  table.rows.add;
  table.Cell(2,1).Width:= '1.71';
  table.Cell(2,2).Width:= '8.31';
  table.Cell(2,3).Width:= '1.20';
  table.Cell(2,4).Width:= '1.39';
  table.Cell(2,5).Width:= '1.81';
  table.Cell(2,6).Width:= '1.99';

  table.Cell(2,1).Range.Text:='Código';
  table.Cell(2,2).Range.Text:='Material';
  table.Cell(2,3).Range.Text:='Unid.';
  table.Cell(2,4).Range.Text:='Quant.';
  table.Cell(2,5).Range.Text:='Unitário';
  table.Cell(2,6).Range.Text:='Total';

  table.Rows.Add;
  DMPedido.QPedidoItem.First;
  while not DMPedido.QPedidoItem.eof do
  begin
    With DMPedido Do
    Begin
      table.Cell(QPedidoItem.RecNo+2,1).Range.Text:=Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value,0,10);
      table.Cell(QPedidoItem.RecNo+2,2).Range.Text:=Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo+2,3).Range.Text:=Trim(DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo+2,4).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
      table.Cell(QPedidoItem.RecNo+2,5).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
      table.Cell(QPedidoItem.RecNo+2,6).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
      wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
      If QPedidoItemPERC_DESCONTO.Value > 0 Then
         wTotalPedido := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value)
      Else
         wTotalPedido := wTotalPedido + QPedidoItemValor_total.Value;
      wCont:=wCont+1;
      QPedidoItem.Next;
    End;
    table.Rows.Add;
  end;
  table.Rows.Add;
  table.Cell(DMPedido.QPedidoItem.RecNo+(wCont+1),2).Range.Text:=
        'TOTAL DOS MATERIAIS .........: ';

  table.Cell(DMPedido.QPedidoItem.RecNo+(wCont+1),6).Range.Text:=
             Bib.NumToTexto(wTotalProdutos,2,10);

  Table.Rows.Add;
  wCont := wCont + 5;
  table.cell(wCont,1).Width:= '15';
  table.cell(wCont,2).Width:= '0';
  table.cell(wCont,3).Width:= '0';
  table.cell(wCont,4).Width:= '0';
  table.cell(wCont,5).Width:= '0';
  table.cell(wCont,6).Width:= '0';

  table.Cell(wCont,1).Range.Text:= 'HORAS TRABALHADAS POR FUNCIONÁRIO';
  table.Cell(wCont,2).Range.Text:= '';
  table.Cell(wCont,3).Range.Text:= '';
  table.Cell(wCont,4).Range.Text:= '';
  table.Cell(wCont,5).Range.Text:= '';
  table.Cell(wCont,6).Range.Text:= '';

  wCont := wCont + 1;
  Table.Rows.Add;
  table.Cell(wCont,1).Width:= '1.71';
  table.Cell(wCont,2).Width:= '8.31';
  table.Cell(wCont,3).Width:= '1.20';
  table.Cell(wCont,4).Width:= '1.39';
  table.Cell(wCont,5).Width:= '1.81';
  table.Cell(wCont,6).Width:= '1.99';

  table.Cell(wCont,1).Range.Text:='Código';
  table.Cell(wCont,2).Range.Text:='Funcionário';
  table.Cell(wCont,3).Range.Text:='Unid.';
  table.Cell(wCont,4).Range.Text:='Quant.';
  table.Cell(wCont,5).Range.Text:='Unitário';
  table.Cell(wCont,6).Range.Text:='Total';

  table.Rows.Add;
  DMPedido.QCustoFuncionario.Close;
  DMPedido.QCustoFuncionario.SetVariable('COD_PEDIDO_CAB',DMPedido.QPedidoCOD_PEDIDO_CAB.Value);
  DMPedido.QCustoFuncionario.Open;
  DMPedido.QCustoFuncionario.First;
  while not DMPedido.QCustoFuncionario.eof do
  begin
    With DMPedido Do
    Begin
      table.Cell(QCustoFuncionario.RecNo+wCont,1).Range.Text:=Bib.NumToTexto(QCustoFuncionarioCOD_Funcionario.Value,0,10);
      table.Cell(QCustoFuncionario.RecNo+wCont,2).Range.Text:=Trim(DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '+FloatToStr(QCustoFuncionarioCod_Funcionario.Value)));
      table.Cell(QCustoFuncionario.RecNo+wCont,3).Range.Text:='h';
      table.Cell(QCustoFuncionario.RecNo+wCont,4).Range.Text:=Bib.NumToTexto(QCustoFuncionarioNUM_HORAS.Value,0,6);
      table.Cell(QCustoFuncionario.RecNo+wCont,5).Range.Text:=Bib.NumToTexto(QCustoFuncionarioVAL_HORA.Value,2,8);
      table.Cell(QCustoFuncionario.RecNo+wCont,6).Range.Text:=Bib.NumToTexto((QCustoFuncionarioNUM_HORAS.Value * QCustoFuncionarioVAL_HORA.Value),2,10);
      wTotalHoras := wTotalHoras + (QCustoFuncionarioNUM_HORAS.Value * QCustoFuncionarioVAL_HORA.Value);
      wNumHoras := wNumHoras + QCustoFuncionarioNUM_HORAS.Value;
      wCont:=wCont+1;
      QCustoFuncionario.Next;
    End;
    table.Rows.Add;
  end;

  table.Rows.Add;
  table.Cell(DMPedido.QCustoFuncionario.RecNo+wCont,2).Range.Text:=
        'TOTAL DAS HORAS TRABALHADAS .........: ';

  table.Cell(DMPedido.QPedidoItem.RecNo+wCont,4).Range.Text:=
             Bib.NumToTexto(wNumHoras,0,10);
  table.Cell(DMPedido.QPedidoItem.RecNo+wCont,6).Range.Text:=
             Bib.NumToTexto(wTotalHoras,2,10);

  Table.Rows.Add;
  wCont := wCont + 5;
  table.cell(wCont,1).Width:= '15';
  table.cell(wCont,2).Width:= '0';
  table.cell(wCont,3).Width:= '0';
  table.cell(wCont,4).Width:= '0';
  table.cell(wCont,5).Width:= '0';
  table.cell(wCont,6).Width:= '0';

  table.Cell(wCont,1).Range.Text:= 'IMPOSTOS/COMISSÃO/LUCRATIVIDADE';
  table.Cell(wCont,2).Range.Text:= '';
  table.Cell(wCont,3).Range.Text:= '';
  table.Cell(wCont,4).Range.Text:= '';
  table.Cell(wCont,5).Range.Text:= '';
  table.Cell(wCont,6).Range.Text:= '';

  wCont := wCont + 1;
  Table.Rows.Add;
  table.Cell(wCont,1).Width:= '9.92';
  table.Cell(wCont,2).Width:= '0.80';
  table.Cell(wCont,3).Width:= '0.80';
  table.Cell(wCont,4).Width:= '1.10';
  table.Cell(wCont,5).Width:= '1.81';
  table.Cell(wCont,6).Width:= '1.99';

  table.Cell(wCont,1).Range.Text:='Descrição';
  table.Cell(wCont,2).Range.Text:='';
  table.Cell(wCont,3).Range.Text:='';
  table.Cell(wCont,4).Range.Text:='   %';
  table.Cell(wCont,5).Range.Text:='base';
  table.Cell(wCont,6).Range.Text:='Valor';
  table.Rows.Add;

  Table.Cell(wCont,1).Range.Text := 'ISSQN';
  Table.Cell(wCont,2).Range.Text := '';
  Table.Cell(wCont,3).Range.Text := '';
  Table.Cell(wCont,4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoPERC_ISSQN.Value,2,5);
  Table.Cell(wCont,5).Range.Text := Bib.NumToTexto(wTotalHoras,2,10);
  Table.Cell(wCont,6).Range.Text := Bib.NumToTexto(((DMPedido.QPedidoPERC_ISSQN.Value * wTotalHoras)/100),2,10);
  table.Rows.Add;

  wCont := wCont + 1;
  Table.Cell(wCont,1).Range.Text := 'IMPOSTO ÚNICO';
  Table.Cell(wCont,2).Range.Text := '';
  Table.Cell(wCont,3).Range.Text := '';
  Table.Cell(wCont,4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_IMPOSTO.Value,2,5);
  Table.Cell(wCont,5).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value,2,10);
  Table.Cell(wCont,6).Range.Text := Bib.NumToTexto((DMPedido.QPedidoVAL_IMPOSTO.Value *DMPedido.QPedidoVAL_TOTAL.Value/100),2,10);
  table.Rows.Add;

  wCont := wCont + 1;
  Table.Cell(wCont,1).Range.Text := 'COMISSÃO';
  Table.Cell(wCont,2).Range.Text := '';
  Table.Cell(wCont,3).Range.Text := '';
  Table.Cell(wCont,4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoPERC_COMISSAO.Value,2,5);
  Table.Cell(wCont,5).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value,2,10);
  Table.Cell(wCont,6).Range.Text := Bib.NumToTexto((DMPedido.QPedidoPERC_COMISSAO.Value * DMPedido.QPedidoVAL_TOTAL.Value/100),2,10);
  table.Rows.Add;
  
  wCont := wCont + 1;
  Table.Cell(wCont,1).Range.Text := 'LUCRATIVIDADE';
  Table.Cell(wCont,2).Range.Text := '';
  Table.Cell(wCont,3).Range.Text := '';
  Table.Cell(wCont,4).Range.Text := Bib.NumToTexto(DMPedido.QPedidoPERC_LUCRO.Value,2,5);
  Table.Cell(wCont,5).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value,2,10);
  Table.Cell(wCont,6).Range.Text := Bib.NumToTexto((DMPedido.QPedidoPERC_LUCRO.Value * DMPedido.QPedidoVAL_TOTAL.Value/100),2,10);
  table.Rows.Add;
  
  wCont := wCont + 1;
  Table.Cell(wCont,1).Range.Text := 'PREÇO DE VENDA';
  Table.Cell(wCont,2).Range.Text := '';
  Table.Cell(wCont,3).Range.Text := '';
  Table.Cell(wCont,4).Range.Text := '';
  Table.Cell(wCont,5).Range.Text := '';
  Table.Cell(wCont,6).Range.Text := Bib.NumToTexto(DMPedido.QPedidoVAL_TOTAL.Value,2,10);

  DMFilial.QFilial.Close;
  DMCadastro.QCadastro.Close;

end;
procedure TFPedidoCad.DBEdit63Exit(Sender: TObject);
var wTotalFuncionario, wComissao, wTotalPedido, wTotalISSQN, wTotalImposto, wLucro : real;
begin
  inherited;
  if ((DMPedido.QPedido.State = dsEdit) or (DMPedido.QPedido.State = dsInsert)) then
  Begin
    DMPedido.QPedido.Post;
    DMPedido.QPedido.Edit;
  end;  
  if DMPedido.QPedidoCOD_PEDIDO_CAB.Text = '' Then
    Raise Exception.Create('Selecione um Pedido!')
  else
    Begin
      DMPedido.QCustoFuncionario.Close;
      DMPedido.QCustoFuncionario.SetVariable('COD_PEDIDO_CAB',DMPedido.QPedidoCOD_PEDIDO_CAB.Value);
      DMPedido.QCustoFuncionario.Open;
      DMPedido.QCustoFuncionario.First;
      while not DMPedido.QCustoFuncionario.eof do
      begin
        wTotalFuncionario := wTotalFuncionario + (DMPedido.QCustoFuncionarioNUM_HORAS.Value * DMPedido.QCustoFuncionarioVAL_HORA.Value);
        DMPedido.QCustoFuncionario.Next;
      end;
    end;
  if Trim(DBEdit63.Text) <> '' then
  Begin
    wTotalPedido  := DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value;
    wTotalISSQN   := (wTotalFuncionario * DMPedido.QPedidoPERC_ISSQN.Value/100);
    wTotalImposto := (DMPedido.QPedidoVAL_TOTAL.Value * DMPedido.QPedidoVAL_IMPOSTO.Value/100);
    wComissao     := (DMPedido.QPedidoVAL_TOTAL.Value * DMPedido.QPedidoPERC_COMISSAO.Value /100);
    wLucro        := (DMPedido.QPedidoVAL_TOTAL.Value - wTotalPedido - wTotalFuncionario - wTotalISSQN - wTotalImposto - wComissao);

    MaskEdit1.Text := Bib.NumToTexto(wTotalPedido,2,10);
    MaskEdit2.Text := Bib.NumToTexto(wTotalFuncionario,2,10);
    MaskEdit3.Text := Bib.NumToTexto(wTotalISSQN,2,10);
    Maskedit4.Text := Bib.NumToTexto(wTotalImposto,2,10);
    MaskEdit5.Text := Bib.NumToTexto(wComissao,2,10);
    MaskEdit6.Text := Bib.NumToTexto(wLucro,2,10);
    DBEdit61.Text := Bib.NumToTexto((wLucro * 100 / DMPedido.QPedidoVAL_TOTAL.Value),2,10);

  end;
end;


procedure TFPedidoCad.DBEdit24Exit(Sender: TObject);
var
  wValInformado, wValVarejo :Real;
begin
  inherited;
  wValVarejo    := strToFloat(DMOracle.BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','COD_PRODUTO = ' + DMPedido.QPedidoItemCOD_PRODUTO.Text));
  wValInformado := strToFloat(Trim(DBEdit24.Text));
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI' then
  begin
    if DBEdit24.Text <> '' then
    begin
      if wValInformado < wValVarejo then
      begin
        if FSenha = Nil then
          FSenha := TFSenha.Create(Application);
        if FSenha.ShowModal = MrOk then
        begin
          If UpperCase(Trim(FSenha.EdSenha.Text)) <> UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) Then
          begin
            DMPedido.QPedidoItemVAL_UNITARIO.Value := wValVarejo;
            Raise Exception.Create('Você não tem permissao pra alterar o preço');
          end;
        end;
      end;
    end;
  end;
end;

procedure TFPedidoCad.BitBtn3Click(Sender: TObject);
var
  wNumDoc,wContaCred,wContaDeb:String;
  wCodDoc,wCodHistorico,wVlrLancto,wCodCompl:Real;
  wDtLancto:TDateTime;
  wFilial : Integer;
begin
  inherited;
  If Trim(FMHistorico.MeHistorico.Text) = ''  Then
     Raise Exception.Create('Preencher Histórico');
  If Trim(MeValor.Text) = '' Then
     Raise Exception.Create('Preecher Valor');
  DMHistorico.QHistorico.Close;
  DMHistorico.QHistorico.SetVariable('Pk',StrToInt(Trim(FMHistorico.MeHistorico.Text)));
  DMHistorico.QHistorico.Open;
  If DMHistorico.QHistorico.Eof Then
     Raise Exception.Create('Historico Não Cadastrado');
  DMPedido.QCaixa.Close;
  DMPedido.QCaixa.Open;
  DMPedido.QCaixa.Insert;
  DMPedido.QCaixaCOD_USUARIO.Value := DMusuario.CodUsuarioCorrente;
  DMPedido.QCaixaCOD_FILIAL.Value := DMPedido.QPedidoCod_Filial.Value;
  DMPedido.QCaixaCOD_DEPARTAMENTO.Value := DmUsuario.CodDepartamentoUsuario;
  DMPedido.QCaixaCOD_HISTORICO.Value := StrToInt(Trim(FMHistorico.MeHistorico.Text));
  DMPedido.QCaixaDT_MOVIMENTO.Value := Date;
  DMPedido.QCaixaVAL_MOVIMENTO.Value := StrToFloat(Bib.LimpaString(Trim(MeValor.text),'.'));
  DMPedido.QCaixaNUM_DOCUMENTO.Value := DMPedido.QPedidoNum_Pedido.Value;
  DMPedido.QCaixaCOD_CADASTRO.Value := DMPedido.QPedidoCod_Cadastro.Value;
  DMPedido.QCaixaDT_USUARIO.Value := DMOracle.DataServ;
  DMPedido.QCaixaDESC_COMPLEMENTO.Value := 'Adiantamento pedido nr. '+DMPedido.QPedidoNum_Pedido.Text;
  DMPedido.QCaixaCod_Pedido_Cab.Value := DMPedido.QPedidoCod_Pedido_Cab.Value;
  DMPedido.QCaixa.Post;
  If (DMParamSistema.QParamSistemaInd_Contabiliza.Value='S') then
  begin
    wCodDoc:=DMPedido.QCaixaCod_Caixa_Mov.Value;
    wNumDoc:=FloatToStr(DMPedido.QCaixaNum_Documento.Value)+'-'+Trim(DMPedido.QCaixaDesc_Complemento.Value);
    wFilial:=DMPedido.QCaixaCod_Filial.Value;
    wContaCred:=DMHistorico.QHistoricoCod_Contabil_Cred.Value;
    wContaDeb:=DMHistorico.QHistoricoCod_Contabil_Deb.Value;
    wCodCompl:=DMPedido.QCaixaCod_Cadastro.Value;
    wCodHistorico:=DMHistorico.QHistoricoCod_Historico_Contabil.Value;
    If wCodHistorico <> 0 Then
     Begin
       wVlrLancto:=DMPedido.QCaixaVal_Movimento.Value;
       wDtLancto:=DMPedido.QCaixaDt_Movimento.Value;
       DMPlanilha.GravaLanc('CX',wCodDoc,wNumDoc, wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,wDtLancto,wContaDeb);
       DMPlanilha.GravaLanc('CX',wCodDoc,wNumDoc, wFilial,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,wDtLancto,wContaCred);
     End;
  End;
  If DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;
  ShowMessage('Movimentos Gerados com Sucesso!');
End;

procedure TFPedidoCad.BitBtn4Click(Sender: TObject);
Var wNumero : Integer;
begin
  inherited;
  If FRReciboCaixa = Nil then
     FRReciboCaixa := TFRReciboCaixa.Create(Application);
  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK',DMPedido.QPedidoCod_Filial.Value);
  DMFilial.QFilial.Open;
  FRReciboCaixa.QRLResponsavel.Caption:=DMFilial.QFilialDesc_Filial.value;
  FRReciboCaixa.QRLRecibo.Caption:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + DMPedido.QPedidoCOD_CADASTRO.Text);

  wNumero := DMSequencia.Sequencia(DMPedido.QPedidoCod_Filial.Value,'RECIBO');
  FRReciboCaixa.QRLNumero.Caption := FloatToStr(wNumero);
  FRReciboCaixa.QRLNumDocumento.Caption := DMPedido.QPedidoNum_Pedido.Text;
  FRReciboCaixa.QRLComplemento.Caption:= 'Adiantamento Referente Pedido Nr. ' + DMPedido.QPedidoNum_Pedido.Text;
  FRReciboCaixa.QRLValorExtenso.Caption:=Bib.extenso(StrToFloat(Bib.LimpaString(Trim(MeValor.text),'.')),'REAL');
  FRReciboCaixa.QRLValor.Caption:=FormatFloat('#,##0.00',StrToFloat(Bib.LimpaString(Trim(MeValor.text),'.')));
  FRReciboCaixa.QRLData.Caption:=FormatDateTime(', dd "de" mmmm "de" yyyy',DMPedido.QPedidoDT_EMISSAO.Value);
  FRReciboCaixa.QuickRep1.Preview;
  DMFilial.QFilial.Close;
end;

procedure TFPedidoCad.PCPedidoChange(Sender: TObject);
begin
  inherited;
  If PCPedido.ActivePage = TsAdiantamentos Then
     MeValor.Text := DMPedido.QSomaPedidoSTOTAL_PEDIDO.Text;
end;

procedure TFPedidoCad.BtLinhaConsClick(Sender: TObject);
begin
  inherited;
  If FLinhaProducao_Cons = Nil then
    FLinhaProducao_Cons := TFLinhaProducao_Cons.Create(Application);
  If FLinhaProducao_Cons.ShowModal = mrOk then
    MeLinha.Text := DMLinhaProducao.QLinhaProducaoConsCod_Linha_Producao.Text;
end;

procedure TFPedidoCad.BtProduto2Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto2.Text :=  DMProduto.QProdutoConsNUM_FABRICANTE.Text;
end;

procedure TFPedidoCad.BtCorBordaClick(Sender: TObject);
begin
  inherited;
  If FLinhaProducao_Cons = Nil then
    FLinhaProducao_Cons := TFLinhaProducao_Cons.Create(Application);
  If FLinhaProducao_Cons.ShowModal = mrOk then  
    MECorBorda.Text := DMProduto.QProdutoConsNUM_FABRICANTE.Text;
end;

procedure TFPedidoCad.MECorBordaExit(Sender: TObject);
var
  wProduto,wDescProduto, wFormulacao, wDescricao: String;

begin
  inherited;
  wFormulacao := Trim(MELinha.Text) + Trim(MeProduto1.Text)  + Trim(MeProduto2.Text)   +
                 Trim(MeProduto3.Text) + Trim(MeProduto4.Text) + Trim(MeCorBorda.Text);
  wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','DESC_FORMULACAO='+chr(39)+ wFormulacao+chr(39));
  if wProduto = '' then
  Begin
    wDescricao := DMOracle.BuscaNome('SELECT DESC_LINHA_PRODUCAO FROM TB_LINHA_PRODUCAO','COD_LINHA_PRODUCAO ='+CHR(39)+Trim(MELinha.Text)+CHR(39));
    wDescricao := wDescricao + ' ' + DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+ CHR(39)+Trim(MeProduto1.Text)+CHR(39));
    wDescricao := wDescricao + ' ' + DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+ CHR(39)+Trim(MeProduto2.Text)+CHR(39));
    wDescricao := wDescricao + ' ' + DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+ CHR(39)+Trim(MeProduto3.Text)+CHR(39));
    wDescricao := wDescricao + ' ' + DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+ CHR(39)+Trim(MeProduto4.Text)+CHR(39));
    wDescricao := wDescricao + ' ' + DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = '+ CHR(39)+Trim(MeCorBorda.Text)+CHR(39));

    DMProduto.QProduto.open;
    DMOracle.DBCemapa.StartTransaction;
    Try
      DMOracle.DBCemapa.StartTransaction;
      DMProduto.QProduto.Insert;

      DMProduto.QProdutoDESC_PRODUTO.Value := copy(wDescricao,1,58);
      DMProduto.QProdutoDESC_COMPLEMENTO.Value := copy(wDescricao,59,109);
      DMProduto.QProdutoCOD_CLASSE.Value := 10;
      DMProduto.QProdutoCOD_TRIBUTACAO.Value := 12;
      DMProduto.QProdutoIND_TIPO_PRODUTO.Value := 'INDUSTRIAL';
      DMProduto.QProdutoIND_SITUACAO.Value := 'ATIVO';
      DMProduto.QProdutoDESC_UNIDADE.Value := 'UN';
      DMProduto.QProdutoDESC_FORMULACAO.Value := wFormulacao;
      DMProduto.QProduto.Post;
      DmOracle.DBCemapa.Commit;
    Except
      Raise Exception.Create('Produto não Cadastrado!');
      DmOracle.DBCemapa.Rollback;
    End;
    wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','DESC_FORMULACAO='+ chr(39)+wFormulacao+chr(39));
    DMPedido.QpedidoItem.Insert;
    DMPedido.QPedidoItemCOD_PRODUTO.Text := wProduto;
    DMPedido.QPedidoItemCOD_LOTE_TIPO.Text := Trim(MeCor1.Text);
    showmessage('Produto Cadastrado com Sucesso!!');
    MeLinha.Clear;
    MeProduto1.Clear;
    MeProduto2.Clear;
    MeProduto3.Clear;
    MeProduto4.Clear;
    MeCor1.Clear;
    MeCorBorda.Clear;
    DbEdit23.SetFocus;
  end
  else
  Begin
    if DMPedido.QPedido.State = dsInsert then
    begin
      DMPedido.QPedido.Post;
      DMPedido.QPedido.Edit;
    end;
    DMPedido.QpedidoItem.Insert;
    DMPedido.QPedidoItemCOD_PRODUTO.Text := wProduto;
    MeLinha.Clear;
    MeProduto1.Clear;
    MeProduto2.Clear;
    MeProduto3.Clear;
    MeProduto4.Clear;
    MeCor1.Clear;
    MeCorBorda.Clear;
    DbEdit28.SetFocus;
  end;
end;

procedure TFPedidoCad.BtcorClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOk then
    MECor1.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;  
end;

procedure TFPedidoCad.BtProduto1Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto1.Text :=  DMProduto.QProdutoConsNUM_FABRICANTE.Text; 
end;

procedure TFPedidoCad.BtProduto3Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto3.Text :=  DMProduto.QProdutoConsNUM_FABRICANTE.Text;
end;

procedure TFPedidoCad.BtProduto4Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    MEProduto4.Text :=  DMProduto.QProdutoConsNUM_FABRICANTE.Text;  
end;

end.



