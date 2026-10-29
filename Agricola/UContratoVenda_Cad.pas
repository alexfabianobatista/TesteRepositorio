unit UContratoVenda_Cad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, DBDirceu, StdCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, Buttons, ExtCtrls, Grids, DBGrids, Gauges, DBTables,
  OracleNavigator, variants, ActnList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFContrato_Vend = class(TFTCadSimples)
    ComunicaodeVenda1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    BtVendedor: TSpeedButton;
    BtEmpresa: TSpeedButton;
    BtProduto: TSpeedButton;
    BtCorretora: TSpeedButton;
    BtBanco: TSpeedButton;
    Label15: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBVendedor: TDBDirceu;
    DBEmpresa: TDBDirceu;
    DBProduto: TDBDirceu;
    DBCorretora: TDBDirceu;
    DBBanco: TDBDirceu;
    DBEdit15: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet2: TTabSheet;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    DBText1: TDBText;
    Label18: TLabel;
    Opes1: TMenuItem;
    ConfirmaContrato1: TMenuItem;
    VoltaConfirmao1: TMenuItem;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    TabSheet3: TTabSheet;
    DBGrid2: TDBGrid;
    DBText2: TDBText;
    Label21: TLabel;
    TabSheet4: TTabSheet;
    DBText3: TDBText;
    Label22: TLabel;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    Label29: TLabel;
    DBText4: TDBText;
    DBEdit21: TDBEdit;
    Label31: TLabel;
    ContratodeVendacomSaldoemAberto1: TMenuItem;
    ContratodevendacMovimentao1: TMenuItem;
    ContratocSaldodeEmbarque1: TMenuItem;
    Label33: TLabel;
    DBEdit22: TDBEdit;
    SaldoContbilContratoVenda1: TMenuItem;
    OracleNavigator1: TOracleNavigator;
    OracleNavigator2: TOracleNavigator;
    TabSheet5: TTabSheet;
    Label37: TLabel;
    DBEdit23: TDBEdit;
    Label38: TLabel;
    DBEdit24: TDBEdit;
    Label39: TLabel;
    Label41: TLabel;
    DBEdit27: TDBEdit;
    Label42: TLabel;
    AnliseCustosContrato1: TMenuItem;
    DBEdit25: TDBEdit;
    Label40: TLabel;
    DBEdit26: TDBEdit;
    Label44: TLabel;
    DBEdit28: TDBEdit;
    GroupBox1: TGroupBox;
    Label45: TLabel;
    DBEdit29: TDBEdit;
    Label46: TLabel;
    DBEdit30: TDBEdit;
    Label48: TLabel;
    DBEdit32: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    BtOperacao: TSpeedButton;
    BtMensagem: TSpeedButton;
    BtTributacao: TSpeedButton;
    Label47: TLabel;
    DBEdit31: TDBEdit;
    BtMsgCorpoNota: TSpeedButton;
    Label49: TLabel;
    DBEdit33: TDBEdit;
    Label50: TLabel;
    DBEdit34: TDBEdit;
    Label51: TLabel;
    DBEdit35: TDBEdit;
    Label53: TLabel;
    DBEdit36: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    DBRadioGroup4: TDBRadioGroup;
    Label55: TLabel;
    DBEdit37: TDBEdit;
    DBRadioGroup5: TDBRadioGroup;
    GroupBox2: TGroupBox;
    SpeedButton1: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    SpeedButton3: TSpeedButton;
    Label28: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Bt12Filial: TSpeedButton;
    Label43: TLabel;
    Label52: TLabel;
    MECodOperacao: TMaskEdit;
    MEOperacao: TMaskEdit;
    MECodSerie: TMaskEdit;
    MEQtde: TMaskEdit;
    DBEdit20: TDBEdit;
    MECodTribProd: TMaskEdit;
    METribut: TMaskEdit;
    MeDtEmissao: TMaskEdit;
    MeNrNota: TMaskEdit;
    MECodFilial: TMaskEdit;
    MEFilial: TMaskEdit;
    RGPagto: TRadioGroup;
    BtConsMensagem: TBitBtn;
    MeCodMens: TMaskEdit;
    MeDtSaida: TMaskEdit;
    Label32: TLabel;
    MeObs: TMaskEdit;
    MeObs1: TMaskEdit;
    GroupBox3: TGroupBox;
    Label27: TLabel;
    MECodTransportadora: TMaskEdit;
    SpeedButton2: TSpeedButton;
    METransportadora: TMaskEdit;
    Label30: TLabel;
    MEPlaca: TMaskEdit;
    Label54: TLabel;
    MeCodTribFrete: TMaskEdit;
    SpeedButton4: TSpeedButton;
    RgTipoFrete: TRadioGroup;
    Label56: TLabel;
    MeOperacaoFrete: TMaskEdit;
    SpeedButton5: TSpeedButton;
    Label57: TLabel;
    MeNumFrete: TMaskEdit;
    Label58: TLabel;
    MePrecoTon: TMaskEdit;
    Label59: TLabel;
    MeValFrete: TMaskEdit;
    Label60: TLabel;
    MeValPedagio: TMaskEdit;
    Label61: TLabel;
    MeDtEmissaoFrete: TMaskEdit;
    Label62: TLabel;
    MeOrdemCarregamento: TMaskEdit;
    SpeedButton6: TSpeedButton;
    Label63: TLabel;
    MeBaseCalculo: TMaskEdit;
    Label64: TLabel;
    MeValIcm: TMaskEdit;
    MeParceria: TMaskEdit;
    Label65: TLabel;
    SpeedButton7: TSpeedButton;
    Label66: TLabel;
    MeMotorista: TMaskEdit;
    SpeedButton8: TSpeedButton;
    Label67: TLabel;
    DBEdit38: TDBEdit;
    DBRadioGroup6: TDBRadioGroup;
    TabSheet6: TTabSheet;
    Label68: TLabel;
    DBEdit39: TDBEdit;
    Label69: TLabel;
    DBEdit40: TDBEdit;
    Label70: TLabel;
    DBEdit41: TDBEdit;
    Label71: TLabel;
    DBEdit42: TDBEdit;
    Label72: TLabel;
    DBEdit43: TDBEdit;
    Label73: TLabel;
    DBEdit44: TDBEdit;
    Label74: TLabel;
    DBEdit45: TDBEdit;
    Label75: TLabel;
    DBEdit46: TDBEdit;
    Label76: TLabel;
    MEClassificadora: TMaskEdit;
    SpeedButton9: TSpeedButton;
    Label77: TLabel;
    SbDepartamento: TSpeedButton;
    MeDepartamento: TMaskEdit;
    Label78: TLabel;
    DBEdit47: TDBEdit;
    MEDCO: TMaskEdit;
    Label79: TLabel;
    ContratoVendaSaldosQuantidade1: TMenuItem;
    Label80: TLabel;
    DBEdit48: TDBEdit;
    BtConsPadrao: TSpeedButton;
    Label81: TLabel;
    DBEdit49: TDBEdit;
    SbCidadeCons: TSpeedButton;
    FecharCustos1: TMenuItem;
    VoltarFechamento1: TMenuItem;
    Label82: TLabel;
    DBEdit50: TDBEdit;
    Label83: TLabel;
    DBEdit51: TDBEdit;
    Label84: TLabel;
    DBEdit52: TDBEdit;
    Label85: TLabel;
    DBEdit53: TDBEdit;
    BtOperacaoInclusao: TBitBtn;
    DBDirceu2: TDBDirceu;
    BaixaContabil1: TMenuItem;
    VariaoCambialMs1: TMenuItem;
    TabSheet7: TTabSheet;
    DsVariacaoCambial: TDataSource;
    DBGrid4: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label86: TLabel;
    MeArmazemAlfandegado: TMaskEdit;
    SbArmazemAlfandegado: TSpeedButton;
    DBEdit54: TDBEdit;
    Label87: TLabel;
    DBEdit55: TDBEdit;
    SbArmazem: TSpeedButton;
    DBDirceu1: TDBDirceu;
    BtCopiaNota: TBitBtn;
    BitBtn2: TBitBtn;
    Label88: TLabel;
    BtMensagemCorpo: TBitBtn;
    MeMensagemCorpo: TMaskEdit;
    Label89: TLabel;
    MeEspecie: TMaskEdit;
    Label90: TLabel;
    DBEdit56: TDBEdit;
    BtLoteTipo: TSpeedButton;
    MeLote: TMaskEdit;
    Label91: TLabel;
    SbLoteTipo: TSpeedButton;
    MESerieModelo: TMaskEdit;
    Label92: TLabel;
    TabSheet8: TTabSheet;
    DBGrid5: TDBGrid;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label93: TLabel;
    SpeedButton10: TSpeedButton;
    Label94: TLabel;
    Label95: TLabel;
    MeArquivo: TMaskEdit;
    BitBtn5: TBitBtn;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    OpenDialog: TOpenDialog;
    DsContratoVend_Doc: TDataSource;
    procedure BtVendedorClick(Sender: TObject);
    procedure BtEmpresaClick(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure BtCorretoraClick(Sender: TObject);
    procedure BtBancoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ComunicaodeVenda1Click(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure ConfirmaContrato1Click(Sender: TObject);
    procedure VoltaConfirmao1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodOperacaoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodTransportadoraExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure MECodTribProdExit(Sender: TObject);
    procedure METransportadoraEnter(Sender: TObject);
    procedure METransportadoraExit(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure ContratodeVendacomSaldoemAberto1Click(Sender: TObject);
    procedure ContratodevendacMovimentao1Click(Sender: TObject);
    procedure ContratocSaldodeEmbarque1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure Bt12FilialClick(Sender: TObject);
    procedure SaldoContbilContratoVenda1Click(Sender: TObject);
    procedure AnliseCustosContrato1Click(Sender: TObject);
    procedure BtConsMensagemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtOperacaoClick(Sender: TObject);
    procedure BtMensagemClick(Sender: TObject);
    procedure BtTributacaoClick(Sender: TObject);
    procedure BtMsgCorpoNotaClick(Sender: TObject);
    procedure MeCodTribFreteExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MePrecoTonExit(Sender: TObject);
//    procedure MeValFreteChange(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SbDepartamentoClick(Sender: TObject);
    procedure ContratoVendaSaldosQuantidade1Click(Sender: TObject);
    procedure BtConsPadraoClick(Sender: TObject);
    procedure SbCidadeConsClick(Sender: TObject);
    procedure FecharCustos1Click(Sender: TObject);
    procedure VoltarFechamento1Click(Sender: TObject);
    procedure DBEdit51Change(Sender: TObject);
    procedure BtOperacaoInclusaoClick(Sender: TObject);
    procedure BaixaContabil1Click(Sender: TObject);
    procedure VariaoCambialMs1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure SbArmazemAlfandegadoClick(Sender: TObject);
    procedure SbArmazemClick(Sender: TObject);
    procedure BtCopiaNotaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BtMensagemCorpoClick(Sender: TObject);
    procedure BtLoteTipoClick(Sender: TObject);
    procedure SbLoteTipoClick(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    Function Checa :Boolean;
    Procedure Limpa;
    Procedure AtzTrib;
    Procedure MudaStatus(S:String);
    Procedure Remove_CP_CR(S:String);
    Procedure VoltaSaldo(Val_Atual,Val_Aplicar:Real;Op:String);

  public
    Procedure GeraNF(pCodOperacao:Integer;pCodSerie,pSerieModelo:String;
                     pQtde,pValUnitario:Real; pFilial,pCadastro1:Integer;
                     pProduto:Real;pCodContratoVenda:Integer;
                     pCodTransp:String; pCodTribProd:Integer;
                     pTransportadora,pPlaca,pEspecie,pObs,pObs1:String;
                     pNumNota:Integer;pDtEmissao,pPagto,pCodObs:String;
                     pTipoFrete:Integer;pCodMsgCorpo,pDtSaida,pCodTrFrete:String;
                     pNumFrete,pPrecoTon,pValFrete,pValPedagio,pDtEmissaoFrete,pOrdemCarregamento,
                     pOperacaoFrete,pCodTribFrete,pBaseCalculo,pValIcm,pParceria,pMotorista:String;
                     pCodClassificadora,pDepartamento,pDCO,pVal_Despesas,pArmazemAlfandegado,PMensagemCorpo,pCod_Obra,PLote : string);
    Procedure ConfirmaNF;
    { Public declarations }
  end;

var
  FContrato_Vend: TFContrato_Vend;
  temp:String;

  implementation

uses Ucontrato_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UProdutoCons, UProduto_cl, UBancosCons, UBancoAgencia_cl,
  UContratoVenda_Cons, UContrato_Param, URContrato_Venda, UOracle_cl,
  UContaCorrenteCons, UContrato_Vend_Confirma, UOperacaoCons, UOperacao_cl,
  UNotaSaida_cl, UNotaSaida_Confirma, UTributacaoCons, UTributacao_cl,
  URContratoVend_Aberto, URContratoVend_Mov, URContratoVenda_SaldoEmb,
  URContrato_com_Mov, UContratoVendAlt, UParamSistema_cl,
  URContratoVend_Contabil, URContratoVenda_Custos,
  UMensagemCons, UMensagem_cl,
  UUsuario_cl, URContratoVenda_Custos1, UConhecimentoFrete_cl,
  UConhecimentoFreteCad, UOrdemCarregamento_cl, UOrdemCarregamentoCons,
  UDepartamentoCons, UDepartamento_cl, UrContrato_Venda_Geral,
  UPadraoDescontoProdutoCons, UPadraoProduto_cl, UCidadeCons, UCidade_cl,
  UPlanilha_cl, UContasReceberBaixa, UContrato_Gp_Ajuste,
  UContasReceber_cl, UContrato_Vend_Cl, UMoeda_cl, UNotaImpressao,
  UBiblioteca, UTipoLoteCons, UTipoLote_cl, UNotaSaida_Cancela, UPDFViewer;

{$R *.DFM}

procedure TFContrato_Vend.BtVendedorClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.Showmodal = mrOk then
    DMContrato.QContrato_VendCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContrato_Vend.BtEmpresaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContrato_Vend.BtProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_PRODUTO.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFContrato_Vend.BtCorretoraClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons  = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_CORRETORA.Value:=DMCadastro.QCadastroConsCOD_CADASTRO.Value;
end;

procedure TFContrato_Vend.BtBancoClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_CC.Value:=DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value;
end;

procedure TFContrato_Vend.FormActivate(Sender: TObject);
begin
  inherited;
  DMContrato.QContrato_Vend.Open;
  DMContrato.QContrato_Vend_Pagto.Open;
  DMContrato.QContrato_VendMov.Open;
  DMContrato.QContrVend_Nota.Open;
  DMContrato.QContrato_Vend_Variacao.Open;
  DMContrato.QContratoVend_Doc.Open;
  RgTipoFrete.Enabled := DMParamSistema.QParamSistemaCod_Empresa.Value <> 'GONZATTI';
  PageControl1.TabIndex := 0;
//  SBAlterar.Visible:=False;
//  Alterar1.Visible:=False;
//  DSPrimario.AutoEdit:=False;
end;

procedure TFContrato_Vend.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert, DSEdit] then
    begin
      BtBanco.Enabled:=True;
      BtCorretora.Enabled:=True;
      BtProduto.Enabled:=True;
      BtEmpresa.Enabled:=True;
      BtVendedor.Enabled:=True;
      BtOperacao.Enabled:=True;
      BtMensagem.Enabled:=True;
      BtTributacao.Enabled:=True;
      BtMsgCorpoNota.Enabled:=True;
      BtConsPadrao.Enabled:=True;
      SbCidadeCons.Enabled:=True;
      BtOperacaoInclusao.Enabled:=True;
      BtLoteTipo.Enabled:=True;
    end
  else
    begin
      BtBanco.Enabled:=False;
      BtCorretora.Enabled:=False;
      BtProduto.Enabled:=False;
      BtEmpresa.Enabled:=False;
      BtVendedor.Enabled:=False;
      BtOperacao.Enabled:=False;
      BtMensagem.Enabled:=False;
      BtTributacao.Enabled:=False;
      BtMsgCorpoNota.Enabled:=False;
      BtConsPadrao.Enabled:=False;
      SbCidadeCons.Enabled:=False;
      BtOperacaoInclusao.Enabled:=False;
      BtLoteTipo.Enabled:=False;
    end;
end;

procedure TFContrato_Vend.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContrato_VendaCons = nil then
    FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  if FContrato_VendaCons.ShowModal = mrOk then
    begin
      with DMContrato do
        begin
          QContrato_Vend.Close;
          QContrato_vend.SetVariable('PK',QContrato_VendConsCOD_CONTRATO_VEND.Value);
          QContrato_Vend.Open;
          AtzTrib;
          QContrato_VendCons.Close;
        end;
    end;
end;

procedure TFContrato_Vend.ComunicaodeVenda1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[4].TabVisible:=True;
  if FContratoParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME4CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContrato_Vend.Close;
          if Trim(FContratoParam.ME4NrContrato.text)<>'' then
            QRContrato_Vend.SetVariable('NUM_CONTRATO',FContratoParam.ME4NrContrato.text)
          else
            QRContrato_Vend.SetVariable('NUM_CONTRATO',Null);

          if Trim(FContratoParam.ME4CodFilial.text)<>'' then
            QRContrato_Vend.SetVariable('COD_FILIAL',FContratoParam.ME4CodFilial.text)
          else
            QRContrato_Vend.SetVariable('COD_FILIAL',Null);

          QRContrato_Vend.Open;

          QRContrato_Vend_Pagto.Close;
          QRContrato_Vend_Pagto.Open;

          if FRContrato_venda = nil then
            FRContrato_venda := TFRContrato_venda.Create(Application);

          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContrato_Venda.QuickRep1.Preview
          else
            FRContrato_Venda.QuickRep1.Print;

          QRContrato_Vend.Close;
          QRContrato_Vend_Pagto.Close;
        end;
    end;
end;

procedure TFContrato_Vend.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_VendCOD_FILIAL.Text),'AGRICOLA');
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
    If DMContrato.QContrato_VendCod_Operacao_Inclusao.Text = ''  Then
       Raise exception.Create('Informar operação para inclusão contabil');
  if DmContrato.QContrato_Vend.State in [Dsinsert,DsEdit]  then
  Begin
     DMContrato.AtualizaContrato;  // atualiza os saldos dos contratos

     DmContrato.QContrato_Vend.Post;
  End;
  if DMOracle.DBCemapa.inTransaction then
     DMOracle.DBCemapa.Commit;
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
   Begin
     DmContrato.QContrato_Vend_Pagto.Close;
     DmContrato.QContrato_Vend_Pagto.Open;
     PageControl1.SelectNextPage(True);
   End;
end;

procedure TFContrato_Vend.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMContrato.QContrato_Vend_Pagto.Cancel;
  DMOracle.DBCemapa.RollBack;
  SBRefreshClick(Self);
end;

procedure TFContrato_Vend.ConfirmaContrato1Click(Sender: TObject);
var comissao: Real;
begin
  inherited;
  if (DMContrato.QContrato_VendCod_Contrato_vend.Value <> 0) then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrato_VendCOD_FILIAL.Text),'AGRICOLA');
      if FContrato_vend_Confirma = Nil  then
         FContrato_vend_Confirma := TFContrato_vend_Confirma.Create(Application);
      FContrato_vend_Confirma.MeDtEmissao.Text := DMContrato.QContrato_VendDT_CONTRATO.Text;   
      comissao := 0;   
      if (DMContrato.QContrato_VendInd_Conf.Value <> 'S') then
         comissao := trunc((DMContrato.QContrato_VendTotal.Value*DMContrato.QContrato_VendPERC_COMISSAO.Value/100)*100)/100;
      if comissao > 0 then
       begin
         FContrato_vend_Confirma.MEValorComissao.Text:=formatFloat('#,##0.00',comissao);
         FContrato_vend_Confirma.GBCP.Visible:=True;
       end
      else
       begin
         FContrato_vend_Confirma.MEValorComissao.Clear;
         FContrato_vend_Confirma.GBCP.Visible:=False;
       end;
      FContrato_vend_Confirma.ShowModal;
    end
  else
    ShowMessage('Erro! Nenhum contrato está selecionado.');
