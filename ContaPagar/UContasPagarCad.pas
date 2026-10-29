unit UContasPagarCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, ComObj, OracleNavigator, DBDirceu, variants,
  ActnList, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, DBPanel;

type
  TFContasPagarCad = class(TFTCadSimples)
    PCContasPagar: TPageControl;
    TS0ContasPagar: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label15: TLabel;
    DBEValorTitulo: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    BtFinalidade: TSpeedButton;
    BtAgencia: TSpeedButton;
    BtFornecedor: TSpeedButton;
    BtFilial: TSpeedButton;
    TS1ContasPagarMov: TTabSheet;
    DBGrid1: TDBGrid;
    DBRGSituacao: TDBRadioGroup;
    Opcoes: TMenuItem;
    Baixa1: TMenuItem;
    GroupBox1: TGroupBox;
    RelaodeContasPagarpVencimentos1: TMenuItem;
    MovimentoContasPagar1: TMenuItem;
    RelaodeTtulosporFornecedor1: TMenuItem;
    DBRGAceite: TDBRadioGroup;
    RelaodeTtulosBaixados1: TMenuItem;
    EmissodeCheques1: TMenuItem;
    RelaodeTtulosAbertos1: TMenuItem;
    LiberarBaixa1: TMenuItem;
    DBEValorIndexado: TDBEdit;
    Label2: TLabel;
    Label10: TLabel;
    DBEdit2: TDBEdit;
    BtDepto: TSpeedButton;
    VoltaBaixadeTtulos1: TMenuItem;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    EmissoRecibo1: TMenuItem;
    OracleNavigator1: TOracleNavigator;
    PgtosporDptoeFinalidade1: TMenuItem;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    ResumoCtaPagarDiario1: TMenuItem;
    TS2ContasPagarSer: TTabSheet;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    MeTitulo: TMaskEdit;
    MeParcela: TMaskEdit;
    MeDocumento: TMaskEdit;
    MeCodFilial: TMaskEdit;
    MeCodFornecedor: TMaskEdit;
    MeCodFinalidade: TMaskEdit;
    MeCodDepto: TMaskEdit;
    MeEmissao: TMaskEdit;
    MeVencto: TMaskEdit;
    MeValor: TMaskEdit;
    SpeedButton8: TSpeedButton;
    MeFilial: TMaskEdit;
    SB4CodFornecedor: TSpeedButton;
    MeFornecedor: TMaskEdit;
    SpeedButton15: TSpeedButton;
    EdFinalidade: TMaskEdit;
    SpeedButton14: TSpeedButton;
    MeDepartamento: TMaskEdit;
    Label27: TLabel;
    MeValorIR: TMaskEdit;
    Label28: TLabel;
    MeVctoIR: TMaskEdit;
    Label29: TLabel;
    MeValorINSS: TMaskEdit;
    Label30: TLabel;
    MeVctoINSS: TMaskEdit;
    Label31: TLabel;
    MeValorCofins: TMaskEdit;
    Label32: TLabel;
    MeVctoCofins: TMaskEdit;
    Label33: TLabel;
    MeValorPIS: TMaskEdit;
    Label34: TLabel;
    MeVctoPIS: TMaskEdit;
    Label35: TLabel;
    MeValorCSLL: TMaskEdit;
    Label36: TLabel;
    MeVctoCSLL: TMaskEdit;
    BtOk: TBitBtn;
    TtulosporFinalidade1: TMenuItem;
    Label37: TLabel;
    DBEdit15: TDBEdit;
    DBDirceu1: TDBDirceu;
    DBDirceu2: TDBDirceu;
    DBDirceu3: TDBDirceu;
    DBDirceu4: TDBDirceu;
    DBDirceu5: TDBDirceu;
    TotalporFornecedor1: TMenuItem;
    TitulosAbertosSinttico1: TMenuItem;
    ConciliaoContasPagarContasReceber1: TMenuItem;
    Label38: TLabel;
    DBEdit10: TDBEdit;
    Label39: TLabel;
    DBEdit16: TDBEdit;
    CalculoDescontosAntecipacaoPontualidade1: TMenuItem;
    GerarContrato1: TMenuItem;
    Promissria1: TMenuItem;
    Label40: TLabel;
    DBEdit18: TDBEdit;
    Label41: TLabel;
    BtContaCorrente: TSpeedButton;
    DBEdit19: TDBEdit;
    Label42: TLabel;
    DBEdit20: TDBEdit;
    Label43: TLabel;
    DBEdit21: TDBEdit;
    Label44: TLabel;
    DBEdit22: TDBEdit;
    Label45: TLabel;
    DBEdit23: TDBEdit;
    Label46: TLabel;
    DBEdit24: TDBEdit;
    AgendaBaixa1: TMenuItem;
    DBComboBox1: TDBComboBox;
    Label47: TLabel;
    Label48: TLabel;
    DBEdit25: TDBEdit;
    tulosOutrasMoedas1: TMenuItem;
    EmiteReciboPBaixasemLote1: TMenuItem;
    EmiteChequePPagamentoAgrupado1: TMenuItem;
    LanarJurosManual1: TMenuItem;
    N2: TMenuItem;
    PrazoMdio1: TMenuItem;
    ExclusodeTtulosemLote1: TMenuItem;
    AlterarDtVencimentoProrrogado1: TMenuItem;
    itulosAbertoporFornecedorSintetico1: TMenuItem;
    AcrescentarValoraoTtulo1: TMenuItem;
    Label49: TLabel;
    DBEdit26: TDBEdit;
    Label73: TLabel;
    DBEdit70: TDBEdit;
    Label74: TLabel;
    DBEdit71: TDBEdit;
    LanarParcelamento1: TMenuItem;
    TabSheet1: TTabSheet;
    DBMemo1: TDBMemo;
    DBPanel1: TDBPanel;
    SpeedButton1: TSpeedButton;
    ContasporCentrodeCusto1: TMenuItem;
    TabSheet2: TTabSheet;
    DBGTitulosAntigos: TDBGrid;
    DBGTitulosNovos: TDBGrid;
    Label50: TLabel;
    Label51: TLabel;
    TabSheet3: TTabSheet;
    DSContaPagarDocumento: TDataSource;
    GroupBox2: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid2: TDBGrid;
    BitBtn3: TBitBtn;
    Label52: TLabel;
    MeArquivo: TMaskEdit;
    SpeedButton2: TSpeedButton;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    Label53: TLabel;
    Label54: TLabel;
    OpenDialog: TOpenDialog;
    procedure FormActivate(Sender: TObject);
    procedure BtFinalidadeClick(Sender: TObject);
    procedure BtAgenciaClick(Sender: TObject);
    procedure BtFornecedorClick(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure Baixa1Click(Sender: TObject);
    procedure RelaodeContasPagarpVencimentos1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure RelaodeTtulosporFornecedor1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure MovimentoContasPagar1Click(Sender: TObject);
    procedure RelaodeTtulosBaixados1Click(Sender: TObject);
    procedure RelaodeTtulosAbertos1Click(Sender: TObject);
    procedure EmissodeCheques1Click(Sender: TObject);
    procedure LiberarBaixa1Click(Sender: TObject);
    procedure BtDeptoClick(Sender: TObject);
    procedure VoltaBaixadeTtulos1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure EmissoRecibo1Click(Sender: TObject);
    procedure PCContasPagarChange(Sender: TObject);
    procedure PgtosporDptoeFinalidade1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ResumoCtaPagarDiario1Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SB4CodFornecedorClick(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure MeCodFilialExit(Sender: TObject);
    procedure MeCodDeptoExit(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure MeCodFinalidadeExit(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure MeCodFornecedorExit(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure TtulosporFinalidade1Click(Sender: TObject);
    procedure TotalporFornecedor1Click(Sender: TObject);
    procedure TitulosAbertosSinttico1Click(Sender: TObject);
    procedure ConciliaoContasPagarContasReceber1Click(Sender: TObject);
    procedure CalculoDescontosAntecipacaoPontualidade1Click(
      Sender: TObject);
    procedure GerarContrato1Click(Sender: TObject);
    procedure Promissria1Click(Sender: TObject);
    procedure BtContaCorrenteClick(Sender: TObject);
    procedure AgendaBaixa1Click(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure tulosOutrasMoedas1Click(Sender: TObject);
    procedure EmiteReciboPBaixasemLote1Click(Sender: TObject);
    procedure EmiteChequePPagamentoAgrupado1Click(Sender: TObject);
    procedure LanarJurosManual1Click(Sender: TObject);
    procedure PrazoMdio1Click(Sender: TObject);
    procedure ExclusodeTtulosemLote1Click(Sender: TObject);
    procedure AlterarDtVencimentoProrrogado1Click(Sender: TObject);
    procedure itulosAbertoporFornecedorSintetico1Click(Sender: TObject);
    procedure AcrescentarValoraoTtulo1Click(Sender: TObject);
    procedure LanarParcelamento1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ContasporCentrodeCusto1Click(Sender: TObject);
    procedure BtCopiaClick(Sender: TObject);
    procedure DBEdit6Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
    procedure Proc_Emite_Cheque(pNrCheque, pCadastro, pBanco: Integer; pTotCheque: Real; pNome: string);
  public
    { Public declarations }
    wAlterando: Boolean;
  end;

var
  FContasPagarCad: TFContasPagarCad;
  WinWord, Docs, Doc: Variant;

implementation

uses UContasPagar_cl, UUsuario_cl, UFinalidadeCons, UFinalidade_cl,
  UBancosCons, UBancoAgencia_cl, UCadastroCons, UCadastro_cl, UFilialCons,
  UFilial_cl, UContasPagarCons, UTipoMovimentoCons, UTipoMovimento_cl,
  UOracle_cl, UContasPagarBaixa, UContasPagarParam,
  URContasPagar_Vencimento, UBiblioteca,
  URContasPagarFornecedor, URContasPagarMov, URContasPagar_TitulosBaixados,
  URContasPagar_TitulosAbertos, UEmiteCheque, ULiberarBaixa,
  UDepartamentoCons, UDepartamento_cl, UContasPagarVoltaBaixa, URRecibo,
  UCaixa_cl, UParamSistema_cl, UCaixaLanc_Cont, UPlanilha_cl,
  URPgto_Dpto_Finalidade, UContasReceberParam,
  URContaPagarTotalDia, UCustoVeiculo_CP, UCustoVeiculoMov_cl,
  URelContasPagar_cl, URContasPagar_Finalidade, URTotalPagarFornecedor,
  URTitulosAberto_Depto_Sintetico, URConcilia_Cp_Cr,
  URContasPagar_Descontos, UContasPagarRel_cl, URPromissoria_Branco,
  UContaCorrenteCons, URContasPagarAgendaBaixa,
  URTitulosAbertos_OutrasMoedas, UFmFinalidade, UContasReceber_Rel_cl,
  UContasPagarExclusaoLote, URContasPagarSintetico,
  URTituloPorFinalidadeAnalitico, ULancaParcelamento, UFmCidade,
  URCustoProducao_CentroCusto, UTParametro, uBibContasPagar, UPDFViewer;

{$R *.DFM}

procedure TFContasPagarCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMContasPagar.QContasPagar_Cab.Open;
  DMContasPagar.QContasPagar_Mov.Open;
  DMContasPagar.QContaPagarDocumento.Open;
  if DMOracle.BuscaNome('SELECT IND_ACEITE_CP FROM TB_PARAM_SISTEMA', 'IND_ACEITE_CP IS NOT NULL') = 'S' then
  begin
    DBRGAceite.Visible := True;
    LiberarBaixa1.Visible := True;
  end
  else
  begin
    DBRGAceite.Visible := False;
    LiberarBaixa1.Visible := False;
  end;
  TS2ContasPagarSer.TabVisible := False;
//  SBAlterar.Visible:=False;
{  if DMParamSistema.CodEmpresa <> 'ESPINDOLA' then
    BtCopia.Visible := False;}

  if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
    TabSheet2.TabVisible := false;
  if DMParamSistema.CodEmpresa <> 'TOMATESMI' then
    TabSheet3.TabVisible := False;

end;

procedure TFContasPagarCad.BtFinalidadeClick(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    with DMContasPagar do
      QContasPagar_CabCod_Finalidade.Value := DMFinalidade.QFinalidadeConsCod_Finalidade.Value;
end;

procedure TFContasPagarCad.BtAgenciaClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
    with DMContasPagar do
      QContasPagar_CabCod_Banco_Agencia.Value := DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value;
end;

procedure TFContasPagarCad.BtFornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    with DMContasPagar do
      QContasPagar_CabCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContasPagarCad.BtFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    with DMContasPagar do
      QContasPagar_CabCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContasPagarCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContasPagarCons = nil then
    FContasPagarCons := TFContasPagarCons.Create(Application);
  if FContasPagarCons.ShowModal = mrOk then
    with DMContasPagar do
    begin
      QContasPagar_Cab.Close;
      QContasPagar_Cab.SetVariable('PK', QContasPagar_CabConsCod_Conta_Pagar_Cab.Value);
      QContasPagar_Cab.Open;
    end;
end;

procedure TFContasPagarCad.SBConfirmarClick(Sender: TObject);
var
  wCodigo, wCodDoc, wFilial, wCodCompl, wCodHistorico: Integer;
  wVlrLancto: Real;
  wHistorico_Inclusao, wNumDoc, wTestaNulo, wContaCred, wContaDeb, wGerar, wContabiliza_Inclusao, wNome, wFluxoCaixa: string;
  wDtLancto: TDateTime;
begin
  DmUsuario.Checar_Filial_Usuario(DMContasPagar.QContasPagar_CabCOD_FILIAL.Text, 'CONTAS A PAGAR');
  if DMParamSistema.QParamSistemaDt_Fechamento_Financeiro.Value >= DMContasPagar.QContasPagar_CabDt_Emissao.Value then
    raise Exception.Create('Não é Permitido Alterar Este Título - Fechamento Contábil');
{  if DBComboBox1.Text = 'Boleto/Guia/Fatura' then //FOI COLOCADO PRA RESOLVER O PROBLEMA DE ALTERAÇÃO  24/01/08
    DBComboBox1.ItemIndex := 0;
  if DBComboBox1.ItemIndex < 0 then
    raise Exception.Create('Forma de pagamento não informada');
}  wCodHistorico := 0;

  if DMContasPagar.QContasPagar_CabCOD_CADASTRO.Text = '' then
  begin
    DBEdit5.SetFocus;
    raise Exception.Create('Informe um fornecedor.');
  end;

  if DMContasPagar.QContasPagar_Cab.State = dsInsert then
    wGerar := 'Sim'
  else
    wGerar := 'Nao';
  wCodigo := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
  inherited;
  try
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.RollBack;
    raise exception.create('Erro! Transação não efetuada');
  end;
  DMContasPagar.QContasPagar_Cab.Close;
  DMContasPagar.QContasPagar_Cab.SetVariable('PK', wCodigo);
  DMContasPagar.QContasPagar_Cab.Open;
  if (wGerar = 'Sim') then
  begin
    if (DMContasPagar.QContasPagar_CabCod_Conta_Corrente.Text = '') then
    begin
      wHistorico_Inclusao := DMOracle.BuscaNome('SELECT COD_HISTORICO_CAIXA_INCLUSAO FROM TB_FINALIDADE', 'COD_FINALIDADE  = ' + FloatToStr(DMContasPagar.QContasPagar_CabCod_Finalidade.Value), True);
      if (wHistorico_Inclusao <> '') then
      begin
        DMCaixa.QCaixa_Mov.Open;
        DMCaixa.QCaixa_Mov.Insert;
        DMCaixa.QCaixa_MovCod_Usuario.Value := DMUsuario.CodUsuarioCorrente;
        DMCaixa.QCaixa_MovDT_Usuario.Value := DMOracle.DataHoraServ;
        DMCaixa.QCaixa_MovCod_Filial.Value := DMContasPagar.QContasPagar_CabCod_Filial.Value;
        DMCaixa.QCaixa_MovCod_Departamento.Value := DMContasPagar.QContasPagar_CabCod_Departamento.Value;
        DMCaixa.QCaixa_MovCod_Historico.Value := StrToInt(wHistorico_Inclusao);
        DMcaixa.QCaixa_MovDT_Movimento.value := DMContasPagar.QContasPagar_CabDt_Emissao.Value;
        DMcaixa.QCaixa_MovVal_Movimento.value := DMContasPagar.QContasPagar_CabVal_Titulo.Value;
        DMcaixa.QCaixa_MovNum_Documento.value := DMContasPagar.QContasPagar_CabNum_Titulo.Value;
        DMcaixa.QCaixa_MovCod_Cadastro.value := DMContasPagar.QContasPagar_CabCod_Cadastro.Value;
        DMcaixa.QCaixa_MovCod_Conta_Pagar_Cab.value := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        DMCaixa.QCaixa_MovDESC_COMPLEMENTO1.Value := DMContasPagar.QContasPagar_CabDESC_OBSERVACAO.Value; //testando
        DMCaixa.QCaixa_Mov.Post;
        DMCaixa.QCaixa_Mov.Close;
      end;
    end;
    wContabiliza_Inclusao := DMOracle.BuscaNome('SELECT IND_CONTABILIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE  = ' + FloatToStr(DMContasPagar.QContasPagar_CabCod_Finalidade.Value), True);
    if wContabiliza_Inclusao = 'S' then
    begin
      wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_CRED FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMContasPagar.QContasPagar_CabCod_Finalidade.Text, True);
      if DMContasPagar.QContasPagar_CabCod_Banco_Agencia.Text <> '' then
        wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_CONTRAPARTIDA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + DMContasPagar.QContasPagar_CabCod_Banco_Agencia.Text, True)
      else
        wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_INCLUSAO_DEB FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMContasPagar.QContasPagar_CabCod_Finalidade.Text, True);
      if (wContaCred <> '') or
        (wContaDeb <> '') then
      begin
        wNome := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO =' + FloatToStr(DMContasPagar.QContasPagar_CabCod_Cadastro.Value), True);
        wCodDoc := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
        wNumDoc := FloatToStr(DMContasPagar.QContasPagar_CabNum_Titulo.Value) + '-' + Trim(wNome) + '-' + Trim(DMContasPagar.QContasPagar_CabDesc_Observacao.Value);
        wFilial := DMContasPagar.QContasPagar_CabCod_Filial.Value;
        wCodCompl := DMContasPagar.QContasPagar_CabCod_Cadastro.Value;
        wVlrLancto := DMContasPagar.QContasPagar_CabVal_Titulo.Value;
        wDtLancto := DMContasPagar.QContasPagar_CabDt_Emissao.Value; // feito com data de emissao para AB
        wTestaNulo := DMOracle.BuscaNome('SELECT COD_HIST_CONTABIL_INCLUSAO FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMContasPagar.QContasPagar_CabCod_Finalidade.Text);
        if Trim(wTestaNulo) <> '' then
          wCodHistorico := StrToInt(wTestaNulo);
        if FCaixa_Lanc_Cont = nil then
          FCaixa_Lanc_Cont := TFCaixa_Lanc_Cont.Create(Application);
        if DMParamSistema.QParamSistemaInd_Tipo_Plano_Conta.Value = 'UNICO' then
          FCaixa_Lanc_Cont.pFilial := 1
        else
          FCaixa_Lanc_Cont.pFilial := wFilial;
        FCaixa_Lanc_Cont.MeContaCredito.text := wContaCred;
        FCaixa_Lanc_Cont.MeContaDebito.text := wContaDeb;
        FCaixa_Lanc_Cont.MEContaDebitoExit(Self);
        FCaixa_Lanc_Cont.MEContaCreditoExit(Self);
        FCaixa_Lanc_Cont.Label3.Visible := False;
        FCaixa_Lanc_Cont.Label4.Visible := False;
        FCaixa_Lanc_Cont.MeFilialDebito.Visible := False;
        FCaixa_Lanc_Cont.MeFilialCredito.Visible := False;
        FCaixa_Lanc_Cont.ShowModal;
        wContaCred := Bib.LimpaString(FCaixa_Lanc_Cont.MeContaCredito.Text, '.');
        wContaDeb := Bib.LimpaString(FCaixa_Lanc_Cont.MeContaDebito.Text, '.');
        DMOracle.DBCemapa.StartTransaction;
        DMContasPagar.QContasPagar_Mov.Edit;
        DMPlanilha.GravaLanc('CP', wCodDoc, wNumDoc, wFilial, wContaCred, 'CREDITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaDeb);
        DMContasPagar.QContasPagar_MovCOD_LANCTO_CONTABIL_CRED.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
        DMPlanilha.GravaLanc('CP', wCodDoc, wNumDoc, wFilial, wContaDeb, 'DEBITO', wCodCompl, wCodHistorico, wVlrlancto, wDTLancto, wContaCred);
        DMContasPagar.QContasPagar_MovCOD_LANCTO_CONTABIL_DEB.Value := DMPlanilha.QLcto1COD_LANCTO_CONTABIL.Value;
        DMContasPagar.QContasPagar_Mov.Post;
      end;
    end;
    if DMOracle.DBCemapa.InTransaction then
      DMOracle.DBCemapa.Commit;
  end;
  //Cadastro Movimento de Custo de Veículo - PMC 31/03/2004
  if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
  begin
    if wAlterando then //alterando
    begin
      if not DMOracle.DBCemapa.InTransaction then
        DMOracle.DBCemapa.StartTransaction;
      try
        if DMOracle.BuscaNome('SELECT IND_VEICULO FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMContasPagar.QContasPagar_CabCOD_FINALIDADE.Text) = 'S' then
          DMCustoVeiculoMov.AlteraCustoVei('CONTA PAGAR', DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value, DMContasPagar.QContasPagar_CabCOD_FINALIDADE.Value) //altera finalidade
        else
          DMCustoVeiculoMov.ExcluiCustoVei('CONTA PAGAR', DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value); //exclui movimento - nova finalidade não controla custo veículo
        DMOracle.DBCemapa.Commit;
      except
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Não foi possível atualizar valores referente Mov. Custo Veículo');
      end;
    end
    else //inserindo
    begin
      if DMOracle.BuscaNome('SELECT IND_VEICULO FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMContasPagar.QContasPagar_CabCOD_FINALIDADE.Text) = 'S' then
      begin
        if FCustoVeiculo_CP = nil then
          FCustoVeiculo_CP := TFCustoVeiculo_CP.Create(Application);
        FCustoVeiculo_CP.ShowModal;
      end
    end;
  end;
  //fim Cadastro Movimento Custo Veículo
end;

procedure TFContasPagarCad.SBCancelarClick(Sender: TObject);
var
  wCodigo: Integer;
begin
  wCodigo := DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value;
  inherited;
  DMOracle.DBCemapa.Rollback;
  DMContasPagar.QContasPagar_Cab.Close;
  DMContasPagar.QContasPagar_Cab.SetVariable('PK', wCodigo);
  DMContasPagar.QContasPagar_Cab.Open;
end;

procedure TFContasPagarCad.Baixa1Click(Sender: TObject);
begin
  inherited;
  if FContaPagarBaixa = nil then
    FContaPagarBaixa := TFContaPagarBaixa.Create(Application);
  FContaPagarBaixa.ShowModal;
end;

procedure TFContasPagarCad.RelaodeContasPagarpVencimentos1Click(
  Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
     FContasPagarParam := TFcontasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[0].TabVisible := True;
  if FContasPagarParam.ShowModal = mrOk then
  begin
    if Trim(FContasPagarParam.ME0DataInicial.Text) = '' then
      raise Exception.Create('Campo Data Vencimento Inicial Deve Ser Informado');
    if Trim(FContasPagarParam.ME0DataFinal.Text) = '' then
      raise Exception.Create('Campo Data Vencimento Final Deve Ser Informado');
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.ME0CodFilial.Text, 'CONTAS A PAGAR');

    if FRContasPagar_Vencimentos = nil then
      FRContasPagar_Vencimentos := TFRContasPagar_Vencimentos.Create(Application);
    with DMContasPagar do
    begin
      QRContasPagar_Vencimentos.ClearVariables;
      QRContasPagar_Vencimentos.Close;
      QRContasPagar_Vencimentos.SetVariable('DT_VENC_INICIAL', StrToDate(FContasPagarParam.ME0DataInicial.Text));
      FRContasPagar_Vencimentos.QRLDataInicial.Caption := DateToStr(StrToDate(FContasPagarParam.ME0DataInicial.Text));
      QRContasPagar_Vencimentos.SetVariable('DT_VENC_FINAL', StrToDate(FContasPagarParam.ME0DataFinal.Text));
      FRContasPagar_Vencimentos.QRLDataFinal.Caption := DateToStr(StrToDate(FContasPagarParam.ME0DataFinal.Text));

      if Trim(FContasPagarParam.ME0CodFilial.Text) <> '' then
         QRContasPagar_Vencimentos.SetVariable('FILIAL', StrToInt(Trim(FContasPagarParam.ME0CodFilial.Text)))
      else
         QRContasPagar_Vencimentos.SetVariable('FILIAL', Null);

      if FContasPagarParam.ME0DtMovimentoInicio.Text <> '' then
         QRContasPagar_Vencimentos.SetVariable('DT_MOVIMENTO_INICIO', StrToDate(FContasPagarParam.ME0DtMovimentoInicio.Text))
      else
         QRContasPagar_Vencimentos.SetVariable('DT_MOVIMENTO_INICIO', null);

      if FContasPagarParam.ME0DtMovimentoFim.Text <> '' then
         QRContasPagar_Vencimentos.SetVariable('DT_MOVIMENTO_FIM', StrToDate(FContasPagarParam.ME0DtMovimentoFim.Text))
      else
         QRContasPagar_Vencimentos.SetVariable('DT_MOVIMENTO_FIM', null);

      If Trim(FContasPagarParam.Fm0Cadastro.MeCadastro.Text) <> ''  then
         QRContasPagar_Vencimentos.SetVariable('COD_CADASTRO',StrToInt(Trim(FContasPagarParam.Fm0Cadastro.MeCadastro.Text)))
      Else
         QRContasPagar_Vencimentos.SetVariable('COD_CADASTRO',Null);

      if Trim(FContasPagarParam.ME0Departamento.Text) = 'VÁRIOS' then
         QRContasPagar_Vencimentos.SetVariable('DEPARTAMENTOS', 'TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasPagarParam.ME0CodDepto.Text) + ')')
      else
      begin
        QRContasPagar_Vencimentos.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasPagarParam.ME0CodDepto.Text) <> '' then
          QRContasPagar_Vencimentos.SetVariable('COD_DEPARTAMENTO', Trim(FContasPagarParam.ME0CodDepto.Text));
      end;

      if Trim(FContasPagarParam.ME0Departamento.Text) <> '' then
        QRContasPagar_Vencimentos.SetVariable('DESC_TIPO_DOCUMENTO', Trim(FContasPagarParam.Me0TipoDocumento.Text))
      else
        QRContasPagar_Vencimentos.SetVariable('DESC_TIPO_DOCUMENTO', Null);
      if Trim(FContasPagarParam.ME0CodObra.Text) <> '' then
        QRContasPagar_Vencimentos.SetVariable('OBRA', StrToInt(Trim(FContasPagarParam.ME0CodObra.Text)))
      else
        QRContasPagar_Vencimentos.SetVariable('OBRA', Null);

      if Trim(FContasPagarParam.ME0CodFinalidade.Text) <> '' then
        QRContasPagar_Vencimentos.SetVariable('FINALIDADE', StrToInt(Trim(FContasPagarParam.ME0CodFinalidade.Text)))
      else
        QRContasPagar_Vencimentos.SetVariable('FINALIDADE', Null);

      QRContasPagar_Vencimentos.SetVariable('DT_BASE', StrToDate(FContasPagarParam.ME0DtBase.Text));
      DMContasPagar.pDataBase := StrToDate(FContasPagarParam.ME0DtBase.Text);
      QRContasPagar_Vencimentos.Sql[QRContasPagar_Vencimentos.Sql.Count - 1] := '';
      if FContasPagarParam.Rg0Ordem.ItemIndex = 0 then
        QRContasPagar_Vencimentos.Sql.Add(' Order By DT_VENCIMENTO,COD_CADASTRO')
      else
        QRContasPagar_Vencimentos.Sql.Add(' Order By DT_VENCIMENTO,NOME');
      QRContasPagar_Vencimentos.Open;
    end;
//    if Trim(FContasPagarParam.ME0CodDepto.Text) = '' then
//      FRContasPagar_Vencimentos.QRLDepartamento.Caption := 'Dt.Base:' + FContasPagarParam.ME0DtBase.Text + '  Dep: Todos'
//    else
//      FRContasPagar_Vencimentos.QRLDepartamento.Caption := 'Dt.Base:' + FContasPagarParam.ME0DtBase.Text + ' Dep: ' + FContasPagarParam.ME0Departamento.Text;
    FRContasPagar_Vencimentos.QRLDepartamento.Caption := 'Dt.Base: ' + FContasPagarParam.ME0DtBase.Text + ' Dep: ' + FContasPagarParam.ME0Departamento.Text;
    FRContasPagar_Vencimentos.QRLEmpresa.Caption := 'Filial: ' + FContasPagarParam.ME0Filial.Text;
    If FContasPagarParam.Cb0DadosBancarios.Checked Then
       FRContasPagar_Vencimentos.QrBand4.Height := 36
    Else
       FRContasPagar_Vencimentos.QrBand4.Height := 17;
    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagar_Vencimentos.QRPrimario.Preview
    else
      FRContasPagar_Vencimentos.QRPrimario.Print;
    DMContasPagar.QRContasPagar_Vencimentos.Close;
  end;
end;

procedure TFContasPagarCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [Dsinsert, DsEdit] then
  begin
    Opcoes.enabled := false;
    BtAgencia.Enabled := True;
    BtFornecedor.Enabled := True;
    BtFilial.Enabled := True;
    BtFinalidade.Enabled := True;
    BtDepto.Enabled := True;
    BtContaCorrente.Enabled := True;
  end
  else
  begin
    Opcoes.enabled := True;
    BtAgencia.Enabled := False;
    BtFornecedor.Enabled := False;
    BtFilial.Enabled := False;
    BtFinalidade.Enabled := False;
    BtDepto.Enabled := False;
    BtContaCorrente.Enabled := False;
  end;
  {if (DSPrimario.State = dsInsert) then
  begin
   DBEValorTitulo.ReadOnly := False;
   DBEValorIndexado.ReadOnly := False;
  end
  else
  begin

    DBEValorTitulo.ReadOnly := True;
    DBEValorIndexado.ReadOnly := True;
  end;}
  if (DSPrimario.State = dsInsert) or
        ( (DSPrimario.State = dsEdit) and ((DMParamSistema.CodEmpresa = 'QUERENCIA') or  (DMParamSistema.CodEmpresa = 'SCALA')) ) then
  begin
    DBEValorTitulo.ReadOnly := False;
    DBEValorIndexado.ReadOnly := False;
  end
  else
  begin
    DBEValorTitulo.ReadOnly := True;
    DBEValorIndexado.ReadOnly := True;
  end;
end;

procedure TFContasPagarCad.RelaodeTtulosporFornecedor1Click(
  Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[1].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.ME1CodFilial.Text, 'CONTAS A PAGAR');
    with DMContasPagar do
    begin
      QRContasPagar_Cab.Close;
      QRContasPagar_Mov.Close;
      QRContasPagar_Produtos.Close;
      QRContasPagar_Cab.Sql.Clear;
      QRContasPagar_Cab.Sql.Add('SELECT ');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.COD_CONTA_PAGAR_CAB,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.COD_FINALIDADE,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.COD_BANCO_AGENCIA,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.COD_FILIAL,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.NUM_TITULO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.NUM_PARCELA,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DESC_TIPO_DOCUMENTO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DT_MOVIMENTO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DT_BAIXA,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DT_VENCIMENTO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DT_EMISSAO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DT_CAPITALIZACAO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.VAL_TITULO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.COD_NOTA_CAB,');
//      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DESC_OBSERVACAO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.IND_ACEITE,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.IND_SITUACAO,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.VAL_ORIGINAL,');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.COD_CADASTRO,');
      QRContasPagar_Cab.Sql.Add('  C1.NOME,');
      //----------------
      QRContasPagar_Cab.Sql.Add('  TB_NOTA_CAB.COD_CADASTRO AS CADASTRO_CLIENTE,');
      QRContasPagar_Cab.Sql.Add('  C2.NOME AS NOME_CLIENTE,');
      //------------------
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB.DT_VENCIMENTO_PRORROGADO, ');
      QRContasPagar_Cab.Sql.Add('  TB_NOTA_CAB.OBS || TB_CONTA_PAGAR_CAB.DESC_OBSERVACAO AS DESC_OBSERVACAO ');
//      QRContasPagar_Cab.Sql.Add('  TB_ROMANEIO_AGRICOLA.DESC_OBSERVACAO AS OBS_ROMANEIO ');
      QRContasPagar_Cab.Sql.Add('FROM ');
      QRContasPagar_Cab.Sql.Add('  TB_CONTA_PAGAR_CAB,');
      QRContasPagar_Cab.Sql.Add('  TB_CADASTRO C1, ');
      QRContasPagar_Cab.SQL.Add('  TB_CADASTRO C2, ');
      QRContasPagar_Cab.SQL.Add('  TB_NOTA_CAB ');
//      QRContasPagar_Cab.Sql.Add('  TB_ROMANEIO_AGRICOLA ');

      if Trim(FContasPagarParam.Me1OrdemCompra.Text) <> '' then
      begin
        QRContasPagar_Cab.SQL.Add('  WHERE TB_NOTA_CAB.COD_NOTA_CAB = TB_CONTA_PAGAR_CAB.COD_NOTA_CAB ');
        QRContasPagar_Cab.SQL.Add('    AND TB_NOTA_CAB.COD_ORDEM_COMPRA_CAB = ' + Trim(FContasPagarParam.Me1OrdemCompra.Text));
        QRContasPagar_Cab.SQL.Add('    AND TB_CONTA_PAGAR_CAB.COD_CADASTRO = C1.COD_CADASTRO ');
        QRContasPagar_Cab.SQL.Add('   AND TB_NOTA_CAB.COD_CADASTRO = C2.COD_CADASTRO(+)');
      end
      else
      begin
        QRContasPagar_Cab.SQL.Add('WHERE TB_CONTA_PAGAR_CAB.COD_CADASTRO = C1.COD_CADASTRO ');
        QRContasPagar_Cab.SQL.Add('   AND TB_NOTA_CAB.COD_NOTA_CAB(+) = TB_CONTA_PAGAR_CAB.COD_NOTA_CAB');
        QRContasPagar_Cab.SQL.Add('   AND TB_NOTA_CAB.COD_CADASTRO = C2.COD_CADASTRO(+)');
      end;

//    QRContasPagar_Cab.Sql.Add('WHERE TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO) ');
      if Trim(FContasPagarParam.ME1CodFilial.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = ' + Trim(FContasPagarParam.ME1CodFilial.Text));
      if Trim(FContasPagarParam.ME1Codigo.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_CADASTRO = ' + Trim(FContasPagarParam.ME1Codigo.Text));
      if FContasPagarParam.RGSituacao.ItemIndex <> 2 then
        if FContasPagarParam.RGSituacao.ItemIndex = 0 then // os que estão em aberto
          QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.IND_SITUACAO <> ' + chr(39) + 'BAIXA TOTAL' + chr(39)) // na SQL é os <> de Baixa Total
        else // os que estão baixados
          QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.IND_SITUACAO <> ' + chr(39) + 'ABERTO' + chr(39)); // na SQL é os = a Baixa Total Ou Baixa Parcial
      if Trim(FContasPagarParam.ME1CGCCPF.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND C1.NUM_CGC_CPF = ' + chr(39) + Trim(FContasPagarParam.ME1CGCCPF.Text) + chr(39));
      if Trim(FContasPagarParam.ME1CodDepto.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO = ' + Trim(FContasPagarParam.ME1CodDepto.Text));
      if Trim(FContasPagarParam.ME1Finalidade.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = ' + Trim(FContasPagarParam.ME1Finalidade.Text));
      if Trim(FContasPagarParam.ME1DtEmissaoI.text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_EMISSAO >= ' + chr(39) + Trim(FContasPagarParam.ME1DtEmissaoI.text) + chr(39));
      if Trim(FContasPagarParam.ME1DtEmissaoF.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_EMISSAO <= ' + chr(39) + Trim(FContasPagarParam.ME1DtEmissaoF.Text) + chr(39));
      if Trim(FContasPagarParam.ME1Inicial.text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO >= ' + chr(39) + Trim(FContasPagarParam.ME1Inicial.text) + chr(39));
      if Trim(FContasPagarParam.ME1Final.Text) <> '' then
        QRContasPagar_Cab.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO <= ' + chr(39) + Trim(FContasPagarParam.ME1Final.Text) + chr(39));

      case FContasPagarParam.RG1Ordem.ItemIndex of
        0: QRContasPagar_Cab.Sql.Add(' ORDER BY TB_CONTA_PAGAR_CAB.COD_CADASTRO,TB_CONTA_PAGAR_CAB.DT_VENCIMENTO');
        1: QRContasPagar_Cab.Sql.Add(' ORDER BY TB_CONTA_PAGAR_CAB.COD_CADASTRO,TB_CONTA_PAGAR_CAB.DT_EMISSAO');
        2: QRContasPagar_Cab.Sql.Add(' ORDER BY TB_CONTA_PAGAR_CAB.COD_CADASTRO,TB_CONTA_PAGAR_CAB.NUM_TITULO');
      end;
      QRContasPagar_Cab.Open;
      QRContasPagar_Mov.Open;
      QRContasPagar_Produtos.Open;
    end;
    if FRContasPagar_Fornecedor = nil then
      FRContasPagar_Fornecedor := TFRContasPagar_Fornecedor.Create(Application);
    FRContasPagar_Fornecedor.QRLPeriodo.Caption := 'Filial:' + Trim(FContasPagarParam.ME1Filial.Text) + ' PERIODO DE : ' + DataInicial + ' ATÉ : ' + DataFinal;
    if Trim(FContasPagarParam.ME1CodDepto.Text) = '' then
      FRContasPagar_Fornecedor.QRLPeriodo.Caption := FRContasPagar_Fornecedor.QRLPeriodo.Caption + ' Dep: Todos'
    else
      FRContasPagar_Fornecedor.QRLPeriodo.Caption := FRContasPagar_Fornecedor.QRLPeriodo.Caption + ' Dep: ' + FContasPagarParam.ME1Departamento.Text;
    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagar_Fornecedor.QRPrimario.Preview
    else
      FRContasPagar_Fornecedor.QRPrimario.Print;
    DMContasPagar.QRContasPagar_Cab.Close;
    DMContasPagar.QRContasPagar_Mov.Close;
    DMContasPagar.QRContasPagar_Produtos.Close;
  end;
end;

procedure TFContasPagarCad.SBExcluirClick(Sender: TObject);
begin
  if DMContasPagar.QContasPagar_CabInd_Situacao.Value <> 'ABERTO' then
    raise Exception.Create('Não é Possível Excluir um Titulo Com Baixas');
  if not (DMContasPagar.QContasPagar_CabCod_Nota_Cab.IsNull) then // Não Permite Excluir um Título  Gerado pela Nota
    raise Exception.Create('Não é Possível Excluir um registro gerado por uma Nota')
  else
  begin
    if DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value > 0 then
    begin
      if MessageDlg('A Exclusão deste Registro irá desfazer todos os movimentos contábeis, ' + #13 + 'Assim como os Movimentos do contas à Pagar. Confirma?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        DMOracle.DBCemapa.StartTransaction; // Termina a transação no AfterDelete
        try
          DMContasPagar.ExcluiMovimentos(DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value);
                //exclui cadastro de movimento de custo de veículo - PMC 31/03/2004
          if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'AB' then
            if DMOracle.BuscaNome('SELECT IND_VEICULO FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + DMContasPagar.QContasPagar_CabCOD_FINALIDADE.Text) = 'S' then
              DMCustoVeiculoMov.ExcluiCustoVei('CONTA PAGAR', DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value);
                //fim exclusão de movimento de custo de veídulo
          DMContasPagar.QContasPagar_Cab.Delete;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.RollBack;
          raise exception.create('Erro! Transação não efetuada');
        end;
      end;
    end;
  end;
end;

procedure TFContasPagarCad.MovimentoContasPagar1Click(Sender: TObject);
var
  DataInicial, DataFinal, wTipoMovimento, wFormaPagamento: string;
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[2].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    if Trim(FContasPagarParam.ME2Inicial.text) = '' then
      raise Exception.Create('Campo Data Inicial Deve Ser Informado');
    if Trim(FContasPagarParam.ME2Final.Text) = '' then
      raise Exception.Create('Campo Data Final Deve Ser Informado');
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.ME2CodFilial.Text, 'CONTAS A PAGAR');

    with DMContasPagar do
    begin
      QRCPagar_Mov.Close;
      if Trim(FContasPagarParam.ME2CodFornecedor.Text) <> '' then
        QRCPagar_Mov.SetVariable('COD_CADASTRO', StrToFloat(Trim(FContasPagarParam.ME2CodFornecedor.Text)))
      else
        QRCPagar_Mov.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasPagarParam.ME2CodFilial.Text) <> '' then
        QRCPagar_Mov.SetVariable('COD_FILIAL', StrToInt(Trim(FContasPagarParam.ME2CodFilial.Text)))
      else
        QRCPagar_Mov.SetVariable('COD_FILIAL', Null);

      {if Trim(FContasPagarParam.ME2CodDepto.Text) <> '' then
        QRCPagar_Mov.SetVariable('COD_DEPARTAMENTO', StrToInt(Trim(FContasPagarParam.ME2CodDepto.Text)))
      else
        QRCPagar_Mov.SetVariable('COD_DEPARTAMENTO', Null);}

     if Trim(FContasPagarParam.ME2Departamento.Text) = 'VÁRIOS' then
     begin
        QRCPagar_Mov.SetVariable('COD_DEPARTAMENTO',null);
        QRCPagar_Mov.SetVariable('DEPARTAMENTOS', 'TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasPagarParam.ME2CodDepto.Text) + ')')
     end
     else
      begin
        QRCPagar_Mov.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasPagarParam.ME2CodDepto.Text) <> '' then
          QRCPagar_Mov.SetVariable('COD_DEPARTAMENTO', Trim(FContasPagarParam.ME2CodDepto.Text));
      end;
   
      if Trim(FContasPagarParam.Me2TipoDocumento.Text) <> '' then
        QRCPagar_Mov.SetVariable('DESC_TIPO_DOCUMENTO', Trim(FContasPagarParam.Me2TipoDocumento.Text))
      else
        QRCPagar_Mov.SetVariable('DESC_TIPO_DOCUMENTO', Null);

      if Trim(FContasPagarParam.Fm2Finalidade.MeFinalidade.Text) <> '' then
        QRCPagar_Mov.SetVariable('COD_FINALIDADE', StrToInt(Trim(FContasPagarParam.Fm2Finalidade.MeFinalidade.Text)))
      else
        QRCPagar_Mov.SetVariable('COD_FINALIDADE', Null);

      QRCPagar_Mov.SetVariable('INICIAL', StrToDate(FContasPagarParam.ME2Inicial.Text));
      DataInicial := DateToStr(StrToDate(FContasPagarParam.ME2Inicial.Text));

      QRCPagar_Mov.SetVariable('FINAL', StrToDate(FContasPagarParam.ME2Final.Text));
      DataFinal := DateToStr(StrToDate(FContasPagarParam.ME2Final.Text));

// vai concatenar todos os tipos de movimento que o usuario escolher nos parametros - César 14/11/2016  - Alex 09/04/2021
 //alterado o tipo de variavél para que seja possível selecionar mais de uma forma de pagamento. - Alex 09/04/2021
      wFormaPagamento := '';
      if FContasPagarParam.CB2Caixa.Checked then
        wFormaPagamento := QuotedStr('Caixa');
      if FContasPagarParam.CB2Bancos.Checked then
        if wFormaPagamento = '' then
           wFormaPagamento := QuotedStr('Banco')
        else
           wFormaPagamento := wFormaPagamento + ',' + QuotedStr('Banco');
      if FContasPagarParam.CB2Contabil.Checked then
        if wFormaPagamento = '' then
           wFormaPagamento := QuotedStr('Contabil')
        else
           wFormaPagamento := wFormaPagamento + ',' + QuotedStr('Contabil');
      if FContasPagarParam.CB2Todos.Checked then
        wFormaPagamento := '';
      if wFormaPagamento = '' then
         QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', '1=1')
      else
         QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'TB_CONTA_PAGAR_MOV.IND_FORMA_PAGAMENTO IN('+wFormaPagamento + ')');



      case FContasPagarParam.RGIndTipoMov.ItemIndex of
        0: QRCPagar_Mov.SetVariable('TIPO_MOV', 'PRINCIPAL');
        1: QRCPagar_Mov.SetVariable('TIPO_MOV', 'PGTO. PRINCIPAL');
        2: QRCPagar_Mov.SetVariable('TIPO_MOV', 'DESCONTO');
        3: QRCPagar_Mov.SetVariable('TIPO_MOV', 'PGTO. JUROS');
        4: QRCPagar_Mov.SetVariable('TIPO_MOV', Null);
      end;
 //alterado o tipo de variavél para que seja possível selecionar mais de uma forma de pagamento.
      {case FContasPagarParam.RG2FormaPagamento.ItemIndex of
        0: QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Banco');
        2: QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', 'Contabil');
        3: QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;}
      case FContasPagarParam.RG2Opcao.ItemIndex of
        0: QRCPagar_Mov.SetVariable('IND_DEVOLUCAO', 'NAO');
        1: QRCPagar_Mov.SetVariable('IND_DEVOLUCAO', 'SIM');
        2: QRCPagar_Mov.SetVariable('IND_DEVOLUCAO', Null);
      end;
      QRCPagar_MovTot.Close;
      if Trim(FContasPagarParam.ME2CodFornecedor.Text) <> '' then
        QRCPagar_MovTot.SetVariable('COD_CADASTRO', StrToInt(Trim(FContasPagarParam.ME2CodFornecedor.Text)))
      else
        QRCPagar_MovTot.SetVariable('COD_CADASTRO', Null);

      if Trim(FContasPagarParam.ME2CodFilial.Text) <> '' then
        QRCPagar_MovTot.SetVariable('COD_FILIAL', StrToInt(Trim(FContasPagarParam.ME2CodFilial.Text)))
      else
        QRCPagar_MovTot.SetVariable('COD_FILIAL', Null);

      {if Trim(FContasPagarParam.ME2CodDepto.Text) <> '' then
        QRCPagar_MovTot.SetVariable('COD_DEPARTAMENTO', StrToInt(Trim(FContasPagarParam.ME2CodDepto.Text)))
      else
        QRCPagar_MovTot.SetVariable('COD_DEPARTAMENTO', Null);}

      if Trim(FContasPagarParam.ME2Departamento.Text) = 'VÁRIOS' then
        QRCPagar_Mov.SetVariable('DEPARTAMENTOS', 'TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasPagarParam.ME2CodDepto.Text) + ')')
      else
      begin
        QRCPagar_Mov.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasPagarParam.ME2CodDepto.Text) <> '' then
          QRCPagar_Mov.SetVariable('COD_DEPARTAMENTO', Trim(FContasPagarParam.ME2CodDepto.Text));
      end;


      if Trim(FContasPagarParam.Fm2Finalidade.MeFinalidade.Text) <> '' then
        QRCPagar_MovTot.SetVariable('COD_FINALIDADE', StrToInt(Trim(FContasPagarParam.Fm2Finalidade.MeFinalidade.Text)))
      else
        QRCPagar_MovTot.SetVariable('COD_FINALIDADE', Null);

      QRCPagar_MovTot.SetVariable('INICIAL', StrToDate(FContasPagarParam.ME2Inicial.Text));
      DataInicial := DateToStr(StrToDate(FContasPagarParam.ME2Inicial.Text));

      QRCPagar_MovTot.SetVariable('FINAL', StrToDate(FContasPagarParam.ME2Final.Text));
      DataFinal := DateToStr(StrToDate(FContasPagarParam.ME2Final.Text));

      if wFormaPagamento = '' then
         QRCPagar_Mov.SetVariable('IND_FORMA_PAGAMENTO', '1=1')
      else
         QRCPagar_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'TB_CONTA_PAGAR_MOV.IND_FORMA_PAGAMENTO IN('+wFormaPagamento + ')');


      case FContasPagarParam.RGIndTipoMov.ItemIndex of
        0: QRCPagar_MovTot.SetVariable('TIPO_MOV', 'PRINCIPAL');
        1: QRCPagar_MovTot.SetVariable('TIPO_MOV', 'PGTO. PRINCIPAL');
        2: QRCPagar_MovTot.SetVariable('TIPO_MOV', 'DESCONTO');
        3: QRCPagar_MovTot.SetVariable('TIPO_MOV', 'PGTO. JUROS');
        4: QRCPagar_MovTot.SetVariable('TIPO_MOV', Null);
      end;
 //alterado o tipo de variavél para que seja possível selecionar mais de uma forma de pagamento.
      {case FContasPagarParam.RG2FormaPagamento.ItemIndex of
        0: QRCPagar_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Caixa');
        1: QRCPagar_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Banco');
        2: QRCPagar_MovTot.SetVariable('IND_FORMA_PAGAMENTO', 'Contabil');
        3: QRCPagar_MovTot.SetVariable('IND_FORMA_PAGAMENTO', Null);
      end;}
      case FContasPagarParam.RG2Opcao.ItemIndex of
        0: QRCPagar_MovTot.SetVariable('IND_DEVOLUCAO', 'NAO');
        1: QRCPagar_MovTot.SetVariable('IND_DEVOLUCAO', 'SIM');
        2: QRCPagar_MovTot.SetVariable('IND_DEVOLUCAO', Null);
      end;
      QRCPagar_MovTot.Open;
      QRCPagar_Mov.Open;
    end;
    if FRContasPagarMov = nil then
      FRContasPagarMov := TFRContasPagarMov.Create(Application);
    FRContasPagarMov.QRPeriodo.Caption := 'PERIODO DE: ' + DataInicial + ' ATÉ : ' + DataFinal;
    if Trim(FContasPagarParam.ME2CodDepto.Text) = '' then
      FRContasPagarMov.QRPeriodo.Caption := FRContasPagarMov.QRPeriodo.Caption + ' Dep: Todos'
    else
      FRContasPagarMov.QRPeriodo.Caption := FRContasPagarMov.QRPeriodo.Caption + ' Dep: ' + FContasPagarParam.ME2Departamento.Text;
    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagarMov.QRPrimario.Preview
    else
      FRContasPagarMov.QRPrimario.Print;

    DMContasPagar.QRCPagar_MovTot.Close;
    DMContasPagar.QRCPagar_Mov.Close;
  end;
end;

procedure TFContasPagarCad.RelaodeTtulosBaixados1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[3].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.Fm3Filial.MeFilial.Text, 'CONTAS A PAGAR');
    if FRContasPagar_TitulosBaixados = nil then
      FRContasPagar_TitulosBaixados := TFRContasPagar_TitulosBaixados.Create(Application);
    with DMContasPagar do
    begin
      QRContasPagar_TitulosBaixados.Close;

      if (Trim(FContasPagarParam.ME3Inicial.text) = '') or (Trim(FContasPagarParam.ME3Final.Text) = '') then
        raise Exception.Create('É necessário informar um período')
      else
      begin
        QRContasPagar_TitulosBaixados.SetVariable('DT_INICIAL', Trim(FContasPagarParam.ME3Inicial.Text));
        DataInicial := FContasPagarParam.ME3Inicial.Text;
        QRContasPagar_TitulosBaixados.SetVariable('DT_FINAL', Trim(FContasPagarParam.ME3Final.Text));
        DataFinal := FContasPagarParam.ME3Final.Text;
      end;

      if Trim(FContasPagarParam.Fm3Cadastro.MeCadastro.Text) <> '' then
      begin
        QRContasPagar_TitulosBaixados.SetVariable('COD_CADASTRO1', StrToInt(Trim(FContasPagarParam.Fm3Cadastro.MeCadastro.Text)));
        QRContasPagar_TitulosBaixados.SetVariable('COD_CADASTRO2', StrToFloat(Trim(FContasPagarParam.Fm3Cadastro.MeCadastro.Text)));
      end
      else
      begin
        QRContasPagar_TitulosBaixados.SetVariable('COD_CADASTRO1', 1);
        QRContasPagar_TitulosBaixados.SetVariable('COD_CADASTRO2', 999999);
      end;

      if Trim(FContasPagarParam.Fm3Filial.MeFilial.Text) <> '' then
        QRContasPagar_TitulosBaixados.SetVariable('COD_FILIAL', StrToFloat(Trim(FContasPagarParam.Fm3Filial.MeFilial.Text)))
      else
        QRContasPagar_TitulosBaixados.SetVariable('COD_FILIAL', Null);

      if Trim(FContasPagarParam.Fm3Finalidade.MeFinalidade.Text) <> '' then
        QRContasPagar_TitulosBaixados.SetVariable('COD_FINALIDADE',
          StrToFloat(Trim(FContasPagarParam.Fm3Finalidade.MeFinalidade.Text)))
      else
        QRContasPagar_TitulosBaixados.SetVariable('COD_FINALIDADE', Null);

      if Trim(FContasPagarParam.Fm3Obra.MeObra.Text) <> '' then
        QRContasPagar_TitulosBaixados.SetVariable('COD_OBRA', StrToInt(Trim(FContasPagarParam.Fm3Obra.MeObra.Text)))
      else
        QRContasPagar_TitulosBaixados.SetVariable('COD_OBRA', Null);

      if Trim(FContasPagarParam.ME3Departamento.Text) = 'VÁRIOS' then
      begin
        QRContasPagar_TitulosBaixados.SetVariable('COD_DEPARTAMENTO',Null);
        QRContasPagar_TitulosBaixados.SetVariable('DEPARTAMENTOS', 'TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasPagarParam.ME3CodDepto.Text) + ')')
      end
      else
      begin
        QRContasPagar_TitulosBaixados.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasPagarParam.ME3CodDepto.Text) <> '' then
          QRContasPagar_TitulosBaixados.SetVariable('COD_DEPARTAMENTO', Trim(FContasPagarParam.ME3CodDepto.Text));
      end;
      //***
      QRContasPagar_TitulosBaixados.SQL[QRContasPagar_TitulosBaixados.SQL.Count - 1] := '';
      if FContasPagarParam.RG3Ordem.ItemIndex = 0 then
      begin
        FRContasPagar_TitulosBaixados.QRLDescricao_Group.Caption := 'Cliente:';
        FRContasPagar_TitulosBaixados.QRDBQuebra.Datafield:= 'NOME';
        FRContasPagar_TitulosBaixados.QRDBQuebra.Left := 106;
        QRContasPagar_TitulosBaixados.SQL.Add('TB_CADASTRO.NOME, TB_CONTA_PAGAR_CAB.DT_BAIXA');
      end
      else
      begin
        FRContasPagar_TitulosBaixados.QRLDescricao_Group.Caption := 'Data Da Baixa:';
        FRContasPagar_TitulosBaixados.QRDBQuebra.Datafield := 'DT_BAIXA';
        FRContasPagar_TitulosBaixados.QRDBQuebra.Left := 162;
        QRContasPagar_TitulosBaixados.SQL.Add('TB_CONTA_PAGAR_CAB.DT_BAIXA, TB_CADASTRO.NOME');
      end;
      if FContasPagarParam.Rg3Tipo.ItemIndex = 0 then
        FRContasPagar_TitulosBaixados.QRBand3.Enabled := True
      else
        FRContasPagar_TitulosBaixados.QRBand3.Enabled := False;

      {if FContasPagarParam.RG3Ordem.ItemIndex = 0 then
        QRContasPagar_TitulosBaixados.SQL[QRContasPagar_TitulosBaixados.SQL.Count - 1] := 'TB_CADASTRO.NOME'
      else
        QRContasPagar_TitulosBaixados.SQL[QRContasPagar_TitulosBaixados.SQL.Count - 1] := 'TB_CONTA_PAGAR_CAB.DT_BAIXA,TB_CADASTRO.NOME';
       }

      QRContasPagar_TitulosBaixados.Open;
    end;

    FRContasPagar_TitulosBaixados.QRLPeriodo.Caption := 'PERIODO DE : ' + DataInicial + ' ATÉ : ' + DataFinal;
    if Trim(FContasPagarParam.ME3CodDepto.Text) = '' then
      FRContasPagar_TitulosBaixados.QRLPeriodo.Caption := FRContasPagar_TitulosBaixados.QRLPeriodo.Caption + ' Dep: Todos'
    else
      FRContasPagar_TitulosBaixados.QRLPeriodo.Caption := FRContasPagar_TitulosBaixados.QRLPeriodo.Caption + ' Dep: ' + FContasPagarParam.ME3Departamento.Text;

    if Trim(FContasPagarParam.Fm3Finalidade.MeFinalidade.Text) = '' then
      FRContasPagar_TitulosBaixados.QRLFinalidade.Caption := 'Finalidade: Todas'
    else
      FRContasPagar_TitulosBaixados.QRLFinalidade.Caption := 'Finalidade: '+
        FContasPagarParam.Fm3Finalidade.EdFinalidade.Text;

    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagar_TitulosBaixados.QRPrimario.Preview
    else
      FRContasPagar_TitulosBaixados.QRPrimario.Print;
    DMContasPagar.QRContasPagar_TitulosBaixados.Close;
  end;
end;

procedure TFContasPagarCad.RelaodeTtulosAbertos1Click(Sender: TObject);
var
  DataInicial, DataFinal: string;
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[4].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.ME4CodFilial.Text, 'CONTAS A PAGAR');

    DMContasPagar.QRContasPagar_TitulosAberto.Close;

    if trim(FContasPagarParam.ME4CodFilial.text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FILIAL', StrToInt(trim(FContasPagarParam.ME4CodFilial.text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FILIAL', null);

    if trim(FContasPagarParam.ME4CodDepto.text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_DEPARTAMENTO', 'TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO IN (' +
        Trim(FContasPagarParam.ME4CodDepto.Text) + ' )')
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_DEPARTAMENTO', '1=1');

    if trim(FContasPagarParam.ME4CodFornecedor.text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_CADASTRO', StrToInt(trim(FContasPagarParam.ME4CodFornecedor.text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_CADASTRO', null);

    if trim(FContasPagarParam.Me4Finalidade.text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE', 'TB_CONTA_PAGAR_CAB.COD_FINALIDADE IN (' + Trim(FContasPagarParam.Me4Finalidade.text) + ')')
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE', '1=1');

    if trim(FContasPagarParam.Me4OrdemCompra.text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_ORDEM_COMPRA_CAB', StrToInt(trim(FContasPagarParam.Me4OrdemCompra.text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_ORDEM_COMPRA_CAB', null);

    if trim(FContasPagarParam.ME4CodNumTitulo.text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('NUM_TITULO', StrToInt(trim(FContasPagarParam.ME4CodNumTitulo.text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('NUM_TITULO', null);

    if trim(FContasPagarParam.FmCidade4.MeCidade.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_CIDADE', trim(FContasPagarParam.FmCidade4.MeCidade.Text))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_CIDADE',null);

    DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_BASE', StrToDate(trim(FContasPagarParam.Me4DtBase.Text)));

    if FContasPagarParam.CBDTEmissao.Checked then
    begin
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_EMISSAO_INICIAL', StrToDate(trim(FContasPagarParam.ME4Inicial.Text)));
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_EMISSAO_FINAL', StrToDate(trim(FContasPagarParam.ME4Final.Text)));
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_INICIAL', NULL);
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_FINAL', NULL);
    end
    else
    begin
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_INICIAL', StrToDate(trim(FContasPagarParam.ME4Inicial.Text)));
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_FINAL', StrToDate(trim(FContasPagarParam.ME4Final.Text)));
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_EMISSAO_INICIAL', NULL);
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DT_EMISSAO_FINAL', NULL);
    end;

    if Trim(FContasPagarParam.Me4TipoDocumento.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DESC_TIPO_DOCUMENTO', Trim(FContasPagarParam.Me4TipoDocumento.text))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('DESC_TIPO_DOCUMENTO', Null);
    if Trim(FContasPagarParam.ME4ContaNao1.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_1', StrToInt(Trim(FContasPagarParam.ME4ContaNao1.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_1', null);

    if Trim(FContasPagarParam.ME4ContaNao2.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_2', StrToInt(Trim(FContasPagarParam.ME4ContaNao2.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_2', null);

    if Trim(FContasPagarParam.ME4ContaNao3.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_3', StrToInt(Trim(FContasPagarParam.ME4ContaNao3.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_3', null);

    if Trim(FContasPagarParam.ME4ContaNao4.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_4', StrToInt(Trim(FContasPagarParam.ME4ContaNao4.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_4', null);

    if Trim(FContasPagarParam.ME4ContaNao5.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_5', StrToInt(Trim(FContasPagarParam.ME4ContaNao5.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_5', null);

    if Trim(FContasPagarParam.ME4ContaNao6.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_6', StrToInt(Trim(FContasPagarParam.ME4ContaNao6.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_6', null);

    if Trim(FContasPagarParam.ME4ContaNao7.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_7', StrToInt(Trim(FContasPagarParam.ME4ContaNao7.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_7', null);

    if Trim(FContasPagarParam.ME4ContaNao8.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_8', StrToInt(Trim(FContasPagarParam.ME4ContaNao8.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_8', null);

    if Trim(FContasPagarParam.ME4ContaNao9.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_9', StrToInt(Trim(FContasPagarParam.ME4ContaNao9.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_9', null);

    if Trim(FContasPagarParam.ME4ContaNao10.Text) <> '' then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_10', StrToInt(Trim(FContasPagarParam.ME4ContaNao10.Text)))
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('COD_FINALIDADE_NAO_10', null);

    if FContasPagarParam.Rg4Notas.ItemIndex = 0 then
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('POR_NOTA', 'SIM')
    else
      DMContasPagar.QRContasPagar_TitulosAberto.SetVariable('POR_NOTA', NULL);

    DMContasPagar.QRContasPagar_TitulosAberto.SQL[DMContasPagar.QRContasPagar_TitulosAberto.SQL.Count - 1] := '';
    case FContasPagarParam.RG4Ordem.ItemIndex of
      0: DMContasPagar.QRContasPagar_TitulosAberto.SQL.Add(' ORDER BY COD_FILIAL,COD_DEPARTAMENTO,COD_CADASTRO,DT_VENCIMENTO');
      1: DMContasPagar.QRContasPagar_TitulosAberto.SQL.Add(' ORDER BY COD_FILIAL,COD_DEPARTAMENTO,NOME,COD_CADASTRO,DT_VENCIMENTO');
      2: DMContasPagar.QRContasPagar_TitulosAberto.SQL.Add(' ORDER BY COD_FILIAL,COD_DEPARTAMENTO,NOME,COD_CADASTRO,NUM_TITULO');
      3: DMContasPagar.QRContasPagar_TitulosAberto.SQL.Add(' ORDER BY COD_FILIAL,COD_DEPARTAMENTO,DT_VENCIMENTO, COD_CADASTRO,NUM_TITULO');
    end;
    DMContasPagar.QRContasPagar_TitulosAberto.open;

    if FRContasPagar_TitulosAberto = nil then
      FRContasPagar_TitulosAberto := TFRContasPagar_TitulosAberto.Create(Application);

    FRContasPagar_TitulosAberto.QRLPeriodo.Caption := 'DT.BASE:' + FContasPagarParam.ME4DtBase.Text + '  PERIODO DE : ' + Trim(FContasPagarParam.ME4Inicial.text) + ' ATÉ : ' + Trim(FContasPagarParam.ME4Final.Text);
    FRContasPagar_TitulosAberto.QRLFinalidade.Caption := 'Finalidade:' + FContasPagarParam.Me4Finalidade.Text;
    FRContasPagar_TitulosAberto.qrlcidade4.Caption := 'Cidade: ' + FContasPagarParam.FmCidade4.EdCidade.Text;

    if Trim(FContasPagarParam.Me4OrdemCompra.Text) <> '' then
      FRContasPagar_TitulosAberto.QRLFinalidade.Caption := FRContasPagar_TitulosAberto.QRLFinalidade.Caption + ' - Ordem Compra:' + Trim(FContasPagarParam.ED4OrdemCompra.Text);

    if Trim(FContasPagarParam.ME4CodDepto.Text) = '' then
      FRContasPagar_TitulosAberto.QRLPeriodo.Caption := FRContasPagar_TitulosAberto.QRLPeriodo.Caption + ' Dep: Todos';
    //else
      //FRContasPagar_TitulosAberto.QRLPeriodo.Caption := FRContasPagar_TitulosAberto.QRLPeriodo.Caption + ' Dep: ' + FContasPagarParam.ME4Departamento.Text;

    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagar_TitulosAberto.QRPrimario.Preview
    else
      FRContasPagar_TitulosAberto.QRPrimario.Print;
    DMContasPagar.QRContasPagar_TitulosAberto.Close;
  end;
end;

procedure TFContasPagarCad.EmissodeCheques1Click(Sender: TObject);
begin
  inherited;
  if FEmiteCheque = nil then
    FEmiteCheque := TFEmiteCheque.Create(Application);
  if FEmiteCheque.ShowModal = mrOK then
  begin
    DMBancoAgencia.QAtualizaNrCheque.Close;
    DMBancoAgencia.QAtualizaNrCheque.SQL.Clear;
    DMBancoAgencia.QAtualizaNrCheque.Sql.Add('UPDATE TB_CONTA_CORRENTE SET NUM_CHEQUE = ' + FloatToStr(StrToFloat(FEmiteCheque.MENrCheque.Text) + 1)
      + ' WHERE (COD_BANCO_AGENCIA = ' + FEmiteCheque.MECodBanco.Text + ' ) AND ( COD_CONTA_CORRENTE = ' + FEmiteCheque.MEContaCorrente.Text + ')');
    DMBancoAgencia.QAtualizaNrCheque.ExecSQL;
  end;
end;

procedure TFContasPagarCad.LiberarBaixa1Click(Sender: TObject);
begin
  inherited;
  if FLiberaBaixa = nil then
    FLiberaBaixa := TFLiberaBaixa.Create(Application);
  FLiberaBaixa.ShowModal;
end;

procedure TFContasPagarCad.BtDeptoClick(Sender: TObject);
var
  wSituacaoDpto: string;
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
  with DMContasPagar do
  begin
    wSituacaoDpto := DMOracle.FastSelect('IND_SITUACAO','TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + DMDepartamento.QDepartamentoConsCod_Departamento.Text);
    if wSituacaoDpto = 'A' then
      QContasPagar_CabCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value
    else
      raise exception.Create('ATENÇÃO - Este departamento não esta ativo. Favor Verificar!');
  end;
end;

procedure TFContasPagarCad.VoltaBaixadeTtulos1Click(Sender: TObject);
begin
  inherited;
  if FContaPagarVoltaBaixa = nil then
    FContaPagarVoltaBaixa := TFContaPagarVoltaBaixa.Create(Application);
  if DMContasPagar.QContasPagar_CabCod_Cadastro.Text <> '' then
  begin
    FContaPagarVoltaBaixa.MECodFornecedor.Text := DMContasPagar.QContasPagar_CabCod_Cadastro.Text;
    FContaPagarVoltaBaixa.MeNumero.Text := DMContasPagar.QContasPagar_CabNum_Titulo.Text;
  end;
  FContaPagarVoltaBaixa.ShowModal;
end;

procedure TFContasPagarCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(7);
end;

procedure TFContasPagarCad.EmissoRecibo1Click(Sender: TObject);
var wFornecedor, wFinalidade, wCnpj: string;
  wValorTitulo : double;
begin
  inherited;
  if DMParamSistema.CodEmpresa <> 'RETIFOZ' then
  begin

    if FRRecibo = nil then
      FRRecibo := TFRRecibo.Create(Application);
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', DMContasPagar.QContasPagar_CabCod_Filial.Value);
    DMFilial.QFilial.Open;
    wFinalidade := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE =' + FloatToStr(DMContasPagar.QContasPagar_CabCod_Finalidade.Value));
    wFornecedor := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO =' + FloatToStr(DMContasPagar.QContasPagar_CabCod_Cadastro.Value));
    wCnpj := DMOracle.BuscaNome('SELECT NUM_CGC_CPF FROM TB_CADASTRO','COD_CADASTRO =' + FloatToStr(DMContasPagar.QContasPagar_CabCod_Cadastro.Value));
{Adicionado para imprimir o valor original no recibo quando a situação do titulo for Aberta. Solicitado Elaine - Pollyana Mangueira. Alex 09/09/2026}    
    if (DMContasPagar.QContasPagar_CabIND_SITUACAO.Value <> 'ABERTO') then
      wValorTitulo := (DMContasPagar.QContasPagar_CabVal_Original.Value - DMContasPagar.QContasPagar_CabVal_Titulo.Value)   //Andre 05/11/2024 para calcular o valor do pagamento
    else
      wValorTitulo := DMContasPagar.QContasPagar_CabVal_Original.Value;

    FRRecibo.QRLRecebido.Caption := DmFilial.QFilialDESC_FILIAL.Text; //Trim(wFornecedor) + ' - ' + DMContasPagar.QContasPagar_CabCod_Cadastro.Text;
    FRRecibo.QRLDataEmissao.Caption := DMContasPagar.QContasPagar_CabDt_Emissao.Text;
    FRRecibo.QRLValor.Caption := FormatFloat('#,##0.00', wValorTitulo);
    FRRecibo.QRLValor_Juros.Caption := '0,00';
    FRRecibo.QRLDesconto.Caption := '0,00';
    FRRecibo.QRLValor_Baixa.Caption := '0,00';
    FRRecibo.QRLSaldo.Caption := DMContasPagar.QContasPagar_CabVal_Titulo.Text;
    FRRecibo.QRLValorExtenso.Caption := Bib.Extenso(wValorTitulo, 'REAL');
    FRRecibo.QRLDescricao.Caption := wFinalidade + ' - ' + DMContasPagar.QContasPagar_CabDesc_Observacao.Text;
    FRRecibo.QRLData.Caption := FormatDateTime(', dd "de" mmmm "de" yyyy', DMContasPagar.QContasPagar_CabDt_Emissao.Value);
    //FRRecibo.QRLResponsavel.Caption := DMFilial.QFilialDesc_Filial.Value;
    {Estava aparecendo a descrição da filial em vez do nome do fornecedor. Solicitação: Monike(Industria Uniforme)
      Junior - 16/01/2012. Se estiver errado comentar a linha de baixo e descomentar a linha de cima.}

    FRRecibo.QRLabel34.Caption := wCnpj;
    FRRecibo.QRLResponsavel.Caption := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO='+FloatToStr(DMContasPagar.QContasPagar_CabCOD_CADASTRO.Value));
    FRRecibo.QRDBTitulo.DataSet := DMContasPagar.QContasPagar_Cab;
    FRRecibo.QRDBTitulo.DataField := 'NUM_TITULO';
    FRRecibo.QRDBParcela.DataSet := DMContasPagar.QContasPagar_Cab;
    FRRecibo.QRDBParcela.DataField := 'NUM_PARCELA';
    FRRecibo.QRDBVenc.DataSet := DMContasPagar.QContasPagar_Cab;
    FRRecibo.QRDBVenc.DataField := 'DT_VENCIMENTO';
    FRRecibo.QRDBCod_Conta.DataSet := DMContasPagar.QContasPagar_Cab;
    FRRecibo.QRDBCod_Conta.DataField := 'COD_CONTA_PAGAR_CAB';
    FRRecibo.QuickRep1.Preview;

  end
  else
  begin
    with DMContasPagar do
    begin
      if (QContasPagar_CabCod_Conta_Pagar_Cab.Value > 0)
         and (QContasPagar_CabDESC_TIPO_DOCUMENTO.value = 'REP') then
        BibContasPagar.ImprimeCompromissoRetifoz(QContasPagar_CabNUM_TITULO.AsInteger, QContasPagar_CabDT_EMISSAO.Value)
      else
        Raise Exception.Create('Verifique se há um título reparcelado aberto!');
    end;
  end;

end;

procedure TFContasPagarCad.PCContasPagarChange(Sender: TObject);
begin
  inherited;
  DMContasPagar.QContasPagar_Mov.Close;
  DMContasPagar.QContasPagar_Mov.Open;
end;

procedure TFContasPagarCad.PgtosporDptoeFinalidade1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[5].TabVisible := True;
  if FContasPagarParam.ShowModal = mrOk then
  begin
    //if (Trim(FContasPagarParam.ME5DataI.Text) = '') or (Trim(FContasPagarParam.ME5DataF.Text) = '') then
    //  raise exception.Create('Periodo deve ser informado!');
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.ME5CodFilial.Text, 'CONTAS A PAGAR');
    with DMContasPagar do
    begin
      QRPgto_Dpto_Finalidade.Close;
      if Trim(FContasPagarParam.ME5CodFilial.Text) = '' then
        QRPgto_Dpto_Finalidade.SetVariable('COD_FILIAL', Null)
      else
        QRPgto_Dpto_Finalidade.SetVariable('COD_FILIAL', FContasPagarParam.ME5CodFilial.Text);
      if Trim(FContasPagarParam.ME5CodDepto.Text) = '' then
        QRPgto_Dpto_Finalidade.SetVariable('COD_DEPARTAMENTO', Null)
      else
        QRPgto_Dpto_Finalidade.SetVariable('COD_DEPARTAMENTO', FContasPagarParam.ME5CodDepto.Text);
      if FContasPagarParam.Rg5FormaPagto.ItemIndex = 3 then
        QRPgto_Dpto_Finalidade.SetVariable('IND_FORMA_PAGTO', Null)
      else
        QRPgto_Dpto_Finalidade.SetVariable('IND_FORMA_PAGTO', FContasPagarParam.Rg5FormaPagto.Items[FContasPagarParam.Rg5FormaPagto.ItemIndex]);
      if Trim(FContasPagarParam.ME5Finalidade.Text) = '' then
        QRPgto_Dpto_Finalidade.SetVariable('COD_FINALIDADE', Null)
      else
        QRPgto_Dpto_Finalidade.SetVariable('COD_FINALIDADE', FContasPagarParam.ME5Finalidade.Text);
      if Trim(FContasPagarParam.Fm5Cadastro.MeCadastro.Text) = '' then
        QRPgto_Dpto_Finalidade.SetVariable('COD_CADASTRO', Null)
      else
        QRPgto_Dpto_Finalidade.SetVariable('COD_CADASTRO', FContasPagarParam.Fm5Cadastro.MeCadastro.Text);
      if FContasPagarParam.Rg5TipoMovimento.ItemIndex <> 3 then
        QRPgto_Dpto_Finalidade.SetVariable('IND_TIPO_MOVIMENTO', ' TB_CONTA_PAGAR_MOV.IND_TIPO_MOVIMENTO = ' + QUOTEDSTR(FContasPagarParam.Rg5TipoMovimento.Items[FContasPagarParam.Rg5TipoMovimento.ItemIndex]))
      else
        QRPgto_Dpto_Finalidade.SetVariable('IND_TIPO_MOVIMENTO', ' TB_CONTA_PAGAR_MOV.IND_TIPO_MOVIMENTO <> ' + QUOTEDSTR('PRINCIPAL'));
      QRPgto_Dpto_Finalidade.SetVariable('DT_EMISSAO_I', FContasPagarParam.ME5DataI.Text);
      QRPgto_Dpto_Finalidade.SetVariable('DT_EMISSAO_F', FContasPagarParam.ME5DataF.Text);

      //--Parametro do relatório por dt_emissao. Vanessa 19/10/2013
      QRPgto_Dpto_Finalidade.SetVariable('DT_INICIAL', FContasPagarParam.ME5DataIEmissao.Text);
      QRPgto_Dpto_Finalidade.SetVariable('DT_FINAL', FContasPagarParam.ME5DataFEmissao.Text);
      //--

      QRPgto_Dpto_Finalidade.Open;
      if FRPagto_Dpto_Finalidade = nil then
        FRPagto_Dpto_Finalidade := TFRPagto_Dpto_Finalidade.Create(Application);
      FRPagto_Dpto_Finalidade.QRLTitulo.Caption :=
        FRPagto_Dpto_Finalidade.QRLTitulo.Caption +
        ' Periodo: ' + FContasPagarParam.ME5DataI.Text + ' A ' + FContasPagarParam.ME5DataF.Text;
      if DMParamSistema.CodEmpresa = 'HOSPITAL' then
      begin //Solicitado por Diego. Junior 10/08/2018 
        FRPagto_Dpto_Finalidade.QRLabel12.Enabled := False; //Situacao
        FRPagto_Dpto_Finalidade.QRLabel21.Enabled := False; //Situacao
        FRPagto_Dpto_Finalidade.QRDBText9.Enabled := False; //Situacao
        FRPagto_Dpto_Finalidade.QRLabel5.Enabled  := False; //Num. Tit
        FRPagto_Dpto_Finalidade.QRLabel18.Enabled := False; //Num. Tit
        FRPagto_Dpto_Finalidade.QRDBText3.Enabled := False; //Num. Tit
        FRPagto_Dpto_Finalidade.QRLabel3.Enabled  := False; //Departamento   //Junior - 15/02/2019
        FRPagto_Dpto_Finalidade.QRDBText1.Enabled := False; //Departamento
        FRPagto_Dpto_Finalidade.QRDBText8.Enabled := False; //Departamento
      end;
      if FContasPagarParam.RGPreview.ItemIndex = 0 then
        FRPagto_Dpto_Finalidade.QRPrimario.Preview
      else
        FRPagto_Dpto_Finalidade.QRPrimario.Print;

      QRPgto_Dpto_Finalidade.CloseAll;
    end;
  end;
end;

procedure TFContasPagarCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMContasPagar.QContasPagar_Cab.Close;
  DMContasPagar.QContasPagar_Mov.Close;
  DMContasPagar.QContaPagarDocumento.Close;
  Action := CaFree;
  FContasPagarCad := nil;
end;

procedure TFContasPagarCad.ResumoCtaPagarDiario1Click(Sender: TObject);
begin
  inherited;
  if FContasReceberParam = nil then
    FContasReceberParam := TFContasReceberParam.Create(Application);
  FContasReceberParam.PGRelatorio.Pages[18].TabVisible := True;
  if FContasReceberParam.ShowModal = mrOk then
  begin
    if (Trim(FContasReceberParam.MEEmissaoI18.Text) = '') or
      (Trim(FContasReceberParam.MEEmissaoF18.Text) = '') then
      raise exception.Create('Periodo deve ser informado!');
    DmUsuario.Checar_Filial_Usuario(FContasReceberParam.MECodFilial18.Text, 'CONTAS A PAGAR');

    with DMContasPagar do
    begin
      QRContaPagarTotalDia.Close;

      if Trim(FContasReceberParam.MECodFilial18.Text) <> '' then
        QRContaPagarTotalDia.SetVariable('COD_FILIAL', FContasReceberParam.MECodFilial18.Text)
      else
        QRContaPagarTotalDia.SetVariable('COD_FILIAL', Null);

      QRContaPagarTotalDia.SetVariable('DT_VENCIMENTO_I', FContasReceberParam.MEEmissaoI18.Text);
      QRContaPagarTotalDia.SetVariable('DT_VENCIMENTO_F', FContasReceberParam.MEEmissaoF18.Text);

      QRContaPagarTotalDia.Open;

      if FRContaPagarTotalDia = nil then
        FRContaPagarTotalDia := TFRContaPagarTotalDia.Create(Application);
      if FContasReceberParam.RGPreview.ItemIndex = 0 then
        FRContaPagarTotalDia.QRPrimario.Preview
      else
        FRContaPagarTotalDia.QRPrimario.Print;
      QRContaPagarTotalDia.Close;
    end;
  end;
end;

procedure TFContasPagarCad.SpeedButton8Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    MECodFilial.Text := FloatToStr(DMFilial.QFilialConsCod_Filial.Value);

end;

procedure TFContasPagarCad.SB4CodFornecedorClick(Sender: TObject);
begin
  inherited;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal = mrOk then
    MeCodFornecedor.Text := FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
end;

procedure TFContasPagarCad.SpeedButton14Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = mrOk then
    MeCodDepto.Text := FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);

end;

procedure TFContasPagarCad.MeCodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodFilial.Text) <> '' then
    MeFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL', 'COD_FILIAL = ' + MeCodFilial.Text);
end;

procedure TFContasPagarCad.MeCodDeptoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodDepto.Text) <> '' then
    MeDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_Departamento FROM TB_Departamento', 'COD_Departamento = ' + MeCodDepto.Text);

end;

procedure TFContasPagarCad.SpeedButton15Click(Sender: TObject);
begin
  inherited;
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
    MeCodFinalidade.Text := FloatToStr(DMFinalidade.QFinalidadeConsCod_Finalidade.Value);

end;

procedure TFContasPagarCad.MeCodFinalidadeExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodFinalidade.Text) <> '' then
    EdFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + MeCodFinalidade.Text);

end;

procedure TFContasPagarCad.BtOkClick(Sender: TObject);
begin
  inherited;
  if FCustoVeiculo_CP = nil then
    FCustoVeiculo_CP := TFCustoVeiculo_CP.Create(Application);
  with DMContasPagar do
  begin
    QContasPagar_Cab.Insert;
    QContasPagar_CabNum_Titulo.Value := StrToInt(Trim(MeTitulo.Text));
    QContasPagar_CabNum_Parcela.Value := StrToInt(Trim(MeParcela.Text));
    QContasPagar_CabCod_Finalidade.Value := StrToInt(Trim(MeCodFinalidade.Text));
    QContasPagar_CabCod_Departamento.Value := StrToInt(Trim(MeCodDepto.Text));
    QContasPagar_CabDesc_Tipo_Documento.Value := Trim(MeDocumento.Text);
    QContasPagar_CabCod_Cadastro.Value := StrToInt(Trim(MeCodFornecedor.Text));
    QContasPagar_CabCod_Filial.Value := StrToInt(Trim(MeCodFilial.Text));
    QContasPagar_CabDt_Emissao.Value := StrToDate(Trim(MeEmissao.Text));
    QContasPagar_CabDt_Vencimento.Value := StrToDate(Trim(MeVencto.Text));
    QContasPagar_CabVal_Titulo.Value := StrToFloat(Trim(MeValor.Text));
    //CUSTO VEÍCULO - ADICIONADO EM 18/05/2003 POR PMC
    FCustoVeiculo_CP.wValServico := 0.0;
    if Trim(MeValorIR.Text) <> '' then
      FCustoVeiculo_CP.wValServico := FCustoVeiculo_CP.wValServico + StrToFloat(Trim(MeValorIR.Text));
    if Trim(MeValorPIS.Text) <> '' then
      FCustoVeiculo_CP.wValServico := FCustoVeiculo_CP.wValServico + StrToFloat(Trim(MeValorPIS.Text));
    if Trim(MeValorCOFINS.Text) <> '' then
      FCustoVeiculo_CP.wValServico := FCustoVeiculo_CP.wValServico + StrToFloat(Trim(MeValorCOFINS.Text));
    if Trim(MeValorINSS.Text) <> '' then
      FCustoVeiculo_CP.wValServico := FCustoVeiculo_CP.wValServico + StrToFloat(Trim(MeValorINSS.Text));
    if Trim(MeValorCSLL.Text) <> '' then
      FCustoVeiculo_CP.wValServico := FCustoVeiculo_CP.wValServico + StrToFloat(Trim(MeValorCSLL.Text));
    //FIM CUSTO VEÍCULO
    SBConfirmarClick(Self);
    if (Trim(MeVctoIR.Text) <> '') and
      (Trim(MeValorIR.Text) <> '') then
    begin
      QContasPagar_Cab.Insert;
      QContasPagar_CabNum_Titulo.Value := StrToInt(Trim(MeTitulo.Text));
      QContasPagar_CabNum_Parcela.Value := 2;
      QContasPagar_CabCod_Finalidade.Value := 241;
      QContasPagar_CabCod_Departamento.Value := StrToInt(Trim(MeCodDepto.Text));
      QContasPagar_CabDesc_Tipo_Documento.Value := Trim(MeDocumento.Text);
      QContasPagar_CabCod_Cadastro.Value := StrToInt(Trim(MeCodFornecedor.Text));
      QContasPagar_CabCod_Filial.Value := StrToInt(Trim(MeCodFilial.Text));
      QContasPagar_CabDt_Emissao.Value := StrToDate(Trim(MeEmissao.Text));
      QContasPagar_CabDt_Vencimento.Value := StrToDate(Trim(MeVctoIR.Text));
      QContasPagar_CabVal_Titulo.Value := StrToFloat(Trim(MeValorIR.Text));
      SBConfirmarClick(Self);
    end;
    if (Trim(MeVctoPIS.Text) <> '') and
      (Trim(MeValorPIS.Text) <> '') then
    begin
      QContasPagar_Cab.Insert;
      QContasPagar_CabNum_Titulo.Value := StrToInt(Trim(MeTitulo.Text));
      QContasPagar_CabNum_Parcela.Value := 3;
      QContasPagar_CabCod_Finalidade.Value := 244;
      QContasPagar_CabCod_Departamento.Value := StrToInt(Trim(MeCodDepto.Text));
      QContasPagar_CabDesc_Tipo_Documento.Value := Trim(MeDocumento.Text);
      QContasPagar_CabCod_Cadastro.Value := StrToInt(Trim(MeCodFornecedor.Text));
      QContasPagar_CabCod_Filial.Value := StrToInt(Trim(MeCodFilial.Text));
      QContasPagar_CabDt_Emissao.Value := StrToDate(Trim(MeEmissao.Text));
      QContasPagar_CabDt_Vencimento.Value := StrToDate(Trim(MeVctoPIS.Text));
      QContasPagar_CabVal_Titulo.Value := StrToFloat(Trim(MeValorPIS.Text));
      SBConfirmarClick(Self);
    end;
    if (Trim(MeVctoCOFINS.Text) <> '') and
      (Trim(MeValorCOFINS.Text) <> '') then
    begin
      QContasPagar_Cab.Insert;
      QContasPagar_CabNum_Titulo.Value := StrToInt(Trim(MeTitulo.Text));
      QContasPagar_CabNum_Parcela.Value := 4;
      QContasPagar_CabCod_Finalidade.Value := 243;
      QContasPagar_CabCod_Departamento.Value := StrToInt(Trim(MeCodDepto.Text));
      QContasPagar_CabDesc_Tipo_Documento.Value := Trim(MeDocumento.Text);
      QContasPagar_CabCod_Cadastro.Value := StrToInt(Trim(MeCodFornecedor.Text));
      QContasPagar_CabCod_Filial.Value := StrToInt(Trim(MeCodFilial.Text));
      QContasPagar_CabDt_Emissao.Value := StrToDate(Trim(MeEmissao.Text));
      QContasPagar_CabDt_Vencimento.Value := StrToDate(Trim(MeVctoCOFINS.Text));
      QContasPagar_CabVal_Titulo.Value := StrToFloat(Trim(MeValorCOFINS.Text));
      SBConfirmarClick(Self);
    end;
    if (Trim(MeVctoINSS.Text) <> '') and
      (Trim(MeValorINSS.Text) <> '') then
    begin
      QContasPagar_Cab.Insert;
      QContasPagar_CabNum_Titulo.Value := StrToInt(Trim(MeTitulo.Text));
      QContasPagar_CabNum_Parcela.Value := 5;
      QContasPagar_CabCod_Finalidade.Value := 242;
      QContasPagar_CabCod_Departamento.Value := StrToInt(Trim(MeCodDepto.Text));
      QContasPagar_CabDesc_Tipo_Documento.Value := Trim(MeDocumento.Text);
      QContasPagar_CabCod_Cadastro.Value := StrToInt(Trim(MeCodFornecedor.Text));
      QContasPagar_CabCod_Filial.Value := StrToInt(Trim(MeCodFilial.Text));
      QContasPagar_CabDt_Emissao.Value := StrToDate(Trim(MeEmissao.Text));
      QContasPagar_CabDt_Vencimento.Value := StrToDate(Trim(MeVctoINSS.Text));
      QContasPagar_CabVal_Titulo.Value := StrToFloat(Trim(MeValorINSS.Text));
      SBConfirmarClick(Self);
    end;
    if (Trim(MeVctoCSLL.Text) <> '') and
      (Trim(MeValorCSLL.Text) <> '') then
    begin
      QContasPagar_Cab.Insert;
      QContasPagar_CabNum_Titulo.Value := StrToInt(Trim(MeTitulo.Text));
      QContasPagar_CabNum_Parcela.Value := 6;
      QContasPagar_CabCod_Finalidade.Value := 245;
      QContasPagar_CabCod_Departamento.Value := StrToInt(Trim(MeCodDepto.Text));
      QContasPagar_CabDesc_Tipo_Documento.Value := Trim(MeDocumento.Text);
      QContasPagar_CabCod_Cadastro.Value := StrToInt(Trim(MeCodFornecedor.Text));
      QContasPagar_CabCod_Filial.Value := StrToInt(Trim(MeCodFilial.Text));
      QContasPagar_CabDt_Emissao.Value := StrToDate(Trim(MeEmissao.Text));
      QContasPagar_CabDt_Vencimento.Value := StrToDate(Trim(MeVctoCSLL.Text));
      QContasPagar_CabVal_Titulo.Value := StrToFloat(Trim(MeValorCSLL.Text));
      SBConfirmarClick(Self);
    end;
  end;
end;

procedure TFContasPagarCad.MeCodFornecedorExit(Sender: TObject);
begin
  inherited;
  if Trim(MeCodFornecedor.Text) <> '' then
    MEFornecedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO = ' + MeCodFornecedor.Text);
end;

procedure TFContasPagarCad.SBAlterarClick(Sender: TObject);
begin
  if (DMParamSistema.CodEmpresa <> 'MOINHO')   and (DMParamSistema.CodEmpresa <> 'DEBONA')    and // Grasiela que solicitou dia 10/12/2007
     (DMParamSistema.CodEmpresa <> 'RADIO')    and (DMParamSistema.CodEmpresa <> 'SRTERRA')   and
     (DMParamSistema.CodEmpresa <> 'BRASIL')   and (DMParamSistema.CodEmpresa <> 'WERNER')    and
     (DMParamSistema.CodEmpresa <> 'SERVITEC') and (DMParamSistema.CodEmpresa <> 'CEIFAGRIL') and
     (DMParamSistema.CodEmpresa <> 'TOMATESMI')and (DMParamSistema.CodEmpresa <> 'SCALA') Then
  begin
    if DMContasPagar.QContasPagar_CabInd_Situacao.Value <> 'ABERTO' Then
       Raise Exception.Create('Não é Possível Alterar um Titulo Com Baixas');
    if not (DMContasPagar.QContasPagar_CabCod_Nota_Cab.IsNull) then // Não Permite Alterar um Título  Gerado pela Nota
       Raise Exception.Create('Não é Possível Alterar um registro gerado por uma Nota');
  end;
  inherited;
end;

procedure TFContasPagarCad.TtulosporFinalidade1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.ME6DataBase.Text := DateToStr(Date);
  FContasPagarParam.PGRelatorio.Pages[6].TabVisible := True;
  if FContasPagarParam.ShowModal = mrOk then
  begin
    //if (Trim(FContasPagarParam.ME6DtInicial.Text) = '') or (Trim(FContasPagarParam.ME6DtFinal.Text) = '') //or
    //   (Trim(FContasPagarParam.Me6DataInicialLanca.Text) = '') or (Trim(FContasPagarParam.Me6DataFinalLanca.Text) = '')
    //   then
    //  raise Exception.Create('Informar o Período');

    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.ME6Filial.Text), 'CONTAS A PAGAR');

    //sintético
     if FContasPagarParam.RG6Tipo.ItemIndex = 0 then
    Begin
      with DMContasPagar do
      begin
        QRContasPagar_Finalidade.Close;

        if Trim(FContasPagarParam.ME6Filial.Text) <> '' then
          QRContasPagar_Finalidade.SetVariable('FILIAL', Trim(FContasPagarParam.ME6Filial.Text))
        else
          QRContasPagar_Finalidade.SetVariable('FILIAL', null);

        if Trim(FContasPagarParam.Ed6Finalidade.Text) = 'VÁRIOS' then
          QRContasPagar_Finalidade.SetVariable('FINALIDADES', 'CPC.COD_FINALIDADE IN (' + Trim(FContasPagarParam.Me6Finalidade.Text) + ')')
        else
        begin
          QRContasPagar_Finalidade.SetVariable('FINALIDADES', '1=1');
          if Trim(FContasPagarParam.Me6Finalidade.Text) <> '' then
            QRContasPagar_Finalidade.SetVariable('FINALIDADE', Trim(FContasPagarParam.Me6Finalidade.Text))
          else
            QRContasPagar_Finalidade.SetVariable('FINALIDADE', null);

        end;

        QRContasPagar_Finalidade.SetVariable('DT_INICIAL', Trim(FContasPagarParam.ME6DtInicial.Text));
        QRContasPagar_Finalidade.SetVariable('DT_FINAL', Trim(FContasPagarParam.ME6DtFinal.Text));

        //--Relatorio de Titulos por finalidade além de dt_vencimento, também por dt_emissao. Vanessa 18/10/2013
        QRContasPagar_Finalidade.SetVariable('DT_EMISSAO_I', Trim(FContasPagarParam.Me6DataInicialLanca.Text));
        QRContasPagar_Finalidade.SetVariable('DT_EMISSAO_F', Trim(FContasPagarParam.Me6DataFinalLanca.Text));
        //--
        case FContasPagarParam.RG6IndSituacao.ItemIndex of   //SERVITEC PRECISA DO FILTRO DE BAIXA TOTAL - Junior 13/03/2023 - SUPORTE 6842
          0: QRContasPagar_Finalidade.SetVariable('IND_SITUACAO', 'CPC.IND_SITUACAO IN (' + QuotedStr('ABERTO') +',' + QuotedStr('BAIXA PARCIAL') + ')');
          1: QRContasPagar_Finalidade.SetVariable('IND_SITUACAO', 'CPC.IND_SITUACAO = ' + QuotedStr('BAIXA TOTAL'));
          2: QRContasPagar_Finalidade.SetVariable('IND_SITUACAO', '1=1');
        end;

        DMContasPagar.pDataBase := StrToDate(FContasPagarParam.ME6DataBase.Text);
        QRContasPagar_Finalidade.Open;

        if FRContasPagar_Finalidade = nil then
          FRContasPagar_Finalidade := TFRContasPagar_Finalidade.Create(Application);
        FRContasPagar_Finalidade.QRLbFilial.Caption := 'Filial: ' +
          Trim(FContasPagarParam.ME6Filial.Text) + ' '+ 
          Trim(FContasPagarParam.Ed6Filial.Text);
        FRContasPagar_Finalidade.QRLbPeriodo.Caption := 'Período de ' +
          FContasPagarParam.Me6DtInicial.Text + ' Até ' +
          FContasPagarParam.Me6DtFinal.Text + ' Data base: ' +
          FContasPagarParam.Me6DataBase.Text;
        if FContasPagarParam.RGPreview.ItemIndex = 0 then
          FRContasPagar_Finalidade.QRPrimario.Preview
        else
          FRContasPagar_Finalidade.QRPrimario.Print;
        QRContasPagar_Finalidade.Close;
      end;
    end
    else

    //Analitico
    if FContasPagarParam.RG6Tipo.ItemIndex = 1 then
    Begin
     with DMContasPagar do
      begin
        QRContasPagar_FinalidadeAnalitico.Close;

        if Trim(FContasPagarParam.ME6Filial.Text) <> '' then
          QRContasPagar_FinalidadeAnalitico.SetVariable('FILIAL',Trim(FContasPagarParam.ME6Filial.Text))
        else
          QRContasPagar_FinalidadeAnalitico.SetVariable('FILIAL', null);

        if Trim(FContasPagarParam.Ed6Finalidade.Text) = 'VÁRIOS' then
          QRContasPagar_FinalidadeAnalitico.SetVariable('FINALIDADES', 'CPC.COD_FINALIDADE IN (' + Trim(FContasPagarParam.Me6Finalidade.Text) + ')')
        else
        begin
          QRContasPagar_FinalidadeAnalitico.SetVariable('FINALIDADES', '1=1');
          if Trim(FContasPagarParam.Me6Finalidade.Text) <> '' then
            QRContasPagar_FinalidadeAnalitico.SetVariable('FINALIDADE', Trim(FContasPagarParam.Me6Finalidade.Text))
          else
            QRContasPagar_FinalidadeAnalitico.SetVariable('FINALIDADE', null)
        end;

        QRContasPagar_FinalidadeAnalitico.SetVariable('DT_INICIAL', Trim(FContasPagarParam.ME6DtInicial.Text));
        QRContasPagar_FinalidadeAnalitico.SetVariable('DT_FINAL', Trim(FContasPagarParam.ME6DtFinal.Text));

        //--Relatorio de Titulos por finalidade além de dt_vencimento, também por dt_emissao. Vanessa 18/10/2013
        QRContasPagar_FinalidadeAnalitico.SetVariable('DT_EMISSAO_I', Trim(FContasPagarParam.Me6DataInicialLanca.Text));
        QRContasPagar_FinalidadeAnalitico.SetVariable('DT_EMISSAO_F', Trim(FContasPagarParam.Me6DataFinalLanca.Text));
        //--
        case FContasPagarParam.RG6IndSituacao.ItemIndex of   //SERVITEC PRECISA DO FILTRO DE BAIXA TOTAL - Junior 13/03/2023 - SUPORTE 6842
          0: QRContasPagar_FinalidadeAnalitico.SetVariable('IND_SITUACAO', 'CPC.IND_SITUACAO IN (' + QuotedStr('ABERTO') +',' + QuotedStr('BAIXA PARCIAL') + ')');
          1: QRContasPagar_FinalidadeAnalitico.SetVariable('IND_SITUACAO', 'CPC.IND_SITUACAO = '+ QuotedStr('BAIXA TOTAL'));
          2: QRContasPagar_FinalidadeAnalitico.SetVariable('IND_SITUACAO', '1=1');
        end;

        QRContasPagar_FinalidadeAnalitico.Open;

        if FRTitulosFinalidadeAnalitico = nil then
          FRTitulosFinalidadeAnalitico :=
            TFRTitulosFinalidadeAnalitico.Create(Application);
        FRTitulosFinalidadeAnalitico.QRLFilial.Caption := 'Filial: ' + Trim(FContasPagarParam.Me6Filial.Text) + ' ' +
          Trim(FContasPagarParam.Ed6Filial.Text);
        FRTitulosFinalidadeAnalitico.QRLPeriodo.Caption := 'Período de ' +
          FContasPagarParam.ME6DtInicial.Text + ' Até ' + FContasPagarParam.ME6DtFinal.Text;
        if FContasPagarParam.RGPreview.ItemIndex = 0 then
          FRTitulosFinalidadeAnalitico.QRPrimario.Preview
        else
          FRTitulosFinalidadeAnalitico.QRPrimario.Print;
        QRContasPagar_FinalidadeAnalitico.Close;
      end;
    end;
end;
end;



    //with DMRelContasPagar do
//    begin
//      QRContasPagar_Finalidade.Close;
//
//      if Trim(FContasPagarParam.ME6Filial.Text) <> '' then
//        QRContasPagar_Finalidade.SetVariable('FILIAL', Trim(FContasPagarParam.ME6Filial.Text))
//      else
//        QRContasPagar_Finalidade.SetVariable('FILIAL', null);
//
//      {if Trim(FContasPagarParam.Me6Finalidade.Text) <> '' then
//        QRContasPagar_Finalidade.SetVariable('FINALIDADE', Trim(FContasPagarParam.Me6Finalidade.Text))
//      else
//        QRContasPagar_Finalidade.SetVariable('FINALIDADE', null);}
//
//      if Trim(FContasPagarParam.Ed6Finalidade.Text) = 'VÁRIOS' then
//      begin
//        QRContasPagar_Finalidade.SetVariable('FINALIDADE',null);
//        QRContasPagar_Finalidade.SetVariable('FINALIDADES', 'CPC.COD_FINALIDADE IN (' + Trim(FContasPagarParam.ME6Finalidade.Text) + ')')
//      end
//      else
//      begin
//        QRContasPagar_Finalidade.SetVariable('FINALIDADES', '1=1');
//        if Trim(FContasPagarParam.Ed6Finalidade.Text) <> '' then
//          QRContasPagar_Finalidade.SetVariable('FINALIDADE', Trim(FContasPagarParam.ME6Finalidade.Text))
//        else
//          QRContasPagar_Finalidade.SetVariable('FINALIDADE',null);
//      end;
//
//      QRContasPagar_Finalidade.SetVariable('DT_INICIAL', Trim(FContasPagarParam.ME6DtInicial.Text));
//      QRContasPagar_Finalidade.SetVariable('DT_FINAL', Trim(FContasPagarParam.ME6DtFinal.Text));
//
//      DMRelContasPagar.pDataBase := StrToDate(FContasPagarParam.ME6DataBase.Text);
//      QRContasPagar_Finalidade.Open;
//
//      if FRContasPagar_Finalidade = nil then
//        FRContasPagar_Finalidade := TFRContasPagar_Finalidade.Create(Application);
//      FRContasPagar_Finalidade.QRLFilial.Caption := 'Filial: ' + Trim(FContasPagarParam.Me6Filial.Text) +
//        Trim(FContasPagarParam.Ed6Filial.Text);
//      FRContasPagar_Finalidade.QRLPeriodo.Caption := 'Período de ' + FContasPagarParam.Me6DtInicial.Text + ' Até ' +
//        FContasPagarParam.Me6DtFinal.Text + ' Data base: ' +
//        FContasPagarParam.Me6DataBase.Text;
//      if FContasPagarParam.RGPreview.ItemIndex = 0 then
//        FRContasPagar_Finalidade.QRPrimario.Preview
//      else
//        FRContasPagar_Finalidade.QRPrimario.Print;
//      QRContasPagar_Finalidade.Close;
//    end;
//  end;
//end;

procedure TFContasPagarCad.TotalporFornecedor1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[7].TabVisible := True;
  if FContasPagarParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.ME7Filial.Text), 'CONTAS A PAGAR');
    with DMRelContasPagar do
    begin
      QRTotalPagarFornecedor.Close;

      if Trim(FContasPagarParam.ME7Filial.Text) <> '' then
        QRTotalPagarFornecedor.SetVariable('FILIAL', Trim(FContasPagarParam.ME7Filial.Text))
      else
        QRTotalPagarFornecedor.SetVariable('FILIAL', null);

      if Trim(FContasPagarParam.Me7Cadastro.Text) <> '' then
        QRTotalPagarFornecedor.SetVariable('CADASTRO', Trim(FContasPagarParam.Me7Cadastro.Text))
      else
        QRTotalPagarFornecedor.SetVariable('CADASTRO', null);

      if Trim(FContasPagarParam.Me7Departamento.Text) <> '' then
        QRTotalPagarFornecedor.SetVariable('DEPARTAMENTO', Trim(FContasPagarParam.Me7Departamento.Text))
      else
        QRTotalPagarFornecedor.SetVariable('DEPARTAMENTO', null);

      if Trim(FContasPagarParam.Fm7Finalidade.MeFinalidade.Text) <> '' then
        QRTotalPagarFornecedor.SetVariable('COD_FINALIDADE', Trim(FContasPagarParam.Fm7Finalidade.MeFinalidade.Text))
      else
        QRTotalPagarFornecedor.SetVariable('COD_FINALIDADE', null);

      QRTotalPagarFornecedor.SetVariable('DT_BASE', Trim(FContasPagarParam.MeDatabase7.Text));

      if (Trim(FContasPagarParam.ME7DtInicial.Text) = '') or (Trim(FContasPagarParam.ME7DtFinal.Text) = '') then
        raise Exception.Create('Informar o Período')
      else
      begin
        QRTotalPagarFornecedor.SetVariable('DT_INICIAL', Trim(FContasPagarParam.ME7DtInicial.Text));
        QRTotalPagarFornecedor.SetVariable('DT_FINAL', Trim(FContasPagarParam.ME7DtFinal.Text));
      end;

      QRTotalPagarFornecedor.Open;


      if FRTotalPagarFornecedor = nil then
        FRTotalPagarFornecedor := TFRTotalPagarFornecedor.Create(Application);
      FRTotalPagarFornecedor.QRLFilial.Caption := 'Filial: ' + Trim(FContasPagarParam.Me7Filial.Text) + ' ' +
        Trim(FContasPagarParam.Ed7Filial.Text) + ' Departamento: ' +
        Trim(FContasPagarParam.Me7Departamento.Text) +
        Trim(FContasPagarParam.Ed7Departamento.Text);
      FRTotalPagarFornecedor.QRLPeriodo.Caption := 'Período de ' + FContasPagarParam.Me7DtInicial.Text + ' Até ' +
        FContasPagarParam.Me7DtFinal.Text;
      FRTotalPagarFornecedor.QRLFornecedor.Caption := 'Fornecedor: ' + FContasPagarParam.Me7Cadastro.Text +
        FContasPagarParam.Ed7Cadastro.Text;

      if FContasPagarParam.RGPreview.ItemIndex = 0 then
        FRTotalPagarFornecedor.QRPrimario.Preview
      else
        FRTotalPagarFornecedor.QRPrimario.Print;
      QRTotalPagarFornecedor.Close;
    end;
  end;

end;

procedure TFContasPagarCad.TitulosAbertosSinttico1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[8].TabVisible := True;
  if FContasPagarParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.ME8Filial.Text), 'CONTAS A PAGAR');
    with DMRelContasPagar do
    begin
      QRTitulosAberto_Depto_Sintetico.Close;

      if Trim(FContasPagarParam.ME8Filial.Text) <> '' then
        QRTitulosAberto_Depto_Sintetico.SetVariable('FILIAL', Trim(FContasPagarParam.ME8Filial.Text))
      else
        QRTitulosAberto_Depto_Sintetico.SetVariable('FILIAL', null);

      if Trim(FContasPagarParam.Me8Departamento.Text) <> '' then
        QRTitulosAberto_Depto_Sintetico.SetVariable('DEPARTAMENTO', Trim(FContasPagarParam.Me8Departamento.Text))
      else
        QRTitulosAberto_Depto_Sintetico.SetVariable('DEPARTAMENTO', null);

      if (Trim(FContasPagarParam.ME8DtInicial.Text) = '') or (Trim(FContasPagarParam.ME8DtFinal.Text) = '') then
        raise Exception.Create('Informar o Período de Vencimento')
      else
      begin
        QRTitulosAberto_Depto_Sintetico.SetVariable('DT_INICIAL', Trim(FContasPagarParam.ME8DtInicial.Text));
        QRTitulosAberto_Depto_Sintetico.SetVariable('DT_FINAL', Trim(FContasPagarParam.ME8DtFinal.Text));
      end;

      QRTitulosAberto_Depto_Sintetico.Open;

      if FRTituloAberto_Depto_Sintetico = nil then
        FRTituloAberto_Depto_Sintetico := TFRTituloAberto_Depto_Sintetico.Create(Application);
      FRTituloAberto_Depto_Sintetico.QRLPeriodo.Caption := 'Período de ' + FContasPagarParam.Me8DtInicial.Text + ' Até ' +
        FContasPagarParam.Me8DtFinal.Text;

      if FContasPagarParam.RGPreview.ItemIndex = 0 then
        FRTituloAberto_Depto_Sintetico.QRPrimario.Preview
      else
        FRTituloAberto_Depto_Sintetico.QRPrimario.Print;
      QRTitulosAberto_Depto_Sintetico.Close;
    end;
  end;

end;

procedure TFContasPagarCad.ConciliaoContasPagarContasReceber1Click(
  Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[9].TabVisible := True;
  if FContasPagarParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.Me9Filial.Text), 'CONTAS A PAGAR');
    with DMRelContasPagar do
    begin
      QRConciliacao_Cp_Cr.Close;
      if Trim(FContasPagarParam.Me9Filial.Text) <> '' then
        QRConciliacao_Cp_Cr.SetVariable('FILIAL', Trim(FContasPagarParam.Me9Filial.Text))
      else
        QRConciliacao_Cp_Cr.SetVariable('FILIAL', null);

      if Trim(FContasPagarParam.Fm9FinalidadeCP.MeFinalidade.Text) <> '' then
        QRConciliacao_Cp_Cr.SetVariable('FINALIDADE_CP', Trim(FContasPagarParam.Fm9FinalidadeCP.MeFinalidade.Text))
      else
        QRConciliacao_Cp_Cr.SetVariable('FINALIDADE_CP', null);

      if Trim(FContasPagarParam.Fm9FinalidadeCR.MeFinalidade.Text) <> '' then
        QRConciliacao_Cp_Cr.SetVariable('FINALIDADE_CR', Trim(FContasPagarParam.Fm9FinalidadeCR.MeFinalidade.Text))
      else
        QRConciliacao_Cp_Cr.SetVariable('FINALIDADE_CR', null);

      if Trim(FContasPagarParam.Me9Cadastro.Text) <> '' then
        QRConciliacao_Cp_Cr.SetVariable('CADASTRO', Trim(FContasPagarParam.Me9Cadastro.Text))
      else
        raise Exception.Create('Informar o Cadastro');

      QRConciliacao_Cp_Cr.Open;

      if FRConcilia_Cp_Cr = nil then
        FRConcilia_Cp_Cr := TFRConcilia_Cp_Cr.Create(Application);

      if FContasPagarParam.RGPreview.ItemIndex = 0 then
        FRConcilia_Cp_Cr.QRPrimario.Preview
      else
        FRConcilia_Cp_Cr.QRPrimario.Print;
      QRConciliacao_Cp_Cr.Close;
    end;
  end;
end;

procedure TFContasPagarCad.CalculoDescontosAntecipacaoPontualidade1Click(
  Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[10].TabVisible := True;
  FContasPagarParam.Me10DtBaixa.Text := DateToStr(Date);
  if FContasPagarParam.ShowModal = mrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.Me10Filial.Text), 'CONTAS A PAGAR');
    with DMContasPagarRel do
    begin
      QrTitulosAPagar_For.Close;
      if Trim(FContasPagarParam.Me10Filial.Text) <> '' then
        QrTitulosAPagar_For.SetVariable('COD_FILIAL', Trim(FContasPagarParam.Me10Filial.Text))
      else
        QrTitulosAPagar_For.SetVariable('COD_FILIAL', null);

      if Trim(FContasPagarParam.Me10Cadastro.Text) <> '' then
        QrTitulosAPagar_For.SetVariable('COD_CADASTRO', Trim(FContasPagarParam.Me10Cadastro.Text))
      else
        QrTitulosAPagar_For.SetVariable('COD_CADASTRO', null);

      if (Trim(FContasPagarParam.Me10DtInicial.Text) = '') or (Trim(FContasPagarParam.Me10DtFinal.Text) = '') then
        raise Exception.Create('Informar o Período')
      else
      begin
        QrTitulosAPagar_For.SetVariable('DT_INICIAL', Trim(FContasPagarParam.Me10DtInicial.Text));
        QrTitulosAPagar_For.SetVariable('DT_FINAL', Trim(FContasPagarParam.Me10DtFinal.Text));
      end;
      QrTitulosAPagar_For.SetVariable('DT_REFERENCIA', Trim(FContasPagarParam.Me10DtBaixa.Text));

      QrTitulosAPagar_For.Open;

      if FRContasPagar_Descontos = nil then
        FRContasPagar_Descontos := TFRContasPagar_Descontos.Create(Application);
      FRContasPagar_Descontos.QRLFilial.Caption := 'Filial: ' + Trim(FContasPagarParam.Me10Filial.Text) + '- ' +
        Trim(FContasPagarParam.Ed10Filial.Text) + '   *** Para Pagto em:' + FContasPagarParam.Me10DtBaixa.Text;
      FRContasPagar_Descontos.QRLPeriodo.Caption := 'Período de ' + FContasPagarParam.Me10DtInicial.Text + ' Até ' +
        FContasPagarParam.Me10DtFinal.Text;
      if FContasPagarParam.RGPreview.ItemIndex = 0 then
        FRContasPagar_Descontos.QRPrimario.Preview
      else
        FRContasPagar_Descontos.QRPrimario.Print;
      QrTitulosAPagar_For.Close;
    end;
  end;

end;

procedure TFContasPagarCad.GerarContrato1Click(Sender: TObject);
var
  Path, campo: string;
begin
  inherited;
  if DMContasPagar.QContasPagar_cabCOD_CONTA_PAGAR_CAB.value <> 0 then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(DMContasPagar.QContasPagar_cabCOD_FILIAL.Text), 'CONTAS A PAGAR');
    Path := ExtractFilePath(ParamStr(0)) + 'Contratos\';
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('PK', DMContasPagar.QContasPagar_cabCOD_FILIAL.Value);
    DMFilial.QFilial.Open;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK', DMContasPagar.QContasPagar_cabCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;
    DMFinalidade.QFinalidade.Close;
    DMFinalidade.QFinalidade.SetVariable('PK', DMContasPagar.QContasPagar_cabCOD_FINALIDADE.Value);
    DMFinalidade.QFinalidade.Open;

    // Cria objeto principal de controle
    WinWord := CreateOleObject('Word.Application');
    // Mostra o Word
    WinWord.Visible := true;
    // Pega uma interface para o objeto que manipula documentos
    Docs := WinWord.Documents;
    // Abre um Documento
    Doc := Docs.Open(Path + 'ContratoContasPagar.Doc');

    campo := DMFilial.QFilialDESC_FILIAL.Value;
    Doc.Content.Find.Execute(FindText := '%desc_filial', ReplaceWith := campo, Replace := 2);
    campo := DMFilial.QFilialNum_CGC.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_filial', ReplaceWith := campo, Replace := 2);
    campo := DMFilial.QFilialDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_filial', ReplaceWith := campo, Replace := 2);
    campo := DMFilial.QFilialDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_filial', ReplaceWith := campo, Replace := 2);
    campo := DMFilial.QFilialCod_estado.Value;
    Doc.Content.Find.Execute(FindText := '%estado_filial', ReplaceWith := campo, Replace := 2);
    campo := DMFilial.QFilialDESC_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%inscricao_filial', ReplaceWith := campo, Replace := 2);
    campo := DMCadastro.QCadastroNOME.Value;
    Doc.Content.Find.Execute(FindText := '%nome_cadastro', ReplaceWith := campo, Replace := 2);
    campo := DMCadastro.QCadastroNUM_INSCRICAO.Value;
    Doc.Content.Find.Execute(FindText := '%rg_cadastro', ReplaceWith := campo, Replace := 2);
    campo := DMCadastro.QCadastroNUM_CGC_CPF.Value;
    Doc.Content.Find.Execute(FindText := '%cgc_cpf_cadastro', ReplaceWith := campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_ENDERECO.Value;
    Doc.Content.Find.Execute(FindText := '%endereco_cadastro', ReplaceWith := campo, Replace := 2);
    campo := DMCadastro.QCadastroDESC_CIDADE.Value;
    Doc.Content.Find.Execute(FindText := '%cidade_cadastro', ReplaceWith := campo, Replace := 2);
    campo := DMCadastro.QCadastroCOD_ESTADO.value;
    Doc.Content.Find.Execute(FindText := '%uf_cadastro', ReplaceWith := campo, Replace := 2);
    campo := FormatFloat('#,##0.00', DMContasPagar.QContasPagar_cabVAL_TITULO.value);
    Doc.Content.Find.Execute(FindText := '%valor_titulo', ReplaceWith := campo, Replace := 2);
    campo := Bib.extenso(DMContasPagar.QContasPagar_cabVAL_TITULO.value, 'REAL');
    Doc.Content.Find.Execute(FindText := '%extenso', ReplaceWith := campo, Replace := 2);
    campo := FormatFloat('#,##0.00', DMFinalidade.QFinalidadePERC_TAXA.value);
    Doc.Content.Find.Execute(FindText := '%taxa_juro', ReplaceWith := campo, Replace := 2);
    campo := DateToStr(DMContasPagar.QContasPagar_cabDT_EMISSAO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_emissao', ReplaceWith := campo, Replace := 2);
    campo := DateToStr(DMContasPagar.QContasPagar_cabDT_VENCIMENTO.Value);
    Doc.Content.Find.Execute(FindText := '%dt_vencimento', ReplaceWith := campo, Replace := 2);

    // Grava documento
    Doc.SaveAs(Path + 'ContratoContasPagar1.Doc');
    // Imprime
    //Doc.PrintOut(false);
    // Fecha o Word
//      WinWord.Quit;
  end
  else
    MessageDlg('Primeiro selecione uma Conta para IMPRESSÃO', mtInformation, [mbOk], 0);

end;

procedure TFContasPagarCad.Promissria1Click(Sender: TObject);
var x, y: array of string;
  wTexto: string;
begin
  inherited;

    if DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Value > 0 then
    begin
      if FRPromissoria_Branco = nil then
        FRPromissoria_Branco := TFRPromissoria_Branco.Create(Application);

      setLength(x, 9); //9 sql diferentes
      setLength(y, 9);

      x[0] := 'SELECT DESC_FILIAL FROM TB_FILIAL WHERE COD_FILIAL = ' + DMContasPagar.QContasPagar_CabCod_Filial.Text;
      x[1] := 'SELECT NUM_CGC FROM TB_FILIAL WHERE COD_FILIAL = ' + DMContasPagar.QContasPagar_CabCod_Filial.Text;
      x[2] := 'SELECT DESC_CIDADE FROM TB_FILIAL WHERE COD_FILIAL = ' + DMContasPagar.QContasPagar_CabCod_Filial.Text;
      x[3] := 'SELECT COD_ESTADO FROM TB_FILIAL WHERE COD_FILIAL = ' + DMContasPagar.QContasPagar_CabCod_Filial.Text;
      x[4] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = ' + DMContasPagar.QContasPagar_CabCod_Cadastro.Text;
      x[5] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = ' + DMContasPagar.QContasPagar_CabCod_Cadastro.Text;
      x[6] := 'SELECT DESC_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = ' + DMContasPagar.QContasPagar_CabCod_Cadastro.Text;
      x[7] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = ' + DMContasPagar.QContasPagar_CabCod_Cadastro.Text;
      x[8] := 'SELECT DESC_ENDERECO FROM TB_FILIAL WHERE COD_FILIAL = ' + DMContasPagar.QContasPagar_CabCod_Filial.Text;

      DMOracle.BuscaNomes(x, y);
      FRPromissoria_Branco.QRLVencimento.Caption := DMContasPagar.QContasPagar_CabDT_Vencimento.Text;
      FRPromissoria_Branco.QRLNumero.Caption := DMContasPagar.QContasPagar_CabNum_Titulo.Text;
      FRPromissoria_Branco.QRLParcela.Caption := DMContasPagar.QContasPagar_CabNum_Parcela.Text;
      wTexto := 'Na data de ' + DateToStr(DMContasPagar.QContasPagar_CabDT_Vencimento.Value) + ', pagarei por esta unica via de NOTA PROMISSORIA a ';
      wTexto := wTexto + y[7];
      wTexto := wTexto + ' CPF/CNPJ: ' + y[4];
      wTexto := wTexto + ' ou a sua ordem a quantia de: (';
      wTexto := wTexto + Bib.extenso(DMContasPagar.QContasPagar_CabVAL_TITULO.Value, 'REAL');
      //FRPromissoria_Branco.QrLValor.Caption := DMContasPagar.QContasPagar_CabVal_Titulo.text;  //Comentei e coloquei para pegar o valor original. Vanessa 02/10/2015
      FRPromissoria_Branco.QrLValor.Caption := DMContasPagar.QContasPagar_CabVAL_ORIGINAL.Text;
      wTexto := wTexto + '.) em moeda corrente deste pais.';
      FRPromissoria_Branco.QrLocal_Pagamento.Caption := Y[2] + ' - ' + Y[3];
      FRPromissoria_Branco.QrDescricao.Caption := wTexto;
      FRPromissoria_Branco.QrEmitente.Caption := y[0];
      FRPromissoria_Branco.QrCpf_Cnpj.Caption := y[1];
      FRPromissoria_Branco.QrEndereco.Caption := y[8];
      FRPromissoria_Branco.QrCidade.Caption := Y[2];
      FRPromissoria_Branco.QrCpfEmitente.Caption := Y[1];
      FRPromissoria_Branco.QrNomeEmitente.Caption := FRPromissoria_Branco.QrEmitente.Caption;
      FRPromissoria_Branco.QRlAvalista1.Caption := '.';
      FRPromissoria_Branco.QRlAvalista2.Caption := '.';
      FRPromissoria_Branco.QRLCidade.Caption := y[2] + ', ' + FormatDateTime('dd " de " mmmm " de " yyyy ', DMContasPagar.QContasPagar_CabDt_Emissao.Value); ;
      FRPromissoria_Branco.QRPrimario.Preview;
    end;

end;

procedure TFContasPagarCad.BtContaCorrenteClick(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal = mrOk then
  begin
    DMContasPagar.QContasPagar_CabCod_Banco_Agencia.Value := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Value;
    DMContasPagar.QContasPagar_CabCod_Conta_Corrente.Value := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value;
  end;
end;

procedure TFContasPagarCad.AgendaBaixa1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[11].TabVisible := true;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    with DMContasPagarRel do
    begin
      QRAgendaBaixa.Close;
      if trim(FContasPagarParam.FmFilial11.MeFilial.Text) <> '' then
        QRAgendaBaixa.SetVariable('FILIAL', trim(FContasPagarParam.FmFilial11.MeFilial.Text))
      else
        QRAgendaBaixa.SetVariable('FILIAL', null);
      if trim(FContasPagarParam.FmDepartamento11.MeDepartamento.Text) <> '' then
        QRAgendaBaixa.SetVariable('DEPARTAMENTO', trim(FContasPagarParam.FmDepartamento11.MeDepartamento.Text))
      else
        QRAgendaBaixa.SetVariable('DEPARTAMENTO', null);
      if trim(FContasPagarParam.FmFornecedor11.MeCadastro.Text) <> '' then
        QRAgendaBaixa.SetVariable('FORNECEDOR', trim(FContasPagarParam.FmFornecedor11.MeCadastro.Text))
      else
        QRAgendaBaixa.SetVariable('FORNECEDOR', null);
      if trim(FContasPagarParam.FMBanco11.MeBanco.Text) <> '' then
        QRAgendaBaixa.SetVariable('BANCO', trim(FContasPagarParam.FMBanco11.MeBanco.Text))
      else
        QRAgendaBaixa.SetVariable('BANCO', null);
      case FContasPagarParam.RGFormaPgto11.ItemIndex of
        0: QRAgendaBaixa.SetVariable('PAGAMENTO', 'Bloqueto');
        1: QRAgendaBaixa.SetVariable('PAGAMENTO', 'Deposito');
        2: QRAgendaBaixa.SetVariable('PAGAMENTO', 'Cheque');
        3: QRAgendaBaixa.SetVariable('PAGAMENTO', 'Dinheiro');
        4: QRAgendaBaixa.SetVariable('PAGAMENTO', 'Debito Automatico');
        5: QRAgendaBaixa.SetVariable('PAGAMENTO', 'Adiantamento');
        6: QRAgendaBaixa.SetVariable('PAGAMENTO', null);
      end;
      if trim(FContasPagarParam.FmDatas1.MeDtInicial.Text) <> '' then
        QRAgendaBaixa.SetVariable('DATA_I', FContasPagarParam.FmDatas1.MeDtInicial.Text)
      else
        raise Exception.Create('Data inicial deve ser informada');
      if trim(FContasPagarParam.FmDatas1.MeDtFinal.Text) = '' then
        FContasPagarParam.FmDatas1.MeDtFinal.Text := DateToStr(date);
      QRAgendaBaixa.SetVariable('DATA_F', FContasPagarParam.FmDatas1.MeDtFinal.Text);
      QRAgendaBaixa.Open;
    end;
    if FRContasPagarAgendaBaixa = nil then
      FRContasPagarAgendaBaixa := TFRContasPagarAgendaBaixa.Create(Application);
    if FContasPagarParam.FmFilial11.EdFilial.Text <> '' then
      FRContasPagarAgendaBaixa.QRLFilial.Caption := 'Filial: ' + FContasPagarParam.FmFilial11.EdFilial.Text
    else
      FRContasPagarAgendaBaixa.QRLFilial.Caption := '';
    if FContasPagarParam.FmDatas1.MeDtInicial.Text <> '' then
      FRContasPagarAgendaBaixa.QRLData.Caption := 'De ' + FContasPagarParam.FmDatas1.MeDtInicial.Text + ' até ' +
        FContasPagarParam.FmDatas1.MeDtFinal.Text;
    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagarAgendaBaixa.QRPrimario.Preview
    else
      FRContasPagarAgendaBaixa.QRPrimario.Print;
  end;
end;

procedure TFContasPagarCad.DBComboBox1Change(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex = 1 then
  begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
    begin

      if DMContasPagar.QContasPagar_CabCOD_CADASTRO.Text = '' then
      begin
        DBComboBox1.ItemIndex := -1;
        raise Exception.Create('Fornecedor não informado, esta opção necessida que seja informado um fornecedor');
      end;

      with DMCadastro do
      begin

        QCadastro.Close;
        QCadastro.SetVariable('PK', DMContasPagar.QContasPagar_CabCOD_CADASTRO.Value);
        QCadastro.open;

        if (QCadastroCOD_BANCO_AGENCIA.Text = '') or
          (QCadastroDESC_AGENCIA.Text = '') or
          (QCadastroDESC_CONTA_CORRENTE.Text = '') or
          (QCadastroNOME_TITULAR.Text = '') or
          (QCadastroDESC_COMPLEMENTO.Text = '') or
          (QCadastroDESC_COMPLEMENTO_SINTEGRA.Value = '') then
        begin
          DBComboBox1.ItemIndex := -1;
          raise Exception.Create('Fornecedor com dados desatualizados, favor atualizar os dados bancários do fornecedor no módulo de Cadastros');
        end;

        DMContasPagar.QContasPagar_CabCOD_BANCO_PGTO.Value := QCadastroCOD_BANCO_AGENCIA.Value;
        DMContasPagar.QContasPagar_CabCOD_AGENCIA.Value := QCadastroDESC_AGENCIA.Value;
        DMContasPagar.QContasPagar_CabCOD_CONTA_CORRENTE_PGTO.Value := QCadastroDESC_CONTA_CORRENTE.Value;
        DMContasPagar.QContasPagar_CabDESC_NOME_TITULAR_CONTA.Value := QCadastroNOME_TITULAR.Value;
        DMContasPagar.QContasPagar_CabDESC_CNPJ_CPF_PGTO.Value := QCadastroDESC_COMPLEMENTO.Value;
        DMContasPagar.QContasPagar_CabDESC_COMPLEMENTO_SINTEGRA.Value := QCadastroDESC_COMPLEMENTO_SINTEGRA.Value;

      end;

    end;
  end
  else
  begin

    DMContasPagar.QContasPagar_CabCOD_BANCO_PGTO.Text := '';
    DMContasPagar.QContasPagar_CabCOD_AGENCIA.Value := '';
    DMContasPagar.QContasPagar_CabCOD_CONTA_CORRENTE_PGTO.Value := '';
    DMContasPagar.QContasPagar_CabDESC_NOME_TITULAR_CONTA.Value := '';
    DMContasPagar.QContasPagar_CabDESC_CNPJ_CPF_PGTO.Value := '';
    DMContasPagar.QContasPagar_CabDESC_COMPLEMENTO_SINTEGRA.Value := '';

  end;
end;

procedure TFContasPagarCad.tulosOutrasMoedas1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[12].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    with DMContasPagar do
    begin
      if Trim(FContasPagarParam.Me12DtInicial.Text) = '' then
        raise Exception.Create('Por favor, informe a data inicial.');
      if Trim(FContasPagarParam.Me12DtFinal.Text) = '' then
        raise Exception.Create('Por favor, informe a data final.');
      if Trim(FContasPagarParam.ME12DtBase.Text) = '' then
        raise Exception.Create('Por favor, informe a data base.');
      QRTitulosAbertos_OutrasMoedas.Close;
      if Trim(FContasPagarParam.Fm12Filial.MeFilial.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FILIAL', Trim(FContasPagarParam.Fm12Filial.MeFilial.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FILIAL', null);
      if Trim(FContasPagarParam.Fm12Departamento.MeDepartamento.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_DEPARTAMENTO', Trim(FContasPagarParam.Fm12Departamento.MeDepartamento.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_DEPARTAMENTO', null);
      if Trim(FContasPagarParam.Fm12Cadastro.MeCadastro.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_CADASTRO', Trim(FContasPagarParam.Fm12Cadastro.MeCadastro.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_CADASTRO', null);
      if Trim(FContasPagarParam.Fm12Finalidade.MeFinalidade.Text) <> '' then
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FINALIDADE', Trim(FContasPagarParam.Fm12Finalidade.MeFinalidade.Text))
      else
        QRTitulosAbertos_OutrasMoedas.SetVariable('COD_FINALIDADE', null);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_INICIAL', FContasPagarParam.Me12DtInicial.Text);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_FINAL', FContasPagarParam.Me12DtFinal.Text);
      QRTitulosAbertos_OutrasMoedas.SetVariable('DT_BASE', FContasPagarParam.ME12DtBase.Text);

      if FRTitulosAbertos_OutrasMoedas = nil then
        FRTitulosAbertos_OutrasMoedas := TFRTitulosAbertos_OutrasMoedas.Create(Application);
      with FRTitulosAbertos_OutrasMoedas do
      begin
        QRLFilial.Caption := FContasPagarParam.Fm12Filial.EdFilial.Text;
        QRLFinalidade.Caption := FContasPagarParam.Fm12Finalidade.EdFinalidade.Text;
        QRLDtInicial.Caption := FContasPagarParam.Me12DtInicial.Text;
        QRLDtFinal.Caption := FContasPagarParam.Me12DtFinal.Text;
        QRLDtBase.Caption := FContasPagarParam.ME12DtBase.Text;
        QRLDepartamento.Caption := FContasPagarParam.Fm12Departamento.EdDepartamento.Text;
      end;
      QRTitulosAbertos_OutrasMoedas.open;
      if FContasPagarParam.RGPreview.ItemIndex = 0 then
        FRTitulosAbertos_OutrasMoedas.QRPrimario.Preview
      else
        FRTitulosAbertos_OutrasMoedas.QRPrimario.Print;
      QRTitulosAbertos_OutrasMoedas.Close;
    end;
  end;
end;

procedure TFContasPagarCad.EmiteReciboPBaixasemLote1Click(Sender: TObject);
var
  wCodFilial : Integer;
begin
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[13].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.Fm13Filial.MEFilial.Text), 'CONTAS A PAGAR');
    with DMContasPagar do
    begin
      QContasPagarBaixa.Close;
      QContasPagarBaixa.Sql.Clear;
      QContasPagarBaixa.Sql.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_PAGAR_CAB."COD_CONTA_PAGAR_CAB" ,TB_CONTA_PAGAR_CAB."COD_FINALIDADE" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_PAGAR_CAB."COD_CADASTRO" ,TB_CONTA_PAGAR_CAB."COD_DEPARTAMENTO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_FILIAL" ,TB_CONTA_PAGAR_CAB."NUM_TITULO" ,TB_CONTA_PAGAR_CAB.COD_CONTRATO_GP,TB_CONTA_PAGAR_CAB."NUM_PARCELA" ,TB_CONTA_PAGAR_CAB."DESC_TIPO_DOCUMENTO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_MOVIMENTO" ,TB_CONTA_PAGAR_CAB."DT_BAIXA" ,TB_CONTA_PAGAR_CAB."DT_VENCIMENTO" ,TB_CONTA_PAGAR_CAB."DT_EMISSAO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_CAPITALIZACAO",TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO",TB_CONTA_PAGAR_CAB."VAL_TITULO" ,TB_CONTA_PAGAR_CAB."COD_NOTA_CAB" ,TB_CONTA_PAGAR_CAB."DESC_OBSERVACAO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."IND_ACEITE" ,TB_CONTA_PAGAR_CAB."DT_ACEITE" ,TB_CONTA_PAGAR_CAB."IND_SITUACAO" ,TB_CONTA_PAGAR_CAB."VAL_ORIGINAL" ,TB_CONTA_PAGAR_CAB."VAL_INDEXADO",');
      QContasPagarBaixa.Sql.Add('TB_FINALIDADE."COD_HISTORICO_DESC",TB_CONTA_PAGAR_CAB.PERC_DESC_PONTUALIDADE,TB_CONTA_PAGAR_CAB.PERC_DESC_ANTECIPACAO, ');
      QContasPagarBaixa.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.PERC_JURO_MORA, TB_FINALIDADE.DESC_FINALIDADE, ');
      QContasPagarBaixa.Sql.Add('DECODE(TB_CONTA_PAGAR_CAB.IND_SITUACAO,' + Chr(39) + 'ABERTO' + Chr(39) + ',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA, ');
      QContasPagarBaixa.Sql.Add('TB_OBRA.DESC_OBRA ');
      QContasPagarBaixa.Sql.Add(' FROM TB_CONTA_PAGAR_CAB,TB_CADASTRO,TB_FINALIDADE,TB_OBRA WHERE ');
      QContasPagarBaixa.Sql.Add(' TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
      QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE ');
      QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+) ');
      QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.VAL_TITULO  > 0');
      if Trim(FContasPagarParam.Fm13Cadastro.MECadastro.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(FContasPagarParam.Fm13Cadastro.MECadastro.Text));
      if Trim(FContasPagarParam.MeDtInicial.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO >= ' + chr(39) + Trim(FContasPagarParam.MeDtInicial.Text) + chr(39));
      if Trim(FContasPagarParam.MeDtFinal.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO <= ' + chr(39) + Trim(FContasPagarParam.MeDtFinal.Text) + chr(39));
      if Trim(FContasPagarParam.Fm13Filial.MEFilial.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = ' + Trim(FContasPagarParam.Fm13Filial.MEFilial.Text));
      if Trim(FContasPagarParam.Fm13Finalidade.MeFinalidade.text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE =' + Trim(FContasPagarParam.Fm13Finalidade.MeFinalidade.text));
      QContasPagarBaixa.Sql.Add(' ORDER BY TB_CADASTRO.NOME');
      QContasPagarBaixa.Open;
    end;

    DMContasPagar.QContasPagarBaixa.first;
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.Open; //Abre a Query em Memória para inserção de Dados.
    while not (DMContasPagar.QContasPagarBaixa.Eof) do
    begin
         //Adiciona na Query em Memória a Conta a Receber para Gerar o Recibo em Lote - 14/01/2008 - Camila.
      wCodFilial := DMContasPagar.QContasPagarBaixaCOD_FILIAL.Value;
      DMContasReceber_Rel.AddDadosReciboLote(DMContasPagar.QContasPagarBaixaNOME.Text, //nomeCliente
        wCodFilial,
        DMContasPagar.QContasPagarBaixaNUM_TITULO.AsInteger, //numDuplicata
        DMContasPagar.QContasPagarBaixaNUM_PARCELA.Value, //numParcela
        DMContasPagar.QContasPagarBaixaVAL_TITULO.Value, //valPrincipal
        0, //valJuros
        DMContasPagar.QContasPagarBaixaVAL_TITULO.Value, //valPrincipalRecebido
        0, //valJurosRecebido
        0, //valDesconto
                           //valRecebido = valPrincipalRecebido + valJurosRecebido - valDesconto
        DMContasPagar.QContasPagarBaixaVAL_TITULO.Value,
        0,
        Trim(DMContasPagar.QContasPagarBaixaDesc_Finalidade.Text) + ' ' + Trim(DMContasPagar.QContasPagarBaixaDesc_Observacao.Text)
        );
      DMContasPagar.QContasPagarBaixa.Next;
    end;
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.First;
    //colocar aqui a chamada dos recibos.
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' then
      FContaPagarBaixa.EmiteReciboLote('Cerealista Grasel', Date, wCodFilial);
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'INSIDE' then
      FContaPagarBaixa.EmiteReciboLote('INSIDE', Date, wCodFilial);
    if DMParamSistema.QParamSistemaCod_Empresa.Value = 'NIR' then
      FContaPagarBaixa.EmiteReciboLote('Cemapa Informatica', Date, wCodFilial);
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.EmptyDataSet; //Limpa os Dados da Baixa Anterior.
    DMContasReceber_Rel.cdsRContasReceberBaixaLote.Close; //Fecha a Query em Memória.
  end;
end;

procedure TFContasPagarCad.EmiteChequePPagamentoAgrupado1Click(
  Sender: TObject);
var wNrCheque, wCod_Cadastro, wBanco_Agencia: Integer;
  wTotCheque: Real;
  wNome: string;
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[14].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FContasPagarParam.Fm13Filial.MEFilial.Text), 'CONTAS A PAGAR');
    with DMContasPagar do
    begin
      QContasPagarBaixa.Close;
      QContasPagarBaixa.Sql.Clear;
      QContasPagarBaixa.Sql.Add('SELECT TB_CADASTRO."NOME" ,TB_CONTA_PAGAR_CAB."COD_CONTA_PAGAR_CAB" ,TB_CONTA_PAGAR_CAB."COD_FINALIDADE" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_BANCO_AGENCIA" ,TB_CONTA_PAGAR_CAB."COD_CADASTRO" ,TB_CONTA_PAGAR_CAB."COD_DEPARTAMENTO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."COD_FILIAL" ,TB_CONTA_PAGAR_CAB."NUM_TITULO" ,TB_CONTA_PAGAR_CAB.COD_CONTRATO_GP,TB_CONTA_PAGAR_CAB."NUM_PARCELA" ,TB_CONTA_PAGAR_CAB."DESC_TIPO_DOCUMENTO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_MOVIMENTO" ,TB_CONTA_PAGAR_CAB."DT_BAIXA" ,TB_CONTA_PAGAR_CAB."DT_VENCIMENTO" ,TB_CONTA_PAGAR_CAB."DT_VENCIMENTO_PRORROGADO" ,TB_CONTA_PAGAR_CAB."DT_EMISSAO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."DT_CAPITALIZACAO" ,TB_CONTA_PAGAR_CAB."VAL_TITULO" ,TB_CONTA_PAGAR_CAB."COD_NOTA_CAB" ,TB_CONTA_PAGAR_CAB."DESC_OBSERVACAO" ,');
      QContasPagarBaixa.Sql.Add('TB_CONTA_PAGAR_CAB."IND_ACEITE" ,TB_CONTA_PAGAR_CAB."DT_ACEITE" ,TB_CONTA_PAGAR_CAB."IND_SITUACAO" ,TB_CONTA_PAGAR_CAB."VAL_ORIGINAL" ,TB_CONTA_PAGAR_CAB."VAL_INDEXADO",');
      QContasPagarBaixa.Sql.Add('TB_FINALIDADE."COD_HISTORICO_DESC",TB_CONTA_PAGAR_CAB.PERC_DESC_PONTUALIDADE,TB_CONTA_PAGAR_CAB.PERC_DESC_ANTECIPACAO, ');
      QContasPagarBaixa.Sql.Add('TB_FINALIDADE.NUM_TIPO_JURO,TB_FINALIDADE.PERC_TAXA,TB_FINALIDADE.COD_MOEDA,TB_FINALIDADE.PERC_JURO_MORA,TB_FINALIDADE.DESC_FINALIDADE, ');
      QContasPagarBaixa.Sql.Add('DECODE(TB_CONTA_PAGAR_CAB.IND_SITUACAO,' + Chr(39) + 'ABERTO' + Chr(39) + ',TB_FINALIDADE.NUM_DIAS_CARENCIA,0) AS NUM_DIAS_CARENCIA, ');
      QContasPagarBaixa.Sql.Add('TB_OBRA.DESC_OBRA ');
      QContasPagarBaixa.Sql.Add(' FROM TB_CONTA_PAGAR_CAB,TB_CADASTRO,TB_FINALIDADE,TB_OBRA WHERE ');
      QContasPagarBaixa.Sql.Add(' TB_CONTA_PAGAR_CAB.COD_CADASTRO = TB_CADASTRO.COD_CADASTRO ');
      QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE = TB_FINALIDADE.COD_FINALIDADE ');
      QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_OBRA = TB_OBRA.COD_OBRA(+) ');
      QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.VAL_TITULO  > 0');
      if Trim(FContasPagarParam.Fm14Cadastro.MECadastro.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CADASTRO.COD_CADASTRO = ' + Trim(FContasPagarParam.Fm14Cadastro.MECadastro.Text));
      if Trim(FContasPagarParam.Me14DtInicial.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO >= ' + chr(39) + Trim(FContasPagarParam.Me14DtInicial.Text) + chr(39));
      if Trim(FContasPagarParam.Me14DtFinal.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.DT_VENCIMENTO <= ' + chr(39) + Trim(FContasPagarParam.Me14DtFinal.Text) + chr(39));
      if Trim(FContasPagarParam.Fm14Filial.MEFilial.Text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FILIAL = ' + Trim(FContasPagarParam.Fm14Filial.MEFilial.Text));
      if Trim(FContasPagarParam.Fm14Finalidade.MeFinalidade.text) <> '' then
        QContasPagarBaixa.Sql.Add(' AND TB_CONTA_PAGAR_CAB.COD_FINALIDADE =' + Trim(FContasPagarParam.Fm14Finalidade.MeFinalidade.text));
      QContasPagarBaixa.Sql.Add(' ORDER BY TB_CADASTRO.NOME');
      QContasPagarBaixa.Open;
    end;
    wNrCheque := StrToInt(FContasPagarParam.Me14NrCheque.Text);
    DMFilial.QFilial.Close;
    DMFilial.QFilial.SetVariable('Pk', StrToInt(Trim(FContasPagarParam.Fm14Filial.MEFilial.Text)));
    DMFilial.QFilial.Open;
    DMContasPagar.QContasPagarBaixaMov.close;
    DMContasPagar.QContasPagarBaixaMov.Open;
    wBanco_Agencia := StrToInt('0' + DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE', 'COD_CONTA_CORRENTE = ' + Trim(FContasPagarParam.Fm14ContaCorrente.MeContaCorrente.Text)));
    try
      DMOracle.DBCemapa.StartTransaction; // Inicia a transação
      wTotCheque := 0;
      DMContasPagar.QContasPagarBaixa.first;
      wCod_Cadastro := DMContasPagar.QContasPagarBaixaCod_Cadastro.Value;
      while not (DMContasPagar.QContasPagarBaixa.Eof) do
      begin
        DMFinalidade.QFinalidade.Close;
        DMFinalidade.QFinalidade.SetVariable('Pk', DMContasPagar.QContasPagarBaixaCod_Finalidade.Value);
        DMFinalidade.QFinalidade.Open;
        if DMFinalidade.QFinalidade.Eof then
          raise Exception.Create('Finalidade não cadastrada');

        if DMContasPagar.QContasPagarBaixaCod_Cadastro.Value <> wCod_Cadastro then
        begin
          Proc_Emite_Cheque(wNrCheque, wCod_Cadastro, wBanco_Agencia, wTotCheque, wNome);
          wTotCheque := 0;
          Inc(wNrCheque);
        end;

        wCod_Cadastro := DMContasPagar.QContasPagarBaixaCod_Cadastro.Value;
        wTotCheque := wTotCheque + DMContasPagar.QContasPagarBaixaVal_Titulo.Value;
        wNome := DMContasPagar.QContasPagarBaixaNome.Value;

        DMContasPagar.QContasPagarBaixaMov.Insert; // INICIA A GRAVACAO DO  MOV.
        DMContasPagar.QContasPagarBaixaMovVAL_MOVIMENTO.Value := DMContasPagar.QContasPagarBaixaVal_Titulo.Value;
        DMContasPagar.QContasPagarBaixaMovDT_MOVIMENTO.Value := Date;
        DMContasPagar.QContasPagarBaixaMovDESC_OBSERVACAO.Value := DMContasPagar.QContasPagarBaixaDesc_Observacao.Value;
        DMContasPagar.QContasPagarBaixaMovIND_TIPO_MOVIMENTO.Value := 'PGTO. PRINCIPAL';
        DMContasPagar.QContasPagarBaixaMovIND_FORMA_PAGAMENTO.Value := 'Banco';
        DMContasPagar.QContasPagarBaixaMov.Post;

        DMContasPagar.QContasPagar_Cab.Close;
        DMContasPagar.QContasPagar_Cab.SetVariable('PK', DMContasPagar.QContasPagarBaixaCod_Conta_Pagar_Cab.Value);
        DMContasPagar.QContasPagar_Cab.Open;
        DMContasPagar.QContasPagar_Cab.Edit;
        DMContasPagar.QContasPagar_CabVal_Titulo.Value := 0;
        DMContasPagar.QContasPagar_CabInd_Situacao.Value := 'BAIXA TOTAL';
        DMContasPagar.QContasPagar_CabDT_Baixa.Value := Date;
        DMContasPagar.QContasPagar_Cab.Post;
        DMContasPagar.QContasPagarBaixa.Next;
      end;
      if wCod_Cadastro > 0 then // serve para imprimir o cheque do ultimo lancamento
        Proc_Emite_Cheque(wNrCheque, wCod_Cadastro, wBanco_Agencia, wTotCheque, wNome);

      DMOracle.DBCemapa.Commit; // Fim da Transação
    except
      DMContasPagar.QContasPagarBaixaMov.Cancel;
      DMOracle.DBCemapa.RollBack;
      raise;
    end;
    DMContasPagar.QContasPagarBaixa.Close;
    DMContasPagar.QContasPagarBaixaMov.Close;
    DMFilial.QFilial.Close;
  end;
end;

procedure TFContasPagarCad.Proc_Emite_Cheque(pNrCheque, pCadastro, pBanco: Integer; pTotCheque: Real; pNome: string);
begin

  DMBancoAgencia.IncluiBanco(DMFinalidade.QFinalidadeCod_Historico_Cheque.Value, StrToInt(Trim(FContasPagarParam.Fm14ContaCorrente.MEContaCorrente.Text)), pNrCheque,
    pCadastro, 1, Date, pTotCheque, pNome, 'Baixa Lote Cheque', '', '', 'N', '');
//  wCodMovBanco := DMBancoAgencia.QBancoMovimentoCod_Bco_Movimento.Value; // guarda para atualizar o nominal caso emita cheque
  DMBancoAgencia.EmiteCheque(pBanco,
    pTotCheque,
    Date,
    pNome,
    DMFilial.QFilialDesc_Cidade.Value,
    StrToInt(Trim(FContasPagarParam.Fm14Filial.MEFilial.Text)))

end;

procedure TFContasPagarCad.LanarJurosManual1Click(Sender: TObject);
begin
  inherited;
  if DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text = '' then
    raise Exception.Create('Selecionar Titulo Para Lançar Juros');
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[15].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    try
      DMContasPagar.QContasPagar_Cab.Edit;
      DMContasPagar.QContasPagar_Mov.Insert;
      DMContasPagar.QContasPagar_MovDt_Movimento.Value := StrToDate(Trim(FContasPagarParam.Me15DtLancamento.Text));
      DMContasPagar.QContasPagar_MovVal_Movimento.Value := StrToFloat(Trim(FContasPagarParam.Me15VlJiuros.Text));
      DMContasPagar.QContasPagar_MovDesc_Observacao.Value := Trim(FContasPagarParam.Me15Observacao.Text);
      DMContasPagar.QContasPagar_MovInd_Tipo_Movimento.Value := 'JUROS';
      DMContasPagar.QContasPagar_Mov.Post;
      DMContasPagar.QContasPagar_Cab.Post;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.RollBack;
      raise exception.create('Erro! Transação não efetuada');
    end;
  end;
end;

procedure TFContasPagarCad.PrazoMdio1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[16].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DMContasPagar.QContasPagarPrazoMedio.Close;
    if Trim(FContasPagarParam.Fm16Filial.MeFilial.Text) <> '' then
      DMContasPagar.QContasPagarPrazoMedio.SetVariable('COD_FILIAL', Trim(FContasPagarParam.Fm16Filial.MeFilial.Text))
    else
      DMContasPagar.QContasPagarPrazoMedio.SetVariable('COD_FILIAL', Null);
    if Trim(FContasPagarParam.Fm16Finalidade.MeFinalidade.Text) <> '' then
      DMContasPagar.QContasPagarPrazoMedio.SetVariable('COD_FINALIDADE', Trim(FContasPagarParam.Fm16Finalidade.MeFinalidade.Text))
    else
      DMContasPagar.QContasPagarPrazoMedio.SetVariable('COD_FINALIDADE', Null);
    DMContasPagar.QContasPagarPrazoMedio.SetVariable('DT_INICIAL', Trim(FContasPagarParam.Me16DtInicial.Text));
    DMContasPagar.QContasPagarPrazoMedio.SetVariable('DT_FINAL', Trim(FContasPagarParam.Me16DtFinal.Text));
    DMContasPagar.QContasPagarPrazoMedio.Open;
    ShowMessage('Prazo Médio Contas Pagar:' + DMContasPagar.QContasPagarPrazoMedioPrazo_Medio.Text);
  end;

end;

procedure TFContasPagarCad.ExclusodeTtulosemLote1Click(Sender: TObject);
begin
  inherited;
  if FContasPagarExclusaoLote = nil then
    FContasPagarExclusaoLote := TFContasPagarExclusaoLote.Create(Application);
  FContasPagarExclusaoLote.ShowModal;
end;

procedure TFContasPagarCad.AlterarDtVencimentoProrrogado1Click(
  Sender: TObject);
var wVencto: string;
  ClickedOK: Boolean;
begin
  inherited;
  if DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text <> '' then
  begin
    wVencto := DMContasPagar.QContasPagar_CabDt_Vencimento_Prorrogado.Text;
    ClickedOK := InputQuery('Digite Data Vencimento Prorrogado', 'Vencimento:', wVencto);
    if ClickedOK then
      with DMOracle do
      begin
        try
          DMOracle.DBCemapa.StartTransaction;
          QExecSQL.Close;
          QExecSQL.SQL.Clear;
          QExecSQL.SQL.Add('UPDATE TB_CONTA_PAGAR_CAB SET DT_VENCIMENTO_PRORROGADO = ' + QuoteDStr(wVencto));
          QExecSQL.SQL.Add('WHERE Cod_Conta_Pagar_Cab = ' + DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text);
          QExecSQL.ExecSQL;
          DMOracle.DBCemapa.Commit;
          DMContasPagar.QContasPagar_Cab.Refresh;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Data Vencimento não foi atualizado');
        end;
      end;
  end;
end;

procedure TFContasPagarCad.itulosAbertoporFornecedorSintetico1Click(
  Sender: TObject);
begin
  inherited;
  if FContasPagarParam = nil then
    FContasPagarParam := TFContasPagarParam.Create(Application);
  FContasPagarParam.PGRelatorio.Pages[17].TabVisible := True;
  if FContasPagarParam.ShowModal = MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(FContasPagarParam.Fm17Filial.MeFilial.Text, 'CONTAS A PAGAR');

    DMContasPagarRel.QRContasPagarSintetico.Close;

    if trim(FContasPagarParam.Fm17Filial.MeFilial.text) <> '' then
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_FILIAL', StrToInt(trim(FContasPagarParam.Fm17Filial.MeFilial.text)))
    else
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_FILIAL', null);

    {if trim(FContasPagarParam.Fm17Departamento.MeDepartamento.text) <> '' then
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_DEPARTAMENTO', StrToInt(trim(FContasPagarParam.Fm17Departamento.MeDepartamento.text)))
    else
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_DEPARTAMENTO', null);}

    if Trim(FContasPagarParam.Fm17Departamento.EdDepartamento.Text) = 'VÁRIOS' then
    begin
        DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_DEPARTAMENTO',null);
        DMContasPagarRel.QRContasPagarSintetico.SetVariable('DEPARTAMENTOS', 'TB_CONTA_PAGAR_CAB.COD_DEPARTAMENTO IN (' + Trim(FContasPagarParam.Fm17Departamento.MeDepartamento.Text) + ')')
    end
    else
      begin
        DMContasPagarRel.QRContasPagarSintetico.SetVariable('DEPARTAMENTOS', '1=1');
        if Trim(FContasPagarParam.Fm17Departamento.EdDepartamento.Text) <> '' then
          DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_DEPARTAMENTO', Trim(FContasPagarParam.Fm17Departamento.MeDepartamento.Text));
      end;
      
    if trim(FContasPagarParam.Fm17Cadastro.MeCadastro.text) <> '' then
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_CADASTRO', StrToInt(trim(FContasPagarParam.Fm17Cadastro.MeCadastro.text)))
    else
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('COD_CADASTRO', null);

    DMContasPagarRel.QRContasPagarSintetico.SetVariable('DT_INICIAL', StrToDate(trim(FContasPagarParam.Fm17Datas.MeDtInicial.Text)));
    DMContasPagarRel.QRContasPagarSintetico.SetVariable('DT_FINAL', StrToDate(trim(FContasPagarParam.Fm17Datas.MeDtFinal.Text)));

    if Trim(FContasPagarParam.Me17TipoDocumento.Text) <> '' then
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('DESC_TIPO_DOCUMENTO', StrToInt(trim(FContasPagarParam.Me17TipoDocumento.Text)))
    else
      DMContasPagarRel.QRContasPagarSintetico.SetVariable('DESC_TIPO_DOCUMENTO', Null);

    DMContasPagarRel.QRContasPagarSintetico.SQL[DMContasPagarRel.QRContasPagarSintetico.SQL.Count - 1] := '';
    case FContasPagarParam.RG17Ordem.ItemIndex of
      0: DMContasPagarRel.QRContasPagarSintetico.SQL.Add(' ORDER BY TB_CONTA_PAGAR_CAB.COD_CADASTRO');
      1: DMContasPagarRel.QRContasPagarSintetico.SQL.Add(' ORDER BY NOME');
    end;
    DMContasPagarRel.QRContasPagarSintetico.open;

    if FRContasPagarSintetico = nil then
      FRContasPagarSintetico := TFRContasPagarSintetico.Create(Application);

    FRContasPagarSintetico.QRLPeriodo.Caption := '  PERIODO DE : ' + Trim(FContasPagarParam.Fm17Datas.MeDtInicial.text) + ' ATÉ : ' + Trim(FContasPagarParam.Fm17Datas.MeDtFinal.Text);
    if FContasPagarParam.RGPreview.ItemIndex = 0 then
      FRContasPagarSintetico.QRPrimario.Preview
    else
      FRContasPagarSintetico.QRPrimario.Print;
    DMContasPagarRel.QRContasPagarSintetico.Close;
  end;
end;

procedure TFContasPagarCad.AcrescentarValoraoTtulo1Click(Sender: TObject);
var wValor: string;
    wVlTitulo,wVlOriginal : Real;
    ClickedOK: Boolean;
begin
  inherited;
  if DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text = '' then
     raise Exception.Create('Selecionar Titulo Para Acrescentar Valor');
  If DMContasPagar.QContasPagar_CabInd_Situacao.Value = 'BAIXA TOTAL' Then
     Raise Exception.Create('Titulo já baixado totalmente - não permite acrescentar valor');
  wValor := '0';
  ClickedOK := InputQuery('Digite Valor de Acréscimo', 'Valor:', wValor);
  if ClickedOK then
    with DMOracle do
    begin
      try
//      wValor := Bib.TrocaVirgulaPorPonto(wValor);
        wVlTitulo := DMContasPagar.QContasPagar_CabVal_Titulo.Value + StrToFloat(wValor);
        wVlOriginal := DMContasPagar.QContasPagar_CabVal_Original.Value + StrToFloat(wValor);
        DMOracle.DBCemapa.StartTransaction;
        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_CONTA_PAGAR_CAB SET VAL_ORIGINAL = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wVlOriginal)) + ', VAL_TITULO = ' +  Bib.TrocaVirgulaPorPonto(FloatToStr(wVlTitulo)));
        QExecSQL.SQL.Add(' WHERE Cod_Conta_Pagar_Cab = ' + DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text);
        QExecSQL.ExecSQL;

        QExecSQL.Close;
        QExecSQL.SQL.Clear;
        QExecSQL.SQL.Add('UPDATE TB_CONTA_PAGAR_MOV SET VAL_MOVIMENTO = ' + Bib.TrocaVirgulaPorPonto(FloatToStr(wVlOriginal))) ;
        QExecSQL.SQL.Add(' WHERE Cod_Conta_Pagar_Cab = ' + DMContasPagar.QContasPagar_CabCod_Conta_Pagar_Cab.Text);
        QExecSQL.SQL.Add(' And Ind_Tipo_Movimento = ' + QuotedStr('PRINCIPAL'));
        QExecSQL.ExecSQL;


        DMOracle.DBCemapa.Commit;
        DMContasPagar.QContasPagar_Cab.Refresh;
      except
        DMOracle.DBCemapa.Rollback;
        raise Exception.Create('Valor não foi atualizado');
      end;
    end;
end;

procedure TFContasPagarCad.LanarParcelamento1Click(Sender: TObject);
begin
  inherited;
  if FLancaParcelamento = nil then
    FLancaParcelamento := TFLancaParcelamento.Create(Application);
  FLancaParcelamento.ShowModal;

end;

procedure TFContasPagarCad.SpeedButton1Click(Sender: TObject);
var
  wObs, wComando: string;
begin
  inherited;
  if InputQuery('Alteração', 'Observação', wObs) then
  begin
    with DMOracle do
    begin
      QExecSQL.Close;
      QExecSQL.SQL.Clear;
      wComando := 'UPDATE TB_CONTA_PAGAR_CAB SET DESC_OBSERVACAO=' + Chr(39) +
        wObs + Chr(39);
      wComando := wComando + ' WHERE COD_CONTA_PAGAR_CAB = ' +
        FloatToStr(DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value);
      QExecSQL.SQL.Add(wComando);
      QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
      SBRefresh.Click;
    end;
  end;
end;

procedure TFContasPagarCad.ContasporCentrodeCusto1Click(Sender: TObject);
var
 DataInicial, DataFinal: string;
begin
  inherited;
    //relatório de custos de produção solicitado pela pedreira itatiba - Junior(Cemapa) - Cleber 07/07/2020

    if FContasPagarParam = nil then
      FContasPagarParam := TFContasPagarParam.Create(Application);
      FContasPagarParam.PGRelatorio.Pages[18].TabVisible := True;
    if FContasPagarParam.ShowModal = MrOk then
    begin
      with DmContasPagarRel, FContasPagarParam do
      begin
        QrCustosProducao.Close;

        if (trim(FmFilial17.MeFilial.Text) = '') then
          QrCustosProducao.SetVariable('COD_FILIAL', Null)
        else
          QrCustosProducao.SetVariable('COD_FILIAL', trim(FmFilial17.MeFilial.Text));

        if (trim(MeDtIniRef17.Text) = '') or (trim(MeDtFinRef17.Text) = '') then
          raise Exception.Create('Deve ser informado um período de referência!')
        else
        begin
             QrCustosProducao.SetVariable('DATA_INI', StrToDate(trim(MeDtIniRef17.Text)));
             QrCustosProducao.SetVariable('DATA_FIN', StrToDate(trim(MeDtFinRef17.Text)));
        end;

        QrCustosProducao.Open;

        if FrCustoProducao_CentroCusto = nil then
          FrCustoProducao_CentroCusto := TFRCustoProducao_CentroCusto.Create(Application);

        FRCustoProducao_CentroCusto.QRLabel5.Caption := 'Período: '
                                                        + trim(MeDtIniRef17.Text)
                                                        + ' até ' 
                                                        + trim(MeDtFinRef17.Text);

        if RGPreview.ItemIndex = 0 then
          FrCustoProducao_CentroCusto.QRPrimario.Preview
        else
          FrCustoProducao_CentroCusto.QRPrimario.Print;

          QrCustosProducao.Close;

      end;
  end;
end;

procedure TFContasPagarCad.BtCopiaClick(Sender: TObject);
begin
  inherited;
//Solicitado pela Espindola para que ao duplicar um titulo o valor venha zero. Alex - 28/12/2022
  if (DMParamSistema.CodEmpresa = 'ESPINDOLA') then
  begin
    DBEValorTitulo.Text := '0';
    DBEdit11.Text := DBEValorTitulo.Text;
  end;
  DMContasPagar.QContasPagar_CabDT_BAIXA.Clear;
end;

procedure TFContasPagarCad.DBEdit6Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit6.Text);
end;

procedure TFContasPagarCad.BitBtn1Click(Sender: TObject);
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
  NomeArquivo := PastaTemp + '\' + DSContaPagarDocumento.DataSet.FieldByName('NOME_ARQUIVO').AsString;
  Stream := DSContaPagarDocumento.DataSet.CreateBlobStream(DSContaPagarDocumento.DataSet.FieldByName('ARQUIVO'), bmRead);
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

procedure TFContasPagarCad.BitBtn4Click(Sender: TObject);
begin
  inherited;
  DMContasPagar.QContaPagarDocumento.Delete;
end;

procedure TFContasPagarCad.BitBtn3Click(Sender: TObject);
var
  Stream : TStream;
  FileStream : TFileStream;
  wNomeArquivo : String;
  wPosicaoBarra : Integer;
begin
  inherited;
  DMContasPagar.QContaPagarDocumento.Insert;
  Stream := DMContasPagar.QContaPagarDocumento.CreateBlobStream(DMContasPagar.QContaPagarDocumentoARQUIVO, bmWrite);
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
    DMContasPagar.QContaPagarDocumentoNOME_ARQUIVO.AsString := wNomeArquivo;
    DMContasPagar.QContaPagarDocumentoDESCRICAO.AsString := MeArquivo.Text;
    DMContasPagar.QContaPagarDocumentoDT_INCLUSAO.AsDateTime := Now;
    DMContasPagar.QContaPagarDocumentoCOD_CONTA_PAGAR_CAB.Value := DMContasPagar.QContasPagar_CabCOD_CONTA_PAGAR_CAB.Value;

    DMContasPagar.QContaPagarDocumento.Post;
    MessageDlg('Arquivo inserido com sucesso' ,
      MtError, [mbOK], 0);
  finally
    Stream.Free;
  end;
end;

procedure TFContasPagarCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If OpenDialog.Execute Then
    MeArquivo.Text := OpenDialog.FileName;
end;

procedure TFContasPagarCad.DBEdit2Exit(Sender: TObject);
var
  wSituacaoDpto: string;
begin
  inherited;
  wSituacaoDpto := DMOracle.FastSelect('IND_SITUACAO','TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(FContasPagarCad.DBEdit2.Text));
  if wSituacaoDpto <> 'A' then
  begin
    FContasPagarCad.DBEdit2.SetFocus;
    raise exception.Create('ATENÇÃO - Este departamento não esta ativo. Favor Verificar!');
  end;
end;

end.

