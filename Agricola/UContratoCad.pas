unit UContratoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, DBDirceu, StdCtrls, ExtCtrls, Buttons, ImgList,
  Db, Menus, ComCtrls, Mask, Grids, DBGrids, QuickRpt, ComObj, variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFContratoCad = class(TFTCadSimples)
    Opes1: TMenuItem;
    GeraContasaPagar1: TMenuItem;
    VoltaaGeraodoContasaPagar1: TMenuItem;
    ContratodeCompraeVenda1: TMenuItem;
    Contratos1: TMenuItem;
    BaixaContrato1: TMenuItem;
    BaixaContratoporValor1: TMenuItem;
    MovimentoscomSaldo1: TMenuItem;
    ContratoscSaldoaAplicar1: TMenuItem;
    QRCompositeReport1: TQRCompositeReport;
    ResumoPorProduto1: TMenuItem;
    CancelamentoContrato1: TMenuItem;
    LanaBaixaContratoporValornoContratodeVenda1: TMenuItem;
    ContratoNoAtendido1: TMenuItem;
    BaixaporValornoAplicadoemContratoVenda1: TMenuItem;
    PgControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    BTExcluiLanc: TSpeedButton;
    BTGeraMov: TSpeedButton;
    BTExcluiMov: TSpeedButton;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBEdit1: TDBEdit;
    MeFilial: TDBEdit;
    DBEdit3: TDBEdit;
    MeProduto: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit18: TDBEdit;
    BtFilial: TBitBtn;
    btcliente: TBitBtn;
    DBRadioGroup1: TDBRadioGroup;
    btproduto: TBitBtn;
    DBFilial: TDBDirceu;
    DBProduto: TDBDirceu;
    DBcliente: TDBDirceu;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit4: TDBEdit;
    MeValUnitario: TDBEdit;
    BTAvalista: TBitBtn;
    DBAvalista: TDBDirceu;
    DBRadioGroup4: TDBRadioGroup;
    DBEdit14: TDBEdit;
    DBRadioGroup5: TDBRadioGroup;
    DBGrid1: TDBGrid;
    DBEdit17: TDBEdit;
    DBRadioGroup6: TDBRadioGroup;
    DBEdit19: TDBEdit;
    BtFielDepositario: TBitBtn;
    DBDirceu1: TDBDirceu;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    BtParceiro: TBitBtn;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup7: TDBRadioGroup;
    DBEdit24: TDBEdit;
    DBRadioGroup8: TDBRadioGroup;
    BtCidadeEntrega: TBitBtn;
    Label25: TLabel;
    DBEdit25: TDBEdit;
    Label26: TLabel;
    DBEdit26: TDBEdit;
    Label27: TLabel;
    DBEdit27: TDBEdit;
    Label28: TLabel;
    DBEdit28: TDBEdit;
    Label29: TLabel;
    DBEdit29: TDBEdit;
    Label30: TLabel;
    DBEdit30: TDBEdit;
    DBRadioGroup9: TDBRadioGroup;
    FecharContrato1: TMenuItem;
    Label31: TLabel;
    DBEdit31: TDBEdit;
    AlterarOBSContratos1: TMenuItem;
    Label32: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup10: TDBRadioGroup;
    TsRecebimento: TTabSheet;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    Label42: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    SbTributacao: TSpeedButton;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    SbFilial: TSpeedButton;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    MECodOperacao: TMaskEdit;
    MEOperacao: TMaskEdit;
    MeSerie: TMaskEdit;
    MeQuantidade: TMaskEdit;
    DBEdit5: TDBEdit;
    MECodTribProd: TMaskEdit;
    MeTribut: TMaskEdit;
    MeDtEmissao: TMaskEdit;
    MeNrNota: TMaskEdit;
    MeCodFilial: TMaskEdit;
    RgCondicaoPagto: TRadioGroup;
    BtConsMens: TBitBtn;
    MeCodMens: TMaskEdit;
    MeDtEntrada: TMaskEdit;
    MeObs1: TMaskEdit;
    MeObs2: TMaskEdit;
    MeValTotal: TMaskEdit;
    MECodTransportadora: TMaskEdit;
    Label33: TLabel;
    SbTransportadora: TSpeedButton;
    METransportadora: TMaskEdit;
    MEPlaca: TMaskEdit;
    Label34: TLabel;
    RgTipoFrete: TRadioGroup;
    Label66: TLabel;
    MeMotorista: TMaskEdit;
    SbMotorista: TSpeedButton;
    Label35: TLabel;
    MeQtChegada: TMaskEdit;
    Label65: TLabel;
    MeParceiro: TMaskEdit;
    SbParceria: TSpeedButton;
    Label128: TLabel;
    MeCreditoSemente: TMaskEdit;
    BitBtn2: TBitBtn;
    Button1: TButton;
    DBGrid2: TDBGrid;
    Label36: TLabel;
    DBText3: TDBText;
    Label37: TLabel;
    DBEdit8: TDBEdit;
    BtOperacao: TBitBtn;
    DBDirceu2: TDBDirceu;
    Label38: TLabel;
    MeNfProdutor: TMaskEdit;
    AlteraFilialContrato1: TMenuItem;
    AlteraCdigoProduto1: TMenuItem;
    MeModelo: TMaskEdit;
    Label39: TLabel;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    GroupBox4: TGroupBox;
    Label58: TLabel;
    SpeedButton9: TSpeedButton;
    Label59: TLabel;
    Label60: TLabel;
    MeArquivo: TMaskEdit;
    BitBtn3: TBitBtn;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    OpenDialog: TOpenDialog;
    DSContrato_Doc: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure btclienteClick(Sender: TObject);
    procedure btprodutoClick(Sender: TObject);
    procedure BTAvalistaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure GeraContasaPagar1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure VoltaaGeraodoContasaPagar1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure ContratodeCompraeVenda1Click(Sender: TObject);
    procedure Contratos1Click(Sender: TObject);
    procedure BaixaContrato1Click(Sender: TObject);
    procedure BaixaContratoporValor1Click(Sender: TObject);
    procedure BTExcluiLancClick(Sender: TObject);
    procedure BTGeraMovClick(Sender: TObject);
    procedure BTExcluiMovClick(Sender: TObject);
    procedure MovimentoscomSaldo1Click(Sender: TObject);
    procedure ChamaGeraMov(Origem,Docto:String);
    procedure ContratoscSaldoaAplicar1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure ResumoPorProduto1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtFielDepositarioClick(Sender: TObject);
    procedure CancelamentoContrato1Click(Sender: TObject);
    procedure LanaBaixaContratoporValornoContratodeVenda1Click(
      Sender: TObject);
    procedure ContratoNoAtendido1Click(Sender: TObject);
    procedure BtCidadeEntregaClick(Sender: TObject);
    procedure BaixaporValornoAplicadoemContratoVenda1Click(
      Sender: TObject);
    procedure FecharContrato1Click(Sender: TObject);
    procedure AlterarOBSContratos1Click(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SbFilialClick(Sender: TObject);
    procedure SbTributacaoClick(Sender: TObject);
    procedure MECodTribProdExit(Sender: TObject);
    procedure BtConsMensClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodOperacaoExit(Sender: TObject);
    procedure SbTransportadoraClick(Sender: TObject);
    procedure MECodTransportadoraExit(Sender: TObject);
    procedure SbMotoristaClick(Sender: TObject);
    procedure SbParceriaClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PgControlChange(Sender: TObject);
    procedure MeQuantidadeExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BtOperacaoClick(Sender: TObject);
    procedure BtParceiroClick(Sender: TObject);
    procedure AlteraFilialContrato1Click(Sender: TObject);
    procedure AlteraCdigoProduto1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Gera_Nf_Contrato(pOperacao: Integer; pUnitario,pBaixa: Real; pCod_Nota_Cab,pNfProdutor: String);
    { Public declarations }
  end;

var
  FContratoCad: TFContratoCad;
  WinWord, Docs, Doc: Variant;
  wSalva_Cod_Nota : String;

implementation

uses Ucontrato_cl, UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl,
  UProdutoCons, UProduto_cl, UOracle_cl, UContratoCons, UContrato_CP,
  UProdutoAgricola_cl, UBiblioteca, UContrato_Param, URContrato,
  URomaneioAgricola_cl, UNotaSaida_cl, UUsuario_cl, UParamSistema_cl,
  UNotaSaida_Confirma, UCaixa_cl, UPlanilha_cl, UHistorico_cl,
  UNotaEntrada_cl, URReciboContrato, UGeraCVenda,
  UExcluiMovVend_Ant, UBaixaMovAntecipado, URContratoCompra_Aberto,
  UNotaAgricolaConf, UReciboFixar, USequencia_cl,
  URReciboNFA, UContratoCancela, URContratoResumo, UCidadeCons, UCidade_cl,
  URBaixaValorNaoAplicado, UBancoAgencia_cl, UPrecoAgricola_cl,
  UTributacaoCons, UTributacao_cl, UMensagemCons, UOperacaoCons,
  UOperacao_cl, UMensagem_cl, UFinalidade_cl, UAlteraProduto, UPDFViewer;

{$R *.DFM}

procedure TFContratoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMContrato.QContrato.Open;
  DMContrato.QContratoMovAntecipado.Open;
  DMContrato.QContrato_Doc.Open;
  DbEdit7.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  Label7.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value <> 'MOINHO';
  DbEdit17.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO';
  Label17.Visible := DmParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO';
end;

procedure TFContratoCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialcons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    DMContrato.QContratoCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContratoCad.btclienteClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QcontratoCod_Cadastro.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoCad.btprodutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = Nil then
    FProdutocons:=TFProdutoCons.Create(Application);
  if FProdutoCons.ShowModal = mrOk then
    DMcontrato.QcontratoCod_Produto.Value:=Trunc(DMProduto.QProdutoConsCod_Produto.Value);
end;

procedure TFContratoCad.BTAvalistaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QcontratoCod_Avalista.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoCad.SBConfirmarClick(Sender: TObject);
var  wPreco, wMenor, wMaior : Real;
  y:Integer;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
  If DMContrato.QContratoDT_ENTREGA.Value < DMContrato.QContratoDT_EMISSAO.Value Then
    Raise Exception.Create('Data de Entrega Não Pode Ser Menor Que a Data de Emissão');
  If DMContrato.QContratoDT_VENCIMENTO.Value < DMContrato.QContratoDT_EMISSAO.Value Then
    Raise Exception.Create('Data de Vencimento Não Pode Ser Menor Que a Data de Emissão');
  DMPrecoAgricola.QPrecoAgricola_Cons.Close;
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Produto',Trim(MeProduto.text));
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Filial',Trim(MeFilial.text));
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Dt_Preco_Agricola',Date);
  DMPrecoAgricola.QPrecoAgricola_Cons.SetVariable('Cod_Lote_Tipo','1');
  DMPrecoAgricola.QPrecoAgricola_Cons.Open;
  If DMPrecoAgricola.QPrecoAgricola_Cons.Eof Then
     Raise Exception.Create ('Não Foi Cadastrado Preço Produto Agricola para esta Data');
  wPreco := DMPrecoAgricola.QPrecoAgricola_ConsVal_Preco_Cf_Real.Value;
  If wPreco <> StrToFloat(Trim(MeValUnitario.Text)) Then
   Begin
     wMenor := wPreco - (wPreco * DMPrecoAgricola.QPrecoAgricola_ConsPerc_Abaixo_Contratos.Value / 100);
     wMaior := wPreco + (wPreco * DMPrecoAgricola.QPrecoAgricola_ConsPerc_Acima_Contratos.Value / 100);
     If (StrToFloat(Trim(MeValUnitario.Text)) < wMenor) OR
        (StrToFloat(Trim(MeValUnitario.Text)) > wMaior) Then
         Raise exception.Create('Preço Informado Está fora dos limites estabelicidos pela empresa');
   End;

  DMContrato.QContratoQTDE_SALDO.value:=DMContrato.QContratoQT_QUANTIDADE.Value;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
    If DMContrato.QContratoCod_Operacao.Text = ''  Then
       Raise exception.Create('Informar operação para inclusão contabil');
  inherited;
  Try
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    Raise Exception.Create('Erro Valores Inconsistentes.');
  end;
  y:=DMContrato.QContratoCOD_CONTRATO.Value;
  DMContrato.QContrato.Close;
  DMContrato.QContrato.SetVariable('PK',Y);
  DMContrato.QContrato.Open;
  GeraContasaPagar1Click(Self);
end;

procedure TFContratoCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Rollback;
end;

procedure TFContratoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoCons = Nil then
    FContratoCons := TFContratoCons.Create(Application);
  if FContratoCons.ShowModal = mrOk then
    with DMContrato do
      begin
        QContrato.Close;
        QContrato.SetVariable('PK',QContratoConsCod_contrato.Value);
        QContrato.Open;
        QContratoCons.Close;
      end;
end;

procedure TFContratoCad.GeraContasaPagar1Click(Sender: TObject);
Var wNome,wValor : String;
Begin
  Inherited;
  If DMContrato.QContratoCOD_CONTRATO.Value <> 0 then
   Begin
     DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
     If DMContrato.QContratoInd_CP.Value=0 then
      begin
        If not(DMOracle.DBcemapa.InTransaction) then
           DMOracle.DBCemapa.StartTransaction;
        If FContrato_CP = Nil then
           FContrato_CP := TFContrato_CP.Create(Application);
        If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
         Begin
           FContrato_Cp.MeCodFinalidade.Text := '39';
           FContrato_Cp.MeCodDepartamento.Text := '19';
         End;
        FContrato_CP.pTipo:='CON';
        FContrato_CP.ShowModal;
        If DMOracle.DBcemapa.InTransaction then
         Begin
           DMOracle.DBcemapa.Rollback;
           ShowMessage('Atenção! Este Contrato não gerou um Contas a Pagar.');
         End;
        wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+DMContrato.QContratoCod_Cadastro.Text);
        wValor := DMOracle.BuscaNome('SELECT SUM(VAL_TITULO) FROM TB_CONTA_PAGAR_CAB','COD_CONTRATO = '+DMContrato.QContratoCod_Contrato.Text);
        DMOperacao.QOperacao.Close;
        DMOperacao.QOperacao.SetVariable('Pk',DMContrato.QContratoCod_Operacao.Value);
        DMOperacao.QOperacao.Open;
        If Not(DMOperacao.QOperacao.Eof) Then
         Begin
           DMPlanilha.GravaLanc('CCFUTURA',
                                DMContrato.QContratoCOD_CONTRATO.Value,
                                FloatToStr(DMContrato.QContratoNUM_CONTRATO.Value)+'-'+wNome,
                                DMContrato.QContratoCod_Filial.Value,
                                DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value,
                                'DEBITO',
                                DMContrato.QContratoCod_Cadastro.Value,
                                DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                                StrToFloat(wValor),
                                DMContrato.QContratoDt_Emissao.Value,
                                DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value);
           DMPlanilha.GravaLanc('CCFUTURA',
                                DMContrato.QContratoCOD_CONTRATO.Value,
                                FloatToStr(DMContrato.QContratoNUM_CONTRATO.Value)+'-'+wNome,
                                DMContrato.QContratoCod_Filial.Value,
                                DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_CRED.Value,
                                'CREDITO',
                                DMContrato.QContratoCod_Cadastro.Value,
                                DMOperacao.QOperacaoCod_Historico_Contabil.Value,
                                StrToFloat(wValor),
                                DMContrato.QContratoDt_Emissao.Value,
                                DMOperacao.QOperacaoCOD_CONTABIL_CONTRATO_INC_DEB.Value);
           DMOracle.DBcemapa.Commit;
         End;
      End
     Else
       ShowMessage('Erro! Este Contrato já gerou um Contas a Pagar.');
   End
  Else
    ShowMessage('Erro! Contrato em branco, Selecione um contrato.');