end;

procedure TFContrato_Vend.VoltaConfirmao1Click(Sender: TObject);
begin
  inherited;
  with DMContrato do
    begin
     if QContrato_VendCod_Contrato_Vend.Value>0 then
       begin
         DmUsuario.Checar_Filial_Usuario( Trim(QContrato_VendCOD_FILIAL.Text),'AGRICOLA');
         if QContrato_VendIND_CONF.Value = 'S' then
           begin
             Try
               DMOracle.DBCemapa.StartTransaction;
               QContasPagar_Vend.Open;
               QContasPagarMov_Vend.Open;
               QContasReceber_Vend.Open;
               QContasReceberMov_Vend.Open;
               MudaStatus('N');
               If Not QContasPagar_Vend.Eof Then
                  Remove_CP_CR('CP');
               If Not QContasReceber_Vend.Eof Then
                  Remove_CP_CR('CR');
               DMPlanilha.DesContabiliza(QContrato_VendCOD_CONTRATO_VEND.Value,'CVENDA');
               QContasReceber_Vend.Close;
               QContasReceberMov_Vend.Close;
               QContasPagar_Vend.Close;
               QContasPagarMov_Vend.Close;
               if DMOracle.DBCemapa.InTransaction then
                 begin
                   DMOracle.DBCemapa.Commit;
                   ShowMessage('Volta de Movimentos efetuada com Sucesso.');
                 end;
             Except
               QContasReceber_Vend.Close;
               QContasReceberMov_Vend.Close;
               QContasPagar_Vend.Close;
               QContasPagarMov_Vend.Close;
               QContrato_Vend.Cancel;
               if DMOracle.DBCemapa.InTransaction then
                 begin
                   DMOracle.DBCemapa.Rollback;
                   ShowMessage('Não foi possivel voltar os Movimentos!');
                 end;
               Raise;
             end;
           end
         else
           ShowMessage('Erro! Este Contrato ainda não foi Confirmado');
       end;
    end;
end;

procedure TFContrato_Vend.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  FoperacaoCons.RGTipoOperacao.ItemIndex :=  1;
  if FOperacaoCons.ShowModal = mrOk then
   begin
     MECodOperacao.Text:=DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
     MECodOperacaoExit(Self);
   end;
end;

procedure TFContrato_Vend.MECodOperacaoExit(Sender: TObject);
begin
  inherited;
  if MECodOperacao.text<>'' then
    MEOperacao.Text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacao.text)
  else
    MEOperacao.clear;
