unit UPedidoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, OracleNavigator, ActiveX, ComObj,
  DBDirceu, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

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
    DBEdit16: TDBEdit;
    BtConsCadastro: TBitBtn;
    DBEdit13: TDBEdit;
    BtConsOperacao: TBitBtn;
    DBEdit17: TDBEdit;
    BtConsVendedor: TBitBtn;
    DBEdit18: TDBEdit;
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
    DBRadioGroup1: TDBRadioGroup;
    OracleNavigator1: TOracleNavigator;
    PosioPedidosCEstoque1: TMenuItem;
    GroupBox2: TGroupBox;
    Label28: TLabel;
    DBEdit34: TDBEdit;
    Label29: TLabel;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
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
    Label34: TLabel;
    DBEdit42: TDBEdit;
    BtConsCultura: TBitBtn;
    DBDirceu1: TDBDirceu;
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
    DBCarencia: TDBComboBox;
    LblCarencia: TLabel;
    Label41: TLabel;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    Label42: TLabel;
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
    procedure DBEdit21Exit(Sender: TObject);
    procedure BtConsPrazoClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure BtCopiaClick(Sender: TObject);
    procedure BtConsCulturaClick(Sender: TObject);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure PedidosComValor1Click(Sender: TObject);
    procedure PedidosComCusto1Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoCad: TFPedidoCad;
  newWord : Variant;

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
  UCulturaCons, UCultura_cl, URPedidoValor, URPedidoCusto, URPedidoComissao;

{$R *.DFM}

procedure TFPedidoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMPedido do
  Begin
    QPedido.Open;
    QPedidoItem.Open;
    QSomaPedido.Open;
    wDtEmissao_Ant := Date;
  End;
  If FPedidoCons <> Nil then
     FPedidocons.BtConsCadastro.Enabled := True;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GONZATTI' Then
  Begin
     Label12.Caption := 'Prod.Troca';
     DBRadioGroup1.Items.Clear;
     DBRadioGroup1.Items.Add('A Vista');
     DBRadioGroup1.Items.Add('A Prazo');
     DBRadioGroup1.Items.Add('Base Troca');
  End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL' Then
   Begin
     wComissao_Ant := 5;
     DbEdit1.Visible := False;
     DbEdit1.TabStop := False;
     Label7.Visible := False;
   End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' Then
   Begin
     DbEdit45.Visible := True;
     DbEdit46.Visible := True;
     DbEdit47.Visible := True;
     Label36.Visible := True;
     Label38.Visible := True;
     Label39.Visible := True;
   End;
  If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'RADIO' Then
   Begin
     DBCarencia.Visible := False;
     LblCarencia.Visible := False;
   End
  Else
   Begin
     DbEdit4.Enabled := False;
     BtConsVendedor.Visible := False;
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
    wValor_CC : Real;