end;

procedure TFContratoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DsPrimario.State in [DSInsert,DsEdit] then
    begin
      MMCadSimples.Items[2].Enabled:=False;
      BtCliente.Enabled:=True;
      BtFilial.Enabled:=true;
      BtProduto.Enabled:=True;
      BtAvalista.Enabled:=True;
      BTExcluiLanc.Enabled:=False;
      BTGeraMov.Enabled:=False;
      BTExcluiMov.Enabled:=False;
      BtFielDepositario.Enabled:=True;
      BtCidadeEntrega.Enabled:=True;
      BtOperacao.Enabled:=True;
      BtParceiro.Enabled:=True;
    end
  else
    begin
      MMCadSimples.Items[2].Enabled:=true;
      BtCliente.Enabled:=False;
      BtFilial.Enabled:=False;
      BtProduto.Enabled:=False;
      BtAvalista.Enabled:=False;
      BTExcluiLanc.Enabled:=True;
      BTGeraMov.Enabled:=True;
      BTExcluiMov.Enabled:=True;
      BtFielDepositario.Enabled:=False;
      BtCidadeEntrega.Enabled:=False;
      BtOperacao.Enabled:=False;
      BtParceiro.Enabled:=False;
    end;
end;

procedure TFContratoCad.VoltaaGeraodoContasaPagar1Click(Sender: TObject);
begin
  inherited;
  if DMContrato.QContratoInd_CP.Value<>0 then
    begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
        DMOracle.DBCemapa.StartTransaction;
        Try
          with DMContrato do
            begin
              QContasPagar.Close;
              QContasPagar.Open;
              QContasPagarMov.Close;
              QContasPagarMov.Open;
              QContrato.Edit;
              QContratoInd_CP.Value:=0;
              QCOntrato.Post;
              While not QContasPagar.Eof do
                Begin
                  If QContasPagarMovInd_Tipo_Movimento.Value <> '' Then
                    Begin
                      If (QContasPagarMovInd_Tipo_Movimento.Value <> 'PRINCIPAL') then
                        Raise Exception.Create('Conta a Pagar com baixas!')
                      Else
                        QContasPagarMov.Delete;
                    End;
                  QContasPagar.Delete;
                End;
              DMPlanilha.DesContabiliza(QContratoCOD_CONTRATO.Value,'CCFUTURA');
              DMOracle.DBCemapa.Commit;
           end;
        Except
          DMOracle.DBCemapa.Rollback;
          ShowMessage('Não foi possivel voltar Contas a Pagar!');
          Raise;
        End;
    end;
end;