end;

procedure TFContrato_Vend.BitBtn1Click(Sender: TObject);
Var wFutura,wPagto,wComando : String;
    wNumNota : Integer;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'AGRICOLA');
  with DMNotaSaida do
   begin
     if Checa then
      begin
        Try
          DMOracle.DBCemapa.StartTransaction;
          pTR := False;
          pTRF := False;
          QNotaSaida.Close;
          QItemNF.Close;
          QNotaSaida.SetVariable('PK',0);
          QNotaSaida.Open;
          QItemNF.Open;
          QSomaItemNota.Open;
          if Trim(MeNrNota.Text) = '' Then
             wNumNota := 0
          else
             wNumNota := StrToInt(Trim(MeNrNota.Text));
          If RGPagto.ItemIndex = 0 Then
             wPagto := '1'
          Else
             wPagto := '2';
          GeraNF(StrToInt(Trim(MECodOperacao.text)),
                 MECodSerie.text,
                 MESerieModelo.Text,
                 StrToFloat(MEQtde.text),
                 DMContrato.QContrato_VendPRECO.Value,
                 StrToInt(Trim(MeCodFilial.Text)),
                 DMContrato.QContrato_VendCOD_CADASTRO.Value,
                 DMContrato.QContrato_VendCOD_PRODUTO.Value,
                 DMContrato.QContrato_VendCOD_CONTRATO_VEND.Value,
                 MECodTransportadora.text,
                 StrToInt(Trim(MECodTribProd.Text)),
                 MEtransportadora.text,
                 MEPlaca.text,
                 MEEspecie.Text,
                 MEObs.Text,
                 MEObs1.Text,
                 wNumNota,MeDtEmissao.Text,
                 wPagto,MeCodMens.Text,RgTipoFrete.ItemIndex,DMContrato.QContrato_VendCOD_MSG_CORPO_NOTA.Text,MeDtSaida.Text,MeCodTribFrete.Text,
                 MeNumFrete.Text,MePrecoTon.Text,MeValFrete.Text,MeValPedagio.Text,MeDtEmissaoFrete.Text,MeOrdemCarregamento.Text,
                 MeOperacaoFrete.Text,MeCodTribFrete.Text,MeBaseCalculo.Text,MeValIcm.Text,MeParceria.Text,Trim(MeMotorista.Text),
                 trim(MEClassificadora.Text),trim(MeDepartamento.Text),MEDCO.Text,'',Trim(MeArmazemAlfandegado.Text),Trim(MeMensagemCorpo.Text),'',MeLote.Text);
          wFutura:=DMOracle.BuscaNome('SELECT IND_FUTURA_CLIENTE FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacao.text);
          If wFutura <> 'V' Then
             VoltaSaldo(DMContrato.QContrato_VendSALDO_NF_EMBARQUE.Value,StrToFloat(MEQtde.text),'D');

          ConfirmaNF;
          SBRefreshClick(Self);
          Limpa;
          AtzTrib;
          If DMOracle.DBCemapa.InTransaction Then
             DMOracle.DBCemapa.Commit;
          If DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Text <> '' then
            With DMOracle do
            Begin
              QExecSQL.Close;
              QExecSQL.SQL.Clear;
              wComando := 'UPDATE TB_ORDEM_CARREGAMENTO_CAB SET IND_SITUACAO=' +Chr(39) + 'B' + Chr(39);
              wComando := wComando + ',COD_NOTA_CAB='+QNotaSaidaCod_Nota_Cab.Text+' WHERE COD_ORDEM_CARREGAMENTO_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Ordem_Carregamento_Cab.Value);
              QExecSQL.SQL.Add(wComando);
              QExecSQL.ExecSQL;
              If DMOracle.DBCemapa.InTransaction then
                 DMOracle.DBCemapa.Commit;
            End;
          QNotaSaida.Close;
          QItemNF.Close;
        except
          DMOracle.DBCemapa.Rollback;
          QNotaSaida.Close;
          QItemNF.Close;
          Raise;
          // Exception.Create('Erro! Não foi possível confirmar os dados para esta Nota.');
        end;
      end
    else
      ShowMessage('Erro! Os dados informados são inválidos.'+#13+'Favor corrigí-los antes de tentar gerar a nota.');
  end;
end;

Function TFContrato_Vend.Checa: Boolean;
Var num :Real;
Begin
  if (MECodOperacao.text<>'') and (MECodSerie.text <>'')
      and (MEQtde.Text<>'') 
      and (METransportadora.text<>'') and (MECodTribProd.text<>'') then
    begin
      Try
        num:=StrToFloat(MEQtde.text);
        if num > DMContrato.QContrato_VendSALDO_NF_EMBARQUE.Value then
          begin
            Result:=False;
            Showmessage('Erro! A quantidade a ser aplicada é superior ao Saldo disponível.');
          end
        else
          Result:=True;
      except
        Raise Exception.Create('Erro! Quantidade inválida ou em branco.');
      end;
    end
  else
    Result:=False;
end;

procedure TFContrato_Vend.GeraNF(pCodOperacao: Integer; pCodSerie, pSerieModelo: String;
                                 pQtde, pValUnitario:Real; pFilial, pCadastro1 : Integer;
                                 pProduto:Real; pCodContratoVenda:Integer;
                                 pCodTransp:String; pCodTribProd: Integer;
                                 pTransportadora,pPlaca,pEspecie,pObs,pObs1:String;
                                 pNumNota:Integer;pDtEmissao,pPagto,pCodObs:String;
                                 pTipoFrete:Integer;pCodMsgCorpo,pDtSaida,pCodTrFrete:String;
                                 pNumFrete,pPrecoTon,pValFrete,pValPedagio,pDtEmissaoFrete,pOrdemCarregamento:String;
                                 pOperacaoFrete,pCodTribFrete,pBaseCalculo,pValIcm,pParceria,pMotorista:String;
                                 pCodClassificadora,pDepartamento,pDCO,pVal_Despesas,pArmazemAlfandegado,PMensagemCorpo,pCod_Obra,pLote : string);
Var wUnidade, wMens_Corpo : String;
begin
  Try
    With DMNotaSaida do
     begin
       QNotaSaida.Insert;
       If pCodContratoVenda <> 0 Then // quando gera nota fiscal a partir do romaneio diversos este campo vem com zeros
          QNotaSaidaCod_Contrato_Vend.Value  := pCodContratoVenda;
       QNotaSaidaCOD_OPERACAO.Value       := pCodOperacao;
       QNotaSaidaCOD_SERIE.Value          := pCodSerie;
       QNotaSaidaCOD_SERIE_MODELO.Value   := pSerieModelo;
       QNotaSaidaCOD_FILIAL.Value         := pFilial;
       QNotaSaidaCOD_CADASTRO.Value       := pCadastro1;
       QNotaSaidaDESC_PLACA.Value         := pPlaca;
       QNotaSaidaDESC_ESPECIE.Value       := pEspecie;
       QNotaSaidaOBS.Value                := pObs;

       if pObs1 = '' then
          QNotaSaidaOBS_COMPLEMENTO.Value := 'Número Contrato Cliente: ' + DMContrato.QContrato_VendCOD_CONTRATO_VEND.Text
       else
          QNotaSaidaOBS_COMPLEMENTO.Value := pObs1 + '\nNúmero Contrato Cliente: ' + DMContrato.QContrato_VendNUM_CONTRATO_CLIENTE.Text;

       QNotaSaidaNum_Nota.Value           := PNumNota;
       QNotaSaidaInd_Condicao_Pagto.Value := pPagto;
       QNotaSaidaNum_Dco.Value            := pDCO;

       //------fabiano: 08/03/2005--------------
       if Trim(pCodClassificadora) <> '' then
         QNotaSaidaCOD_CADASTRO_CLASSIFICACAO.Value := StrToInt(Trim(pCodClassificadora))
       else
         QNotaSaidaCOD_CADASTRO_CLASSIFICACAO.Clear; //null
       //------fim fabiano--------------
       
       if Trim(pDepartamento) <> '' Then
          QNotaSaidaCod_Departamento.Value := StrToInt(Trim(pDepartamento));
       if Trim(PCodObs) <> '' Then
          QNotaSaidaCod_Mensagem.Value := StrToInt(Trim(pCodObs));
       If Trim(PDtEmissao) <> '' Then
          QNotaSaidaDt_Emissao.Value:=StrToDate(PDtEmissao);
       If Trim(PDtSaida) <> '' Then
          QNotaSaidaDt_Recebimento.Value:=StrToDate(PDtSaida);
       if Trim(pCodTransp)<>'' then
         QNotaSaidaCOD_TRANSPORTADOR.Value:=StrToInt(pCodTransp)
       else
         QNotaSaidaDESC_TRANSPORTADORA.Value:=pTransportadora;
       If pTipoFrete = 0 Then
         QNotaSaidaIND_TIPO_FRETE.Value := 'CIF'
       Else
         QNotaSaidaIND_TIPO_FRETE.Value := 'FOB';
       If pCodTrFrete <> '' Then
          QNotaSaidaCOD_TRIBUTACAO_FRETE.Value := StrToInt(pCodTrFrete);
       If pNumFrete <> '' Then
          QNotaSaidaNum_Conhecimento_Frete.Value := StrToInt(pNumFrete);
       If pPrecoTon <> '' Then
          QNotaSaidaVal_Frete_Ton.Value := StrToFloat(pPrecoTon);
       If pValFrete <> '' Then
          QNotaSaidaVal_Frete.Value := StrToFloat(pValFrete);
       If pValPedagio <> '' Then
          QNotaSaidaVal_Pedagio.Value := StrToFloat(pValPedagio);
       If pDtEmissaoFrete <> '' Then
          QNotaSaidaDt_Emissao_CF.Value := StrToDate(PDtEmissaoFrete);
       If pOrdemCarregamento <> '' Then
          QNotaSaidaCod_Ordem_Carregamento_Cab.Value := StrToInt(pOrdemCarregamento);
       If pOperacaoFrete <> '' Then
          QNotaSaidaCod_Operacao_Cf.Value := StrToInt(pOperacaoFrete);
       If pCodTribFrete <> '' Then
          QNotaSaidaCod_Tributacao_Frete.Value := StrToInt(pCodTribFrete);
       If pBaseCalculo <> '' Then
          QNotaSaidaVal_Icm_Base_Frete.Value := StrToFloat(pBaseCalculo);
       If pValIcm <> '' Then
          QNotaSaidaVal_Icm_Frete.Value := StrToFloat(pValIcm);
       If pParceria <> '' Then
          QNotaSaidaCod_Cadastro_Parceiro.Value := StrToInt(pParceria);
       If pMotorista <> '' Then
          QNotaSaidaCod_Motorista.Value := StrToInt(pMotorista);
       If pVal_Despesas <> '' Then
          QNotaSaidaVal_Despesas.Value := StrToFloat(pVal_Despesas);
       If Trim(pArmazemAlfandegado) <> '' Then
          QNotaSaidaCod_Armazem_Alfandegado.Value := StrToInt(Trim(pArmazemAlfandegado));
       If Trim(pCod_Obra) <> '' Then
          QNotaSaidaCod_Obra.Value := StrToInt(Trim(pCod_Obra));
       wMens_Corpo := '';
       If pCodMsgCorpo <> '' Then
        Begin
          DMMensagem.QMensagem.Close;
          DMMensagem.QMensagem.SetVariable('PK',pCodMsgCorpo);
          DMMensagem.QMensagem.Open;
          wMens_Corpo := DMMensagem.QMensagemDesc_Mensagem.Value + ' ' + DMMensagem.QMensagemDesc_Complemento.Value + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento1.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento1.Value + ' ' + DMMensagem.QMensagemDesc_Complemento2.Value + ' ' + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento3.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento3.Value + ' ' + DMMensagem.QMensagemDesc_Complemento4.Value + ' ' + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento5.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento5.Value + ' ' + DMMensagem.QMensagemDesc_Complemento6.Value + ' ' + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento7.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento7.Value + Chr(13) + Chr(10);

          DMMensagem.QMensagem.Close;
        End;
       If pMensagemCorpo <> '' Then
        Begin
          DMMensagem.QMensagem.Close;
          DMMensagem.QMensagem.SetVariable('PK',pMensagemCorpo);
          DMMensagem.QMensagem.Open;
          wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Mensagem.Value + ' ' + DMMensagem.QMensagemDesc_Complemento.Value + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento1.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento1.Value + ' ' + DMMensagem.QMensagemDesc_Complemento2.Value + ' ' + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento3.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento3.Value + ' ' + DMMensagem.QMensagemDesc_Complemento4.Value + ' ' + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento5.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento5.Value + ' ' + DMMensagem.QMensagemDesc_Complemento6.Value + ' ' + Chr(13) + Chr(10);
          If DMMensagem.QMensagemDesc_Complemento7.Value <> '' Then
             wMens_Corpo := wMens_Corpo + DMMensagem.QMensagemDesc_Complemento7.Value + Chr(13) + Chr(10);

          DMMensagem.QMensagem.Close;
        End;
        if (DMParamSistema.CodEmpresa = 'GONZATTI') and (pMotorista <> '') then
          wMens_Corpo := Bib.ift(wMens_Corpo = '', '', wMens_Corpo + '. ') + 'MOTORISTA: ' + pMotorista;
        If  Trim(wMens_Corpo) <> '' Then
            QNotaSaidaDESC_OBS_CORPO_NOTA.Value := wMens_Corpo;

       pGravando := True;
       QItemNF.Insert;
       //QItemNFQT_QUANTIDADE.Value := pQtde;
       If DMParamSistema.QParamSistemaCod_Empresa.Value = 'SRTERRA' Then
         QItemNFQT_QUANTIDADE.Value := StrToFloat(formatfloat('#########0.00',pQtde))
       else
         QItemNFQT_QUANTIDADE.Value := pQtde;
       QItemNFCOD_PRODUTO.Value := pProduto;
       If pLote <> '' Then
          QItemNFCod_Lote_Tipo.Value := StrToInt(Trim(pLote));
       QItemNFCOD_TRIBUTACAO.Value := pCodTribProd;
       QItemNFVAL_UNITARIO.Value := pValUnitario;
       wUnidade := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(pProduto),True);
       If Trim(wUnidade) <> '' then
          QItemNFVal_Total.Value := pQtde*pValUnitario/StrToFloat(wUnidade);
       QItemNFCOD_CST_PIS.Text :=
        DMOracle.FastSelect('COD_CST_PIS_SAIDA','TB_PRODUTO','COD_PRODUTO = '+
        QItemNFCOD_PRODUTO.Text);
       QItemNFCOD_CST_COFINS.Text :=
        DMOracle.FastSelect('COD_CST_COFINS_SAIDA','TB_PRODUTO','COD_PRODUTO = '+
        QItemNFCOD_PRODUTO.Text);
       QItemNF.Post;
       pGravando := False;
     end;
  except
    DMNotaSaida.QItemNF.Cancel;
    DMNotaSaida.QNotaSaida.Cancel;
    Raise;
  end;
end;

procedure TFContrato_Vend.ConfirmaNF;
begin
  with DMNotaSaida do
    begin
      Try
        If QNotaSaidaInd_Situacao.Value = '2' Then
          Raise Exception.Create('Nota Fiscal já confirmada!');
        If QNotaSaidaInd_Situacao.Value = '3' Then
          Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
        If FNotaSaida_Confirma = Nil then
          FNotaSaida_Confirma := TFNotaSaida_Confirma.Create(Application);
        ChecaNota;
        FNotaSaida_Confirma.pAtivado := False;
        pConfirmando := True;
        
        FNotaSaida_Confirma.ShowModal;
        pConfirmando := False;
        FNotaSaida_Confirma.pAtivado := False;
      Except
        DMNotaSaida.QNotaSaida.EnableControls;
        DMNotaSaida.QItemNF.EnableControls;
        Raise;
      End;
    End;
end;

procedure TFContrato_Vend.Limpa;
begin
  MECodOperacao.Clear;
  MECodOperacaoExit(Self);
  MECodSerie.Clear;
  MESerieModelo.Clear;
  MEQtde.Clear;
  MECodTransportadora.Clear;
  MECodTransportadoraExit(Self);
  MECodTribProd.Clear;
  MECodTribProdExit(Self);
  MEPlaca.Clear;
  MEObs.Clear;
  MEObs1.Clear;
  MeDtEmissao.Text := DateToStr(DMOracle.DataServ);
  MeNrNota.Text := '';
  RgTipoFrete.ItemIndex := 0;
  MeNumFrete.Clear;
  MePrecoTon.Clear;
  MeValFrete.Clear;
  MeValPedagio.Clear;
  MeDtEmissaoFrete.Clear;
  MeOrdemCarregamento.Clear;
  MEPlaca.Clear;
  MeOperacaoFrete.Clear;
  MeCodTribFrete.Clear;
  MeBaseCalculo.Clear;
  MeValIcm.Clear;
  MeMotorista.Clear;
  MEClassificadora.Clear;
  MeDepartamento.Clear;
  MeMensagemCorpo.Clear;
end;

procedure TFContrato_Vend.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    begin
      MECodTransportadora.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
      MECodTransportadoraExit(Self);
    end;
end;

procedure TFContrato_Vend.MECodTransportadoraExit(Sender: TObject);
begin
  inherited;
  if MECodTransportadora.Text<>''  then
    METransportadora.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodTransportadora.Text)
  else
    METransportadora.Clear;