begin
  DmUsuario.Checar_Filial_Usuario(DMPedido.QPedidoCOD_FILIAL.Text,'VENDA');
  If DMPedido.DSPedidoItem.State In [DsInsert,DsEdit] Then
     DMPedido.DSPedidoItem.Dataset.Post;
  If DMPedido.QPedidoCod_Vendedor.Text <> '' Then
     If (DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_VENDEDOR','COD_VENDEDOR = '+DMpedido.QPedidoCod_Vendedor.Text)) <> 'ATIVO' Then
        Raise Exception.Create ('Vendedor Inativo');
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Then
  Begin
    wNota_Fiscal :=DMOracle.BuscaNome('SELECT IND_EMITE FROM TB_OPERACAO','COD_OPERACAO = '+DMpedido.QPedidoCod_Operacao.Text);
    If wNota_Fiscal = 'F' Then
    Begin
      If (DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text)) = '' Then
        Raise Exception.Create ('Não é Permitido Lançar Pedidos Sem Cnpj/Cpf');
      If (DMOracle.BuscaNome('SELECT IND_FISICA_JURIDICA FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text)) = 'F' Then
        Raise Exception.Create ('Não é Permitido Fazer Notas Para Clientes Pessoa Física');
    End;
     If (DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value < 250) And
        (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') And
        (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO') Then
        If (DMOracle.BuscaNome('SELECT IND_LIBERA_BLOQUETO FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text)) <> 'SIM' Then
           Raise Exception.Create ('Pedidos A Prazo - Somente Valores Maiores Que R$ 250,00');
     If (DMPedido.QSomaPedidoSTOTAL_PEDIDO.Value < 120) And
        (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') And
        (DMPedido.QPedidoIND_TIPO_PAGAMENTO.Value = 'A PRAZO') Then
        If (DMOracle.BuscaNome('SELECT IND_LIBERA_BLOQUETO FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text)) <> 'SIM' Then
           Raise Exception.Create ('Pedidos A Prazo - Somente Valores Maiores Que R$ 120,00');
     wOperacao :=DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text);
     wOperacao1 :=DMOracle.BuscaNome('SELECT COD_OPERACAO_CC1 FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text);
     wOperacao2 :=DMOracle.BuscaNome('SELECT COD_OPERACAO_CC2 FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text);
     If (wOperacao <> '') or (wOperacao1 <> '') or (wOperacao2 <> '') Then
        If (wOperacao <> DMPedido.QPedidoCod_Operacao.Text) And (wOperacao1 <> DMPedido.QPedidoCod_Operacao.Text) And
           (wOperacao2 <> DMPedido.QPedidoCod_Operacao.Text) Then
            Raise Exception.Create ('Código de Operação Não Permitida para Este Cliente');
     If (DBRadioGroup1.ItemIndex = 1) and (DBEdit40.Text = '') Then
        Raise Exception.Create ('Preencher Prazo de Pagamento');
     If (DBRadioGroup1.ItemIndex = 2) and (DBEdit29.Text = '') Then
        Raise Exception.Create ('Preencher Vencimento do Cheque');
     End;
   wValor_cc := 0;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ENCOPEL') And
     (DBRadioGroup1.ItemIndex <> 0) Then
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
   End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') And
     (DBRadioGroup1.ItemIndex <> 0) Then
   Begin
      wNada := DMOracle.BuscaNome('SELECT SUM(VAL_MOVIMENTO) FROM TB_BCO_MOVIMENTO ',
         'COD_CADASTRO = '+ DMpedido.QPedidoCod_Cadastro.Text +
         ' AND DT_MOVIMENTO >= '+ Chr(39) +  DateToStr(Date()) + Chr(39));
      If wNada <> '' Then
         wValor_cc := wValor_cc + StrToFloat(wNada);
   End;
  { Retirado a pedido da RADIOLANDIA para nao verificar limite de credito do CLIENTE para fazer o PEDIDO:
                                                            03/07/2012 - Junior
  If DBRadioGroup1.ItemIndex <> 0 Then     // forma e pagamento <> de a vista
    DMCadastro.ValidaCredito(DMpedido.QPedidoCod_Cadastro.Value,DMpedido.QSomaPedidoSTOTAL_PEDIDO.Value+wValor_cc);
  }
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
     DBEdit21Exit(Self);
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
  If FPedidoCons.ShowModal = mrOk then
  With DMPedido do
  Begin
    QPedido.Close;
    QPedido.SetVariable('PK',QPedidoConsCod_Pedido_Cab.Value);
    QPedido.Open;
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
    QRPedAberto.Open;
    If FRPedido_Aberto = Nil then
       FRPedido_Aberto := TFRPedido_Aberto.Create(Application);
    FRpedido_Aberto.QRLTitulo.Caption := 'Pedido em Aberto ('+FPedidoParam.ME0DataI.text+' - '+FPedidoParam.ME0DataF.Text+')';
    FRpedido_Aberto.QRLEstado.Caption :='Estado: '+Trim(FPedidoParam.ED0Estado.Text);
    Case FPedidoParam.Rg0TipoPagto.ItemIndex of
      0 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Todos';
      1 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Vista';
      2 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: A Prazo';
      3 : FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Pagto: Outros';
    End; // Case
    If Trim(FPedidoParam.Me0Cultura.Text) <> '' Then
       FRpedido_Aberto.QRLTitulo.Caption := FRpedido_Aberto.QRLTitulo.Caption + ' Cultura ' + FPedidoParam.Ed0Cultura.Text;
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
    FRPedido_Produto.QRLFilial.Caption := 'Filial: '+FPedidoParam.ED1Filial.Text;

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
end;

procedure TFPedidoCad.SBExcluirClick(Sender: TObject);
begin
  // inherited;
  DMPedido.ExcluiPedido;
end;

procedure TFPedidoCad.Espelho1Click(Sender: TObject);
begin
  inherited;
  if FRPedido_Espelho = Nil then
    FRPedido_Espelho := TFRPedido_Espelho.Create(Application);
  FRPedido_Espelho.QRLEmpresa.Caption := DMPedido.QpedidoNome_Filial.Value;
  if DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.isNull then
    FRPedido_Espelho.QRLPrazo.Caption := ''
  else
    FRPedido_Espelho.QRLPrazo.Caption := DMOracle.FastSelect('DESC_PRAZO_VENCIMENTO', 'TB_PRAZO_VENCIMENTO',
      'COD_PRAZO_VENCIMENTO = '+DMPedido.QPedidoCOD_PRAZO_VENCIMENTO.Text);
  DMPedido.QRPedido.Open;
  FRPedido_Espelho.QRPrimario.Preview;
  DMPedido.QRPedido.Close;
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
      QRPedidoPeriodo.SetVariable('DATA_I',FPedidoParam.ME4Data_I.Text);
      QRPedidoPeriodo.SetVariable('DATA_F',FPedidoParam.ME4Data_F.Text);
      if Trim(FPedidoParam.ME4Filial.Text) = '' then
        QRPedidoPeriodo.SetVariable('FILIAL',Null)
      else
        QRPedidoPeriodo.SetVariable('FILIAL',FPedidoParam.ME4Filial.Text);
      if Trim(FPedidoParam.Me4Cadastro.Text) = '' then
        QRPedidoPeriodo.SetVariable('CADASTRO',Null)
      else
        QRPedidoPeriodo.SetVariable('CADASTRO',FPedidoParam.Me4Cadastro.Text);
      QRPedidoPeriodo.Open;
      if FRPedido_Periodo = Nil then
        FRPedido_Periodo := TFRPedido_Periodo.Create(Application);
      FRPedido_Periodo.QRLEmpresa.Caption := FPedidoParam.ME4Filial.Text+'-'+FPedidoParam.Ed4Filial.Text;
      FRPedido_Periodo.QRLTitulo.Caption := 'Pedidos no periodo ('+FPedidoParam.ME4Data_I.text+' - '+FPedidoParam.ME4Data_F.Text+')';

      if FPedidoParam.RGPreview.ItemIndex = 0 then
        FRPedido_Periodo.QRPrimario.Preview
      else
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
    If FRPedido_Produto = Nil then
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
  wTotalPedido, wTotalProdutos : real;
  wCont:Integer;
begin
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
  Range.Text := 'FILIAL  : '+DBEdit16.Text;

  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(4).Range;
  Range.Text := 'ENDEREÇO: '+DMFilial.QFilialDESC_ENDERECO.Text+' '+
  DMFilial.QFilialDESC_CIDADE.Text+' TELEFONE : '+DMFilial.QFilialDESC_TELEFONE.Text;;

  Document.Paragraphs.Add;
  Document.Paragraphs.Add;
  Range := Document.Paragraphs.Item(6).Range;
  Range.Text := 'CADASTRO: '+DBedit5.Text+'-'+DBedit13.Text;
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
  Range.Text := 'VENDEDOR: '+DBEdit4.Text+'-'+DBEdit18.Text;

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
      table.Cell(QPedidoItem.RecNo+1,2).Range.Text:=Bib.NumToTexto(QPedidoItemCOD_PRODUTO.Value,0,10);
      table.Cell(QPedidoItem.RecNo+1,3).Range.Text:=Bib.NumToTexto(QPedidoItemQT_PEDIDO.Value,0,6);
      table.Cell(QPedidoItem.RecNo+1,4).Range.Text:=Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value)));
      table.Cell(QPedidoItem.RecNo+1,5).Range.Text:=Bib.NumToTexto(QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100),2,8);
//      if QPedidoItemPERC_DESCONTO.Value > 0 then
//         table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemPERC_DESCONTO.Value,2,8);
      table.Cell(QPedidoItem.RecNo+1,6).Range.Text:=Bib.NumToTexto(QPedidoItemValor_total.Value,2,10);
      wTotalProdutos:= wTotalProdutos + QPedidoItemValor_total.Value;
      wTotalPedido  := wTotalPedido + ((QPedidoItemVAL_UNITARIO.Value - (QPedidoItemVAL_UNITARIO.Value * QPedidoItemPERC_DESCONTO.Value / 100)) * QPedidoItemQT_PEDIDO.Value);
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
      Range.Text := Bib.FormataTexto(Bib.NumToTexto(QPedidoEstoqueCOD_PRODUTO.Value,0,10),10)+' |  '+Bib.FormataTexto(Trim(DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(QPedidoItemCod_Produto.Value))),30)
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
     LblFormaCompra.Caption := DMOracle.BuscaNome('SELECT DESC_FORMA_COMPRA FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
     LblFormaCompra.Caption := LblFormaCompra.Caption + '- %Desc '+DMOracle.BuscaNome('SELECT PERC_DESCONTO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DmNotaSaida.QNotaSaidaCod_Cadastro.Value));
     LblAutoriza.Caption := 'Autorizado:'+DMOracle.BuscaNome('SELECT NOME_CONTATO FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
     LblAutoriza.Caption := LblAutoriza.Caption+'-'+DMOracle.BuscaNome('SELECT NOME_CONTATO2 FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
     LblAutoriza.Caption := LblAutoriza.Caption+' Oper:'+DMOracle.BuscaNome('SELECT COD_OPERACAO_CC FROM TB_CADASTRO','COD_CADASTRO = '+FloatToStr(DMPedido.QPedidoCod_Cadastro.Value));
   End
  else
   Begin
     LblAutoriza.Caption := '';
     LblFormaCompra.Caption := '';
   End;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') Or
     (DMParamSistema.QParamSistemaCod_Empresa.Value = 'ZADIMEL') Then
   Begin
     wPedido :=DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_CAB','COD_CADASTRO = '
               +FloatToStr(DMPedido.QPedidoCod_Cadastro.Value)+' AND DT_EMISSAO >='+Chr(39) + DateToStr(Date - 15) + Chr(39));
     if wPedido <> '' Then
        ShowMessage('Cliente com Pedido nos últimos 15 Dias');
     wCgc := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO = '+DMpedido.QPedidoCod_Cadastro.Text);
     If wCgc <> '' Then
      Begin
       wCgc1 := '';
       For i := 1 to 18 do
          if wCgc[I] in ['0','1','2','3','4','5','6','7','8','9'] then
             wCgc1 := wCgc1 + wCgc[I];
       If wCgc1 <> '' Then
         If (DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_CADASTRO_BLOQUEADO','NUM_CGC_CPF = '+wCgc1)) <> '' Then
            ShowMessage ('Cadastro Com Titulos em Aberto na Zadimel/Faville');
      End
     Else
        Raise Exception.Create ('Cadastro Sem Cnpj');
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

    QRPedidoComNota.Open;
    If FRPedidoComNota = Nil then
      FRPedidoComNota := TFRPedidoComNota.Create(Application);
    FRPedidoComNota.QRLFilial.Caption:=FPedidoParam.ME34Filial.Text+' '+FPedidoParam.Ed34Filial.Text;
    FRPedidoComNota.QRLCliente.Caption:=FPedidoParam.ME34Cadastro.Text+' '+FPedidoParam.Ed34Cadastro.Text;
    FRPedidoComNota.QRLVendedor.Caption:=FPedidoParam.ME34Vendedor.Text+' '+FPedidoParam.Ed34Vendedor.Text;
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
  iF DMParamSistema.QParamSistemaCod_empresa.Value <> 'ZADIMEL' then
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

procedure TFPedidoCad.DBEdit21Exit(Sender: TObject);
begin
  inherited;
  if DbEdit21.Text <> '' then
  begin
    if DMParamSistema.QParamSistemaCod_empresa.Value = 'FAVILLE' then
    begin
      if DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+DbEdit21.Text) <> 'COMERCIAL' then
      begin
        MessageBox(FPedidoCad.Handle,'Produto de Tipo Inválido - É permitido incluir apenas produtos do Tipo COMERCIAL',
                   'ERRO',MB_ICONERROR or MB_OK);
        DBEdit21.SetFocus;
      end;
    End;
  end;
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
    If (DMOracle.BuscaNome('SELECT IND_LIBERADO FROM TB_OPERACAO','COD_OPERACAO = '+DMpedido.QPedidoCod_Operacao.Text)) <> 'S' Then
       Raise Exception.Create ('Operação Não Liberada Para Uso');
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
     DBEdit21.SetFocus;
end;

procedure TFPedidoCad.BtCopiaClick(Sender: TObject);
Var wVlCampo : array[0..150,0..100] of string;
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
    DMPedido.QPedidoCod_Cultura.Value := DMCultura.QCulturaConsCod_Cultura.Value;

end;

procedure TFPedidoCad.DBRadioGroup1Click(Sender: TObject);
begin
  inherited;
  DBEdit5.SetFocus;
end;

procedure TFPedidoCad.DBEdit5Change(Sender: TObject);
begin
  inherited;
  If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'AB') And
     (Trim(DBEdit5.Text) <> '') Then
    DMNotaSaida.MostraMsg(StrToInt(Trim(DBEdit5.Text)));

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

procedure TFPedidoCad.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
     If StrToFloat(DbEdit1.Text) > 12 Then
        Raise Exception.Create ('Percentual de Comissão Inválido');
end;

end.