procedure TFContratoCad.SBExcluirClick(Sender: TObject);
begin
//  inherited;
  if DMContrato.QContratoIND_CP.Value <> 0 then
    ShowMessage('Erro! Este Contrato já gerou lanctos. no Contas a Pagar'+#13+'Caso queira excluí-lo volte a geração do Contas a Pagar')
  else
    begin
      try
        inherited;
        If DMOracle.DBCemapa.InTransaction Then
           DMOracle.DBCemapa.Commit;
      except
          raise Exception.Create('Erro! Contrato com movimentos.');
      end;
    end;
end;

procedure TFContratoCad.SBAlterarClick(Sender: TObject);
begin
  if (DMContrato.QContratoIND_CP.Value = 0) and (DMContrato.QContratoIND_SITUACAO.Value = 'ABERTO') And
     (DMContrato.QContratoQTDE_SALDO.value = DMContrato.QContratoQT_QUANTIDADE.Value) then
    inherited
  else
    ShowMessage('Erro ! Não é possível alterar este contrato, pois ele'+#13+
                'já gerou um Contas a Pagar ou está Fechado.');
end;

procedure TFContratoCad.ContratodeCompraeVenda1Click(Sender: TObject);
var
   Path,campo,wDolar : String;
   wTotal, wTotalFunRural,wPreco, wValDolar,wTotal_Dolar,wVl_Dpi,wQt_Dpi,wVl_Pagar : Real;
begin
  if DMContrato.QContratoCOD_CONTRATO.value <> 0 then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMContrato.QContratoCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMContrato.QContratoCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMProduto.QProduto.Close;
      DMProduto.QProduto.SetVariable('PK',DMContrato.QContratoCOD_PRODUTO.Value);
      DMProduto.QProduto.Open;
      DMProdutoAgricola.QProdutoAgricola.Close;
      DMProdutoAgricola.QProdutoAgricola.SetVariable('PK',DMContrato.QContratoCOD_PRODUTO.Value);
      DMProdutoAgricola.QProdutoAgricola.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      if ((DMContrato.QContratoIND_TIPO_PAGAMENTO.Value = 'A') and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB')) then
        Doc := Docs.Open(Path+'Confissao divida.Doc')
      Else
        if ((DMContrato.QContratoIND_FIXAR.Value = 2) AND (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI')) Then
          Doc := Docs.Open(Path+'ContratoCompraFixacao.Doc')
        Else
           if ((DMContrato.QContratoVAL_DOLAR.Value <> 0) and (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB')) then
              Doc := Docs.Open(Path+'ContratoCompra2Us.Doc')
           Else
              Doc := Docs.Open(Path+'ContratoCompra2.Doc');
      wPreco := 0;
      If DMContrato.QContratoVAL_DOLAR.Value <> 0 Then
       Begin
         wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DMContrato.QContratoDT_EMISSAO.Text + chr(39));
         if wDolar <> '' Then
            wPreco := StrToFloat(wDolar) * DMContrato.QContratoVAL_DOLAR.Value
         Else
            Raise Exception.Create('Cadastrar o Valor Dólar');
       End
      Else
         wPreco := DMContrato.QContratoPRECO.value;
      wTotalFunRural := (DMContrato.QContratoQT_QUANTIDADE.value* wPreco / DMProduto.QProdutoNUM_EMBALAGEM.Value)*(DMContrato.QContratoPERC_FUNRURAL.value)/100;
      wTotal := (DMContrato.QContratoQT_QUANTIDADE.value* wPreco / DMProduto.QProdutoNUM_EMBALAGEM.Value)- wTotalFunRural;    
      wTotal_Dolar := (DMContrato.QContratoQT_QUANTIDADE.value* DMContrato.QContratoVAL_DOLAR.Value / DMProduto.QProdutoNUM_EMBALAGEM.Value)-
                (DMContrato.QContratoQT_QUANTIDADE.value* DMContrato.QContratoVAL_DOLAR.Value / DMProduto.QProdutoNUM_EMBALAGEM.Value)*(DMContrato.QContratoPERC_FUNRURAL.value)/100;
      wValDolar := 0;
      If DMContrato.QContratoVAL_DOLAR.Value <> 0 Then
         wValDolar := wTotal / StrToFloat(wDolar);
      // Substitui texto via "name parameters"
      campo:=FormatFloat('#,##0.00',wTotalFunRural);
      Doc.Content.Find.Execute(FindText := '%val_funrural',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%total',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(wTotal,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',wValDolar);
      Doc.Content.Find.Execute(FindText := '%val_dolar',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(wPreco, 'REAL');
      Doc.Content.Find.Execute(FindText := '%prec_extens',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMContrato.QContratoQT_QUANTIDADE.Value,'KG');
      Doc.Content.Find.Execute(FindText := '%quant_ext',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(DMContrato.QContratoVAL_DOLAR.Value,'DOLAR');
      Doc.Content.Find.Execute(FindText := '%ext_preco_dolar',ReplaceWith := campo,Replace:=2);
      campo := Bib.extenso(wTotal_Dolar,'DOLAR');
      Doc.Content.Find.Execute(FindText := '%ext_total_dolar',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMContrato.QContratoVAL_DOLAR.Value);
      Doc.Content.Find.Execute(FindText := '%preco_dolar',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',wTotal_Dolar);
      Doc.Content.Find.Execute(FindText := '%dolar_total',ReplaceWith := campo,Replace:=2);

      campo:=DMFilial.QFilialDESC_FILIAL.Value;
      Doc.Content.Find.Execute(FindText := '%desc_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialNum_CGC.Value;
      Doc.Content.Find.Execute(FindText := '%cgc_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%end_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%cidade_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialCod_estado.Value;
      Doc.Content.Find.Execute(FindText := '%uf_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%inscricao_filial',ReplaceWith := campo,Replace:=2);
      campo:=DMFilial.QFilialDESC_CEP.Value;
      Doc.Content.Find.Execute(FindText := '%cep_filial',ReplaceWith := campo,Replace:=2);

      campo:=DMProduto.QProdutoDESC_PRODUTO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_produto',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMProduto.QProdutoNUM_EMBALAGEM.Value);
      Doc.Content.Find.Execute(FindText := '%num_embalagem',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroNOME.Value;
      Doc.Content.Find.Execute(FindText := '%nome',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNUM_INSCRICAO.Value;
      Doc.Content.Find.Execute(FindText := '%desc_inscricao',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_ORGAO_EMISSOR.Value;
      Doc.Content.Find.Execute(FindText := '%desc_orgao_emissor',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNUM_CGC_CPF.Value;
      Doc.Content.Find.Execute(FindText := '%cgc_cpf',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_ENDERECO.Value;
      Doc.Content.Find.Execute(FindText := '%endereco',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_CIDADE.Value;
      Doc.Content.Find.Execute(FindText := '%cidade_cliente',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCOD_ESTADO.value;
      Doc.Content.Find.Execute(FindText := '%estado',ReplaceWith := campo,Replace:=2);
      campo := DMCadastro.QCadastroDESC_INSCRICAO_MUNICIPAL.Text;
      Doc.Content.Find.Execute(FindText := '%insc_mun',ReplaceWith := campo,Replace:=2);
      campo := DMCadastro.QCadastroDESC_CEP.Text;
      Doc.Content.Find.Execute(FindText := '%cep_cliente',ReplaceWith := campo,Replace:=2);
      if dmcadastro.QCadastroCOD_ESTADO_CIVIL.text <> '' then
      Begin
        campo := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL ='+ dmcadastro.QCadastroCOD_ESTADO_CIVIL.text);
        Doc.Content.Find.Execute(FindText := '%est_civil',ReplaceWith := campo,Replace:=2);
      end;  
      campo:=DMCadastro.QCadastroNOME_CONJUGE.Value;
      Doc.Content.Find.Execute(FindText := '%conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_CPF_CONJUGE.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_conjuge',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDESC_IDENTIDADE_CONJUGE.Value;
      Doc.Content.Find.Execute(FindText := '%rg_conjuge',ReplaceWith := campo,Replace:=2);

      campo:=DMContrato.QContratoDT_ANO_SAFRA.Value;
      Doc.Content.Find.Execute(FindText := '%ano_safra',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratoTIPO_BASE.Value;
      Doc.Content.Find.Execute(FindText := '%tipo_base',ReplaceWith := campo,Replace:=2);
      campo:=DateToStr(DMContrato.QContratoDT_ENTREGA.Value);
      Doc.Content.Find.Execute(FindText := '%dt_entrega',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMContrato.QContratoDT_ENTREGA.Value);
      Doc.Content.Find.Execute(FindText := '%dt_ext_entrega',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato.QContratoQT_QUANTIDADE.Value);
      Doc.Content.Find.Execute(FindText := '%quantidade',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.0000####',wPreco);
      Doc.Content.Find.Execute(FindText := '%preco',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0',DMContrato.QContratoNUM_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%num_contrato',ReplaceWith := campo,Replace:=2);
      campo:=DateToStr(DMContrato.QContratoDT_VENCIMENTO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_vencto',ReplaceWith := campo,Replace:=2);
      campo:=(DMContrato.QContratoDESC_ACONDICIONAMENTO.value);
      Doc.Content.Find.Execute(FindText := '%acondicionado',ReplaceWith := campo,Replace:=2);
      campo:=(DMContrato.QContratoDESC_TESTEMUNHA1.value);
      Doc.Content.Find.Execute(FindText := '%testemunha1',ReplaceWith := campo,Replace:=2);
      campo:=(DMContrato.QContratoDESC_TESTEMUNHA2.value);
      Doc.Content.Find.Execute(FindText := '%testemunha2',ReplaceWith := campo,Replace:=2);
      campo:=(DMContrato.QContratoCOD_CADASTRO.Text);
      Doc.Content.Find.Execute(FindText := '%cod_cadastro',ReplaceWith := campo,Replace:=2);
      campo:=DateToStr(DMContrato.QContratoDT_EMISSAO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_emissao',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy.',DMContrato.QContratoDT_EMISSAO.Value);
      Doc.Content.Find.Execute(FindText := '%dt_emis_extenso',ReplaceWith := campo,Replace:=2);

      campo:=(DMContrato.QContratoDESC_LOCAL_ENTREGA.value);
      Doc.Content.Find.Execute(FindText := '%local_entrega',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_UMIDADE_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_umidade',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_IMPUREZA_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_impureza',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_AVARIADO_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_avariado',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMProdutoAgricola.QProdutoAgricolaPERC_QUEBRADOS_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%max_quebra',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,###.##',DMProdutoAgricola.QProdutoAgricolaPERC_PH_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%ph_minimo',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,###.##',DMProdutoAgricola.QProdutoAgricolaPERC_VERDES_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%perc_verdes',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratodesc_cidade_entrega.Text;
      Doc.Content.Find.Execute(FindText := '%cidade_entrega',ReplaceWith := campo,Replace:=2);

      campo:=DMContrato.QContratoqt_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%qt_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratodesc_area_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_area_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratodesc_endereco_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_endereco_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratodesc_matricula_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_matricula_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratodesc_cartorio_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_cartorio_penhor',ReplaceWith := campo,Replace:=2);
      campo:=DMContrato.QContratodesc_armazens_penhor.Text;
      Doc.Content.Find.Execute(FindText := '%desc_armazens_penhor',ReplaceWith := campo,Replace:=2);
      If DMContrato.QContratoCod_Avalista.Text <> '' Then
       Begin
        DmCadastro.QCadastro.Close;
        DmCadastro.QCadastro.SetVariable('Pk',DMContrato.QContratoCod_Avalista.Value);
        DmCadastro.QCadastro.Open;
        campo := DmCadastro.QCadastroNOME.Value;
        Doc.Content.Find.Execute(FindText := '%avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroDesc_Endereco.Value;
        Doc.Content.Find.Execute(FindText := '%end_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroDesc_Cidade.Value;
        Doc.Content.Find.Execute(FindText := '%cid_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroNum_Cgc_Cpf.Value;
        Doc.Content.Find.Execute(FindText := '%Cpf_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroNum_Inscricao.Value;
        Doc.Content.Find.Execute(FindText := '%Identidade_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroCod_Estado.Value;
        Doc.Content.Find.Execute(FindText := '%Uf_avalista',ReplaceWith := campo,Replace:=2);
        campo := DmCadastro.QCadastroNome_Conjuge.Value;
        Doc.Content.Find.Execute(FindText := '%Conjuge',ReplaceWith := campo,Replace:=2);
        campo:=DMCadastro.QCadastroDESC_ORGAO_EMISSOR.Value;
        Doc.Content.Find.Execute(FindText := '%orgao_emissor_aval',ReplaceWith := campo,Replace:=2);
       End
      Else
       Begin
        campo:= '.';
        Doc.Content.Find.Execute(FindText := '%avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%end_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%cid_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Cpf_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Identidade_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Uf_avalista',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%Conjuge',ReplaceWith := campo,Replace:=2);
        Doc.Content.Find.Execute(FindText := '%orgao_emissor_aval',ReplaceWith := campo,Replace:=2);
       End;
      If DMContrato.QContratoCod_Fiel_Depositario.Text <> '' Then
         campo := DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + FloatToStr(DMContrato.QContratoCod_Fiel_Depositario.Value))
      Else
         campo := ' . ';
      Doc.Content.Find.Execute(FindText := '%fiel_depositario',ReplaceWith := campo,Replace:=2);
      wTotal := (DMContrato.QContratoQT_QUANTIDADE.value * wPreco / DMProduto.QProdutoNUM_EMBALAGEM.Value);
      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%vlr_mercadoria',ReplaceWith := campo,Replace:=2);
      wVl_Pagar := wTotal;

      wTotal := wTotal * DMContrato.QContratoPERC_FUNRURAL.value / 100;
      campo:=FormatFloat('#,##0.00',wTotal);
      Doc.Content.Find.Execute(FindText := '%vlr_funrural',ReplaceWith := campo,Replace:=2);
      wVl_Pagar := wVl_Pagar - wTotal;

      wQt_DPI := DMContrato.QContratoQT_QUANTIDADE.value - DMContrato.QContratoQT_CREDITO_TRANSGENICOS.Value;
      wVl_Dpi := 0;
      If (wQt_DPI > 0) And (DMProdutoAgricola.QProdutoAgricolaPERC_DPI_TRANSGENICOS.Value <> 0)  Then
         wVl_Dpi := wPreco * wQt_DPI / DMProduto.QProdutoNUM_EMBALAGEM.Value * DMProdutoAgricola.QProdutoAgricolaPERC_DPI_TRANSGENICOS.Value / 100;
      campo:=FormatFloat('#,##0.00',wVl_Dpi);
      Doc.Content.Find.Execute(FindText := '%vlr_dpi',ReplaceWith := campo,Replace:=2);
      wVl_Pagar := wVl_Pagar - wVl_Dpi;
      campo:=FormatFloat('#,##0.00',wVl_Pagar);
      Doc.Content.Find.Execute(FindText := '%vlr_pagar',ReplaceWith := campo,Replace:=2);

      // Grava documento
      if ((DMContrato.QContratoIND_FIXAR.Value = 2) AND (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI')) Then
        Doc := Doc.SaveAs(Path+'ContratoCompraFixacao2.Doc')
      else
        Doc.SaveAs(Path+'ContratoCompra21.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar um contrato a ser emitido.');
end;

procedure TFContratoCad.Contratos1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[0].TabVisible:=True;
  FContratoParam.Me0DtBase.Text := DateToStr(Date);
  if FContratoParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME0CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContrato.Close;
          if Trim(FContratoParam.ME0CodFilial.text) <>'' then
            QRContrato.SetVariable('COD_FILIAL',FContratoParam.ME0CodFilial.text)
          else
            QRContrato.SetVariable('COD_FILIAL',Null);

          if Trim(FContratoParam.ME0CodProduto.text) <>'' then
            QRContrato.SetVariable('COD_PRODUTO',FContratoParam.ME0CodProduto.text)
          else
            QRContrato.SetVariable('COD_PRODUTO',Null);

          if Trim(FContratoParam.ME0CodCliente.text) <>'' then
            QRContrato.SetVariable('COD_CADASTRO',Trim(FContratoParam.ME0CodCliente.text))
          else
            QRContrato.SetVariable('COD_CADASTRO',Null);

          if Trim(FContratoParam.ME0CodVendedor.text) <>'' then
            QRContrato.SetVariable('COD_VENDEDOR',FContratoParam.ME0CodVendedor.text)
          else
            QRContrato.SetVariable('COD_VENDEDOR',Null);

          if Trim(FContratoParam.ME0DtInicial.text) <>'' then
            QRContrato.SetVariable('DT_INICIAL',StrToDate(FContratoParam.ME0DtInicial.text))
          else
            QRContrato.SetVariable('DT_INICIAL',Null);

          if Trim(FContratoParam.ME0DtFinal.text) <>'' then
            QRContrato.SetVariable('DT_FINAL',StrToDate(FContratoParam.ME0DtFinal.text))
          else
            QRContrato.SetVariable('DT_FINAL',Null);


          if Trim(FContratoParam.ME0DtEmissaoInic.text) <>'' then
            QRContrato.SetVariable('DT_EMISSAO_INIC',StrToDate(FContratoParam.ME0DtEmissaoInic.text))
          else
            QRContrato.SetVariable('DT_EMISSAO_INIC',Null);

          if Trim(FContratoParam.ME0DtEmissaoFim.text) <>'' then
            QRContrato.SetVariable('DT_EMISSAO_FIM',StrToDate(FContratoParam.ME0DtEmissaoFim.text))
          else
            QRContrato.SetVariable('DT_EMISSAO_FIM',Null);

          if Trim(Bib.LimpaString(FContratoParam.ME0DtAnoMes.Text,'/')) <>'' then
            QRContrato.SetVariable('DT_ANO_SAFRA',FContratoParam.ME0DtAnoMes.Text)
          else
            QRContrato.SetVariable('DT_ANO_SAFRA',Null);

          case FContratoParam.RG0TipoSafra.ItemIndex of
            0:QRContrato.SetVariable('IND_TIPO_SAFRA','SAFRA');
            1:QRContrato.SetVariable('IND_TIPO_SAFRA','SAFRINHA');
            2:QRContrato.SetVariable('IND_TIPO_SAFRA',Null);
          end;
          case FContratoParam.RG0Tipo.ItemIndex of
            0:QRContrato.SetVariable('IND_FISICA_JURIDICA','F');
            1:QRContrato.SetVariable('IND_FISICA_JURIDICA','J');
            2:QRContrato.SetVariable('IND_FISICA_JURIDICA',Null);
          end;

          case FContratoParam.RG0Situacao.ItemIndex of
            0:QRContrato.SetVariable('IND_SITUACAO','ABERTO');
            1:QRContrato.SetVariable('IND_SITUACAO','FECHADO');
            2:QRContrato.SetVariable('IND_SITUACAO','CANCELADO');
            3:QRContrato.SetVariable('IND_SITUACAO','NATENDIDO');
            4:QRContrato.SetVariable('IND_SITUACAO',Null);
          end;

          case FContratoParam.RG0TipoProducao.ItemIndex of
            0:QRContrato.SetVariable('IND_RETIRAR_ENTREGUE','ENTREGUE');
            1:QRContrato.SetVariable('IND_RETIRAR_ENTREGUE','RETIRAR');
            2:QRContrato.SetVariable('IND_RETIRAR_ENTREGUE',Null);
          end;

          case FContratoParam.RG0TipoPagto.ItemIndex of
            0:QRContrato.SetVariable('TIPO_PAGTO','A'); //ANTECIPADO
            1:QRContrato.SetVariable('TIPO_PAGTO','F'); //FUTURO
            2:QRContrato.SetVariable('TIPO_PAGTO',Null);
          end;
          case FContratoParam.RG0TipoFixar.ItemIndex of
            0:QRContrato.SetVariable('IND_FIXAR',1);
            1:QRContrato.SetVariable('IND_FIXAR',2);
            2:QRContrato.SetVariable('IND_FIXAR',Null);
          end;
          wDtBase_Contrato := StrToDate(FContratoParam.Me0DtBase.Text);  // passado para variavel para nao usar o formulario de parametros no data modulo
          QRContrato.Open;
          If FRContrato = Nil then
            FRContrato := TFRContrato.Create(Application);
          FRContrato.QrlTitulo.Caption := 'Relacao de Contratos Compra e Venda - '+
             'Vendedor:' + Trim(FContratoParam.ME0Vendedor.Text);
          case FContratoParam.RG0Situacao.ItemIndex of
            0:FRContrato.QrlTipo.Caption :='Situação:ABERTO';
            1:FRContrato.QrlTipo.Caption :='Situação:FECHADO';
            2:FRContrato.QrlTipo.Caption :='Situação:CANCELADO';
            3:FRContrato.QrlTipo.Caption :='Situação:Todos';
          end;
          FRContrato.QrlTipo.Caption := FRContrato.QrlTipo.Caption +
             ' Dt. Entrega de '+FContratoParam.ME0DtInicial.text+
             ' ate '+FContratoParam.ME0DtFinal.text;   
          case FContratoParam.RG0TipoPagto.ItemIndex of
            0:FRContrato.QrlTipoPagto.Caption :='Contratos com Pagamento: ANTECIPADO';
            1:FRContrato.QrlTipoPagto.Caption :='Contratos com Pagamento: FUTURO';
            2:FRContrato.QrlTipoPagto.Caption :='Contratos com pagamento: TODOS ';
          end;
          If FContratoParam.RGPreview.ItemIndex = 0 then
            FRContrato.QRPrimario.Preview
          else
            FRContrato.QRPrimario.Print;
          QRContrato.Close;
        end;
    end;
end;

procedure TFContratoCad.BaixaContrato1Click(Sender: TObject);
var wTotalMov, wBaixa, wPreco : Real;
    wDolar,wNfProdutor : String;
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[1].TabVisible:=True;
  if FContratoParam.ShowModal = mrOK then
    begin
      Try
        with DMContrato do
          begin
            DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.Me1CodFilial.Text),'AGRICOLA');
            If Trim(FContratoParam.ME1CodContrato.text)<>'' then
              Begin
                QContrato.Close;
                QContrato.SetVariable('PK',FContratoParam.ME1CodContrato.text);
                QContrato.Open;
                wPreco := 0;
                If DMContrato.QContratoVAL_DOLAR.Value <> 0 Then
                 Begin
                   wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DateToStr(Date) + chr(39));
                   If wDolar = '' Then
                      Raise Exception.Create ('Dolar Não Cadastrado Para Esta Data');
                 End;
                If Trim(FContratoParam.ME1CodCliente.text) = '' Then  // Caso Limpar o codigo do cliente nos parametros
                   FContratoParam.ME1CodCliente.text := QContratoCod_Cadastro.Text;
                DMProduto.QProduto.Close;
                DMProduto.QProduto.SetVariable('PK',QContratoCod_Produto.Value);
                DMProduto.QProduto.Open;
                DMRomaneioAgricola.QRomConsFixar.Close;
                DMRomaneioAgricola.QRomConsFixar.setVariable('CADASTRO',Trim(FContratoParam.ME1CodCliente.text));
                DMRomaneioAgricola.QRomConsFixar.setVariable('PRODUTO',QContratoCOD_PRODUTO.Value);
                DMRomaneioAgricola.QRomConsFixar.setVariable('FILIAL',StrToInt(Trim(FContratoParam.Me1CodFilial.Text)));
//                DMRomaneioAgricola.QRomConsFixar.setVariable('DATAI',StrToDate('01/01/1999'));
//                DMRomaneioAgricola.QRomConsFixar.setVariable('DATAF',Date);
                DMRomaneioAgricola.QRomConsFixar.setVariable('TIPO_FIXAR','EMPRESA');
                If Trim(FContratoParam.Me1LoteTipo.Text) <> '' Then
                   DMRomaneioAgricola.QRomConsFixar.setVariable('LOTE_TIPO',Trim(FContratoParam.Me1LoteTipo.Text))
                Else
                   Raise Exception.Create('Preencher o Lote');
                If Trim(FContratoParam.Me1Parceiro.Text) <> '' Then
                   DMRomaneioAgricola.QRomConsFixar.setVariable('COD_PARCEIRO',Trim(FContratoParam.Me1Parceiro.Text))
                Else
                   DMRomaneioAgricola.QRomConsFixar.setVariable('COD_PARCEIRO',Null);
                DMRomaneioAgricola.QRomConsFixar.Open;
                QContratoMovAntecipado.Close;
                QContratoMovAntecipado.Open;
                QContratoMovAntecipado.First;
                wTotalMov:=0;
                while not(QContratoMovAntecipado.Eof) do
                  Begin
                    wTotalMov:=wTotalMov+QContratoMovAntecipadoQT_Quantidade.value;
                    QContratoMovAntecipado.Next;
                  End;
                 wTotalMov:=QContratoQT_Quantidade.Value - wTotalMov;
                If Trim(FContratoParam.Me1Quantidade.Text) <> '' Then
                 Begin
                   If StrToFloat(Trim(FContratoParam.Me1Quantidade.Text)) > wTotalMov Then
                      Raise Exception.Create ('Quantidade Informada Maior que Quantidade Aberto do Contrato');
                   If StrToFloat(Trim(FContratoParam.Me1Quantidade.Text)) > DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value Then
                      Raise Exception.Create ('Quantidade Informada Maior que Quantidade a Fixar');
                 End;
                If (DMContrato.QContratoIND_BAIXA_CREDITO_MONSANTO.Value = 'NAO') And (Trim(FContratoParam.Me1PercDPI.Text) <> '0') Then
                 Begin
                   If Trim(FContratoParam.Me1Quantidade.Text) <> '' Then
                    Begin
                     If StrToFloat(Trim(FContratoParam.Me1Quantidade.Text)) > StrToFloat('0'+Trim(FContratoParam.Me1CreditoSemente.Text)) Then
                        Raise Exception.Create ('Quantidade crédito MONSANTO deve ser igual a quantidade da baixa');
                    End
                   Else
                     If wTotalMov > StrToFloat('0'+Trim(FContratoParam.Me1CreditoSemente.Text)) Then
                        Raise Exception.Create ('Quantidade crédito MONSATO deve ser igual a quantidade da baixa');
                 End;
                If (DMOracle.BuscaNome('SELECT COD_OPER_FIXACAO_CONTRATO_CF FROM TB_PRODUTO_AGRICOLA','COD_PRODUTO = '+FloatToStr(QContratoCod_Produto.Value)) = '') Then
                   Raise Exception.Create ('Informar Codigo Operação No Cadastro Produto Agricola');
                if (DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value > 0) and (QContratoIND_SITUACAO.value='ABERTO') then
                  Begin
                    If Trim(FContratoParam.Me1Quantidade.Text) <> '' Then
                      wBaixa := StrToFloat(Trim(FContratoParam.Me1Quantidade.Text))
                    Else
                      if (DMRomaneioAgricola.QRomConsFixarSaldo_fixar.Value) > wTotalMov  then
                        wBaixa:= wTotalMov
                      else
                        wBaixa:= DMRomaneioAgricola.QRomConsFixarSaldo_Fixar.Value;
                    wBaixa:=Trunc(wBaixa*100)/100;
                    DMProdutoAgricola.QProdutoAgricola.Close;
                    DMProdutoAgricola.QProdutoAgricola.SetVariable('Pk',QContratoCod_Produto.Value);
                    DMProdutoAgricola.QProdutoAgricola.Open;
                    DMNotaEntrada.PContabiliza_Extra := 'N';
                    DMNotaEntrada.pTipoNota := 'AGRICOLA';
                    DMNotaEntrada.QNotaEntrada.Open;
                    DMNotaEntrada.QItemNF.Open;
                    wSalva_Cod_Nota := '';
                    If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' Then
                       Gera_NF_Contrato(DMProdutoAGricola.QProdutoAgricolaCOD_OPERACAO_DEVOLUCAO.Value,DMProduto.QProdutoVAL_VAREJO.Value,wBaixa,'',FContratoParam.Me1NotaProdutor.Text);
                    If DMContrato.QContratoVAL_DOLAR.Value <> 0 Then
                     Begin
                       If wDolar <> '' Then
                          wPreco := Trunc((StrToFloat(wDolar) * DMContrato.QContratoVAL_DOLAR.Value) * 100) / 100
                     End
                    Else
                      wPreco := DMContrato.QContratoPRECO.value;

                    Gera_NF_Contrato(DMProdutoAGricola.QProdutoAgricolaCOD_OPER_FIXACAO_CONTRATO_CF.Value,wPreco,wBaixa,wSalva_Cod_Nota,FContratoParam.Me1NotaProdutor.Text);
                    If (wBaixa = wTotalMov) And (DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2') then
                     begin                     // esta testando a situacao porque pode chegar no final da tela de
                       QContrato.Edit;         // fechamento e dar um click no botao de cancelar
                       QContratoIND_SITUACAO.Value:='FECHADO';
                       QContrato.Post;
                     end;
                    if DMOracle.DBCemapa.InTransaction then
                      DMOracle.DBCemapa.Commit;
                    ShowMessage('Geração de Nota e Movimento efetuado com sucesso.');
                  End
                else
                  ShowMessage('Não há saldo a fixar para este Cliente / Produto.');
              end;
          end;
      except
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMContrato.QContratoMovAntecipado.Cancel;
        if DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
        Raise;
      end;
    end;
    SBRefreshClick(Self);
end;

procedure TFContratoCad.BaixaContratoporValor1Click(Sender: TObject);
var
 wTotalMov, wQtde, wValor, wcapital, wjuro, wQtde_mov, wPreco, wDpi:Real;
 wDolar,wTipo,wBanco,wContaDeb,wContaCred : String;
 wCodigo,wHistorico : Integer;
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam := TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[2].TabVisible:=True;
  FContratoParam.Label69.Visible := False;
  FContratoParam.Me1ValorTitulos.Visible := False;
  if FContratoParam.ShowModal = mrOK then
    begin
      DMFinalidade.QFinalidade.Close;
      DMFinalidade.QFinalidade.SetVariable('Pk',FContratoParam.Me2Finalidade.Text);
      DMFinalidade.QFinalidade.Open;
      If DMFinalidade.QFinalidade.Eof Then
         Raise Exception.Create('Finalidade Informada Inexistente');
      with DMContrato do
        begin
          if Trim(FContratoParam.ME2CodContrato.Text)<>'' then
            begin
              Try
                QContrato.Close;
                QContrato.SetVariable('PK',FContratoParam.ME2CodContrato.text);
                QContrato.Open;
                DMProduto.QProduto.Close;
                DMProduto.QProduto.SetVariable('PK',DMContrato.QContratoCOD_PRODUTO.Value);
                DMProduto.QProduto.Open;
                DMProdutoAgricola.QProdutoAgricola.Close;
                DMProdutoAgricola.QProdutoAgricola.SetVariable('PK',DMContrato.QContratoCOD_PRODUTO.Value);
                DMProdutoAgricola.QProdutoAgricola.Open;
                QContratoMovAntecipado.Open;
                QContratoMovAntecipado.First;
                wTotalMov:=0;
                wValor:=0;
                wQtde:=0;
                while not(QContratoMovAntecipado.Eof) do
                  begin
                    wTotalMov:=wTotalMov+QContratoMovAntecipadoQT_Quantidade.value;
                    QContratoMovAntecipado.Next;
                  end;
                wTotalMov:=QContratoQT_Quantidade.Value-wTotalMov;
                if Trim(FContratoParam.ME2Qtde.Text)<>'' then
                  try
                    wQtde:=StrToFloat(FContratoParam.ME2Qtde.Text);
                  except
                    raise Exception.create('Erro! Valor inválido para: qtde.');
                  end;
                if Trim(FContratoParam.ME2Valor.Text)<>'' then
                  try
                    wValor:=StrToFloat(FContratoParam.ME2Valor.Text);
                  except
                    raise Exception.create('Erro! Valor inválido para: Valor.');
                  end;
                if (QContratoIND_SITUACAO.value='ABERTO') and
                   (wTotalMov >= wQtde) and (wValor > 0) and
                   (wQtde > 0) and (wTotalMov > 0)then
                  begin
                    DMOracle.DBCemapa.StartTransaction;
                    wPreco := 0;
                    If QContratoVAL_DOLAR.Value <> 0 Then
                     Begin
                       wDolar := DmOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO', 'COD_MOEDA = 2 AND DT_COTACAO =' + chr(39) + DateToStr(Date) + chr(39));
                       If wDolar <> '' Then
                          wPreco := Trunc((StrToFloat(wDolar) * QContratoVAL_DOLAR.Value) * 100) / 100;
                     End
                    Else
                      wPreco := QContratoPRECO.value;
                    If (QContratoQt_Credito_Transgenicos.Value = 0) And (QContratoIND_BAIXA_CREDITO_MONSANTO.Value = 'SIM') Then
                       wDpi := wPreco * (wQtde - QContratoQt_Credito_Transgenicos.Value) / DMProduto.QProdutoNum_embalagem.Value * DMProdutoAgricola.QProdutoAgricolaPerc_Dpi_Transgenicos.Value / 100
                    Else
                       wDpi := 0;   
                    wcapital := (wQtde/wTotalMov*(wtotalMov*wPreco*((100-QContratoPerc_FunRural.value)/100)))/DMProduto.QProdutoNum_embalagem.Value - wDpi;
                    wjuro:= (wValor) - wcapital;
                    If (wJuro > -0.02) And (wJuro < 0.02) Then
                       wJuro := 0;
                    If wJuro >= 0 then
                     begin
                        with DMCaixa do
                         begin
                           QCaixa_Mov.Open;
                           If wCapital > 0 then
                            begin
                              wqtde_mov:=wqtde;
                              QContratoMovAntecipado.Insert;
                              QContratoMovAntecipadoCOD_CONTRATO.Value:=QContratoCOD_CONTRATO.Value;
                              QContratoMovAntecipadoDATA.Value:=StrToDate(FContratoParam.Me2DtBaixa.Text);
                              QContratoMovAntecipadoQT_QUANTIDADE.Value:=wqtde_mov;
                              QContratoMovAntecipadoVAL_MOVIMENTO.Value:=wcapital;
                              QContratoMovAntecipadoDESC_OBSERVACAO.Value:='Capital ' + FContratoParam.Ed2Observacao.Text;
                              QContratoMovAntecipadoIND_SALDO_ZERO.Value:='N';
                              QContratoMovAntecipado.Post;
                              If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB' Then
                              Begin
                                wTipo := 'CX';
                                If (FContratoParam.Rg2TipoBaixa.ItemIndex = 0)  Then
                                 Begin
                                   IncluiCaixa(QContratoCOD_FILIAL.Value,0,DMFinalidade.QFinalidadeCod_Historico_Baixa.Value,
                                            wCapital,QContratoNUM_CONTRATO.Value,QContratoCOD_CADASTRO.Value,
                                            'Pagto. de Capital do Contrato',
                                            StrToDate(FContratoParam.Me2DtBaixa.Text),
                                            '','',QContratoMovAntecipadoCod_Contrato_mov.Text,'');
                                   wCodigo := QCaixa_MovCod_Caixa_Mov.Value;
                                 End
                                Else
                                 If FContratoParam.Rg2TipoBaixa.ItemIndex = 1 Then
                                 Begin
                                   DMBancoAgencia.IncluiBanco(DMFinalidade.QFinalidadeCod_Historico_Cheque.Value,
                                            StrToInt(FContratoParam.Me2ContaCorrente.Text),
                                            QContratoNUM_CONTRATO.Value,
                                            QContratoCOD_CADASTRO.Value,
                                            StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMUsuario.CodUsuarioCorrente))),
                                            StrToDate(FContratoParam.Me2DtBaixa.Text),
                                            wCapital,
                                            'Pagto. de Capital do Contrato',
                                            '',
                                            '','','N',QContratoMovAntecipadoCod_Contrato_mov.Text);
                                   wTipo := 'BC';
                                   wCodigo := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
                                 End;
                                If FContratoParam.Rg2TipoBaixa.ItemIndex = 2 Then  // baixa por perda
                                 Begin
                                   IncluiCaixa(QContratoCOD_FILIAL.Value,0,DMFinalidade.QFinalidadeCod_Historico_Baixa.Value,
                                            0,QContratoNUM_CONTRATO.Value,QContratoCOD_CADASTRO.Value,
                                            'Baixa de Contrato Por Perda',
                                            StrToDate(FContratoParam.Me2DtBaixa.Text),
                                            '','',QContratoMovAntecipadoCod_Contrato_mov.Text,'');
                                   wCodigo := QCaixa_MovCod_Caixa_Mov.Value;
                                   wContaDeb :=  DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_DEB.Value;
                                   wContaCred := DMFinalidade.QFinalidadeCOD_CONTABIL_VL_BAIXA_CRED.Value;
                                   wHistorico := DMFinalidade.QFinalidadeCOD_HISTORICO_CONTABIL.Value;
                                 End
                                Else
                                 Begin
                                   DMHistorico.QHistorico.close;
                                   If FContratoParam.Rg2TipoBaixa.ItemIndex = 0 Then
                                      DMHistorico.QHistorico.SetVariable('PK',DMFinalidade.QFinalidadeCod_Historico_Baixa.Value)
                                   Else
                                      DMHistorico.QHistorico.SetVariable('PK',DMFinalidade.QFinalidadeCod_Historico_Cheque.Value);
                                   DMHistorico.QHistorico.open;
                                   wContaDeb := DMHistorico.QHistoricoCOD_CONTABIL_DEB.Value;
                                   If FContratoParam.Rg2TipoBaixa.ItemIndex = 1 Then
                                   Begin
                                     wBanco := DmOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + trim(FContratoParam.Me2ContaCorrente.text));
                                     If wBanco = '' Then
                                       Raise Exception.Create('Não informado conta corrente');
                                     wContaDeb := DmOracle.BuscaNome('SELECT COD_CONTABIL_VL_PRIN_BCO_DEB FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBanco);
                                   End;
                                   wContaCred := DMHistorico.QHistoricoCOD_CONTABIL_CRED.Value;
                                   wHistorico := DMHistorico.QHistoricoCOD_HISTORICO_CONTABIL.Value;
                                 End;
                                DMPlanilha.GravaLanc(wTipo,
                                                     wCodigo,
                                                     FloatToStr(QContratoNum_Contrato.Value),
                                                     QContratoCod_Filial.Value,
                                                     wContaCred,
                                                     'CREDITO',
                                                     QContratoCod_Cadastro.Value,
                                                     wHistorico,
                                                     wCapital,
                                                     StrToDate(FContratoParam.Me2DtBaixa.Text),
                                                     wContaDeb);
                                DMPlanilha.GravaLanc(wTipo,
                                                     wCodigo,
                                                     FloatToStr(QContratoNum_Contrato.Value),
                                                     QContratoCod_Filial.Value,
                                                     wContaDeb,
                                                     'DEBITO',
                                                     QContratoCod_Cadastro.Value,
                                                     wHistorico,
                                                     wCapital,
                                                     StrToDate(FContratoParam.Me2DtBaixa.Text),
                                                     wContaCred);
                              End;
                              // ChamaGeraMov('BaixaValor','CC');
                            end;
                           If (wjuro > 0) And (FContratoParam.Rg2TipoBaixa.ItemIndex <> 2) then  // PARA PERDA NAO GERA BAIXA POR JURO MESMO SE TIVER VILSON
                            begin
                              wqtde_mov:=0;
                              QContratoMovAntecipado.Insert;
                              QContratoMovAntecipadoCOD_CONTRATO.Value:=QContratoCOD_CONTRATO.Value;
                              QContratoMovAntecipadoDATA.Value:=StrToDate(FContratoParam.Me2DtBaixa.Text);
                              QContratoMovAntecipadoQT_QUANTIDADE.Value:=wqtde_mov;
                              QContratoMovAntecipadoVAL_MOVIMENTO.Value:=wjuro;
                              QContratoMovAntecipadoDESC_OBSERVACAO.Value:='Juros';
                              QContratoMovAntecipadoIND_SALDO_ZERO.Value:='N';
                              QContratoMovAntecipado.Post;
                              If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'AB' tHEN
                              Begin
                                If FContratoParam.Rg2TipoBaixa.ItemIndex = 0 Then
                                 Begin
                                   IncluiCaixa(QContratoCOD_FILIAL.Value,0,DMFinalidade.QFinalidadeCod_Historico_Juro.Value,
                                            wJuro,QContratoNUM_CONTRATO.Value,QContratoCOD_CADASTRO.Value,
                                            'Pagto. de Juros do Contrato',
                                            StrToDate(FContratoParam.Me2DtBaixa.Text),
                                            '','',QContratoMovAntecipadoCod_Contrato_mov.Text,'');
                                   wTipo := 'CX';
                                   wCodigo := QCaixa_MovCod_Caixa_Mov.Value;
                                 End
                                Else
                                 If FContratoParam.Rg2TipoBaixa.ItemIndex = 1 Then
                                 Begin
                                   DMBancoAgencia.IncluiBanco(DMFinalidade.QFinalidadeCod_Historico_Juro.Value,
                                            StrToInt(FContratoParam.Me2ContaCorrente.Text),
                                            QContratoNUM_CONTRATO.Value,
                                            QContratoCOD_CADASTRO.Value,
                                            StrToInt(DMOracle.BuscaNome('SELECT COD_DEPARTAMENTO FROM TB_USUARIO','COD_USUARIO = '+FloatToStr(DMUsuario.CodUsuarioCorrente))),
                                            StrToDate(FContratoParam.Me2DtBaixa.Text),
                                            wJuro,
                                            'Pagto. de Juros do Contrato',
                                            '',
                                            '','','N',QContratoMovAntecipadoCod_Contrato_mov.Text);
                                   wTipo := 'BC';
                                   wCodigo := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value;
                                 End;
                                DMHistorico.QHistorico.close;
                                DMHistorico.QHistorico.SetVariable('PK',DMFinalidade.QFinalidadeCod_Historico_Juro.Value);
                                DMHistorico.QHistorico.open;
                                wContaDeb := DMHistorico.QHistoricoCOD_CONTABIL_DEB.Value;
                                If FContratoParam.Rg2TipoBaixa.ItemIndex = 1 Then
                                Begin
                                  wBanco := DmOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + trim(FContratoParam.Me2ContaCorrente.text));
                                  If wBanco = '' Then
                                    Raise Exception.Create('Não informado conta corrente');
                                  wContaDeb := DmOracle.BuscaNome('SELECT COD_CONTABIL_VL_JURO_BCO_DEB FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + wBanco);
                                End;
                                DMPlanilha.GravaLanc(wTipo,
                                                     wCodigo,
                                                     FloatToStr(QContratoNum_Contrato.Value),
                                                     QContratoCod_Filial.Value,
                                                     DMHistorico.QHistoricoCOD_CONTABIL_CRED.Value,
                                                     'CREDITO',
                                                     QContratoCod_Cadastro.Value,
                                                     DMHistorico.QHistoricoCOD_HISTORICO_CONTABIL.Value,
                                                     wJuro,
                                                     StrToDate(FContratoParam.Me2DtBaixa.Text),
                                                     wContaDeb);
                                 DMPlanilha.GravaLanc(wTipo,
                                                     wCodigo,
                                                     FloatToStr(QContratoNum_Contrato.Value),
                                                     QContratoCod_Filial.Value,
                                                     wContaDeb,
                                                     'DEBITO',
                                                     QContratoCod_Cadastro.Value,
                                                     DMHistorico.QHistoricoCOD_HISTORICO_CONTABIL.Value,
                                                     wJuro,
                                                     StrToDate(FContratoParam.Me2DtBaixa.Text),
                                                     DMHistorico.QHistoricoCOD_CONTABIL_CRED.Value);
                              End;
                            End;
                         End;
                        If wQtde = wTotalMov then
                         begin
                           QContrato.Edit;
                           QContratoIND_SITUACAO.value:='FECHADO';
                           QContrato.Post;
                         end;
                        QContratoMovAntecipado.Close;
                        QContratoMovAntecipado.Open;
                        DMOracle.DBCemapa.Commit;
                        if FReciboContrato = nil then
                          FReciboContrato := TFReciboContrato.Create(Application);
                        if MessageDlg('Atenção! Prepare a impressora para emitir o Recibo.',mtConfirmation,[mbYes,mbNo],0) = mrYes then
                          begin
                            DMFilial.QFilial.Close;
                            DMFilial.QFilial.SetVariable('PK',DMContrato.QContratoCOD_FILIAL.Text);
                            DMFilial.QFilial.Open;
                            FReciboContrato.QRLValor.Caption:=FormatFloat('#,##0.00',wValor);
                            FReciboContrato.QRLCadastro.Caption:= QContratoCOD_CADASTRO.Text;
                            FReciboContrato.QRLNome.Caption := DmOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + QContratoCOD_CADASTRO.Text);
                            FReciboContrato.QRLValorExtenso.Caption:=Bib.extenso(wValor,'REAL');
                            FReciboContrato.QRLData.Caption:=FormatDateTime(', dd "de" MMMM "de" yyyy.',StrToDate(FContratoParam.ME2DtBaixa.text));
                            FReciboContrato.QRLObs.Caption:='Sendo : '+FormatFloat('#,##0.00',wjuro)+' de Juros e '+FormatFloat('#,##0.00',wcapital)+' de Capital. Referente a '+FormatFloat('#,##0',wQtde)+' Kg. de '+DMProduto.QProdutoDESC_PRODUTO.value+' do Contrato Nr. '+QContratoNum_Contrato.Text;
                            FReciboContrato.QRLObs.Caption:=FReciboContrato.QRLObs.Caption + ' Obs:'+Trim(FContratoParam.Ed2Observacao.Text);
                            FReciboContrato.QuickRep1.Preview;
                          end;
                        DMCaixa.QCaixa_Mov.Close;
                        DMFilial.QFilial.Close;
                      end
                    else
                      begin
                        DMOracle.DBCemapa.Rollback;
                        Showmessage('Valor informado do Valor e quantidade inválida');
                      end;
                  end
                else
                  begin
                    ShowMessage('Não há mais saldo a ser aplicado neste contrato');
                  end;
              except
                DMCaixa.QCaixa_mov.Cancel;
                QContratoMovAntecipado.Cancel;
                QContrato.Cancel;
                if DMOracle.DBCemapa.InTransaction then
                  DMOracle.DBCemapa.Rollback;
                Raise exception.Create('Erro ! Não foi possível gerar movimento do caixa, ou do contrato.');
              end;
            end;
        end;
    end;
end;

procedure TFContratoCad.BTExcluiLancClick(Sender: TObject);
var
  x,y:string;
  Num:Real;
begin
  inherited;
  num := 0;
  DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
  if DMContrato.QContratoMovAntecipadoCOD_CONTRATO_MOV.Value = 0 then
    ShowMessage('Não existem Movimentos a serem excluídos.')
  else
    If MessageDlg('Apagar este registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
       if Copy(DMContrato.QContratoMovAntecipadoDESC_OBSERVACAO.Value,1,16) <> 'Referente a Nota' then  // SE FOI POR PRODUTO OU POR VALOR
        Begin
          Y := DMOracle.BuscaNome('SELECT COD_CAIXA_MOV FROM TB_CAIXA_MOV','COD_CONTRATO_MOV = '+DMContrato.QContratoMovAntecipadoCod_Contrato_Mov.Text);
          if Y <> '' then
           Begin
             Num:=StrToFloat(y);
             DMCaixa.QCaixa_Mov.Close;
             DMCaixa.QCaixa_Mov.SetVariable('PK',Num);
             DMCaixa.QCaixa_Mov.Open;
             If (DMCaixa.QCaixa_MovCod_Nota_Cab.isNull) and
                (DMCaixa.QCaixa_MovCod_Conta_Receber_Cab.IsNull) and
                (DMCaixa.QCaixa_MovCod_Conta_Pagar_Cab.IsNull) then
               If Not(DMCaixa.QCaixa_MovCod_Caixa_Mov.IsNull) then
                begin
                  DMOracle.DBCemapa.StartTransaction;
                  Try
                    DMPlanilha.Descontabiliza(DMCaixa.QCaixa_MovCod_Caixa_Mov.Value,'CX');
                    DMCaixa.QCaixa_Mov.Delete;
                    DMContrato.QContratoMovAntecipado.Delete;
                    DMContrato.QContrato.Edit;
                    DMContrato.QContratoIND_SITUACAO.Value:='ABERTO';
                    DMContrato.QContrato.Post;
                    DMOracle.DBCemapa.Commit;
                  except
                    DMOracle.DBCemapa.RollBack;
                    Raise Exception.Create('Erro ! Não foi possível excluir este Lançamento.'+#13+
                                           'Verifique se não existem movimentos no C. de Venda relacionados a ele.');
                  end;
                end
               else
                Begin
                  DMContrato.QContratoMovAntecipado.Delete;
                  DMContrato.QContrato.Edit;
                  DMContrato.QContratoIND_SITUACAO.Value:='ABERTO';
                  DMContrato.QContrato.Post;
                  DMOracle.DBCemapa.Commit;
                End;
           End
          Else
           Begin
             Y := DMOracle.BuscaNome('SELECT COD_BCO_MOVIMENTO FROM TB_BCO_MOVIMENTO','COD_CONTRATO_MOV = '+DMContrato.QContratoMovAntecipadoCod_Contrato_Mov.Text);
             if Y <> '' then  // PAGTO POR BANCOS
              Begin
                Num:=StrToFloat(y);
                DMBancoAgencia.QBancoMovimento.Close;
                DMBancoAgencia.QBancoMovimento.SetVariable('PK',Num);
                DMBancoAgencia.QBancoMovimento.Open;
                If (DMBancoAgencia.QBancoMovimentoCod_Nota_Cab.isNull) and
                   (DMBancoAgencia.QBancoMovimentoCod_Conta_Receber_Cab.IsNull) and
                   (DMBancoAgencia.QBancoMovimentoCod_Conta_Pagar_Cab.IsNull) then
                 If Not(DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.IsNull) then
                  begin
                    DMOracle.DBCemapa.StartTransaction;
                    Try
                      DMPlanilha.Descontabiliza(DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value,'BC');
                      DMBancoAgencia.QBancoMovimento.Delete;
                      DMContrato.QContratoMovAntecipado.Delete;
                      DMContrato.QContrato.Edit;
                      DMContrato.QContratoIND_SITUACAO.Value:='ABERTO';
                      DMContrato.QContrato.Post;
                      DMOracle.DBCemapa.Commit;
                    except
                      DMOracle.DBCemapa.RollBack;
                      Raise Exception.Create('Erro ! Não foi possível excluir este Lançamento.'+#13+
                                             'Verifique se não existem movimentos no C. de Venda relacionados a ele.');
                    end;
                  end
                 else
                  Begin
                   DMContrato.QContratoMovAntecipado.Delete;
                   DMContrato.QContrato.Edit;
                   DMContrato.QContratoIND_SITUACAO.Value:='ABERTO';
                   DMContrato.QContrato.Post;
                   DMOracle.DBCemapa.Commit;
                  End;
              end
             Else
               ShowMessage('Não é Possível Excluir um Registro de Movimento'+#13+
                              'gerado pela Nota, Contas a Pagar ou Contas a Receber');
           End
        End
       else
         Begin
           Try
             If FContratoCancela = Nil then
                FContratoCancela := TFContratoCancela.Create(Application);
             if FContratoCancela.ShowModal =  mrOk then
              Begin
                DMOracle.DBCemapa.StartTransaction;
                DMNotaEntrada.pContratoAgricola:=true;
                x:=DMOracle.BuscaNome('SELECT COD_NOTA_CAB FROM TB_NOTA_CAB','COD_CONTRATO_MOV = '+FloatToStr(DMContrato.QContratoMovAntecipadoCod_Contrato_Mov.value));
                if x <> '' then
                 begin
                   DMNotaEntrada.QNotaEntrada.Close;
                   DMNotaEntrada.QNotaEntrada.SetVariable('PK',StrToInt(x));
                   DMNotaEntrada.QNotaEntrada.Open;
                   DMNotaEntrada.QItemNF.Open;
                   If DMParamSistema.QParamSistemaDt_Fechamento_Sistema.Value >= DMNotaEntrada.QNotaEntradaDt_Recebimento.Value Then
                      Raise Exception.Create('Não é Permitido Voltar Confirmação - Período Contábil');
                   DMNotaEntrada.pTipo_Lote := 1;
                   DMNotaEntrada.VoltaConfirmacao(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value,'N', '1');
                   DMNotaEntrada.pTipo_Lote := 0;
                   DMNotaEntrada.QNotaEntrada.Edit;
                   DMNotaEntrada.QNotaEntradaCod_Contrato_Mov.Text := '';
                   DMNotaEntrada.QNotaEntradaCod_Motivo_Canc.Value := StrToInt(Trim(FContratoCancela.MeMotivo.Text));
                   DMNotaEntrada.QNotaEntradaInd_Situacao.Value := '3';
                   DMNotaEntrada.QNotaEntrada.Post;
                 end;
                DMContrato.QContratoMovAntecipado.Delete;
                DMContrato.QContrato.Edit;
                DMContrato.QContratoIND_SITUACAO.Value:='ABERTO';
                DMContrato.QContrato.Post;
                DMNotaEntrada.pContratoAgricola:=False;
                DMOracle.DBCemapa.Commit;
              End;
           except
              DMNotaEntrada.pContratoAgricola:=False;
              DMOracle.DBCemapa.RollBack;
              Raise;
           end;
         end;
    end;
end;

procedure TFContratoCad.BTGeraMovClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
  ChamaGeraMov('Vend','CC');
end;

procedure TFContratoCad.BTExcluiMovClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
  if FExcluiMovVend_Ant=nil then
    FExcluiMovVend_Ant := TFExcluiMovVend_Ant.Create(Application);
  FExcluiMovVend_Ant.ShowModal;
end;

procedure TFContratoCad.MovimentoscomSaldo1Click(Sender: TObject);
begin
  inherited;
  if FBaixaMovAntecipado=Nil then
    FBaixaMovAntecipado:=TFBaixaMovAntecipado.Create(Application);
  DMOracle.DBCemapa.StartTransaction;
  FBaixaMovAntecipado.ShowModal;
  DMContrato.QContrato_Vend.Close;
  DMContrato.QContrato_Vend.Open;
  SBRefreshClick(Self);
end;

procedure TFContratoCad.ChamaGeraMov(Origem,Docto: String);
var
  SaldoAplicar, Valor, Embalagem :Real;
  wClasse,wSubClasse,wCodClasse : Integer;
begin
  inherited;
  with DMContrato do
    begin
      QContratoMovVend_Mov_Ant.Open;
      If (QContratoQTDE_SALDO.Value > 0) or (Docto = 'CC1') then
        begin
          Embalagem:=StrToFloat(DMOracle.Buscanome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+QContratoCod_produto.text));
          If Docto = 'CC1' Then
           Begin
             SaldoAplicar:= QContratoMovAntecipadoQT_Quantidade.Value * -1;
             SaldoAplicar :=Trunc(SaldoAplicar*100) / 100;
             Valor := QContratoMovAntecipadoVal_Movimento.Value * -1;
           End
          Else
           Begin
             SaldoAplicar:=QContratoQTDE_SALDO.Value;
             SaldoAplicar :=Trunc(SaldoAplicar*100) / 100;
             Valor := SaldoAplicar*QContratoPRECO.Value/Embalagem;
           End;
          wCodClasse:=StrToInt(DMOracle.BuscaNome('SELECT COD_CLASSE FROM TB_PRODUTO','COD_PRODUTO = '+QContratoCod_produto.text));
          wClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_CLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
          wSubClasse:=StrToInt(DMOracle.BuscaNome('SELECT NUM_SUBCLASSE FROM TB_CLASSE','COD_CLASSE = '+FloatToStr(wCodClasse)));
          MontaSql(wClasse,wSubClasse,0,2,'','','','','','','',4);
          If QContrato_VendConsCOD_CONTRATO_VEND.Value <> 0 then
            begin
              If FGeraMovCVenda = nil then
                FGeraMovCVenda := TFGeraMovCVenda.Create(Application);
              If not(DMOracle.DBCemapa.inTransaction) then
                DMOracle.DBCemapa.StartTransaction;
              FGeraMovCVenda.LQuantidade.caption:=FormatFloat('#,##0',SaldoAplicar);
              FGeraMovCVenda.LValor.caption:=FormatFloat('#,##0.00',Valor);
              FGeraMovCVenda.pValor:=Valor;
              FGeraMovCVenda.pQtde:=SaldoAplicar;
              FGeraMovCVenda.pOrigem:=Origem;
              FGeraMovCVenda.pDocumento := Docto;
              FGeraMovCVenda.MeBaixa.Text:=FloatToStr(SaldoAplicar);
              FGeraMovCVenda.ShowModal;
            End
          Else
            ShowMessage('Não existem Contratos de Venda Abertos para este Produto e Filial');
        end
      else
        ShowMessage('Não há mais saldo a aplicar neste contrato.');
      QContratoMovVend_Mov_Ant.Close;
      QContrato_VendCons.Close;
    end;
end;

procedure TFContratoCad.ContratoscSaldoaAplicar1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[6].TabVisible:=True;
  if FContratoParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME6CodFilial.Text),'AGRICOLA');
      with DmContrato do
        begin
          QRContratoC_Aberto.Close;
          QRContratoC_Aberto.Sql.Clear;
          QRContratoC_Aberto.Sql.Add('SELECT Tb_contrato.COD_CONTRATO,Tb_contrato.COD_FILIAL,Tb_contrato.COD_CADASTRO,Tb_contrato.IND_FIXAR,');
          QRContratoC_Aberto.Sql.Add('Tb_contrato.COD_PRODUTO,Tb_contrato.QT_QUANTIDADE,Tb_contrato.VAL_DOLAR,Tb_contrato.IND_ICMS,Tb_contrato.DT_EMISSAO,');
          QRContratoC_Aberto.Sql.Add('Tb_contrato.DT_ENTREGA,Tb_contrato.DT_VENCIMENTO,Tb_contrato.DESC_LOCAL_ENTREGA,Tb_contrato.DESC_ACONDICIONAMENTO,Tb_contrato.IND_FRETE,');
          QRContratoC_Aberto.Sql.Add('Tb_contrato.PERC_FUNRURAL,Tb_contrato.DT_ANO_SAFRA,Tb_contrato.IND_TIPO_SAFRA,Tb_contrato.TIPO_BASE,Tb_contrato.COD_AVALISTA,');
          QRContratoC_Aberto.Sql.Add('Tb_contrato.PRECO,Tb_contrato.NUM_CONTRATO,Tb_contrato.IND_CP,Tb_contrato.IND_SITUACAO,Tb_contrato.QTDE_SALDO as QT_SALDO,Tb_produto.DESC_PRODUTO,');
          QRContratoC_Aberto.Sql.Add('Tb_produto.NUM_EMBALAGEM,Tb_cadastro.NOME,TO_CHAR(Tb_contrato.DT_ENTREGA,'+Chr(39)+'YYYY'+Chr(39)+') AS DT_ANO_ENTREGA ');
          QRContratoC_Aberto.Sql.Add('FROM TB_CONTRATO,TB_CADASTRO,TB_PRODUTO WHERE ');
          QRContratoC_Aberto.Sql.Add('Tb_contrato.COD_CADASTRO = Tb_cadastro.COD_CADASTRO');
          QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.COD_PRODUTO = Tb_produto.COD_PRODUTO');
          If DMParamSistema.QparamSistemaCod_Empresa.Value = 'MOINHO' Then
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.QTDE_SALDO > 0')
          Else
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.IND_SITUACAO = ' + chr(39) + 'ABERTO' + chr(39));
          if Trim(FContratoParam.ME6CodFilial.Text)<>'' then
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.COD_FILIAL = ' + Trim(FContratoParam.ME6CodFilial.Text));
          if Trim(FContratoParam.ME6CodCliente.Text)<>'' then
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.COD_CADASTRO = ' + Trim(FContratoParam.ME6CodCliente.Text));
          if Trim(FContratoParam.ME6CodProduto.Text)<>'' then
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.COD_PRODUTO = ' + Trim(FContratoParam.ME6CodProduto.Text));
          If FContratoParam.Me6DtInicial.Text <> '' Then
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.DT_ENTREGA >= ' + Chr(39) + Trim(FContratoParam.ME6DtInicial.Text)+ Chr(39));
          If FContratoParam.Me6DtFinal.Text <> '' Then
             QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.DT_ENTREGA <= ' + Chr(39) + Trim(FContratoParam.ME6DtFinal.Text) + Chr(39));
          Case FContratoParam.RG6TipoValor.ItemIndex Of
           0 : Begin
                QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.PRECO <> 0');
                DMContrato.PTipo_Valor := 1; // Real
               End;
           1 : Begin
                QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.VAL_DOLAR <> 0');
                DMContrato.PTipo_Valor := 2;  // Dólar
               End;
          End;
          Case FContratoParam.RG6TipoPagto.ItemIndex Of
            0 : QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'A' + Chr(39));
            1 : QRContratoC_Aberto.Sql.Add(' AND Tb_contrato.IND_TIPO_PAGAMENTO = ' + Chr(39) + 'F' + Chr(39));
          End;
          If FContratoParam.Rg6Ordem.ItemIndex = 0 Then
             QRContratoC_Aberto.Sql.Add(' ORDER BY Tb_contrato.COD_PRODUTO,TO_CHAR(Tb_contrato.DT_ENTREGA,'+Chr(39)+'YYYY'+Chr(39)+'),Tb_cadastro.NOME,TB_CONTRATO.NUM_CONTRATO')
          else
             QRContratoC_Aberto.Sql.Add(' ORDER BY Tb_contrato.COD_PRODUTO,TO_CHAR(Tb_contrato.DT_ENTREGA,'+Chr(39)+'YYYY'+Chr(39)+'),TB_CONTRATO.NUM_CONTRATO');
          QRContratoC_Aberto.Open;
          if FRContratoCompra_aberto =  nil then
            FRContratoCompra_aberto := TFRContratoCompra_aberto.create(Application);
          If FContratoParam.RG6TipoValor.ItemIndex = 0 Then
             FRContratoCompra_aberto.QRlTitulo.Caption := 'Contrato de Compras com Saldo em Aberto EM REAL'
          else
             FRContratoCompra_aberto.QRlTitulo.Caption := 'Contrato de Compras com Saldo em Aberto EM DOLAR';
          FRContratoCompra_aberto.QRlFilial.Caption := 'Filial:' + FContratoParam.ME6Filial.Text;
          Case FContratoParam.RG6TipoPagto.ItemIndex Of
            0:FRContratoCompra_aberto.QrlTipoPagto.Caption :='Contratos com Pagamento: ANTECIPADO';
            1:FRContratoCompra_aberto.QrlTipoPagto.Caption :='Contratos com Pagamento: FUTURO';
            2:FRContratoCompra_aberto.QrlTipoPagto.Caption :='Contratos com pagamento: TODOS ';    
           End;
          if FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoCompra_Aberto.QRPrimario.Preview
          else
            FRContratoCompra_Aberto.QRPrimario.Print;
          QRContratoC_Aberto.Close;
        end;
    end;
end;

procedure TFContratoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(28);
end;

procedure TFContratoCad.QRCompositeReport1AddReports(Sender: TObject);
begin
  inherited;
  QRCompositeReport1.Reports.Add(FReciboFixar.QuickRep1);
  QRCompositeReport1.Reports.Add(FRReciboNFA.QuickRep1);
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',FReciboFixar.pCodCadastro);
  DMCadastro.QCadastro.Open;
  FReciboFixar.QRLEmpresa.Caption := 'EMPRESA: '+DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLEndereco.Caption := 'ENDEREÇO: '+DMOracle.BuscaNome('SELECT DESC_ENDERECO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLCep_Cidade_UF.Caption := 'CEP: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_CEP||'+#39+' '+#39+'||TB_FILIAL.DESC_CIDADE||'+#39+' '+#39+'||TB_FILIAL.COD_ESTADO FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));
  FReciboFixar.QRLTelefone.Caption := 'TELEFONE: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_TELEFONE FROM TB_FILIAL',
                                                       'COD_FILIAL = '+FloatToStr(FReciboFixar.pCodFilial));

end;

procedure TFContratoCad.ResumoPorProduto1Click(Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil then
    FContratoParam:= TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[15].TabVisible:=True;
  if FContratoParam.ShowModal =  mrOk then
    begin
      DmUsuario.Checar_Filial_Usuario( Trim(FContratoParam.ME15CodFilial.Text),'AGRICOLA');
      with DMContrato do
        begin
          QRContratoResumo.Close;
          if Trim(FContratoParam.ME15CodFilial.text) <>'' then
            QRContratoResumo.SetVariable('COD_FILIAL',FContratoParam.ME15CodFilial.text)
          else
            QRContratoResumo.SetVariable('COD_FILIAL',Null);

          if Trim(FContratoParam.ME15CodProduto.text) <>'' then
            QRContratoResumo.SetVariable('COD_PRODUTO',FContratoParam.ME15CodProduto.text)
          else
            QRContratoResumo.SetVariable('COD_PRODUTO',Null);

          if Trim(FContratoParam.ME15CodCliente.text) <>'' then
            QRContratoResumo.SetVariable('COD_CADASTRO',FContratoParam.ME15CodCliente.text)
          else
            QRContratoResumo.SetVariable('COD_CADASTRO',Null);

          if Trim(FContratoParam.ME15DtInicial.text) <>'' then
            QRContratoResumo.SetVariable('DT_INICIAL',StrToDate(FContratoParam.ME15DtInicial.text));

          if Trim(FContratoParam.ME15DtFinal.text) <>'' then
            QRContratoResumo.SetVariable('DT_FINAL',StrToDate(FContratoParam.ME15DtFinal.text));

          if Trim(Bib.LimpaString(FContratoParam.ME15DtAnoMes.Text,'/')) <>'' then
            QRContratoResumo.SetVariable('DT_ANO_SAFRA',FContratoParam.ME15DtAnoMes.Text)
          else
            QRContratoResumo.SetVariable('DT_ANO_SAFRA',Null);

          case FContratoParam.RG15TipoSafra.ItemIndex of
            0:QRContratoResumo.SetVariable('IND_TIPO_SAFRA','SAFRA');
            1:QRContratoResumo.SetVariable('IND_TIPO_SAFRA','SAFRINHA');
            2:QRContratoResumo.SetVariable('IND_TIPO_SAFRA',Null);
          end;

          case FContratoParam.RG15Situacao.ItemIndex of
            0:QRContratoResumo.SetVariable('IND_SITUACAO','ABERTO');
            1:QRContratoResumo.SetVariable('IND_SITUACAO','FECHADO');
            2:QRContratoResumo.SetVariable('IND_SITUACAO',Null);
          end;

          case FContratoParam.RG15TipoPagto.ItemIndex of
            0:QRContratoResumo.SetVariable('TIPO_PAGTO','A');//ANTECIPADO
            1:QRContratoResumo.SetVariable('TIPO_PAGTO','F');//FUTURO
            2:QRContratoResumo.SetVariable('TIPO_PAGTO',Null);//TODOS
          end;


          QRContratoResumo.Open;
          If FRContratoResumo = Nil then
            FRContratoResumo := TFRContratoResumo.Create(Application);
          case FContratoParam.RG0TipoPagto.ItemIndex of
            0:FRContratoResumo.QrlTipoPagto.Caption :='Contratos com Pagamento: ANTECIPADO';
            1:FRContratoResumo.QrlTipoPagto.Caption :='Contratos com Pagamento: FUTURO';
            2:FRContratoResumo.QrlTipoPagto.Caption :='Contratos com pagamento: TODOS ';
         end;
          If FContratoParam.RGPreview.ItemIndex = 0 then
            FRContratoResumo.QRPrimario.Preview
          else
            FRContratoResumo.QRPrimario.Print;
          QRContratoResumo.Close;
        end;
    end;

end;

procedure TFContratoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContrato.QContrato.Close;
  DMContrato.QContratoMovAntecipado.Close;
  DMContrato.QContrato_Doc.Close;
  Action := CaFree;
  FContratoCad := Nil;
end;

procedure TFContratoCad.BtFielDepositarioClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastrocons:=TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    DMcontrato.QcontratoCod_Fiel_Depositario.Value:=DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoCad.CancelamentoContrato1Click(Sender: TObject);
begin
  inherited;
  If DMContrato.QContratoCod_Contrato.Text <> '' Then
   Begin
     if FContratoCancela = Nil then
       FContratoCancela := TFContratoCancela.Create(Application);
     FContratoCancela.Caption := 'Cancela Contrato';
     If FContratoCancela.ShowModal = MrOk Then
      Begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
        DMContrato.QContrato.Edit;
        DMContrato.QContratoInd_Situacao.Value := 'CANCELADO';
        DMContrato.QContratoQtde_Saldo.Value := 0;
        DMContrato.QContratoCod_Motivo.Value := StrToInt(Trim(FcontratoCancela.MeMotivo.Text));
        DMContrato.QContrato.Post;
        DMOracle.DBCemapa.Commit;
      End;
   End;
end;

procedure TFContratoCad.LanaBaixaContratoporValornoContratodeVenda1Click(
  Sender: TObject);
begin
  inherited;
  If DBEdit1.Text = '' Then
     Raise Exception.Create('Selecionar Contrato compra futura que sera lançado');
  DmUsuario.Checar_Filial_Usuario(Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
  ChamaGeraMov('Vend','CC1');
end;

procedure TFContratoCad.ContratoNoAtendido1Click(Sender: TObject);
begin
  inherited;
  If DMContrato.QContratoCod_Contrato.Text <> '' Then
   Begin
     if FContratoCancela=Nil then
       FContratoCancela:=TFContratoCancela.Create(Application);
     FContratoCancela.Caption := 'Contrato Não Atendido';
     If FContratoCancela.ShowModal = MrOk Then
      Begin
        DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
        DMContrato.QContrato.Edit;
        DMContrato.QContratoInd_Situacao.Value := 'NATENDIDO';
        DMContrato.QContratoQtde_Saldo.Value := 0;
        DMContrato.QContratoCod_Motivo.Value := StrToInt(Trim(FcontratoCancela.MeMotivo.Text));
        DMContrato.QContrato.Post;
        DMOracle.DBCemapa.Commit;
      End;
   End;
end;

procedure TFContratoCad.BtCidadeEntregaClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil  then
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.ShowModal = mrOk  then
    DMContrato.QContratoCod_Cidade_Entrega.Value:=DMCidade.QCidadeConsCod_Cidade.Value;

end;

procedure TFContratoCad.BaixaporValornoAplicadoemContratoVenda1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoParam = Nil  then
    FContratoParam:=TFContratoParam.Create(Application);
  FContratoParam.PGRelatorio.Pages[17].TabVisible:=True;
  if FContratoParam.ShowModal=mrOk then
    begin
      with DMContrato do
        begin
          QRBaixaValor_NaoAplicado.close;
          if Trim(FContratoParam.ME17Filial.text)<>'' then
            QRBaixaValor_NaoAplicado.SetVariable('FILIAL',FContratoParam.ME17Filial.text)
          else
            QRBaixaValor_NaoAplicado.SetVariable('FILIAL',Null);
          QRBaixaValor_NaoAplicado.open;

          if FrBaixaValorNaoAplicado=Nil then
            FrBaixaValorNaoAplicado:=TFrBaixaValorNaoAplicado.Create(Application);
          if FContratoParam.RGPreview.ItemIndex = 0 then
             FrBaixaValorNaoAplicado.QRPrimario.Preview
          else
             FrBaixaValorNaoAplicado.QRPrimario.Print;
          QRBaixaValor_NaoAplicado.close;
        end;
    end;
end;

procedure TFContratoCad.FecharContrato1Click(Sender: TObject);
begin
  inherited;
  If DMContrato.QContratoCod_Contrato.Text <> '' Then
  Begin
    If DMContrato.QContratoQT_QUANTIDADE.Value = 0 then
    Begin
      DmUsuario.Checar_Filial_Usuario( Trim(DMContrato.QContratoCOD_FILIAL.Text),'AGRICOLA');
      DMContrato.QContrato.Edit;
      DMContrato.QContratoInd_Situacao.Value := 'FECHADO';
      DMContrato.QContrato.Post;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Contrato fechado com Sucesso!');
    end
    else
      Raise Exception.Create('Só Contratos com quantidade 0 podem ser fechados!');
  End
  else
    Raise Exception.Create('Selecione um Contrato!');
end;

procedure TFContratoCad.AlterarOBSContratos1Click(Sender: TObject);
Var wobs : String;
    ClickedOK: Boolean;
begin
  inherited;
  If DMContrato.QContratoCod_Contrato.Text <> '' Then
   Begin
     wObs := DMContrato.QContratoDesc_Observacao.Value;
     ClickedOK := InputQuery('Digite Observacao', 'Obs:', wObs);
     If ClickedOK Then
     Begin
       DMContrato.QContrato.Edit;
       DMContrato.QContratoDesc_Observacao.Value := wObs;
       DMContrato.QContrato.Post;
       DMOracle.DBCemapa.Commit;
     End;
   End;
end;

procedure TFContratoCad.SBIncluirClick(Sender: TObject);
begin
  If DMOracle.BuscaNome('SELECT Ind_Bloqueio_Fixacao FROM TB_PARAM_SISTEMA','COD_FILIAL >= 0 ') = 'B' then
     Raise Exception.Create('Neste Momento o Sistema Encontra-se Fechado Para Realizar Contratos');
  inherited;

end;

procedure TFContratoCad.SbFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
     MECodFilial.text:=DMFilial.QFilialConsCOD_FILIAL.text;

end;

procedure TFContratoCad.SbTributacaoClick(Sender: TObject);
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

procedure TFContratoCad.MECodTribProdExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodTribProd.Text)<>'' then
    METribut.Text:=DMOracle.BuscaNome('SELECT DESC_TRIBUTACAO FROM TB_TRIBUTACAO','COD_TRIBUTACAO = '+MECodTribProd.text)
  else
    METribut.Clear;

end;

procedure TFContratoCad.BtConsMensClick(Sender: TObject);
begin
  inherited;
  If FMensagemCons = Nil then
    FMensagemCons := TFMensagemCons.Create(Application);
  If FMensagemCons.ShowModal = mrOk then
    MeCodMens.Text := FloatToStr(DMMensagem.QMensagemConsCod_Mensagem.Value);

end;

procedure TFContratoCad.SpeedButton2Click(Sender: TObject);
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

procedure TFContratoCad.MECodOperacaoExit(Sender: TObject);
begin
  inherited;
  if MECodOperacao.text<>'' then
    MEOperacao.Text:=DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+MECodOperacao.text)
  else
    MEOperacao.clear;

end;

procedure TFContratoCad.SbTransportadoraClick(Sender: TObject);
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

procedure TFContratoCad.MECodTransportadoraExit(Sender: TObject);
begin
  inherited;
  if MECodTransportadora.Text<>''  then
    METransportadora.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodTransportadora.Text)
  else
    METransportadora.Clear;

end;

procedure TFContratoCad.SbMotoristaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeMotorista.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContratoCad.SbParceriaClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     MeParceiro.Text:=DMCadastro.QCadastroConsCOD_CADASTRO.Text;

end;

procedure TFContratoCad.BitBtn2Click(Sender: TObject);
Var wTotalMov,wQt_DPI,wEmbalagem,wPercDpi : Real;

begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'AGRICOLA');
  If Trim(MeQuantidade.Text) = '' Then
     Raise Exception.Create('Informar Quantidade');
  If Trim(MeCodFilial.Text) = '' Then
     Raise Exception.Create('Informar código filial');
  If Trim(MECodTribProd.Text) = '' Then
     Raise Exception.Create('Informar código tributação');
  If Trim(MeValTotal.Text) = '' Then
     Raise Exception.Create('Informar valor total');
  If Trim(MECodOperacao.Text) = '' Then
     Raise Exception.Create('Informar operação');
  If Trim(MeNrNota.Text) = '' Then
     Raise Exception.Create('Informar número da nota');
  If Trim(MeSerie.Text) = '' Then
     Raise Exception.Create('Informar série da nota');
  If Trim(MeModelo.Text) = '' Then
     Raise Exception.Create('Informar modelo da nota');

  DMContrato.QContratoMovAntecipado.Close;
  DMContrato.QContratoMovAntecipado.Open;
  DMContrato.QContratoMovAntecipado.First;
  wTotalMov:=0;
  while not(DMContrato.QContratoMovAntecipado.Eof) do
    Begin
      wTotalMov:=wTotalMov+DMContrato.QContratoMovAntecipadoQT_Quantidade.value;
      DMContrato.QContratoMovAntecipado.Next;
    End;
  wTotalMov:=DMContrato.QContratoQT_Quantidade.Value - wTotalMov;
  If StrToFloat(Trim(MeQuantidade.Text)) > wTotalMov Then
     Raise Exception.Create ('Quantidade Informada Maior que Quantidade Aberto do Contrato');

  with DMNotaEntrada do
    Begin
      PContabiliza_Extra := 'N';
      pTipoNota := 'AGRICOLA';
      QNotaEntrada.Open;
      QItemNF.Open;
     Try
      QNotaEntrada.Insert;
      QNotaEntradanum_nota.Value:=StrToInt(Trim(MeNrNota.Text));
      QNotaEntradaCOD_CADASTRO.Value:=DMContrato.QContratoCOD_CADASTRO.Value;
      QNotaEntradaCOD_SERIE.Value:=Trim(MeSerie.Text);
      QNotaEntradaCOD_SERIE_MODELO.Value:=Trim(MeModelo.Text);
      QNotaEntradaCOD_FILIAL.Value:=StrToInt(Trim(MeCodFilial.Text));
      QNotaEntradaCOD_OPERACAO.Value:=StrToInt(Trim(MECodOperacao.Text));
      QNotaEntradaDt_Recebimento.Value := StrToDate(MeDtEntrada.Text);
      QNotaEntradaDt_Emissao.Value := StrToDate(MeDtEmissao.Text);
      QNotaEntradaObs.Value := Trim(MeObs1.Text);
      QNotaEntradaObs_Complemento.Value := Trim(MeObs2.Text);
      Case RgCondicaoPagto.ItemIndex of
         0 : QNotaEntradaInd_Condicao_Pagto.Value := '1';
         1 : QNotaEntradaInd_Condicao_Pagto.Value := '2';
      End;
      DMNotaEntrada.pOperacaoInterna := 0; // Confirmando a Nota
      If Trim(MeCodMens.Text) <> '' Then
         QNotaEntradaCod_Mensagem.Value := StrToInt(Trim(MeCodMens.Text));

      if Trim(MECodTransportadora.Text) <> '' then
         QNotaEntradaCOD_TRANSPORTADOR.Value:=StrToInt(Trim(MECodTransportadora.Text))
      else
         QNotaEntradaDESC_TRANSPORTADORA.Value:=Trim(MeTransportadora.Text);
      If RgTipoFrete.ItemIndex = 0 Then
         QNotaEntradaIND_TIPO_FRETE.Value := 'CIF'
      Else
         QNotaEntradaIND_TIPO_FRETE.Value := 'FOB';
      If (Trim(MeParceiro.Text) <> '') And (Trim(MeParceiro.Text) <> '0') Then
         QNotaEntradaCod_Cadastro_Parceiro.Value := StrToInt(Trim(MeParceiro.Text));
      If Trim(MeMotorista.Text) <> '' Then
         QNotaEntradaCod_Motorista.Value := StrToInt(Trim(MeMotorista.Text));
      If Trim(MePlaca.Text) <> '' Then
         QNotaEntradaDesc_Placa.Value := Trim(MePlaca.Text);
      QItemNF.Insert;
      QItemNFCod_produto.Value:=DMContrato.QContratoCOD_PRODUTO.value;
      QItemNFQT_QUANTIDADE.Value:=StrToFloat(Trim(MeQuantidade.Text));
      QItemNFVAL_UNITARIO.Value:=DMContrato.QContratoPreco.Value;
      QItemNFNUM_NOTA_PRODUTOR.Text := Trim(MeNfProdutor.Text);
      QItemNFIND_BX_CONTR_VEND.Value:='S';
      QItemNFCod_Lote_Tipo.Value := 1;
      QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
      If Trim(MeCreditoSemente.Text) <> '' Then
         QItemNFQT_CREDITO_TRANSGENICOS.Value := StrToFloat(Trim(MeCreditoSemente.Text))
      Else
         QItemNFQT_CREDITO_TRANSGENICOS.Value := 0;
      wQt_DPI := QItemNFQT_QUANTIDADE.Value - QItemNFQT_CREDITO_TRANSGENICOS.Value;
      wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                   'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)));
      wPercDpi :=StrToFloat(DMOracle.BuscaNome('SELECT PERC_DPI_TRANSGENICOS FROM TB_PRODUTO_AGRICOLA',
                   'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)));
      If (wPercDpi > 0) And (wQt_DPI > 0) Then
         QItemNFVAL_DPI_TRANSGENICOS.Value := QItemNFVal_Unitario.Value * wQt_DPI / wEmbalagem * wPercDpi / 100;
      If Trim(MeQtChegada.Text) <> '' Then
         QItemNFQT_Chegada.Value := StrToFloat(Trim(MeQtChegada.Text));
      QItemNF.Post;
      QItemNF.First;
      QNotaEntradaVAL_FUNRURAL.Value:=CalculaFunrural(QItemNFCOD_PRODUTO.value,
                                      QNotaEntradaCOD_OPERACAO.value,
                                      QNotaEntradaCOD_CADASTRO.Value,
                                      QItemNFVAL_TOTAL.value);
      DMContrato.QContratoMovAntecipado.Insert;
      DMContrato.QContratoMovAntecipadoCOD_CONTRATO.Value:=DMContrato.QContratoCOD_CONTRATO.Value;
      DMContrato.QContratoMovAntecipadoDATA.Value:=DMOracle.DataServ;
      DMContrato.QContratoMovAntecipadoQT_QUANTIDADE.Value:=QItemNFQT_QUANTIDADE.Value;
      DMContrato.QContratoMovAntecipadoVAL_MOVIMENTO.Value:=QItemNFVAL_TOTAL.value - QNotaEntradaVAL_FUNRURAL.Value;
      DMContrato.QContratoMovAntecipadoDESC_OBSERVACAO.Value:='Referente a Nota : Cod:'+FloatTostr(DMNotaEntrada.QNotaEntradaCod_Nota_cab.value);
      DMContrato.QContratoMovAntecipadoIND_SALDO_ZERO.Value:='N';
      DMContrato.QContratoMovAntecipado.Post;
      QNotaEntradaCOD_CONTRATO_MOV.Value:=Trunc(DMContrato.QContratoMovAntecipadoCOD_CONTRATO_MOV.Value);
      Try
        DMNotaEntrada.QNotaEntrada.AutoCalcFields:=False;
        DMNotaEntrada.QItemNF.AutoCalcFields:=False;
        DMNotaEntrada.QSomaItemNota.AutoCalcFields:=False;
        DMNotaEntrada.QItemNF.DisableControls;
        If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
          Raise Exception.Create('Nota Fiscal já confirmada!');
        If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
          Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
        DMNotaEntrada.pOperacaoInterna := 3; // Confirmando a Nota
        If FNotaAgricolaConf = Nil then
           FNotaAgricolaConf := TFNotaAgricolaConf.Create(Application);
        FNotaAgricolaConf.ShowModal;
{                          If FNotaEntrada_Confirma = Nil then
          FNotaEntrada_Confirma := TFNotaEntrada_Confirma.Create(Application);
        FNotaEntrada_Confirma.pContrato:=True;
        FNotaEntrada_Confirma.ShowModal; }
        DMNotaEntrada.pOperacaoInterna := 0;
        DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True;
        DMNotaEntrada.QItemNF.AutoCalcFields:=True;
        DMNotaEntrada.QSomaItemNota.AutoCalcFields:=True;
        DMNotaEntrada.QItemNF.EnableControls;
        If (StrToFloat(Trim(MeQuantidade.Text)) = wTotalMov) And (DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2') then
         begin                     // esta testando a situacao porque pode chegar no final da tela de
           DMContrato.QContrato.Edit;         // fechamento e dar um click no botao de cancelar
           DMContrato.QContratoIND_SITUACAO.value:='FECHADO';
           DMContrato.QContrato.Post;
         end;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
        ShowMessage('Geração de Nota e Movimento efetuado com sucesso.');
      Except
        DMNotaEntrada.QNotaEntrada.EnableControls;
        DMNotaEntrada.QItemNF.EnableControls;
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMContrato.QContratoMovAntecipado.Cancel;
        If DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
        Raise exception.Create('Erro ! Não foi possível gerar a nota ou o movimento do contrato.');
      End;
     Except
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMContrato.QContratoMovAntecipado.Cancel;
        If DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
     End;     
  end;
  MeQuantidade.Clear;
  MeValTotal.Clear;
  MeNrNota.Clear;
  MEPlaca.Clear;
  MeMotorista.Clear;
  MeQtChegada.Clear;
  MeCreditoSemente.Clear;
  MeNfProdutor.Clear;
  DMContrato.QContrato.Close;
  DMContrato.QContrato.Open;
end;

procedure TFContratoCad.PgControlChange(Sender: TObject);
begin
  inherited;
  If PgControl.ActivePage = TsRecebimento Then
   Begin
     MeCodFilial.Text := DMContrato.QContratoCod_Filial.Text;
     MeParceiro.Text := DMContrato.QContratoCOD_CADASTRO_PARCEIRO.Text;
     MeDtEmissao.Text := DateToStr(DmOracle.DataServ);
     MeDtEntrada.Text := DateToStr(DmOracle.DataServ);
   End;

end;

procedure TFContratoCad.MeQuantidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(MeQuantidade.Text) <> '' Then
     MeValTotal.Text := FormatFloat('##0.00',StrToFloat(MeQuantidade.Text) * DMContrato.QContratoPreco.Value / 60);
end;

procedure TFContratoCad.Button1Click(Sender: TObject);
begin
  inherited;
  BTExcluiLancClick(Self);
end;

procedure TFContratoCad.BtOperacaoClick(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = Nil then
    FOperacaoCons:=TFOperacaoCons.Create(Application);
  if FOperacaoCons.ShowModal = mrOk then
    DMContrato.QContratoCod_Operacao.Value:=DMOperacao.QOperacaoConsCod_Operacao.Value;

end;

procedure TFContratoCad.Gera_Nf_Contrato(pOperacao: Integer; pUnitario,pBaixa: Real; pCod_Nota_Cab, pNfProdutor: String);
Var wCod_Msg,wInd_Fixar_Empresa,wInd_Compras : String;
    wQt_DPI,wEmbalagem,wFunRural : Real;
    wCod : Integer;
Begin
  with DMNotaEntrada do
    Begin
      QNotaEntrada.Insert;
      QNotaEntradaCOD_FILIAL.Value:=StrToInt(Trim(FContratoParam.Me1CodFilial.Text));
      QNotaEntradaCOD_OPERACAO.Value:= pOperacao;
      QNotaEntradaCOD_CADASTRO.Value:=StrToInt(Trim(FContratoParam.ME1CodCliente.text));
      QNotaEntradaCOD_SERIE.Value:=DMOracle.BuscaNome('SELECT COD_SERIE FROM TB_FILIAL','COD_FILIAL = '+FloatToStr(DMContrato.QContratoCOD_FILIAL.Value),True);
      QNotaEntradanum_nota.Value:=0;
      QNotaEntradaDt_Recebimento.Value := DMOracle.DataServ;
      QNotaEntradaDt_Emissao.Value := DMOracle.DataServ;
      QNotaEntradaObs.Value := FContratoParam.Ed1Observacao.text;
      QNotaEntradaObs_Complemento.Value := FContratoParam.Ed1Observacao1.text;
      If DMOracle.BuscaNome('SELECT IND_CONTA_PAGAR FROM TB_OPERACAO','COD_OPERACAO = '+QNotaEntradaCOD_OPERACAO.Text,True) = 'S' Then
         QNotaEntradaInd_Condicao_Pagto.Value := '2'
      Else
         QNotaEntradaInd_Condicao_Pagto.Value := '1';
      If (Trim(FContratoParam.Me1Parceiro.Text) <> '0') And
         (Trim(FContratoParam.Me1Parceiro.Text) <> '') Then
         QNotaEntradaCod_Cadastro_Parceiro.Text := Trim(FContratoParam.Me1Parceiro.Text);
      If pCod_Nota_Cab <> '' Then  // somente para notas do moinho iguacu - será nota de compra
         QNotaEntradaCOD_NOTA_CAB_DEV_FIXAR.Value := StrToInt(pCod_Nota_Cab);  // grava o codigo da nota fiscal de devolucao que foi gerado

      DMNotaEntrada.pOperacaoInterna := 0; // Confirmando a Nota
      wCod_Msg:=DMOracle.BuscaNome('SELECT COD_MENSAGEM FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaEntradaCOD_OPERACAO.Value),True);
      If wCod_Msg <> '' Then
         QNotaEntradaCod_Mensagem.Value := StrToInt(wCod_Msg);
      QItemNF.Insert;
      QItemNFCod_produto.Value:=DMContrato.QContratoCOD_PRODUTO.value;
      QItemNFQT_QUANTIDADE.Value:=pBaixa;
      QItemNFVAL_UNITARIO.Value:=pUnitario;
      QItemNFIND_BX_CONTR_VEND.Value:='S';
      If Trim(FContratoParam.Me1LoteTipo.Text) <> '' Then
         QItemNFCod_Lote_Tipo.Value := StrToInt(Trim(FContratoParam.Me1LoteTipo.Text));

      QItemNFVAL_DPI_TRANSGENICOS.Value := 0;
      QItemNFQT_CREDITO_TRANSGENICOS.Value := 0;
      If PNfProdutor <> '' Then
         QItemNFNum_Nota_Produtor.Value := StrToInt(Trim(PNfProdutor));
      wInd_Fixar_Empresa := DMOracle.BuscaNome('SELECT Ind_Fixar_Empresa FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaEntradaCOD_OPERACAO.Value),True);
      wInd_Compras := DMOracle.BuscaNome('SELECT IND_COMPRAS FROM TB_OPERACAO','COD_OPERACAO = '+FloatToStr(QNotaEntradaCOD_OPERACAO.Value),True);
      If (wInd_Fixar_Empresa = 'F') Or // somente desconta transgenicos para fixacao nao tem na devolucao
         (wIND_COMPRAS = 'C') Then  // para moinho testa o compras porque faz nota devolucao e um nota de compra
        If Trim(FContratoParam.Me1CreditoSemente.Text) <> '' Then
         Begin
           QItemNFQT_CREDITO_TRANSGENICOS.Value := StrToFloat(Trim(FContratoParam.Me1CreditoSemente.Text));
           wQt_DPI := QItemNFQT_QUANTIDADE.Value - QItemNFQT_CREDITO_TRANSGENICOS.Value;
           wEmbalagem :=StrToFloat(DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO',
                        'COD_PRODUTO = '+FloatToStr(QItemNFCod_Produto.Value)));
           If (Trim(FContratoParam.Me1PercDpi.Text) <> '') And (Trim(FContratoParam.Me1PercDpi.Text) <> '0') And (wQt_DPI > 0) Then
              QItemNFVAL_DPI_TRANSGENICOS.Value := QItemNFVal_Unitario.Value * wQt_DPI / wEmbalagem * StrToFloat(Trim(FContratoParam.Me1PercDpi.Text)) / 100;
         End;
      QItemNF.Post;
      wSalva_Cod_Nota := QNotaEntradaCod_Nota_Cab.Text; // salva o codigo da nota para fazer a nota seguinte para o moinho
      QItemNF.First;
      wFunRural:=0;
      If (wInd_Fixar_Empresa = 'F') Or
         (wIND_COMPRAS = 'C') Then
         wFunRural:=CalculaFunrural(QItemNFCOD_PRODUTO.value,
                                   QNotaEntradaCOD_OPERACAO.value,
                                   StrToFloat(Trim(FContratoParam.ME1CodCliente.text)),
                                   QItemNFVAL_TOTAL.value);
      QNotaEntradaVAL_FUNRURAL.value:=wFunRural;
      If (wInd_Fixar_Empresa = 'F') Or // somente desconta transgenicos para fixacao nao tem na devolucao
         (wIND_COMPRAS = 'C') Then  // para moinho testa o compras porque faz nota devolucao e um nota de compra
       Begin
         DMContrato.QContratoMovAntecipado.Insert;
         DMContrato.QContratoMovAntecipadoCOD_CONTRATO.Value:=DMContrato.QContratoCOD_CONTRATO.Value;
         DMContrato.QContratoMovAntecipadoDATA.Value:=DMOracle.DataServ;
         DMContrato.QContratoMovAntecipadoQT_QUANTIDADE.Value:=pBaixa;
         DMContrato.QContratoMovAntecipadoVAL_MOVIMENTO.Value:=Trunc((((DMContrato.QContratoMovAntecipadoQT_QUANTIDADE.Value*pUnitario)*(100-DMContrato.QContratoPERC_FUNRURAL.value)/100)/DMProduto.QProdutoNUM_EMBALAGEM.Value) * 100) / 100;
         DMContrato.QContratoMovAntecipadoDESC_OBSERVACAO.Value:='Referente a Nota : Cod:'+FloatTostr(DMNotaEntrada.QNotaEntradaCod_Nota_cab.value);
         DMContrato.QContratoMovAntecipadoIND_SALDO_ZERO.Value:='N';
         DMContrato.QContratoMovAntecipado.Post;
         wCod:=Trunc(DMContrato.QContratoMovAntecipadoCOD_CONTRATO_MOV.Value);
         QNotaEntradaCOD_CONTRATO_MOV.Value:=wCod;
       End;
      If DMParamSistema.QParamSistemaCod_Empresa.Value <> 'MOINHO' Then
       // Esta rotina executa novamente quando executa o FNotaAgricolaConf entao para o moinho deixei executado somente la, porque nao tem mais desconto nas notas de fixacao (agora devolucao)
         DMNotaEntrada.CalculaDesconto(DMNotaEntrada.QNotaEntradaCOD_CADASTRO.Value,DMNotaEntrada.QNotaEntradaCOD_FILIAL.Value,DMNotaEntrada.QNotaEntradaCOD_OPERACAO.Value,DMNotaEntrada.QItemNFCOD_NOTA_ITEM.Value,DMNotaEntrada.QItemNFCOD_PRODUTO.Value,DMNotaEntrada.QItemNFQT_QUANTIDADE.Value,'E',DMNotaEntrada.QNotaEntradaCOD_CADASTRO_PARCEIRO.Text);  // calcula desconto do a fixar
//                        QNotaEntrada.Post;
     { QItemNf.Edit;
      QItemNfVal_Desconto.Value := QNotaEntradaVal_Desconto.Value;
      QItemNf.Post;  } //comentado por Alessandro em 05/02/13. O desconto não pode ser adicionado no val_desconto do item, pois ele é rateado no val_desconto_rateio quando é salva a nota.
      Try
        DMNotaEntrada.QNotaEntrada.AutoCalcFields:=False;
        DMNotaEntrada.QItemNF.AutoCalcFields:=False;
        DMNotaEntrada.QSomaItemNota.AutoCalcFields:=False;
        DMNotaEntrada.QItemNF.DisableControls;
        If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '2' Then
          Raise Exception.Create('Nota Fiscal já confirmada!');
        If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
          Raise Exception.Create('Não é possível confirmar uma Nota Fiscal Cancelada!');
        DMNotaEntrada.pOperacaoInterna := 3; // Confirmando a Nota
        If FNotaAgricolaConf = Nil then
           FNotaAgricolaConf := TFNotaAgricolaConf.Create(Application);
        If QNotaEntradaIND_CONDICAO_PAGTO.Value = '2' Then
           FNotaAgricolaConf.GBCPNota.Visible := True
        Else
           FNotaAgricolaConf.GBCPNota.Visible := False;
        FNotaAgricolaConf.ShowModal;
        DMNotaEntrada.pOperacaoInterna := 0;
        DMNotaEntrada.QNotaEntrada.AutoCalcFields:=True;
        DMNotaEntrada.QItemNF.AutoCalcFields:=True;
        DMNotaEntrada.QSomaItemNota.AutoCalcFields:=True;
        DMNotaEntrada.QItemNF.EnableControls;
        If DMOracle.DBCemapa.InTransaction then
           DMOracle.DBCemapa.Commit;
      Except
        DMNotaEntrada.QNotaEntrada.EnableControls;
        DMNotaEntrada.QItemNF.EnableControls;
        DMNotaEntrada.QNotaEntrada.Cancel;
        DMNotaEntrada.QItemNF.Cancel;
        DMContrato.QContratoMovAntecipado.Cancel;
        If DMOracle.DBCemapa.InTransaction then
          DMOracle.DBCemapa.Rollback;
        Raise exception.Create('Erro ! Não foi possível gerar a nota ou o movimento do contrato.');
      End;
  end;
End;

procedure TFContratoCad.BtParceiroClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
     DMContrato.QContratoCOD_CADASTRO_PARCEIRO.Value:=DMCadastro.QCadastroConsCOD_CADASTRO.Value;

end;

procedure TFContratoCad.AlteraFilialContrato1Click(Sender: TObject);
Var wFilial : String;
    ClickedOK: Boolean;
begin
  inherited;
  If DMContrato.QContratoCod_Contrato.Text <> '' Then
   Begin
     wFilial := DMContrato.QContratoCod_Filial.Text;
     ClickedOK := InputQuery('Digite Nova Filial', 'Codigo Filial:', wFilial);
     If ClickedOK Then
     Begin
       DMContrato.QContrato.Edit;
       DMContrato.QContratoCod_Filial.Value := StrToInt(wFilial);
       DMContrato.QContrato.Post;
       DMOracle.DBCemapa.Commit;
     End;
   End;

end;

procedure TFContratoCad.AlteraCdigoProduto1Click(Sender: TObject);
begin
  inherited;
  If DMContrato.QContratoCod_Contrato.Text <> '' Then
   Begin
     If FAlteraProduto = Nil Then
        FAlteraProduto := TFAlteraProduto.Create(Application);
     If FAlteraProduto.ShowModal = MrOk Then
      with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTRATO SET COD_PRODUTO = ' + FAlteraProduto.FmProduto.MeProduto.Text );
          QExecSQL.SQL.Add('WHERE COD_CONTRATO = ' + DMContrato.QContratoCod_Contrato.Text);
          QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
          DMContrato.QContrato.Refresh;
        Except
          DMOracle.DBCemapa.Rollback;
          Raise Exception.Create('Código produto não foi atualizado');
        end;
      end;
   End;
end;

procedure TFContratoCad.SpeedButton9Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
     MeArquivo.Text := OpenDialog.FileName;

end;

procedure TFContratoCad.BitBtn3Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMContrato.QContrato_Doc.Insert;
  Stream := DMContrato.QContrato_Doc.CreateBlobStream(DMContrato.QContrato_DocARQUIVO, bmWrite);
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
    DMContrato.QContrato_DocNOME_ARQUIVO.AsString := wNomeArquivo;
    DMContrato.QContrato_DocDESCRICAO.AsString := MeArquivo.Text;
    DMContrato.QContrato_DocDT_INCLUSAO.AsDateTime := Now;
    DMContrato.QContrato_DocCOD_contrato.Value := DMContrato.QContratoCOD_contrato.Value;

    DMContrato.QContrato_Doc.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;

end;

procedure TFContratoCad.BitBtn1Click(Sender: TObject);
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
  NomeArquivo := PastaTemp + '\' + DsContrato_Doc.DataSet.FieldByName('NOME_ARQUIVO').AsString;
  Stream := DsContrato_Doc.DataSet.CreateBlobStream(DsContrato_Doc.DataSet.FieldByName('ARQUIVO'), bmRead);
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

procedure TFContratoCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMContrato.QContrato_Doc.Delete;

end;

procedure TFContratoCad.MeFilialExit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(MeFilial.Text);
end;

end.