end;

procedure TFContrato_Vend.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons := TFtributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal  = MrOk then
    begin
      MECodTribProd.text:=DMtributacao.QtributacaoConsCod_Tributacao.text;
      MECodTribProdExit(Self);
    end;
end;

procedure TFContrato_Vend.PageControl1Change(Sender: TObject);
begin
  inherited;
  if PageControl1.Pages[3].Visible then
    AtzTrib;
  MeDtEmissao.Text := DateToStr(DMOracle.DataServ);
  MeDtSaida.Text := DateToStr(DMOracle.DataServ);
end;

procedure TFContrato_Vend.MECodTribProdExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodTribProd.Text)<>'' then
    METribut.Text:=DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+MECodTribProd.text)
  else
    METribut.Clear;
end;

procedure TFContrato_Vend.AtzTrib;
begin
  with DMFilial do
  begin
    QFilial.Close;
    QFilial.SetVariable('PK', DMContrato.QContrato_VendCOD_FILIAL.Value);
    QFilial.Open;
  end;
  MECodTribProd.text:=DMContrato.QContrato_VendCod_tributacao.Text;
  MECodTribProdExit(Self);
  MECodFilial.text:=DMContrato.QContrato_VendCod_Filial.Text;
  MECodFilialExit(Self);
  MeCodOperacao.Text := DMContrato.QContrato_VendCod_Operacao.Text;
  MeCodOperacaoExit(Self);
  MeCodSerie.Text := DMFilial.QFilialCOD_SERIE.Value;
  MeSerieModelo.Text := DMFilial.QFilialCOD_SERIE_MODELO.Value;
  MeCodMens.Text := DMContrato.QContrato_VendCod_Mensagem.Text;
  MeArmazemAlfandegado.Text := DMContrato.QContrato_VendCod_Armazem_Alfandegado.Text;
  MeLote.Text := DMContrato.QContrato_VendCod_Lote_Tipo.Text;
  If DMContrato.QContrato_VendInd_Tipo_Frete.Value = 'CIF' Then
     RgTipoFrete.ItemIndex := 0
  else
     RgTipoFrete.ItemIndex := 1;
  If DMContrato.QContrato_VendInd_Condicao_Pagto.Value = '1' Then
     RGPagto.ItemIndex := 0
  else
     RGPagto.ItemIndex := 1;
  MeTransportadora.Text := '.';
  MeParceria.Text := '';
  if DMContrato.QContrato_VendIND_SITUACAO_CUSTO.Value = 'A' Then
  Begin
    FContrato_Vend.FecharCustos1.Enabled := True;
    FContrato_Vend.VoltarFechamento1.Enabled := False;
  end
  else
  Begin
    FContrato_Vend.FecharCustos1.Enabled := False;
    FContrato_Vend.VoltarFechamento1.Enabled := True;
  end;  
end;

procedure TFContrato_Vend.MudaStatus(S:String);
begin
  DMContrato.QContrato_Vend.Edit;
  DMContrato.QContrato_VendInd_Conf.Value:=S;
  DMContrato.QContrato_Vend.Post;
end;

procedure TFContrato_Vend.Remove_CP_CR(S: String);
begin
  With DMContrato do
    begin
      if S = 'CP' then
        begin
          While not QContasPagar_Vend.Eof do
           Begin
             If QContasPagarMov_vendInd_Tipo_Movimento.Value <> '' Then
               If (QContasPagarMov_vendInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                  Raise Exception.Create('Erro! Conta a Pagar com baixas!')
               Else
                  QContasPagarMov_Vend.Delete;
             QContasPagar_Vend.Delete;
           End;
        end
      else
        begin
          While not QContasReceber_Vend.Eof do
           Begin
             If QContasReceberMov_VendInd_Tipo_Movimento.Value <> '' Then
               If (QContasReceberMov_vendInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                 Raise Exception.Create('Erro! Conta a Receber com baixas!')
               Else
                 QContasReceberMov_Vend.Delete;
             QContasReceber_Vend.Delete;
           End;
        end;
    end;
end;

procedure TFContrato_Vend.VoltaSaldo(Val_Atual, Val_Aplicar:Real;Op:String);
begin
  with DMContrato do
    begin
      QContrato_Vend.Edit;
      if Op='S' then
        QContrato_VendSALDO_NF_EMBARQUE.Value:=Val_Atual+Val_Aplicar
      else
        QContrato_VendSALDO_NF_EMBARQUE.Value:=Val_Atual-Val_Aplicar;
      QContrato_Vend.Post;
    end;
end;

procedure TFContrato_Vend.METransportadoraEnter(Sender: TObject);
begin
  inherited;
  temp:=METransportadora.Text;
end;

procedure TFContrato_Vend.METransportadoraExit(Sender: TObject);
begin
  inherited;
  if METransportadora.Text<>temp then
    MECodTransportadora.Clear;
end;

procedure TFContrato_Vend.MELocalizaExit(Sender: TObject);
begin
  inherited;
  AtzTrib;
end;

procedure TFContrato_Vend.SBExcluirClick(Sender: TObject);
begin
  Try
  inherited;
  if DMOracle.DBCemapa.InTransaction then
    DMOracle.DBCemapa.Commit;

  except
   Raise Exception.Create('Erro! Não é possível excluir este contrato.'+#13+
                          'Antes volte os dados gerados pelo contas a pagar,'+#13+
                          'e exclua as parcelas de Pagto.');
  end;
end;

procedure TFContrato_Vend.ContratodeVendacomSaldoemAberto1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[9].TabVisible:=True;
  if FContratoParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME9CodFilial.Text),'AGRICOLA');
      With DMContrato do
        begin
          QRContratoVend_Aberto.Close;
          if Trim(FContratoParam.ME9CodFilial.text)<>'' then
            QRContratoVend_Aberto.SetVariable('COD_FILIAL',FContratoParam.ME9CodFilial.text)
          else
            QRContratoVend_Aberto.SetVariable('COD_FILIAL',Null);
          if Trim(FContratoParam.ME9CodProduto.text)<>'' then
            QRContratoVend_Aberto.SetVariable('COD_PRODUTO',FContratoParam.ME9CodProduto.text)
          else
            QRContratoVend_Aberto.SetVariable('COD_PRODUTO',Null);
          if Trim(FContratoParam.ME9CodCliente.text)<>'' then
            QRContratoVend_Aberto.SetVariable('COD_CADASTRO',FContratoParam.ME9CodCliente.text)
          else
            QRContratoVend_Aberto.SetVariable('COD_CADASTRO',Null);
          case FContratoParam.RG9TipoMercado.ItemIndex of
            0:QRContratoVend_Aberto.SetVariable('MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('INTERNO'));
            1:QRContratoVend_Aberto.SetVariable('MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('EXTERNO'));
            2:QRContratoVend_Aberto.SetVariable('MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('EXPORTACAO'));
            3:QRContratoVend_Aberto.SetVariable('MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('REM.DEPOS.'));
            4:QRContratoVend_Aberto.SetVariable('MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO <> ' + QuoteDStr('REM.DEPOS.'));
            5:QRContratoVend_Aberto.SetVariable('MERCADO','1=1');
          end;
          if Trim(FContratoParam.Me9DtContrato_Inic.Text) <> '' then
            QRContratoVend_Aberto.SetVariable('DT_CONTRATO_INIC',FContratoParam.Me9DtContrato_Inic.text)
          else
            QRContratoVend_Aberto.SetVariable('DT_CONTRATO_INIC',Null);

          if Trim(FContratoParam.Me9DtContrato_Fim.Text) <> '' then
            QRContratoVend_Aberto.SetVariable('DT_CONTRATO_FIM',FContratoParam.Me9DtContrato_Fim.text)
          else
            QRContratoVend_Aberto.SetVariable('DT_CONTRATO_FIM',Null);

          if Trim(FContratoParam.Me9DtEntrega_Inic.Text) <> '' then
            QRContratoVend_Aberto.SetVariable('DT_ENTREGA_INIC',FContratoParam.Me9DtEntrega_Inic.text)
          else
            QRContratoVend_Aberto.SetVariable('DT_ENTREGA_INIC',Null);

          if Trim(FContratoParam.Me9DtEntrega_Fim.Text) <> '' then
            QRContratoVend_Aberto.SetVariable('DT_ENTREGA_FIM',FContratoParam.Me9DtEntrega_Fim.text)
          else
            QRContratoVend_Aberto.SetVariable('DT_ENTREGA_FIM',Null);

          if Trim(FContratoParam.ME9Operacao.Text) <> '' then
            QRContratoVend_Aberto.SetVariable('COD_OPERACAO',FContratoParam.ME9Operacao.text)
          else
            QRContratoVend_Aberto.SetVariable('COD_OPERACAO',Null);

          QRContratoVend_Aberto.Open;
          if FRContratoVend_Aberto = nil then
            FRContratoVend_Aberto := TFRContratoVend_Aberto.Create(Application);
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoVend_Aberto.QRPrimario.Preview
          else
            FRContratoVend_Aberto.QRPrimario.Print;
          QRContratoVend_Aberto.Close;
        end;
    end;
end;

procedure TFContrato_Vend.ContratodevendacMovimentao1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil  then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[10].TabVisible:=True;
  if FContratoParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME10CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContrato_Venda.Close;
          QRContratoVend_Mov.Close;
//          QRNota_Contrato.Close;
          if Trim(FContratoParam.ME10CodFilial.text)<>'' then
            QRContrato_Venda.SetVariable('COD_FILIAL',FContratoParam.ME10CodFilial.text)
          else
            QRContrato_Venda.SetVariable('COD_FILIAL',Null);

          if Trim(FContratoParam.ME10CodCliente.text)<>'' then
            QRContrato_Venda.SetVariable('COD_CADASTRO',FContratoParam.ME10CodCliente.text)
          else
            QRContrato_Venda.SetVariable('COD_CADASTRO',Null);

          if Trim(FContratoParam.ME10CodProduto.text)<>'' then
            QRContrato_Venda.SetVariable('COD_PRODUTO',FContratoParam.ME10CodProduto.text)
          else
            QRContrato_Venda.SetVariable('COD_PRODUTO',Null);

          if Trim(FContratoParam.ME10Contrato.text)<>'' then
            QRContrato_Venda.SetVariable('CONTRATO',FContratoParam.ME10Contrato.text)
          else
            QRContrato_Venda.SetVariable('CONTRATO',Null);
          if Trim(FContratoParam.Me10DtInicial.text)<>'' then
            QRContratoVend_Mov.SetVariable('DT_RECEBTO_INIC',Trim(FContratoParam.Me10DtInicial.text))
          else
            QRContratoVend_Mov.SetVariable('DT_RECEBTO_INIC',Null);
          if Trim(FContratoParam.Me10DtFinal.text)<>'' then
            QRContratoVend_Mov.SetVariable('DT_RECEBTO_FIM',Trim(FContratoParam.Me10DtFinal.text))
          else
            QRContratoVend_Mov.SetVariable('DT_RECEBTO_FIM',Null);

          QRContrato_Venda.Open;
          QRContratoVend_Mov.Open;
 //         QRNota_Contrato.Open;

          if FRContratoVend_Mov=Nil then
            FRContratoVend_Mov:=TFRContratoVend_Mov.Create(Application);

          if FContratoParam.RGPreview.ItemIndex = 0 then
             FRContratoVend_Mov.QRPrimario.Preview
          else
             FRContratoVend_Mov.QRPrimario.Print;

          QRContrato_Venda.Close;
          QRContratoVend_Mov.Close;
        end;
    end;
end;

procedure TFContrato_Vend.ContratocSaldodeEmbarque1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil  then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[11].TabVisible:=True;
  if FContratoParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME11CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContratoVenda_SaldoEmb.Close;
          if Trim(FContratoParam.ME11CodFilial.text)<>'' then
            QRContratoVenda_SaldoEmb.SetVariable('COD_FILIAL',FContratoParam.ME11CodFilial.text)
          else
            QRContratoVenda_SaldoEmb.SetVariable('COD_FILIAL',Null);
          if Trim(FContratoParam.ME11CodCadastro.text)<>'' then
            QRContratoVenda_SaldoEmb.SetVariable('COD_CADASTRO',FContratoParam.ME11CodCadastro.text)
          else
            QRContratoVenda_SaldoEmb.SetVariable('COD_CADASTRO',Null);
          if Trim(FContratoParam.ME11CodProduto.text)<>'' then
            QRContratoVenda_SaldoEmb.SetVariable('COD_PRODUTO',FContratoParam.ME11CodProduto.text)
          else
            QRContratoVenda_SaldoEmb.SetVariable('COD_PRODUTO',Null);
          if Trim(FContratoParam.Me11DtInicial.text)<>'' then
            QRContratoVenda_SaldoEmb.SetVariable('DT_INICIAL',FContratoParam.Me11DtInicial.text)
          else
            QRContratoVenda_SaldoEmb.SetVariable('DT_INICIAL',Null);
          if Trim(FContratoParam.Me11DtFinal.text)<>'' then
            QRContratoVenda_SaldoEmb.SetVariable('DT_FINAL',FContratoParam.Me11DtFinal.text)
          else
            QRContratoVenda_SaldoEmb.SetVariable('DT_FINAL',Null);
          case FContratoParam.RG11TipoMercado.ItemIndex of
            0:QRContratoVenda_SaldoEmb.SetVariable('TIPO_MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('INTERNO'));
            1:QRContratoVenda_SaldoEmb.SetVariable('TIPO_MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('EXTERNO'));
            2:QRContratoVenda_SaldoEmb.SetVariable('TIPO_MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('EXPORTACAO'));
            3:QRContratoVenda_SaldoEmb.SetVariable('TIPO_MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO = ' + QuoteDStr('REM.DEPOS.'));
            4:QRContratoVenda_SaldoEmb.SetVariable('TIPO_MERCADO','TB_CONTRATO_VEND.IND_TIPO_MERCADO <> ' + QuoteDStr('REM.DEPOS.'));
            5:QRContratoVenda_SaldoEmb.SetVariable('TIPO_MERCADO','1=1');
          end;
          Case FContratoParam.Rg11TipoPreco.ItemIndex of
            0 : QRContratoVenda_SaldoEmb.SetVariable('IND_TIPO_PRECO','FIXO');
            1 : QRContratoVenda_SaldoEmb.SetVariable('IND_TIPO_PRECO','FIXAR');
            2 : QRContratoVenda_SaldoEmb.SetVariable('IND_TIPO_PRECO',NULL);
          End;
          QRContratoVenda_SaldoEmb.Open;

          if FRContratoVenda_SaldoEmb=Nil then
           FRContratoVenda_SaldoEmb:=TFRContratoVenda_SaldoEmb.Create(Application);

          if (Trim(FContratoParam.Me11DtInicial.text) <> '') and (Trim(FContratoParam.Me11DtFinal.text) <> '') then
            FRContratoVenda_SaldoEmb.qrldataembarque.Caption := Trim(FContratoParam.Me11DtInicial.text) + '-' + Trim(FContratoParam.Me11DtFinal.text);

          if FContratoParam.RGPreview.ItemIndex=0 then
            FRContratoVenda_SaldoEmb.QRPrimario.Preview
          else
            FRContratoVenda_SaldoEmb.QRPrimario.Print;
          QRContratoVenda_SaldoEmb.Close;
        end;
    end;
end;

procedure TFContrato_Vend.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (39);
end;

procedure TFContrato_Vend.SBIncluirClick(Sender: TObject);
begin
  inherited;
  FContrato_Vend.DBEdit2.SetFocus;
  FContrato_Vend.FecharCustos1.Enabled := True;
end;

procedure TFContrato_Vend.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.text)<>'' then
    MEFilial.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.text)
  else
    MEFilial.Clear;
  DMOracle.ValidaFilial(MECodFilial.Text);
end;

procedure TFContrato_Vend.Bt12FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    begin
      MECodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;
      MECodFilialExit(Self);
    end;

end;

procedure TFContrato_Vend.SaldoContbilContratoVenda1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil  then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[13].TabVisible:=True;
  FContratoParam.Me13DtBase.text := DateToStr(Date);
  if FContratoParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME13CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContrato_Vend_Contabil.Close;
          if Trim(FContratoParam.ME13CodFilial.text)<>'' then
            QRContrato_Vend_Contabil.SetVariable('COD_FILIAL',FContratoParam.ME13CodFilial.text)
          else
            QRContrato_Vend_Contabil.SetVariable('COD_FILIAL',Null);
          if Trim(FContratoParam.ME13Contrato.text)<>'' then
            QRContrato_Vend_Contabil.SetVariable('NUM_CONTRATO',FContratoParam.ME13Contrato.text)
          else
            QRContrato_Vend_Contabil.SetVariable('NUM_CONTRATO',Null);
          if Trim(FContratoParam.ME13CodCliente.text)<>'' then
            QRContrato_Vend_Contabil.SetVariable('COD_CADASTRO',FContratoParam.ME13CodCliente.text)
          else
            QRContrato_Vend_Contabil.SetVariable('COD_CADASTRO',Null);
          QRContrato_Vend_Contabil.SetVariable('DATA_BASE',FContratoParam.Me13DtBase.text);

          QRContrato_Vend_Contabil.Open;

          if FrContratoVend_Contabil=Nil then
           FrContratoVend_Contabil:=TFrContratoVend_Contabil.Create(Application);
          FrContratoVend_Contabil.QrlFilial.Caption := 'Filial:' +Trim(FContratoParam.ME13Filial.text);
          if FContratoParam.RGPreview.ItemIndex=0 then
            FrContratoVend_Contabil.QRPrimario.Preview
          else
            FrContratoVend_Contabil.QRPrimario.Print;
          QRContrato_Vend_Contabil.Close;
        end;
    end;

end;

procedure TFContrato_Vend.AnliseCustosContrato1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil  then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[14].TabVisible:=True;
  if FContratoParam.ShowModal=mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME14CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContrato_Vend.Close;
          QRContrato_Vend_Nota_Custos.Close;
          if Trim(FContratoParam.ME14CodFilial.text)<>'' then
            QRContrato_Vend.SetVariable('COD_FILIAL',FContratoParam.ME14CodFilial.text)
          else
            Raise Exception.Create('Informar Código Filial');
          if Trim(FContratoParam.ME14Contrato.text)<>'' then
            QRContrato_Vend.SetVariable('NUM_CONTRATO',FContratoParam.ME14Contrato.text)
          else
            QRContrato_Vend.SetVariable('NUM_CONTRATO',Null);

          QRContrato_Vend.Open;
          QRContrato_Vend_Nota_Custos.Open;

          if FrContratoVenda_Custos = Nil then
            FrContratoVenda_Custos := TFrContratoVenda_Custos.Create(Application);
          if FrContratoVenda_Custos1 = Nil then
            FrContratoVenda_Custos1 := TFrContratoVenda_Custos1.Create(Application);
          if FContratoParam.RGPreview.ItemIndex = 0 then
             FrContratoVenda_Custos.QRCompositeReport1.Preview
          else
             FrContratoVenda_Custos.QRCompositeReport1.Print;
          QRContrato_Vend.Close;
          QRContrato_Vend_Nota_Custos.Close;
        end;
    end;

end;

procedure TFContrato_Vend.BtConsMensagemClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    MeCodMens.Text := FloatToStr(DMMensagem.QMensagemConsCod_Mensagem.Value);
end;

procedure TFContrato_Vend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContrato.QContrato_Vend.Close;
  DMContrato.QContrato_Vend_Pagto.Close;
  DMContrato.QContrato_VendMov.Close;
  DMContrato.QContrVend_Nota.Close;
  DMContrato.QContrato_Vend_Variacao.Close;
  DMContrato.QContratoVend_Doc.Close;
  Action := CaFree;
  FContrato_Vend := Nil;
end;

procedure TFContrato_Vend.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons  = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_OPERACAO.Value:=DMOperacao.QOperacaoConsCOD_OPERACAO.Value;
end;

procedure TFContrato_Vend.BtMensagemClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons  = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_MENSAGEM.Value:=DMMensagem.QMensagemConsCOD_MENSAGEM.Value;
end;

procedure TFContrato_Vend.BtTributacaoClick(Sender: TObject);
begin
  inherited;
  if FTributacaoCons  = nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_TRIBUTACAO.Value:=DMTributacao.QTributacaoConsCOD_TRIBUTACAO.Value;
end;

procedure TFContrato_Vend.BtMsgCorpoNotaClick(Sender: TObject);
begin
  inherited;
  if FMensagemCons  = nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  if FMensagemCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_MSG_CORPO_NOTA.Value:=DMMensagem.QMensagemConsCOD_MENSAGEM.Value;

end;

procedure TFContrato_Vend.MeCodTribFreteExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodTribFrete.Text)<>'' then
   Begin
    DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+MECodTribFrete.text);
    With DMTributacao do
    Begin
      QTributacao.Close;
      QTributacao.SetVariable('Pk',StrToInt(MECodTribFrete.Text));
      QTributacao.Open;
      If QTributacaoPerc_Tributado.Value > 0 Then
      Begin
         MeBaseCalculo.Text := FloatToStr(StrToFloat(MeValFrete.Text) * QTributacaoPerc_Tributado.Value / 100);
         MeValIcm.Text := FloatToStr(StrToFloat(MeBaseCalculo.Text) * QTributacaoPerc_Aliquota.Value / 100);
      End;
    End;
  End;
end;

procedure TFContrato_Vend.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FTributacaoCons = Nil then
    FTributacaoCons := TFtributacaoCons.Create(Application);
  if FTributacaoCons.ShowModal  = MrOk then
    begin
      MECodTribFrete.text:=DMtributacao.QtributacaoConsCod_Tributacao.text;
      MECodTribFreteExit(Self);
    end;

end;

procedure TFContrato_Vend.MePrecoTonExit(Sender: TObject);
Var wPeso : Real;
   wEmbalagem,wUnidade,wTipoProduto : String;
begin
  inherited;
  If Trim(MePrecoTon.Text) <> '' Then
  Begin
    wPeso := 0;
    wUnidade := DMOracle.BuscaNome('SELECT DESC_UNIDADE FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato.QContrato_VendCod_Produto.Value));
    wTipoProduto := DMOracle.BuscaNome('SELECT IND_TIPO_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato.QContrato_VendCod_Produto.Value));
    If wTipoProduto <> 'AGRICOLA' Then
       wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+FloatToStr(DMContrato.QContrato_VendCod_Produto.Value));
    If wEmbalagem <> '' Then
       wPeso := wPeso + StrToFloat(MEQtde.Text) * StrToFloat(wEmbalagem)
    Else
       wPeso := wPeso + StrToFloat(MEQtde.Text);
    If wPeso <> 0 Then
       MeValFrete.Text := FloatToStr(wPeso * StrToFloat(MePrecoTon.Text));
    If (Trim(wUnidade) <> 'T') And (StrToFloat(MeValFrete.Text) > 0) Then
       MeValFrete.Text := FloatToStr(StrToFloat(MeValFrete.Text)  / 1000);
  End;
end;

procedure TFContrato_Vend.SpeedButton6Click(Sender: TObject);
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
         MeOrdemCarregamento.Text := QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Text;
         QOrdemCarregamentoCab.Close;
         QOrdemCarregamentoCab.SetVariable('Pk',QOrdemCarregamentoConsCod_Ordem_Carregamento_Cab.Value);
         QOrdemCarregamentoCab.Open;
         QOrdemCarregamentoItem.Close;
         QOrdemCarregamentoItem.Open;
         If QOrdemCarregamentoItemInd_Tipo_Frete.Value = 'CIF' Then
          Begin
            MeMotorista.Text := IntToStr(QOrdemCarregamentoCabCod_Motorista.Value);
            MeValPedagio.Text := FloatToStr(QOrdemCarregamentoItemVal_Pedagio.Value);
            MePrecoTon.Text := FloatToStr(QOrdemCarregamentoItemVal_Frete_Ton.Value);
            MECodTransportadora.Text := IntToStr(QOrdemCarregamentoItemCod_Motorista.Value);
            MECodTransportadoraExit(Self);
            MEPlaca.Text := QOrdemCarregamentoItemDesc_Placa_Veiculo.Value;
            If QOrdemCarregamentoItemInd_Tipo_Pgto.Value = 'C' Then
             Begin
               MeDtEmissaoFrete.Text := DateToStr(QOrdemCarregamentoCabDT_EMISSAO.Value);
               MeNumFrete.Text := '0';
             End;
            MePrecoTonExit(Self);
          End;
       End;
     End;
end;

procedure TFContrato_Vend.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
     FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
     MeOperacaoFrete.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFContrato_Vend.SpeedButton7Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeParceria.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContrato_Vend.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeMotorista.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFContrato_Vend.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MEClassificadora.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
end;

procedure TFContrato_Vend.SbDepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
     MeDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;

end;

procedure TFContrato_Vend.ContratoVendaSaldosQuantidade1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[20].TabVisible:=True;
  if FContratoParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.Me20CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContrato_Vend_Geral.Close;
          if Trim(FContratoParam.ME20Contrato.text)<>'' then
            QRContrato_Vend_Geral.SetVariable('NUM_CONTRATO',FContratoParam.ME20Contrato.text)
          else
            QRContrato_Vend_Geral.SetVariable('NUM_CONTRATO',Null);

          if Trim(FContratoParam.Me20CodFilial.text)<>'' then
            QRContrato_Vend_Geral.SetVariable('COD_FILIAL',FContratoParam.Me20CodFilial.text)
          else
            QRContrato_Vend_Geral.SetVariable('COD_FILIAL',Null);

          if Trim(FContratoParam.Me20CodCadastro.text)<>'' then
            QRContrato_Vend_Geral.SetVariable('COD_CADASTRO',FContratoParam.Me20CodCadastro.text)
          else
            QRContrato_Vend_Geral.SetVariable('COD_CADASTRO',Null);

          if Trim(FContratoParam.Me20CodProduto.text)<>'' then
            QRContrato_Vend_Geral.SetVariable('COD_PRODUTO',FContratoParam.Me20CodProduto.text)
          else
            QRContrato_Vend_Geral.SetVariable('COD_PRODUTO',Null);
          If FContratoParam.Rg20Embarque.ItemIndex = 0 Then
             QRContrato_Vend_Geral.SetVariable('QT_SALDO_EMBARQUE',0)
          Else
             QRContrato_Vend_Geral.SetVariable('QT_SALDO_EMBARQUE',Null);
          If FContratoParam.Rg20Compra.ItemIndex = 0 Then
             QRContrato_Vend_Geral.SetVariable('QT_SALDO_COMPRA',0)
          Else
             QRContrato_Vend_Geral.SetVariable('QT_SALDO_COMPRA',Null);
          Case FContratoParam.Rg20TipoMercado.ItemIndex Of
            0 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_MERCADO','INTERNO');
            1 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_MERCADO','EXTERNO');
            2 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_MERCADO','EXPORTACAO');
            3 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_MERCADO','REM.DEPOS.');
            4 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_MERCADO',Null);
          End;
          Case FContratoParam.Rg20Custos.ItemIndex Of
            0 : QRContrato_Vend_Geral.SetVariable('IND_SITUACAO_CUSTOS','A');
            1 : QRContrato_Vend_Geral.SetVariable('IND_SITUACAO_CUSTOS','F');
            2 : QRContrato_Vend_Geral.SetVariable('IND_SITUACAO_CUSTOS',Null);
          End;
          Case FContratoParam.Rg20TipoPreco.ItemIndex of
            0 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_PRECO','FIXO');
            1 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_PRECO','FIXAR');
            2 : QRContrato_Vend_Geral.SetVariable('IND_TIPO_PRECO',NULL);
          End;
          if ((Trim(FContratoParam.Me20DtInicio.Text) = '') And (Trim(FContratoParam.Me20DtFim.Text) = '') and
              (Trim(FContratoParam.Me20DtEmissaoI.Text) = '') and (Trim(FContratoParam.Me20DtEmissaoF.Text) = '')) then
            Raise Exception.Create('Informe a data de emissão ou a data de entrega!');

          if ((Trim(FContratoParam.Me20DtInicio.Text) = '') or (Trim(FContratoParam.Me20DtFim.Text) = '')) then
          Begin
            QRContrato_Vend_Geral.SetVariable('DT_INICIO',NULL);
            QRContrato_Vend_Geral.SetVariable('DT_FIM',NULL);
          end
          else
          Begin
            QRContrato_Vend_Geral.SetVariable('DT_INICIO',FContratoParam.Me20DtInicio.text);
            QRContrato_Vend_Geral.SetVariable('DT_FIM',FContratoParam.Me20DtFim.text);
          end;

          If ((Trim(FContratoParam.Me20DtEmissaoI.Text) = '') Or (Trim(FContratoParam.Me20DtEmissaoF.Text) = '')) then
          Begin
            QRContrato_Vend_Geral.SetVariable('DT_EMISSAO_I',NULL);
            QRContrato_Vend_Geral.SetVariable('DT_EMISSAO_F',NULL);
          end
          else
          Begin
            QRContrato_Vend_Geral.SetVariable('DT_EMISSAO_I',FContratoParam.Me20DtEmissaoI.text);
            QRContrato_Vend_Geral.SetVariable('DT_EMISSAO_F',FContratoParam.Me20DtEmissaoF.text);
          end;
          QRContrato_Vend_Geral.SQL[QRContrato_Vend_Geral.SQL.Count - 1] := '';

          Case FContratoParam.Rg20Ordem.ItemIndex Of
            0 : QRContrato_Vend_Geral.SQL.Add('Order By TB_CONTRATO_VEND.Num_Contrato');
            1 : QRContrato_Vend_Geral.SQL.Add('Order By TB_CONTRATO_VEND.Dt_Contrato');
            2 : QRContrato_Vend_Geral.SQL.Add('Order By TB_CADASTRO.Nome');
            3 : QRContrato_Vend_Geral.SQL.Add('Order By TB_CONTRATO_VEND.Cod_Produto');
          End;

          QRContrato_Vend_Geral.Open;

          if FRContrato_venda_geral = nil then
            FRContrato_venda_geral := TFRContrato_venda_geral.Create(Application);
          FRContrato_venda_geral.QRLPeriodo.Caption := 'De '+ FContratoParam.Me20DtInicio.text + ' Até '+ FContratoParam.Me20DtFim.text;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContrato_venda_geral.QRPrimario.Preview
          else
            FRContrato_venda_geral.QRPrimario.Print;
          QRContrato_Vend_Geral.Close;
        end;
    end;

end;

procedure TFContrato_Vend.BtConsPadraoClick(Sender: TObject);
begin
  inherited;
  if FPadraoDescontoProdutoCons  = nil then
    FPadraoDescontoProdutoCons := TFPadraoDescontoProdutoCons.Create(Application);
  FPadraoDescontoProdutoCons.MeProduto.Text := DMContrato.QContrato_VendCod_Produto.Text;
  FPadraoDescontoProdutoCons.MeProduto.Enabled := False;
  FPadraoDescontoProdutoCons.BtProduto.Enabled := False;
  if FPadraoDescontoProdutoCons.ShowModal = mrOk then
    If DMPadraoProduto.QPadraoDescProdConsCod_Produto.Value = DMContrato.QContrato_VendCod_Produto.value Then
       DMContrato.QContrato_VendCOD_PADRAO_DESCONTO_PRODUTO.Value:=DMPadraoProduto.QPadraoDescProdConsCOD_PADRAO_DESCONTO_PRODUTO.Value
    Else
       Raise Exception.Create('Produto do desconto deve ser o mesmo do contrato - Favor verificar');
  FPadraoDescontoProdutoCons.MeProduto.Enabled := True;
  FPadraoDescontoProdutoCons.BtProduto.Enabled := True;
end;

procedure TFContrato_Vend.SbCidadeConsClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = MrOk then
    DMContrato.QContrato_VendCOD_CIDADE.Value := DMCidade.QCidadeConsCOD_CIDADE.Value;

end;

procedure TFContrato_Vend.FecharCustos1Click(Sender: TObject);
begin
  inherited;
  if (DMContrato.QContrato_VendCod_Contrato_vend.Value <> 0) then
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      DMContrato.QContrato_Vend.Edit;
      DMContrato.QContrato_VendIND_SITUACAO_CUSTO.Value := 'F';
      DMContrato.QContrato_Vend.Post;
      DMOracle.DBCemapa.Commit;
      FContrato_Vend.FecharCustos1.Enabled := False;
      FContrato_Vend.VoltarFechamento1.Enabled := True;
      ShowMessage('Custos do Contrato Fechado!');
    except
      DMOracle.DBCemapa.RollBack;
      Raise Exception.Create('Operação não Realizada!');
    end;
  end
  else
    ShowMessage('Erro! Nenhum contrato está selecionado.');
end;

procedure TFContrato_Vend.VoltarFechamento1Click(Sender: TObject);
begin
  inherited;
  if (DMContrato.QContrato_VendCod_Contrato_vend.Value <> 0) then
  Begin
    Try
      DMOracle.DBCemapa.StartTransaction;
      DMContrato.QContrato_Vend.Edit;
      DMContrato.QContrato_VendIND_SITUACAO_CUSTO.Value := 'A';
      DMContrato.QContrato_Vend.Post;
      DMOracle.DBCemapa.Commit;
      FContrato_Vend.FecharCustos1.Enabled := True;
      FContrato_Vend.VoltarFechamento1.Enabled := False;
      ShowMessage('Custos do Contrato Aberto!');
    except
      DMOracle.DBCemapa.RollBack;
      Raise Exception.Create('Operação não Realizada!');
    end;
  end
  else
    ShowMessage('Erro! Nenhum contrato está selecionado.');

end;

procedure TFContrato_Vend.DBEdit51Change(Sender: TObject);
begin
  inherited;
  MMCadSimples.Items[2].Items[0].Enabled := DMContrato.QContrato_VendInd_Conf.Value = 'N';
  MMCadSimples.Items[2].Items[1].Enabled := DMContrato.QContrato_VendInd_Conf.Value = 'S';
end;

procedure TFContrato_Vend.BtOperacaoInclusaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons  = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCOD_OPERACAO_INCLUSAO.Value:=DMOperacao.QOperacaoConsCOD_OPERACAO.Value;

end;

procedure TFContrato_Vend.BaixaContabil1Click(Sender: TObject);
begin
  inherited;
  If DMContrato.QContrato_VENDCOD_CONTRATO_VEND.Text = Null then
     Raise exception.Create('Selecionar um contrato para efetuar a baixa');
  If DMContrato.QContrato_VENDVAL_SALDO.Value = 0 Then
     Raise exception.Create('Contrato sem saldo a comprar');
  If FContasReceberBaixa = Nil Then
     FContasReceberBaixa := TFContasReceberBaixa.Create(application);
  FContasReceberBaixa.Tag := 1;
  FContasReceberBaixa.MECodCliente.Text := DMContrato.QContrato_VendCod_Cadastro.Text;
  FContasReceberBaixa.MeCodFilial.Text := DMContrato.QContrato_VendCod_Filial.Text;
  FContasReceberBaixa.MeNumTitulo.Text := DMContrato.QContrato_VendNum_Contrato.Text;
  FContasReceberBaixa.SbProcuraClick(Self);
  DMContasReceber.QContasReceber_Mov.Open;
  FContasReceberBaixa.ShowModal;
  DMContasReceber.QContasReceber_Mov.Close;

  If FContrato_Gp_Ajuste = Nil Then
     FContrato_Gp_Ajuste := TFContrato_Gp_Ajuste.Create(Application);
  If FContrato_Gp_Ajuste.ShowModal = MrOk Then
   Begin
     If DMContrato.QContrato_VENDVAL_SALDO.Value < StrToFloat(FContrato_Gp_Ajuste.MeQuantidade.Text) Then
        Raise Exception.Create('Contrato não possui saldo suficiente ' + Chr(13) + 'Voltar compras aplicadas');
     DMContrato.QContrato_Vend.Edit;
     DMContrato.QContrato_VendQt_Quantidade.Value := DMContrato.QContrato_VendQt_Quantidade.Value - StrToFloat(FContrato_Gp_Ajuste.MeQuantidade.Text);
     DMContrato.AtualizaContrato;  // atualiza os saldos dos contratos     
     DMContrato.QContrato_Vend.Post;
     if DMOracle.DBCemapa.InTransaction then
       DMOracle.DBCemapa.Commit;
   End;

end;

procedure TFContrato_Vend.VariaoCambialMs1Click(Sender: TObject);
Var wContaDeb,wContaCred,wDD,wMM,WYY : String;
    wDtAnterior,wDtAtual : tDateTime;
    wVariacao,wVlMoeda : Real;
begin
  inherited;
  if FContratoParam = nil then
     FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[23].TabVisible:=True;
  if FContratoParam.ShowModal = mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario(Trim(FContratoParam.Fm24Filial.MeFilial.Text),'AGRICOLA');
      with DMContrato_Vend do
        begin
          QCalculo_Variacao_Cambial.Close;
          if Trim(FContratoParam.Fm24Filial.MeFilial.text)<>'' then
            QCalculo_Variacao_Cambial.SetVariable('COD_FILIAL',FContratoParam.Fm24Filial.MeFilial.text)
          else
            QCalculo_Variacao_Cambial.SetVariable('COD_FILIAL',Null);
          If Trim(FContratoParam.Me24Contrato.Text) <> '' Then
             QCalculo_Variacao_Cambial.SetVariable('COD_CONTRATO_VEND',Trim(FContratoParam.Me24Contrato.Text))
          Else
             QCalculo_Variacao_Cambial.SetVariable('COD_CONTRATO_VEND',Null);
          Case FContratoParam.Rg24TipoMercado.ItemIndex Of
            0 : QCalculo_Variacao_Cambial.SetVariable('IND_TIPO_MERCADO','INTERNO');
            1 : QCalculo_Variacao_Cambial.SetVariable('IND_TIPO_MERCADO','EXTERNO');
            2 : QCalculo_Variacao_Cambial.SetVariable('IND_TIPO_MERCADO','EXPORTACAO');
            3 : QCalculo_Variacao_Cambial.SetVariable('IND_TIPO_MERCADO',Null);
          End;
          QCalculo_Variacao_Cambial.SetVariable('DT_BASE',FContratoParam.Me24DtBase.Text);
          QCalculo_Variacao_Cambial.Open;
          If QCalculo_Variacao_Cambial.Eof Then
             Raise Exception.Create('Neste Periodo Não Tem Contrato em Dólar');
          DMMoeda.QCotacaoDia.Close;
          DMMoeda.QCotacaoDia.SetVariable('Moeda',2);
          DMMoeda.QCotacaoDia.SetVariable('Data',FContratoParam.Me24DtBase.Text);
          DMMoeda.QCotacaoDia.Open;
          If DMMoeda.QCotacaoDia.Eof Then
            Raise Exception.Create('Dólar Não Cadastrado Para Data Base');
          wVlMoeda := DMMoeda.QCotacaoDiaVlr_Cotacao.Value;
          DMOracle.DBCemapa.StartTransaction;
          Try
            While Not(QCalculo_Variacao_Cambial.Eof) Do
            Begin
              wDD      := '01';
              wMM      := Copy(FContratoParam.Me24DtBase.Text,4,2);
              wYY      := Copy(FContratoParam.Me24DtBase.Text,7,4);
              wDtAnterior := StrToDate(wDD+'/'+wMM+'/'+wYY) - 1;   // pega ultimo dia do mes anterior
              If QCalculo_Variacao_CambialDt_Contrato.Value > wDtAnterior Then
                 wDtAnterior := QCalculo_Variacao_CambialDt_Contrato.Value;
              DMMoeda.QCotacaoDia.Close;
              DMMoeda.QCotacaoDia.SetVariable('Moeda',2);
              DMMoeda.QCotacaoDia.SetVariable('Data',wDtAnterior);
              DMMoeda.QCotacaoDia.Open;
              IF DMMoeda.QCotacaoDia.Eof Then
                 Raise Exception.Create('Dolar não cadastrado para contrato');
              wVariacao := wVlMoeda - DMMoeda.QCotacaoDiaVlr_Cotacao.Value;
              wVariacao := wVariacao * QCalculo_Variacao_CambialQt_Saldo_Contrato.Value;
              DMOperacao.QOperacao.Close;
              DMOperacao.QOperacao.SetVariable('Pk',QCalculo_Variacao_CambialCod_Operacao.Value);
              DMOperacao.QOperacao.Open;
              IF DMOperacao.QOperacao.Eof Then
                 Raise Exception.Create('Operação não informada no contrato');
              DMContrato.QContrato_Vend.Close;
              DMContrato.QContrato_Vend.SetVariable('Pk',Trunc(QCalculo_Variacao_CambialCod_Contrato_Vend.Value));
              DMContrato.QContrato_Vend.Open;
              DMContrato.QContrato_Vend_Variacao.Insert;
              DMContrato.QContrato_Vend_VariacaoCod_Contrato_Vend.Value := Trunc(QCalculo_Variacao_CambialCod_Contrato_Vend.Value);
              DMContrato.QContrato_Vend_VariacaoDt_Variacao.Value := StrToDate(FContratoParam.Me24DtBase.Text);
              DMContrato.QContrato_Vend_VariacaoVl_Variacao.Value := wVariacao;
              DMContrato.QContrato_Vend_Variacao.Post;
              If wVariacao > 0 Then
               Begin
                 wContaCred := DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_POS_CRED.Value;
                 wContaDeb  := DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_POS_DEB.Value;
               End
              Else
               Begin
                 wContaCred := DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_CRED.Value;
                 wContaDeb  := DMOperacao.QOperacaoCOD_CONT_VAR_CAMBIAL_NEG_DEB.Value;
                 wVariacao := wVariacao * -1;  // PARA FICAR POSITIVO O VALOR
               End;
              DMPlanilha.GravaLanc('CVENDA',
                                  QCalculo_Variacao_CambialCod_Contrato_Vend.Value,
                                  FloatToStr(QCalculo_Variacao_CambialNum_Contrato.Value)+'-'+QCalculo_Variacao_CambialNome.Value,
                                  Trunc(QCalculo_Variacao_CambialCod_Filial.Value),
                                  wContaDeb,
                                  'DEBITO',
                                  QCalculo_Variacao_CambialCod_Cadastro.Value,
                                  DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                                  wVariacao,
                                  StrToDate(FContratoParam.Me24DtBase.Text),
                                  wContaCred);
              DMPlanilha.GravaLanc('CVENDA',
                                  QCalculo_Variacao_CambialCod_Contrato_Vend.Value,
                                  FloatToStr(QCalculo_Variacao_CambialNum_Contrato.Value)+'-'+QCalculo_Variacao_CambialNome.Value,
                                  Trunc(QCalculo_Variacao_CambialCod_Filial.Value),
                                  wContaCred,
                                  'CREDITO',
                                  QCalculo_Variacao_CambialCod_Cadastro.Value,
                                  DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                                  wVariacao,
                                  StrToDate(FContratoParam.Me24DtBase.Text),
                                  wContaDeb);

              QCalculo_Variacao_Cambial.Next;
            End;
          Except
            DMContrato.QContrato_Vend_Variacao.Cancel;
            DMOracle.DBCemapa.RollBack;
            Raise;
          End;
          DMOracle.DBCemapa.Commit;
          QCalculo_Variacao_Cambial.Close;
          DMOperacao.QOperacao.Close;
          DMMoeda.QCotacaoDia.Close;
        End;
    End;
end;

procedure TFContrato_Vend.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  inherited;
  if DMOracle.DBCemapa.inTransaction then
     DMOracle.DBCemapa.Commit;

end;

procedure TFContrato_Vend.SbArmazemAlfandegadoClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeArmazemAlfandegado.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContrato_Vend.SbArmazemClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMContrato.QContrato_VendCod_Armazem_Alfandegado.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContrato_Vend.BtCopiaNotaClick(Sender: TObject);
begin
  inherited;
  if DMContrato.QContrVend_NotaCOD_NOTA_CAB.Value > 0 then
    FNotaImpressao.EmiteNF(DMContrato.QContrVend_NotaCOD_NOTA_CAB.Value);
end;

procedure TFContrato_Vend.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if DMContrato.QContrVend_NotaCOD_NOTA_CAB.Value>0 then
    begin
      if MessageDlg('Atenção! Este procedimento poderá afetar os dados de outros módulos. '+#13
                   +'Mesmo assim tem certeza em excluir esta nota de embarque ?',mtWarning,[mbYes,mbNo],0) = mrYes then
        begin
          Try
            DMOracle.DBCemapa.StartTransaction;
            with DMNotaSaida do
              begin
                DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContrVend_NotaCOD_FILIAL.Text),'AGRICOLA');
                pCV:=True;
                QItemNF.Close;
                QNotaSaida.Close;
                QNotaSaida.SetVariable('PK',DMContrato.QContrVend_NotaCOD_NOTA_CAB.Value);
                QNotaSaida.Open;
                If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= QNotaSaidaDt_Recebimento.Value Then
                   Raise Exception.Create('Não é Permitido Voltar Confirmação - Período Contábil');
                QItemNF.Open;
                VoltaConfirmacao;
                VoltaSaldo(DMContrato.QContrato_VendSaldo_NF_Embarque.Value,QItemNFQt_Quantidade.Value,'S');

                if FNotaSaida_Cancela = nil then
                  FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);
                If QNotaSaidaDESC_CHAVE_ACESSO.IsNull Then
                  FNotaSaida_Cancela.CBEmail.Checked := False
                Else
                  FNotaSaida_Cancela.CBEmail.Checked := True;
                if FNotaSaida_Cancela.ShowModal = mrCancel then
                  DMOracle.DBCemapa.RollBack;

//                QNotaSaida.Edit;
//                QNotaSaidaInd_Situacao.Value := '3';
//                QNotaSaida.Post;
////                ExcluiNota;
                SBRefreshClick(Self);
                pCV:=False;
              end;
            DMOracle.DBCemapa.Commit;
            ShowMessage('Nota de Embarque Cancelada com sucesso.');
          except
            DMOracle.DBCemapa.RollBack;
            Raise Exception.Create('Erro ao tentar voltar a Nota de Embarque');
          end;
        end;
    end
  else
    ShowMessage('Não existem notas de embarque a serem excluídas.');

end;

procedure TFContrato_Vend.BtMensagemCorpoClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    MeMensagemCorpo.Text := FloatToStr(DMMensagem.QMensagemConsCod_Mensagem.Value);

end;

procedure TFContrato_Vend.BtLoteTipoClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = MrOk then
    DMContrato.QContrato_VendCOD_LOTE_TIPO.Value := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Value;
end;

procedure TFContrato_Vend.SbLoteTipoClick(Sender: TObject);
begin
  inherited;
  if FTipoLoteCons = Nil then
    FTipoLoteCons := TFTipoLoteCons.Create(Application);
  if FTipoLoteCons.ShowModal = MrOk then
    MeLote.Text := DMTipoLote.QTipoLoteConsCod_Lote_Tipo.Text;

end;

procedure TFContrato_Vend.BitBtn5Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMContrato.QContratoVend_Doc.Insert;
  Stream := DMContrato.QContratoVend_Doc.CreateBlobStream(DMContrato.QContratoVend_DocARQUIVO, bmWrite);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(MeArquivo.Text, fmOpenRead or fmShareDenyWrite);
    try
      Stream.CopyFrom(FileStream, FileStream.Size);
    finally
      FileStream.Free;
    end;
    wNomeArquivo := MeArquivo.Text;
    wPosicaoBarra := Pos('\', wNomeArquivo);
    while (wPosicaoBarra > 0) do begin
      wNomeArquivo := Copy(wNomeArquivo, (wPosicaoBarra+1), Length(wNomeArquivo));
      wPosicaoBarra := Pos('\', wNomeArquivo);
    end;
    DMContrato.QContratoVend_DocNOME_ARQUIVO.AsString := wNomeArquivo;
    DMContrato.QContratoVend_DocDESCRICAO.AsString := MeArquivo.Text;
    DMContrato.QContratoVend_DocDT_INCLUSAO.AsDateTime := Now;
    DMContrato.QContratoVend_DocCOD_contrato_Vend.Value := DMContrato.QContrato_VendCOD_contrato_Vend.Value;

    DMContrato.QContratoVend_Doc.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;

end;

procedure TFContrato_Vend.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
     MeArquivo.Text := OpenDialog.FileName;

end;

procedure TFContrato_Vend.BitBtn3Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  PastaTemp : String;
  NomeArquivo : String;
begin
  inherited;
  PastaTemp := GetEnvironmentVariable('TEMP');
  if (PastaTemp = '') then begin
    MessageDlg('É preciso definir a variável TEMP, para armazenamento de arquivos temporários.' ,
      mtError, [mbOK], 0);
    Abort;
  end;
  FileStream.Free;
  Stream.Free;
  NomeArquivo := PastaTemp + '\' + DsContratoVend_Doc.DataSet.FieldByName('NOME_ARQUIVO').AsString;
  Stream := DsContratoVend_Doc.DataSet.CreateBlobStream(DsContratoVend_Doc.DataSet.FieldByName('ARQUIVO'), bmRead);
  try
    Stream.Seek(0, soFromBeginning);
    FileStream := TFileStream.Create(NomeArquivo, fmCreate);
    try
      FileStream.CopyFrom(Stream, Stream.Size);
    finally
      FileStream.Free;
    end;
    If FPDFViewer = Nil Then
       FPDFViewer := TFPDFViewer.Create(Self);
    FPDFViewer.Caption := 'Visualizando arquivo ' + NomeArquivo;
    FPDFViewer.Pdf1.src := NomeArquivo;
    FPDFViewer.ShowModal;
//    FPDFViewer := Nil;
  finally
    Stream.Free;
  end;

end;

procedure TFContrato_Vend.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMContrato.QContratoVend_Doc.Delete;

end;

procedure TFContrato_Vend.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
